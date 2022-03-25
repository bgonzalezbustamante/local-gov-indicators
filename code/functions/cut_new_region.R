## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Script ID ####

## CUT Revision New Region
## R version 4.1.0 (2021-05-18) -- "Camp Pontanezen"
## Date: March 2022

## Bastián González-Bustamante (University of Oxford, UK)
## https://bgonzalezbustamante.com
## Diego Aguilar (Training Data Lab)
## https://training-datalab.com

## Data Set on Local Government Indicators in Chile
## https://github.com/bgonzalezbustamante/local-gov-indicators

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Code ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

local_gov_indicators_2016$cut_com[which(local_gov_indicators_2016$commune == "Chillán")] <- egi_2016$cut_com[which(egi_2016$commune == "CHILLAN")]
local_gov_indicators_2016$cut_com[which(local_gov_indicators_2016$commune == "Bulnes")] <- egi_2016$cut_com[which(egi_2016$commune == "BULNES")]
local_gov_indicators_2016$cut_com[which(local_gov_indicators_2016$commune == "El Carmen")] <- egi_2016$cut_com[which(egi_2016$commune == "EL CARMEN")]
local_gov_indicators_2016$cut_com[which(local_gov_indicators_2016$commune == "Pemuco")] <- egi_2016$cut_com[which(egi_2016$commune == "PEMUCO")]
local_gov_indicators_2016$cut_com[which(local_gov_indicators_2016$commune == "Pinto")] <- egi_2016$cut_com[which(egi_2016$commune == "PINTO")]
local_gov_indicators_2016$cut_com[which(local_gov_indicators_2016$commune == "Quillón")] <- egi_2016$cut_com[which(egi_2016$commune == "QUILLON")]
local_gov_indicators_2016$cut_com[which(local_gov_indicators_2016$commune == "San Ignacio")] <- egi_2016$cut_com[which(egi_2016$commune == "SAN IGNACIO")]
local_gov_indicators_2016$cut_com[which(local_gov_indicators_2016$commune == "Yungay")] <- egi_2016$cut_com[which(egi_2016$commune == "YUNGAY")]
local_gov_indicators_2016$cut_com[which(local_gov_indicators_2016$commune == "Quirihue")] <- egi_2016$cut_com[which(egi_2016$commune == "QUIRIHUE")]
local_gov_indicators_2016$cut_com[which(local_gov_indicators_2016$commune == "Cobquecura")] <- egi_2016$cut_com[which(egi_2016$commune == "COBQUECURA")]
local_gov_indicators_2016$cut_com[which(local_gov_indicators_2016$commune == "Coelemu")] <- egi_2016$cut_com[which(egi_2016$commune == "COELEMU")]
local_gov_indicators_2016$cut_com[which(local_gov_indicators_2016$commune == "Ninhue")] <- egi_2016$cut_com[which(egi_2016$commune == "NINHUE")]
local_gov_indicators_2016$cut_com[which(local_gov_indicators_2016$commune == "Portezuelo")] <- egi_2016$cut_com[which(egi_2016$commune == "PORTEZUELO")]
local_gov_indicators_2016$cut_com[which(local_gov_indicators_2016$commune == "Ranquil")] <- egi_2016$cut_com[which(egi_2016$commune == "RANQUIL")]
local_gov_indicators_2016$cut_com[which(local_gov_indicators_2016$commune == "Treguaco")] <- egi_2016$cut_com[which(egi_2016$commune == "TREGUACO")]
local_gov_indicators_2016$cut_com[which(local_gov_indicators_2016$commune == "San Carlos")] <- egi_2016$cut_com[which(egi_2016$commune == "SAN CARLOS")]
local_gov_indicators_2016$cut_com[which(local_gov_indicators_2016$commune == "Coihueco")] <- egi_2016$cut_com[which(egi_2016$commune == "COIHUECO")]
local_gov_indicators_2016$cut_com[which(local_gov_indicators_2016$commune == "Ñiquén")] <- egi_2016$cut_com[which(egi_2016$commune == "ÑIQUEN")]
local_gov_indicators_2016$cut_com[which(local_gov_indicators_2016$commune == "San Fabián")] <- egi_2016$cut_com[which(egi_2016$commune == "SAN FABIAN")]
local_gov_indicators_2016$cut_com[which(local_gov_indicators_2016$commune == "San Nicolás")] <- egi_2016$cut_com[which(egi_2016$commune == "SAN NICOLAS")]
local_gov_indicators_2016$cut_com[which(local_gov_indicators_2016$commune == "Chillán Viejo")] <- egi_2016$cut_com[which(egi_2016$commune == "CHILLAN VIEJO")]

