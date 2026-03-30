# Global environment for GSoC simulation
.gs_env <- new.env(parent = emptyenv())

# Default GSoC 2026 deadline
.gs_env$deadline <- as.POSIXct("2026-03-31 23:59:59", tz = "UTC")
