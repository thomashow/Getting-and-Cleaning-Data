---
title: "Getting and Cleaning Data Course Project"
author: "Thomas How"
date: "Sunday, January 25, 2015"
output: html_document
---

# Objective of project
The objective of run_analysis.R program is to perform formatting or cleaning on the data collected from the accelerometers from the Samsung Galaxy S smartphone.  The steps is the program including
1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
3.  Uses descriptive activity names to name the activities in the data set
4.  Appropriately labels the data set with descriptive variable names. 
5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Steps to run program
1.  Download the data file from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
2.  Unzip the file to your working directory.  
    You should then see the folder "UCI HAR Dataset" which consists of subfolders of "test" and "train".  
    There are files in the folder "UCI HAR Dataset" as well as "UCI HAR Dataset/test" and "UCI HAR Dataset/train".
    Those files shall be used as the input to the run_analysis.R.
3.  Put run_analysis.R in your working directory 
4.  Run the command source('./run_analysis.R') which should then load and run the program
5.  Goto working directory and you should find the file "tidyData.txt" 

# Notes and remarks on the program
1.  The steps in the program does not follows the step 1 to 5 as mentioned in the course Peer Assignment details, this is because I find it more efficient to perform some of the later operation first.
2.  The program requires packages plyr and reshape2, if those packages has not been installed, then it shall the the pre-requisite to do so.