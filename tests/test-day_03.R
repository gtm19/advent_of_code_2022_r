source(here::here("R", "day_03.R"))

input <- get_input(day = 3, test = TRUE)

test_that("Part 1 works", {
  expect_equal(
    part_01(input),
    157
  )
})

test_that("Part 2 works", {
  expect_equal(
    part_02(input),
    70
  )
})
