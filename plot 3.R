library(sqldf)
library(lubridate)

setwd("../../../../Coursera/")

data <- read.csv.sql("exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";",
                     sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")



Date<-data[,1]
Time<-data[,2]


DateTime<-strptime(paste(data=Date,Time), "%d/%m/%Y %H:%M:%S")
DateTime<-as.POSIXct(DateTime)


#### Plot 3 ####
png("plot3.png",width = 480,height = 480)
plot(x=DateTime,data[,7],type="l",ylab="Energy sub metering",xlab="")
lines(x=DateTime,y=data[,8],col="red")
lines(x=DateTime,data[,9],col="blue")
legend("topright",lty=1,  col=1:3,  c("sub_metering_1","sub_metering_2","sub_metering_3"))
dev.off()