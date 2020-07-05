# Exercise 1

dados <- read.csv('C:/Users/victo/Documents/Githut/Johns-Hopkins-DataScience/hw1_data.csv')
df <- data.frame(dados)


# Preview First/Last
head(df)
tail(df)


# Remove Nulls
good <- complete.cases(df$Ozone,df$Solar.R,df$Wind,df$Temp,df$Month,df$Day)
good_df <- df[good,]


# Number Rows
nrow(df)


# Row 47
df[47,]

# FInd How many nulls
oz <- df$Ozone
length(oz)
nulls <- is.na(oz)
oz_bad <- oz[nulls]
length(oz_bad)


# Mean OZ
oz_good <- oz[!nulls]
mean(oz_good)


# Subset with Conditions to get Mean
bar <- subset(df, Ozone > 31 & Temp > 90)
solar_bar <- bar$Solar.R
mean(solar_bar)


# Subset month 6
bar2 <- subset(df, Month == 6)
temp_bar <- bar2$Temp
mean(temp_bar)


# 
# Subset month 6 / Max value 
bar3 <- subset(df, Month == 5)
Ozone_bar <- bar3$Ozone
max(Ozone_bar, na.rm = TRUE)
