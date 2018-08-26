# Code Book

## Introduction
This .md file contains a summary of all the fields contained in the text file "Tidy_Data.txt", which was created by the R script *run_analysis.R* both contained in this repository

## Data Overview
The file "Tidy_Data.txt" is a space separated text file. The first row of this data contains column names, which have been listed in the variables section below. This summarised and transformed data is based on a dataset contained in http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones containing results from a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. For more information see link

## Variables

### Identifiers
There are two identification variables in the data:
* Subject_No: Takes the value 1-30; relating to each of the 30 volunteers in this experiment
* Activity_Type: Factor with 6 levels, these have been labelled using the .txt file "*activity_labels.txt*" available in the data download
  * WALKING (Level = 1)  
  * WALKING_UPSTAIRS (Level = 2)
  * WALKING_DOWNSTAIRS (Level = 3)
  * SITTING (Level = 4)
  * STANDING (Level = 5)
  * LAYING (Level = 6)
### Measurements
There are 66 measurement variables in the dataset. All measurements are numeric, and are average values based on measurements for mean and standard deviations across each subject for each activity undertaken. These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

#### Time Domain
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals Time_Accelerometer_XYZ and Time_Gyrosope_XYZ. The time domain signals (prefix 'Time_' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (Time_Body_Accelerometer_XYZ and Time_Gravity_Accelerometer_XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
* Time_Body_Accelerometer_Mean_X
* Time_Body_Accelerometer_Mean_Y
* Time_Body_Accelerometer_Mean_Z
* Time_Body_Accelerometer_StdDev_X
* Time_Body_Accelerometer_StdDev_Y
* Time_Body_Accelerometer_StdDev_Z
* Time_Gravity_Accelerometer_Mean_X
* Time_Gravity_Accelerometer_Mean_Y
* Time_Gravity_Accelerometer_Mean_Z
* Time_Gravity_Accelerometer_StdDev_X
* Time_Gravity_Accelerometer_StdDev_Y
* Time_Gravity_Accelerometer_StdDev_Z

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (Time_Body_Accelerometer_Jerk_XYZ and Time_Body_Gyroscope_Jerk_XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (Time_Body_Acceleromter_Magnitude, Time_Gravity_Accelerator_Magnitude, Time_Body_Accelertor_Jerk_Magnitude, Time_Body_Gyroscope_Magnitude, Time_Body_Gyroscope_Jerk_Magnitude). 
* Time_Body_Accelerometer_Jerk_Mean_X
* Time_Body_Accelerometer_Jerk_Mean_Y
* Time_Body_Accelerometer_Jerk_Mean_Z
* Time_Body_Accelerometer_Jerk_StdDev_X
* Time_Body_Accelerometer_Jerk_StdDev_Y
* Time_Body_Accelerometer_Jerk_StdDev_Z
* Time_Body_Gyroscope_Mean_X
* Time_Body_Gyroscope_Mean_Y
* Time_Body_Gyroscope_Mean_Z
* Time_Body_Gyroscope_StdDev_X
* Time_Body_Gyroscope_StdDev_Y
* Time_Body_Gyroscope_StdDev_Z
* Time_Body_Gyroscope_Jerk_Mean_X
* Time_Body_Gyroscope_Jerk_Mean_Y
* Time_Body_Gyroscope_Jerk_Mean_Z
* Time_Body_Gyroscope_Jerk_StdDev_X
* Time_Body_Gyroscope_Jerk_StdDev_Y
* Time_Body_Gyroscope_Jerk_StdDev_Z
* Time_Body_Accelerometer_Magnitude_Mean
* Time_Body_Accelerometer_Magnitude_StdDev
* Time_Gravity_Accelerometer_Magnitude_Mean
* Time_Gravity_Accelerometer_Magnitude_StdDev
* Time_Body_Accelerometer_Jerk_Magnitude_Mean
* Time_Body_Accelerometer_Jerk_Magnitude_StdDev
* Time_Body_Gyroscope_Magnitude_Mean
* Time_Body_Gyroscope_Magnitude_StdDev
* Time_Body_Gyroscope_Jerk_Magnitude_Mean
* Time_Body_Gyroscope_Jerk_Magnitude_StdDev  

#### Frequency Domain
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing Frequency_Body_Accelerometer_XYZ, Freqquency_Body_Accelerometer_Jerk_XYZ, Frequecny_Body_Gyroscope_XYZ, Frequency_Bod_Accelerometer_Jerk_Magnitude, Frequency_Body_Gyroscope_Magnitude, Frequency_Body_Gyroscope_Jerk_Magnitude. (Note the 'f' to indicate frequency domain signals). 
* Frequency_Body_Accelerometer_Mean_X
* Frequency_Body_Accelerometer_Mean_Y
* Frequency_Body_Accelerometer_Mean_Z
* Frequency_Body_Accelerometer_StdDev_X
* Frequency_Body_Accelerometer_StdDev_Y
* Frequency_Body_Accelerometer_StdDev_Z
* Frequency_Body_Accelerometer_Jerk_Mean_X
* Frequency_Body_Accelerometer_Jerk_Mean_Y
* Frequency_Body_Accelerometer_Jerk_Mean_Z
* Frequency_Body_Accelerometer_Jerk_StdDev_X
* Frequency_Body_Accelerometer_Jerk_StdDev_Y
* Frequency_Body_Accelerometer_Jerk_StdDev_Z
* Frequency_Body_Gyroscope_Mean_X  
* Frequency_Body_Gyroscope_Mean_Y    
* Frequency_Body_Gyroscope_Mean_Z    
* Frequency_Body_Gyroscope_StdDev_X
* Frequency_Body_Gyroscope_StdDev_Y
* Frequency_Body_Gyroscope_StdDev_Z
* Frequency_Body_Accelerometer_Magnitude_Mean
* Frequency_Body_Accelerometer_Magnitude_StdDev
* Frequency_Body_Accelerometer_Jerk_Magnitude_Mean 
* Frequency_Body_Accelerometer_Jerk_Magnitude_StdDev
* Frequency_Body_Gyroscope_Magnitude_Mean  
* Frequency_Body_Gyroscope_Magnitude_StdDev
* Frequency_Body_Gyroscope_Jerk_Magnitude_Mean
* Frequency_Body_Gyroscope_Jerk_Magnitude_StdDev

## Transformations
The following transformations we're applied to the raw data contained in the zip file downloaded from the source website. 
* The column in the Subjects text files (*subject..*) were renamed from V1 to Subject_No
* The column in the Activity text files (*y_...*) were renamed from V1 to Activity_No
* All Test and Training data sets were merged to form one dataset containg all information relating to Subjects, Activities and the measurements
* The *features.txt"* file was used to name the measurements columns on the merged dataset
* Only measurements relating to the mean (containing string "mean()") and standard deviation (containing string "std()") where retained
* The "Activity_No" field was labeled using data in the "*activity_labels.txt*" file
* The "Activity_No" field was then renamed to "Activity_Type" for clarity
* A number of renaming operations took place to improve clarity of names and make the variable titles more meaningful:
 * Time Domain measurements, starting with t, had the "t" replaced with "Time_"
 * Frequency Domain measurements, which started with f, has the "f" replaced with "Frequency_" 
 * The Following Strings in the variables were replaced with their counterpart where string to left was | was original and name to left is updated string:
  * "Acc" | "_Accelerometer_"
  * "Gyro" | "_Gryroscope_"
  * "Jerk" | "Jerk_"
  * "Mag" | "Magnitude_"
 * There also appeared to be a typo where some variables had the string "BodyBody" included, this was replaced with "Body"
 * the strings "-mean()" and "-StdDev()" had the () removed
 * -X; -Y; -Z where replaced with _X, _Y, _Z respectively
* The Data was summarised using the following steps, using the dplyr package:
 * Data was grouped by Subject_No and Activity_Type
 * The summary function used was mean
 * Data was sorted by Subject_No and Activity_Type
* The tidied data was output to the working directory. 

