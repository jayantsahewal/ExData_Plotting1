# If you are not sure on how to download the dataset or haven't read README.cmd then uncomment the next 2 lines

# to download the data in your working directory. Size of this zipped file is around 20 MB. So it may take a
# while depending upon you speed of your internet connection.

# download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
#              destfile = "exdata-data-household_power_consumption.zip", method = "curl")


# Now lets start working by setting locations for the required data file
loc_zipfile <- "exdata-data-household_power_consumption.zip"
loc_unzipfile <- "household_power_consumption.txt"

unzip(zipfile=loc_zipfile)

# Now we will load the above mentioned file in corresponding R object
raw_data <- read.table(loc_unzipfile, header=TRUE, sep=";",
                   na.strings="?", nrows=2100000, stringsAsFactors=FALSE)


names(raw_data) <- tolower(names(raw_data))

## As per instructions select data from the dates 2007-02-01 and 2007-02-02
data <- subset(raw_data, subset=(raw_data$date %in% c("1/2/2007", "2/2/2007")))

## remove unused data from workspace
rm(raw_data)

## create new variable datetime via transforming strings into dates)
data$datetime <- as.POSIXct(strptime(paste(data$date, data$time), format="%d/%m/%Y %H:%M:%S"))
