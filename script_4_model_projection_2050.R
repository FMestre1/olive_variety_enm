#######################################################################################################################################
#                                                   MODEL PROJECTION - 2050
#######################################################################################################################################

#FMestre
#28-04-2024

#Load packages
library(sdm)
library(terra)
#remotes::install_github("dieghernan/tidyterra")
library(tidyterra)

#?ensemble

#Read
#galega_model <- read.sdm(filename = "galega_model.sdm")
#cobrancosa_model <- read.sdm(filename = "cobrancosa_model.sdm")
#arbequina_model <- read.sdm(filename = "arbequina_model.sdm")
#picual_model <- read.sdm(filename = "picual_model.sdm")
#cordovil_model <- read.sdm(filename = "cordovil_model.sdm")
#madural_model <- read.sdm(filename = "madural_model.sdm")
#verdeal_model <- read.sdm( filename = "verdeal_model.sdm")

#Load the variable data frames
#variables_10x10_cc_rcp45 <- read.csv("variables_10x10_cc_rcp45.csv")
#variables_10x10_cn_rcp45 <- read.csv("variables_10x10_cn_rcp45.csv")
#variables_10x10_gf_rcp45 <- read.csv("variables_10x10_gf_rcp45.csv")
#variables_10x10_had_rcp45 <- read.csv("variables_10x10_had_rcp45.csv")
#variables_10x10_in_rcp45 <- read.csv("variables_10x10_in_rcp45.csv")
#variables_10x10_ip_rcp45 <- read.csv("variables_10x10_ip_rcp45.csv")
#variables_10x10_mpi_rcp45 <- read.csv("variables_10x10_mpi_rcp45.csv")

################################################################################
#                 Create vector for the 2050 projections
################################################################################

#Create 10x10 km to calibrate models
utm10 <- terra::vect("C:/Users/asus/Documents/github/olive_variety_enm/olive_variety_10x10_30Maio24.shp")
utm10 <- utm10[,c("Galega", "Cobrancosa", "Arbequina", "Picual", "Cordovil", "Madural", "Verdeal")]

utm10_results_2050 <- utm10
utm10_results_2050$galCC <- NA
utm10_results_2050$cbrCC <- NA
utm10_results_2050$arbCC <- NA
utm10_results_2050$picCC <- NA
utm10_results_2050$corCC <- NA
utm10_results_2050$madCC <- NA
utm10_results_2050$verCC <- NA
#
utm10_results_2050$galCN <- NA
utm10_results_2050$cbrCN <- NA
utm10_results_2050$arbCN <- NA
utm10_results_2050$picCN <- NA
utm10_results_2050$corCN <- NA
utm10_results_2050$madCN <- NA
utm10_results_2050$verCN <- NA
#
utm10_results_2050$galGF <- NA
utm10_results_2050$cbrGF <- NA
utm10_results_2050$arbGF <- NA
utm10_results_2050$picGF <- NA
utm10_results_2050$corGF <- NA
utm10_results_2050$madGF <- NA
utm10_results_2050$verGF <- NA
#
utm10_results_2050$galHad <- NA
utm10_results_2050$cbrHad <- NA
utm10_results_2050$arbHad <- NA
utm10_results_2050$picHad <- NA
utm10_results_2050$corHad <- NA
utm10_results_2050$madHad <- NA
utm10_results_2050$verHad <- NA
#
utm10_results_2050$galIN <- NA
utm10_results_2050$cbrIN <- NA
utm10_results_2050$arbIN <- NA
utm10_results_2050$picIN <- NA
utm10_results_2050$corIN <- NA
utm10_results_2050$madIN <- NA
utm10_results_2050$verIN <- NA
#
utm10_results_2050$galIP <- NA
utm10_results_2050$cbrIP <- NA
utm10_results_2050$arbIP <- NA
utm10_results_2050$picIP <- NA
utm10_results_2050$corIP <- NA
utm10_results_2050$madIP <- NA
utm10_results_2050$verIP <- NA
#
utm10_results_2050$galMPI <- NA
utm10_results_2050$cbrMPI <- NA
utm10_results_2050$arbMPI <- NA
utm10_results_2050$picMPI <- NA
utm10_results_2050$corMPI <- NA
utm10_results_2050$madMPI <- NA
utm10_results_2050$verMPI <- NA

