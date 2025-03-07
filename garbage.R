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

####################################################################################



# Function to calculate suitability gains for a combination of varieties
calculate_gains <- function(combination, results_list) {
  gains <- rowSums(do.call(cbind, results_list[combination]))
  return(gains)
}

# Function to calculate proportion of gains
calculate_proportion <- function(gains, total_gains) {
  proportion <- gains / total_gains
  return(proportion)
}

# Function to get all combinations
get_combinations <- function(n, varieties) {
  combs <- combn(varieties, n, simplify = FALSE)
  return(combs)
}

varieties <- 1:8  # Represents the 8 olive varieties



suitability_gains <- list()

# Loop through the number of varieties (1 to 8)
for (n_varieties in 1:8) {
  
  # Get all combinations of n_varieties
  combinations <- get_combinations(n_varieties, varieties)
  
  results_list <- list(
    percent_increase_arbequina$percent_increase_arbequina_MEAN,
    percent_increase_cobrancosa$percent_increase_cobrancosa_MEAN,
    percent_increase_cordovilSE$percent_increase_cordovilSE_MEAN,
    percent_increase_cordovilTM$percent_increase_cordovilTM_MEAN,
    percent_increase_galega$percent_increase_galega_MEAN,
    percent_increase_madural$percent_increase_madural_MEAN,
    percent_increase_picual$percent_increase_picual_MEAN,
    percent_increase_verdeal$percent_increase_verdeal_MEAN
  )
  
  
  
  # Initialize a list to store gains for each combination
  combination_gains <- list()
  
  # Loop through each combination
  for (comb in combinations) {
    
    # Calculate gains for the current combination
    gains <- calculate_gains(comb, results_list)
    
    # Calculate proportion of gains
    proportion <- calculate_proportion(gains, total_gains)
    
    # Store the proportion of gains for this combination
    combination_gains[[paste(comb, collapse = ",")]] <- proportion
  }
  
  # Store the results for this number of varieties
  suitability_gains[[as.character(n_varieties)]] <- combination_gains
}



################################################################################
#         FIGURE RELATING VAR PRESENT AND % SUITABLE GRIDS IN FUTURE 
################################################################################

df_galega <- data.frame(rep("galega", length(ensemble_galega$ensemble_weighted)),
                        rownames(ensemble_galega),
                        ensemble_galega$ensemble_weighted,
                        galega_2050)

names(df_galega) <- c("variety", "grid_id", "present_suitability", "future_suitability")

df_cobrancosa <- data.frame(rep("cobrancosa", length(ensemble_cobrancosa$ensemble_weighted)),
                            rownames(ensemble_cobrancosa),
                            ensemble_cobrancosa$ensemble_weighted,
                            cobrancosa_2050)

names(df_cobrancosa) <- c("variety", "grid_id", "present_suitability", "future_suitability")

df_cordovilTM <- data.frame(rep("cordovilTM", length(ensemble_cordovilTM$ensemble_weighted)),
                            rownames(ensemble_cordovilTM),
                            ensemble_cordovilTM$ensemble_weighted,
                            cordovilTM_2050)

names(df_cordovilTM) <- c("variety", "grid_id", "present_suitability", "future_suitability")

df_cordovilSE <- data.frame(rep("cordovilSE", length(ensemble_cordovilSE$ensemble_weighted)),
                            rownames(ensemble_cordovilSE),
                            ensemble_cordovilSE$ensemble_weighted,
                            cordovilSE_2050)

names(df_cordovilSE) <- c("variety", "grid_id", "present_suitability", "future_suitability")

df_arbequina <- data.frame(rep("arbequina", length(ensemble_arbequina$ensemble_weighted)),
                           rownames(ensemble_arbequina),
                           ensemble_arbequina$ensemble_weighted,
                           arbequina_2050)

names(df_arbequina) <- c("variety", "grid_id", "present_suitability", "future_suitability")

df_verdeal <- data.frame(rep("verdeal", length(ensemble_verdeal$ensemble_weighted)),
                         rownames(ensemble_verdeal),
                         ensemble_verdeal$ensemble_weighted,
                         verdeal_2050)

names(df_verdeal) <- c("variety", "grid_id", "present_suitability", "future_suitability")

df_madural <- data.frame(rep("madural", length(ensemble_madural$ensemble_weighted)),
                         rownames(ensemble_madural),
                         ensemble_madural$ensemble_weighted,
                         madural_2050)

names(df_madural) <- c("variety", "grid_id", "present_suitability", "future_suitability")

df_picual <- data.frame(rep("picual", length(ensemble_picual$ensemble_weighted)),
                        rownames(ensemble_picual),
                        ensemble_picual$ensemble_weighted,
                        picual_2050)

names(df_picual) <- c("variety", "grid_id", "present_suitability", "future_suitability")

# Combine all in a data frame
data1 <- rbind(df_galega, df_cobrancosa, df_cordovilTM, df_cordovilSE, df_arbequina, df_verdeal, df_madural, df_picual)

