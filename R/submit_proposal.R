#' Submit GSoC Proposal
#'
#' This function simulates submitting a proposal to Google Summer of Code.
#' It checks whether the current time is before or after the submission deadline.
#'
#' The submission deadline is 31st March 2026.
#'
#' @return Logical value:
#' \itemize{
#'   \item TRUE if submitted before the deadline
#'   \item FALSE if submitted after the deadline
#' }
#'
#' @examples
#' submit_proposal()
#'
submit_proposal <- function() {

  deadline <- as.POSIXct("2026-03-31 23:59:59", tz = "UTC")
  current_time <- Sys.time()

  if (current_time <= deadline) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}
