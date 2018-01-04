plotData<-read.table("household_power_consumption.txt", header=T,sep=";",
na.strings="?", colClasses=c('character','character','numeric','numeric','numeric'
,'numeric','numeric','numeric','numeric'))

## Filter data from the dates 2007-02-01 and 2007-02-02

getdata<-plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]

##getdata<-subset(plotData,Date>="1/2/2007"&Date<="2/2/2007")

## Combine Data and Time column

dateTime<- strptime(paste(getdata$Date,getdata$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

## Add dateTime column

plotData<-cbind(dateTime,getdata)

## Create Plot 3

with(plotData,{
  plot(Sub_metering_1~dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
})
legend("topright",col=c("black","red","blue"),lwd=c(1,1,1),
  c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Save as png.file

dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()

