library(tidyverse)
library(jsonlite)
library(scales)
library(lubridate)
library(repr)

train = read_csv('train.csv')
test = read_csv('test.csv')

train_device = paste('[', paste(train$device, collapse =  ','), ']')%>% fromJSON(flatten = T)
train_geonet = paste('[', paste(train$geoNetwork, collapse = ','), ']')%>% fromJSON(flatten = T)

train_total = paste('[', paste(train$totals, collapse = ','), ']')%>% fromJSON(flatten = T)
train_traffic = paste('[', paste(train$trafficSource, collapse = ','), ']')%>% fromJSON(flatten = T)



test_device = paste('[', paste(test$device, collapse =  ','), ']')%>% fromJSON(flatten = T)
test_geonet = paste('[', paste(test$geoNetwork, collapse = ','), ']')%>% fromJSON(flatten = T)

test_total = paste('[', paste(test$totals, collapse = ','), ']')%>% fromJSON(flatten = T)
test_traffic = paste('[', paste(test$trafficSource, collapse = ','), ']')%>% fromJSON(flatten = T)

train = train%>%
  cbind(train_device, train_geonet, train_total, train_traffic)%>%
  select(-device, -geoNetwork, -totals, -trafficSource)

test = test%>%
  cbind(test_device, test_geonet, test_total, test_traffic)%>%
  select(-device, -geoNetwork, -totals, -trafficSource)

rm(train_device, train_geonet, train_total, train_traffic,
   test_device, test_geonet, test_total, test_traffic)


