source("./factory-sensors.R")
library(testthat)

# check_humidity_level

test_that("1. Should throw if the humidity percentage is 100", {
  expect_error(check_humidity_level(100), NULL)
})

test_that("1. Should not throw if the humidity percentage is 53", {
  expect_no_error(check_humidity_level(53))
})

test_that("1. Should return TRUE if the humidity percentage is 53", {
  expect_equal(check_humidity_level(53), TRUE)
})

# report_overheating

test_that("2. Should not throw if the temperature is 200°C", {
  expect_no_error(report_overheating(200))
  expect_message(report_overheating(200), "200")
})

test_that("2. Should throw an error if the temperature is NULL", {
  expect_error(report_overheating(NULL), "Argument Error")
})

test_that("2. Should throw an error if the temperature is 501°C", {
  expect_error(report_overheating(501), "501")
})

# monitor_the_machine

test_that("3. Should report tests passing", {
  expect_message(monitor_the_machine(53, 200), "200")
  expect_message(monitor_the_machine(53, 200), "humidity test passed")
})




#     @testset "4. Monitor the machine" begin
#         @testset "Passing" begin
#             @test_logs (:info, "humidity level check passed: 53%") (:info, "temperature check passed: 200 °C") machinemonitor(53, 200)
#         end

#         @testset "Failing" begin
#             @test_logs (:error, "humidity level check failed: 80%") (:info, "temperature check passed: 220 °C") begin
#                 @test_throws MachineError machinemonitor(80, 220) 
#             end
#             @test_logs (:info, "humidity level check passed: 52%") (:warn, "sensor is broken") begin
#                 @test_throws MachineError machinemonitor(52, nothing)
#             end       
#             @test_logs (:info, "humidity level check passed: 21%") (:error, "overheating detected: 540 °C") begin
#                 @test_throws MachineError machinemonitor(21, 540) 
#             end
#             @test_logs (:error, "humidity level check failed: 100%") (:warn, "sensor is broken") begin
#                 @test_throws MachineError machinemonitor(100, nothing) 
#             end
#             @test_logs (:error, "humidity level check failed: 93%") (:error, "overheating detected: 521 °C") begin
#                 @test_throws MachineError machinemonitor(93, 521)
#             end
#         end       
#     end
# end

# @testset verbose = true "tests" begin
#     @testset "1. Monitor the humidity level of the room" begin
#         @testset "Passing" begin
#             @test_logs (:info, "humidity level check passed: 53%") humiditycheck(53)
#         end

#         @testset "Failing" begin
#             @test_throws ErrorException humiditycheck(80)
#             @test_throws "80" humiditycheck(80)
#         end       
#     end

#     @testset "2. Check for overheating" begin
#         @testset "Passing" begin
#             @test_logs (:info, "temperature check passed: 200 °C") temperaturecheck(200)
#         end

#         @testset "Failing" begin
#             @test_throws ArgumentError temperaturecheck(nothing)
#             @test_throws DomainError temperaturecheck(501)
#             @test_throws "501" temperaturecheck(501)
#         end
#     end


