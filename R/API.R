#' @name API
#' @param url data
#' @author Mahnaz , Bita
#' @description functions you should have to access the data in the API
#' @title Kolada API
#' @import httr
#' @import jsonlite
#' @export my_API
#' @references \url{https://www.kolada.se/om-oss/api/}
#' @examples 
#' output <- my_API("http://api.kolada.se/v2/ou?title=skola")


my_API <- function(url){
  res <- httr::GET(url)
  stopifnot(is.character(url)& !http_error(url) )
  my_data <-  jsonlite::fromJSON(rawToChar(res$content))
  #print(my_data)
  municipality_name <- c(unique(my_data$values$municipality))
  number_schools <- c()
  for (value in municipality_name){
    count=nrow(subset(my_data$values,my_data$values$municipality==value))
    number_schools <- c(count,number_schools)
  }
  df <- data.frame(municipality_name,number_schools)
  return(df)
}


