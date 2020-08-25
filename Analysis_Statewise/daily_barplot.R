library(tidyverse)
library(lubridate)
library(ggthemes)

# read
cn <- read_csv("data/covid_numbers.csv")

# change date format
cn$date <- as.Date(cn$date,"%d/%m/%y")

# remove unwanted columns
cn <- cn %>% 
        select(3:9)

# wide to long dataset
cn_l<- cn %>%
        select(-Total_Active_Cases) %>% 
        pivot_longer(-date, names_to="rep", values_to="case")

# change a column to factor variable
cn_l$rep <- as.factor(cn_l$rep)

# barplot state kerala
cn_l %>% filter(date == max(cn_l$date)) %>% # change date 
        ggplot(aes(rep,case, fill=rep))+
        geom_bar(stat = "identity")+
        scale_fill_manual(values=c("#f0690a", "#f0003c", "#999999","#5bcf19", "#db60b4"))+
        geom_text(aes(label=case), vjust=1.6, color="black",
                  position = position_dodge(0.9), size=3.5)+
        labs(title = "Covid 19 Daily Report",
             subtitle = "Kerala",
             y="cases")+
        theme_fivethirtyeight()+
        theme(axis.title = element_text())
        

# Time Series ---------------------------------------------------------------------------------


cn_l %>%
        ggplot(aes(date,case, color =rep))+
        geom_line(size =1.4, alpha =0.8)+
        geom_point()+
        theme_fivethirtyeight()+
        labs(title = "Covid 19 Daily Report",
             subtitle = "Kerala",
             y="cases")


