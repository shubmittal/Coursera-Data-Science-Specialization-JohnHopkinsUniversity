library("readxl")
library("xml2")
library("data.table")
library("tictoc")

q1 <- function()
{
  file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
  file_path = "./data/Week1Q1.csv"
  if(! file.exists(file_path))
  download.file(file_url, destfile = file_path, method = "curl")
  
  q1_data <- read.csv(file_path)
  #head(q1_data)
  q1_data[(q1_data$VAL == 24 & !is.na(q1_data$VAL)),] #53
  
}

q2 <- function()
{
 unique(q1_data["FES"])
  "Tidy data has one variable per column."
}


q3 <- function()
{
 
   file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
   download.file(file_url, destfile = "./data/q3.xlsx", method = "curl")
  dat <- read_excel("./data/q3.xlsx", sheet = "NGAP Sample Data", skip =1, range = cell_limits(c(18, 7), c(23, 15)))
  dat
  sum(dat$Zip*dat$Ext,na.rm=T) # Answer: 36534720
}



q4 <- function()
{
  file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
  file_path <- "./data/q4.xml"
  download.file(file_url, destfile = file_path, method = "curl")
  data <- read_xml(file_path)
  length(xml_find_all(data, "//zipcode[. = 21231]")) #127
}



q5 <- function()
{
  file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
  file_path <- "./data/q5.csv"
  if(!file.exists(file_path))
  {
    download.file(file_url, destfile = file_path, method = "curl")
  }
  DT <- fread(file_path)
  
  
  tic("rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]")
  #rowMeans(DT["pwgtp15"])[DT$SEX==1]; rowMeans(DT["pwgtp15"])[DT$SEX==2]
  toc()
  
  tic("tapply(DT$pwgtp15,DT$SEX,mean)")
  tapply(DT$pwgtp15,DT$SEX,mean)
  toc()
  
  tic("sapply(split(DT$pwgtp15,DT$SEX),mean)")
  sapply(split(DT$pwgtp15,DT$SEX),mean)
  toc()
  
  tic("mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)")
  mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
  toc()
  
  tic("mean(DT$pwgtp15,by=DT$SEX)")
  mean(DT$pwgtp15,by=DT$SEX)
  toc()
  
  tic("DT[,mean(pwgtp15),by=SEX]")
  DT[,mean(pwgtp15),by=SEX]
  toc()
  
  
}

