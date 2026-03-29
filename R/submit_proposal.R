#' Submit GSoC Proposal
#'
#' This function simulates submitting a proposal to Google Summer of Code.
#' It checks whether the current time is before or after the submission deadline.
#'
#' The submission deadline is \Sexpr{format(as.POSIXct("2026-03-31 23:59:59", tz="UTC"), "%d %B %Y")}.
#'
#' @details
#' \Sexpr{
#'   deadline <- as.POSIXct("2026-03-31 23:59:59", tz="UTC")
#'   remaining <- difftime(deadline, Sys.time(), units = "days")
#'   if (remaining > 0) {
#'     paste("The deadline is in", round(remaining), "days.")
#'   } else {
#'     "The deadline has passed. Try next year!"
#'   }
#' }
#'
#' @return Logical value:
#' \itemize{
#'   \item TRUE if submitted before the deadline
#'   \item FALSE if submitted after the deadline
#' }
#'
#' @examples
#' submit_proposal()
submit_proposal <- function() {
  current_time <- Sys.time()
  current_time <= .gs_env$deadline
}
