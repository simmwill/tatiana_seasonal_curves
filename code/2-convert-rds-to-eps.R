# Will Simmons
#
# Scope: Export RDS plots to EPS
#
# packages ----------------------------------------------------------------

library(tidyverse)
library(here)

# global ------------------------------------------------------------------

source(here("source/eps_pause.R"))

plot_dir_rds <- here("output/rds")
plot_dir_pdf <- here("output/pdf")
plot_dir_eps <- here("output/eps")

# data import -------------------------------------------------------------

figs_list <- list.files(plot_dir_rds, full.names = TRUE) %>%
  .[str_detect(., "\\.rds")]

# figure params
figs_list_dims <-
  tibble(
    fig = figs_list,
    fheight = 8,
    fwidth = 12
  ) 

# exporting PDF
export_figs <- function(fig, fwidth = 10, fheight = 7.5) {
  
  figname <- basename(fig) %>%
    str_remove_all(., ".rds")
  
  ggsave(
    filename = paste0(figname, ".pdf"),
    plot = readRDS(fig),
    device = "pdf",
    path = plot_dir_pdf,
    width = fwidth,
    height = fheight
  )
  
}

pmap(figs_list_dims, export_figs)

# converting PDF to EPS via Terminal >> AppleScript - works better than saving EPS in ggsave
rstudioapi::terminalExecute(
  "osascript /Users/willsimmons/Documents/EI/tatiana_seasonal_curves/source/export_as_eps_ei_curves.scpt"
)

eps_pause()

# removing .pdf from new .eps files - didn't want to figure out in AppleScript
rstudioapi::terminalExecute(
  command = "rename -f 's/\\.pdf.eps$/.eps/' *.pdf.eps",  # -f allows force overwrite existing files
  workingDir = "./output/eps/"
)
