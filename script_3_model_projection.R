################################################################################
#                               MODEL PROJECTION
################################################################################

#FMestre
#28-04-2024


#1. Build current ensemble
ensemble_Var1 <- sdm::ensemble(M_olive_D,newdata=high_res_preds,filename='xxx_current.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 


#Metrics
metrics_olive_D <- evaluates(data_olive_D, ensemble_olive_D)
metrics_olive_D@statistics$AUC

