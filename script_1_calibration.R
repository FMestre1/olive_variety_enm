################################################################################
#                         LOAD ENVIRONMENTAL LAYERS
################################################################################

#FMestre
#16-05-2024

#Load packages
library(sdm)
#sdm::getmethodNames()
#installAll()

# Using:
#galega_sdm_data
#cobrancosa_sdm_data
#arbequina_sdm_data
#picual_sdm_data
#cordovil_sdm_data
#madural_sdm_data
#verdeal_sdm_data

#Read...
#galega_sdm_data <- read.sdm(filename = "galega_sdm_data.sdd")
#cobrancosa_sdm_data <- read.sdm(filename = "cobrancosa_sdm_data.sdd")
#arbequina_sdm_data <- read.sdm(filename = "arbequina_sdm_data.sdd")
#picual_sdm_data <- read.sdm(filename = "picual_sdm_data.sdd")
#cordovil_sdm_data <- read.sdm(filename = "cordovil_sdm_data.sdd")
#madural_sdm_data <- read.sdm(filename = "madural_sdm_data.sdd")
#verdeal_sdm_data <- read.sdm( filename = "verdeal_sdm_data.sdd")


################################################################################
#                                0. Setup Options
################################################################################

modeloptions1 <- list(
  brt = list(distribution='bernoulli',
             n.trees=2000,
             interaction.depth=5,
             n.minobsinnode = 10,
             shrinkage = 0.005,
             bag.fraction = 0.75,
             train.fraction = 1.0,
             cv.folds=0,
             keep.data = TRUE,
             verbose = "CV",
             class.stratify.cv=NULL#,
             #ncores = 4
  ),
  mars = list(weights=NULL,
              pmethod='none',
              degree = 2,
              trace=0,
              glm=list(family=binomial)
  ),
  gam = list(family=binomial(link='logit'),
             k=10,
             bs='tp',
             weights=NULL,
             subset=NULL,
             na.action='na.omit',
             offset=NULL,
             method='REML',
             optimizer=c("outer","newton"),
             select=FALSE,
             knots=NULL,
             sp=NULL,
             min.sp=NULL,
             H=NULL,
             gamma=1,
             fit=TRUE,
             paraPen=NULL,
             G=NULL
  ),
  rf = list(ntree=1000,
            replace=TRUE,
            importance=TRUE
  )
)

################################################################################
#                                1. Build Models
################################################################################

galega_model <- sdm::sdm(Galega~.,data=galega_sdm_data, methods=c('mlp','cart','rf','fda','glm','gam','mars','brt'), replication=c('cv','boot'), cv.folds=nrow(galega), ncore = 6, modelSettings = modeloptions1, n=1)
cobrancosa_model <- sdm::sdm(Cobrancosa~.,data=cobrancosa_sdm_data,methods=c('mlp', 'cart','rf','fda','glm','gam','mars','brt'), replication=c('cv','boot'), cv.folds=nrow(cobrancosa), ncore = 6, modelSettings = modeloptions1, n=1)
arbequina_model <- sdm::sdm(Arbequina~.,data=arbequina_sdm_data,methods=c('mlp', 'cart','rf','fda','glm','gam','mars','brt'), replication=c('cv','boot'), cv.folds=nrow(arbequina), ncore = 6, modelSettings = modeloptions1, n=1)
picual_model <- sdm::sdm(Picual~.,data=picual_sdm_data, methods=c('mlp', 'cart','rf','fda','glm','gam','mars','brt'), replication=c('cv','boot'), cv.folds=nrow(picual), ncore = 6, modelSettings = modeloptions1, n=1)
cordovil_model <- sdm::sdm(Cordovil~.,data=cordovil_sdm_data,methods=c('mlp', 'cart','rf','fda','glm','gam','mars','brt'), replication=c('cv','boot'), cv.folds=nrow(cordovil), ncore = 6, modelSettings = modeloptions1, n=1)
madural_model <- sdm::sdm(Madural~.,data=madural_sdm_data,methods=c('mlp', 'cart','rf','fda','glm','gam','mars','brt'),replication=c('cv','boot'), cv.folds=nrow(madural), ncore = 6, modelSettings = modeloptions1, n=1)
verdeal_model <- sdm::sdm(VerdealTM~.,data=verdeal_sdm_data,methods=c('mlp', 'cart','rf','fda','glm','gam','mars','brt'),replication=c('cv','boot'), cv.folds=nrow(verdeal), ncore = 6, modelSettings = modeloptions1, n=1)

