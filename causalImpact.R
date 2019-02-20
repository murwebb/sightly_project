#CausalImpact of AdGroup Data
library(CausalImpact)


# reading in the AdGroup data 
AdGroup <- read.csv('~/Projects/adwords-data/CapOneData/AdGroup.csv', col.names=c('AdGroupStatsId',
                                                                       'AdGroupId',
                                                                       'AdGroupName',
                                                                       'CampaignId',
                                                                       'CampaignName', 
                                                                       'StatDate',
                                                                       'Clicks',
                                                                       'Impressions',
                                                                       'TotalViews',
                                                                       'Cost', 
                                                                       'PulledDate', 
                                                                       'CustomerId'))
head(AdGroup, n= 1000)
unique(AdGroup$CampaignName)
# subsetting the AdGroup dataset to look at one campaign at a time
# 
AdGroupBrew <- AdGroup[ which(AdGroup$CampaignName == "Small-to-Mid Size SBOs - Brewery 30 sec - Desktop"),]
head(AdGroupBrew)

#we only need the following 4 variables
# Clicks, Impressions, TotalViews, Cost
data <- AdGroupBrew[7:10]

head(data, n = 100)

#renaming the column names so that they may be used in the 
# causalImpact algorithm
#also, setting a rownames to data value
colnames(data) <- c("y", "x1", "x2","x3")

pre.period <- c(1,62)
post.period <- c(66,226)

#running the algorith and saving the model to var impact
impact <- CausalImpact(data, pre.period, post.period)

# plotting the impact plot that can be used to answer questions what 
# influences cost
plot(impact)

# subsetting the adgroup into dataset with campaign = speedsuit
# this is to do another analysis on the impact that one variable has on
# another variable
AdGroupSpeedSuits = AdGroup[which(AdGroup$CampaignName == "Small-to-Mid Size SBOs - SpeedSuits 30 sec - Desktop"),]

# grabbing numerical variables
data2 <- AdGroupSpeedSuits[7:10]
dim(data2)

# creating a new index to effectively create the 
# pre period and post period
rownames(data2) = c(1: 347)

# creating the pre and post period to see what changes influenced
# the clicks on that spectific video
pre.period2 <- c(1, 180)
post.period2 <- c(181,347)

#running algorith and saving model to impact2 variable
impact2 <- CausalImpact(data2, pre.period2, post.period2)

#plot the impact of the variables on the target y
plot(impact2)

#subsetting and looking at savor sandwich campaign
AdGroupSandwich = AdGroup[which(AdGroup$CampaignName =='2018 Sightly Cap One Savor Sandwich Mobile'),]

# creating the data that will be going into the algorithm 
# only taking the 4 numerical variables
data3 = AdGroupSandwich[8:9]
#looking at the data dimensions
dim(data3)
# creating a new index to effectively create the 
# pre period and post period
rownames(data3) = c(1: 56)
# creating the pre and post period to see what changes influenced
# the clicks on that spectific ad campaign
pre.period3 <- c(1,14)
post.period3 <- c(15,56)
#running the algorithm and saving it to var named impact3
impact3 = CausalImpact(data3, pre.period3, post.period3)

# plotting the model 
plot(impact3)

