source(here::here("R", "day_01.R"))

input <- get_input(day = 1, test = TRUE)

test_that("Part 1 works", {
  expect_equal(
    part_01(input),
    24000
  )
})

test_that("Part 2 works", {
  expect_equal(
    part_02(input),
    45000
  )
})
