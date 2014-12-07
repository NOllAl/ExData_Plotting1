rawdata <- read.csv("household_power_consumption.txt", header=TRUE,sep=";",na.strings="?")     #Read raw data
data1 <- subset(rawdata,as.Date(as.character(Date),format="%d/%m/%Y") > as.Date("31/01/2007",format="%d/%m/%Y"))
data <- subset(data1,as.Date(as.character(Date),format="%d/%m/%Y") < as.Date("03/02/2007",format="%d/%m/%Y"))            #data in right time frame

hist(as.numeric(data$Global_active_power),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power",breaks=13)
dev.copy(png,file="plot1.png")
dev.off()