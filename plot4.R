## The script assumes that the load_data.R is contained in the current R 
## working directory which in turn assumes that unzipped data has already been
## downloaded. If not, then please follow the instructions in load_data.R file
## to download the dataset into the current R working directory.

## load data using load_data.R
source("load_data.R")

## open device
png(filename="plot4.png", width=480, height=480)

## plot options
par(mfrow=c(2,2))

## subplot(1, 1)
plot(data$global_active_power ~ data$datetime, 
     ylab="Global Active Power (kilowatts)", xlab="", type="l")

## subplot(1, 2)
plot(data$voltage ~ data$datetime, ylab="Voltage", 
     xlab="datetime", type="l")

## subplot(2, 1)

## initialize plot:
plot(apply(data[c("sub_metering_1", "sub_metering_2", "sub_metering_3")], 1, max) ~ 
             data$datetime, ylab="Energy sub metering", xlab="", type="n")

## plot sub_metering_1
lines(data$sub_metering_1 ~ data$datetime, col="black")

## plot sub_metering_2:
lines(data$sub_metering_2 ~ data$datetime, col="red")

## plot time series sub_metering_3:
lines(data$sub_metering_3 ~ data$datetime, col="blue")

## add legend:
legend("topright", lty=1, col=c("black", "red", "blue"), 
       legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"), bty = "n")

## subplot(2, 2)
plot(data$global_reactive_power ~ data$datetime, ylab="Global_reactive_power", 
     xlab="datetime", type="l")

## close device:
dev.off()