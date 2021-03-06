
## Getting Electric dataset
electric_data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
electric_data$Date <- as.Date(electric_data$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(electric_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(electric_data)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Generate Plot 1
plot(data$Global_active_power~data$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")

## Save Plot to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()