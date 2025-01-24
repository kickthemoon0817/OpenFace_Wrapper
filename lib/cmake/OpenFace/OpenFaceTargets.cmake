# Generated by CMake

if("${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}" LESS 2.8)
   message(FATAL_ERROR "CMake >= 2.8.3 required")
endif()
if(CMAKE_VERSION VERSION_LESS "2.8.3")
   message(FATAL_ERROR "CMake >= 2.8.3 required")
endif()
cmake_policy(PUSH)
cmake_policy(VERSION 2.8.3...3.29)
#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Protect against multiple inclusion, which would fail when already imported targets are added once more.
set(_cmake_targets_defined "")
set(_cmake_targets_not_defined "")
set(_cmake_expected_targets "")
foreach(_cmake_expected_target IN ITEMS OpenFace::LandmarkDetector OpenFace::FaceAnalyser OpenFace::GazeAnalyser OpenFace::Utilities)
  list(APPEND _cmake_expected_targets "${_cmake_expected_target}")
  if(TARGET "${_cmake_expected_target}")
    list(APPEND _cmake_targets_defined "${_cmake_expected_target}")
  else()
    list(APPEND _cmake_targets_not_defined "${_cmake_expected_target}")
  endif()
endforeach()
unset(_cmake_expected_target)
if(_cmake_targets_defined STREQUAL _cmake_expected_targets)
  unset(_cmake_targets_defined)
  unset(_cmake_targets_not_defined)
  unset(_cmake_expected_targets)
  unset(CMAKE_IMPORT_FILE_VERSION)
  cmake_policy(POP)
  return()
endif()
if(NOT _cmake_targets_defined STREQUAL "")
  string(REPLACE ";" ", " _cmake_targets_defined_text "${_cmake_targets_defined}")
  string(REPLACE ";" ", " _cmake_targets_not_defined_text "${_cmake_targets_not_defined}")
  message(FATAL_ERROR "Some (but not all) targets in this export set were already defined.\nTargets Defined: ${_cmake_targets_defined_text}\nTargets not yet defined: ${_cmake_targets_not_defined_text}\n")
endif()
unset(_cmake_targets_defined)
unset(_cmake_targets_not_defined)
unset(_cmake_expected_targets)


# Create imported target OpenFace::LandmarkDetector
add_library(OpenFace::LandmarkDetector STATIC IMPORTED)

set_target_properties(OpenFace::LandmarkDetector PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/LandmarkDetector/include;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/LandmarkDetector/include;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/OpenCV/include;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/dlib/include;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/boost/include/boost;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/boost/include/boost"
  INTERFACE_LINK_LIBRARIES "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/OpenCV/x64/v141/lib/Release/opencv_world410.lib;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/OpenBLAS/lib/x64/openblas.lib;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/dlib/lib/x64/v140/Release/dlib.lib;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/boost/x64/boost_system-vc143-mt-x64-1_87.lib;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/boost/x64/boost_filesystem-vc143-mt-x64-1_87.lib"
)

# Create imported target OpenFace::FaceAnalyser
add_library(OpenFace::FaceAnalyser STATIC IMPORTED)

set_target_properties(OpenFace::FaceAnalyser PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/FaceAnalyser/include;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/OpenCV/include;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/dlib/include;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/boost/include/boost;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/boost/include/boost"
  INTERFACE_LINK_LIBRARIES "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/OpenCV/x64/v141/lib/Release/opencv_world410.lib;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/OpenBLAS/lib/x64/openblas.lib;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/dlib/lib/x64/v140/Release/dlib.lib;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/boost/x64/boost_system-vc143-mt-x64-1_87.lib;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/boost/x64/boost_filesystem-vc143-mt-x64-1_87.lib"
)

# Create imported target OpenFace::GazeAnalyser
add_library(OpenFace::GazeAnalyser STATIC IMPORTED)

set_target_properties(OpenFace::GazeAnalyser PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/GazeAnalyser/include;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/OpenCV/include;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/OpenCV/include;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/dlib/include;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/boost/include/boost"
  INTERFACE_LINK_LIBRARIES "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/OpenCV/x64/v141/lib/Release/opencv_world410.lib;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/OpenBLAS/lib/x64/openblas.lib;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/dlib/lib/x64/v140/Release/dlib.lib"
)

# Create imported target OpenFace::Utilities
add_library(OpenFace::Utilities STATIC IMPORTED)

set_target_properties(OpenFace::Utilities PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/Utilities/include;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/Utilities/include;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/OpenCV/include;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/dlib/include;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/boost/include/boost;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/boost/include/boost"
  INTERFACE_LINK_LIBRARIES "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/OpenCV/x64/v141/lib/Release/opencv_world410.lib;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/dlib/lib/x64/v140/Release/dlib.lib;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/boost/x64/boost_system-vc143-mt-x64-1_87.lib;D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/3rdParty/boost/x64/boost_filesystem-vc143-mt-x64-1_87.lib"
)

