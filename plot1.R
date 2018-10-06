# create the Global Active Power plot

png("plot1.png")
data<-read.csv("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE)
data$Date<-as.Date(strptime(data$Date,"%d/%m/%Y"))
# filter days
d1<-as.Date("2007-02-01","%Y-%m-%d") 
d2<-as.Date("2007-02-02","%Y-%m-%d")
data<-data[which(data$Date==d1 | data$Date==d2),]
# plot histogram
hist(as.numeric(data$Global_active_power),
     xlab="Global Active Power (kilowatts)",ylab="Frequency",col = "red",
     main="Global Active Power",xlim=c(0,6),ylim=c(0,1200))
dev.off()