#Complete the vector table
#load("ensemble_galega_2050_CC.RData")
#load("ensemble_cobrancosa_2050_CC.RData")
#load("ensemble_arbequina_2050_CC.RData")
#load("ensemble_picual_2050_CC.RData")
#load("ensemble_cordovil_2050_CC.RData")
#load("ensemble_madural_2050_CC.RData")
#load("ensemble_verdeal_2050_CC.RData")
#
#load("ensemble_galega_2050_CN.RData")
#load("ensemble_cobrancosa_2050_CN.RData")
#load("ensemble_arbequina_2050_CN.RData")
#load("ensemble_picual_2050_CN.RData")
#load("ensemble_cordovil_2050_CN.RData")
#load("ensemble_madural_2050_CN.RData")
#load("ensemble_verdeal_2050_CN.RData")
#
#load("ensemble_galega_2050_GF.RData")
#load("ensemble_cobrancosa_2050_GF.RData")
#load("ensemble_arbequina_2050_GF.RData")
#load("ensemble_picual_2050_GF.RData")
#load("ensemble_cordovil_2050_GF.RData")
#load("ensemble_madural_2050_GF.RData")
#load("ensemble_verdeal_2050_GF.RData")
#
#load("ensemble_galega_2050_HAD.RData")
#load("ensemble_cobrancosa_2050_HAD.RData")
#load("ensemble_arbequina_2050_HAD.RData")
#load("ensemble_picual_2050_HAD.RData")
#load("ensemble_cordovil_2050_HAD.RData")
#load("ensemble_madural_2050_HAD.RData")
#load("ensemble_verdeal_2050_HAD.RData")
#
#load("ensemble_galega_2050_IN.RData")
#load("ensemble_cobrancosa_2050_IN.RData")
#load("ensemble_arbequina_2050_IN.RData")
#load("ensemble_picual_2050_IN.RData")
#load("ensemble_cordovil_2050_IN.RData")
#load("ensemble_madural_2050_IN.RData")
#load("ensemble_verdeal_2050_IN.RData")
#
#load("ensemble_galega_2050_IP.RData")
#load("ensemble_cobrancosa_2050_IP.RData")
#load("ensemble_arbequina_2050_IP.RData")
#load("ensemble_picual_2050_IP.RData")
#load("ensemble_cordovil_2050_IP.RData")
#load("ensemble_madural_2050_IP.RData")
#load("ensemble_verdeal_2050_IP.RData")
#
#load("ensemble_galega_2050_MPI.RData")
#load("ensemble_cobrancosa_2050_MPI.RData")
#load("ensemble_arbequina_2050_MPI.RData")
#load("ensemble_picual_2050_MPI.RData")
#load("ensemble_cordovil_2050_MPI.RData")
#load("ensemble_madural_2050_MPI.RData")
#load("ensemble_verdeal_2050_MPI.RData")

