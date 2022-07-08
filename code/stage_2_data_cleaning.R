## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Script ID ####

## Data Cleaning Local Government Indicators
## R version 4.1.0 (2021-05-18) -- "Camp Pontanezen"
## Date: March and July 2022

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
library(foreign)
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
egi_2016 <- read.dta("data/raw/EGI/EGI-2016-vor-Stata12.dta")
names(egi_2016)[2] = "cut_com"

## TA 2016
ta_2016 <- read.csv("data/raw/CPLT/TA/ta_municipios_2016.csv", encoding = "UTF-8")
names(ta_2016)[1] = "cplt_code"
names(ta_2016)[3] = "ta"

## DAI 2016
dai_2016 <- read.csv("data/raw/CPLT/DAI/dai_municipios_online_2016.csv", encoding = "UTF-8")
names(dai_2016)[2] = "cplt_code"
names(dai_2016)[3] = "dai"

## EGI 2019
egi_2019 <- read.csv("data/raw/EGI/egi_2019.csv", encoding = "UTF-8")
names(egi_2019)[1] = "region"

## SINIM 2019
sinim_2019 <- read.csv("data/raw/SINIM/sinim_2019.csv", encoding = "UTF-8")
names(sinim_2019)[1] = "cut_com"

## SUBTEL 2019
subtel_2019 <- read.csv("data/raw/SUBTEL/data_SUBTEL_2019.csv", encoding = "UTF-8")
names(subtel_2019)[1] = "comuna"
names(subtel_2019)[2] = "cut_com"
names(subtel_2019)[15] = "internet_con"

## EGI 2021
egi_2021 <- read.csv("data/raw/EGI/egi_2021.csv", encoding = "UTF-8")
names(egi_2021)[1] = "commune"
egi_2021 <- filter(egi_2021, cut_com != 12202)

## SINIM 2021
sinim_2021 <- read.csv("data/raw/SINIM/sinim_2021.csv", encoding = "UTF-8")
names(sinim_2021)[1] = "cut_com"

## SUBTEL 2021
subtel_2021 <- read.csv("data/raw/SUBTEL/data_SUBTEL_2021.csv", encoding = "UTF-8")
names(subtel_2021)[1] = "comuna"
names(subtel_2021)[2] = "cut_com"
names(subtel_2021)[15] = "internet_con"

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Case Level-Data Set 2016 ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Alpha
alpha_egi_2016 <- select(egi_2016, forms, news, webmap, streetmap, transport, socialmedia, phone, 
                         mobile, transac, followup, citizen, payments, part)
## alpha_egi_2016 <- alpha_egi_2016 %>% 
## filter(if_all(everything(), ~ !is.na(.x)))
## alpha(alpha_egi_2016)
ltm::cronbach.alpha(alpha_egi_2016, CI = TRUE, na.rm = TRUE)

## EGI
egi_2016$egi <- ((egi_2016$forms + egi_2016$news + egi_2016$webmap) * 0.25) + 
  ((egi_2016$streetmap + egi_2016$transport) * 0.50) +
  ((egi_2016$socialmedia + egi_2016$phone + egi_2016$mobile) * 0.75) +
  ((egi_2016$transac + egi_2016$followup + egi_2016$citizen + egi_2016$payments) * 1.00) +
  ((egi_2016$part) * 1.25)
sum(egi_2016$egi, na.rm = TRUE)

## egi_2016$egi[which(egi_2016$commune == "LAS CONDES")]
## egi_2016$egi[which(egi_2016$commune == "LO BARNECHEA")]
## egi_2016$egi[which(egi_2016$commune == "PROVIDENCIA")]

## EGI Std
score_2016 <- (3 * 0.25) + (2 * 0.50) + (3 * 0.75) + (4 * 1.00) + (1 * 1.25)
score_2019 <- (3 * 0.25) + (2 * 0.50) + (3 * 0.75) + (5 * 1.00) + (1 * 1.25)
egi_2016$egi_std <- (egi_2016$egi / score_2016) * score_2019

