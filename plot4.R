##Reading data where Date is between 2/1/2007 and 2/2/2007
data <- read.csv.sql("./data/household_power_consumption.txt", 
                     sql = "Select * from file where Date in ('1/2/2007','2/2/2007')", 
                     header = TRUE, sep = ";")
closeAllConnections()
data$Date_Time <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

##Plot 4
png("C:/Users/whuang/Documents/ExploratoryData_Project1/plot4.png", width = 480, height = 480)
par(mfrow= c(2,2))
with(data, 
     {
             plot(Date_Time, Global_active_power, type = "l",  xlab = "", ylab = "Global Active Power")
             plot(Date_Time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
             plot(Date_Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
             lines(Date_Time, Sub_metering_2, col = "red")
             lines(Date_Time, Sub_metering_3, col = "blue")
             legend("topright", lty = 1, bty = "n", cex = 0.8, col = c("black", "red", "blue"), legend = names(data[c(7:9)]))
             plot(Date_Time, Global_reactive_power, type = "l", xlab = "datetime", ylab = names(data[4]))
     }
     )

dev.off()