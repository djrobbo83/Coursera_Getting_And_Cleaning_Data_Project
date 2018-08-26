## Getting And Cleaning Data Course Project
**This README File contains instructions for running the R script run_analysis.R in this repo
   and a description of what transformations the script carries out on the data**

### Summary
The repository contains the following files:
* README.md: This file. Provides instructions for how to run R script and an overview of how the script operates
* Tidy_Data.txt: The final, cleaned and summarised data created by following the steps in the project outline
* CodeBook.md : The code book for the final tidied data set "Tidy_Data.txt"
* run_analysis.R : R script, instructions for running and overview of actions below

### Instructions For running run_analysis.R
1. Open the R script run_analysis.R in your R session
1. If you don't have the following packakges then in lines 15 and 16 of the script remove the hashtags at the start of the row and run the section:
   1. dplyr
   1. data.table
1. In line 25 set your working directory. This is where:
   1. The zipped data set https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip will be downloaded to and unzipped into
   1. The final tidy data set "Tidy_Data.txt" will be saved to

**NOTE: You do not need to download and unzip the data in the link above, section 0 of the script will do this for you. However if you have already downloaded the data to your working directory and its sitting in a folder "UCI HAR Dataset" then you can skip running section 0.**

### Actions Performed by the script run_analysis.R
* Section -1 calls the libraries required in the remainder of the script
* Section 0: 
   * Sets working directory
   * Downloads .zip file from data source provided in course project instructions (Link included in Instructions section above)
   * Checks if file has already been downloaded and unzipped; else unzips folder
* Section 1:
   * Reads in the following text files in the folder and subfolders downloaded in previous steps:
     
     sub folder "train":
      * subject_train.txt
      * X_train.txt
      * y_train.txt
     
     sub folder "test":
      * subject_test.txt
      * X_test.txt
      * y_test.txt
     
     folder "UCI HAR Dataset":
      * activity_labels.txt
      * features.txt
   * Merges Test and Train datasets for for subjects and activites; then merges these files to create the main dataset
   * Applies feature names to dataset using import "*features.txt*" to make interpretationa and manipulation easier
* Section 2:
   * Extracts only column names with headings including the strings mean() or std()
* Section 3:
   * Uses the "*activity_labels.txt*" file to convert activity numbers to more interpretable text format
* Section 4:
   * Renames the variables in the data
   * This mainly relies on *gsub()* function to find and replace text strings
   * This is for both interpretability and aesthetics
* Section 5:
   * Takes the dataset and summarises so that for each Subject and Activity type in the analysis the mean value is returned
   * This uses functions from *dplyr* to group, summarise and order the data in a clean format
   * Finally the cleaned and tidy data is exported to a .txt file in the working directory
   * This .txt file "Tidy_Data.txt" has been uploaded to this GitHub repository
      
      
