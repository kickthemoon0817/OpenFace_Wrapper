# Install script for directory: D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/LandmarkDetector

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/OpenFace")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/LandmarkDetector/Debug/LandmarkDetector.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/LandmarkDetector/Release/LandmarkDetector.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/LandmarkDetector/MinSizeRel/LandmarkDetector.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/LandmarkDetector/RelWithDebInfo/LandmarkDetector.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/OpenFace" TYPE FILE FILES
    "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/LandmarkDetector/include/CCNF_patch_expert.h"
    "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/LandmarkDetector/include/CEN_patch_expert.h"
    "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/LandmarkDetector/include/CNN_utils.h"
    "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/LandmarkDetector/include/FaceDetectorMTCNN.h"
    "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/LandmarkDetector/include/LandmarkCoreIncludes.h"
    "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/LandmarkDetector/include/LandmarkDetectionValidator.h"
    "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/LandmarkDetector/include/LandmarkDetectorFunc.h"
    "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/LandmarkDetector/include/LandmarkDetectorModel.h"
    "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/LandmarkDetector/include/LandmarkDetectorParameters.h"
    "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/LandmarkDetector/include/LandmarkDetectorUtils.h"
    "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/LandmarkDetector/include/Patch_experts.h"
    "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/LandmarkDetector/include/PAW.h"
    "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/LandmarkDetector/include/PDM.h"
    "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/LandmarkDetector/include/SVR_patch_expert.h"
    "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/LandmarkDetector/include/stdafx.h"
    )
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/Python ML/Extern/Metaverse Signage/ex/openface_source/OpenFace_Wrapper/lib/local/LandmarkDetector/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
