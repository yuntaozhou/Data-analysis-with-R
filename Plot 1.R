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
# creating Plot 1
hist(subprojectone$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
# saving to PNG file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
