#' Submit GSoC Proposal
#'
#' Simulates submitting a proposal to Google Summer of Code.
#' The function checks whether the current time is before or after the submission deadline.
#'
#' The submission deadline is
#' \Sexpr[stage=render]{format(.gs_env$deadline, "%d %B %Y %H:%M:%S %Z")}.
#'
#' @details
#' \Sexpr[stage=render]{
#'   deadline <- .gs_env$deadline
#'   remaining <- difftime(deadline, Sys.time(), units = "secs")
#'
#'   if (remaining > 0) {
#'     days <- floor(remaining / 86400)
#'     hours <- floor((remaining %% 86400) / 3600)
#'     paste("Time left:", days, "days and", hours, "hours.")
#'   } else {
#'     "The deadline has passed. Try next year!"
#'   }
#' }
#'
#' @param deadline POSIXct. Submission deadline (default: global deadline).
#' @param tz Character. Timezone (default: "UTC").
#'
#' @return A list with:
#' \itemize{
#'   \item submitted: TRUE if submitted before deadline
#'   \item message: Status message
#'   \item time_remaining_seconds: Time left in seconds
#' }
#'
#' @examples
#' submit_proposal()
#' submit_proposal(Sys.time() + 3600)  # 1 hour left
submit_proposal <- function(deadline = .gs_env$deadline, tz = "UTC") {

  # 🔹 Input validation
  if (is.null(deadline) || is.na(deadline)) {
    stop("Deadline must be a valid date-time.")
  }

  # 🔹 Normalize time
  current_time <- as.POSIXct(Sys.time(), tz = tz)
  deadline <- as.POSIXct(deadline, tz = tz)

  # 🔹 Core logic
  success <- current_time <= deadline
  remaining <- as.numeric(difftime(deadline, current_time, units = "secs"))

  # 🔹 Warning for last hour
  if (success && remaining < 3600) {
    warning("⚠️ Less than 1 hour left! Submit immediately!")
  }

  # 🔹 Format remaining time (uses utils.R)
  readable_time <- format_time_remaining(remaining)

  # 🔹 Output
  list(
    submitted = success,
    message = if (success) {
      paste("✅ Submitted! Time left:", readable_time)
    } else {
      "❌ Deadline passed. Try next year!"
    },
    time_remaining_seconds = remaining
  )
}
