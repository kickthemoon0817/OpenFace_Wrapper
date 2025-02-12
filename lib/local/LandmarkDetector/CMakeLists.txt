
#Utilities library
include_directories(../../local/Utilities/include)

SET(SOURCE
    src/CCNF_patch_expert.cpp
	src/CEN_patch_expert.cpp
	src/CNN_utils.cpp
	src/FaceDetectorMTCNN.cpp
	src/LandmarkDetectionValidator.cpp
    src/LandmarkDetectorFunc.cpp
	src/LandmarkDetectorModel.cpp
    src/LandmarkDetectorUtils.cpp
	src/LandmarkDetectorParameters.cpp
	src/Patch_experts.cpp
	src/PAW.cpp
    src/PDM.cpp
	src/SVR_patch_expert.cpp
	src/stdafx.cpp
)

SET(HEADERS
    include/CCNF_patch_expert.h	
	include/CEN_patch_expert.h
    include/CNN_utils.h
	include/FaceDetectorMTCNN.h
    include/LandmarkCoreIncludes.h
	include/LandmarkDetectionValidator.h
    include/LandmarkDetectorFunc.h
	include/LandmarkDetectorModel.h
	include/LandmarkDetectorParameters.h
	include/LandmarkDetectorUtils.h
	include/Patch_experts.h	
    include/PAW.h
	include/PDM.h
	include/SVR_patch_expert.h		
	include/stdafx.h
)

add_library( LandmarkDetector ${SOURCE} ${HEADERS} )
add_library( OpenFace::LandmarkDetector ALIAS LandmarkDetector)

target_include_directories(LandmarkDetector PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include/OpenFace>)

target_include_directories(LandmarkDetector PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include/OpenFace>
    $<BUILD_INTERFACE:${OpenCV_INCLUDE_DIRS}>
    $<BUILD_INTERFACE:${DLIB_INCLUDE_DIRS}>
	$<BUILD_INTERFACE:${Boost_INCLUDE_DIRS}>
)

target_link_libraries(LandmarkDetector PUBLIC 
	${OpenCV_LIBRARIES}
	${OpenBLAS_LIB}
	${DLIB_LIBRARIES}							# [WID] Directly link dlib
)

if(${Boost_FOUND})
	target_include_directories(LandmarkDetector PUBLIC
		$<BUILD_INTERFACE:${Boost_INCLUDE_DIRS}>
	)
	target_link_libraries(LandmarkDetector PUBLIC ${Boost_LIBRARIES})
else()
	target_link_libraries(LandmarkDetector PUBLIC stdc++fs)
endif()

target_include_directories(LandmarkDetector PRIVATE ${OpenBLAS_INCLUDE_DIR})

install (TARGETS LandmarkDetector EXPORT OpenFaceTargets LIBRARY DESTINATION lib ARCHIVE DESTINATION lib)
install (FILES ${HEADERS} DESTINATION include/OpenFace)