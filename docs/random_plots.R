library(tidyverse)

sds <- c(0.5, 1, 2)

n <- 10000
tibble(
  "SD = 0.5" = rnorm(n, sd = 0.5),
  "SD = 1" = rnorm(n, sd = 1),
  "SD = 2" = rnorm(n, sd = 2)
)  |>
  pivot_longer(
    cols = starts_with("SD = "),
    names_to = "SD",
    values_to = "value"
  ) |>
  ggplot(aes(value, color = SD)) + 
    geom_freqpoly(binwidth = 0.05) +
    facet_wrap(~SD, ncol = 1)



tibble(
  "x" = seq(-4, 4, length.out = 1000),
  "SD = 0.5" = dnorm(x, sd = 0.5),
  "SD = 1" = dnorm(x, sd = 1),
  "SD = 2" = dnorm(x, sd = 2)
)  |>
  pivot_longer(
    cols = starts_with("SD = "),
    names_to = "SD",
    values_to = "value"
  ) |>
  ggplot(aes(x = x, y = value, color = SD)) +
    geom_line() +
    facet_wrap(~SD, ncol = 1)


tibble(
  "x" = seq(-4, 4, length.out = 1000),
  "SD = 0.5" = pnorm(x, sd = 0.5),
  "SD = 1" = pnorm(x, sd = 1),
  "SD = 2" = pnorm(x, sd = 2)
)  |>
  pivot_longer(
    cols = starts_with("SD = "),
    names_to = "SD",
    values_to = "value"
  ) |>
  ggplot(aes(x = x, y = value, color = SD)) +
  geom_line() +
  facet_wrap(~SD, ncol = 1)

tibble(
  "x" = 0:20,
  "lambda = 1" = dpois(x, lambda = 1),
  "lambda = 4" = dpois(x, lambda = 4),
  "lambda = 8" = dpois(x, lambda = 8)
)  |>
  pivot_longer(
    cols = starts_with("lambda = "),
    names_to = "lambda",
    values_to = "value"
  ) |>
  ggplot(aes(x = x, y = value, color = lambda)) +
  geom_col() +
  facet_wrap(~lambda, ncol = 1)

tibble(
  "x" = 0:15,
  "lambda = 1" = ppois(x, lambda = 1),
  "lambda = 4" = ppois(x, lambda = 4),
  "lambda = 8" = ppois(x, lambda = 8)
)  |>
  pivot_longer(
    cols = starts_with("lambda = "),
    names_to = "lambda",
    values_to = "value"
  ) |>
  ggplot(aes(x = x, y = value, color = lambda)) +
  geom_col() +
  facet_wrap(~lambda, ncol = 1)

n <- 10000
tibble(
  "lambda = 1" = rpois(n, lambda = 1),
  "lambda = 4" = rpois(n, lambda = 4),
  "lambda = 8" = rpois(n, lambda = 8)
)  |>
  pivot_longer(
    cols = starts_with("lambda = "),
    names_to = "lambda",
    values_to = "value"
  ) |>
  ggplot(aes(value, color = lambda)) + 
    geom_freqpoly(binwidth = 0.05) +
    facet_wrap(~lambda, ncol = 1)

