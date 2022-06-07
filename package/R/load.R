#' Normalized volume index
#'
#' Calculate the normalized volume index for resistance exercises
#'
#' @param repetitions Total repetitions of a particular exercise.
#' This is classically the product of the number of reps and the number
#' of working sets per training session e.g., 3 sets of 10 reps = 30 total repetitions
#' @param total_load Total amount of weight moved e.g., a squats session
#' of 3 sets with 10 reps with 120 kg the total_load = 3 x 10 x 120.
#' @param body_weight Body weight in kg
#' @export
norm_volume_index <- function(repetitions, total_load, body_weight) {
  round((repetitions * total_load) / body_weight ^ 0.67,1)
}

#' Training Intensity
#'
#' Calculate the training intensity.
#'
#' @param sets Number of sets of an exercise per training session.
#' @param repetitions Number of repetitions per set.
#' @param load Weight used during the exercise in kg.
#' @export
# Equation to calculate the training intensity
training_intensity <- function(sets, repetitions, load) {
  (sets * repetitions * load) / (sets * repetitions)
}

#' 1RM after Epley
#'
#' Calculate the 1RM
#'
#' @param repetitions Number of repetitions.
#' @param load Weight used during the exercise in kg.
#' @export
# Equation to calculate the 1RM after Epley
onerm_epley <- function(load, repetitions) {
  ifelse(repetitions >= 1, load * (1 + (repetitions/30)), warning("Repititions must be >= 1"))
}

#' 1RM after Brzycki
#'
#' Calculate the 1RM
#'
#' @param repetitions Number of repetitions.
#' @param load Weight used during the exercise in kg.
#' @export
# Equation to calculate the 1RM after Brzycki
onerm_brzycki <- function(load, repetitions) {
  ifelse(repetitions >= 1, load / (1.0278 - 0.0278 * repetitions), warning("Repititions must be >= 1"))
}

#' 1RM after Lombardi
#'
#' Calculate the 1RM
#'
#' @param repetitions Number of repetitions.
#' @param load Weight used during the exercise in kg.
#' @export
# Equation to calculate the 1RM after Lombardi
onerm_lombardi <- function(load, repetitions) {
  ifelse(repetitions >= 1, load * repetitions^0.1, warning("Repititions must be >= 1"))
}

#' 1RM after O'Conner
#'
#' Calculate the 1RM
#'
#' @param repetitions Number of repetitions.
#' @param load Weight used during the exercise in kg.
#' @export
# Equation to calculate the 1RM after O'Conner
onerm_oconner <- function(load, repetitions) {
  ifelse(repetitions >= 1, load * (1 + (repetitions/40)), warning("Repititions must be >= 1"))
}

#' 1RM after Wathen
#'
#' Calculate the 1RM
#'
#' @param repetitions Number of repetitions.
#' @param load Weight used during the exercise in kg.
#' @export
# Equation to calculate the 1RM after Wathen
onerm_wathen <- function(load, repetitions) {
  ifelse(repetitions >= 1, (100 * load) / (48.8 + 53.8 * exp(-0.075 * repetitions)), warning("Repititions must be >= 1"))
}
