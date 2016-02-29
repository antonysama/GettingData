#Read the x_test.txt, x_training.txt, & features.txt 
x_test<-read.table("X_test.txt", sep="", header=T)
x_train<-read.table("X_train.txt", sep="", header=T)
features<-read.table("features.txt", sep="", header=F)

#Found out labels with mean & std (in features.txt )
c<-grep("std|mean", features[,2])

##subset columns & rows with mean & std
x_testc<-x_test[,c]
x_trainc<-x_train[,c]

#Extracted the labels for mean & std in features.txt, and made a list
featuresc<-features[c,]
n<-featuresc[,2]

#Changed the names on this list to active names 
n<-sub("Acc","Acceleration",n,)
n<-sub("t","",n,)
n<-sub("Gyro","AngularVelocity",n,)
n<-sub("BodyBody","Body",n,)
n<-sub("f","FrequencyOf",n,)
n<-sub("Mag","Magnitude",n,)
n<-sub("mean()","Mean",n,)
n<-sub("std()","Std",n,)
n<-sub("()","",n,)
n<-sub("Frequency","TransformationOf",n,)
n<-sub("Jerk","(JerkSignal)",n,)
n<-sub("sd","StandardDeviation",n,)
e$ID<-sub("1", "test", e$ID,)

# Renamed labels of x_test & x_training with active names
names(x_testc)<-n
names(x_trainc)<-n

# Read in the activities, y_test.txt & y_training.txt using read.table
y_test<-read.table("y_test.txt", sep="", header=T)
y_train<-read.table("y_train.txt", sep="", header=T)

## Column-Bound activites into the x_test & x_training tables, using cbind
x_testc<-cbind(x_testc, y_test)
x_trainc<-cbind(x_trainc, y_train)

# Read in the subjects, subject_test.txt & subject_training.txt using read.table
s_test<-read.table("subject_test.txt", sep="", header=T)
s_train<-read.table("subject_train.txt", sep="", header=T)

## Column-bound subjects into the x_test & x_training tables, using cbind
x_testc<-cbind(x_testc, s_test)
x_trainc<-cbind(x_trainc, s_train)

# Merged the new x_test & x_training
install.packages("data.table")
library("data.table")
l=list(x_testc, x_trainc)
m<-rbindlist(l,use.names = F, fill = F, idcol = "ID")

## Gave appropriate labels to the column headings that belowng to activity & subject 
names(m)[81]<-paste("activity") 
names(m)[82]<-paste("subject") 

# Using dplyr package, grouped by & summarised mean of variables by subject & activity 
install.packages("dplyr")
library("dplyr")
e<-m%>%
  group_by(subject, activity)%>%
  summarise_each(funs(mean))

#Gave appropriate names to 6 activities
e$OriginalDataset<-sub("training", 2, e$OriginalDataset,)
enames(e)[3]<-paste("OriginalDataset") 
e$activity<-sub("1", "Walking", e$activity,)
e$activity<-sub("2", "WalkingUpstrs", e$activity,)
e$activity<-sub("3", "WalkingDwnstrs", e$activity,)
e$activity<-sub("4", "Sitting", e$activity,)
e$activity<-sub("5", "Standing", e$activity,)
e$activity<-sub("6", "Laying", e$activity,)

##Grouped by & summarised in different ways 
##till satisfied with the final data.table
e<-e%>%
  group_by(activity, subject)%>%
  summarise_each(funs(mean))
#Writing dataset
write.csv(e, "CleanDataset.csv")

#When reading dataset, use the following
df<-read.table("CleanDataset.csv", header=T)
