library(tidyverse)
library(lubridate)

qt <- read_csv("~/GitHub/CovidData_From_Aug04/Analysis_Districtwise/data/quarantine_total.csv")

qt <- qt %>% 
        select(2:16)

qt$Date <- as.Date(qt$Date,"%d/%m/%y")

qt_l<- qt %>% 
        pivot_longer(-Date, names_to="districts", values_to="qt_no")

qt_l$districts <- as.factor(qt_l$districts)

qt_l %>% 
        filter(districts =="TSR") %>% # choose any District
        ggplot(aes(Date, qt_no))+
        geom_line(color ='blue',size =1)+
        geom_point(colour='red')+
        geom_text(aes(label=qt_no), vjust=1.6, color="black", alpha=0.7,
                  position = position_dodge(0.9), size=3.5)+
        labs(title = "Quarantine in Thrissur")
