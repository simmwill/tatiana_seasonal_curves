Creating Seasonal Curves in R
================
Will Simmons
9/28/2019

``` r
library(tidyverse)
```

    ## -- Attaching packages ---------------------------------------------------------------------------- tidyverse 1.2.1 --

    ## v ggplot2 3.2.1     v purrr   0.3.2
    ## v tibble  2.1.3     v dplyr   0.8.3
    ## v tidyr   1.0.0     v stringr 1.4.0
    ## v readr   1.3.1     v forcats 0.4.0

    ## -- Conflicts ------------------------------------------------------------------------------- tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(readxl)
```

## Importing and viewing the data

``` r
seasonal = read_excel('./data/seasonal_data_tidy.xlsx')

seasonal
```

    ## # A tibble: 9,150 x 12
    ##    daynum fourier  lower  upper surv_area raw_mean movavg61 gaussian61
    ##     <dbl>   <dbl>  <dbl>  <dbl>     <dbl> <lgl>    <lgl>    <lgl>     
    ##  1      1  -0.701 -0.749 -0.654         1 NA       NA       NA        
    ##  2      2  -0.699 -0.748 -0.650         1 NA       NA       NA        
    ##  3      3  -0.696 -0.745 -0.647         1 NA       NA       NA        
    ##  4      4  -0.693 -0.742 -0.643         1 NA       NA       NA        
    ##  5      5  -0.689 -0.739 -0.639         1 NA       NA       NA        
    ##  6      6  -0.686 -0.734 -0.637         1 NA       NA       NA        
    ##  7      7  -0.682 -0.729 -0.635         1 NA       NA       NA        
    ##  8      8  -0.680 -0.727 -0.633         1 NA       NA       NA        
    ##  9      9  -0.678 -0.726 -0.631         1 NA       NA       NA        
    ## 10     10  -0.676 -0.723 -0.629         1 NA       NA       NA        
    ## # ... with 9,140 more rows, and 4 more variables: tmax_raw_mean <lgl>,
    ## #   tmax_movavg61 <lgl>, tmin_raw_mean <lgl>, tmin_movavg61 <lgl>

## Trying out some curves

Weʻll be drawing curves for Areas 5, 17, 11, 10, 7, 15

# Area 5

``` r
index_5 = seasonal$surv_area == 5

area5_plot =
seasonal[index_5,] %>% 
  ggplot(aes(x = daynum, y = fourier)) +
  geom_line(size = 1.7, color = "#BA2D0B", show.legend = FALSE) +
  geom_ribbon(aes(ymin = lower, ymax = upper), fill = "#BA2D0B", alpha = 0.17, show.legend = FALSE) + # adding confidence limits
  
  ggtitle('Area 5: Chilmari/Kaunia') + 
  theme_light() +
  theme(plot.title = element_text(hjust = 0.5)) + # centering title - put in code after main theme
  theme(panel.grid.minor = element_blank()) +
  
  # this code sets the axis bounds and removes unnecessary space around plot
  scale_x_continuous(
    breaks = c(1, 32, 61, 92, 122, 153, 183, 214, 245, 275, 306, 336), 
    labels = c('J','F','M','A','M','J','J','A','S','O','N','D'),
    limits = c(0.5, 366.5), 
    expand = c(0, 0)) +
  scale_y_continuous(limits = c(-1.35, -0.65), expand = c(0, 0)) +
  
  ylab('Mean Weight-for-Length Z-score') +
  xlab(NULL)

area5_plot
```

![](seasonal_curves_files/figure-gfm/area5_plot-1.png)<!-- -->

``` r
ggsave("area5_seasonal.pdf",
       area5_plot,
       width = 6,
       height = 4)

ggsave("area5_seasonal.png",
       area5_plot,
       width = 6,
       height = 4,
       dpi = 300)
```

# Area 17

``` r
index_17 = seasonal$surv_area == 17

