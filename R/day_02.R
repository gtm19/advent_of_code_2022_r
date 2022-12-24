# https://adventofcode.com/2022/day/2
source(here::here("R", "utils.R"))

opponent_lookup <- c(
  A = "rock",
  B = "paper",
  C = "scissors"
)

options <- list(
  rock = list(
    points = 1,
    win = "scissors",
    loss = "paper"
  ),
  paper = list(
    points = 2,
    win = "rock",
    loss = "scissors"
  ),
  scissors = list(
    points = 3,
    win = "paper",
    loss = "rock"
  )
)

outcomes <- list(
  win = 6,
  draw = 3,
  loss = 0
)

calculate_points <- function(opponent, you = NULL, result = NULL) {
  stopifnot(
    !is.null(you) | !is.null(result)
  )

  if (!is.null(you)) {
    result <- if (options[[opponent]]$win == you) {
      "loss"
    } else if (options[[opponent]]$loss == you) {
      "win"
    } else {
      "draw"
    }
  }

  if (!is.null(result)) {
    you <- if (result == "win") {
      options[[opponent]]$loss
    } else if (result == "loss") {
      options[[opponent]]$win
    } else {
      opponent
    }
  }

  outcomes[[result]] + options[[you]]$points

}

#' Score the game
#' 
#' @param input the path of the input file
#' @param xyz a named vector mapping X, Y, and Z to whatever they represent
#' @param what either "you" or "result": does XYZ respresent your choice
#' of rock, paper, or scissors, or the desired output of the game?
#' @param .quiet should the function print a nice message of the result?
score_game <- function(input, xyz, what = c("you", "result"), .quiet = FALSE) {
  what <- match.arg(what)
  lines <- strsplit(readLines(input), " ")
  scores <- lapply(
    lines,
    function(opt) {
      args <- list(
        opponent = opponent_lookup[[opt[1]]]
      )

      args[[what]] <- xyz[[opt[2]]]

      do.call(calculate_points, args = args)
    }
  )

  total_score <- sum(as.integer(scores))

  if (!.quiet) {
    message(
      glue::glue("The total score if the strategy is followed exactly is {total_score}")
    )
  }

  return(total_score)
}

part_01 <- function(input = get_input(day = 2)) {
  score_game(input, xyz = c(X = "rock", Y = "paper", Z = "scissors"), what = "you")
}

part_02 <- function(input = get_input(day = 2)) {
  score_game(input, xyz = c(X = "loss", Y = "draw", Z = "win"), what = "result")
}
