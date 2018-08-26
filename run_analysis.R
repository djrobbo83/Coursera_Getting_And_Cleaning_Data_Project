# GETTING AND CLEANING DATA
# COURSE WEEK 4: PROJECT
# SMARTPHONE DATA
# LINK TO DATA: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# REFER TO "README.txt" FOR DETAILS OR LINK ABOVE FOR DATA SET INFORMATION




#/\/\/\/\/\/\/\/\//\/\/\/\/\//\/\/\/\/\/\/\/\//\/\/\/\/\/\/\//\/\/\/\/\/\/\/\/\//\/\/\/\/\/\/\/\
#   -1. CALL LIBRARIES REQUIRED
#   YOU MAY NEED TO INSTALL THESE LIBRARIES IF YOU HAVE NOT ALREADY DONE SO
#   REMOVE HASHTAGS ON LINE TO INSTALL PACKAGES
#/\/\/\/\/\/\/\/\//\/\/\/\/\//\/\/\/\/\/\/\/\//\/\/\/\/\/\/\//\/\/\/\/\/\/\/\/\//\/\/\/\/\/\/\/\
#install.packages("dplyr")
#install.packages("data.table")
library(dplyr)
library(data.table)

#/\/\/\/\/\/\/\/\//\/\/\/\/\//\/\/\/\/\/\/\/\//\/\/\/\/\/\/\//\/\/\/\/\/\/\/\/\//\/\/\/\/\/\/\/\
#   0. DOWNLOAD, UNZIP DATA TO WORKING DIRECTORY
#/\/\/\/\/\/\/\/\//\/\/\/\/\//\/\/\/\/\/\/\/\//\/\/\/\/\/\/\//\/\/\/\/\/\/\/\/\//\/\/\/\/\/\/\/\

#0.1: SET YOUR WORKING DIRECTORY HERE:
setwd("C:\\Data Science Specialization JHU\\Getting and Cleaning Data\\Week4\\Course_Project")

#0.2: DOWNLOAD ZIPPED DATA; UNZIP
#DESTINATION OF ZIP FILE SPECIFIED IN INSTRUCTIONS
zip_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zip_file <- "UCI HAR Dataset.zip"
#CHECK IF ZIP FILE HAS BEEN DOWNLOADED; IF NOT THEN DOWNLOAD
if(!file.exists(zip_file)){
  download.file(zip_url, zip_file, mode = "wb")
  
}

#CHECK IF ZIP FILE HAS BEEN UNZIPPED; IF NOT THEN UNZIP
data_path <- "UCI HAR Dataset"
if(!file.exists(data_path)){
  unzip(zip_file)
}

#/\/\/\/\/\/\/\/\//\/\/\/\/\//\/\/\/\/\/\/\/\//\/\/\/\/\/\/\//\/\/\/\/\/\/\/\/\//\/\/\/\/\/\/\/\
#   1. Merges the training and the test sets to create one data set.
#   1.1 READ IN REQUIRED DATASETS
#   1.2 MERGE DATASETS
#   1.3 SMALL LEVEL OF RENAMING TO MAKE THINGS EASIER & USE FEATURES.txt TO LABEL MAIN DATA
#   1.4 MERGE DATA TO GET ONE "NEAT" DATASET; CURRENTLY UNFILTERED
#/\/\/\/\/\/\/\/\//\/\/\/\/\//\/\/\/\/\/\/\/\//\/\/\/\/\/\/\//\/\/\/\/\/\/\/\/\//\/\/\/\/\/\/\/\

#1.1 READ IN ALL DATA SETS REQUIRED
#READ 3 TRAINING DATA TEXT FILES
Train_Subjects <- fread(file.path(getwd(), "UCI HAR Dataset\\train\\subject_train.txt"))
Train <- fread(file.path(getwd(), "UCI HAR Dataset\\train\\X_train.txt"))
Train_Activity <- fread(file.path(getwd(), "UCI HAR Dataset\\train\\y_train.txt"))

