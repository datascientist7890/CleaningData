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
* subject_test (file): This file contains 2947 rows and one column.
 ** The numbers in the rows are the subjects. Subjects are identified by numbers from 1 to 30 (30 subjects/people took part in the experiment).
 ** The subjects are people that participated in the experiment.
 ** Read this file into R and then used the nrow() and ncol() functions to identify the number of rows and columns. Also looked at the file using WordPad.
* X_test (file)
  ** This file contains 2947 rows and 561 columns.
  ** Identified this by reading data into R and then used dim() function on the data frame.
  ** The documents refer to the values in the columns as features.
  ** Features are really measurements like acceleration, body acceleration jerk, etc.
* y_test (file)
 ** This file contains 2947 rows and 1 column.
 ** The numbers in the rows are associated with activity labels.
 ** There are six activity labels. For example activity label 1 is associated with walking.
 ** Read this file into R and then looked at the dimensions with nrow() and ncol() functions.
* subject_train (file):
 ** This file contains 7352 rows and one column.
 ** The numbers in the rows are the subjects. Subjects are identified by numbers from 1 to 30 (30 subjects/people took part in the experiment).
 ** The subjects are people that participated in the experiment.
 ** Read this file into R and then used the nrow() and ncol() functions to identify the number of rows and columns. 
* X_train (file)
 ** This file contains 7352 rows and 561 columns.
 ** Identified this by reading data into R and then used dim() function on the data frame.
 ** The documents refer to the values in the columns of X-Train as features.
 ** Features are really measurements like acceleration, body acceleration jerk, etc.	y
* y_train (file)
 ** This file contains 7352 rows and 1 column.
 ** The numbers in the rows are associated with activity labels.
 ** There are six activity labels. For example activity label 1 is associated with walking. 
 ** Read this file into R and then looked at the dimensions with nrow() and ncol() functions.
* activity_labels (file)
  **This file contains the activity labels. These labels describe the activities the subjects (people who took part in the experiment) performed. 
  ** The file has two columns. First column contains numbers 1 to 6 and the second column contains the description of the activities the subjects (test participants)  performed (like walking, etc.).
* features (file)
** his file are the measurements performed during the experiment. For example, the first element in row 2 of the file is tBodyAcc-mean()-X. This is a measurement of the mean body acceleration on the X direction (they are using a X,Y,Z coordinate system).
**This file contains 561 columns and 2 rows. 
** The first column has numbers from 1 to 561.
** The second column has the description of the measurements. The measurements in the second column are the column names in the X-train and X_test file.
* features_info
** File describes the features (measurements).
** File was not used in analysis. Just used to better understand what features mean.

# Variables Used and Manipulation of Variables:
* activity_labels: This variable contains the 6 activities. It is extracted from the activity labels file. We are using the second column.
* features: o	This variable contains a list of 561 features (measurements). We are using the second column of the feature file.
* match_features: o	This variable is a TRUE/FASLE vector. TRUE = (mean or standard deviation). FALSE != (mean or standard deviation).
* X_test: o	This variable contains the data from the X_test file. When we read it into R, it is a data frame with 2947 rows and 561 columns.
* X-test1: o	This variable contains only those columns from the X_test data frame that have mean or std in their name.
 It was created by only selecting the match_feature names from the X_test data frame.  This data frame has 79 columns and 2947 rows.
* y_test: o	This variable is derived from the y_test file. It has two columns and 2947 rows. The column names are: “Activity ID” and “Activity Label”.
* subject_test: o	This variable is derived from the subject_test file. The column name of hat variable is “subject”. Remember, a subject is a person who participated in the experiment. There are 30 different subjects. o	The variable has one column and 2947 rows.
* test_data: o	This variable is a data frame. It was created by column binding (using cbind() function) using subject_test, y_test and X_test1. o	We were able to do the column binding because all of the variables (date frames) have 2947 rows.
 The variable (data frame) has 82 columns and 2947 rows. The names of the first 3 columns are: “subject”, “Activity_ID”, “Activity Label”.
