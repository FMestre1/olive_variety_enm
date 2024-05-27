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

# Example 3: fits using 5 models, and evaluates using 10 runs of both 5-folds 
#cross-validation and bootsrapping replication methods

#m <- sdm(sp~.,data=d,methods=c('gbm','tree','mars','mda','fda'), replication=c('cv','boot'),cv.folds=5, n=10)

galega_model <- sdm::sdm(Galega~.,data=galega_sdm_data, methods=c('mlp','cart','rf','fda','glm','gam','mars','brt'), replication=c('cv','boot'), cv.folds=nrow(galega), ncore = 6, modelSettings = modeloptions1, n=1)
cobrancosa_model <- sdm::sdm(Cobrancosa~.,data=cobrancosa_sdm_data,methods=c('mlp', 'cart','rf','fda','glm','gam','mars','brt'), replication=c('cv','boot'), cv.folds=nrow(cobrancosa), ncore = 6, modelSettings = modeloptions1, n=1)
arbequina_model <- sdm::sdm(Arbequina~.,data=arbequina_sdm_data,methods=c('mlp', 'cart','rf','fda','glm','gam','mars','brt'), replication=c('cv','boot'), cv.folds=nrow(arbequina), ncore = 6, modelSettings = modeloptions1, n=1)
picual_model <- sdm::sdm(Picual~.,data=picual_sdm_data, methods=c('mlp', 'cart','rf','fda','glm','gam','mars','brt'), replication=c('cv','boot'), cv.folds=nrow(picual), ncore = 6, modelSettings = modeloptions1, n=1)
cordovil_model <- sdm::sdm(Cordovil~.,data=cordovil_sdm_data,methods=c('mlp', 'cart','rf','fda','glm','gam','mars','brt'), replication=c('cv','boot'), cv.folds=nrow(cordovil), ncore = 6, modelSettings = modeloptions1, n=1)
madural_model <- sdm::sdm(Madural~.,data=madural_sdm_data,methods=c('mlp', 'cart','rf','fda','glm','gam','mars','brt'),replication=c('cv','boot'), cv.folds=nrow(madural), ncore = 6, modelSettings = modeloptions1, n=1)
verdeal_model <- sdm::sdm(Verdeal~.,data=verdeal_sdm_data,methods=c('mlp', 'cart','rf','fda','glm','gam','mars','brt'),replication=c('cv','boot'), cv.folds=nrow(verdeal), ncore = 6, modelSettings = modeloptions1, n=1)


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
#
plot(getVarImp(galega_model),'auc')
rcurve(galega_model, mean=TRUE, smooth=TRUE)
ev_metrics_galega_model <- getEvaluation(galega_model, stat=c('TSS','Kappa','AUC', 'specificity', 'sensitivity'),opt="max(se+sp)")
mean_ev_metrics_galega_model <- as.data.frame(round(colMeans(x=ev_metrics_galega_model),3))
#save(mean_ev_metrics_galega_model, file = "mean_ev_metrics_galega_model.RData")


##### Cobrancosa #####
#getModelInfo(cobrancosa_model)
vimp_cobrancosa <- getVarImp(cobrancosa_model)
vimp_cobrancosa@varImportanceMean$AUCtest
#
plot(getVarImp(cobrancosa_model),'auc')
rcurve(cobrancosa_model, mean=TRUE, smooth=TRUE)
ev_metrics_cobrancosa_model <- getEvaluation(cobrancosa_model, stat=c('TSS','Kappa','AUC', 'specificity', 'sensitivity'),opt="max(se+sp)")
mean_ev_metrics_cobrancosa_model <- as.data.frame(round(colMeans(x=ev_metrics_cobrancosa_model),3))
#save(mean_ev_metrics_cobrancosa_model, file = "mean_ev_metrics_cobrancosa_model.RData")


##### Arbequina #####
#getModelInfo(arbequina_model)
vimp_arbequina <- getVarImp(arbequina_model)
vimp_arbequina@varImportanceMean$AUCtest
#
plot(getVarImp(arbequina_model),'auc')
rcurve(arbequina_model, mean=TRUE, smooth=TRUE)
ev_metrics_arbequina_model <- getEvaluation(arbequina_model, stat=c('TSS','Kappa','AUC', 'specificity', 'sensitivity'),opt="max(se+sp)")
mean_ev_metrics_arbequina_model <- as.data.frame(round(colMeans(x=ev_metrics_arbequina_model),3))
#save(mean_ev_metrics_arbequina_model, file = "mean_ev_metrics_arbequina_model.RData")


##### Picual #####
#getModelInfo(picual_model)
vimp_picual <- getVarImp(picual_model)
vimp_picual@varImportanceMean$AUCtest
#
plot(getVarImp(picual_model),'auc')
rcurve(picual_model, mean=TRUE, smooth=TRUE)
ev_metrics_picual_model <- getEvaluation(picual_model, stat=c('TSS','Kappa','AUC', 'specificity', 'sensitivity'),opt="max(se+sp)")
mean_ev_metrics_picual_model <- as.data.frame(round(colMeans(x=ev_metrics_picual_model),3))
#save(mean_ev_metrics_picual_model, file = "mean_ev_metrics_picual_model.RData")


##### Cordovil #####
#getModelInfo(picual_model)
vimp_cordovil <- getVarImp(cordovil_model)
vimp_cordovil@varImportanceMean$AUCtest
#
plot(getVarImp(cordovil_model),'auc')
rcurve(cordovil_model, mean=TRUE, smooth=TRUE)
ev_metrics_cordovil_model <- getEvaluation(cordovil_model, stat=c('TSS','Kappa','AUC', 'specificity', 'sensitivity'),opt="max(se+sp)")
mean_ev_metrics_cordovil_model <- as.data.frame(round(colMeans(x=ev_metrics_cordovil_model),3))
#save(mean_ev_metrics_cordovil_model, file = "mean_ev_metrics_cordovil_model.RData")


##### Madural #####
#getModelInfo(madural_model)
vimp_madural <- getVarImp(madural_model)
vimp_madural@varImportanceMean$AUCtest
#
plot(getVarImp(madural_model),'auc')
rcurve(madural_model, mean=TRUE, smooth=TRUE)
ev_metrics_madural_model <- getEvaluation(madural_model, stat=c('TSS','Kappa','AUC', 'specificity', 'sensitivity'),opt="max(se+sp)")
mean_ev_metrics_madural_model <- as.data.frame(round(colMeans(x=ev_metrics_madural_model),3))
#save(mean_ev_metrics_madural_model, file = "mean_ev_metrics_madural_model.RData")


##### Verdeal #####
#getModelInfo(verdeal_model)
vimp_verdeal <- getVarImp(verdeal_model)
vimp_verdeal@varImportanceMean$AUCtest
#
plot(getVarImp(verdeal_model),'auc')
rcurve(verdeal_model, mean=TRUE, smooth=TRUE)
ev_metrics_verdeal_model <- getEvaluation(verdeal_model, stat=c('TSS','Kappa','AUC', 'specificity', 'sensitivity'),opt="max(se+sp)")
mean_ev_metrics_verdeal_model <- as.data.frame(round(colMeans(x=ev_metrics_verdeal_model),3))
#save(mean_ev_metrics_verdeal_model, file = "mean_ev_metrics_verdeal_model.RData")

