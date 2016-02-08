setwd("c:/exercise/data")
getwd()
df<-read.csv("getdata.csv")
str(df)
summary(df)
df1<-subset(df, VAL==24)
nrow(df1)
nrow(df)
install.packages("xlsx")
library(xlsx)
install.packages("rJava", "xlsxjars")
df2<-read.xlsx("c:/exercise/data/NGAP.xlsx", sheetName = 1, header = TRUE)
str(df2)
dat<-as.data.frame(df2[18:23,7:15], header = TRUE)
sum(dat$Zip*dat$Ext,na.rm=T)
https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml

install.packages("XML")
library(XML)
fileUrls<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileUrls, destfile = "c:/exercise/data/fileUrls.xml")
docs<-xmlTreeParse("c:/exercise/data/fileUrls.xml",useInternal=T)

setwd("c:/exercise/data")
getwd()
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "c:/exercise/data/pid.csv")
list.files("c:/exercise/data")
install.packages("data.table")
library(data.table)
DT=fread("pid.csv",nrows = -1)
system.time(for(i in 1:1000) mean(DT$pwgtp15,by=DT$SEX))
f1<-function(DT){mean(DT$pwgtp15,by=DT$SEX)}
f2<-function(DT){sapply(split(DT$pwgtp15,DT$SEX),mean)}
f3<-function(DT){DT[,mean(pwgtp15),by=SEX]}
f4<-function(DT){tapply(DT$pwgtp15,DT$SEX,mean)}
f5<-function(DT){rowMeans(DT)[DT$SEX==1] ; rowMeans(DT)[DT$SEX==2]}
f6<-function(DT){mean(DT[DT$SEX==1,]$pwgtp15) & mean(DT[DT$SEX==2,]$pwgtp15)}
f5(DT)
f6(DT)
f1(DT)
f2(DT)
f3(DT)
f4(DT)

install.packages("microbenchmark","ggplot2")
library(microbenchmark)
library(ggplot2)
tm <- microbenchmark(f1(DT), f2(DT), f3(DT), f4(DT), times=1000L)
autoplot(tm)