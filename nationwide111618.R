#Nationwide Youtube data
#Predict CPV for each objective
library(dplyr)
allOrders <- read.csv("~/Downloads/raw/allOrders.csv")
advertiserCategories <- read.csv("~/Downloads/raw/advertiserCategories.csv")
objectives <- read.csv("~/Downloads/raw/objectives.csv")
targetAgeRanges <- read.csv("~/Downloads/raw/targetedAgeRanges.csv")
targetDevices <- read.csv("~/Downloads/raw/targetedDevices.csv")
targetGenders <- read.csv("~/Downloads/raw/targetedGenders.csv")
targetGeos <- read.csv("~/Downloads/raw/targetedGeos.csv")
targetHHI <- read.csv("~/Downloads/raw/targetedHHIs.csv")
targetParentalStatus <- read.csv("~/Downloads/raw/targetedParentalStatuses.csv")

