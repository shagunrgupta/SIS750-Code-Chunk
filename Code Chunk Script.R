## Title: Code Chunk R Script for SIS-750 Data Analysis 
## Author: Shagun Gupta
## Date: 5/6/2023

#Load packages ---- 
library(tidyverse)
library(ggplot2)
library(dplyr)
library(sjPlot) #for plotting Likert scales
library(sjmisc) #imports several useful functions
library(ggrepel) #cleaner text labels
library(patchwork)

#Load data ----
ihds2 <- read_tsv("ihds2.tsv")

#Data wrangling ---- 

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

# Plots ----

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

#patchwork both plots together
plot1 | plot2 | 
  plot_layout(guides = 'collect', ncol = 2)

