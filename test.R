remotes::install_local("package", force=TRUE)
library("bodybuildR")
library("tidyverse")

# Body composition
body_weight = 106
body_height = 193
body_fat=27 
ab_circ
age = 30
sex="male"

bodybuildR::basal_metabolic_rate(body_weight, body_height, age, sex)
bodybuildR::body_fat()
bodybuildR::ideal_weight()
bodybuildR::lean_body_mass(body_weight, body_fat)

# Training
repetitions = 5
sets = 3
load = 100
total_load = sets * load

bodybuildR::norm_volume_index(repetitions, total_load, body_weight)
bodybuildR::training_intensity(sets, repetitions, load)

onerm_in <- data.frame(expand.grid(load = seq(from = 5, to = 200, by = 5), 
                        repetitions = seq(from = 1, to = 20, by = 1)))

brzycki <- bodybuildR::onerm_brzycki(onerm_in$load, onerm_in$repetitions)
epley <- bodybuildR::onerm_epley(onerm_in$load, onerm_in$repetitions)
lombardi <- bodybuildR::onerm_lombardi(onerm_in$load, onerm_in$repetitions)
oconner <- bodybuildR::onerm_oconner(onerm_in$load, onerm_in$repetitions)
wathen <- bodybuildR::onerm_wathen(onerm_in$load, onerm_in$repetitions)

onerm_in <- do.call("rbind", replicate(5, onerm_in, simplify = FALSE))
onerm_calc <- c(brzycki, epley, lombardi, oconner, wathen)
onerm_name <- c(rep("brzycki", 800), rep("epley", 800), rep("lombardi", 800),rep("oconner", 800),rep("wathen", 800))

onerm_df <- cbind(names = onerm_name, calc = onerm_calc, cond = onerm_in)

onerm_df %>%
  ggplot(aes(cond.load, calc, fill=cond.repetitions)) + 
  geom_point(pch=21, colour="grey20") + 
  scale_fill_viridis_c() + 
  facet_wrap(~names) + 
  theme_bw() +
  theme(text = element_text(family="Times"), 
        legend.position="top") +
  xlab("Load [in kg]") +
  ylab("Calculated 1RPM [in kg]") + 
  labs(fill = "Reps")