local_gov_indicators_2016$cut_reg[which(local_gov_indicators_2016$commune == "Chillán")] <- 8
local_gov_indicators_2016$cut_reg[which(local_gov_indicators_2016$commune == "Bulnes")] <- 8
local_gov_indicators_2016$cut_reg[which(local_gov_indicators_2016$commune == "El Carmen")] <- 8
local_gov_indicators_2016$cut_reg[which(local_gov_indicators_2016$commune == "Pemuco")] <- 8
local_gov_indicators_2016$cut_reg[which(local_gov_indicators_2016$commune == "Pinto")] <- 8
local_gov_indicators_2016$cut_reg[which(local_gov_indicators_2016$commune == "Quillón")] <- 8
local_gov_indicators_2016$cut_reg[which(local_gov_indicators_2016$commune == "San Ignacio")] <- 8
local_gov_indicators_2016$cut_reg[which(local_gov_indicators_2016$commune == "Yungay")] <- 8
local_gov_indicators_2016$cut_reg[which(local_gov_indicators_2016$commune == "Quirihue")] <- 8
local_gov_indicators_2016$cut_reg[which(local_gov_indicators_2016$commune == "Cobquecura")] <- 8
local_gov_indicators_2016$cut_reg[which(local_gov_indicators_2016$commune == "Coelemu")] <- 8
local_gov_indicators_2016$cut_reg[which(local_gov_indicators_2016$commune == "Ninhue")] <- 8
local_gov_indicators_2016$cut_reg[which(local_gov_indicators_2016$commune == "Portezuelo")] <- 8
local_gov_indicators_2016$cut_reg[which(local_gov_indicators_2016$commune == "Ranquil")] <- 8
local_gov_indicators_2016$cut_reg[which(local_gov_indicators_2016$commune == "Treguaco")] <- 8
local_gov_indicators_2016$cut_reg[which(local_gov_indicators_2016$commune == "San Carlos")] <- 8
local_gov_indicators_2016$cut_reg[which(local_gov_indicators_2016$commune == "Coihueco")] <- 8
local_gov_indicators_2016$cut_reg[which(local_gov_indicators_2016$commune == "Ñiquén")] <- 8
local_gov_indicators_2016$cut_reg[which(local_gov_indicators_2016$commune == "San Fabián")] <- 8
local_gov_indicators_2016$cut_reg[which(local_gov_indicators_2016$commune == "San Nicolás")] <- 8
local_gov_indicators_2016$cut_reg[which(local_gov_indicators_2016$commune == "Chillán Viejo")] <- 8

local_gov_indicators_2016$region[which(local_gov_indicators_2016$commune == "Chillán")] <- "Biobío"
local_gov_indicators_2016$region[which(local_gov_indicators_2016$commune == "Bulnes")] <- "Biobío"
local_gov_indicators_2016$region[which(local_gov_indicators_2016$commune == "El Carmen")] <- "Biobío"
local_gov_indicators_2016$region[which(local_gov_indicators_2016$commune == "Pemuco")] <- "Biobío"
local_gov_indicators_2016$region[which(local_gov_indicators_2016$commune == "Pinto")] <- "Biobío"
local_gov_indicators_2016$region[which(local_gov_indicators_2016$commune == "Quillón")] <- "Biobío"
local_gov_indicators_2016$region[which(local_gov_indicators_2016$commune == "San Ignacio")] <- "Biobío"
local_gov_indicators_2016$region[which(local_gov_indicators_2016$commune == "Yungay")] <- "Biobío"
local_gov_indicators_2016$region[which(local_gov_indicators_2016$commune == "Quirihue")] <- "Biobío"
local_gov_indicators_2016$region[which(local_gov_indicators_2016$commune == "Cobquecura")] <- "Biobío"
local_gov_indicators_2016$region[which(local_gov_indicators_2016$commune == "Coelemu")] <- "Biobío"
local_gov_indicators_2016$region[which(local_gov_indicators_2016$commune == "Ninhue")] <- "Biobío"
local_gov_indicators_2016$region[which(local_gov_indicators_2016$commune == "Portezuelo")] <- "Biobío"
local_gov_indicators_2016$region[which(local_gov_indicators_2016$commune == "Ranquil")] <- "Biobío"
local_gov_indicators_2016$region[which(local_gov_indicators_2016$commune == "Treguaco")] <- "Biobío"
local_gov_indicators_2016$region[which(local_gov_indicators_2016$commune == "San Carlos")] <- "Biobío"
local_gov_indicators_2016$region[which(local_gov_indicators_2016$commune == "Coihueco")] <- "Biobío"
local_gov_indicators_2016$region[which(local_gov_indicators_2016$commune == "Ñiquén")] <- "Biobío"
local_gov_indicators_2016$region[which(local_gov_indicators_2016$commune == "San Fabián")] <- "Biobío"
local_gov_indicators_2016$region[which(local_gov_indicators_2016$commune == "San Nicolás")] <- "Biobío"
local_gov_indicators_2016$region[which(local_gov_indicators_2016$commune == "Chillán Viejo")] <- "Biobío"


