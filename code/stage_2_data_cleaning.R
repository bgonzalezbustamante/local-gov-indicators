## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Script ID ####

## Data Cleaning Local Government Indicators
## R version 4.1.0 (2021-05-18) -- "Camp Pontanezen"
## Date: March 2022

## Bastián González-Bustamante (University of Oxford, UK)
## https://bgonzalezbustamante.com
## Diego Aguilar (Training Data Lab)
## https://training-datalab.com

## Data Set on Local Government Indicators in Chile
## https://github.com/bgonzalezbustamante/local-gov-indicators

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Packages and Data ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Clean Environment
rm(list = ls())

## Packages
library(tidyverse)
## library(ltm)
library(psych)

## Shapefiles
cut_shapefiles <- read.csv("data/raw/CUT/cut_shapefiles.csv", encoding = "UTF-8")
names(cut_shapefiles)[1] = "cut_reg"
names(cut_shapefiles)[2] = "region"
names(cut_shapefiles)[3] = "cut_prov"
names(cut_shapefiles)[4] = "province"
names(cut_shapefiles)[5] = "cut_com"
names(cut_shapefiles)[6] = "commune"
names(cut_shapefiles)[7] = "area"

## EGI 2016
egi_2016 <- foreign::read.dta("data/raw/EGI/EGI-2016-vor-Stata12.dta")
nam

## EGI 2019
egi_2019 <- read.csv("data/raw/EGI/egi_2019.csv", encoding = "UTF-8")
names(egi_2019)[1] = "region"

## EGI 2021
egi_2021 <- read.csv("data/raw/EGI/egi_2021.csv", encoding = "UTF-8")
names(egi_2021)[1] = "commune"
egi_2021 <- filter(egi_2021, cut_com != 12202)

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Case Level-Data Set 2016 ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Alpha
alpha_egi_2016 <- select(egi_2016, forms, news, webmap, streetmap, transport, socialmedia, phone, 
                         mobile, transac, followup, citizen, payments, part)
## alpha_egi_2016 <- alpha_egi_2016 %>% 
## filter(if_all(everything(), ~ !is.na(.x)))
alpha(alpha_egi_2016)
ltm::cronbach.alpha(alpha_egi_2016, CI = TRUE, na.rm = TRUE)

## EGI
egi_2016$egi <- ((egi_2016$forms + egi_2016$news + egi_2016$webmap) * 0.25) + 
  ((egi_2016$streetmap + egi_2016$transport) * 0.50) +
  ((egi_2016$socialmedia + egi_2016$phone + egi_2016$mobile) * 0.75) +
  ((egi_2016$transac + egi_2016$followup + egi_2016$citizen + egi_2016$payments) * 1.00) +
  ((egi_2016$part) * 1.25)

## egi_2016$egi[which(egi_2016$commune == "LAS CONDES")]
## egi_2016$egi[which(egi_2016$commune == "LO BARNECHEA")]
## egi_2016$egi[which(egi_2016$commune == "PROVIDENCIA")]

## EGI Std
score_2016 <- (3 * 0.25) + (2 * 0.50) + (3 * 0.75) + (4 * 1.00) + (1 * 1.25)
score_2019 <- (3 * 0.25) + (2 * 0.50) + (3 * 0.75) + (5 * 1.00) + (1 * 1.25)
egi_2016$egi_std <- (egi_2016$egi / score_2016) * score_2019

## Local Gov Indicators

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Case Level-Data Set 2019 ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Alpha
## table(egi_2019$region)
## Incorporating digital_certificate
subsample_2019 <- filter(egi_2019, region == "COQUIMBO" | region == "VALPARAISO" 
                         | region == "METROPOLITANA" | region == "BIOBIO" | region == "DE LA ARAUCANIA")

alpha_egi_2019 <- select(subsample_2019, forms, news, webmap, streetmap, transport, socialmedia, phone, 
                         mobile, transac, followup, digital_certificate, citizen, payments, part)
alpha(alpha_egi_2019)
ltm::cronbach.alpha(alpha_egi_2019, CI = TRUE, na.rm = TRUE)

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Case Level-Data Set 2021 ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Subsample
## table(egi_2021$region)
subsample_2021 <- filter(egi_2021, region == "COQUIMBO" | region == "VALPARAISO" 
                         | region == "METROPOLITANA" | region == "BIOBIO" | region == "DE LA ARAUCANIA")

## Alpha
## Incorporating digital_certificate
alpha_egi_2021 <- select(subsample_2021, forms, news, webmap, streetmap, transport, socialmedia, phone, 
                         mobile, transac, followup, digital_certificate, citizen, payments, part)
alpha(alpha_egi_2021)
ltm::cronbach.alpha(alpha_egi_2021, CI = TRUE, na.rm = TRUE)

## EGI
egi_2021$egi <- ((egi_2021$forms + egi_2021$news + egi_2021$webmap) * 0.25) + 
  ((egi_2021$streetmap + egi_2021$transport) * 0.50) +
  ((egi_2021$socialmedia + egi_2021$phone + egi_2021$mobile) * 0.75) +
  ((egi_2021$transac + egi_2021$followup + egi_2021$digital_certificate + egi_2021$citizen + egi_2021$payments) * 1.00) +
  ((egi_2021$part) * 1.25)

## Local Gov Indicators
local_gov_indicators_2021 <- cut_shapefiles
local_gov_indicators_2021 <- cbind(year = 2021, local_gov_indicators_2021)
local_gov_indicators_2021 <- cbind(id = rownames(local_gov_indicators_2021), local_gov_indicators_2021)

## write.csv(local_gov_indicators_2021, "data/tidy/cases/local_gov_indicators_2021.csv", 
          ## fileEncoding = "UTF-8", row.names =  FALSE)

