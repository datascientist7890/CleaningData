#### Course Project
#############################################################################
#### Reading Data
#### Read manually.
##########################################################################
### Set working directory:
setwd("C:/../Cleaning_Data/project/getdata_projectfiles_UCI HAR Dataset")

library(data.table)
library(reshape2)
require("data.table") 
require("reshape2") 

# Load: activity labels 
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2] 
head(activity_labels)  ### gives the correct result

# Loading Features 
features <- read.table("./UCI HAR Dataset/features.txt")[,2] 
head(features)

# Extract only the measurements on the mean and standard deviation for each measurement. 
match_features <- grepl("mean|std", features)  ### match_features will contain those features that have mean and std. TRUE/FALSE vector.
head(match_features,10)
length(match_features)

# Load and process X_test & y_test data. 
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
head(X_test,1)
nrow(X_test)

y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
#y_test
nrow(y_test)
head(y_test)


subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
nrow(subject_test)
head(subject_test,1)

names(X_test) = features   ### assign "features" as column names to X_test data. "Features" are measurements (column names).

# Extract only the measurements that contain mean and standard deviation for each measurement. 
X_test1 = X_test[,match_features] 
head(X_test1,1)
dim(X_test1)

# Load activity labels 
y_test[,2] = activity_labels[y_test[,1]] 
names(y_test) = c("Activity_ID", "Activity_Label") 
names(subject_test) = "subject"
head(y_test,1)
dim(y_test)

# Bind data 
test_data <- cbind(as.data.table(subject_test), y_test, X_test1) 
head(test_data,1)
dim(test_data)


## Essentially we wil repeat the same process for the "training" data as we did for the "test" data.
# Load and process X_train & y_train data. 
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt") 
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt") 

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt") 

names(X_train) = features
head(features,5)

# Extract only the measurements on the mean and standard deviation for each measurement. 
X_train1 = X_train[,match_features] 

# Load activity data 
y_train[,2] = activity_labels[y_train[,1]] 
names(y_train) = c("Activity_ID", "Activity_Label") 
names(subject_train) = "subject" 

# Bind data training data.
train_data <- cbind(as.data.table(subject_train), y_train, X_train1)
head(train_data,1)
dim(train_data)

# Merge test and train data 
alldata = rbind(test_data, train_data) ## now we have a data frame that has 82 columns and 10,299 rows.
head(alldata,1)
dim(alldata)   ### the dimension for alldata is 10,299 by 82. This makes sense since there are roughly 340 or so rows for each subject (340*30=10,200)


alldata_test_rows<- alldata[alldata$subject==6,]
dim(alldata_test_rows)    ### turns out there are 325 rows (observations) fo subject = 6.
head(alldata_test_rows)

alldata_test_rows<- alldata[alldata$subject==4 & alldata$Activity_ID ==5, ] 
dim(alldata_test_rows)     ### turns out there are 56 rows (observations) for subject = 4 and activity being 5 (standing)
head(alldata_test_rows)

id_labels   = c("subject", "Activity_ID", "Activity_Label") 
alldata_labels = setdiff(colnames(alldata), id_labels)
head(alldata_labels,10)
length(alldata_labels)
  
melt_alldata  = melt(alldata, id = id_labels, measure.vars = alldata_labels) 
## The above command produces a data frame that has 10,299*79=813,621 rows and 5 columns.
## The column names are: Subject,Activity_ID, Activity_Label, variable (one of th 79 column names; also called features) and value.
## Essentially we re-arrange the 10,299X79 data frame into 813,621 individual values.
head(melt_alldata,10)
tail(melt_alldata,10)
dim(melt_alldata)

# Apply mean function to dataset using dcast function 
tidy_data   = dcast(melt_alldata, subject + Activity_Label ~ variable, mean) 
## Above command will take the melt_alldata and condense it.
## For example, for subject=4 and activity=5, there are 56 observation with each observation having 79 labels(measurements,features).
## The dcast function above will calculate the mean for the 56 different observations for each of the 79 labels(measurements, features).
## In the end we will be ending up with 30*6=180 means for each label(measurement).
## The end result will be a data frame with 180 rows (observations), and 81 columns. There are 79 columns for the labels(measurements,features).
## There wil be two columns for subject and activity label.
head(tidy_data,1)
nrow(tidy_data)
ncol(tidy_data)

write.table(tidy_data, file = "./tidy_data.txt") 
