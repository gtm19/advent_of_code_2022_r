source(here::here("R", "day_02.R"))

input <- get_input(day = 2, test = TRUE)

test_that("Part 1 works", {
  expect_equal(
    part_01(input),
    15
  )
})

test_that("Part 2 works", {
  expect_equal(
    part_02(input),
    12
  )
})
