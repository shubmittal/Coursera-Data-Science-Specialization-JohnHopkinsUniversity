pollutantmean <- function(directory, pollutant, id = 1:332)
{
  allowed_pollutants <- c("sulfate", "nitrate")
 results <- if (length(directory) ==1 & length(pollutant) == 1 & pollutant %in% allowed_pollutants)
  {
    
    directory <- paste(getwd(), directory, sep = "/")
    files_list = list.files(path = directory)
   
    pollutant_sum <- c()
    
    for (fileid in id)
    {
      file_name <- paste(directory,files_list[fileid], sep= "/")
      file_data <-  read.csv(file_name, header = TRUE, sep = ",")
      pollutant_sum <- c(pollutant_sum, file_data[,pollutant])
    }
    
    mean(pollutant_sum, na.rm = TRUE)
  }
  else
  {
    "Invalid input"
  }
 results
}