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
powerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
# Filter Sub DataSet Dates 2007-02-01 and 2007-02-02
powerDT <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

# Size Plot
png("plot1.png", width=480, height=480)
# Plot 1
hist(powerDT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
# Turn off
dev.off()