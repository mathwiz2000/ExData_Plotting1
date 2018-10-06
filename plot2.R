# create the Global Active Power plot

png("plot2.png")

data<-read.csv("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE)
data$DateF<-as.Date(strptime(data$Date,"%d/%m/%Y"))

# filter days
d1<-as.Date("2007-02-01","%Y-%m-%d") 
d2<-as.Date("2007-02-02","%Y-%m-%d")
data<-data[which(data$DateF==d1 | data$DateF==d2),]
# add datetime
data$Datetime<-(strptime(paste(data$Date," ",data$Time),"%d/%m/%Y %H:%M:%S"))

data$Global_active_power<- as.numeric(data$Global_active_power)

plot(data$Datetime,data$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",xlab="")

dev.off()