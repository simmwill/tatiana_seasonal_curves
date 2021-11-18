# Will Simmons
#
# Scope: Plots and saves curves
#
# packages ----------------------------------------------------------------

library(tidyverse)
library(here)

# global ------------------------------------------------------------------

area_names <- readRDS(here("data/area_names.rds"))

source(here("source/seasonal_plot.R"))

areas <- 1:25

area_colors <- 
  tibble(
    surv_area = c(5, 15, 10, 8, 21, 7, 13),  
    color = c("#BA2D0B", # red
              "#73BA9B", # green
              "#7E2395", # purple
              "#F2BB05", # yellow
              "#0EB1D2", # blue
              "#8096B3", # gray
              "#3A3335") # black
  ) %>% 
  left_join(
    area_names %>% mutate(str_replace_all(area_name, "\\/", " \\/ "))
  )



# data import -------------------------------------------------------------

seasonal <- readxl::read_excel(here("/data/seasonal_data_tidy.xlsx"))  
  # was this exported from MATLAB? pretty sure - since did fourier modeling there

# plot function -----------------------------------------------------------

## Facet plot - unused for now
# all_curves_facet <- map(.x = areas, .f = ~seasonal_plot(area = .x))

map_curves <- map2(.x = area_colors$surv_area,
                   .y = area_colors$color,
                   .f = ~seasonal_plot(area = .x,
                                       col = .y))

names <- area_colors$area_name %>% 
  tolower() %>% 
  str_replace_all("\\/", "_") %>% 
  str_replace_all(" ", "_") %>% 
  str_c(".rds")

# test export -------------------------------------------------------------

plot_test_pdf <- here("output/pdf/test")

export_figs <- function(fig, name, fwidth = 10, fheight = 7.5) {
  
  ggsave(
    filename = paste0(name, ".pdf"),
    plot = fig,
    device = "pdf",
    path = plot_test_pdf,
    width = fwidth,
    height = fheight
  )
  
}

export_figs(map_curves[[1]], "chilmari_kaunia_test")

# export ------------------------------------------------------------------

map2(.x = map_curves,
     .y = names,
     .f = ~saveRDS(.x, 
                   paste0(here("output/rds/", .y)))
)

 