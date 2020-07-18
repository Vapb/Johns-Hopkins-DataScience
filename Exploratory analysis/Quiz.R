download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv', destfile = 'quiz1.csv')
df <- fread('quiz1.csv')
names(df)

# VAl more than 1000
big <- df[df$VAL == 24,]
length(big$RT)

#
library(xlsx)
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx', destfile = 'Quiz2.xlsx', mode = 'wb')
dat <- read.xlsx("quiz1.xlsx", sheetIndex = 1, colIndex = 7:15, rowIndex = 18:23, header = TRUE)
df <- read.xlsx("quiz1.xlsx", sheetIndex = 1, header = TRUE)
df <- df[18:23,7:15]
sum(dat$Zip*dat$Ext,na.rm=T)
sum(df$Zip*dat$Ext,na.rm=T)
dat
df

# 

download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml', destfile = 'Quiz3.xml')
doc <- xmlTreeParse("Quiz3.xml", useInternal=TRUE)
root_node <- xmlRoot(doc)
zips <- xpathApply(root_node,"//zipcode",xmlValue)
length(zips)
zips <- zips[zips == '21231']
length(zips)
