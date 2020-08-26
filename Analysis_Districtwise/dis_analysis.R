library(tidyverse)
library(lubridate)
# read
qt <- read_csv("data/quarantine_total.csv")

#remove columns
qt <- qt %>% 
        select(2:16)

# format date
qt$Date <- as.Date(qt$Date,"%d/%m/%y")

# wide to long
qt_l<- qt %>% 
        pivot_longer(-Date, names_to="districts", values_to="qt_no")

#change datatype to factor
qt_l$districts <- as.factor(qt_l$districts)

# lineplot comparison different counties
qt_l %>% 
        filter(districts =="TSR" |
                       districts == "TVM") %>% # choose any District
        ggplot(aes(Date, qt_no,color =districts))+
        geom_line(size =1.4)+
        geom_point(colour='red')+
        geom_text(aes(label=qt_no), vjust=1.6, color="black", alpha=0.7,
                  position = position_dodge(0.9), size=3.5)+
        labs(title = "No Quarantine in Thrissur and Thiruvanathapuram")
