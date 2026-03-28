get_deadline <- function() {
  .gs_env$deadline
}

deadline_message <- function() {
  now <- Sys.time()
  diff <- difftime(.gs_env$deadline, now, units = "days")

  if (diff > 0) {
    paste("The deadline is in", ceiling(diff), "days.")
  } else {
    "The deadline has passed, try next year!"
  }
}
