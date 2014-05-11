## The script assumes that the load_data.R is contained in the current R 
## working directory which in turn assumes that unzipped data has already been
## downloaded. If not, then please follow the instructions in load_data.R file
## to download the dataset into the current R working directory.

## load data using load_data.R
source("load_data.R")

## set locale to US/English (for days of week in plot ticks)
## Sys.setlocale(category="LC_TIME", locale="US")

## open device
png(filename="plot2.png", width=480, height=480)

## plot time series
plot(data$global_active_power ~ data$datetime, ylab="Global Active Power (kilowatts)", 
     xlab="", type="l")

## close device:
dev.off()