#' Body fat
#' 
#' Estimate body fat percentage using the circumference-based approach
#' by Lahav et al., 2018 published in the British Journal of Nutrition. 
#' This function estimates the body fat percentage and 95% confidence intervals.
#' 
#' Lahav Y, Epstein Y, Kedem R, Schermann H. A novel body circumferences-based estimation of percentage body fat. Br J Nutr. 2018 Mar;119(6):720-725. doi: 10.1017/S0007114518000223. PMID: 29553036.
#' 
#' @param body.height Body height in centimeters
#' @param abdominal.circumference Abdominal circumference in centimeters.
#' @param aneck.circumference Neck circumference in centimeters.
#' @param sex Select sex of athlete (male or female).
#' @return Returns a vector containing estimated bodyfat and 95 % confidence intervals. 
#' @export
body_fat <- function(body_height, abdominal_circumference, neck_circumference, sex = c('male', 'female')) {
  if(sex == 'female') {
    lower <- (19.197 + 7.439) - (0.239 + 0.035) * body_height + 
      (0.808 + 0.029) * abdominal_circumference - (0.518 + 0.128) * neck_circumference
    value <- 19.197 - 0.239 * body.height + 
      0.808 * abdominal_circumference - 0.518 * neck_circumference
    upper <- (19.197 - 7.439) - (0.239 - 0.035) * body_height + 
      (0.808 - 0.029) * abdominal_circumference - (0.518 - 0.128) * neck_circumference
  } 
  
  if(sex == 'male') {
    lower <- (10.111 + 6.541) - (0.239 + 0.035) * body_height + 
      (0.808 + 0.029) * abdominal_circumference - (0.518 + 0.128) * neck_circumference
    value <- 10.111 - 0.239 * body_height + 
      0.808 * abdominal_circumference - 0.518 * neck_circumference
    upper <- (10.111 - 6.541) - (0.239 - 0.035) * body_height + 
      (0.808 - 0.029) * abdominal_circumference - (0.518 - 0.128) * neck_circumference
  }    
  return(c(lower, value, upper))
}


#' Lean body mass
#' 
#' @param body.weight Body weight in kg
#' @param body_fat Body fat in percent 
#' @export
lean_body_mass <- function(body_weight, body_fat) {
  body_weight - (body_weight * body_fat/100) 
}


#' Ideal weight
#' 
#' Estimate ideal weight at preferred body fat percentage
#' 
#' @param lean_body_mass Lean body mass in kg
#' @param desired_body_fat Desired body fat percentage e.g., 12 %.
#' @export
ideal_weight <- function(lean_body_mass, desired_body_fat) {
  lean_body_mass/(1 - desired_body_fat/100)
}


#' Basal metabolic rate 
#' 
#' Estimate the basal metabolic rate using the Harris-Benedict equation.
#' 
#' @param body_weight Body weight in kg
#' @param body_height Body height in m
#' @param age Athlete's age in years
#' @param sex Select sex of athlete (male or female).
#' @export
basal_metabolic_rate <- function(body_weight, body_height, age, sex = c("male", "female")) {
  if(sex == "female") {
    10 * body_weight + 6.25 * body_height - 5 * age - 161
  } 
  
  if(sex == "male") {
    10 *body_weight + 6.25 * body_height - 5 * age + 5
  }
}



