library(dplyr)
data<- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
data$Date<-as.Date(data$Date,"%d/%m/%y")
data_test<-subset(data, Date>=as.Date("01-02-2007"))
hist(data_test$Global_active_power,main="Global_active_power", xlab="Global_active_power(In Kilowatts)", col="red")
dev.copy(png,"PLOT.png")
dev.off()


