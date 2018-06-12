pollutantmean <- function(directory, pollutant, id){
  
result <-  if(directory == "specdata")
  {
    if (pollutant == "sulfate" || pollutant == "nitrate")
    {
      directory <- paste("./", directory, "/", sep = "")
      files <- list.files(directory)
      file_paths <- paste(directory,files, sep = "")
      pollutant_data <- c();
      for (fileid in id)
      {
        file_data <- read.csv(file_paths[fileid], header = TRUE, sep = ",")
         pollutant_data <- c(pollutant_data, file_data[, pollutant] )
      }
      
      mean(pollutant_data,na.rm = TRUE)
      
    }
  else
  {
    "Invalid pollutant"
  }
}
else{
  "Invalid directory"
}
result
}