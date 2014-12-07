rawdata <- read.csv("household_power_consumption.txt", header=TRUE,sep=";",na.strings="?")     #Read raw data
data1 <- subset(rawdata,as.Date(as.character(Date),format="%d/%m/%Y") > as.Date("31/01/2007",format="%d/%m/%Y"))
data <- subset(data1,as.Date(as.character(Date),format="%d/%m/%Y") < as.Date("03/02/2007",format="%d/%m/%Y"))            #data in right time frame

date <- as.character(data$Date)
time <- as.character(data$Time)
datetime <- paste(date,time)
datetime <- strptime(datetime,format="%d/%m/%Y %H:%M:%S")       #make datetime variable

plot(datetime,as.numeric(data$Sub_metering_1),type="l",xlab="",ylab="Energy sub metering")
points(datetime,as.numeric(data$Sub_metering_2),type="l",col="red" )
points(datetime,as.numeric(data$Sub_metering_3),type="l",col="purple")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","purple"))

dev.copy(png,file="plot3.png")
dev.off()