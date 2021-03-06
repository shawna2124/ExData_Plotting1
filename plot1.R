# Read the full household power consumption data (previously downloaded file)
data1<-read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")

# The data of interest spans the dates 2007-02-01 to 2007-02-02
data2<-data1[with(data1, Date=="1/2/2007"|Date=="2/2/2007"), ]

#Convert the individual Data and Time variables to a combined DateTime variable
data2$DateTime <- strptime(paste(data2$Date, data2$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")

#Construct Plot 1 - a histogram of Global Active Power
plot1 <- with(data2, hist(Global_active_power, xlab="Global Active Power (kilowatts)",
              ylab="Frequency", main="Global Active Power", col="red"))

#Print Plot 1 to a PNG file
dev.copy(png, file = "plot1.png") #Copy my plot to a PNG file
dev.off() 
