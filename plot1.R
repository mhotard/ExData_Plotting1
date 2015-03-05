

#should be run in the directory with household_power_consumption.txt

#first loads in some of the data, roughly where the data we want is
#I experimented and found the general rows in the data that contain the dates we want to analyze

DT <- read.table("household_power_consumption.txt", skip=66000, nrow=5000, header=TRUE, sep=";")

#also have to load in the headers since the skip skipped them
DT_header <- read.table("household_power_consumption.txt", nrow=1, header=TRUE, sep=";")

#combines the headers back on
names(DT) <- names(DT_header)

#subsets to the exact dates we want to analyze
data <- DT[DT$Date == "2/2/2007" | DT$Date == "1/2/2007",]



#changes the date and time format to date and time
#data[,1] <- as.Date(data[,1], format = "%d/%m/%Y")
#strptime(data$Time, format= "%H:%M:%S")

#combines the date and time format
data$datetime <- paste(data$Date, data$Time)

#makes datetime format what we want
data$datetime <- strptime(data$datetime, "%Y-%m-%d %H:%M:%S")

#sets some basic parameters for the charts
par(pin = c(50,50), mar=c(5,5,2,1))



#plot one

png("plot1.png", height=480, width=480, unit="px")
hist(data$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()

