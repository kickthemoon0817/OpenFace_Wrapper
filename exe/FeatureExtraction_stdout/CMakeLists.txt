# Local libraries
include_directories(${LandmarkDetector_SOURCE_DIR}/include)

# # Define FeatureExtraction_stdout as a SHARED library
# add_library(FeatureExtraction_stdout SHARED
#     FeatureExtraction_stdout.cpp
# )

add_executable(FeatureExtraction_stdout FeatureExtraction_stdout.cpp)
target_link_libraries(FeatureExtraction_stdout LandmarkDetector)
target_link_libraries(FeatureExtraction_stdout GazeAnalyser)
target_link_libraries(FeatureExtraction_stdout Utilities)

install (TARGETS FeatureExtraction_stdout DESTINATION bin)