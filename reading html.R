setwd("c:/exercise")
getwd()
if(!file.exists("data")){
  dir.create("data")
}
fileUrl<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "c:/exercise/data/cameras.xlsx")
list.files("./data")
install.packages("rJava", "xlsxjars", "xlsx")
library(xlsx)
df<-read.xlsx("c:/exercise/data/cameras.xlsx", header = TRUE)
str(df)
summary("df")
