#ExData_Plotting1_Plot1

#load data and subset for two days
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data_b <- subset(data, data$Date >= "2007-02-01" & Date <= "2007-02-02")

#plot histogram
hist(data_b$Global_active_power,xlab="Global Active Power (kilowatts)",
  main="Global Active Power",col="red")

#export graph as png
dev.copy(png,'plot1.png',width=480,height=480)
dev.off()



