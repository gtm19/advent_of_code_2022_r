get_input <- function(day, test = FALSE) {
  stopifnot(
    !missing(day),
    is.numeric(day)
  )

  here::here(
    "input",
    if(test) "test" else "actual",
    sprintf("day_%02d.txt", day)
  )
}

test <- function(day) {
  day <- as.integer(day)

  testthat::test_file(
    here::here(
      "tests",
      sprintf("test-day_%02d.R", day)
    )
  )
}

actual <- function(day, part) {
  stopifnot(
    !missing(part)
  )

  r_source <- here::here("R", sprintf("day_%02d.R", day))

  source(r_source, local = TRUE)

  if (1 == part) {
    return(
      part_01(input = get_input(day = day, test = FALSE))
    )
  }

  if (2 == part) {
    return(
      part_02(input = get_input(day = day, test = FALSE))
    )
  }
}