#READ 3 TEST DATA TEXT FILES
Test_Subjects <- fread(file.path(getwd(), "UCI HAR Dataset\\test\\subject_test.txt"))
Test <- fread(file.path(getwd(), "UCI HAR Dataset\\test\\X_test.txt"))
Test_Activity <- fread(file.path(getwd(), "UCI HAR Dataset\\test\\y_test.txt"))

#READ FEATURES & ACTIVITY LABEL TEXT FILES
Activity_Labels <- fread(file.path(getwd(), "UCI HAR Dataset\\activity_labels.txt"))
Features <- fread(file.path(getwd(), "UCI HAR Dataset\\features.txt"),
                    col.names = c("Feature_Index", "Feature_Names"))
#SEE ACOMMPANYING FEATURES_INFO.txt FOR INFORMATION ON FEATURES

#1.2 MERGE DATASETS
Subjects <- rbind(Train_Subjects, Test_Subjects)
Activity <- rbind(Train_Activity, Test_Activity)
Main_Data <- rbind(Train, Test)

#1.3 RENAMING & ADD LABELS TO MAIN_DATA USING FEATURES READ IN ABOVE
names(Subjects) <- c("Subject_No")
names(Activity) <- c("Activity_No")
names(Main_Data) <- Features$Feature_Names
#str(Main_Data)

#1.4 CREATE ONE DATASET TO CARRY THROUGH; FOR NOW DON'T FILTER USING GREP OR GREPL; DO THIS IN PART 2
All_Data <- cbind(Subjects, Activity, Main_Data)
#str(All_Data)

#/\/\/\/\/\/\/\/\//\/\/\/\/\//\/\/\/\/\/\/\/\//\/\/\/\/\/\/\//\/\/\/\/\/\/\/\/\//\/\/\/\/\/\/\/\
#   2. Extracts only the measurements on the mean and standard deviation for each measurement.
#/\/\/\/\/\/\/\/\//\/\/\/\/\//\/\/\/\/\/\/\/\//\/\/\/\/\/\/\//\/\/\/\/\/\/\/\/\//\/\/\/\/\/\/\/\

#ONLY PULL OUT DATA WITH NAMES WITH MEAN() or STD(); NEED TO USE "\" TO DEAL WITH LITERALS
Select_Features <- Features$Feature_Names[grep("(mean|std)\\(\\)", Features$Feature_Names)]
Select_Features <- c("Subject_No", "Activity_No", Select_Features) #ADD SUBJECT & ACTIVITY NUMBER TO LIST 
Short_Data <- subset(All_Data, select = Select_Features)
#str(Short_Data) CHECK IT

#/\/\/\/\/\/\/\/\//\/\/\/\/\//\/\/\/\/\/\/\/\//\/\/\/\/\/\/\//\/\/\/\/\/\/\/\/\//\/\/\/\/\/\/\/\
#   3. USE DESCRIPTIVE ACTIVITY NAMES TO ACTIVITIES IN THE DATA SET
#/\/\/\/\/\/\/\/\//\/\/\/\/\//\/\/\/\/\/\/\/\//\/\/\/\/\/\/\//\/\/\/\/\/\/\/\/\//\/\/\/\/\/\/\/\
#ALREADY IMPORTED DATA SET Activity_Labels IN STEP 1 WHEN DOING ALL IMPORTS FOR PROJECT
#NO USE ACTIVITY LABELS DATASET TO CONVERT ACTIVITY_NO TO TEXT
Short_Data$Activity_No <- factor(Short_Data$Activity_No,
                                  levels = Activity_Labels$V1,
                                  labels = Activity_Labels$V2)
#RENAME ACTIVITY_NO TO ACTIVITY TYPE AS ITS NO LONGER A NUMBER
Short_Data <- rename(Short_Data, Activity_Type = Activity_No)

