

# load source 
source("_config/config.R")


# load data
source("data/payday_loan_text.R")

# paste text
text <- paste(text, collapse = " ")

# Remove punctuation
text <- str_replace_all(text, pattern = '\".,$?:', replacement = "") 

# Remove space "\n"
text <- str_replace_all(text, pattern = '\n', replacement = "") 

#Replace with quote
text <- str_replace_all(text, pattern = '\u0092', replacement = "'") 

#Replace with quote
text <- str_replace_all(text, pattern = '\u0091', replacement = "'") 

# make it to tibble data format
text_df <- tibble(Text = text) 

text_words <- 
  text_df %>% 
  unnest_tokens(output = word, input = Text) 

# load stop words data
data(stop_words)
dim(stop_words)

# remove some words (relevant to analysis) 
stop_words <- stop_words %>% 
  filter(!word %in% c("help", 
                      "next", 
                      "small", 
                      "immediate"))

# Remove stop words in peter_words
text_words  <- 
  text_words  %>%
  anti_join(stop_words) 

text_wordcounts <- 
  text_words  %>% 
  count(word, sort = TRUE)

#---------- Table: 
# Show top 50 Most Frequently Used Words in ads
pander(head(text_wordcounts, 100), 
       style='rmarkdown' ) 

# get top 100
text_wordcounts_100 <- text_wordcounts[1:100, ]
dim(text_wordcounts_100)
tail(text_wordcounts_100)

# save data
fwrite(text_wordcounts_100,
       "cache/text_wordcounts_100.csv",
       row.names = F)

#---------- Figure: show top 45 words 
# words that appear at least 6 times
text_wordcounts <- 
  text_wordcounts %>% 
  filter(n >1) %>% 
  mutate(word = reorder(word,n))

# collect top 45 words 
text_wordcounts45 <- text_wordcounts[1:45,]

# check data
data.table(text_wordcounts45)

# save data
fwrite(text_wordcounts45,
       "cache/text_wordcounts45.csv",
       row.names = F)

# Plot top 40 words 
p1 <- ggplot(data = text_wordcounts45, aes(word, n)) + 
  geom_col(fill="#315b94") +
  coord_flip() + 
  labs(x = "\nKeywords", y = "\n Counts") +
  theme(plot.title = element_text(hjust=0.5),
        axis.title.x = element_text(face="bold", colour="darkblue", size=12),
        axis.title.y = element_text(face="bold", colour="darkblue", size=12),
        plot.margin = margin(0.3,.1,0.3,.1, "cm")) + 
  scale_y_continuous(breaks = seq(from = 0,
                                  to = 40,
                                  by = 5)) +
  # change X-axis tick labels
  scale_x_discrete(labels=c(
    "cash" = "Cash",
    "quick" = "Quick",
    "lender" = "Lender",
    "easy" = "Easy",
    "fast" = "Fast",
    "payment" = "Payment",
    "direct" = "Direct",
    "money" = "Money",
    "help" = "Help",
    "fund" = "Fund",
    "minute" = "Minute",
    "next" = "Next",
    "bank" = "Bank",
    "account" = "Account",
    "process" = "Process",
    "receive" = "Receive",
    "sameday" = "Same Day",
    "time" = "Time",
    "borrow" = "borrow",
    "expense" = "Expense",
    "shortterm" = "Short Term",
    "amount" = "Amount",
    "credit" = "Credit",
    "creditscore" = "Credit Score",
    "deposit" = "Deposit",
    "financial" = "Financial",
    "personal" = "Personal",
    "decision" = "Decision",
    "fee" = "Fee",
    "information" = "Information",
    "instant" = "Instant",
    "secure" = "Secure",
    "unexpected" = "Unexpected",
    "offer" = "offer",
    "paycheck" = "Pay Check",
    "provide" = "Provide",
    "benefit" = "Benefit",
    "businessday" = "Business Day",
    "convenient" = "Convenient",
    "eligible" = "Eligible",
    "emergency" = "Emergency", 
    "home" = "Home",
    "pickup" = "Pick Up",
    "solution" = "Solution",
    "week" = "week")) + 
  theme
  
# check plot 
p1 

# save plot
ggsave("figure/payday_top_words.png",
       p1, 
       width=12,
       height = 8,
       dpi = 1000)

