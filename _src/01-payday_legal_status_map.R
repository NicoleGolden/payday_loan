
# load configuration
source("_config/config.R")

# load payday loan legal status data
df <- read.csv("data/payday_loan_law_2006_vs_2015_vs_2020.csv")

################ 2006 payday loan map (color by legal status)

# subset data
df_2006 <- df[df$year == 2006, ]

# legal status map
p1 <- plot_usmap(data = df_2006, 
           regions = "state",
           values = "restriction_level", 
           color = "white",
           # add abbr label for each state
           labels = T,
           label_color = "white") + 
  scale_fill_manual(
    values = c(
      "legal" = "#7c9dad",
      "effective ban" = "#f5c344",
      "prohibited" = "red")) + 
  theme(plot.title=element_text(hjust=0.5, size=12),
        legend.position = "bottom") + 
  labs(title = "2006 Payday Loan Legal Status" , 
       fill = "Restriction Level")

# Set label font size
p1$layers[[2]]$aes_params$size <- 1.8
print(p1)

# save plot 
ggsave("figure/payday_2006_status.png",
       p1, 
       dpi=1000)

################ 2020 payday loan map (color by legal status)

# subset data
df_2020 <- df[df$year == 2020, ]

# legal status map
p2 <- plot_usmap(data = df_2020, 
           regions = "state",
           values = "restriction_level", 
           color = "white",
           # add abbr label for each state
           labels = T,
           label_color = "white") + 
  scale_fill_manual(
    values = c(
      "legal" = "#7c9dad",
      "effective ban" = "#f5c344",
      "prohibited" = "red")) + 
  theme(plot.title=element_text(hjust=0.5, size=12),
        legend.position = "bottom") + 
  labs(title = "2020 Payday Loan Legal Status" , 
       fill = "Restriction Level")

# Set label font size
p2$layers[[2]]$aes_params$size <- 1.8
print(p2)

# save plot 
ggsave("figure/payday_2020_status.png",
       p2, 
       dpi=1000)


