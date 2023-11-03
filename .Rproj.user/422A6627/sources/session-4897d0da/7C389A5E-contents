


#----------- 1. Load Libraries

# data clean
suppressMessages(library(dplyr))      # sample_n()
suppressMessages(library(data.table))
suppressMessages(library(tidytext)) # unnest_tokens()
suppressMessages(library(stringr)) # For managing text
suppressMessages(library(pander)) # pander()


# plot
suppressMessages(library(usmap))    
suppressMessages(library(ggplot2))
suppressMessages(library(scales))  # comma_format() # this formats large numbers in ggplot

#------------------ 2. ggplot theme 
theme <- theme(
  # remove Background
  panel.background = element_blank(),
  panel.border = element_blank(),
  panel.grid = element_blank(),
  axis.line = element_line(colour = "black"),
  # no legend 
  legend.position = "none",   
  # axis text 
  axis.text = element_text(size = 6),
  axis.title = element_text(size = 8),
  # X, Y axis text 
  axis.title.x = element_text(face="bold", colour="#e17b83", size=12),
  axis.title.y = element_text(face="bold", colour="#e17b83", size=12),
  # plot setting
  plot.margin = margin(0.3,.1,0.3,.1, "cm"),
  plot.caption = element_text(size = 6,
                              face = "italic")
)
