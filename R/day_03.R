# https://adventofcode.com/2022/day/2
source(here::here("R", "utils.R"))

compartmentalise <- function(string) {
  # splits string into two equal pieces
  str_length <- nchar(string)
  starts <- c(1, str_length / 2 + 1)
  ends <- c(str_length / 2, str_length)
  substring(string, starts, ends)
}

tally <- function(strings) {
  # produces a table of items and their counts
  lapply(
    strsplit(strings, ""),
    \ (items) {
      table(items)
    }
  )
}

common_items <- function(tables) {
  # takes list of tables and produces vector of the common item names
  items <- lapply(tables, names)
  Reduce(intersect, items)
}

score_items <- function(items) {
  # takes vector of item names and returns their score(s)
  all_items <- c(letters, LETTERS)
  stopifnot(
    all(items %in% all_items)
  )
  match(items, all_items)
}

score_common_items <- function(input, .quiet = FALSE) {
  lines <- readLines(input)

  total <- sapply(
    lines,
    \ (line) {
      line |>
      compartmentalise() |>
      tally() |>
      common_items() |>
      score_items()
    }
  ) |>
    sum()

  if (!.quiet) {
    message(
      glue::glue(
        "The sum of the priorities of item types amongst compartments is {total}"
      )
    )
  }

  total
}

score_groups <- function(input, .quiet = FALSE) {
  lines <- readLines(input)

  groups <- split(lines, ceiling(seq_along(lines) / 3))

  total <- sapply(
    groups,
    \ (group) {
      group |>
        tally() |>
        common_items() |>
        score_items()
    }
  ) |>
  sum()

  if (!.quiet) {
    message(
      glue::glue(
        "The sum of the priorities of item types amongst groups is {total}"
      )
    )
  }

  total
}

part_01 <- function(input = get_input(day = 3)) {
  score_common_items(input)
}

part_02 <- function(input = get_input(day = 3)) {
  score_groups(input)
}
