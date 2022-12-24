#!/usr/bin/env Rscript
source(
  here::here("R", "utils.R")
)

args <- commandArgs(trailingOnly = TRUE)

command <- args[1]
day <- as.integer(args[2])
part <- NA

if (!is.na(args[3]) && args[3] == "--part") {
  part <- as.integer(args[4])
}

if (command == "test") {
  test(day = day)
}

if (command == "actual") {
  actual(day = day, part = part)
}
