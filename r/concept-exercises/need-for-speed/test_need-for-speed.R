source("./need-for-speed.R")
library(testthat)

# 1) new_car

test_that("1. Create a new car, factory-fresh.", {
  speed <- 10
  battery_drain <- 2
  car <- new_car(speed, battery_drain)
  expect_length(car, 4)
  expect_equal(car$speed, speed)
  expect_equal(car$battery_drain, battery_drain)
  expect_equal(car$battery, 100)
  expect_equal(car$distance, 0)
})

test_that("1. Create a new car, used.", {
  speed <- 5
  battery_drain <- 10
  battery <- 30
  distance <- 35
  car <- new_car(speed, battery_drain, battery, distance)
  expect_length(car, 4)
  expect_equal(car$speed, speed)
  expect_equal(car$battery_drain, battery_drain)
  expect_equal(car$battery, battery)
  expect_equal(car$distance, distance)
})

# 2) new_track

test_that("2. Create a new track.", {
  distance <- 800
  track <- new_track(distance)
  expect_length(track, 1)
  expect_equal(track$distance, distance)
})

# 3) battery_drained
# This follows the logic of the Go track exercise, differs from C#
# The car will not start a turn if it is unable to complete it.

test_that("3. Battery not drained.", {
  car <- new_car(5, 10)
  expect_false(battery_drained(car))
})

test_that("3. Battery drained if zero.", {
  car <- new_car(5, 10)
  car$battery <- 0
  expect_true(battery_drained(car))
})

test_that("3. Battery drained if non-zero but less than drain.", {
  car <- new_car(5, 10)
  car$battery <- 8
  expect_true(battery_drained(car))
})

# 4) drive

test_that("4. Drive increases distance driven with speed.", {
  car <- new_car(5, 1)
  car <- drive(car)
  expect_equal(car$distance, 5)
})

test_that("4. Drive does not increase distance driven when battery drained.", {
  car <- new_car(9, 50)
  car <- drive(car)
  car <- drive(car)
  car <- drive(car)
  expect_equal(car$distance, 18)
})

# 5) can_finish

test_that("5. Can finish with plenty of battery.", {
  car <- new_car(10, 2)
  track <- new_track(100)
  expect_true(can_finish(car, track))
})

test_that("5. Can finish with just enough battery.", {
  car <- new_car(2, 10)
  track <- new_track(20)
  expect_true(can_finish(car, track))
})

test_that("5. Can just finish with battery less than 100%.", {
  car <- new_car(2, 3, 25, 0)
  track <- new_track(16)
  expect_true(can_finish(car, track))
})

test_that("5. Can almost finish with battery less than 100%.", {
  car <- new_car(2, 3, 25, 0)
  track <- new_track(17)
  expect_false(can_finish(car, track))
})
