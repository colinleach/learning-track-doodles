check_humidity_level <- function(pct_humidity) {
  stopifnot(pct_humidity <= 70)
  message(sprintf("hum check passed: t °C", )
  TRUE
}

report_overheating <- function(temperature) {
  if (is.null(temperature)) stop("Argument Error")
  if (temperature > 500) stop(sprintf("Overheating: %d C", temperature))
  FALSE
}
