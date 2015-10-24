# Purpose of Document

This document gives the code book for the Coursera Class Project for the course “Getting and Cleaning Data”. 
A code book should contain the following: (1) The variables used,	the data used, the transformations that were done to clean up the data.

# Background

The background for the project is best described at the following link: 
https://class.coursera.org/getdata-033/human_grading/view/courses/975117/assessments/3/submissions

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 
You will be graded by your peers on a series of yes/no questions related to the project. 
You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script 
for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work 
that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. 
This repo explains how all of the scripts work and how they are connected.

# Experiment Conducted.

The experiment conducted (from the Read.me file) is described below:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments 
have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, 
where 70% of the volunteers was selected for generating the training data and 30% the test data. 

#Instructions from Assignment

You should create one R script called run_analysis.R that does the following. 
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

# Data Location

The data to be analyzed is located at these links:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
I downloaded the file by hand, extracted it and put it into a directory on my PC.

#Data Used: Files and File Content
*Test (dir)
	I**nertial_Signals (dir)
   Data in this directory was not used.
	subject_test (file):
•	This file contains 2947 rows and one column.
•	The numbers in the rows are the subjects. Subjects are identified by numbers from 1 to 30 (30 subjects/people took part in the experiment).
•	The subjects are people that participated in the experiment.
•	Read this file into R and then used the nrow() and ncol() functions to identify the number of rows and columns. Also looked at the file using WordPad.
	X_test (file)
•	This file contains 2947 rows and 561 columns.
o	Identified this by reading data into R and then used dim() function on the data frame.
•	The documents refer to the values in the columns as features.
•	Features are really measurements like acceleration, body acceleration jerk, etc.
	y_test (file)
•	This file contains 2947 rows and 1 column.
•	The numbers in the rows are associated with activity labels.
•	There are six activity labels. For example activity label 1 is associated with walking.
•	 Read this file into R and then looked at the dimensions with nrow() and ncol() functions.
o	Train (dir)
	Inertial_Signals(dir)
•	Data in this directory was not used.
	subject_train (file):
•	This file contains 7352 rows and one column.
•	The numbers in the rows are the subjects. Subjects are identified by numbers from 1 to 30 (30 subjects/people took part in the experiment).
•	The subjects are people that participated in the experiment.
•	Read this file into R and then used the nrow() and ncol() functions to identify the number of rows and columns. Also looked at the file using WordPad.
•	
	X_train (file)
•	This file contains 7352 rows and 561 columns.
o	Identified this by reading data into R and then used dim() function on the data frame.
•	The documents refer to the values in the columns of X-Train as features.
•	Features are really measurements like acceleration, body acceleration jerk, etc.
	y_train (file)
•	This file contains 7352 rows and 1 column.
•	The numbers in the rows are associated with activity labels.
•	There are six activity labels. For example activity label 1 is associated with walking. 
•	Read this file into R and then looked at the dimensions with nrow() and ncol() functions.
o	activity_labels (file)
	This file contains the activity labels. These labels describe the activities the subjects (people who took part in the experiment) performed. 
•	1 = Walking
•	2 =  Walking Upstairs
•	…
•	6 = Laying
o	The file has two columns. First column contains numbers 1 to 6 and the second column contains the description of the activities the subjects (test participants)  performed (like walking, etc.).
o	features (file)
	This file are the measurements performed during the experiment. For example, the first element in row 2 of the file is tBodyAcc-mean()-X. This is a measurement of the mean body acceleration on the X direction (they are using a X,Y,Z coordinate system).
	This file contains 561 columns and 2 rows. 
	The first column has  numbers from 1 to 561.
	The second column has the description of the measurements. The measurements in the second column are the column names in the X-train and X_test file.
o	features_info
	File describes the features (measurements).
	File was not used in analysis. Just used to better understand what features mean.
o	README
	Describes the experiment.
	Read it to understand the data.
	File not used in analysis.


