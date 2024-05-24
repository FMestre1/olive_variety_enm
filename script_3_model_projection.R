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

#env_vars_3 <- raster::stack(env_vars_2)

#?ensemble

##### GALEGA #####
ensemble_galega <- sdm::ensemble(
                               x = galega_model,
                               newdata = variables_10x10,
                               filename = 'galega_current_21_05_24.tif',
                               setting=list(
                                        method = 'weighted',
                                        stat = 'TSS',
                                        power = 2,
                                        expr = 'tss > 0.5'
                                        ),
                               overwrites = FALSE
                               )

#Metrics
metrics_galega <- evaluates(galega_sdm_data, ensemble_galega)


##### COBRANÇOSA #####
ensemble_cobrancosa <- sdm::ensemble(
  x = cobrancosa_model,
  newdata = env_vars_2,
  filename = 'cobrancosa_current_21_05_24.tif',
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  ),
  overwrites = FALSE
)

#Metrics
metrics_cobrancosa <- evaluates(cobrancosa_model, ensemble_cobrancosa)
metrics_cobrancosa@statistics$AUC


##### ARBEQUINA
ensemble_arbequina <- sdm::ensemble(
  x = arbequina_model,
  newdata = env_vars_2,
  filename = 'arbequina_current_21_05_24.tif',
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  ),
  overwrites = FALSE
)

#Metrics
metrics_arbequina <- evaluates(arbequina_model, ensemble_arbequina)
metrics_arbequina@statistics$AUC

##### PICUAL

ensemble_picual <- sdm::ensemble(
  x = picual_model,
  newdata = env_vars_2,
  filename = 'picual_current_21_05_24.tif',
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  ),
  overwrites = FALSE
)

#Metrics
metrics_picual <- evaluates(arbequina_model, ensemble_picual)
metrics_picual@statistics$AUC

##### CORDOVIL
cordovil_model

##### MADURAL
madural_model

##### VERDEAL
verdeal_model

