///////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2017, Carnegie Mellon University and University of Cambridge,
// all rights reserved.
//
// ACADEMIC OR NON-PROFIT ORGANIZATION NONCOMMERCIAL RESEARCH USE ONLY
//
// BY USING OR DOWNLOADING THE SOFTWARE, YOU ARE AGREEING TO THE TERMS OF THIS LICENSE AGREEMENT.  
// IF YOU DO NOT AGREE WITH THESE TERMS, YOU MAY NOT USE OR DOWNLOAD THE SOFTWARE.
//
// License can be found in OpenFace-license.txt

//     * Any publications arising from the use of this software, including but
//       not limited to academic journal and conference publications, technical
//       reports and manuals, must cite at least one of the following works:
//
//       OpenFace 2.0: Facial Behavior Analysis Toolkit
//       Tadas Baltrušaitis, Amir Zadeh, Yao Chong Lim, and Louis-Philippe Morency
//       in IEEE International Conference on Automatic Face and Gesture Recognition, 2018  
//
//       Convolutional experts constrained local model for facial landmark detection.
//       A. Zadeh, T. Baltrušaitis, and Louis-Philippe Morency,
//       in Computer Vision and Pattern Recognition Workshops, 2017.    
//
//       Rendering of Eyes for Eye-Shape Registration and Gaze Estimation
//       Erroll Wood, Tadas Baltrušaitis, Xucong Zhang, Yusuke Sugano, Peter Robinson, and Andreas Bulling 
//       in IEEE International. Conference on Computer Vision (ICCV),  2015 
//
//       Cross-dataset learning and person-specific normalisation for automatic Action Unit detection
//       Tadas Baltrušaitis, Marwa Mahmoud, and Peter Robinson 
//       in Facial Expression Recognition and Analysis Challenge, 
//       IEEE International Conference on Automatic Face and Gesture Recognition, 2015 
//
///////////////////////////////////////////////////////////////////////////////


// Added exe
// FeatureExtraction_stdout.cpp : Defines the entry point for the feature extraction console application,
//								and export the details without saving as csv.

// Local includes
#include "LandmarkCoreIncludes.h" 
#include <GazeEstimation.h> 
#include <SequenceCapture.h> 
#include <VisualizationUtils.h> 

#ifndef CONFIG_DIR
#define CONFIG_DIR "~" 
#endif


#define INFO_STREAM( stream ) \
std::cout << stream << std::endl 

#define WARN_STREAM( stream ) \
std::cout << "Warning: " << stream << std::endl 

#define ERROR_STREAM( stream ) \
std::cout << "Error: " << stream << std::endl 



static void printErrorAndAbort(const std::string & error)
{
    std::cout << error << std::endl;
}

#define FATAL_STREAM( stream ) \
printErrorAndAbort( std::string( "Fatal error: " ) + stream )


std::vector<std::string> get_arguments(int argc, char **argv)
{
    std::vector<std::string> arguments;
    for (int i = 0; i < argc; ++i) 
    {
        arguments.push_back(std::string(argv[i])); 
    }
    return arguments;
}


int main(int argc, char **argv)
{
    std::vector<std::string> arguments = get_arguments(argc, argv);

    if (arguments.size() == 1)
    {
        std::cout << "For command line arguments see:" << std::endl;
        std::cout << " https://github.com/TadasBaltrusaitis/OpenFace/wiki/Command-line-arguments";
        return 0; // Exit program
    }


    LandmarkDetector::FaceModelParameters det_parameters(arguments);
    LandmarkDetector::CLNF face_model(det_parameters.model_location);

    if (!face_model.loaded_successfully)
    {
        std::cout << "ERROR: Could not load the landmark detector" << std::endl;
        return 1; 
    }


    Utilities::SequenceCapture sequence_reader;
    Utilities::FpsTracker fps_tracker;
    fps_tracker.AddFrame();


    while (true)
    {
        if (!sequence_reader.Open(arguments))
            break;

        INFO_STREAM("Device or file opened");


        cv::Mat captured_image = sequence_reader.GetNextFrame();

        INFO_STREAM("Starting tracking");


        while (!captured_image.empty())
        {
            cv::Mat_<uchar> grayscale_image = sequence_reader.GetGrayFrame();


            bool detection_success = LandmarkDetector::DetectLandmarksInVideo(captured_image, face_model, det_parameters, grayscale_image);

            cv::Point3f gazeDirection0(0, 0, 0); 
            cv::Point3f gazeDirection1(0, 0, 0); 
            cv::Vec2d gazeAngle(0, 0);

            if (detection_success && face_model.eye_model)
            {
                GazeAnalysis::EstimateGaze(face_model, gazeDirection0, sequence_reader.fx, sequence_reader.fy, sequence_reader.cx, sequence_reader.cy, true);
                GazeAnalysis::EstimateGaze(face_model, gazeDirection1, sequence_reader.fx, sequence_reader.fy, sequence_reader.cx, sequence_reader.cy, false);
                gazeAngle = GazeAnalysis::GetGazeAngle(gazeDirection0, gazeDirection1);
            }

            
            cv::Vec6d pose_estimate = LandmarkDetector::GetPose(face_model, sequence_reader.fx, sequence_reader.fy, sequence_reader.cx, sequence_reader.cy);


            fps_tracker.AddFrame();


            // Build JSON output for this frame
            // Example structure:
            // {
            //   "frame_number": 12,
            //   "head_pose": [pose0, pose1, pose2, pose3, pose4, pose5],
            //   "gaze_direction_0": [x, y, z],
            //   "gaze_direction_1": [x, y, z],
            //   "gaze_angle": [x, y],
            //   "landmarks": [[lx, ly], [lx, ly], ...]
            // }
            std::ostringstream json_out;
            json_out << "{"
                    << "\"frame_number\":" << sequence_reader.GetFrameNumber() << ",";

            // Head pose: 6 values => (tx, ty, tz, rx, ry, rz)
            json_out << "\"head_pose\":["
                    << pose_estimate[0] << ","
                    << pose_estimate[1] << ","
                    << pose_estimate[2] << ","
                    << pose_estimate[3] << ","
                    << pose_estimate[4] << ","
                    << pose_estimate[5]
                    << "],";

            // Gaze directions
            json_out << "\"gaze_direction_0\":["
                    << gazeDirection0.x << ","
                    << gazeDirection0.y << ","
                    << gazeDirection0.z
                    << "],";

            json_out << "\"gaze_direction_1\":["
                    << gazeDirection1.x << ","
                    << gazeDirection1.y << ","
                    << gazeDirection1.z
                    << "],";

            // Gaze angle
            json_out << "\"gaze_angle\":["
                    << gazeAngle[0] << ","
                    << gazeAngle[1]
                    << "],";

            // Landmarks
            json_out << "\"landmarks\":[";
            if(detection_success)
            {
                for(int i = 0; i < face_model.detected_landmarks.rows; ++i)
                {
                    double x = face_model.detected_landmarks.at<double>(i, 0);
                    double y = face_model.detected_landmarks.at<double>(i, 1);

                    json_out << "[" << x << "," << y << "]";
                    if(i < face_model.detected_landmarks.rows - 1) {
                        json_out << ",";
                    }
                }
            }
            json_out << "]"; // end of landmarks

            json_out << "}"; // end of JSON object

            std::cout << json_out.str() << std::endl;

            captured_image = sequence_reader.GetNextFrame();
        }

        INFO_STREAM("Closing input reader");
        sequence_reader.Close();
        INFO_STREAM("Closed successfully");


        face_model.Reset();
    }

    return 0;
}