area17_plot =
seasonal[index_17,] %>% 
  ggplot(aes(x = daynum, y = fourier)) +
  geom_line(size = 1.7, color = "#73BA9B", show.legend = FALSE) +
  geom_ribbon(aes(ymin = lower, ymax = upper), fill = "#73BA9B", alpha = 0.2, show.legend = FALSE) + # adding confidence limits
  
  ggtitle('Area 17: Golapganj/Fenchuganj') + 
  theme_light() +
  theme(plot.title = element_text(hjust = 0.5)) + # centering title - put in code after main theme
  theme(panel.grid.minor = element_blank()) +
  
  # this code sets the axis bounds and removes unnecessary space around plot
  scale_x_continuous(
    breaks = c(1, 32, 61, 92, 122, 153, 183, 214, 245, 275, 306, 336), 
    labels = c('J','F','M','A','M','J','J','A','S','O','N','D'),
    limits = c(0.5, 366.5), 
    expand = c(0, 0)) +
  scale_y_continuous(limits = c(-1.35, -0.65), expand = c(0, 0)) +
  
  ylab('Mean Weight-for-Length Z-score') +
  xlab(NULL)

area17_plot
```

![](seasonal_curves_files/figure-gfm/area17_plot-1.png)<!-- -->

``` r
ggsave("area17_seasonal.pdf",
       area17_plot,
       width = 6,
       height = 4)

ggsave("area17_seasonal.png",
       area17_plot,
       width = 6,
       height = 4,
       dpi = 300)
```

# Area 11

``` r
index_11 = seasonal$surv_area == 11

area11_plot =
seasonal[index_11,] %>% 
  ggplot(aes(x = daynum, y = fourier)) +
  geom_line(size = 1.7, color = "#01110A", show.legend = FALSE) +
  geom_ribbon(aes(ymin = lower, ymax = upper), fill = "#01110A", alpha = 0.2, show.legend = FALSE) + # adding confidence limits
  
  ggtitle("Area 11: Moheshkhali/Cox's Bazaar") + 
  theme_light() +
  theme(plot.title = element_text(hjust = 0.5)) + # centering title - put in code after main theme
  theme(panel.grid.minor = element_blank()) +
  
  # this code sets the axis bounds and removes unnecessary space around plot
  scale_x_continuous(
    breaks = c(1, 32, 61, 92, 122, 153, 183, 214, 245, 275, 306, 336), 
    labels = c('J','F','M','A','M','J','J','A','S','O','N','D'),
    limits = c(0.5, 366.5), 
    expand = c(0, 0)) +
  scale_y_continuous(limits = c(-1.35, -0.65), expand = c(0, 0)) +
  
  ylab('Mean Weight-for-Length Z-score') +
  xlab(NULL)

area11_plot
```

![](seasonal_curves_files/figure-gfm/area11_plot-1.png)<!-- -->

``` r
ggsave("area11_seasonal.pdf",
       area11_plot,
       width = 6,
       height = 4)

ggsave("area11_seasonal.png",
       area11_plot,
       width = 6,
       height = 4,
       dpi = 300)
```

# Area 10

``` r
index_10 = seasonal$surv_area == 10

area10_plot =
seasonal[index_10,] %>% 
  ggplot(aes(x = daynum, y = fourier)) +
  geom_line(size = 1.7, color = "#0EB1D2", show.legend = FALSE) +
  geom_ribbon(aes(ymin = lower, ymax = upper), fill = "#0EB1D2", alpha = 0.2, show.legend = FALSE) + # adding confidence limits
  
  ggtitle("Area 10: Mirzaganj/Patuakhali Sadar") + 
  theme_light() +
  theme(plot.title = element_text(hjust = 0.5)) + # centering title - put in code after main theme
  theme(panel.grid.minor = element_blank()) +
  
  # this code sets the axis bounds and removes unnecessary space around plot
  scale_x_continuous(
    breaks = c(1, 32, 61, 92, 122, 153, 183, 214, 245, 275, 306, 336), 
    labels = c('J','F','M','A','M','J','J','A','S','O','N','D'),
    limits = c(0.5, 366.5), 
    expand = c(0, 0)) +
  scale_y_continuous(limits = c(-1.35, -0.65), expand = c(0, 0)) +
  
  ylab('Mean Weight-for-Length Z-score') +
  xlab(NULL)

