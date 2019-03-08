set(TARGET util_tx_test)

add_executable(${TARGET} "")
target_sources(${TARGET}
        PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/src/util_tx_test.c
	${CMAKE_CURRENT_LIST_DIR}/src/base64.c
)

target_include_directories(${TARGET}
	PRIVATE
        ${CMAKE_CURRENT_LIST_DIR}/inc
)

if(PICOGW_FOUND)
target_include_directories(${TARGET}
	PRIVATE
		${PICOGW_INCLUDE_DIRS}
)

target_link_libraries(${TARGET}
	PRIVATE
		${PICOGW_LINK_LIBRARIES}
)

elseif(picogw_FOUND)

target_link_libraries(${TARGET}
	PRIVATE
		Semtech::picogw
)
endif()

set_target_properties(${TARGET} PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin
)

# add the install targets
install (
	TARGETS ${TARGET}
  	LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT shlib
	ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
	RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
