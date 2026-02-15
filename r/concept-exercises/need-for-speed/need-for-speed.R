new_car <- function(speed, battery_drain, battery = 100, distance = 0) {
  list(
    speed = speed, 
    battery_drain = battery_drain,
    battery = battery, 
    distance = distance
  )
}

new_track <- function(distance) {
  list(distance = distance)
}

battery_drained <- function(car) {
  car$battery < car$battery_drain
}

drive <- function(car) {
  if (battery_drained(car)) return(car)
  
  car$battery <- car$battery - car$battery_drain
  car$distance <- car$distance + car$speed
  car
}

can_finish <- function(car, track) {
  max_distance <- car$battery / car$battery_drain * car$speed
  max_distance >= track$distance
}
