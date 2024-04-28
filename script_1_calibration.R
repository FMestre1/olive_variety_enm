################################################################################
#                         LOAD ENVIRONMENTAL LAYERS
################################################################################

#FMestre
#28-04-2024

#1. Build Models
var1 <- sdm::sdm(occ~.,data=data_olive_D,methods=c('cart','rf','fda','glm','gam','mars','svm','brt'),replication='sub',test.percent=30,n=10)
#

# 2.Model metrics and variable importance
#
#getModelInfo(M_olive_D)
plot(getVarImp(xxx),'auc')
rcurve(xxx, mean=TRUE, smooth=TRUE)
ev_metrics_xxx <- getEvaluation(var1,stat=c('TSS','Kappa','AUC', 'specificity', 'sensitivity'),opt="max(se+sp)")
mean_ev_metrics_xxx <- as.data.frame(round(colMeans(x=ev_metrics_xxx),3))
#

