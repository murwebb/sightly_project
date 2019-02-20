library(plyr)
library(tidyverse)

AdChanges <- read.csv('~/Projects/adwords-data/131-998-6695/Ad Changes 131-998-6695.csv', header = T, 
         nrows = 10000, stringsAsFactors = F) #shows changes in the campaign at a cost level
AdScheduleReport <- read.csv('~/Projects/adwords-data/131-998-6695/Ad schedule report 131-998-6695.csv', header = T, 
                             nrows = 10000, stringsAsFactors = F, skip = 2)
TargetedLocationReport <- read.csv('~/Projects/adwords-data/131-998-6695/Targeted location report 131-998-6695.csv', header = T, 
                                   stringsAsFactors = F, skip = 2)
CampaignChangesReport <- read.csv('~/Projects/adwords-data/131-998-6695/Campaign Changes 131-998-6695.csv', header = T, 
                                   stringsAsFactors = F) #campaign budget changes
AudienceReport <- read.csv('~/Projects/adwords-data/131-998-6695/Audience report 131-998-6695.csv', header = T, 
                                  stringsAsFactors = F, skip = 2) 
DisplayVideoKWReport <- read.csv('~/Projects/adwords-data/131-998-6695/Display video keyword report 131-998-6695.csv', header = T, 
                           stringsAsFactors = F, skip = 2) 
AgeReport <- read.csv('~/Projects/adwords-data/131-998-6695/Age report 131-998-6695.csv', header = T, 
                                 stringsAsFactors = F, skip = 2) 

#CustomerCampaignAdGroupDefinition.csv
custCampAdGroupDef <- read.csv('~/Downloads/CustomerCampaignAdGroupDefinition.csv', header = T, 
         nrows = 10000, stringsAsFactors = F)


#capOne folder
GeoData <- read.csv('~/Projects/adwords-data/CapOneData/Geo.csv', header = F, 
                    nrows = 10000, stringsAsFactors = F)
AdGroup <- read.csv('~/Projects/adwords-data/CapOneData/AdGroup.csv', header = F, stringsAsFactors = F)

AdDevice <- read.csv('~/Projects/adwords-data/CapOneData/AdsAndDevices.csv', header = F, stringsAsFactors = F)

AgeRange <- read.csv('~/Projects/adwords-data/CapOneData/AgeRange.csv', header = F,  stringsAsFactors = F)

Gender <- read.csv('~/Projects/adwords-data/CapOneData/Gender.csv', header = F, stringsAsFactors = F)

names(Gender) <-c('GenderStatsId' 
,'AdGroupId' 
,'CampaignId' 
,'Clicks' 
,'Cost' 
,'GenderName' 
,'Impressions'
,'PulledDate'
,'StatDate'
,'TotalViews'
,'CustomerId')

names(AdDevice) <- c('AdDeviceStatsId'
                       ,'AdGroupId'
                       ,'AdId'
                       ,'AdName'
                       ,'CampaignId'
                       ,'CampaignName'
                       ,'Clicks'
                       ,'Cost'
                       ,'Device'
                       ,'Impressions'
                       ,'PulledDate'
                       ,'StatDate'
                       ,'TotalViews'
                       ,'AudienceRetention25'
                       ,'AudienceRetention50'
                       ,'AudienceRetention75'
                       ,'AudienceRetention100'
                       ,'Aud25xImpressions'
                       ,'Aud50xImpressions'
                       ,'Aud75xImpressions'
                       ,'Aud100xImpressions'
                       ,'CustomerId')



names(AdGroup) <- c('AdGroupStatsId',
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
                    'CustomerId')


names(AgeRange) <- c('AgeRangeStatsId',
                     'AdGroupId',
                     'AgeRangeName',
                     'CampaignId',
                     'Clicks',
                     'Cost',
                     'Impressions',
                     'PulledDate',
                     'StatDate',
                     'TotalViews',
                     'CustomerId')

names(GeoData) <- c('GeoStatsId',
                    'AdGroupId',
                    'AdGroupName',
                    'CampaignId',
                    'CampaignName',
                    'CountryTerritory',
                    'City',
                    'Region',
                    'MetroArea',
                    'MostSpecificLocation',
                    'StatDate',
                    'Impressions',
                    'TotalViews',
                    'Clicks',
                    'Cost',
                    'PulledDate',
                    'CustomerId')

AdDeviceGroup <- merge.data.frame(AdDevice, AdGroup, by = 'CampaignId', type='inner')
#mapping file merge to ad group
adGroupCustMerge <- merge(AdGroup, custCampAdGroupDef, by.x = 'AdGroupId', by.y = 'Ad.group.ID')
#merge in  changes...

