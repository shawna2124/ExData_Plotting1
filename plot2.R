#THE FIRST THREE LINES OF CODE ARE REPEATED FROM PLOT1.R TO LOAD IN DATA AND PREPARE IT FOR PLOTTING PLOT 2
# Read the full household power consumption data (previously downloaded file)
data1<-read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")

# The data of interest spans the dates 2007-02-01 to 2007-02-02
data2<-data1[with(data1, Date=="1/2/2007"|Date=="2/2/2007"), ]

#Convert the individual Data and Time variables to a combined DateTime variable
data2$DateTime <- strptime(paste(data2$Date, data2$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")

#Construct Plot 2 - a line chart of Global Active Power (kilowatts) by day (and hours) for 2 days
Plot2 <- with(data2, plot(DateTime, Global_active_power, type="l", xlab = "",
                 ylab="Global Active Power (kilowatts)"))

#Print Plot 2 to a PNG file
dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off() 
