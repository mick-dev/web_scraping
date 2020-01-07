# load library
library(robotstxt)
library(xml2)
library(rvest)
library(tidyverse)
library(conflicted)

Sys.setlocale("LC_CTYPE", "thai")
options(encoding = "UTF-8")
filter <- dplyr::filter

# check the permissions
paths_allowed(paths = "https://www.one2car.com/??????-??????????????????-?????????")

paths_allowed(paths = "https://www.one2car.com/%E0%B8%A3%E0%B8%96%E0%B8%A1%E0%B8%B7%E0%B8%AD%E0%B8%AA%E0%B8%AD%E0%B8%87-%E0%B8%AA%E0%B8%B3%E0%B8%AB%E0%B8%A3%E0%B8%B1%E0%B8%9A-%E0%B8%82%E0%B8%B2%E0%B8%A2")

#Base URL
o2c_url <- "https://www.one2car.com/%E0%B8%A3%E0%B8%96%E0%B8%A1%E0%B8%B7%E0%B8%AD%E0%B8%AA%E0%B8%AD%E0%B8%87-%E0%B8%AA%E0%B8%B3%E0%B8%AB%E0%B8%A3%E0%B8%B1%E0%B8%9A-%E0%B8%82%E0%B8%B2%E0%B8%A2"

#Get XML from target Base URL
htmlread <- read_html(o2c_url) #Store html read into an object

#Get title (.listing__title)
o2c_titles <-
  o2c_url %>%
  #Use %>% to have the below functions execute after those above sequentially. o2c_url is the first argument, so you don't need this in the other functions following.
  read_html() %>%
  html_node(".listing__title") %>% 
  html_text() %>% 
  str_replace_all("\n", "") %>% #Remove tab
  trimws(which = "both")#Remove left-right spaces

