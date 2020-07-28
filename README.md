# SamsungData

The run_analysis.R script attempts to take the human activity recognition (HAR) information collected using Samsung smartphones and summarize the values based upon the participant and their activity. The summary is a mean calculation of the variables provided in "CodeBook.md".

The original data is derived from the data shared in this link:

https://archive.ics.uci.edu/ml/datasets/human+activity+recognition+using+smartphones

In the original data, there are 561 values calculated over a test dataset and a train dataset for 30 participants doing 6 various tasks. This analysis filters these variables to only include the mean and standard deviation of each major data type, then calculates the mean of these values for each participant per activity conducted. This summarizes the data into 81 variables with a total of 180 observations (30 participants doing 6 activities). 
