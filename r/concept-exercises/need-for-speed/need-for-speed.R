new_car <- function(speed, battery_drain) {
  list(
    speed = speed, battery_drain = battery_drain,
    battery = 100, distance = 0
  )
}

new_track <- function(distance) {
  list(distance = distance)
}

drive <- function(car) {
  car$battery <- car$battery - car$battery_drain
  car$distance <- car$distance + car$speed
  car
}

can_finish <- function(car, track) {
  max_distance <- car$battery / car$battery_drain * car$speed
  max_distance >= track$distance
}