local_gov_indicators_2016$cut_prov[which(local_gov_indicators_2016$commune == "Chillán")] <- 84
local_gov_indicators_2016$cut_prov[which(local_gov_indicators_2016$commune == "Bulnes")] <- 84
local_gov_indicators_2016$cut_prov[which(local_gov_indicators_2016$commune == "El Carmen")] <- 84
local_gov_indicators_2016$cut_prov[which(local_gov_indicators_2016$commune == "Pemuco")] <- 84
local_gov_indicators_2016$cut_prov[which(local_gov_indicators_2016$commune == "Pinto")] <- 84
local_gov_indicators_2016$cut_prov[which(local_gov_indicators_2016$commune == "Quillón")] <- 84
local_gov_indicators_2016$cut_prov[which(local_gov_indicators_2016$commune == "San Ignacio")] <- 84
local_gov_indicators_2016$cut_prov[which(local_gov_indicators_2016$commune == "Yungay")] <- 84
local_gov_indicators_2016$cut_prov[which(local_gov_indicators_2016$commune == "Quirihue")] <- 84
local_gov_indicators_2016$cut_prov[which(local_gov_indicators_2016$commune == "Cobquecura")] <- 84
local_gov_indicators_2016$cut_prov[which(local_gov_indicators_2016$commune == "Coelemu")] <- 84
local_gov_indicators_2016$cut_prov[which(local_gov_indicators_2016$commune == "Ninhue")] <- 84
local_gov_indicators_2016$cut_prov[which(local_gov_indicators_2016$commune == "Portezuelo")] <- 84
local_gov_indicators_2016$cut_prov[which(local_gov_indicators_2016$commune == "Ranquil")] <- 84
local_gov_indicators_2016$cut_prov[which(local_gov_indicators_2016$commune == "Treguaco")] <- 84
local_gov_indicators_2016$cut_prov[which(local_gov_indicators_2016$commune == "San Carlos")] <- 84
local_gov_indicators_2016$cut_prov[which(local_gov_indicators_2016$commune == "Coihueco")] <- 84
local_gov_indicators_2016$cut_prov[which(local_gov_indicators_2016$commune == "Ñiquén")] <- 84
local_gov_indicators_2016$cut_prov[which(local_gov_indicators_2016$commune == "San Fabián")] <- 84
local_gov_indicators_2016$cut_prov[which(local_gov_indicators_2016$commune == "San Nicolás")] <- 84
local_gov_indicators_2016$cut_prov[which(local_gov_indicators_2016$commune == "Chillán Viejo")] <- 84

local_gov_indicators_2016$province[which(local_gov_indicators_2016$commune == "Chillán")] <- "Ñuble"
local_gov_indicators_2016$province[which(local_gov_indicators_2016$commune == "Bulnes")] <- "Ñuble"
local_gov_indicators_2016$province[which(local_gov_indicators_2016$commune == "El Carmen")] <- "Ñuble"
local_gov_indicators_2016$province[which(local_gov_indicators_2016$commune == "Pemuco")] <- "Ñuble"
local_gov_indicators_2016$province[which(local_gov_indicators_2016$commune == "Pinto")] <- "Ñuble"
local_gov_indicators_2016$province[which(local_gov_indicators_2016$commune == "Quillón")] <- "Ñuble"
local_gov_indicators_2016$province[which(local_gov_indicators_2016$commune == "San Ignacio")] <- "Ñuble"
local_gov_indicators_2016$province[which(local_gov_indicators_2016$commune == "Yungay")] <- "Ñuble"
local_gov_indicators_2016$province[which(local_gov_indicators_2016$commune == "Quirihue")] <- "Ñuble"
local_gov_indicators_2016$province[which(local_gov_indicators_2016$commune == "Cobquecura")] <- "Ñuble"
local_gov_indicators_2016$province[which(local_gov_indicators_2016$commune == "Coelemu")] <- "Ñuble"
local_gov_indicators_2016$province[which(local_gov_indicators_2016$commune == "Ninhue")] <- "Ñuble"
local_gov_indicators_2016$province[which(local_gov_indicators_2016$commune == "Portezuelo")] <- "Ñuble"
local_gov_indicators_2016$province[which(local_gov_indicators_2016$commune == "Ranquil")] <- "Ñuble"
local_gov_indicators_2016$province[which(local_gov_indicators_2016$commune == "Treguaco")] <- "Ñuble"
local_gov_indicators_2016$province[which(local_gov_indicators_2016$commune == "San Carlos")] <- "Ñuble"
local_gov_indicators_2016$province[which(local_gov_indicators_2016$commune == "Coihueco")] <- "Ñuble"
local_gov_indicators_2016$province[which(local_gov_indicators_2016$commune == "Ñiquén")] <- "Ñuble"
local_gov_indicators_2016$province[which(local_gov_indicators_2016$commune == "San Fabián")] <- "Ñuble"
local_gov_indicators_2016$province[which(local_gov_indicators_2016$commune == "San Nicolás")] <- "Ñuble"
local_gov_indicators_2016$province[which(local_gov_indicators_2016$commune == "Chillán Viejo")] <- "Ñuble"
