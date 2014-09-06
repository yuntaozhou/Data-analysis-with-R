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
# creating Plot 3
plot(subprojectone$Sub_metering_1 ~ subprojectone$DwT, type="l",
     ylab="Energy sub metering", xlab="")
lines(subprojectone$Sub_metering_2~subprojectone$DwT,col="red")
lines(subprojectone$Sub_metering_3~subprojectone$DwT,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
# saving to PNG file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
