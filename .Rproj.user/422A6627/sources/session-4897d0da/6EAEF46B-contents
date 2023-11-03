
#------------------------ 1. Prep

# load package & theme 
source("Project1_TextAnalysis/_config/config.R")

# load data
text <- read.table("Project1_TextAnalysis/data/data.txt",sep =",",header = F)

# # check data
# head(text)
# dim(text)

#------------------------ 2. Data Cleaning

# paste text
text <- paste(text, collapse = " ")

# Remove slashes
text <- str_replace_all(text, pattern = '\"', replacement = "") 

# Remove \n
text <- str_replace_all(text, pattern = '\n', replacement = "") 

#Replace with quote
text <- str_replace_all(text, pattern = '\u0092', replacement = "'") 

#Replace with quote
text <- str_replace_all(text, pattern = '\u0091', replacement = "'") 

# make it to tibble data format (neater data frame)
text_df <- data_frame(Text = text) 

# text: unnest_tokens
text_words <- text_df %>% 
  unnest_tokens(output = word, input = Text) 

# load stop words 
data(stop_words)

# Remove stop words
text_words  <- 
  text_words  %>%
  anti_join(stop_words) 

# count words
text_wordcounts <- 
  text_words  %>% 
  count(word, sort = TRUE)

#------------------------ 3. Table: 

# Top 30 Most Frequently Used Words in NFPs Session I & Session II presentations

# display top 30 words
pander(head(text_wordcounts, 30),
       style='rmarkdown' )

# rank text count 
text_wordcounts <- 
  text_wordcounts %>% 
  filter(n >1) %>% 
  mutate(word = reorder(word,n))

# check dim
dim(text_wordcounts)

# extract top 30 keywords
text_wordcounts30 <- 
  text_wordcounts[1:30, ]

# show top 30 keywords 
data.table(text_wordcounts30)

# save data 
fwrite(text_wordcounts30,
       "Project1_TextAnalysis/cache/text_wordcounts30.csv", 
       row.names = F)

#------------------------ 4. Figure

# Top 30 Most Frequently Used Words in NFPs Session I & Session II presentations

# plot
p1 <- ggplot(data = text_wordcounts30, 
       aes(word, n)) + 
  geom_col(fill="#5a677f") +
  coord_flip() +
  labs(x = "Keywords", 
       y = "\n Count") +
  # change X-axis tick labels
  scale_x_discrete(labels=c(
    "country" = "Country",
    "dpoa" = "DPoA",
    "development" = "Development", 
    "national" = "National",
    "implementation" = "Implementation",
    "nationaldevelopmentplan" = "National Development Plan",
    "monitoring" = "Monitoring",
    "indicator" = "Indicator",
    "alignment" = "Alignment",
    "framework" = "Framework",
    "ldcs" = "LDCs",
    "level" = "Level",
    "agenda" = "Agenda",
    "data" = "Data",
    "sdgs" = "SDGs",
    "economy" = "Economy",
    "challenge" = "Challenge",
    "support" = "Support",
    "government" = "Government",
    "target" = "Target", 
    "partner" = "Partner", 
    "plan" = "Plan",
    "priority" = "Priority",
    "programme" = "Programme",
    "system" = "System",
    "sustainable" = "Sustainable",
    "performance" = "Performance",
    "graduation" = "Graduation",
    "international" = "International",
    "vision" = "Vision"
    )) +
  theme

# display figure
p1

# save 
ggsave("Project1_TextAnalysis/figure/NFPs.png",
       p1,
       dpi=1000)


