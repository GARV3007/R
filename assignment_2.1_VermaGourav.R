# Assignment : Assignment 2.1 : 2014 American Community Survey
# Name : Verma, Gourav
# Date : 14 June 2019

# Setup Directory
setwd("C:/Users/f4puslg/Desktop/Garv/ML/Term 2 - R/Assignments")

# setup Library
library(ggplot2)
library(pastecs)

# Import data from scores.csv file
survey <- read.csv("acs-14-1yr-s0201.csv")

# Que 1 : What are the elements in your data (including the categories and data types)?
# Ans : We have 136 observations of 8 variables as below -
# Id        --> Factor      --> Qualitative
# Id2       --> Integer     --> Quantitative
# Geography --> Factor      --> Qualitative
# PopGroupID  > Integer     --> Qualitative
# POPGROUP.display.label  --> Factor  --> Qualitative
# RacesReported --> Integer --> Quantitative
# HSDegree  --> Numeric     --> Quantitative
# BachDegree--> Numeric     --> Quantitative

# Que 2 : Please provide the output from the following functions: str(); nrow(); ncol()
# Ans : 

str(survey)

# 'data.frame':	136 obs. of  8 variables:
#   $ Id                    : Factor w/ 136 levels "0500000US01073",..: 1 2 3 4 5 6 7 8 9 10 ...
# $ Id2                   : int  1073 4013 4019 6001 6013 6019 6029 6037 6059 6065 ...
# $ Geography             : Factor w/ 136 levels "Alameda County, California",..: 56 70 98 1 20 43 62 68 92 106 ...
# $ PopGroupID            : int  1 1 1 1 1 1 1 1 1 1 ...
# $ POPGROUP.display.label: Factor w/ 1 level "Total population": 1 1 1 1 1 1 1 1 1 1 ...
# $ RacesReported         : int  660793 4087191 1004516 1610921 1111339 965974 874589 10116705 3145515 2329271 ...
# $ HSDegree              : num  89.1 86.8 88 86.9 88.8 73.6 74.5 77.5 84.6 80.6 ...
# $ BachDegree            : num  30.5 30.2 30.8 42.8 39.7 19.7 15.4 30.3 38 20.7 ...

nrow(survey)

# [1] 136

ncol(survey)

# [1] 8


# Que 3 : Create a Histogram of the HSDegree variable using the ggplot2 package.
#     a. Set a bin size for the Histogram.
#     b. Include a Title and appropriate X/Y axis labels on your Histogram Plot.
# Ans : 

ggplot(survey, aes(HSDegree)) +
  geom_histogram(binwidth = 2) +
labs(x = "Degree Percentage", y = "Density", title = "2014 HS Degree percentage histogram")


# Que 4 : 	4. Answer the following questions based on the Histogram produced:
# 4.a : Based on what you see in this histogram, is the data distribution unimodal?
# Ans : We can say it is unimodel due to only one peak.

# 4.b : Is it approximately symmetrical?
# Ans : No.

# 4.c : Is it approximately bell-shaped?
# Ans : No

# 4.d : Is it approximately normal?
# Ans : No

# 4.e : If not normal, is the distribution skewed? If so, in which direction?
# Ans : Negetive Skewed/Left Skewed

# 4.f : Include a normal curve to the Histogram that you plotted.
# Ans : 

ggplot(survey, aes(HSDegree)) + 
  geom_histogram(aes(y = ..density..), binwidth = 2) + 
  geom_density(col = "red", alpha = 0.2) + 
  labs(x = "Degree Percentage", y = "Density", title = "2014 HS Degree percentage histogram")

# 4.g : Explain whether a normal distribution can accurately be used as a model for this data.
# Ans : We can see distribution is not normal, so normal distribution can't be used for this data.


# Que 5 : Create a Probability Plot of the HSDegree variable.
# Ans : 

ggplot(survey, aes(sample = survey$HSDegree)) +
     stat_qq() +
     stat_qq_line(col="green", size=0.75)

# Que 6 : Answer the following questions based on the Probability Plot:
# 6.a : Based on what you see in this probability plot, is the distribution approximately normal? Explain how you know.
# Ans : Distribution is not normal, Because plot is not equally distributed.

# 6.b : If not normal, is the distribution skewed? If so, in which direction? Explain how you know.
# Ans : Both end of probability curve doesn't allign with hypothetical line. Hence, we can say distribution is skewd in negetive direction.


# Que 7 : Now that you have looked at this data visually for normality, you will now quantify normality with numbers using the stat.desc() function. Include a screen capture of the results produced.
# Ans : 

stat.desc(survey$HSDegree, basic = T, norm = T)

# nbr.val      nbr.null        nbr.na           min           max         range           sum        median          mean       SE.mean 
# 1.360000e+02  0.000000e+00  0.000000e+00  6.220000e+01  9.550000e+01  3.330000e+01  1.191800e+04  8.870000e+01  8.763235e+01  4.388598e-01 
# CI.mean.0.95           var       std.dev      coef.var      skewness      skew.2SE      kurtosis      kurt.2SE    normtest.W    normtest.p 
# 8.679296e-01  2.619332e+01  5.117941e+00  5.840241e-02 -1.674767e+00 -4.030254e+00  4.352856e+00  5.273885e+00  8.773635e-01  3.193634e-09


# Que 8 : In several sentences provide an explanation of the result produced for skew, kurtosis, and z-scores. In addition, explain how a change in the sample size may change your explanation?
# Ans : 
# ==> Skewness produced is negetive, which is justified by the histogram plot. The distribution is on right side and its long tail is on the negetive direction on a number line.
# ==> Kurtosis value is very high which means that distribution si tend to have heavy tail or in other words large outliers.
# ==> The function stat.desc() provides two statistics that allow us to skip doing this simple bit of arithmatic. skew.2SE and kurt.2SE are the values of skew and kurtosis divided by 2 standard errors. This is the z-score for the observed skew / kurtosis divided by 2, and hence is significant if z-(skew) is less than 1 and z-(kurt) it is greater than 1.
# ==> Change in size affects distribution of data. Hence, if we change size, sue to change in distribution all the paraeters and assumption can change. 

