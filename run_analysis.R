run_analysis <- function() {
   library(dplyr)
   library(tidyr)
   testx <- as_tibble(read.table("UCI HAR Dataset/test/X_test.txt", stringsAsFactors = FALSE))
   testy <- as_tibble(read.table("UCI HAR Dataset/test/y_test.txt", stringsAsFactors = FALSE))
   testsub <- as_tibble(read.table("UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = FALSE))
   trainx <- as_tibble(read.table("UCI HAR Dataset/train/X_train.txt", stringsAsFactors = FALSE))
   trainy <- as_tibble(read.table("UCI HAR Dataset/train/y_train.txt", stringsAsFactors = FALSE))
   trainsub <- as_tibble(read.table("UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = FALSE))
   actlabels <- as_tibble(read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE))
   datavars <- as_tibble(read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE))
   names(testx)<- datavars$V2
   names(testy) <- "x"
   names(testsub) <- "participant"
   names(actlabels) <- c("x", "activity")
   names(trainx)<- datavars$V2
   names(trainy) <- "x"
   names(trainsub) <- "participant"
   testact <- left_join(testy, actlabels)
   testdata <- bind_cols(testsub, testact, testx)
   trainact <- left_join(trainy, actlabels)
   traindata <- bind_cols(trainsub, trainact, trainx)
   alldata <- bind_rows(testdata, traindata)
   alldata <- select(alldata, participant, activity, grep("mean()|std()", names(alldata)))
   alldata %>% group_by(participant, activity) %>%
            summarize_all(mean)
}
