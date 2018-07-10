corr <- function(directory, threshold = 0)
{
  directory <- paste(getwd(), directory, sep = "/")
  files_list = list.files(path = directory)
  
  correlations <- c()
  
  for (file in files_list)
  {
    file_name <- paste(directory,file, sep= "/")
    file_data <-  read.csv(file_name, header = TRUE, sep = ",")
    complete_cases = sum(complete.cases(file_data));
    if (complete_cases > threshold)
    {
      correlation <- cor(file_data$nitrate, file_data$sulfate, use ="complete.obs")
      correlations <- c(correlations, correlation)
    }
  }
  correlations
}