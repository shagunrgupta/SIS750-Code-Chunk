Exemplary Code Chunk for SIS-750 Final Portfolio
================

## Brief Description

This code chunk creates a plot for data measured on Likert scales using
the `plot_likert` function from the `sjPlot` package. I have used the
India Human Development Survey - II data, specifically the variables
that measure confidence in various institutions in India. The plot shown
below shows levels of confidence among sampled households across all
states in the survey. The `.R` script for this code is provided as a
separate file in the GitHub repository.

## Code for Data Wrangling

The code used to wrangle the data is as follows:

``` r
# convert confidence variables to factors
confidence <- c('CI1' ,'CI2', 'CI3', 'CI4', 'CI5', 'CI6', 'CI7', 'CI8', 'CI9', 'CI10',
                'CI11', 'CI12')
ihds2[,confidence] <- lapply(ihds2[,confidence] , factor)

# create new data frame that only includes the 12 confidence variables for all states plot
ihds_likert <- find_var(ihds2, pattern = "CI", out = "df")

#create new dataset for Delhi
ihds_del = ihds2 %>%
  filter(STATEID == 7)

# convert confidence variables to factors
confidence <- c('CI1' ,'CI2', 'CI3', 'CI4', 'CI5', 'CI6', 'CI7', 'CI8', 'CI9', 'CI10',
                'CI11', 'CI12')
ihds_del[,confidence] <- lapply(ihds_del[,confidence] , factor)

# create new data frame that only includes the 12 confidence variables for Delhi plot
ihds_del_likert <- find_var(ihds_del, pattern = "CI", out = "df")
```

## Code for Plot: Confidence in Indian Institutions

The code used to build each plot is as follows:

``` r
# set theme for plot1
set_theme(legend.pos = "bottom",
          legend.just = "center",
          title.align = "center",
          title.size = 2)

# build the plot for all states
plot1 = plot_likert(ihds_likert, 
            catcount = 3,
            grid.range = c(1.2, 1.4), 
            expand.grid = FALSE,
            values = "sum.outside",
            show.prc.sign = TRUE,
            show.n = FALSE,
            axis.titles = c("Indicators", "% of Households"), 
            axis.labels = c("Confidence in Politicians", 
                            "Confidence in Military", 
                            "Confidence in Police", 
                            "Confidence in State Government",
                            "Confidence in Newspapers/News Media", 
                            "Confidence in Panchayats/Municipal Bodies",
                            "Confidence in Government Schools", 
                            "Confidence in Private Schools",
                            "Confidence in Government Hospitals", 
                            "Confidence in Private Hospitals",
                            "Confidence in Courts", "Confidence in Banks"), 
            title = "All States",
            legend.title = "Levels of Confidence",
            legend.labels = c("Great Deal of Confidence", 
                              "Only Some Confidence", 
                              "Hardly Any Confidence"),
            legend.pos = "bottom",
            group.legend.options = list(nrow=1),
            geom.colors = c("#004c4c", "#008080", "#66b2b2"))

# set theme for plot2
set_theme(legend.pos = "bottom",
          legend.just = "center",
          title.align = "center",
          title.size = 2)

# build the plot for Delhi
plot2 = plot_likert(ihds_del_likert, 
            catcount = 3,
            grid.range = c(1.2, 1.4), 
            expand.grid = FALSE,
            values = "sum.outside",
            show.prc.sign = TRUE,
            show.n = FALSE,
            axis.titles = c("", "% of Households"), 
            axis.labels = c("Confidence in Politicians", 
                            "Confidence in Military", 
                            "Confidence in Police", 
                            "Confidence in State Government",
                            "Confidence in Newspapers/News Media", 
                            "Confidence in Municipal Body",
                            "Confidence in Government Schools", 
                            "Confidence in Private Schools",
                            "Confidence in Government Hospitals", 
                            "Confidence in Private Hospitals",
                            "Confidence in Courts", 
                            "Confidence in Banks"), 
            title = "Delhi",
            legend.title = "Levels of Confidence",
            legend.labels = c("Great Deal of Confidence", 
                              "Only Some Confidence", 
                              "Hardly Any Confidence"),
            legend.pos = "bottom",
            group.legend.options = list(nrow=1),
            geom.colors = c("#004c4c", "#008080", "#66b2b2"))
```

The code used to generate the `patchwork` plot is as follows:

``` r
#patchwork both plots together
plot1 | plot2 | 
  plot_layout(guides = 'collect', ncol = 2)
```

<img src="README_files/figure-gfm/plot Likert patchwork-1.png" style="display: block; margin: auto;" />
