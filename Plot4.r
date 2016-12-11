#Download file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "test.zip", mode = "wb");
unzip("test.zip");

#read the data
dataset <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE);	

#Set the column to Date
dataset$Date = as.Date(dataset$Date, format = "%d/%m/%Y");

#Filter out the right data
dataset <- dataset[dataset$Date == "2007-02-01" | dataset$Date == "2007-02-02",];

#Set the column to date/time
dataset$Time = strptime(paste(dataset$Date, dataset$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")

#Make column numeric
dataset$Global_active_power = as.numeric(dataset$Global_active_power);
dataset$Voltage = as.numeric(dataset$Voltage);
dataset$Global_reactive_power = as.numeric(dataset$Global_reactive_power);
dataset$Sub_metering_1 = as.numeric(dataset$Sub_metering_1);
dataset$Sub_metering_2 = as.numeric(dataset$Sub_metering_2);
dataset$Sub_metering_3 = as.numeric(dataset$Sub_metering_3);

#Open Graphics Device
png(file = "plot4.png", width = 480, height = 480);

#Change the number of graphs on the graphics device
par(mfrow = c(2,2))

#Make the first plot

#Make the first plot without points
plot(dataset$Time, dataset$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power")

#Add the lines in the plot
lines(dataset$Time, dataset$Global_active_power, type="l")

#Make the second plot without points 
plot(dataset$Time, dataset$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")

#Add the lines in the plot
lines(dataset$Time, dataset$Voltage, type="l")

#Make the thirth graph
plot(dataset$Time, dataset$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")

#Add the lines in the plot
lines(dataset$Time, dataset$Sub_metering_1, type="l")
lines(dataset$Time, dataset$Sub_metering_2, type="l", col = "red")
lines(dataset$Time, dataset$Sub_metering_3, type="l", col = "blue")

#Add legend
legend("topright", lty = c(1,1), bty = "n", lwd= c(2.5,2.5), col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Make the fourth plot without points
plot(dataset$Time, dataset$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")

#Add the lines in the plot
lines(dataset$Time, dataset$Global_reactive_power, type="l")

#Close Graphics Device
dev.off();