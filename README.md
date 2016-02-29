# Read the x_test.txt, x_training.txt, & features.txt with read.table
# found out labels containing only mean & std (in features.txt )
# #subset columns & rows with mean & std the x_test & x_training tables
# extracted the labels for mean & std in features.txt, and made a list
# changed the names on this list to active names 
# renamed labels pf x_test & x_training with active names
# read in the activities, y_test.txt & y_training.txt using read.table
## bound activites into the x_test & x_training tables, using cbind
# read in the subjects, subject_test.txt & subject_training.txt using read.table
## bound subjects into the x_test & x_training tables, using cbind
# merged the new x_test & x_training, using the rbindlist, that comes in the data.table package
## gave appropriate labels to the column headings that belowng to activity & subject 
# group by & summarised mean of variables by subject & activity,  using dplyr package
