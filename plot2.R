##Reading data where Date is between 2/1/2007 and 2/2/2007
data <- read.csv.sql("./data/household_power_consumption.txt", 
                     sql = "Select * from file where Date in ('1/2/2007','2/2/2007')", 
                     header = TRUE, sep = ";")
closeAllConnections()
data$Date_Time <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

##Plot 2
png("C:/Users/whuang/Documents/ExploratoryData_Project1/plot2.png", width = 480, height = 480)
plot(data$Date_Time, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()