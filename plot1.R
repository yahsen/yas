library(sqldf)
library(lubridate)

setwd("../../../../Coursera/")

data <- read.csv.sql("exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";",
                     sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")



Date<-data[,1]
Time<-data[,2]


DateTime<-strptime(paste(data=Date,Time), "%d/%m/%Y %H:%M:%S")
DateTime<-as.POSIXct(DateTime)


#### Plot 1 ####
png("plot1.png",width = 480,height = 480)
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()