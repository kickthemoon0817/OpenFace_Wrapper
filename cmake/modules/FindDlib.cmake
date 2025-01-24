# [WID]
# I am newbie to C++ and cmake, and questioned about why
# no Finddlib, maybe famous library?

# [WID]
# Custom Finddlib.cmake file for locating Dlib in specific directories.

if(CMAKE_SIZEOF_VOID_P EQUAL 8) # 64-bit
    set(DLIB_ARCH "x64")
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4) # 32-bit
    set(DLIB_ARCH "x86")
else()
    message(FATAL_ERROR "Unsupported architecture detected.")
endif()


set(DLIB_INCLUDE_SEARCH_PATHS
    ${CMAKE_SOURCE_DIR}/lib/3rdParty/dlib/include
)

set(DLIB_LIB_SEARCH_PATHS
    ${CMAKE_SOURCE_DIR}/lib/3rdParty/dlib/lib/${DLIB_ARCH}/v140/Release
)


find_path(DLIB_INCLUDE_DIR
    NAMES dlib/algs.h
    PATHS ${DLIB_INCLUDE_SEARCH_PATHS}
    NO_DEFAULT_PATH
)

find_path(DLIB_LIBRARIES_DIRS
    Name dlib dlib.lib libdlib
    PATHS ${DLIB_LIB_SEARCH_PATHS}
    NO_DEFAULT_PATH
)

find_library(DLIB_LIB
    NAMES dlib dlib.lib libdlib
    PATHS ${DLIB_LIB_SEARCH_PATHS}
    NO_DEFAULT_PATH
)


set(DLIB_INCLUDE_DIRS
    ${DLIB_INCLUDE_DIR}
)

set(DLIB_LIBRARIES
    ${DLIB_LIB}
)


SET(dlib_FOUND ON)
SET(dlib_INCLUDE_FOUND ON)

if(NOT DLIB_INCLUDE_DIRS)
    SET(dlib_FOUND OFF)
    message(STATUS "Could not find dlib include.")
endif()

if(NOT DLIB_LIBRARIES)
    SET(dlib_FOUND OFF) 
    message(STATUS "Could not find dlib libs.")
endif()

if(DLIB_INCLUDE_DIRS AND DLIB_LIBRARIES)
    set(dlib_FOUND ON)
    message(STATUS "Dlib found successfully.")
else()
    set(dlib_FOUND OFF)
    message(FATAL_ERROR "Could not find Dlib.")
endif()

# Export variables
mark_as_advanced(
    dlib_FOUND
    DLIB_INCLUDE_DIRS
    DLIB_LIBRARIES
    DLIB_LIBRARIES_DIRS
)
