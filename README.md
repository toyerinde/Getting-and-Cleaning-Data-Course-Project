# Getting-and-Cleaning-Data-Course-Project
Peer- Graded assignment for Cousera's JH Getting and Cleaning Data course project 
This repository has all the files submitted to complete the Getting and Cleaning Data Course Project. This README file provides more details on the other files in this repo and how they are all connected. Below is a brief description of the files in this repo.

# Course Project Introduction 
The objective of this project is to gain experience with getting,working and cleaning raw data set with the goal of generating a tidy data set output that could be used for further analysis. The data used for this project were based on experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each volunteer performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using the smartphone embedded accelerometer and gyroscope, measurements of 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured and two datasets (train and test) were generated. This course project required creating a combined data set from the two sets of data set generated during these experiments i.e train and test data set,creating a subset of this combined dataset and from this subset, generating a tidy dataset that contains the averages of the measurements obtained from each volunteer.  

# run_analysis.R
This is the R script that contains the code needed to generate the tidy data set described in the Introduction section. The script is broken into 7 sections and each section is marked with descriptive comments on what is being achieved in the section. Below is a summary of each section.
Section 1: Code in this section sets the working directory and reads in the files needed to create the combined dataset. Reading in the correct files requires understanding how each of the files in the train and test folders were generated. The READ.me file in the raw data set provided the guidance needed.
Section 2 :Code in this section combines the files read in to create the combined data set.
Section 3 : Code in this section extracts only the mean and standard deviation for each measurement and saves the results to a new object to creates a subset of the combined data set.
Section 4 :Code in this section assigns descriptive names to each of the activities in the dataframe created by the code in Section 3.
Section 5 : Code in this section labels each of the variables in the sub-dataset dataframe with descriptive names.
Section 6 : Code in this section creates an independent tidy data set which contains the average of each variable for each activity and each subject in the dataframe.
Section 7: Code in this section saves the tidy data set generated to the working directory.


# CodeBook.md
This is the code book that describes the variables, the data, and any transformations or work that was performed to clean up the raw data. This file contains the mapping between the descriptive names assigned to the dataframes columns and rows generated with the run_analysis.R script and the features names in features.txt  and activity_labels.txt files in the raw dataset.

# tidy_dataset.csv
CSV file containing the tidy data set generated with the run_analysis.R script.
