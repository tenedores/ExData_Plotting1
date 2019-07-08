#Transform txt file into data frame
datas <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
#Subset the data from the dates 2007-02-01 and 2007-02-02
Subsetdates<-subset(datas, Date=="1/2/2007"|Date=="2/2/2007")
#Combine date and time into single posix column with lubridate
install.packages("lubridate")
library(lubridate)
Subsetdates$date_time = dmy_hms(paste(Subsetdates$Date, Subsetdates$Time))
#Plot 3
png("plot3.png", width = 480, height = 480)
plot(Subsetdates$date_time,Subsetdates$Sub_metering_1, 
     xlab = NA,
     ylab = "Energy sub metering",
     type = "l", 
     frame.plot = TRUE)
#add Sub_metering 2 and 3 in red and blue
points(Subsetdates$date_time,Subsetdates$Sub_metering_2, type = "l", col = "red")
points(Subsetdates$date_time,Subsetdates$Sub_metering_3, type = "l", col = "blue")
#add legend
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()