## Local Gov Indicators
local_gov_indicators_2016 <- cut_shapefiles
local_gov_indicators_2016 <- cbind(year = 2016, local_gov_indicators_2016)
local_gov_indicators_2016 <- cbind(id = rownames(local_gov_indicators_2016), local_gov_indicators_2016)

## Corrections
source("code/functions/cut_new_region.R", encoding = "UTF-8")

## Merge
local_gov_indicators_2016 <- left_join(local_gov_indicators_2016, egi_2016[c("cut_com", "egi", "egi_std")], by = "cut_com")
sum(local_gov_indicators_2016$egi, na.rm = TRUE)

## local_gov_indicators_2016 %>%
  ## group_by(cut_reg) %>%
  ## summarise(mean = mean(egi, na.rm = TRUE), n = n())

## CPLT Data
source("code/functions/cplt_code.R", encoding = "UTF-8")
local_gov_indicators_2016 <- bind_cols(local_gov_indicators_2016, cplt_code)
names(local_gov_indicators_2016)[12] = "cplt_code"
local_gov_indicators_2016 <- left_join(local_gov_indicators_2016, ta_2016[1:3], by = "cplt_code")
local_gov_indicators_2016 <- left_join(local_gov_indicators_2016, dai_2016[1:3], by = "cplt_code")
local_gov_indicators_2016$dai <- local_gov_indicators_2016$dai %>% factor %>% str_replace(',', '.') %>% as.numeric
local_gov_indicators_2016$cplt_code <- NULL
local_gov_indicators_2016$Nombre.x <- NULL
local_gov_indicators_2016$Nombre.y <- NULL

## SAE Data
local_gov_indicators_2016$sae <- NA

## SINIM Data
## Pending

## SUBTEL Data
## Pending

## Case-Level CSV
write.csv(local_gov_indicators_2016, "data/tidy/cases/local_gov_indicators_2016.csv", 
          fileEncoding = "UTF-8", row.names =  FALSE)

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
## alpha(alpha_egi_2019)
ltm::cronbach.alpha(alpha_egi_2019, CI = TRUE, na.rm = TRUE)

## EGI
egi_2019$egi <- ((egi_2019$forms + egi_2019$news + egi_2019$webmap) * 0.25) + 
  ((egi_2019$streetmap + egi_2019$transport) * 0.50) +
  ((egi_2019$socialmedia + egi_2019$phone + egi_2019$mobile) * 0.75) +
  ((egi_2019$transac + egi_2019$followup + egi_2019$digital_certificate + egi_2019$citizen + egi_2019$payments) * 1.00) +
  ((egi_2019$part) * 1.25)
sum(egi_2019$egi, na.rm = TRUE)

## Local Gov Indicators
local_gov_indicators_2019 <- cut_shapefiles
local_gov_indicators_2019 <- cbind(year = 2019, local_gov_indicators_2019)
local_gov_indicators_2019 <- cbind(id = rownames(local_gov_indicators_2019), local_gov_indicators_2019)

## Corrections
egi_2019$cut_com[which(egi_2019$commune == "MAFIL")] <- local_gov_indicators_2019$cut_com[which(local_gov_indicators_2019$commune == "Máfil")]
egi_2019$cut_com[which(egi_2019$commune == "PUTRE")] <- 15201
egi_2019$cut_com[which(egi_2019$commune == "GENERAL LAGOS")] <- 15202
egi_2019$cut_com[which(egi_2019$commune == "RANQUIL")] <- local_gov_indicators_2019$cut_com[which(local_gov_indicators_2019$commune == "Ranquil")]

## Merge
local_gov_indicators_2019 <- left_join(local_gov_indicators_2019, egi_2019[c("cut_com", "egi")], by = "cut_com")
sum(local_gov_indicators_2019$egi, na.rm = TRUE)
local_gov_indicators_2019$egi_std <- NA

