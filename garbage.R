# 12. Which is the selected var per square grid- RESTRICTING TO CELLS WHERE THE SPECIES IS ABOVE ITS SUITABILITY THRESHOLD TODAY

percent_increase_verdeal_2 <- terra::vect("olive_variety_suitability_version_09Jan25/olive_variety_suitability_version_09Jan25.shp")
percent_increase_verdeal_2 <- percent_increase_verdeal_2[,1:8]
#
percent_increase_verdeal_2$percent_increase_verdeal_2_CC <- ifelse((ensemble_verdeal_2050_CC$ensemble_weighted - present$results_verdeal)>0, ensemble_verdeal_2050_CC$ensemble_weighted - present$results_verdeal, 0)*100/present$results_verdeal
percent_increase_verdeal_2$percent_increase_verdeal_2_CN <- ifelse((ensemble_verdeal_2050_CN$ensemble_weighted - present$results_verdeal)>0, ensemble_verdeal_2050_CN$ensemble_weighted - present$results_verdeal, 0)*100/present$results_verdeal
percent_increase_verdeal_2$percent_increase_verdeal_2_GF <- ifelse((ensemble_verdeal_2050_GF$ensemble_weighted - present$results_verdeal)>0, ensemble_verdeal_2050_GF$ensemble_weighted - present$results_verdeal, 0)*100/present$results_verdeal
percent_increase_verdeal_2$percent_increase_verdeal_2_HAD <- ifelse((ensemble_verdeal_2050_HAD$ensemble_weighted - present$results_verdeal)>0, ensemble_verdeal_2050_HAD$ensemble_weighted - present$results_verdeal, 0)*100/present$results_verdeal
percent_increase_verdeal_2$percent_increase_verdeal_2_IN <- ifelse((ensemble_verdeal_2050_IN$ensemble_weighted - present$results_verdeal)>0, ensemble_verdeal_2050_IN$ensemble_weighted - present$results_verdeal, 0)*100/present$results_verdeal
percent_increase_verdeal_2$percent_increase_verdeal_2_IP <- ifelse((ensemble_verdeal_2050_IP$ensemble_weighted - present$results_verdeal)>0, ensemble_verdeal_2050_IP$ensemble_weighted - present$results_verdeal, 0)*100/present$results_verdeal
percent_increase_verdeal_2$percent_increase_verdeal_2_MPI <- ifelse((ensemble_verdeal_2050_MPI$ensemble_weighted - present$results_verdeal)>0, ensemble_verdeal_2050_MPI$ensemble_weighted - present$results_verdeal, 0)*100/present$results_verdeal
#
percent_increase_verdeal_2$percent_increase_verdeal_2_MEAN <- rowMeans(data.frame(percent_increase_verdeal_2[,9:15]))

# 13. Which is the selected var per square grid

selected_var_2 <- terra::vect("olive_variety_suitability_version_09Jan25/olive_variety_suitability_version_09Jan25.shp")
selected_var_2 <- selected_var_2[,1:8]
#
selected_var_2$galega_increase <- percent_increase_galega_2$percent_increase_galega_2_MEAN
selected_var_2$cobrancosa_increase <- percent_increase_cobrancosa_2$percent_increase_cobrancosa_2_MEAN
selected_var_2$cordovilSE_increase <- percent_increase_cordovilSE_2$percent_increase_cordovilSE_2_MEAN
selected_var_2$cordovilTM_increase <- percent_increase_cordovilTM_2$percent_increase_cordovilTM_2_MEAN
selected_var_2$arbequina_increase <- percent_increase_arbequina_2$percent_increase_arbequina_2_MEAN
selected_var_2$madural_increase <- percent_increase_madural_2$percent_increase_madural_2_MEAN
selected_var_2$picual_increase <- percent_increase_picual_2$percent_increase_picual_2_MEAN
selected_var_2$verdeal_increase <- percent_increase_verdeal_2$percent_increase_verdeal_2_MEAN
#View(data.frame(selected_var_2))

selected_var_22 <- c()

for(i in 1:nrow(selected_var_2)){
  
  max_suit <- max(data.frame(selected_var_2[i,9:16]))
  
  if(max_suit!=0){
    
    selected_var_22[i] <- names(selected_var_2[i,9:16])[which(max_suit == data.frame(selected_var_2[i,9:16]))]
    
  }else selected_var_22[i] <- NA
  
}

selected_var_22 <- gsub("_increase", "", selected_var_22)

selected_var_2$selected_var_2 <- selected_var_22

#Plot
plot(selected_var_2, "selected_var_2")