#Send the columns to the vector table
utm10_results_2050$galCC <- ensemble_galega_2050_CC
utm10_results_2050$cbrCC <- ensemble_cobrancosa_2050_CC
utm10_results_2050$arbCC <- ensemble_arbequina_2050_CC
utm10_results_2050$picCC <- ensemble_picual_2050_CC
utm10_results_2050$corCC <- ensemble_cordovil_2050_CC
utm10_results_2050$madCC <- ensemble_madural_2050_CC
utm10_results_2050$verCC <- ensemble_verdeal_2050_CC
#
utm10_results_2050$galCN <- ensemble_galega_2050_CN
utm10_results_2050$cbrCN <- ensemble_cobrancosa_2050_CN
utm10_results_2050$arbCN <- ensemble_arbequina_2050_CN
utm10_results_2050$picCN <- ensemble_picual_2050_CN
utm10_results_2050$corCN <- ensemble_cordovil_2050_CN
utm10_results_2050$madCN <- ensemble_madural_2050_CN
utm10_results_2050$verCN <- ensemble_verdeal_2050_CN
#
utm10_results_2050$galGF <- ensemble_galega_2050_GF
utm10_results_2050$cbrGF <- ensemble_cobrancosa_2050_GF
utm10_results_2050$arbGF <- ensemble_arbequina_2050_GF
utm10_results_2050$picGF <- ensemble_picual_2050_GF
utm10_results_2050$corGF <- ensemble_cordovil_2050_GF
utm10_results_2050$madGF <- ensemble_madural_2050_GF
utm10_results_2050$verGF <- ensemble_verdeal_2050_GF
#
utm10_results_2050$galHad <- ensemble_galega_2050_HAD
utm10_results_2050$cbrHad <- ensemble_cobrancosa_2050_HAD
utm10_results_2050$arbHad <- ensemble_arbequina_2050_HAD
utm10_results_2050$picHad <- ensemble_picual_2050_HAD
utm10_results_2050$corHad <- ensemble_cordovil_2050_HAD
utm10_results_2050$madHad <- ensemble_madural_2050_HAD
utm10_results_2050$verHad <- ensemble_verdeal_2050_HAD
#
utm10_results_2050$galIN <- ensemble_galega_2050_IN
utm10_results_2050$cbrIN <- ensemble_cobrancosa_2050_IN
utm10_results_2050$arbIN <- ensemble_arbequina_2050_IN
utm10_results_2050$picIN <- ensemble_picual_2050_IN
utm10_results_2050$corIN <- ensemble_cordovil_2050_IN
utm10_results_2050$madIN <- ensemble_madural_2050_IN
utm10_results_2050$verIN <- ensemble_verdeal_2050_IN
#
utm10_results_2050$galIP <- ensemble_galega_2050_IP
utm10_results_2050$cbrIP <- ensemble_cobrancosa_2050_IP
utm10_results_2050$arbIP <- ensemble_arbequina_2050_IP
utm10_results_2050$picIP <- ensemble_picual_2050_IP
utm10_results_2050$corIP <- ensemble_cordovil_2050_IP
utm10_results_2050$madIP <- ensemble_madural_2050_IP
utm10_results_2050$verIP <- ensemble_verdeal_2050_IP
#
utm10_results_2050$galMPI <- ensemble_galega_2050_MPI
utm10_results_2050$cbrMPI <- ensemble_cobrancosa_2050_MPI
utm10_results_2050$arbMPI <- ensemble_arbequina_2050_MPI
utm10_results_2050$picMPI <- ensemble_picual_2050_MPI
utm10_results_2050$corMPI <- ensemble_cordovil_2050_MPI
utm10_results_2050$madMPI <- ensemble_madural_2050_MPI
utm10_results_2050$verMPI <- ensemble_verdeal_2050_MPI

#######################################################################################################################################
#                                                   MODEL PROJECTION - 2050
#######################################################################################################################################

################################################################################
#                 RCP 4.5 - CCSM4 (CC)
################################################################################