area10_plot
```

![](seasonal_curves_files/figure-gfm/area10_plot-1.png)<!-- -->

``` r
ggsave("area10_seasonal.pdf",
       area10_plot,
       width = 6,
       height = 4)

ggsave("area10_seasonal.png",
       area10_plot,
       width = 6,
       height = 4,
       dpi = 300)
```

# Area 7

``` r
index_7 = seasonal$surv_area == 7

area7_plot =
seasonal[index_7,] %>% 
  ggplot(aes(x = daynum, y = fourier)) +
  geom_line(size = 1.7, color = "#E2C290", show.legend = FALSE) +
  geom_ribbon(aes(ymin = lower, ymax = upper), fill = "#E2C290", alpha = 0.2, show.legend = FALSE) + # adding confidence limits
  
  ggtitle("Area 7: Shakhipur/Sreepur") + 
  theme_light() +
  theme(plot.title = element_text(hjust = 0.5)) + # centering title - put in code after main theme
  theme(panel.grid.minor = element_blank()) +
  
  # this code sets the axis bounds and removes unnecessary space around plot
  scale_x_continuous(
    breaks = c(1, 32, 61, 92, 122, 153, 183, 214, 245, 275, 306, 336), 
    labels = c('J','F','M','A','M','J','J','A','S','O','N','D'),
    limits = c(0.5, 366.5), 
    expand = c(0, 0)) +
  scale_y_continuous(limits = c(-1.35, -0.65), expand = c(0, 0)) +
  
  ylab('Mean Weight-for-Length Z-score') +
  xlab(NULL)

area7_plot
```

![](seasonal_curves_files/figure-gfm/area7_plot-1.png)<!-- -->

``` r
ggsave("area7_seasonal.pdf",
       area7_plot,
       width = 6,
       height = 4)

ggsave("area7_seasonal.png",
       area7_plot,
       width = 6,
       height = 4,
       dpi = 300)
```

# Area 15

``` r
index_15 = seasonal$surv_area == 15

area15_plot =
seasonal[index_15,] %>% 
  ggplot(aes(x = daynum, y = fourier)) +
  geom_line(size = 1.7, color = "#748CAB", show.legend = FALSE) +
  geom_ribbon(aes(ymin = lower, ymax = upper), fill = "#748CAB", alpha = 0.2, show.legend = FALSE) + # adding confidence limits
  
  ggtitle("Area 15: Daulatpur/Gangni") + 
  theme_light() +
  theme(plot.title = element_text(hjust = 0.5)) + # centering title - put in code after main theme
  theme(panel.grid.minor = element_blank()) +
  
  # this code sets the axis bounds and removes unnecessary space around plot
  scale_x_continuous(
    breaks = c(1, 32, 61, 92, 122, 153, 183, 214, 245, 275, 306, 336), 
    labels = c('J','F','M','A','M','J','J','A','S','O','N','D'),
    limits = c(0.5, 366.5), 
    expand = c(0, 0)) +
  scale_y_continuous(limits = c(-1.35, -0.65), expand = c(0, 0)) +
  
  ylab('Mean Weight-for-Length Z-score') +
  xlab(NULL)

area15_plot
```

![](seasonal_curves_files/figure-gfm/area15_plot-1.png)<!-- -->

``` r
ggsave("area15_seasonal.pdf",
       area15_plot,
       width = 6,
       height = 4)

ggsave("area15_seasonal.png",
       area15_plot,
       width = 6,
       height = 4,
       dpi = 300)
```
