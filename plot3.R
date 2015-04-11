#download and import the data
if(!file.exists("Electric Power Consumption.zip")){file.create("Electric Power Consumption.zip")}
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="Electric Power Consumption.zip", mode="wb")
power <- read.csv(unzip("Electric Power Consumption.zip"), stringsAsFactors=FALSE, sep=";")

#subset the dataframe to the needed dates and convert date and time
powerSub <- subset(power, Date == "1/2/2007"| Date == "2/2/2007" )
powerSub$datetime <- strptime(paste(powerSub$Date, powerSub$Time), format="%d/%m/%Y%H:%M:%S")

#open the png graphing device
png(filename = "plot3.png", width=480, height=480)

#create plot
with(powerSub,plot(datetime,Sub_metering_1, type="l",ylab="Energy sub metering",xlab=""))
with(powerSub, lines(datetime,Sub_metering_2, col="red"))
with(powerSub, lines(datetime,Sub_metering_3, col="blue"))
meters <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright",lty=1, col=c("black","red","blue"), legend = meters, cex=.8)

#don't forget to close dev.off
dev.off()
