#ExData_Plotting1_Plot2

#load data and subset for two days
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data_b <- subset(data, data$Date >= "2007-02-01" & Date <= "2007-02-02")

#create datetime column
datetime <- paste(as.Date(data_b$Date), data_b$Time)
data_b$Datetime <- as.POSIXct(datetime)

#plot global active power and datetime
plot(data_b$Datetime,data_b$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

#export graph as png
dev.copy(png,'plot2.png',width=480,height=480)
dev.off()