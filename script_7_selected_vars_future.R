################################################################################
#                       VARIETIES TO SELECT IN THE FUTURE
################################################################################

#FMestre
#12-02-2025

#Load packages
library(terra)

#current_suitability <- terra::vect("")
#future_suitability <- terra::vect("")

# 1. Metrics
metrics_arbequina <- read.csv("last_results_fev_2025\\tabelas_metrics\\metrics_arbequina.csv", sep = ";")
metrics_cobrancosa <- read.csv("last_results_fev_2025\\tabelas_metrics\\metrics_cobrancosa.csv", sep = ";")
metrics_cordovilSE <- read.csv("last_results_fev_2025\\tabelas_metrics\\metrics_cordovilSE.csv", sep = ";")
metrics_cordovilTM <- read.csv("last_results_fev_2025\\tabelas_metrics\\metrics_cordovilTM.csv", sep = ";")
metrics_galega <- read.csv("last_results_fev_2025\\tabelas_metrics\\metrics_galega.csv", sep = ";")
metrics_madural <- read.csv("last_results_fev_2025\\tabelas_metrics\\metrics_madural.csv", sep = ";")
metrics_picual <- read.csv("last_results_fev_2025\\tabelas_metrics\\metrics_picual.csv", sep = ";")
metrics_verdeal <- read.csv("last_results_fev_2025\\tabelas_metrics\\metrics_verdeal.csv", sep = ";")

# 2. Threshold
t_arbequina <- metrics_arbequina[metrics_arbequina$criteria=="threshold",]$threshold
t_cobrancosa <- metrics_cobrancosa[metrics_cobrancosa$criteria=="threshold",]$threshold  
t_cordovilSE <- metrics_cordovilSE[metrics_cordovilSE$criteria=="threshold",]$threshold  
t_cordovilTM <- metrics_cordovilTM[metrics_cordovilTM$criteria=="threshold",]$threshold  
t_galega <- metrics_galega[metrics_galega$criteria=="threshold",]$threshold  
t_madural <- metrics_madural[metrics_madural$criteria=="threshold",]$threshold  
t_picual <- metrics_picual[metrics_picual$criteria=="threshold",]$threshold  
t_verdeal <- metrics_verdeal[metrics_verdeal$criteria=="threshold",]$threshold  

# 3. Load present projections
load("last_results_fev_2025/present/arbequina_ensemble.RData")
load("last_results_fev_2025/present/cobrancosa_ensemble.RData")
load("last_results_fev_2025/present/cordovilSE_ensemble.RData")
load("last_results_fev_2025/present/cordovilTM_ensemble.RData")
load("last_results_fev_2025/present/galega_ensemble.RData")
load("last_results_fev_2025/present/madural_ensemble.RData")
load("last_results_fev_2025/present/picual_ensemble.RData")
load("last_results_fev_2025/present/verdeal_ensemble.RData")

# 4. Create current projections shapefile
present <- terra::vect("olive_variety_suitability_version_09Jan25/olive_variety_suitability_version_09Jan25.shp")
present <- present[,1:8]
#
present$results_galega <- ensemble_galega
present$results_cobrancosa <- ensemble_cobrancosa
present$results_arbequina <- ensemble_arbequina
present$results_picual <- ensemble_picual
present$results_cordovilTM <- ensemble_cordovilTM
present$results_cordovilSE <- ensemble_cordovilSE
present$results_madural <- ensemble_madural
present$results_verdeal <- ensemble_verdeal

# 5. Which varieties are present?
present$results_galega_01 <- ifelse(present$results_galega >= t_galega, 1, 0)
present$results_cobrancosa_01 <- ifelse(present$results_cobrancosa >= t_cobrancosa, 1, 0)
present$results_arbequina_01 <- ifelse(present$results_arbequina >= t_arbequina, 1, 0)
present$results_picual_01 <- ifelse(present$results_picual >= t_picual, 1, 0)
present$results_cordovilTM_01 <- ifelse(present$results_cordovilTM >= t_cordovilTM, 1, 0)
present$results_cordovilSE_01 <- ifelse(present$results_cordovilSE >= t_cordovilSE, 1, 0)
present$results_madural_01 <- ifelse(present$results_madural >= t_madural, 1, 0)
present$results_verdeal_01 <- ifelse(present$results_verdeal >= t_verdeal, 1, 0)
#View(data.frame(present))

# 6. What is the % of suitability increase relative to the threshold
present$results_galega_percent_increase <- ifelse(present$results_galega_01 == 1, (((present$results_galega - t_galega) * 100) / t_galega), 0)
present$results_cobrancosa_percent_increase <- ifelse(present$results_cobrancosa_01 == 1, (((present$results_cobrancosa - t_cobrancosa) * 100) / t_cobrancosa), 0)
present$results_arbequina_percent_increase <- ifelse(present$results_arbequina_01 == 1, (((present$results_arbequina - t_arbequina) * 100) / t_arbequina), 0)
present$results_picual_percent_increase <- ifelse(present$results_picual_01 == 1, (((present$results_picual - t_picual) * 100) / t_picual), 0)
present$results_cordovilTM_percent_increase <- ifelse(present$results_cordovilTM_01 == 1, (((present$results_cordovilTM - t_cordovilTM) * 100) / t_cordovilTM), 0)
present$results_cordovilSE_percent_increase <- ifelse(present$results_cordovilSE_01 == 1, (((present$results_cordovilSE - t_cordovilSE) * 100) / t_cordovilSE), 0)
present$results_madural_percent_increase <- ifelse(present$results_madural_01 == 1, (((present$results_madural - t_madural) * 100) / t_madural), 0)
present$results_verdeal_percent_increase <- ifelse(present$results_verdeal_01 == 1, (((present$results_verdeal - t_verdeal) * 100) / t_verdeal), 0)


