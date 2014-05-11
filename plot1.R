## The script assumes that the load_data.R is contained in the current R 
## working directory which in turn assumes that unzipped data has already been
## downloaded. If not, then please follow the instructions in load_data.R file
## to download the dataset into the current R working directory.

## load data using load_data.R
source("load_data.R")

## open device:
png(filename="plot1.png", width=480, height=480)

## plot histogram
hist(data$global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")

## close device
dev.off()