* X_train: This variable (data frame) contains the training set data. o	It is analogous to the X_test data frame. o	It consists of 7352 rows and 561 columns.
* y_train: o	This variable is derived from the y_train file. It has two columns and 7352 rows. The column names are: “Activity ID” and “Activity Label”. This variable (data frame) contains the training set data. o	It is analogous to the  y_test variable.
* subject_train:  This variable contains the training set data. It is analogous to the subject_test variable. This variable has one column and 7352 rows.
* X_train1: o	This variable contains the training set. o	It is analogous to the X_test1 variable. This variable (data frame) has 79 columns and 7352 rows.
* train_data: This variable is a data frame. It was created by column binding (using cbind() function) using subject_train, y_train and X_train1. o	We were able to do the column binding because all of the variables (date frames) have 7352 rows. o	The variable (data frame) has 82 columns and 7352 rows. The names of the first 3 columns are: “subject”, “Activity_ID”, “Activity Label”.
* alldata: o	This variable was created by binding rows using the train_data and the test_data data frames. o	This data frame has 10,299 rows (7352 + 2947 = 10,299) and 82 columns.
* alldata_test_rows: o	This is a variable I used to check how many of the rows of the alldata data frame are associated with subject (participant) = 6. o	The result is that there are 325 rows (observations for subject 6). I did similar checks for other subjects and many of the subjects had about 330 observations. An observation is a row in the alldata data frame. o	The same variable was used to see how many observations there were for subject 4 and activity = 5. Turns out that there are 56 observations for subject 4 and activity = 5 (activity 5 = Standing). I did this checking to see whether the dimensions of the alldata frame make sense. Overall, there are 30 subjects (persons taking part in experiment) and there are about 340 observations for each of the subjects. This yields a data frame that is has approximately 10,200 rows and 82 columns.
* id_lables: o	This variable just contains three labels: “subject”, “Acivity_ID” and “Activity_Label”
* alldata_labels: 	This variable is created by taking the difference between colnames(alldata) and id_labels. o	The alldata_lables variable consists of 79 values. Those values are the column names like: tBodyAcc-mean()-X, fBodyBodyGyroMag-std(), etc.
*	melt_alldata: o	This variable is produced by “melting” the alldata data frame. The source is the alldata data frame. The id variables are the id_lables and the measure variables are the alldata_labels variables. There are 3 items in the id_lables. They are “subject”, “Activity_ID” and “Activity_Label”. There are 79 items in the alldata_lables. o	The end result of the “melt” function is a data frame that contains 5 columns and 813,621 rows. Essentially, the melt function creates a skinny data frame where each subject, for each activity, for each variable (used to be the called features) has a value. The 10,299x82 data frame was converted into a data frame with 5 columns and 813,621 rows. Essentially 10,299*79 = 813,621. o	The columns are: “subject” “Activity_ID”  “Activity_Label”      “variable”     “value”. o	Looking at the first 10 rows in the data set we have:
	    subject Activity_ID Activity_Label          variable     value
	 1:       2           5       STANDING tBodyAcc-mean()-X 0.2571778
	 2:       2           5       STANDING tBodyAcc-mean()-X 0.2860267
	 3:       2           5       STANDING tBodyAcc-mean()-X 0.2754848
	 4:       2           5       STANDING tBodyAcc-mean()-X 0.2702982
	 5:       2           5       STANDING tBodyAcc-mean()-X 0.2748330
	 6:       2           5       STANDING tBodyAcc-mean()-X 0.2792199
	 7:       2           5       STANDING tBodyAcc-mean()-X 0.2797459
	 8:       2           5       STANDING tBodyAcc-mean()-X 0.2746005
	 9:       2           5       STANDING tBodyAcc-mean()-X 0.2725287
	10:       2           5       STANDING tBodyAcc-mean()-X 0.2757457
 This means that there are many means associated with subject 2, activity 5 and  variable = tBodyAcc-mean()-X •	tidy_data:
* idy Data: Using the dcast function we create the tidy data set. o	The input into the dcast function are: (1) melt_alldata, (2) subject + Activity_Label ~ variable and (3) mean. 	Essentially, the dcast function calculates the mean for each of the variables. Remember, the variables used to be the features (measurements).As an example, part of the output of the dcast function will be the mean for the  tBodyAcc-mean()-X variable (see above bullet). The end result is a data frame that consist of 180 rows and 81 columns. This makes sense. There are 30 subjects, 6 activity levels and 79 features (measurements) that are being tracked. 	Each of the rows  in the tidy_data set consists of: (1) subject, (2) Activity_Label and (3) 79 values for a total of 81 elements in a row. Therefore, the tidy data set will have 180 rows and 81 columns.