## CPLT Data
local_gov_indicators_2019$ta <- NA
local_gov_indicators_2019$dai <- NA

## SAE Data
local_gov_indicators_2019$sae <- NA

## SINIM Data
local_gov_indicators_2019 <- left_join(local_gov_indicators_2019, sinim_2019, by = "cut_com")
local_gov_indicators_2019$municipality <- NULL
local_gov_indicators_2019$iadm40 <- as.numeric(local_gov_indicators_2019$iadm40)
local_gov_indicators_2019$iadm44 <- as.numeric(local_gov_indicators_2019$iadm44)
local_gov_indicators_2019$iadm41 <- as.numeric(local_gov_indicators_2019$iadm41)
local_gov_indicators_2019$iadm25 <- as.numeric(local_gov_indicators_2019$iadm25)
local_gov_indicators_2019$iadm33 <- as.numeric(local_gov_indicators_2019$iadm33)
local_gov_indicators_2019$isoc013 <- as.numeric(local_gov_indicators_2019$isoc013)
local_gov_indicators_2019$mocosoc <- as.factor(local_gov_indicators_2019$mocosoc)
local_gov_indicators_2019$mcosoc <- as.factor(local_gov_indicators_2019$mcosoc)
local_gov_indicators_2019$icar007 <- as.numeric(local_gov_indicators_2019$icar007)
local_gov_indicators_2019$itpcm <- as.numeric(local_gov_indicators_2019$itpcm)
local_gov_indicators_2019$itpc <- as.numeric(local_gov_indicators_2019$itpc)
local_gov_indicators_2019$itpr <- as.numeric(local_gov_indicators_2019$itpr)
local_gov_indicators_2019$itpu <- as.numeric(local_gov_indicators_2019$itpu)

## SUBTEL Data
local_gov_indicators_2019 <- left_join(local_gov_indicators_2019, subtel_2019[c(2, 15)], by = "cut_com")
local_gov_indicators_2019$internet_con <- as.numeric(local_gov_indicators_2019$internet_con)

## Case-Level CSV
write.csv(local_gov_indicators_2019, "data/tidy/cases/local_gov_indicators_2019.csv", 
          fileEncoding = "UTF-8", row.names =  FALSE)

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
## alpha(alpha_egi_2021)
ltm::cronbach.alpha(alpha_egi_2021, CI = TRUE, na.rm = TRUE)

## EGI
egi_2021$egi <- ((egi_2021$forms + egi_2021$news + egi_2021$webmap) * 0.25) + 
  ((egi_2021$streetmap + egi_2021$transport) * 0.50) +
  ((egi_2021$socialmedia + egi_2021$phone + egi_2021$mobile) * 0.75) +
  ((egi_2021$transac + egi_2021$followup + egi_2021$digital_certificate + egi_2021$citizen + egi_2021$payments) * 1.00) +
  ((egi_2021$part) * 1.25)
sum(egi_2021$egi, na.rm = TRUE)

## Local Gov Indicators
local_gov_indicators_2021 <- cut_shapefiles
local_gov_indicators_2021 <- cbind(year = 2021, local_gov_indicators_2021)
local_gov_indicators_2021 <- cbind(id = rownames(local_gov_indicators_2021), local_gov_indicators_2021)

## Merge
local_gov_indicators_2021 <- left_join(local_gov_indicators_2021, egi_2021[c("cut_com", "egi")], by = "cut_com")
sum(local_gov_indicators_2021$egi, na.rm = TRUE)
local_gov_indicators_2021$egi_std <- NA

## CPLT Data
local_gov_indicators_2021$ta <- NA
local_gov_indicators_2021$dai <- NA

## SAE Data
local_gov_indicators_2021$sae <- NA

