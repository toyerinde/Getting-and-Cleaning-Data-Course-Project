setwd("/Users/toyerinde/Desktop/DataScience")

#Reading in required training and test data sets
train_data<-read.table("./UCI HAR Dataset/train/X_train.txt",header = FALSE)
test_data<-read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
train_labels<-read.table("./UCI HAR Dataset/train/y_train.txt",header = FALSE)
test_labels<-read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
features<-read.table("./UCI HAR Dataset/features.txt", header = FALSE)
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt",header = FALSE)
str(train_data)
str(test_data)
str(train_labels)
str(test_labels)

# Merging the training and test data set to create one data set
train_datacomb<-cbind(subject_train,train_labels,train_data)
test_datacomb<-cbind(subject_test,test_labels,test_data)
combine_dataset<-rbind(train_datacomb,test_datacomb)
library(dplyr)

# Extracting the mean and standard deviation for each measurement to create a smaller combined dataset
combine_datasetextract<-combine_dataset %>%
  select(c(3:8,43:48,83:88,123:128,163:168,203:204,216:217,229:230,242:243,255:256,268:273,347:352,426:431,505:506,518:519,531:532,544:545))
sublabel_traincombo<-cbind(subject_train,train_labels)
sublabel_testcombo<-cbind(subject_test,test_labels)
combine_sublabel<-rbind(sublabel_traincombo,sublabel_testcombo)
combine_datasetextractupd<-cbind(combine_sublabel,combine_datasetextract)
summary(combine_datasetextractupd)
colnames(combine_datasetextractupd) <-c("Volunteer_ID","Activity_ID", " mean_tbodyacc-X","mean_tbodyacc-Y","mean_tbodyacc-Z","std_tbodyacc-X","std_tbodyacc-Y"
                                        ,"std_tbodyacc-Z","mean_tgravacc-X","mean_tgravacc-Y","mean_tgravacc-Z","std_tgravacc-X","std_tgravacc-Y","std_tgravacc-Z",
                                        "mean_tbodyaccjerk-X","mean_tbodyaccjerk-Y","mean_tbodyaccjerk-Z","std_tbodyaccjerk-X","std_tbodyaccjerk-Y","std_tbodyaccjerk-Z"
                                        ,"mean_tbodygyro-X","mean_tbodygyro-Y","mean_tbodygyro-Z","std_tbodygyro-X","std_tbodygyro-Y","std_tbodygyro-Z","mean_tbodygyrojerk-X","mean_tbodygyrojerk-Y","mean_tbodygyrojerk-Z"
                                        ,"std_tbodygyrojerk-X","std_tbodygyrojerk-Y","std_tbodygyrojerk-Z","mean_tbodyaccmag","std_tbodyaccmag","mean_tgravaccmag","std_tgravaccmag","mean_tbodyaccjerkmag","std_tbodyaccjerkmag"
                                        ,"mean_tbodygyromag","std_tbodygyromag","mean_tbodygyrojerkmag","std_tbodygyrojerkmag"," mean_fbodyacc-X","mean_fbodyacc-Y","mean_fbodyacc-Z","std_fbodyacc-X","std_fbodyacc-Y","std_fbodyacc-Z"
                                        ,"mean_fbodyaccjerk-X","mean_fbodyaccjerk-Y","mean_fbodyaccjerk-Z","std_fbodyaccjerk-X","std_fbodyaccjerk-Y","std_fbodyaccjerk-Z","mean_fbodygyro-X","mean_fbodygyro-Y","mean_fbodygyro-Z","std_fbodygyro-X"
                                        ,"std_fbodygyro-Y","std_fbodygyro-Z","mean_fbodyaccmag","std_fbodyaccmag","mean_fbodyaccjerkmag","std_fbodyaccjerkmag","mean_fbodygyromag","std_fbodygyromag","mean_fbodygyrojerkmag","std_fbodygyrojerkmag")

# Assigning descriptive names to the activities in the smaller combined data set
combine_datasetextractupd2<-combine_datasetextractupd
combine_datasetextractupd2["Activity_ID"][combine_datasetextractupd2["Activity_ID"]== 1]<-"WALKING"
combine_datasetextractupd2["Activity_ID"][combine_datasetextractupd2["Activity_ID"]== 2]<-"WALKING_UP"
combine_datasetextractupd2["Activity_ID"][combine_datasetextractupd2["Activity_ID"]== 3]<-"WALKING_DOWN"
combine_datasetextractupd2["Activity_ID"][combine_datasetextractupd2["Activity_ID"]== 4]<-"SITTING"
combine_datasetextractupd2["Activity_ID"][combine_datasetextractupd2["Activity_ID"]== 5]<-"STANDING"
combine_datasetextractupd2["Activity_ID"][combine_datasetextractupd2["Activity_ID"]== 6]<-"LAYING"

# Labeling the data set with descriptive variable names
colnames(combine_datasetextractupd2) <-c("Volunteer_ID","Activity", " mean_tbodyacc-X","mean_tbodyacc-Y","mean_tbodyacc-Z","std_tbodyacc-X","std_tbodyacc-Y"
                                        ,"std_tbodyacc-Z","mean_tgravacc-X","mean_tgravacc-Y","mean_tgravacc-Z","std_tgravacc-X","std_tgravacc-Y","std_tgravacc-Z",
                                        "mean_tbodyaccjerk-X","mean_tbodyaccjerk-Y","mean_tbodyaccjerk-Z","std_tbodyaccjerk-X","std_tbodyaccjerk-Y","std_tbodyaccjerk-Z"
                                        ,"mean_tbodygyro-X","mean_tbodygyro-Y","mean_tbodygyro-Z","std_tbodygyro-X","std_tbodygyro-Y","std_tbodygyro-Z","mean_tbodygyrojerk-X","mean_tbodygyrojerk-Y","mean_tbodygyrojerk-Z"
                                        ,"std_tbodygyrojerk-X","std_tbodygyrojerk-Y","std_tbodygyrojerk-Z","mean_tbodyaccmag","std_tbodyaccmag","mean_tgravaccmag","std_tgravaccmag","mean_tbodyaccjerkmag","std_tbodyaccjerkmag"
                                        ,"mean_tbodygyromag","std_tbodygyromag","mean_tbodygyrojerkmag","std_tbodygyrojerkmag"," mean_fbodyacc-X","mean_fbodyacc-Y","mean_fbodyacc-Z","std_fbodyacc-X","std_fbodyacc-Y","std_fbodyacc-Z"
                                        ,"mean_fbodyaccjerk-X","mean_fbodyaccjerk-Y","mean_fbodyaccjerk-Z","std_fbodyaccjerk-X","std_fbodyaccjerk-Y","std_fbodyaccjerk-Z","mean_fbodygyro-X","mean_fbodygyro-Y","mean_fbodygyro-Z","std_fbodygyro-X"
                                        ,"std_fbodygyro-Y","std_fbodygyro-Z","mean_fbodyaccmag","std_fbodyaccmag","mean_fbodyaccjerkmag","std_fbodyaccjerkmag","mean_fbodygyromag","std_fbodygyromag","mean_fbodygyrojerkmag","std_fbodygyrojerkmag")
combine_datasetextractupd2tb<-tibble::as_tibble(combine_datasetextractupd2)
head(combine_datasetextractupd2tb)
str(combine_datasetextractupd2tb)

# Creating a tidy data set with the average of each variable for each activity and each subject
tidy_dataset<-combine_datasetextractupd2tb %>%
  group_by(Volunteer_ID,Activity) %>%
  summarise(across(where(is.numeric),~mean(.x,na.rm= TRUE)))
