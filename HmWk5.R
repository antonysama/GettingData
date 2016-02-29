x_test<-read.table("X_test.txt", sep="", header=T)
x_train<-read.table("X_train.txt", sep="", header=T)
#in features.txt find out labels with mean & std
features<-read.table("features.txt", sep="", header=F)
c<-grep("std|mean", features[,2])
#subset columns & rows with mean & std
x_testc<-x_test[,c]
x_trainc<-x_train[,c]
featuresc<-features[c,]
#names
n<-featuresc[,2]
#replace with active names 
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

#add names
names(x_testc)<-n
names(x_trainc)<-n

#add activities
y_test<-read.table("y_test.txt", sep="", header=T)
y_train<-read.table("y_train.txt", sep="", header=T)
x_testc<-cbind(x_testc, y_test)
x_trainc<-cbind(x_trainc, y_train)

#add subjects
s_test<-read.table("subject_test.txt", sep="", header=T)
s_train<-read.table("subject_train.txt", sep="", header=T)
x_testc<-cbind(x_testc, s_test)
x_trainc<-cbind(x_trainc, s_train)

#merge
install.packages("data.table")
library("data.table")
l=list(x_testc, x_trainc)
m<-rbindlist(l,use.names = F, fill = F, idcol = "ID")
#new names
names(m)[81]<-paste("activity") 
names(m)[82]<-paste("subject") 

#Q5: group by & summarise each
install.packages("dplyr")
library("dplyr")

e<-m%>%
  group_by(subject, activity)%>%
  summarise_each(funs(mean))
  
