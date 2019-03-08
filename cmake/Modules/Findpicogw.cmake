# Find picogw
#
# Find the picogw includes and library
#
# if you need to add a custom library search path, do it via CMAKE_PREFIX_PATH
#
# This module defines
#  PICOGW_INCLUDE_DIRS, where to find header, etc.
#  PICOGW_LIBRARIES, the libraries needed to use picogw.
#  PICOGW_LINK_LIBRARIES, the libraries needed to use picogw.
#  PICOGW_FOUND, If false, do not try to use picogw.

# only look in default directories
find_path(
	PICOGW_INCLUDE_DIR
	NAMES loragw_hal.h # only one of those head files
	PATH_SUFFIXES "libpicogw"
	DOC "picogw include dir"
)

find_library(
	PICOGW_LIBRARY
	NAMES picogw libpicogw
	DOC "picogw library"
)

set(PICOGW_INCLUDE_DIRS ${PICOGW_INCLUDE_DIR})
set(PICOGW_LIBRARIES ${PICOGW_LIBRARY})
set(PICOGW_LINK_LIBRARIES ${PICOGW_LIBRARY})

# handle the QUIETLY and REQUIRED arguments and set USATCK_FOUND to TRUE
# if all listed variables are TRUE, hide their existence from configuration view
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(picogw DEFAULT_MSG
        PICOGW_LIBRARY PICOGW_INCLUDE_DIR )
mark_as_advanced (PICOGW_INCLUDE_DIR PICOGW_LIBRARY)
