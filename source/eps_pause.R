eps_pause <- function() {
  
  ANSWER <- readline(prompt="Pausing for Adobe Illustrator to begin converting files.
                             Navigate to Illustrator, then enter Y or [Enter] to continue once you have confirmed.
                             Enter any other character or [Esc] to cancel.")
  
  if(substr(tolower(ANSWER), 1, 1) == "y" | substr(tolower(ANSWER), 1, 1) == "") { # starts with y or [Enter]
    cat("Continuing...\n")
  } else {
    stop("Cancelled.\n")
  }
  
} 