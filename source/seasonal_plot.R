seasonal_plot <- function(area,
                          col = wesanderson::wes_palettes[[sample(1:19, 1)]][[sample(1:4, 1)]],  # random color
                          facet = FALSE) 
  
{
  
  seasonal <- readxl::read_excel('./data/seasonal_data_tidy.xlsx')  # was this exported from MATLAB? pretty sure - since did fourier modeling there
  
  area_names <- readRDS(here("data/area_names.rds"))
  
  area_ind <- seasonal$surv_area == area
  
  if(facet == FALSE) {
    
    p <- 
      seasonal[area_ind,] %>% 
      ggplot(aes(x = daynum, y = fourier)) +
      geom_line(size = 1.7, color = col, show.legend = FALSE) +
      geom_ribbon(
        aes(ymin = lower, ymax = upper),
        fill = col,
        alpha = 0.2,
        show.legend = FALSE
      ) +
      ggtitle(area_names[[area,2]]) + 
      theme_light() +
      theme(
        plot.title = element_text(hjust = 0.5),
        panel.grid.minor = element_blank()
      ) +
      scale_x_continuous(
        breaks = c(1, 32, 61, 92, 122, 153, 183, 214, 245, 275, 306, 336),
        labels = c('J', 'F', 'M', 'A', 'M', 'J', 'J', 'A', 'S', 'O', 'N', 'D'),
        limits = c(0.5, 366.5),
        expand = c(0, 0)
      ) +
      scale_y_continuous(limits = c(-1.4, -0.55), expand = c(0, 0)) +
      ylab('Mean Weight-for-Length Z-score') +
      xlab(NULL)  
    
    p
  
  } else {
    
    p <- 
      seasonal %>% 
      left_join(
        area_names
      ) %>% 
      ggplot(aes(x = daynum, y = fourier)) +
      geom_line(size = 1.7, show.legend = FALSE) +
      geom_ribbon(
        aes(ymin = lower, ymax = upper),
        alpha = 0.2,
        show.legend = FALSE
      ) +
      facet_wrap(
        ~ area_name
      )
      
  }
   
}