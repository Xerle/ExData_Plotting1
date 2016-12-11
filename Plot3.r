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
dataset$Sub_metering_1 = as.numeric(dataset$Sub_metering_1);
dataset$Sub_metering_2 = as.numeric(dataset$Sub_metering_2);
dataset$Sub_metering_3 = as.numeric(dataset$Sub_metering_3);

#Open Graphics Device
png(file = "plot3.png", width = 480, height = 480);

#Make a plot without points
plot(dataset$Time, dataset$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")

#Add the lines in the plot
lines(dataset$Time, dataset$Sub_metering_1, type="l")
lines(dataset$Time, dataset$Sub_metering_2, type="l", col = "red")
lines(dataset$Time, dataset$Sub_metering_3, type="l", col = "blue")

#Add legend
legend("topright", lty = c(1,1), lwd= c(2.5,2.5), col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


#Close Graphics Device
dev.off();