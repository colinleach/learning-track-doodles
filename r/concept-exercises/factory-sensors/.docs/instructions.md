# Instructions

Elena is the new quality manager of a newspaper factory. As she has just arrived in the company, she has decided to review some of the processes in the factory to see what could be improved. She found out that technicians are doing a lot of quality checks by hand. She sees there is a good opportunity for automation and asks you, a freelance developer, to develop a piece of software to monitor some of the machines.

## 1. Monitor the humidity level of the room

Your first mission is to write a piece of software to monitor the humidity level of the production room. There is already a sensor connected to the software of the company that returns periodically the humidity percentage of the room.

You need to implement a function in the software that will throw an error if the humidity percentage is too high.
The function should be called `check_humidity_level` and take the humidity percentage as a parameter.

You should halt with an error (the message is not important) if the percentage exceeds 70%. Otherwise, return `TRUE` to confirm the measurement is good.

```R
check_humidity_level(60)
# => TRUE
```

```R
check_humidity_level(100)
# Halts with an error
```

## 2. Detect overheating

Elena is very pleased with your first assignment and asks you to deal with the monitoring of the machines' temperature.
While chatting with a technician, Greg, you are told that if the temperature of a machine exceeds 500°C, the technicians start worrying about overheating.

The machine is equipped with a sensor that measures its internal temperature.
You should know that the sensor is very sensitive and often breaks.
In this case, the technicians will need to change it.

Your job is to implement a function `report_overheating` that takes the temperature as a parameter and throws an error if the sensor is broken or if the machine starts overheating.
Knowing that you will later need to react differently depending on the error, you need a mechanism to differentiate the two kinds of errors.

- If the sensor is broken, the temperature will be `NULL`.
  In this case, you should halt with an error message that includes "Argument Error" as part of the string.
- When everything works, if the temperature exceeds 500°C, you should halt with a message that includes the temperature.

```R
report_overheating(NULL)
#> Error in report_overheating(NULL) : Argument Error
```

```R
report_overheating(800)
#> Halts with an error message that includes "800"
```

## TODO : need to test `try()`, `warning()` and perhaps `message()`

## 3. Monitor the machine

Now that your machine can detect errors, you will implement a function that reacts to those errors in different ways :

- If the sensor is broken, you need to warn a technician
- If the temperature is too high, you will either shut down the machine if the temperature exceeds 600°C or turn on a warning light if it is less than that.
- If another error happens, you'll rethrow it.

Implements a function `monitor_the_machine` that takes an argument `actions`.

`actions` is an object that has 4 properties :

- `check` is a _*function*_ that, when called, checks the temperature of the machine.
  It may throw various errors

- `alertDeadSensor` is a _*function*_ that, when called, alerts a technician that the temperature's sensor is dead.

- `alertOverheating` is a _*function*_ that, when called, will turn on a warning light on the machine.

- `shutdown` is a _*function*_ that, when called, will turn off the machine.

The `monitor_the_machine` function should call `check()`. If it passes, the function should not return anything. However, it may `throw` an error. When this happens, you should, depending on the error:

- `ArgumentError`: when this happens, call the `alertDeadSensor` function.
- `OverheatingError`: when this happens, if the temperature is less than 600 °C, call the `alertOverheating` function to turn on the warning light. If the temperature exceeds 600°C, the situation is critical, call the `shutdown` function.
- _anything else_: when this happens, rethrow the error

```R
monitorTheMachine({
  check,
  alertDeadSensor,
  alertOverheating,
  shutdown,
})
```
