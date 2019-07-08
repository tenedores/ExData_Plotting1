#Transform txt file into data frame
datas <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
#Subset the data from the dates 2007-02-01 and 2007-02-02
Subsetdates<-subset(datas, Date=="1/2/2007"|Date=="2/2/2007")
#Pl?t 2 
#Combine date and time into single posix column with lubridate
install.packages("lubridate")
library(lubridate)
Subsetdates$date_time = dmy_hms(paste(Subsetdates$Date, Subsetdates$Time))
png("plot2.png", width = 480, height = 480)
plot(Subsetdates$dat?_time,Subsetdates$Global_active_power, 
     xlab =NA,
     ylab = "Global Active Power (kilowatts)",
     type = "l", 
     frame.plot = TRUE)
dev.off()

