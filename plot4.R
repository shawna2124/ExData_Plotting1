#THE FIRST THREE LINES OF CODE ARE IDENTICAL TO PLOT1.R - READS IN THE DATA FOR PLOTTING
# Read the full household power consumption data (previously downloaded file)
data1<-read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")

# The data of interest spans the dates 2007-02-01 to 2007-02-02
data2<-data1[with(data1, Date=="1/2/2007"|Date=="2/2/2007"), ]

#Convert the individual Data and Time variables to a combined DateTime variable
data2$DateTime <- strptime(paste(data2$Date, data2$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")

#Construct plot 4 - a 4 panel plot 
par(mfrow = c(2, 2))
with(data2, {
  plot(DateTime, Global_active_power, type="l", xlab = "",
                   ylab="Global Active Power")
  plot(DateTime, Voltage, type = "l", xlab="datetime") #changing xlab from default variable name DateTime to correct capitalization
  with(data2, plot(DateTime, Sub_metering_1, type = "n", xlab="", ylab="Enery sub metering"))
  with(data2, lines(DateTime, Sub_metering_1,col = "black"))
  with(data2,lines(DateTime, Sub_metering_2,col = "red"))
  with(data2,lines(DateTime, Sub_metering_3,col = "blue"))
  legend("topright",  lty="solid",bty="n", cex=.5,y.intersp=.5,col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  plot(DateTime,Global_reactive_power,type="l",xlab="datetime") #changing xlab from default variable name DateTime simply to correct capitalization
})

#Print Plot 4 to a PNG file
dev.copy(png, file = "plot4.png")
dev.off() 