# Import target "OpenFace::LandmarkDetector" for configuration "Debug"
set_property(TARGET OpenFace::LandmarkDetector APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(OpenFace::LandmarkDetector PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/LandmarkDetector/Debug/LandmarkDetector.lib"
  )

# Import target "OpenFace::FaceAnalyser" for configuration "Debug"
set_property(TARGET OpenFace::FaceAnalyser APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(OpenFace::FaceAnalyser PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/FaceAnalyser/Debug/FaceAnalyser.lib"
  )

# Import target "OpenFace::GazeAnalyser" for configuration "Debug"
set_property(TARGET OpenFace::GazeAnalyser APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(OpenFace::GazeAnalyser PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/GazeAnalyser/Debug/GazeAnalyser.lib"
  )

# Import target "OpenFace::Utilities" for configuration "Debug"
set_property(TARGET OpenFace::Utilities APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(OpenFace::Utilities PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/Utilities/Debug/Utilities.lib"
  )

# Import target "OpenFace::LandmarkDetector" for configuration "Release"
set_property(TARGET OpenFace::LandmarkDetector APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(OpenFace::LandmarkDetector PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/LandmarkDetector/Release/LandmarkDetector.lib"
  )

# Import target "OpenFace::FaceAnalyser" for configuration "Release"
set_property(TARGET OpenFace::FaceAnalyser APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(OpenFace::FaceAnalyser PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/FaceAnalyser/Release/FaceAnalyser.lib"
  )

# Import target "OpenFace::GazeAnalyser" for configuration "Release"
set_property(TARGET OpenFace::GazeAnalyser APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(OpenFace::GazeAnalyser PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/GazeAnalyser/Release/GazeAnalyser.lib"
  )

# Import target "OpenFace::Utilities" for configuration "Release"
set_property(TARGET OpenFace::Utilities APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(OpenFace::Utilities PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/Utilities/Release/Utilities.lib"
  )

# Import target "OpenFace::LandmarkDetector" for configuration "MinSizeRel"
set_property(TARGET OpenFace::LandmarkDetector APPEND PROPERTY IMPORTED_CONFIGURATIONS MINSIZEREL)
set_target_properties(OpenFace::LandmarkDetector PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_MINSIZEREL "CXX"
  IMPORTED_LOCATION_MINSIZEREL "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/LandmarkDetector/MinSizeRel/LandmarkDetector.lib"
  )

# Import target "OpenFace::FaceAnalyser" for configuration "MinSizeRel"
set_property(TARGET OpenFace::FaceAnalyser APPEND PROPERTY IMPORTED_CONFIGURATIONS MINSIZEREL)
set_target_properties(OpenFace::FaceAnalyser PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_MINSIZEREL "CXX"
  IMPORTED_LOCATION_MINSIZEREL "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/FaceAnalyser/MinSizeRel/FaceAnalyser.lib"
  )

# Import target "OpenFace::GazeAnalyser" for configuration "MinSizeRel"
set_property(TARGET OpenFace::GazeAnalyser APPEND PROPERTY IMPORTED_CONFIGURATIONS MINSIZEREL)
set_target_properties(OpenFace::GazeAnalyser PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_MINSIZEREL "CXX"
  IMPORTED_LOCATION_MINSIZEREL "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/GazeAnalyser/MinSizeRel/GazeAnalyser.lib"
  )

# Import target "OpenFace::Utilities" for configuration "MinSizeRel"
set_property(TARGET OpenFace::Utilities APPEND PROPERTY IMPORTED_CONFIGURATIONS MINSIZEREL)
set_target_properties(OpenFace::Utilities PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_MINSIZEREL "CXX"
  IMPORTED_LOCATION_MINSIZEREL "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/Utilities/MinSizeRel/Utilities.lib"
  )

# Import target "OpenFace::LandmarkDetector" for configuration "RelWithDebInfo"
set_property(TARGET OpenFace::LandmarkDetector APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(OpenFace::LandmarkDetector PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELWITHDEBINFO "CXX"
  IMPORTED_LOCATION_RELWITHDEBINFO "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/LandmarkDetector/RelWithDebInfo/LandmarkDetector.lib"
  )

# Import target "OpenFace::FaceAnalyser" for configuration "RelWithDebInfo"
set_property(TARGET OpenFace::FaceAnalyser APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(OpenFace::FaceAnalyser PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELWITHDEBINFO "CXX"
  IMPORTED_LOCATION_RELWITHDEBINFO "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/FaceAnalyser/RelWithDebInfo/FaceAnalyser.lib"
  )

# Import target "OpenFace::GazeAnalyser" for configuration "RelWithDebInfo"
set_property(TARGET OpenFace::GazeAnalyser APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(OpenFace::GazeAnalyser PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELWITHDEBINFO "CXX"
  IMPORTED_LOCATION_RELWITHDEBINFO "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/GazeAnalyser/RelWithDebInfo/GazeAnalyser.lib"
  )

# Import target "OpenFace::Utilities" for configuration "RelWithDebInfo"
set_property(TARGET OpenFace::Utilities APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(OpenFace::Utilities PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELWITHDEBINFO "CXX"
  IMPORTED_LOCATION_RELWITHDEBINFO "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/Utilities/RelWithDebInfo/Utilities.lib"
  )

# This file does not depend on other imported targets which have
# been exported from the same project but in a separate export set.

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
cmake_policy(POP)
