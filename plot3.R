# Library Necesary
library("data.table")
# Work directory
setwd("C:/Users/ALs/Desktop/Coursera/CourseraCienciaDatosR/04_Exploratory Data analysis/week1/trabajo1/data")

# Reads dataBase the data for specified dates
# Make a Sub DataSet
powerDT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?" )

# Prevents the scientific notation
powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
# Change Date Column to Date Type
powerDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
# Filter Sub DataSet Dates 2007-02-01 and 2007-02-02
powerDT <- powerDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

# Size Plot
png("plot3.png", width=480, height=480)
# Plot 3
plot(powerDT[, dateTime], powerDT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(powerDT[, dateTime], powerDT[, Sub_metering_2],col="red")
lines(powerDT[, dateTime], powerDT[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))
# Turn off plot
dev.off()