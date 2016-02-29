# Read the x_test.txt, x_training.txt, & features.txt with read.table
# Found out labels containing only mean & std (in features.txt )
## Subset columns & rows with mean & std for the x_test & x_training tables
# Extracted the labels for mean & std in features.txt, and made a list
# Changed the names on this list to active names 
# Renamed labels pf x_test & x_training with active names
# Read in the activities, y_test.txt & y_training.txt using read.table
## Bound activites into the x_test & x_training tables, using cbind
# Read in the subjects, subject_test.txt & subject_training.txt using read.table
## Bound subjects into the x_test & x_training tables, using cbind
# Merged the new x_test & x_training, using the rbindlist, that comes in the data.table package
## Gave appropriate labels to the column headings that belowng to activity & subject 
# Group by & summarised mean of variables by subject & activity,  using dplyr package
