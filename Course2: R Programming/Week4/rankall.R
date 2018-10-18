rankall <- function(outcome, num = "best")
{
  outcomedata <<- read.csv("./Data/outcome-of-care-measures.csv")
  permissible_outcomes <- c("heart attack", "heart failure","pneumonia")
  col_names <- c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack","Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure","Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")

    if(num == "best")
  {
    num <-1
  }
  
  if( !outcome %in% permissible_outcomes )
  {
    stop(" invalid outcome")
  }
  col <- col_names[which(permissible_outcomes == outcome)]
  
  subset <- outcomedata[, c("Hospital.Name", "State", col)]
  colnames(subset) <- c("hospital", "state","rate" )
  subset$rate <- as.numeric(as.character(subset$rate))
  subset <- subset[complete.cases(subset),]
  split_as_per_state <- split(subset, subset$state, drop = TRUE)
  results_list <- lapply(split_as_per_state, function(x){
    
    x <- x[order(x[,3], x[,2]), ] #3rd column indicates outcome and 2 indicates hospital name
    
    if(num == "worst")
    {
      return (x[nrow(x),])
    }
    else
    {
      return (x[num,])
    }
    
  })
  
  df <- Reduce(rbind,results_list)
  df$rate <- as.numeric(as.character(df$rate))
  df <- df[complete.cases(df),]
  df
  
  
  
}