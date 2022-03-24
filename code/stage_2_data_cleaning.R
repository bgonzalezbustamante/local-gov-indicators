## Draft Code Data Cleaning
## Bastián González-Bustamante
## March 2022

## Clean Environment
rm(list = ls())

## Packages
library(tidyverse)

## Raw Data
cut_shapefiles <- read.csv("data/raw/CUT/cut_shapefiles.csv", encoding = "UTF-8")
egi_2021 <- read.csv("data/raw/EGI/egi_2021.csv", encoding = "UTF-8")
egi_2021 <- filter(egi_2021, cut_com != 12202)

## Recode
names(cut_shapefiles)[1] = "cut_reg"
names(cut_shapefiles)[2] = "region"
names(cut_shapefiles)[3] = "cut_prov"
names(cut_shapefiles)[4] = "province"
names(cut_shapefiles)[5] = "cut_com"
names(cut_shapefiles)[6] = "commune"
names(cut_shapefiles)[7] = "area"

## Case-Level Data Set 2021
local_gov_indicators_2021 <- cut_shapefiles
local_gov_indicators_2021 <- cbind(year = 2021, local_gov_indicators_2021)
local_gov_indicators_2021 <- cbind(id = rownames(local_gov_indicators_2021), local_gov_indicators_2021)


write.csv(local_gov_indicators_2021, "data/tidy/cases/local_gov_indicators_2021.csv", 
          fileEncoding = "UTF-8", row.names =  FALSE)

