initial <- read.table("household_power_consumption.txt", sep= ";", nrows=5000, 
                      header = TRUE)
classes <- sapply(initial, class)
data <- read.table("household_power_consumption.txt", sep = ";", colClasses=classes,
                   na.strings = "?",header=TRUE)
library(data.table)
data<-data.table(data)
#setkey(data,Date)
subdata<-data[as.Date(data$Date,"%d/%m/%Y") >= as.Date(c("01/02/2007"),"%d/%m/%Y") & 
                      as.Date(data$Date,"%d/%m/%Y") <= as.Date(c("02/02/2007"), "%d/%m/%Y"),]
#Plot 1
par(mfrow=c(1,1))
hist(subdata$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)",yaxs="d",ylim=c(0,1200))

dev.copy(png,file='Plot1.png')
dev.off()