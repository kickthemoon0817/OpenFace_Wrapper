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
#include <RecorderOpenFace.h> 

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

        Utilities::RecorderOpenFaceParameters recording_params(arguments, true, sequence_reader.IsWebcam(),
            sequence_reader.fx, sequence_reader.fy, sequence_reader.cx, sequence_reader.cy, sequence_reader.fps);
        if (!face_model.eye_model)
        {
            recording_params.setOutputGaze(false);
        }
        Utilities::RecorderOpenFace open_face_rec(sequence_reader.name, recording_params, arguments);

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

            // Store Observations in OpenFace Recorder
            open_face_rec.SetObservationFrameNumber(sequence_reader.GetFrameNumber());
            open_face_rec.SetObservationTimestamp(sequence_reader.time_stamp);
            open_face_rec.SetObservationPose(LandmarkDetector::GetPose(face_model, sequence_reader.fx, sequence_reader.fy, sequence_reader.cx, sequence_reader.cy));
            open_face_rec.SetObservationGaze(gazeDirection0, gazeDirection1, gazeAngle,
                LandmarkDetector::CalculateAllEyeLandmarks(face_model),
                LandmarkDetector::Calculate3DEyeLandmarks(face_model, sequence_reader.fx, sequence_reader.fy, sequence_reader.cx, sequence_reader.cy));

            open_face_rec.SetObservationLandmarks(face_model.detected_landmarks, face_model.GetShape(sequence_reader.fx, sequence_reader.fy, sequence_reader.cx, sequence_reader.cy),
                face_model.params_global, face_model.params_local, face_model.detection_certainty, detection_success);

            // JSON Output
            std::ostringstream json_out;
            json_out << "{"
                << "\"frame_number\":" << open_face_rec.GetFrameNumber() << ","
                << "\"timestamp\":" << open_face_rec.GetTimestamp() << ",";

            // Head pose
            cv::Vec6d pose_estimate = open_face_rec.GetPose();
            json_out << "\"head_pose\":[" << pose_estimate[0] << "," << pose_estimate[1] << "," << pose_estimate[2] << ","
                << pose_estimate[3] << "," << pose_estimate[4] << "," << pose_estimate[5] << "],";

            // Gaze
            json_out << "\"gaze_direction_0\":[" << open_face_rec.GetGazeDirection0().x << ","
                << open_face_rec.GetGazeDirection0().y << "," << open_face_rec.GetGazeDirection0().z << "],";

            json_out << "\"gaze_direction_1\":[" << open_face_rec.GetGazeDirection1().x << ","
                << open_face_rec.GetGazeDirection1().y << "," << open_face_rec.GetGazeDirection1().z << "],";

            json_out << "\"gaze_angle\":[" << open_face_rec.GetGazeAngle()[0] << "," << open_face_rec.GetGazeAngle()[1] << "],";

            // Landmarks
            json_out << "\"landmarks\":[";
            cv::Mat_<float> landmarks_2D = open_face_rec.Get2DLandmarks();
            int num_landmarks = landmarks_2D.rows / 2; // Flattened format

            for (int i = 0; i < num_landmarks; ++i)
            {
                json_out << "[" << landmarks_2D(i, 0) << "," << landmarks_2D(i + num_landmarks, 0) << "]";
                if (i < num_landmarks - 1) json_out << ",";
            }
            json_out << "]"; // End of landmarks

            json_out << "}"; // End of JSON object
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
