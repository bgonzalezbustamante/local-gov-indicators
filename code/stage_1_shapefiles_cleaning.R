## Draft Code Shapefiles
## Bastián González-Bustamante
## March 2022

## Clean Environment
rm(list = ls())

## Packages
library(rgdal)
library(tidyverse)

communes <- readOGR("data/raw/shapefiles/COMUNAS_2020.shp", p4s = NULL, verbose = TRUE,
                    use_iconv = TRUE, encoding = "UTF-8")

communes$CUT_REG <- as.numeric(communes$CUT_REG)
communes_01 <- communes[communes$CUT_REG == 1,]
communes_02 <- communes[communes$CUT_REG == 2,]
communes_03 <- communes[communes$CUT_REG == 3,]
communes_04 <- communes[communes$CUT_REG == 4,]
communes_05 <- communes[communes$CUT_REG == 5,]
communes_06 <- communes[communes$CUT_REG == 6,]
communes_07 <- communes[communes$CUT_REG == 7,]
communes_08 <- communes[communes$CUT_REG == 8,]
communes_09 <- communes[communes$CUT_REG == 9,]
communes_10 <- communes[communes$CUT_REG == 10,]
communes_11 <- communes[communes$CUT_REG == 11,]
communes_12 <- communes[communes$CUT_REG == 12,]
communes_13 <- communes[communes$CUT_REG == 13,]
communes_14 <- communes[communes$CUT_REG == 14,]
communes_15 <- communes[communes$CUT_REG == 15,]
communes_16 <- communes[communes$CUT_REG == 16,]

plot(communes_13)

## Dataframe 

cut_shapefiles <- data.frame(CUT_REG = communes$CUT_REG,
                             REGION = communes$REGION,
                             CUT_PROV = communes$CUT_PROV,
                             PROVINCIA = communes$PROVINCIA,
                             CUT_COM = communes$CUT_COM,
                             COMUNA = communes$COMUNA,
                             SUPERFICIE = communes$SUPERFICIE)

## Save File
write.csv(cut_shapefiles, "data/raw/CUT/cut_shapefiles.csv", fileEncoding = "UTF-8", row.names =  FALSE)