#5. Which variety has the greater % increase relative to the treshold
names(present[,25:32])

## ??? PROBLEM!!! - Isto tem que ser com a suitability do futuro!!!!
#Mas deve ser relativo ao treshold, ou relativo ao passado?

# 7. Save the updated shapefile (Optional but recommended)
#terra::writeVector(present, "present_with_percent_increase.shp", overwrite=TRUE)




## Code from Gemini

# Assuming your data is in a data frame called 'suitability_data'
# with columns for x, y, current suitability for each variety, and 
# future suitability for each variety under each GCM.

# Calculate average future suitability for each variety
suitability_data$mean_future_arbequina <- rowMeans(suitability_data[, paste0("future_arbequina_gcm", 1:7)]) # Assuming GCM columns are named this way
# ... repeat for all varieties

# Set a threshold
threshold <- 0.5

# Recommend varieties
suitability_data$recommended_variety <- NA
for (i in 1:nrow(suitability_data)) {
  best_variety <- names(suitability_data)[which.max(suitability_data[i, paste0("mean_future_", names(suitability_data)[grep("_arbequina", names(suitability_data))])])] #Finds the best variety name. Adapt for all.
  if (suitability_data[i, paste0("mean_future_", best_variety)] >= threshold) {
    suitability_data$recommended_variety[i] <- best_variety
  } 
}

# Now 'recommended_variety' column will have the name of the recommended variety 
# or NA if none meet the criteria.



################################################################################
#                       VARIETIES TO SELECT IN THE FUTURE
################################################################################

#FMestre
#12-02-2025

#Load packages
library(terra)

# ... (Your existing code for loading data and calculating present suitability)

# 7. Load future projections (Repeat for each GCM)
# Example for GCM1:
load("last_results_fev_2025/future/arbequina_ensemble_gcm1.RData") # Adjust file paths
load("last_results_fev_2025/future/cobrancosa_ensemble_gcm1.RData")
# ... load all other future projections for GCM1

# 8. Create future projections shapefile (Repeat for each GCM)
future_gcm1 <- terra::vect("olive_variety_suitability_version_09Jan25/olive_variety_suitability_version_09Jan25.shp") # Adjust path if needed
future_gcm1 <- future_gcm1[, 1:8]

future_gcm1$results_galega <- ensemble_galega # Assign future suitability values
future_gcm1$results_cobrancosa <- ensemble_cobrancosa
# ... assign all other future suitability values

# 9. Calculate % increase for future (Repeat for each GCM)
future_gcm1$results_galega_percent_increase <- ifelse(present$results_galega_01 == 1, (((future_gcm1$results_galega - t_galega) * 100) / t_galega), 0)
# ... repeat for all varieties and GCM1

# 10. Find best variety for each cell (Repeat for each GCM)
future_gcm1$best_variety_gcm1 <- NA  # Initialize a new column
for (i in 1:nrow(future_gcm1)) {
  if (any(present[i, paste0("results_", c("galega", "cobrancosa", "arbequina", "picual", "cordovilTM", "cordovilSE", "madural", "verdeal"), "_01")] == 1)) { # Check if any variety is present CURRENTLY
    increases <- future_gcm1[i, paste0("results_", c("galega", "cobrancosa", "arbequina", "picual", "cordovilTM", "cordovilSE", "madural", "verdeal"), "_percent_increase")]
    best_variety_index <- which.max(increases)
    best_variety <- names(increases)[best_variety_index]
    future_gcm1$best_variety_gcm1[i] <- gsub("_percent_increase", "", best_variety) # Store the variety name
  }
}

# Repeat steps 7-10 for all 7 GCMs (future_gcm2, future_gcm3, etc.)

# 11. Combine best varieties across GCMs (Optional - if you want a consensus)
# You might want to create a table summarizing the best variety for each cell under each GCM.
# Then, you could use a voting system (most frequent variety) or another method to 
# determine a final recommended variety.

# Example (simple voting):
best_varieties_all_gcms <- data.frame(
  gcm1 = future_gcm1$best_variety_gcm1,
  # ... add other GCM best variety columns
)

# Calculate the most frequent variety for each cell
future_gcm1$final_recommendation <- apply(best_varieties_all_gcms, 1, function(x) {
  names(sort(table(x), decreasing = TRUE))[1] # Most frequent
})

# 12. Save the results
terra::writeVector(future_gcm1, "future_recommendations.shp", overwrite = TRUE) # Or a different filename




