source("./factory-sensors.R")
library(testthat)

# check_humidity_level

test_that("should throw if the humidity percentage is 100", {
  expect_error(check_humidity_level(100), NULL)
})

test_that("should not throw if the humidity percentage is 53", {
  expect_no_error(check_humidity_level(53))
})

test_that("should return TRUE if the humidity percentage is 53", {
  expect_equal(check_humidity_level(53), TRUE)
})

# report_overheating

test_that("should not throw if the temperature is 200°C", {
  expect_no_error(report_overheating(200))
})

test_that("should throw an error if the temperature is NULL", {
  expect_error(report_overheating(NULL), "Argument Error")
})

test_that("should throw an error if the temperature is 501°C", {
  expect_error(report_overheating(501), "501")
})

# monitor_the_machine

# test_that("should call the check method once", {
#   expect_error(monitor_the_machine(501), "501")
# })




# describe('monitorTheMachine', () => {
#   const actions = {
#     check: jest.fn(),
#     alertDeadSensor: jest.fn(),
#     alertOverheating: jest.fn(),
#     shutdown: jest.fn(),
#   };

#   beforeEach(() => {
#     jest.resetAllMocks();
#   });

#   test('should call the check method once', () => {
#     monitorTheMachine(actions);

#     expect(actions.check).toHaveBeenCalledTimes(1);
#   });

#   test("should not call any action if the check doesn't throw", () => {
#     monitorTheMachine(actions);

#     expect(actions.alertDeadSensor).not.toHaveBeenCalled();
#     expect(actions.alertOverheating).not.toHaveBeenCalled();
#     expect(actions.shutdown).not.toHaveBeenCalled();
#   });

#   test('should call only the alertDeadSensor if the check throws an ArgumentError', () => {
#     actions.check = jest.fn(() => {
#       throw new ArgumentError();
#     });
#     monitorTheMachine(actions);

#     expect(actions.alertDeadSensor).toHaveBeenCalledTimes(1);
#     expect(actions.alertOverheating).not.toHaveBeenCalled();
#     expect(actions.shutdown).not.toHaveBeenCalled();
#   });

#   test('should call only the shutdown action if the check throws an OverheatingError with a temperature equals to 651°C', () => {
#     actions.check = jest.fn(() => {
#       throw new OverheatingError(651);
#     });
#     monitorTheMachine(actions);

#     expect(actions.alertDeadSensor).not.toHaveBeenCalled();
#     expect(actions.alertOverheating).not.toHaveBeenCalled();
#     expect(actions.shutdown).toHaveBeenCalledTimes(1);
#   });

#   test('should call only the alertOverheating if the check throws an OverheatingError with a temperature of 530°C', () => {
#     actions.check = jest.fn(() => {
#       throw new OverheatingError(530);
#     });
#     monitorTheMachine(actions);

#     expect(actions.alertDeadSensor).not.toHaveBeenCalled();
#     expect(actions.alertOverheating).toHaveBeenCalledTimes(1);
#     expect(actions.shutdown).not.toHaveBeenCalled();
#   });

#   test('should rethrow the error if the check throws an unknown error', () => {
#     class UnknownError extends Error {}

#     actions.check = jest.fn(() => {
#       throw new UnknownError();
#     });

#     expect(() => monitorTheMachine(actions)).toThrow(UnknownError);

#     expect(actions.alertDeadSensor).not.toHaveBeenCalled();
#     expect(actions.alertOverheating).not.toHaveBeenCalled();
#     expect(actions.shutdown).not.toHaveBeenCalled();
#   });
# });
