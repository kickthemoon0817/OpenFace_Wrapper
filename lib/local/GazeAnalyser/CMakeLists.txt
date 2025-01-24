# LandmarkDetector library
include_directories(../../local/LandmarkDetector/include)

# Utilities library
include_directories(../../local/Utilities/include)

SET(SOURCE
    src/GazeEstimation.cpp
)

SET(HEADERS
    include/GazeEstimation.h
)

add_library(GazeAnalyser ${SOURCE} ${HEADERS})
add_library(OpenFace::GazeAnalyser ALIAS GazeAnalyser)

target_include_directories(GazeAnalyser PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include/OpenFace>
)

target_include_directories(GazeAnalyser PUBLIC
    $<BUILD_INTERFACE:${OpenCV_INCLUDE_DIRS}>
    $<INSTALL_INTERFACE:include/OpenFace>
    $<BUILD_INTERFACE:${OpenCV_INCLUDE_DIRS}>
    $<BUILD_INTERFACE:${DLIB_INCLUDE_DIRS}>
    $<BUILD_INTERFACE:${Boost_INCLUDE_DIRS}>
)

target_link_libraries(GazeAnalyser PUBLIC 
    ${OpenCV_LIBRARIES}
    ${OpenBLAS_LIB}
    ${DLIB_LIBRARIES} # [WID] Directly link dlib
)

target_include_directories(GazeAnalyser PRIVATE ${OpenBLAS_INCLUDE_DIR})

install(TARGETS GazeAnalyser EXPORT OpenFaceTargets LIBRARY DESTINATION lib ARCHIVE DESTINATION lib)
install(FILES ${HEADERS} DESTINATION include/OpenFace)