#/\/\/\/\/\/\/\/\//\/\/\/\/\//\/\/\/\/\/\/\/\//\/\/\/\/\/\/\//\/\/\/\/\/\/\/\/\//\/\/\/\/\/\/\/\
#   4. APPROPRIATELY LABEL DATA SET WITH DESCRIPTIVE VARIABLE NAMES
#/\/\/\/\/\/\/\/\//\/\/\/\/\//\/\/\/\/\/\/\/\//\/\/\/\/\/\/\//\/\/\/\/\/\/\/\/\//\/\/\/\/\/\/\/\
str(Short_Data)
#NOT REALLY SURE WHAT THIS STEP ENTAILS AS SEEMS EASIER TO JUST LOOK UP THE CODE BOOK;
#BUT GUESS ITS A RENAMING / GSUB EXERCISE
#I PREFER "_" TO SEPARATE WORDS 
#LOOKING AT DATA USING STR :
str(Short_Data)
# t = Time so Replace names which start with t with "Time_"
names(Short_Data)<-gsub("^t", "Time_", names(Short_Data))
# f = Frequency so Replace names which start with f with "Frequency_"
names(Short_Data)<-gsub("^f", "Frequency_", names(Short_Data))
#Acc = Accelerometer | Gyro = Gyroscope
names(Short_Data)<-gsub("Acc", "_Accelerometer_", names(Short_Data))
names(Short_Data)<-gsub("Gyro", "_Gyroscope_", names(Short_Data))
#Jerk = Jerk_ | JerkMag = Jerk_Magnitude_ | Mag = Magnitude_ 
#Also noted some variables have name BodyBody so replace with Body
names(Short_Data)<-gsub("Jerk", "Jerk_", names(Short_Data))
names(Short_Data)<-gsub("Mag", "Magnitude_", names(Short_Data))
names(Short_Data)<-gsub("BodyBody", "Body", names(Short_Data))
#-mean() = Mean_ | -std() = StdDev_ | -X = X | -Y = Y | -Z = Z
names(Short_Data)<-gsub("-mean\\(\\)", "Mean", names(Short_Data))
names(Short_Data)<-gsub("-std\\(\\)", "StdDev", names(Short_Data))
names(Short_Data)<-gsub("-X", "_X", names(Short_Data))
names(Short_Data)<-gsub("-Y", "_Y", names(Short_Data))
names(Short_Data)<-gsub("-Z", "_Z", names(Short_Data))
#FINAL CHECK USING STR  - HAPPY WITH THIS NOW!
str(Short_Data)
#/\/\/\/\/\/\/\/\//\/\/\/\/\//\/\/\/\/\/\/\/\//\/\/\/\/\/\/\//\/\/\/\/\/\/\/\/\//\/\/\/\/\/\/\/\
#   5. CREATE A SECOND, INDEPENDENT TIDY DATASET WITH AVERAGE OF EACH VARIABLE
#      FOR EACH ACTIVITY AND EACH SUBJECT
#      USE group_by() and Summarise_each()
#      COULD PROBABLY USE melt() and dcast()
#      WILL TRY BOTH AND REMOVE ONE FROM CODE!
#      WRITE OUTPUT TO TI
#/\/\/\/\/\/\/\/\//\/\/\/\/\//\/\/\/\/\/\/\/\//\/\/\/\/\/\/\//\/\/\/\/\/\/\/\/\//\/\/\/\/\/\/\/\

Data_Summarised <- Short_Data %>%
    group_by(Subject_No, Activity_Type) %>%
    summarise_each(funs(mean)) %>%
    arrange(Subject_No, Activity_Type)

#Data_melt <- melt(Short_Data, id=c("Subject_No", "Activity_Type"))
#Data_mean <- dcast(Data_melt, Subject_No + Activity_Type ~ variable, mean)[order(Subject_No, Activity_Type)]
#TWO TABLES Data_mean and Data_Summarised ARE IDENTICAL - RESULT! 
#I FIND THE DPLYR METHOD EASIER TO UNDERSTAND SO WILL COMMENT OUT DATA.TABLE APPROACH USING MELT AND DCAST
#OUTPUT; SET ROW.NAMES = FALSE & NO QUOTE; LEAVE SEPARATOR AS DEFAULT AS NOT MENTIONED IN THE PROJECT
write.table(Data_Summarised, "Tidy_Data.txt", row.names = FALSE, quote = FALSE)

