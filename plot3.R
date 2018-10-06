# create the sub metering plot

png("plot3.png")

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

# plot
plot(data$Datetime,data$Sub_metering_1,type="l",
     ylab="Energy Sub Metering",xlab="",col="black")

lines(data$Datetime,data$Sub_metering_2,col="red")
lines(data$Datetime,data$Sub_metering_3,col="blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=c(1,1,1))
dev.off()