## SINIM Data
local_gov_indicators_2021 <- left_join(local_gov_indicators_2021, sinim_2019, by = "cut_com")
local_gov_indicators_2021$municipality <- NULL
local_gov_indicators_2021$iadm40 <- as.numeric(local_gov_indicators_2021$iadm40)
local_gov_indicators_2021$iadm44 <- as.numeric(local_gov_indicators_2021$iadm44)
local_gov_indicators_2021$iadm41 <- as.numeric(local_gov_indicators_2021$iadm41)
local_gov_indicators_2021$iadm25 <- as.numeric(local_gov_indicators_2021$iadm25)
local_gov_indicators_2021$iadm33 <- as.numeric(local_gov_indicators_2021$iadm33)
local_gov_indicators_2021$isoc013 <- as.numeric(local_gov_indicators_2021$isoc013)
local_gov_indicators_2021$mocosoc <- as.factor(local_gov_indicators_2021$mocosoc)
local_gov_indicators_2021$mcosoc <- as.factor(local_gov_indicators_2021$mcosoc)
local_gov_indicators_2021$icar007 <- as.numeric(local_gov_indicators_2021$icar007)
local_gov_indicators_2021$itpcm <- as.numeric(local_gov_indicators_2021$itpcm)
local_gov_indicators_2021$itpc <- as.numeric(local_gov_indicators_2021$itpc)
local_gov_indicators_2021$itpr <- as.numeric(local_gov_indicators_2021$itpr)
local_gov_indicators_2021$itpu <- as.numeric(local_gov_indicators_2021$itpu)

## SUBTEL Data
local_gov_indicators_2021 <- left_join(local_gov_indicators_2021, subtel_2021[c(2, 15)], by = "cut_com")
local_gov_indicators_2021$internet_con <- as.numeric(local_gov_indicators_2021$internet_con)

## Case-Level CSV
write.csv(local_gov_indicators_2021, "data/tidy/cases/local_gov_indicators_2021.csv", 
          fileEncoding = "UTF-8", row.names =  FALSE)

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Scatters ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

library(ggplot2)

df_scatter <- data.frame(cut_com = local_gov_indicators_2016$cut_com,
                         egi_2016 = local_gov_indicators_2016$egi_std,
                         egi_2019 = local_gov_indicators_2019$egi,
                         egi_2021 = local_gov_indicators_2021$egi)

summary(lm(egi_2019 ~ egi_2016, data = df_scatter))
summary(lm(egi_2021 ~ egi_2019, data = df_scatter))

## pdf("results/figures/scatter_egi_2016_2019.pdf", width = 6.826666666666667, height = 5.12)
## png("results/figures/scatter_egi_2016_2019.png", width = (1024*2), height = (768*2), units = 'px', res = 300)
ggplot(df_scatter, aes(x = egi_2016, y = egi_2019)) + 
  geom_point(alpha = 0.15) + 
  ## geom_smooth(method = "loess", color = "tomato2", fill = "tomato1") +
  geom_smooth(method = lm, colour = "grey30", alpha = 0.25) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black", size = 9)) +
  labs(x = "EGI 2016", y = "EGI 2019", title = "E-Government Index", subtitle = "Chilean Municipalities", 
       colour = NULL, caption = "Source: González-Bustamante and Aguilar (2022).") +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) 
## dev.off()

## pdf("results/figures/scatter_egi_2019_2021.pdf", width = 6.826666666666667, height = 5.12)
## png("results/figures/scatter_egi_2019_2021.png", width = (1024*2), height = (768*2), units = 'px', res = 300)
ggplot(df_scatter, aes(x = egi_2019, y = egi_2021)) + 
  geom_point(alpha = 0.15) + 
  ## geom_smooth(method = "loess", color = "tomato2", fill = "tomato1") +
  geom_smooth(method = lm, colour = "grey30", alpha = 0.25) +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom") +
  theme(panel.grid.minor = element_blank()) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, color = "black", size = 9)) +
  labs(x = "EGI 2019", y = "EGI 2021", title = "E-Government Index", subtitle = "Chilean Municipalities", 
       colour = NULL, caption = "Source: González-Bustamante and Aguilar (2022).") +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")) 
## dev.off()
