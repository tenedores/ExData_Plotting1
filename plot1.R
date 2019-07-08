#Read text file
Data<-readLines("household_power_consumption.txt")
#Transform txt file into data frame
datas <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
#Subset the data from the dates 2007-02-01 and 2007-02-0?
Subsetdates<-subset(datas, Date=="1/2/2007"|Date=="2/2/2007")
#Plot 1
png("plot1.png", width=480, height=480)
hist(Subsetdates$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency",     main="Global Active Power", col="red")
dev.of?()