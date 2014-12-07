rawdata <- read.csv("household_power_consumption.txt", header=TRUE,sep=";",na.strings="?")     #Read raw data
data1 <- subset(rawdata,as.Date(as.character(Date),format="%d/%m/%Y") > as.Date("31/01/2007",format="%d/%m/%Y"))
data <- subset(data1,as.Date(as.character(Date),format="%d/%m/%Y") < as.Date("03/02/2007",format="%d/%m/%Y"))            #data in right time frame

date <- as.character(data$Date)
time <- as.character(data$Time)
datetime <- paste(date,time)
datetime <- strptime(datetime,format="%d/%m/%Y %H:%M:%S")       #make datetime variable
globa <- data$Global_active_power

plot(datetime,globa,xlab="",ylab="Global active power (kilowatts)",type="l")
dev.copy(png,file="plot2.png")
dev.off()