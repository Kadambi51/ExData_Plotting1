library(dplyr)
data<- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
data$Date<-as.Date(data$Date,"%d/%m/%y")
data_test<-subset(data, Date>=as.Date("01-02-2007"))
data_test<-data_test[complete.cases(data_test),]
datetime<-paste(data_test$Date,data_test$Time)
data_test<-cbind(datetime,data_test)
data_test$datetime<-as.POSIXct(data_test$datetime)
with(data_test,{
  plot(Sub_metering_1~datetime,ylab="Global Active Power(kilowatts)",col="black")
  plot(Sub_metering_2~datetime,col="red")
  plot(Sub_metering_3~datetime,col="blue")
  legend("topright",pch=1,col=c("black","red","blue"),legends=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})