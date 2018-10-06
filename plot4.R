# create the the combined plot

png("plot4.png")

data<-read.csv("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE)
data$DateF<-as.Date(strptime(data$Date,"%d/%m/%Y"))

# filter days
d1<-as.Date("2007-02-01","%Y-%m-%d") 
d2<-as.Date("2007-02-02","%Y-%m-%d")
data<-data[which(data$DateF==d1 | data$DateF==d2),]
# add datetime
data$Datetime<-(strptime(paste(data$Date," ",data$Time),"%d/%m/%Y %H:%M:%S"))
# to num
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)
data$Voltage<-as.numeric(data$Voltage)
data$Global_active_power<-as.numeric(data$Global_active_power)
# plot
par(mfrow=c(2,2))
#1
plot(data$Datetime,data$Global_active_power,type="l",
     ylab="Global Active Power",xlab="")
#2
plot(data$Datetime,data$Voltage,type="l",
     ylab="Voltage",xlab="datetime")
#3
plot(data$Datetime,data$Sub_metering_1,type="l",
     ylab="Energy Sub Metering",xlab="",col="black")

lines(data$Datetime,data$Sub_metering_2,col="red")
lines(data$Datetime,data$Sub_metering_3,col="blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=c(1,1,1))
#4
plot(data$Datetime,data$Global_reactive_power,type="l",xlab="datetime",
     ylab="Global_reactive_power")

dev.off()