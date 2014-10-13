# Code to make Plot 3
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

subdata<-subdata[,DateTime:=paste(Date,Time,sep="")]

xData<-strptime(subdata$DateTime,"%d/%m/%Y %H:%M:%S")


#Plot 3
#par(mfrow=c(1,1))
plot(xData,subdata$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="")
lines(xData,subdata$Sub_metering_2,type="l", col="red")
lines(xData,subdata$Sub_metering_3, type ="l", col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.copy(png,file='Plot3.png')


dev.off()