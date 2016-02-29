#Courtsey note to reviwer. When reading the dataset, use syntax similar to the following:
## df<-read.table("CleanDataset.csv", header=T)

#The following is a description of the step-by-step processs, meant to support reproducibiluty of the results:
# I first read the x_test.txt, x_training.txt, & features.txt with read.table
# Then found out labels containing only mean & std (in features.txt )
##    Subset columns & rows with mean & std for the x_test & x_training tables
# Extracted the labels for mean & std in features.txt, and made a list
# Changed the names on this list to active names 
# Renamed labels of x_test & x_training with active names
# Read in the activities, y_test.txt & y_training.txt using read.table
##    Column-Bound activites into the x_test & x_training tables, using cbind
# Read in the subjects, subject_test.txt & subject_training.txt using read.table
##    Column-Bound subjects into the x_test & x_training tables, using cbind
# Merged the new x_test & x_training, using the rbindlist, that comes in the data.table package
##    Gave appropriate labels to the column headings that belowng to activity & subject 
# Group by & summarised mean of variables by subject & activity,  using dplyr package
##  Grouped by & summarised in different ways till satisfied with the tiday data.table

### The mentors blog accepts wide or long tables as tidy data:
###'Depending on the interpretation, this could support either data in the wide (first) or the long form (second) being in tidy format, ### and the marking rubric specifically accepts wide or long. In previous sessions most people were opting for wide.' (source: ###https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/)

###Courtsey reminder to reviwer. When reading the dataset, use syntax similar to the following:
### df<-read.table("CleanDataset.csv", header=T)

