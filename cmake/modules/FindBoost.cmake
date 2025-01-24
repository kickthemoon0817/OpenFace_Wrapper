# [WID]
# Added a boost only with filesystem and system at the ./lib/3rdPary/boost

if(CMAKE_SIZEOF_VOID_P EQUAL 8) # 64-bit
    set(Boost_ARCH "x64")
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4) # 32-bit
    set(Boost_ARCH "x32")
else()
    message(FATAL_ERROR "Unsupported architecture detected.")
endif()


set(Boost_ROOT "${CMAKE_SOURCE_DIR}/lib/3rdParty/boost")

set(Boost_INCLUDE_SEARCH_PATHS "${Boost_ROOT}/include/boost")

set(Boost_LIB_SEARCH_PATHS "${Boost_ROOT}/${Boost_ARCH}")


find_path(Boost_INCLUDE_DIRS
    NAMES system.hpp filesystem.hpp
    PATHS ${Boost_INCLUDE_SEARCH_PATHS}
    NO_DEFAULT_PATH
)

find_library(Boost_LIB_SYSTEM
    NAMES boost_system-vc143-mt-${Boost_ARCH}-1_87
    PATHS ${Boost_LIB_SEARCH_PATHS}
    NO_DEFAULT_PATH
)

find_library(Boost_LIB_FILESYSTEM
    NAMES boost_filesystem-vc143-mt-${Boost_ARCH}-1_87
    PATHS ${Boost_LIB_SEARCH_PATHS}
    NO_DEFAULT_PATH
)


# Collect Boost libraries and directories
get_filename_component(Boost_LINK_DIRECTORY_SYSTEM ${Boost_LIB_SYSTEM} DIRECTORY)
get_filename_component(Boost_LINK_DIRECTORY_FILESYSTEM ${Boost_LIB_FILESYSTEM} DIRECTORY)

set(Boost_LIBRARY_DIRS
    ${Boost_LINK_DIRECTORY_SYSTEM}
    ${Boost_LINK_DIRECTORY_FILESYSTEM}
)

list(REMOVE_DUPLICATES Boost_LIBRARY_DIRS)

set(Boost_LIBRARIES
    ${Boost_LIB_SYSTEM}
    ${Boost_LIB_FILESYSTEM}
)


if(NOT Boost_INCLUDE_DIRS)
    message(STATUS "Could not find Boost include.")
endif()

if(NOT Boost_LIBRARIES)
    message(STATUS "Could not find Boost lib.")
endif()

if(Boost_INCLUDE_DIRS AND Boost_LIBRARIES)
    set(Boost_FOUND ON)
    message(STATUS "Boost found successfully.")
else()
    set(Boost_FOUND OFF)
    message(FATAL_ERROR "Could not find Boost.")
endif()

# Export
mark_as_advanced(
    Boost_INCLUDE_DIRS
    Boost_LIBRARIES
    Boost_LIBRARY_DIRS
)
