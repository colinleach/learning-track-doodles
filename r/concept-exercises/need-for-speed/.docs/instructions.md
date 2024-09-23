# Instructions

In this exercise you'll be organizing races between various types of remote controlled cars.
Each car has its own speed and battery drain characteristics.

Cars start with full (100%) batteries. Each time you drive the car using the remote control,
it covers the car's speed in meters and decreases the remaining battery percentage by its battery drain.

If a car's battery is below its battery drain percentage, you can't drive the car anymore.

Each race track has its own distance. Cars are tested by checking if they can finish the track without running out of battery.

## 1. Create a remote controlled car

Define a `car` list with the following fields:

- battery
- battery_drain
- speed
- distance

Allow creating a remote controlled car by defining a function `new_car` that takes the speed of the car in meters,
and the battery drain percentage as its two parameters and returns a `car` list:

```R
speed <- 5
battery_drain <- 2
car <- new_car(speed, battery_drain)
# => car{speed: 5, battery_drain: 2, battery:100, distance: 0}
```

## 2. Create a race track

Define another list called `track` with the fields `name` and  `distance`.
Allow creating a race track by defining a function `new_track` that takes the track's name and distance in meters:

```R
name <- "Imola"
distance <- 800
track <- new_track(name, distance)
# => Track{name: "Imola", distance: 800}
```

## 3. Drive the car

Implement the `drive()` function that updates the number of meters driven based on the car's speed, and reduces the battery according to the battery drainage.
If there is not enough battery to drive one more time the car will not move:

```R
speed <- 5
battery_drain <- 2
car <- new_car(speed, battery_drain)
car = drive(car)
# => car{speed: 5, battery_drain: 2, battery: 98, distance: 5}
```

## 4. Check for a drained battery

Implement the `battery_drained()` function that indicates if the battery is drained:

```R
speed = 5;
battery_drain = 2;
car = new_car(speed, battery_drain);
car = drive(car);

battery_drained(car);
# => false
```


## 5. Check if a remote controlled car can finish a race

To finish a race, a car has to be able to drive the race's distance. This means not draining its battery before having crossed the finish line. Implement the `can_finish()` function that takes a `car` and a `track` as its parameter and returns `TRUE` if the car can finish the race; otherwise, return `FALSE`.

Assume that you are currently at the starting line of the race and start the engine of the car for the race. Take into account that the car's battery might not necessarily be fully charged when starting the race:
```R
speed <- 5
battery_drain <- 2
car <- new_car(speed, battery_drain)

name <- "track1"
distance <- 100
track <- new_track(name, distance)

can_finish(car, track)
# => TRUE
```

## 6. Store whether the car can finish a track on a full battery

??

**TODO** : some exercise to practice adding fields with names determined at run time

