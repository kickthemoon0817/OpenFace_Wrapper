#LandmarkDetector library
include_directories(../../local/LandmarkDetector/include)

#Utilities library
include_directories(../../local/Utilities/include)

set(SOURCE
    src/Face_utils.cpp
    src/FaceAnalyser.cpp
    src/FaceAnalyserParameters.cpp
    src/stdafx_fa.cpp
    src/SVM_dynamic_lin.cpp
    src/SVM_static_lin.cpp
    src/SVR_dynamic_lin_regressors.cpp
    src/SVR_static_lin_regressors.cpp
)

set(HEADERS
    include/Face_utils.h
    include/FaceAnalyser.h
    include/FaceAnalyserParameters.h
    include/stdafx_fa.h
    include/SVM_dynamic_lin.h
    include/SVM_static_lin.h
    include/SVR_dynamic_lin_regressors.h
    include/SVR_static_lin_regressors.h
)

add_library(FaceAnalyser ${SOURCE} ${HEADERS})
add_library(OpenFace::FaceAnalyser ALIAS FaceAnalyser)

target_include_directories(FaceAnalyser PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include/OpenFace>
    $<BUILD_INTERFACE:${OpenCV_INCLUDE_DIRS}>
    $<BUILD_INTERFACE:${DLIB_INCLUDE_DIRS}>
    $<BUILD_INTERFACE:${Boost_INCLUDE_DIRS}>
)

target_link_libraries(FaceAnalyser PUBLIC
    ${OpenCV_LIBRARIES}
    ${OpenBLAS_LIB}
    ${DLIB_LIBRARIES} # [WID] Directly link dlib
)

if(${Boost_FOUND})
    target_include_directories(FaceAnalyser PUBLIC
        $<BUILD_INTERFACE:${Boost_INCLUDE_DIRS}>
    )
    target_link_libraries(FaceAnalyser PUBLIC ${Boost_LIBRARIES})
else()
    target_link_libraries(FaceAnalyser PUBLIC stdc++fs)
endif()

install(TARGETS FaceAnalyser EXPORT OpenFaceTargets
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
)

install(FILES ${HEADERS} DESTINATION include/OpenFace)