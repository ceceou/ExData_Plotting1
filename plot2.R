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

## Create Plot 2

plot(plotData$Global_active_power~plotData$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Save as png.file

dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()