#Save...
#write.sdm(galega_model, file = "galega_model", overwrite = TRUE)
#write.sdm(cobrancosa_model, file = "cobrancosa_model", overwrite = TRUE)
#write.sdm(arbequina_model, file = "arbequina_model", overwrite = TRUE)
#write.sdm(picual_model, file = "picual_model", overwrite = TRUE)
#write.sdm(cordovil_model, file = "cordovil_model", overwrite = TRUE)
#write.sdm(madural_model, file = "madural_model", overwrite = TRUE)
#write.sdm(verdeal_model, file = "verdeal_model", overwrite = TRUE)

#Read
#galega_model <- read.sdm(filename = "galega_model.sdm")
#cobrancosa_model <- read.sdm(filename = "cobrancosa_model.sdm")
#arbequina_model <- read.sdm(filename = "arbequina_model.sdm")
#picual_model <- read.sdm(filename = "picual_model.sdm")
#cordovil_model <- read.sdm(filename = "cordovil_model.sdm")
#madural_model <- read.sdm(filename = "madural_model.sdm")
#verdeal_model <- read.sdm( filename = "verdeal_model.sdm")

################################################################################
#                    2. Model metrics and variable importance
################################################################################

##### Galega #####
#getModelInfo(galega_model)
vimp_galega <- getVarImp(galega_model)
vimp_galega@varImportanceMean$AUCtest
png(file="vimp_galega_model.png",width=800, height=500)
plot(getVarImp(galega_model),'auc')
dev.off()
#rcurve(galega_model, mean=TRUE, smooth=TRUE)


##### Cobrancosa #####
#getModelInfo(cobrancosa_model)
vimp_cobrancosa <- getVarImp(cobrancosa_model)
vimp_cobrancosa@varImportanceMean$AUCtest
png(file="vimp_cobrancosa_model.png",width=800, height=500)
plot(getVarImp(cobrancosa_model),'auc')
dev.off()
#rcurve(cobrancosa_model, mean=TRUE, smooth=TRUE)


##### Arbequina #####
#getModelInfo(arbequina_model)
vimp_arbequina <- getVarImp(arbequina_model)
vimp_arbequina@varImportanceMean$AUCtest
png(file="vimp_arbequina_model.png",width=800, height=500)
plot(getVarImp(arbequina_model),'auc')
dev.off()
#rcurve(arbequina_model, mean=TRUE, smooth=TRUE)


##### Picual #####
#getModelInfo(picual_model)
vimp_picual <- getVarImp(picual_model)
vimp_picual@varImportanceMean$AUCtest
png(file="vimp_picual_model.png",width=800, height=500)
plot(getVarImp(picual_model),'auc')
dev.off()
#rcurve(picual_model, mean=TRUE, smooth=TRUE)


##### Cordovil #####
#getModelInfo(picual_model)
vimp_cordovil <- getVarImp(cordovil_model)
vimp_cordovil@varImportanceMean$AUCtest
png(file="vimp_cordovil_model.png",width=800, height=500)
plot(getVarImp(cordovil_model),'auc')
dev.off()
#rcurve(cordovil_model, mean=TRUE, smooth=TRUE)


##### Madural #####
#getModelInfo(madural_model)
vimp_madural <- getVarImp(madural_model)
vimp_madural@varImportanceMean$AUCtest
png(file="vimp_madural_model.png",width=800, height=500)
plot(getVarImp(madural_model),'auc')
dev.off()
#rcurve(madural_model, mean=TRUE, smooth=TRUE)


##### Verdeal #####
#getModelInfo(verdeal_model)
vimp_verdeal <- getVarImp(verdeal_model)
vimp_verdeal@varImportanceMean$AUCtest
png(file="vimp_verdeal_model.png",width=800, height=500)
plot(getVarImp(verdeal_model),'auc')
dev.off()
#rcurve(verdeal_model, mean=TRUE, smooth=TRUE)


#Save...
#save(mean_ev_metrics_galega_model, file = "mean_ev_metrics_galega_model.RData")
#save(mean_ev_metrics_cobrancosa_model, file = "mean_ev_metrics_cobrancosa_model.RData")
#save(mean_ev_metrics_arbequina_model, file = "mean_ev_metrics_arbequina_model.RData")
#save(mean_ev_metrics_picual_model, file = "mean_ev_metrics_picual_model.RData")
#save(mean_ev_metrics_cordovil_model, file = "mean_ev_metrics_cordovil_model.RData")
#save(mean_ev_metrics_madural_model, file = "mean_ev_metrics_madural_model.RData")
#save(mean_ev_metrics_verdeal_model, file = "mean_ev_metrics_verdeal_model.RData")
