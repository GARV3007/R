# Assignment : Assignment 1.1 : Test Scores
# Name : Verma, Gourav
# Date : 09 June 2019

# Setup Directory
setwd("C:/Users/f4puslg/Desktop/Garv/ML/Term 2 - R/Assignments")

# Check contents of dir
dir()

# Import data from scores.csv file
scores <- read.csv("scores.csv")

# Task 1 : What are the observational units in this study?
# Answer : Using structure instruction we can see attributes of a data frame
#          for scores.csv file, observational units are "count", "score" and "section" and there are 38 observations.
str(scores)

# Task 2 : Identify the variables mentioned in the narrative paragraph and determine which are categorical and quantitative?
# Answer : "Count" and "Score" are quantitative and "Section" is categorical

# Task 3 : Create one variable to hold a subset of your data set that contains only the Regular Section and one variable for the Sports Section.
regular <- subset(scores, subset = Section == "Regular")
sports <- subset(scores, subset = Section == "Sports")

# Task 4 : Use the Plot function to plot each Sections scores and the number of students achieving that score. Use additional Plot Arguments to label the graph and give each axis an appropriate label. Once you have produced your Plots answer the following questions:
plot(regular$Score, regular$Count, main = "Plot of Regular Section", xlab = paste("Regular_Score"), ylab = paste("Regular_Count"))
plot(sports$Score, sports$Count, type = "p", main = "Plot of Sports Section", xlab = paste("Sports_Score"), ylab = paste("Sports_Count"))

# Task 4.a : Comparing and contrasting the point distributions between the two section, looking at both tendency and consistency: Can you say that one section tended to score more points than the other? Justify and explain your answer.
# Answer : Scattering of points in both plots looks similar. Looking closely into plots, we can see point's density for regular section is more on right side, which indicates regular section has more tendency to score than, sports section.
#          This can be justified with summary instruction on each subset.
#          Summary of Regular Section shows median score of 325
#          Summary of Regular Section shows median score of 315
summary(regular)
summary(sports)

# Task 4.b : Did every student in one section score more points than every student in the other section? If not, explain what a statistical tendency means in this context.
# Answer : No. Standard deviation of scores of regular section is 33.26 and same for scores of sports section is 58.03. Students of regular section have tendency to score more that sports section students. In sports section we can find big number of high scorers as well as well as low scorers. On the other hand regular section students more tends to score average scores.
sd(regular$Score)
sd(sports$Score)

# Task 4.c : What could be one additional variable that was not mentioned in the narrative that could be influencing the point distributions between the two sections?
# Answer : Attendance could be a factor which can influence scores.

