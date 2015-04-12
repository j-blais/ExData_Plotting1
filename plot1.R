#download and import the data
if(!file.exists("Electric Power Consumption.zip")){file.create("Electric Power Consumption.zip")}
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="Electric Power Consumption.zip", mode="wb")
power <- read.csv(unzip("Electric Power Consumption.zip"), stringsAsFactors=FALSE, sep=";")

#subset the dataframe to the needed dates and convert date and time
powerSub <- subset(power, Date == "1/2/2007"| Date == "2/2/2007" )
powerSub$datetime <- strptime(paste(powerSub$Date, powerSub$Time), format="%d/%m/%Y%H:%M:%S")

#open the png graphing device
png(filename = "plot1.png", width=480, height=480)

#create histogram
Hist1 <- hist(as.numeric(powerSub$Global_active_power), breaks=12, col= "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")

#don't forget to close dev.off
dev.off()
