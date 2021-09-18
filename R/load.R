#' Normalized volume index
#' 
#' Calculate the normalized volume index for resistance exercises
#' 
#' @param repetitions Total repetitions of a particular exercise. 
#' This is classically the product of the number of reps and the number 
#' of working sets per training session e.g., 3 sets of 10 reps = 30 total repetitions 
#' @param total_load Total amount of weight moved e.g., a squats session 
#' of 3 sets with 10 reps with 120 kg the total_load = 3 x 10 x 120.
#' @param body.weight Body weight in kg 
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

