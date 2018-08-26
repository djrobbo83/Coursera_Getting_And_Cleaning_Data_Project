## Getting And Cleaning Data Course Project
**This README File contains instructions for running the R script run_analysis.R in this repo
   and a description of what transformations the script carries out on the data**

### Instructions
1. Open the R script run_analysis.R in your R session
1. If you don't have the following packakges then in lines 15 and 16 of the script remove the hashtags at the start of the row and run the section:
   1. dplyr
   1. data.table
1. In line 25 set your working directory. This is where:
   1. The zipped data set https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip will be downloaded to and unzipped into
   1. The final tidy data set "Tidy_Data.txt" will be saved to

**NOTE: You do not need to download and unzip the data in the link above, section 0 of the script will do this for you. However if you have already downloaded the data to your working directory and its sitting in a folder "UCI HAR Dataset" then you can skip running section 0.**

### Actions Performed by the script run_analysis.R
1. 
