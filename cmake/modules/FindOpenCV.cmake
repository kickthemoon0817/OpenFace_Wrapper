# [WID]
# I am newbie to C++ and cmake, and questioned about why
# no FindOpenCV.cmake. hmmmmmmmmm

if(CMAKE_SIZEOF_VOID_P EQUAL 8) # 64-bit
    set(OpenCV_ARCH "x64")
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4) # 32-bit
    set(OpenCV_ARCH "x86")
else()
    message(FATAL_ERROR "Unsupported architecture detected.")
endif()

SET(Open_CV_INCLUDE_SEARCH_PATHS
  ${CMAKE_SOURCE_DIR}/lib/3rdParty/OpenCV/include
)

SET(Open_CV_LIB_SEARCH_PATHS
    ${CMAKE_SOURCE_DIR}/lib/3rdParty/OpenCV/${OpenCV_ARCH}/v141/lib/Release
)


find_path(OpenCV_INCLUDE_DIRS
    NAMES opencv2/core.hpp
    PATHS ${Open_CV_INCLUDE_SEARCH_PATHS}
    NO_DEFAULT_PATH
)

find_library(OpenCV_LIB
    NAMES opencv_world410 libopencv_world410
    PATHS ${Open_CV_LIB_SEARCH_PATHS}
    NO_DEFAULT_PATH
)


get_filename_component(OpenCV_LINK_DIRECTORY ${OpenCV_LIB} DIRECTORY)

set(OpenCV_LINK_DIRECTORIES
    ${OpenCV_LINK_DIRECTORY}
)

set(OpenCV_LIBRARIES
    ${OpenCV_LIB}
)


if(NOT OpenCV_INCLUDE_DIRS)
    message(STATUS "Coud not find OpenCV include.")
endif()

if(NOT OpenCV_LIBRARIES)
    message(STATUS "Cound not find OpenCV lib.")
endif()

if(OpenCV_INCLUDE_DIRS AND OpenCV_LIBRARIES)
    set(OpenCV_FOUND ON)
    message(STATUS "OpenCV found successfully.")
else()
    set(OpenCV_FOUND OFF)
    message(FATAL_ERROR "Could not find OpenCV.")
endif()


# Export
mark_as_advanced(
    OpenCV_INCLUDE_DIRS
    OpenCV_LIBRARIES
    OpenCV_LINK_DIRECTORIES
)
