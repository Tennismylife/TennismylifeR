#' @title ATP winning matches record
#'
#' @description ATP winning matches record
#'
#' @param db Database to read
#'
#' @return res
#'
#' @examples  WinsOverall(db)
#'
#' @export

library(stringr)

WinsOverall <- function(db) {

  ## drop walkover matches (not countable)
  db <- db[!db$score=="W/O" & !db$score=="DEF" & !str_detect(db$score, "WEA") & !str_detect(db$score, "ABN")]

  ## count occurrences of won matches
  res <- db[,.N, by=winner_name]

  ## order by decreasing
  setorder(res, -N, na.last=FALSE)

  res
}
