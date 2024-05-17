################################################################################
#                         MODEL PROJECTION - PRESENT
################################################################################

#FMestre
#28-04-2024

#Load packages
library(sdm)
library(terra)

#A model performs accurately at a certain detection threshold if it scores a 
#TSS higher than 0.5 (Allouche et al. 2006; Liu et al. 2011).

##### GALEGA #####

ensemble_galega_model <- sdm::ensemble(
                               galega_model,
                               newdata = env_vars_2,
                               filename='galega_current_17_05_24.tif',
                               setting=list(
                                        method='weighted',
                                        stat='TSS',
                                        power=2,
                                        expr = 'tss > 0.5'
                                        ),
                               overwrites=TRUE
                               )

#Metrics
metrics_galega <- evaluates(galega_sdm_data, ensemble_galega_model)
metrics_galega@statistics$AUC

