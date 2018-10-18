file_url <- "https://hgn-rest.scm.azurewebsites.net/api/vfs/LogFiles/archive/"

if(!dir.exists("data"))
{
  dir.create("./data")
}

filename <- paste("cameras", toString(date()), sep = "-")
fullfilepath = paste("./data/",filename, ".csv", sep = "")
download.file(file_url, destfile = fullfilepath, method = "curl")

list.files()

camera_data_table = read.table(fullfilepath, sep = ",", header = TRUE) # without using sep = ",", we end up using default sep - tab which does not work with csv format

camera_data_csv <- read.csv(fullfilepath)

# quotes : tell R how to hanlde quotes example quotes = "" means no quotes
# nrows: how many rows to read , example nrows =10
# skip : rows to skip skip = 10
#na.strings : set charcater that represents missing values

# read xml

library(XML)

file_url <- "http://www.espn.com/nfl/team/_/name/bal/baltimore-ravens"


doc <- htmlTreeParse(file_url, useInternal = TRUE )