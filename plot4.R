#ExData_Plotting1_Plot3

#load data and subset for two days
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data_b <- subset(data, data$Date >= "2007-02-01" & Date <= "2007-02-02")

#create datetime column
datetime <- paste(as.Date(data_b$Date), data_b$Time)
data_b$Datetime <- as.POSIXct(datetime)

par(mfcol=c(2,2))
#plot 1 global active power by datetime
plot(data_b$Datetime,data_b$Global_active_power,type="l",xlab="",ylab="Global Active Power")

#plot 2 sub metering values by datetime
plot(data_b$Datetime,data_b$Sub_metering_1,type="l",xlab="",ylab="Engery sub metering")
points(data_b$Datetime,data_b$Sub_metering_2,type="l",col="red")
points(data_b$Datetime,data_b$Sub_metering_3,type="l",col="blue")
legend("topright",lty = c(1,1),col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty="n",cex=0.8)

#plot 3 voltage by datetime
plot(data_b$Datetime,data_b$Voltage,type="l",xlab="datetime",ylab="Voltage")

#plot 4 global reactive power by datetime
plot(data_b$Datetime,data_b$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

#export graph as png
dev.copy(png,'plot4.png',width=480,height=480)
dev.off()