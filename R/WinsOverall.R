#' @title ATP winning matches record
#'
#' @description ATP winning matches record
#'
#' @param
#'
#' @return res
#'
#' @examples  WinsOverall()
#'
#' @export WinsOverall


# install.packages('data.table')
# install.packages('dplyr')
# install.packages('plyr')
# install.packages('tibble')
# install.packages('curl')

library(stringr)

WinsOverall <- function() {

  ## drop walkover matches (not countable)
  require(stringr)
  db <- db[!db$score=="W/O" & !db$score=="DEF" & !str_detect(db$score, "WEA") & !str_detect(db$score, "ABN")]

  ## count occurrences of won matches
  res <- db[,.N, by=winner_name]

  ## order by decreasing
  setorder(res, -N, na.last=FALSE)

  res
}
