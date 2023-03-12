library(tidyverse)
library(readr)

#the main idea is: avg of (dep-arr) ,for flights having time on ground less than 180, throughout the year. 
#for jetblue: done in excel
jetblue = read_csv("jetblue.csv")

jetblue_filetered = filter( jetblue, time_on_ground_mins < 180 & time_on_ground_mins >0 & aircraft_type %in% c('A320','A321', 'A319', 'A321neo'))
jetblue_filetered

summary(jetblue_filetered)

summary(jetblue)

#for american: 
american = read_csv("american.csv")

am_filter = filter(american, time_on_ground_mins < 180 & time_on_ground_mins >0 & aircraft_type %in% c('A320','A321', 'A319', 'A321neo'))
am_filter

summary(am_filter)

#for delta: 
delta = read_csv("delta.csv")

dt_f= filter(delta, time_on_ground_mins < 180 & time_on_ground_mins >0 & aircraft_type %in% c('A320','A321', 'A319', 'A321neo','737'))
summary(dt_f)

#for southwest: 
sw = read_csv("southwest.csv")

sw_f = filter(sw, time_on_ground_mins < 180 & time_on_ground_mins >0)
summary(sw_f)

#for frontier: 
fr = read_csv("frontier.csv")

fr_f = filter(fr, time_on_ground_mins < 180 & time_on_ground_mins >0 & aircraft_type %in% c('A320','A321', 'A319'))
summary(fr_f)


results_all <- data.frame(airline=c("JB", "SW", "DT", "AM", "FR"),
                          time=c(105.9, 78.8,  107.2,99.93,95.9))

#bar graph
graph1<-ggplot(data=results_all, aes(x=airline, y=time)) +
  geom_bar(stat="identity", color="white", fill="orange")+
  geom_text(aes(label=time), vjust=1.6, color="white", size=3.5)
graph1
