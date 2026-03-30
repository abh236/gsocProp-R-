library(testthat)

test_that("submit_proposal works before deadline", {
  future_time <- Sys.time() + 3600
  result <- submit_proposal(deadline = future_time)

  expect_true(result$submitted)
})

test_that("submit_proposal fails after deadline", {
  past_time <- Sys.time() - 3600
  result <- submit_proposal(deadline = past_time)

  expect_false(result$submitted)
})

test_that("format_time_remaining works correctly", {
  result <- format_time_remaining(3661)
  expect_true(is.character(result))
})
