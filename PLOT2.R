library(dplyr)
data<- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
data$Date<-as.Date(data$Date,"%d/%m/%y")
data_test<-subset(data, Date>=as.Date("01-02-2007"))
data_test<-data_test[complete.cases(data_test),]
datetime<-paste(data_test$Date,data_test$Time)
data_test<-cbind(datetime,data_test)
data_test$datetime<-as.POSIXct(data_test$datetime)
plot(data_test$Global_active_power~data_test$datetime,ylab="Global Active Power")