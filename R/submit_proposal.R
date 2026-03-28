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
  current_time <- Sys.time()
  current_time <= .gs_env$deadline
}
