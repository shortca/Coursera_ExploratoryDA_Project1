
rplot4 <- function() {
        my_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                            check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
        my_data$Date <- as.Date(my_data$Date, format="%d/%m/%Y")
        ## Subsetting the data
        data <- subset(my_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
        rm(my_data)
        ## Converting dates
        datetime <- paste(as.Date(data$Date), data$Time)
        data$Datetime <- as.POSIXct(datetime)
        
        
        png("Plot4.png", height=480,width=480)
        par(mfrow=c(2,2))
        #1st plot
        plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        
        #2nd plot
        plot(data$Voltage~data$Datetime, type="l",ylab="Voltage",xlab="datetime")
        
        #3rd plot        
        plot(data$Sub_metering_1~data$Datetime, type="l", ylab="Energy sub metering",xlab="")        
        lines(data$Sub_metering_2~data$Datetime,col="red")
        lines(data$Sub_metering_3~data$Datetime,col="blue")
        legend("topright", col=c("black","red","blue"),legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1))
        
        #4th plot
        plot(data$Global_active_power~data$Datetime, type="l", ylab="Global_active_power", xlab="datetime",ylim=c(0,0.5))
        
        dev.off()
        
}