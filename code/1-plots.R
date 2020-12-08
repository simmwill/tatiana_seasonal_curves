# Will Simmons
#
# Scope: Plots and saves curves
#
# packages ----------------------------------------------------------------

library(tidyverse)
library(here)

# global ------------------------------------------------------------------

source(here("source/seasonal_plot.R"))

areas <- 1:25

# data import -------------------------------------------------------------

seasonal <- readxl::read_excel(here("/data/seasonal_data_tidy.xlsx"))  
  # was this exported from MATLAB? pretty sure - since did fourier modeling there

area_names <- readRDS(here("data/area_names.rds"))

# plot function -----------------------------------------------------------

seasonal_plot(area = 5)

plots <- map(.x = areas, .f = ~seasonal_plot(area = .x))

