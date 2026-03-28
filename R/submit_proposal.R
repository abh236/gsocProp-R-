submit_proposal <- function() {

  # Define deadline (31 March 2026)
  deadline <- as.POSIXct("2026-03-31 23:59:59", tz = "UTC")

  # Get current system time
  current_time <- Sys.time()

  # Compare time
  if (current_time <= deadline) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}
