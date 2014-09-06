# get the original data
projectone<-read.table("./household_power_consumption.txt", header=T,sep=";",na.strings = "?")
# omit NA value
omit.NA.projectone<-na.omit(projectone)
# subsetting the data
subprojectone<-subset(omit.NA.projectone,Date=="1/2/2007"|Date=="2/2/2007")
# converting the date
subprojectone$Date<-as.Date(subprojectone$Date,format="%d/%m/%Y")
# add new column
subprojectone$DwT<-paste(subprojectone$Date,subprojectone$Time)
# converting the date using as.POXIXct() function
subprojectone$DwT <- as.POSIXct(subprojectone$DwT)
# creating Plot 4
par(mfcol=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(subprojectone$Global_active_power~subprojectone$DwT, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
plot(subprojectone$Sub_metering_1 ~ subprojectone$DwT, type="l",
     ylab="Energy sub metering", xlab="")
lines(subprojectone$Sub_metering_2~subprojectone$DwT,col="red")
lines(subprojectone$Sub_metering_3~subprojectone$DwT,col="blue")
legend("topright",bty="n",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),cex=0.5)
plot(subprojectone$Voltage~subprojectone$DwT, type="l", ylab="Voltage (volt)", xlab="datetime")
plot(subprojectone$Global_reactive_power~subprojectone$DwT, type="l", ylab="Global_reactive_power", xlab="datetime")
# saving to PNG file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
