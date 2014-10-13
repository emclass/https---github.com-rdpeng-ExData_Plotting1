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
#Plot 2
par(mfrow=c(1,1))
subdata<-subdata[,DateTime:=paste(Date,Time,sep="")]
xData<-strptime(subdata$DateTime,"%d/%m/%Y %H:%M:%S")
plot(xData,subdata$Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.copy(png,file='Plot2.png')
dev.off()