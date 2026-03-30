#' Format time remaining into human-readable format
#'
#' @param seconds Numeric. Time in seconds.
#' @return Character string with days, hours, minutes.
format_time_remaining <- function(seconds) {
  if (seconds <= 0) {
    return("0 days 0 hours 0 minutes")
  }

  days <- floor(seconds / 86400)
  hours <- floor((seconds %% 86400) / 3600)
  minutes <- floor((seconds %% 3600) / 60)

  paste(days, "days", hours, "hours", minutes, "minutes")
}
