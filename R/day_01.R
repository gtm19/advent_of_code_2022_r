# https://adventofcode.com/2022/day/1
source(here::here("R", "utils.R"))

elf_calories <- function(input, n = 1, .quiet = FALSE) {
  lines <-
    as.integer(
      readLines(input)
    )

  elf_totals <- as.integer(
      lapply(
      split(lines, cumsum(is.na(lines))),
      sum,
      na.rm = TRUE
    )
  )

  calorie_total <- sum(sort(elf_totals, decreasing = TRUE)[seq(n)])

  if (!.quiet) {
    message(
      glue::glue("The total calories carried by the top {n} elves is {calorie_total}")
    )
  }

  calorie_total
}

part_01 <- function(input = get_input(day = 1)) {
  elf_calories(input, 1)
}

part_02 <- function(input = get_input(day = 1)) {
  elf_calories(input, 3)
}
