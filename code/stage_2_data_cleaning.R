## Draft Code Data Cleaning
## Bastián González-Bustamante
## March 2022

## Clean Environment
rm(list = ls())

## Raw Data
cut_shapefiles <- read.csv("data/raw/CUT/cut_shapefiles.csv", encoding = "UTF-8")

## Recode
names(cut_shapefiles)[1] = "cut_reg"
names(cut_shapefiles)[2] = "region"
names(cut_shapefiles)[3] = "cut_prov"
names(cut_shapefiles)[4] = "prov"
names(cut_shapefiles)[5] = "cut_com"
names(cut_shapefiles)[6] = "commune"
names(cut_shapefiles)[7] = "area"

## Baseline per Year
chl_local_gov_2016 <- cut_shapefiles
chl_local_gov_2016 <- cbind(year = 2016, chl_local_gov_2016)
write.csv(chl_local_gov_2016, "data/tidy/cases/chl_local_gov_2016.csv", fileEncoding = "UTF-8", row.names =  FALSE)

