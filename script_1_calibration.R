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

galega_model <- sdm::sdm(Galega~.,data=galega_sdm_data, methods=c('mlp','cart','rf','fda','glm','gam','mars','brt'), replication='sub', ncore = 4, modelSettings = modeloptions1, test.percent=30,n=10)
cobrancosa_model <- sdm::sdm(Cobrancosa~.,data=cobrancosa_sdm_data,methods=c('mlp', 'cart','rf','fda','glm','gam','mars','brt'),replication='sub', ncore = 4, modelSettings = modeloptions1, test.percent=30,n=10)
arbequina_model <- sdm::sdm(Arbequina~.,data=arbequina_sdm_data,methods=c('mlp', 'cart','rf','fda','glm','gam','mars','brt'),replication='sub', ncore = 4, modelSettings = modeloptions1, test.percent=30,n=10)
picual_model <- sdm::sdm(Picual~.,data=picual_sdm_data, methods=c('mlp', 'cart','rf','fda','glm','gam','mars','brt'),replication='sub', ncore = 4, modelSettings = modeloptions1, test.percent=30,n=10)
cordovil_model <- sdm::sdm(Cordovil~.,data=cordovil_sdm_data,methods=c('mlp', 'cart','rf','fda','glm','gam','mars','brt'),replication='sub', ncore = 4, modelSettings = modeloptions1, test.percent=30,n=10)
madural_model <- sdm::sdm(Madural~.,data=madural_sdm_data,methods=c('mlp', 'cart','rf','fda','glm','gam','mars','brt'),replication='sub', ncore = 4, modelSettings = modeloptions1, test.percent=30,n=10)
verdeal_model <- sdm::sdm(Verdeal~.,data=verdeal_sdm_data,methods=c('mlp', 'cart','rf','fda','glm','gam','mars','brt'),replication='sub', ncore = 4, modelSettings = modeloptions1, test.percent=30,n=10)

################################################################################
#                    2. Model metrics and variable importance
################################################################################

##### Galega #####
#getModelInfo(galega_model)
plot(getVarImp(galega_model),'auc')
rcurve(galega_model, mean=TRUE, smooth=TRUE)
ev_metrics_galega_model <- getEvaluation(galega_model, stat=c('TSS','Kappa','AUC', 'specificity', 'sensitivity'),opt="max(se+sp)")
mean_ev_metrics_galega_model <- as.data.frame(round(colMeans(x=ev_metrics_galega_model),3))

##### Cobrancosa #####
#getModelInfo(cobrancosa_model)
plot(getVarImp(cobrancosa_model),'auc')
rcurve(cobrancosa_model, mean=TRUE, smooth=TRUE)
ev_metrics_cobrancosa_model <- getEvaluation(cobrancosa_model, stat=c('TSS','Kappa','AUC', 'specificity', 'sensitivity'),opt="max(se+sp)")
mean_ev_metrics_cobrancosa_model <- as.data.frame(round(colMeans(x=ev_metrics_cobrancosa_model),3))

##### Arbequina #####
#getModelInfo(XXXX)
plot(getVarImp(arbequina_model),'auc')
rcurve(arbequina_model, mean=TRUE, smooth=TRUE)
ev_metrics_arbequina_model <- getEvaluation(arbequina_model, stat=c('TSS','Kappa','AUC', 'specificity', 'sensitivity'),opt="max(se+sp)")
mean_ev_metrics_arbequina_model <- as.data.frame(round(colMeans(x=ev_metrics_arbequina_model),3))

##### Picual #####
#getModelInfo(picual_model)
plot(getVarImp(picual_model),'auc')
rcurve(picual_model, mean=TRUE, smooth=TRUE)
ev_metrics_picual_model <- getEvaluation(picual_model, stat=c('TSS','Kappa','AUC', 'specificity', 'sensitivity'),opt="max(se+sp)")
mean_ev_metrics_picual_model <- as.data.frame(round(colMeans(x=ev_metrics_picual_model),3))

##### Cordovil #####
#getModelInfo(picual_model)
plot(getVarImp(cordovil_model),'auc')
rcurve(cordovil_model, mean=TRUE, smooth=TRUE)
ev_metrics_cordovil_model <- getEvaluation(cordovil_model, stat=c('TSS','Kappa','AUC', 'specificity', 'sensitivity'),opt="max(se+sp)")
mean_ev_metrics_cordovil_model <- as.data.frame(round(colMeans(x=ev_metrics_cordovil_model),3))

##### Madural #####
#getModelInfo(madural_model)
plot(getVarImp(madural_model),'auc')
rcurve(madural_model, mean=TRUE, smooth=TRUE)
ev_metrics_madural_model <- getEvaluation(madural_model, stat=c('TSS','Kappa','AUC', 'specificity', 'sensitivity'),opt="max(se+sp)")
mean_ev_metrics_madural_model <- as.data.frame(round(colMeans(x=ev_metrics_madural_model),3))

##### Verdeal #####
#getModelInfo(verdeal_model)
plot(getVarImp(verdeal_model),'auc')
rcurve(verdeal_model, mean=TRUE, smooth=TRUE)
ev_metrics_verdeal_model <- getEvaluation(verdeal_model, stat=c('TSS','Kappa','AUC', 'specificity', 'sensitivity'),opt="max(se+sp)")
mean_ev_metrics_verdeal_model <- as.data.frame(round(colMeans(x=ev_metrics_verdeal_model),3))


