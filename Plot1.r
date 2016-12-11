#Download file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "test.zip", mode = "wb");
unzip("test.zip");

#read the data
dataset <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE);	

#Set the column to Date
dataset$Date = as.Date(dataset$Date, format = "%d/%m/%Y");

#Filter out the right data
dataset <- dataset[dataset$Date == "2007-02-01" | dataset$Date == "2007-02-02",];

#Make column numeric
dataset$Global_active_power = as.numeric(dataset$Global_active_power);

#Open Graphics Device
png(file = "plot1.png", width = 480, height = 480);

#Make plot
hist(dataset$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)");

#Close Graphics Device
dev.off();
