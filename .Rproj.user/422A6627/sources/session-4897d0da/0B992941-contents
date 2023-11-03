

# #------------------ load packages 
# METHOD 1
suppressMessages(library(pander))  
suppressMessages(library(dplyr))  
suppressMessages(library(tidytext))  
suppressMessages(library(stringr))  
suppressMessages(library(ggplot2))  
suppressMessages(library(data.table))  

# # #------------------ load packages 
# # METHOD 2
# # This does package installation check
# 
# # define list of packages for session
# .packages = c("pander", "dplyr", "tidytext",
#               "stringr", "ggplot2", "data.table")
# 
# # install missing packages 
# .inst <- .packages %in% installed.packages()
# if(length(.packages[!.inst]) > 0) install.packages(.packages[!.inst])
# 
# # Load packages
# suppressMessages(library(pander))  
# suppressMessages(library(dplyr))  
# suppressMessages(library(tidytext))  
# suppressMessages(library(stringr))  
# suppressMessages(library(ggplot2))  
# suppressMessages(library(data.table))  

#------------------ ggplot theme 
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




