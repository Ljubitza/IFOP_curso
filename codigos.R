num_aleatorios <- rnorm(1000, mean = 0, sd = 1)
datos<- rnorm(1000)
hist(datos)
summary(datos)

vector<- vector (length=3)
vector

typeof(vector)
vector_char <- vector(mode="character", length=3)
vector_char

typeof(vector_char)

library(tidyverse)
library(palmerpenguins)
penguins


glimpse(penguins)



library(tidymodels) 
set.seed(123) 
penguin_split <- initial_split(penguins_df, strata = sex) 
penguin_train <- training(penguin_split)
penguin_test <- testing(penguin_split)
penguin_split

set.seed (123)
penguin_boot <- bootstraps(penguin_train) 
penguin_boot


parsnip_addin()

glm_spec <- logistic_reg() %>%
set_engine("glm")
glm_spec

rf_spec <- rand_forest() %>%
set_mode("classification") %>%
set_engine("ranger")
rf_spec

penguin_wf <- workflow() %>%
add_formula(sex ~ .)
penguin_wf

glm_rs <- penguin_wf %>% 
add_model(glm_spec) %>% 
fit_resamples( 
resamples = penguin_boot,
control = control_resamples
(save_pred = TRUE)
                  )
glm_rs

glm_rs <- penguin_wf %>%
  add_model(glm_spec) %>%
  fit_resamples(
    resamples = penguin_boot,
    control = control_resamples(save_pred = TRUE)
  )
glm_rs