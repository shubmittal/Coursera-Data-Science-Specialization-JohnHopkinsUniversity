complete <- function(directory, id = 1:332)
{
    directory <- paste(getwd(), directory, sep = "/")
    files_list = list.files(path = directory)
    
    results <- data.frame(id = numeric(), nobs = numeric());
    
      for (fileid in id)
    {
      file_name <- paste(directory,files_list[fileid], sep= "/")
      file_data <-  read.csv(file_name, header = TRUE, sep = ",")
      complete_cases = sum(complete.cases(file_data));
      results <- rbind(results, data.frame(id = fileid, nobs = complete_cases))
    }
    
    results
  
}