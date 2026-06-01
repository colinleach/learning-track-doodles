check_humidity_level <- function(pct_humidity) {
  stopifnot(pct_humidity <= 70)
  TRUE
}

report_overheating <- function(temperature) {
  if (is.null(temperature)) stop("Argument Error")
  if (temperature > 500) stop(sprintf("Overheating: %d C", temperature))
  message(sprintf("temperature check passed: %d °C", temperature))
}

monitor_the_machine <- function(pct_humidity, temperature) {
  report_overheating(temperature)
  if (check_humidity_level(pct_humidity)) message("humidity test passed")
}


#' function humiditycheck(pct_humidity)
#'     pct_humidity > 70 && error("humidity level too high: $pct_humidity%")
#'     @info "humidity level check passed: $pct_humidity%"
#' end
#' 
#' function temperaturecheck(temperature)
#'     isnothing(temperature) && throw(ArgumentError("sensor is broken"))
#'     temperature > 500 && throw(DomainError(temperature))
#'     @info "temperature check passed: $temperature °C"
#' end
#' 
#' struct MachineError <: Exception end
#' 
#' function machinemonitor(pct_humidity, temperature)
#'     errors = 0
#'     try
#'         humiditycheck(pct_humidity)
#'     catch humidity_error
#'         errors += 1
#'         @error "humidity level check failed: $pct_humidity%"
#'     end
#'     try
#'         temperaturecheck(temperature)
#'     catch temp_error
#'         errors += 1
#'         temp_error isa ArgumentError ? (@warn "sensor is broken") : (@error "overheating detected: $temperature °C")    
#'     end
#'     iszero(errors) || throw(MachineError())
#' end
