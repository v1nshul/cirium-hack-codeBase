library(tidyverse)
#install.packages("readr")
library(readr)
jetblue = read_csv("C:/Users/Vanshul Kumar/Desktop/cirium-hack/jetblue.csv")
southwest = read_csv("southwest.csv")

#for southwest- method 2 
onlyTime_aircraft_sw = read_csv("southwest.csv",col_select = c(time_on_ground_mins))
onlyTime_aircraft_sw

time_filetered_sw = filter(onlyTime_aircraft_sw, time_on_ground_mins<180)
total_time_sw = time_filetered_sw %>% summarise(sum_time_sw = sum(time_on_ground_mins))
total_time_sw

total_flights_sw = time_filetered_sw %>% count(time_on_ground_mins < 180)
total_flights_sw

result_sw = 141329803/1887794
result_sw 


#for jet blue method 2: 
onlyTime_aircraft_jb = read_csv("jetblue.csv",col_select = c(time_on_ground_mins))
onlyTime_aircraft_jb

time_filetered_jb = filter(onlyTime_aircraft_jb, time_on_ground_mins<180)
total_time_jb = time_filetered_jb %>% summarise(sum_time_jb = sum(time_on_ground_mins))
total_time_jb

total_flights_jb = time_filetered_jb %>% count(time_on_ground_mins < 180)
total_flights_jb

result_jb = 31903062/428293
result_jb

#for delta: method 2
onlyTime_aircraft_dt = read_csv("delta.csv",col_select = c(time_on_ground_mins))
onlyTime_aircraft_dt

time_filetered_dt = filter(onlyTime_aircraft_dt, time_on_ground_mins<180)
total_time_dt = time_filetered_dt %>% summarise(sum_time_dt = sum(time_on_ground_mins))
total_time_dt

total_flights_dt = time_filetered_dt %>% count(time_on_ground_mins < 180)
total_flights_dt

result_dt = 121301817/1248739
result_dt

#for american: method 2 
onlyTime_aircraft_am = read_csv("american.csv",col_select = c(time_on_ground_mins))
onlyTime_aircraft_am

time_filetered_am = filter(onlyTime_aircraft_am, time_on_ground_mins<180)
total_time_am = time_filetered_am %>% summarise(sum_time_am = sum(time_on_ground_mins))
total_time_am

total_flights_am = time_filetered_am %>% count(time_on_ground_mins < 180)
total_flights_am

result_am = 126750503/1314295
result_am

#for frontier: method 2
onlyTime_aircraft_fr = read_csv("frontier.csv",col_select = c(time_on_ground_mins))
onlyTime_aircraft_fr

time_filetered_fr = filter(onlyTime_aircraft_fr, time_on_ground_mins<180)
total_time_fr = time_filetered_fr %>% summarise(sum_time_fr = sum(time_on_ground_mins))
total_time_fr

total_flights_fr = time_filetered_fr %>% count(time_on_ground_mins < 180)
total_flights_fr

result_fr = 21277610/244451
result_fr

#plotting the results
  #graph1 : avg time on the ground for each air line
results_all <- data.frame(airline=c("JB", "SW", "DT", "AM", "FR"),
                 time=c(74.48, 74.8, 97.13,96.4,87.04))

#bar graph
graph1<-ggplot(data=results_all, aes(x=airline, y=time)) +
  geom_bar(stat="identity", color="white", fill="orange")+
  geom_text(aes(label=time), vjust=1.6, color="white", size=3.5)
graph1

#point graph
graph1_point<-ggplot(data=results_all, aes(x=airline, y=time)) +
  geom_point(stat="identity")
graph1_point


#for jet blue: method 1 (taking one aircraft and then comparing each aircraft)
onlyTime_aircraft = read_csv("jetblue.csv",col_select = c(aircraft_type, time_on_ground_mins))
onlyTime_aircraft

library(dplyr)
time_filetered_a320 = filter(onlyTime_aircraft, time_on_ground_mins < 180, aircraft_type == 'A320')
time_filetered_a320


avg_time_a320 = time_filetered %>% summarise( x = mean(time_on_ground_mins))
avg_time_a320

time_filetered = filter(onlyTime_aircraft, time_on_ground_mins < 180)
avg_time = time_filetered %>% summarise(avg_jetBlue = mean(time_on_ground_mins))
avg_time

library(ggplot2)
p <- ggplot(data = time_filetered,aes(x = aircraft_type, y = time_on_ground_mins))+
  geom_bar(stat = 'identity')
p


#mro relationships

mro= read_csv("mro-relationships.csv")