##### GALEGA #####
ensemble_galega_2050_CC <- sdm::ensemble(
  x = galega_model,
  newdata = variables_10x10_cc_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$galCC <- ensemble_galega_2050_CC
save(ensemble_galega_2050_CC, file = "ensemble_galega_2050_CC.RData")
#load("ensemble_galega_2050_CC.RData")

##### COBRANÇOSA #####
ensemble_cobrancosa_2050_CC <- sdm::ensemble(
  x = cobrancosa_model,
  newdata = variables_10x10_cc_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$cbrCC <- ensemble_cobrancosa_2050_CC
save(ensemble_cobrancosa_2050_CC, file = "ensemble_cobrancosa_2050_CC.RData")
#load("ensemble_cobrancosa_2050_CC.RData")

##### ARBEQUINA
ensemble_arbequina_2050_CC <- sdm::ensemble(
  x = arbequina_model,
  newdata = variables_10x10_cc_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$arbCC <- ensemble_arbequina_2050_CC
save(ensemble_arbequina_2050_CC, file = "ensemble_arbequina_2050_CC.RData")
#load("ensemble_arbequina_2050_CC.RData")


##### PICUAL
ensemble_picual_2050_CC <- sdm::ensemble(
  x = picual_model,
  newdata = variables_10x10_cc_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$picCC <- ensemble_picual_2050_CC
save(ensemble_picual_2050_CC, file = "ensemble_picual_2050_CC.RData")
#load("ensemble_picual_2050_CC.RData")


##### CORDOVIL
ensemble_cordovil_2050_CC <- sdm::ensemble(
  x = cordovil_model,
  newdata = variables_10x10_cc_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$corCC <- ensemble_cordovil_2050_CC
save(ensemble_cordovil_2050_CC, file = "ensemble_cordovil_2050_CC.RData")
#load("ensemble_cordovil_2050_CC.RData")


##### MADURAL
ensemble_madural_2050_CC <- sdm::ensemble(
  x = madural_model,
  newdata = variables_10x10_cc_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$madCC <- ensemble_madural_2050_CC
save(ensemble_madural_2050_CC, file = "ensemble_madural_2050_CC.RData")
#load("ensemble_madural_2050_CC.RData")

##### VERDEAL
ensemble_verdeal_2050_CC <- sdm::ensemble(
  x = verdeal_model,
  newdata = variables_10x10_cc_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$verCC <- ensemble_verdeal_2050_CC
save(ensemble_verdeal_2050_CC, file = "ensemble_verdeal_2050_CC.RData")
#load("ensemble_verdeal_2050_CC.RData")

################################################################################
#                 RCP 4.5 - CNRM-CM5 (CN)
################################################################################

##### GALEGA #####
ensemble_galega_2050_CN <- sdm::ensemble(
  x = galega_model,
  newdata = variables_10x10_cn_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$galCN <- ensemble_galega_2050_CN
save(ensemble_galega_2050_CN, file = "ensemble_galega_2050_CN.RData")
#load("ensemble_galega_2050_CN.RData")

##### COBRANÇOSA #####
ensemble_cobrancosa_2050_CN <- sdm::ensemble(
  x = cobrancosa_model,
  newdata = variables_10x10_cn_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$cbrCN <- ensemble_cobrancosa_2050_CN
save(ensemble_cobrancosa_2050_CN, file = "ensemble_cobrancosa_2050_CN.RData")
#load("ensemble_cobrancosa_2050_CN.RData")

##### ARBEQUINA
ensemble_arbequina_2050_CN <- sdm::ensemble(
  x = arbequina_model,
  newdata = variables_10x10_cn_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$arbCN <- ensemble_arbequina_2050_CN
save(ensemble_arbequina_2050_CN, file = "ensemble_arbequina_2050_CN.RData")
#load("ensemble_arbequina_2050_CN.RData")

##### PICUAL
ensemble_picual_2050_CN <- sdm::ensemble(
  x = picual_model,
  newdata = variables_10x10_cn_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$picCN <- ensemble_picual_2050_CN
save(ensemble_picual_2050_CN, file = "ensemble_picual_2050_CN.RData")
#load("ensemble_picual_2050_CN.RData")


##### CORDOVIL
ensemble_cordovil_2050_CN <- sdm::ensemble(
  x = cordovil_model,
  newdata = variables_10x10_cn_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$corCN <- ensemble_cordovil_2050_CN
save(ensemble_cordovil_2050_CN, file = "ensemble_cordovil_2050_CN.RData")
#load("ensemble_cordovil_2050_CN.RData")


##### MADURAL
ensemble_madural_2050_CN <- sdm::ensemble(
  x = madural_model,
  newdata = variables_10x10_cn_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$madCN <- ensemble_madural_2050_CN
save(ensemble_madural_2050_CN, file = "ensemble_madural_2050_CN.RData")
#load("ensemble_madural_2050_CN.RData")

##### VERDEAL
ensemble_verdeal_2050_CN <- sdm::ensemble(
  x = verdeal_model,
  newdata = variables_10x10_cn_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$verCN <- ensemble_verdeal_2050_CN
save(ensemble_verdeal_2050_CN, file = "ensemble_verdeal_2050_CN.RData")
#load("ensemble_verdeal_2050_CN.RData")


################################################################################
#                 RCP 4.5 - GFDL-CM3 (GF)
################################################################################

##### GALEGA #####
ensemble_galega_2050_GF <- sdm::ensemble(
  x = galega_model,
  newdata = variables_10x10_gf_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$galGF <- ensemble_galega_2050_GF
save(ensemble_galega_2050_GF, file = "ensemble_galega_2050_GF.RData")
#load("ensemble_galega_2050_GF.RData")

##### COBRANÇOSA #####
ensemble_cobrancosa_2050_GF <- sdm::ensemble(
  x = cobrancosa_model,
  newdata = variables_10x10_gf_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$cbrGF <- ensemble_cobrancosa_2050_GF
save(ensemble_cobrancosa_2050_GF, file = "ensemble_cobrancosa_2050_GF.RData")
#load("ensemble_cobrancosa_2050_GF.RData")

##### ARBEQUINA
ensemble_arbequina_2050_GF <- sdm::ensemble(
  x = arbequina_model,
  newdata = variables_10x10_gf_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$arbGF <- ensemble_arbequina_2050_GF
save(ensemble_arbequina_2050_GF, file = "ensemble_arbequina_2050_GF.RData")
#load("ensemble_arbequina_2050_GF.RData")


##### PICUAL
ensemble_picual_2050_GF <- sdm::ensemble(
  x = picual_model,
  newdata = variables_10x10_gf_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$picGF <- ensemble_picual_2050_GF
save(ensemble_picual_2050_GF, file = "ensemble_picual_2050_GF.RData")
#load("ensemble_picual_2050_GF.RData")


##### CORDOVIL
ensemble_cordovil_2050_GF <- sdm::ensemble(
  x = cordovil_model,
  newdata = variables_10x10_gf_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$corGF <- ensemble_cordovil_2050_GF
save(ensemble_cordovil_2050_GF, file = "ensemble_cordovil_2050_GF.RData")
#load("ensemble_cordovil_2050_GF.RData")


##### MADURAL
ensemble_madural_2050_GF <- sdm::ensemble(
  x = madural_model,
  newdata = variables_10x10_gf_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$madGF <- ensemble_madural_2050_GF
save(ensemble_madural_2050_GF, file = "ensemble_madural_2050_GF.RData")
#load("ensemble_madural_2050_GF.RData")


##### VERDEAL
ensemble_verdeal_2050_GF <- sdm::ensemble(
  x = verdeal_model,
  newdata = variables_10x10_gf_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$verGF <- ensemble_verdeal_2050_GF
save(ensemble_verdeal_2050_GF, file = "ensemble_verdeal_2050_GF.RData")
#load("ensemble_verdeal_2050_GF.RData")

################################################################################
#                 RCP 4.5 - HadGEM2-ES (Had)
################################################################################


##### GALEGA #####
ensemble_galega_2050_HAD <- sdm::ensemble(
  x = galega_model,
  newdata = variables_10x10_had_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$galHAD <- ensemble_galega_2050_HAD
save(ensemble_galega_2050_HAD, file = "ensemble_galega_2050_HAD.RData")
#load("ensemble_galega_2050_HAD.RData")

##### COBRANÇOSA #####
ensemble_cobrancosa_2050_HAD <- sdm::ensemble(
  x = cobrancosa_model,
  newdata = variables_10x10_had_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$cbrHAD <- ensemble_cobrancosa_2050_HAD
save(ensemble_cobrancosa_2050_HAD, file = "ensemble_cobrancosa_2050_HAD.RData")
#load("ensemble_cobrancosa_2050_HAD.RData")

##### ARBEQUINA
ensemble_arbequina_2050_HAD <- sdm::ensemble(
  x = arbequina_model,
  newdata = variables_10x10_had_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$arbHAD <- ensemble_arbequina_2050_HAD
save(ensemble_arbequina_2050_HAD, file = "ensemble_arbequina_2050_HAD.RData")
#load("ensemble_arbequina_2050_HAD.RData")


##### PICUAL
ensemble_picual_2050_HAD <- sdm::ensemble(
  x = picual_model,
  newdata = variables_10x10_had_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$picHAD <- ensemble_picual_2050_HAD
save(ensemble_picual_2050_HAD, file = "ensemble_picual_2050_HAD.RData")
#load("ensemble_picual_2050_HAD.RData")


##### CORDOVIL
ensemble_cordovil_2050_HAD <- sdm::ensemble(
  x = cordovil_model,
  newdata = variables_10x10_had_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$corHAD <- ensemble_cordovil_2050_HAD
save(ensemble_cordovil_2050_HAD, file = "ensemble_cordovil_2050_HAD.RData")
#load("ensemble_cordovil_2050_HAD.RData")


##### MADURAL
ensemble_madural_2050_HAD <- sdm::ensemble(
  x = madural_model,
  newdata = variables_10x10_had_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$madHAD <- ensemble_madural_2050_HAD
save(ensemble_madural_2050_HAD, file = "ensemble_madural_2050_HAD.RData")
#load("ensemble_madural_2050_HAD.RData")

##### VERDEAL
ensemble_verdeal_2050_HAD <- sdm::ensemble(
  x = verdeal_model,
  newdata = variables_10x10_had_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$verHAD <- ensemble_verdeal_2050_HAD
save(ensemble_verdeal_2050_HAD, file = "ensemble_verdeal_2050_HAD.RData")
#load("ensemble_verdeal_2050_HAD.RData")

################################################################################
#                 RCP 4.5 - INMCM4 (IN)
################################################################################


##### GALEGA #####
ensemble_galega_2050_IN <- sdm::ensemble(
  x = galega_model,
  newdata = variables_10x10_in_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$galIN <- ensemble_galega_2050_IN
save(ensemble_galega_2050_IN, file = "ensemble_galega_2050_IN.RData")
#load("ensemble_galega_2050_IN.RData")

##### COBRANÇOSA #####
ensemble_cobrancosa_2050_IN <- sdm::ensemble(
  x = cobrancosa_model,
  newdata = variables_10x10_in_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$cbrIN <- ensemble_cobrancosa_2050_IN
save(ensemble_cobrancosa_2050_IN, file = "ensemble_cobrancosa_2050_IN.RData")
#load("ensemble_cobrancosa_2050_IN.RData")

##### ARBEQUINA
ensemble_arbequina_2050_IN <- sdm::ensemble(
  x = arbequina_model,
  newdata = variables_10x10_in_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$arbIN <- ensemble_arbequina_2050_IN
save(ensemble_arbequina_2050_IN, file = "ensemble_arbequina_2050_IN.RData")
#load("ensemble_arbequina_2050_IN.RData")


##### PICUAL
ensemble_picual_2050_IN <- sdm::ensemble(
  x = picual_model,
  newdata = variables_10x10_in_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$picIN <- ensemble_picual_2050_IN
save(ensemble_picual_2050_IN, file = "ensemble_picual_2050_IN.RData")
#load("ensemble_picual_2050_IN.RData")


##### CORDOVIL
ensemble_cordovil_2050_IN <- sdm::ensemble(
  x = cordovil_model,
  newdata = variables_10x10_in_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$corIN <- ensemble_cordovil_2050_IN
save(ensemble_cordovil_2050_IN, file = "ensemble_cordovil_2050_IN.RData")
#load("ensemble_cordovil_2050_IN.RData")


##### MADURAL
ensemble_madural_2050_IN <- sdm::ensemble(
  x = madural_model,
  newdata = variables_10x10_in_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$madIN <- ensemble_madural_2050_IN
save(ensemble_madural_2050_IN, file = "ensemble_madural_2050_IN.RData")
#load("ensemble_madural_2050_IN.RData")

##### VERDEAL
ensemble_verdeal_2050_IN <- sdm::ensemble(
  x = verdeal_model,
  newdata = variables_10x10_in_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$verIN <- ensemble_verdeal_2050_IN
save(ensemble_verdeal_2050_IN, file = "ensemble_verdeal_2050_IN.RData")
#load("ensemble_verdeal_2050_IN.RData")

################################################################################
#                 RCP 4.5 - IPSL-CM5A-LR (IP)
################################################################################

##### GALEGA #####
ensemble_galega_2050_IP <- sdm::ensemble(
  x = galega_model,
  newdata = variables_10x10_ip_rcp45,
  settipg=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$galIP <- ensemble_galega_2050_IP
save(ensemble_galega_2050_IP, file = "ensemble_galega_2050_IP.RData")
#load("ensemble_galega_2050_IP.RData")

##### COBRANÇOSA #####
ensemble_cobrancosa_2050_IP <- sdm::ensemble(
  x = cobrancosa_model,
  newdata = variables_10x10_ip_rcp45,
  settipg=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$cbrIP <- ensemble_cobrancosa_2050_IP
save(ensemble_cobrancosa_2050_IP, file = "ensemble_cobrancosa_2050_IP.RData")
#load("ensemble_cobrancosa_2050_IP.RData")

##### ARBEQUIPA
ensemble_arbequina_2050_IP <- sdm::ensemble(
  x = arbequina_model,
  newdata = variables_10x10_ip_rcp45,
  settipg=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$arbIP <- ensemble_arbequina_2050_IP
save(ensemble_arbequina_2050_IP, file = "ensemble_arbequina_2050_IP.RData")
#load("ensemble_arbequipa_2050_IP.RData")


##### PICUAL
ensemble_picual_2050_IP <- sdm::ensemble(
  x = picual_model,
  newdata = variables_10x10_ip_rcp45,
  settipg=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$picIP <- ensemble_picual_2050_IP
save(ensemble_picual_2050_IP, file = "ensemble_picual_2050_IP.RData")
#load("ensemble_picual_2050_IP.RData")


##### CORDOVIL
ensemble_cordovil_2050_IP <- sdm::ensemble(
  x = cordovil_model,
  newdata = variables_10x10_ip_rcp45,
  settipg=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$corIP <- ensemble_cordovil_2050_IP
save(ensemble_cordovil_2050_IP, file = "ensemble_cordovil_2050_IP.RData")
#load("ensemble_cordovil_2050_IP.RData")


##### MADURAL
ensemble_madural_2050_IP <- sdm::ensemble(
  x = madural_model,
  newdata = variables_10x10_ip_rcp45,
  settipg=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$madIP <- ensemble_madural_2050_IP
save(ensemble_madural_2050_IP, file = "ensemble_madural_2050_IP.RData")
#load("ensemble_madural_2050_IP.RData")

##### VERDEAL
ensemble_verdeal_2050_IP <- sdm::ensemble(
  x = verdeal_model,
  newdata = variables_10x10_ip_rcp45,
  settipg=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$verIP <- ensemble_verdeal_2050_IP
save(ensemble_verdeal_2050_IP, file = "ensemble_verdeal_2050_IP.RData")
#load("ensemble_verdeal_2050_IP.RData")

################################################################################
#                 RCP 4.5 - MPI-ESM-LR (MPI)
################################################################################


##### GALEGA #####
ensemble_galega_2050_MPI <- sdm::ensemble(
  x = galega_model,
  newdata = variables_10x10_mpi_rcp45,
  settmpig=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$galMPI <- ensemble_galega_2050_MPI
save(ensemble_galega_2050_MPI, file = "ensemble_galega_2050_MPI.RData")
#load("ensemble_galega_2050_MPI.RData")

##### COBRANÇOSA #####
ensemble_cobrancosa_2050_MPI <- sdm::ensemble(
  x = cobrancosa_model,
  newdata = variables_10x10_mpi_rcp45,
  settmpig=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$cbrMPI <- ensemble_cobrancosa_2050_MPI
save(ensemble_cobrancosa_2050_MPI, file = "ensemble_cobrancosa_2050_MPI.RData")
#load("ensemble_cobrancosa_2050_MPI.RData")

##### ARBEQUMPIA
ensemble_arbequina_2050_MPI <- sdm::ensemble(
  x = arbequina_model,
  newdata = variables_10x10_mpi_rcp45,
  settmpig=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$arbMPI <- ensemble_arbequina_2050_MPI
save(ensemble_arbequina_2050_MPI, file = "ensemble_arbequina_2050_MPI.RData")
#load("ensemble_arbequmpia_2050_MPI.RData")


##### PICUAL
ensemble_picual_2050_MPI <- sdm::ensemble(
  x = picual_model,
  newdata = variables_10x10_mpi_rcp45,
  settmpig=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$picMPI <- ensemble_picual_2050_MPI
save(ensemble_picual_2050_MPI, file = "ensemble_picual_2050_MPI.RData")
#load("ensemble_picual_2050_MPI.RData")


##### CORDOVIL
ensemble_cordovil_2050_MPI <- sdm::ensemble(
  x = cordovil_model,
  newdata = variables_10x10_mpi_rcp45,
  settmpig=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$corMPI <- ensemble_cordovil_2050_MPI
save(ensemble_cordovil_2050_MPI, file = "ensemble_cordovil_2050_MPI.RData")
#load("ensemble_cordovil_2050_MPI.RData")


##### MADURAL
ensemble_madural_2050_MPI <- sdm::ensemble(
  x = madural_model,
  newdata = variables_10x10_mpi_rcp45,
  settmpig=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$madMPI <- ensemble_madural_2050_MPI
save(ensemble_madural_2050_MPI, file = "ensemble_madural_2050_MPI.RData")
#load("ensemble_madural_2050_MPI.RData")

##### VERDEAL
ensemble_verdeal_2050_MPI <- sdm::ensemble(
  x = verdeal_model,
  newdata = variables_10x10_mpi_rcp45,
  settmpig=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$verMPI <- ensemble_verdeal_2050_MPI
save(ensemble_verdeal_2050_MPI, file = "ensemble_verdeal_2050_MPI.RData")
#load("ensemble_verdeal_2050_MPI.RData")


################################################################################
#                              Write to shapefile
################################################################################

terra::writeVector(utm10_results_2050, "utm10_results_2050_version_1", filetype="ESRI Shapefile")
#utm10_results_2050 <- terra::vect("olive_variety_suitability_v2/utm10_results_2050.shp")
