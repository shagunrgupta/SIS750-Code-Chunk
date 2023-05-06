Code Chunk: Knitr & Kable Extra Tables for Research Purposes
================

## Why this table

Very few sentences of what this is and what you need. Put packages in of
what is required to run it. Put the packages and and use it in an
example.

This is an R Markdown format used for publishing markdown documents to
GitHub. When you click the **Knit** button all R code chunks are run and
a markdown file (.md) suitable for publishing to GitHub is generated.

## Including Code

You can include R code in the document as follows:

``` r
# packages
library(tidyverse)
library(knitr)
library(kableExtra)

summary(cars)
```

    ##      speed           dist       
    ##  Min.   : 4.0   Min.   :  2.00  
    ##  1st Qu.:12.0   1st Qu.: 26.00  
    ##  Median :15.0   Median : 36.00  
    ##  Mean   :15.4   Mean   : 42.98  
    ##  3rd Qu.:19.0   3rd Qu.: 56.00  
    ##  Max.   :25.0   Max.   :120.00

## Notes

notes on why you think it’s necessary - this might not be beautiful, but
this is a helpful tool when putting together a large and complex table
for data projects.

I wrote this code chunk to help create a complex table. This is a nice
code that creates useful output. I am a student that is looking to go on
to get a PhD. This code chunk is a good example that I can take and use
for other projects.

## Example output

![](Code-Chunk-GitHub_files/figure-gfm/pressure-1.png)<!-- -->

Note that if you want to change the font to make it more fun and less
functional, you can try out these options:

Note that the `echo = FALSE` parameter was added to the code chunk to
prevent printing of the R code that generated the plot.
