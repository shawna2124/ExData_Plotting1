#THE FIRST THREE LINES ON CODE ARE THE SAME AS plot1.R
# Read the full household power consumption data (previously downloaded file)
data1<-read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")

# The data of interest spans the dates 2007-02-01 to 2007-02-02
data2<-data1[with(data1, Date=="1/2/2007"|Date=="2/2/2007"), ]

#Convert the individual Data and Time variables to a combined DateTime variable
data2$DateTime <- strptime(paste(data2$Date, data2$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")

#Construct Plot 3  - a multi-line chart of Energy sub metering
#(1-kitchen, 2-laundry, 3-water heater and air condition) by day / time
Plot3 <- with (data2, plot(DateTime, Sub_metering_1)),xlab="WHAT", ylab="Global Active Power (kilowatts)",
     main="SOMETHING",whatelse?)

#Set up plot 3
with(data2, plot(DateTime, Sub_metering_1, type = "n", xlab="", ylab="Enery sub metering"))
with(data2, lines(DateTime, Sub_metering_1,col = "black"))
with(data2,lines(DateTime, Sub_metering_2,col = "red"))
with(data2,lines(DateTime, Sub_metering_3,col = "blue"))

# add a legend 
legend("topright", pch = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

#Print Plot 3 to a PNG file
dev.copy(png, file = "plot3.png") ## Copy my plot to a PNG file
dev.off() 
