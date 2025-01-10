################################################################################
#                               RESPONSE CURVES
################################################################################

#FMestre
#10-01-2025

#Load packages
library(terra)
library(ggplot2)

# 1.Load Variables
vars <- read.csv("variables_10x10.csv")
View(vars)

# 2.Load suitability
suit <- terra::vect("olive_variety_suitability_version_09Jan25\\olive_variety_suitability_version_09Jan25.shp")
suit <- as.data.frame(suit)
names(suit)[9:16] <- c("results_galega",
                      "results_cobrancosa",
                      "results_arbequina",
                      "results_picual",
                      "results_cordovilTM",
                      "results_cordovilSE",
                      "results_madural",
                      "results_verdeal"
                      )
View(suit)

# 3.Merge both
names(vars)
names(suit)
vars_suit <- cbind(vars[,18:28], suit[,9:16])
View(vars_suit)
write.csv(vars_suit, "vars_suit_10jan25.csv")

# 4.Plot response curves
names(vars_suit)

# 4.1. galega
plot_galega_bio2 <- ggplot(vars_suit, aes(x = bio2, y = results_galega)) +
  geom_smooth() + 
  labs(
    x = "bio2", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_galega_bio3 <- ggplot(vars_suit, aes(x = bio3, y = results_galega)) +
  geom_smooth() + 
  labs(
    x = "bio3", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_galega_bio13 <- ggplot(vars_suit, aes(x = bio13, y = results_galega)) +
  geom_smooth() + 
  labs(
    x = "bio13", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_galega_bio15 <- ggplot(vars_suit, aes(x = bio15, y = results_galega)) +
  geom_smooth() + 
  labs(
    x = "bio15", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_galega_nffd <- ggplot(vars_suit, aes(x = nffd_wgs84, y = results_galega)) +
  geom_smooth() + 
  labs(
    x = "NFFD", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_galega_eref <- ggplot(vars_suit, aes(x = eref_wgs84, y = results_galega)) +
  geom_smooth() + 
  labs(
    x = "EREF", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_galega_ocd <- ggplot(vars_suit, aes(x = OCD, y = results_galega)) +
  geom_smooth() + 
  labs(
    x = "OCD", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_galega_ph <- ggplot(vars_suit, aes(x = pH, y = results_galega)) +
  geom_smooth() + 
  labs(
    x = "pH", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_galega_sand <- ggplot(vars_suit, aes(x = Sand, y = results_galega)) +
  geom_smooth() + 
  labs(
    x = "Sand", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_galega_tri <- ggplot(vars_suit, aes(x = TRI, y = results_galega)) +
  geom_smooth() + 
  labs(
    x = "TRI", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_galega_twi <- ggplot(vars_suit, aes(x = TWI, y = results_galega)) +
  geom_smooth() + 
  labs(
    x = "TWI", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
               
#Plot all
plot_galega_list <- list(
plot_galega_bio2,
plot_galega_bio3,
plot_galega_bio13,
plot_galega_bio15,
plot_galega_nffd,
plot_galega_eref,
plot_galega_ocd,
plot_galega_ph,
plot_galega_sand,
plot_galega_tri,
plot_galega_twi
)

gridExtra::grid.arrange(grobs = plot_galega_list, nrow = 3) 


# 4.2. cobrancosa
plot_cobrancosa_bio2 <- ggplot(vars_suit, aes(x = bio2, y = results_cobrancosa)) +
  geom_smooth() + 
  labs(
    x = "bio2", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cobrancosa_bio3 <- ggplot(vars_suit, aes(x = bio3, y = results_cobrancosa)) +
  geom_smooth() + 
  labs(
    x = "bio3", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cobrancosa_bio13 <- ggplot(vars_suit, aes(x = bio13, y = results_cobrancosa)) +
  geom_smooth() + 
  labs(
    x = "bio13", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cobrancosa_bio15 <- ggplot(vars_suit, aes(x = bio15, y = results_cobrancosa)) +
  geom_smooth() + 
  labs(
    x = "bio15", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cobrancosa_nffd <- ggplot(vars_suit, aes(x = nffd_wgs84, y = results_cobrancosa)) +
  geom_smooth() + 
  labs(
    x = "NFFD", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cobrancosa_eref <- ggplot(vars_suit, aes(x = eref_wgs84, y = results_cobrancosa)) +
  geom_smooth() + 
  labs(
    x = "EREF", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cobrancosa_ocd <- ggplot(vars_suit, aes(x = OCD, y = results_cobrancosa)) +
  geom_smooth() + 
  labs(
    x = "OCD", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cobrancosa_ph <- ggplot(vars_suit, aes(x = pH, y = results_cobrancosa)) +
  geom_smooth() + 
  labs(
    x = "pH", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cobrancosa_sand <- ggplot(vars_suit, aes(x = Sand, y = results_cobrancosa)) +
  geom_smooth() + 
  labs(
    x = "Sand", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cobrancosa_tri <- ggplot(vars_suit, aes(x = TRI, y = results_cobrancosa)) +
  geom_smooth() + 
  labs(
    x = "TRI", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cobrancosa_twi <- ggplot(vars_suit, aes(x = TWI, y = results_cobrancosa)) +
  geom_smooth() + 
  labs(
    x = "TWI", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)

#Plot all
plot_cobrancosa_list <- list(
  plot_cobrancosa_bio2,
  plot_cobrancosa_bio3,
  plot_cobrancosa_bio13,
  plot_cobrancosa_bio15,
  plot_cobrancosa_nffd,
  plot_cobrancosa_eref,
  plot_cobrancosa_ocd,
  plot_cobrancosa_ph,
  plot_cobrancosa_sand,
  plot_cobrancosa_tri,
  plot_cobrancosa_twi
)

gridExtra::grid.arrange(grobs = plot_cobrancosa_list, nrow = 3) 

# 4.3. arbequina
plot_arbequina_bio2 <- ggplot(vars_suit, aes(x = bio2, y = results_arbequina)) +
  geom_smooth() + 
  labs(
    x = "bio2", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_arbequina_bio3 <- ggplot(vars_suit, aes(x = bio3, y = results_arbequina)) +
  geom_smooth() + 
  labs(
    x = "bio3", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_arbequina_bio13 <- ggplot(vars_suit, aes(x = bio13, y = results_arbequina)) +
  geom_smooth() + 
  labs(
    x = "bio13", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_arbequina_bio15 <- ggplot(vars_suit, aes(x = bio15, y = results_arbequina)) +
  geom_smooth() + 
  labs(
    x = "bio15", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_arbequina_nffd <- ggplot(vars_suit, aes(x = nffd_wgs84, y = results_arbequina)) +
  geom_smooth() + 
  labs(
    x = "NFFD", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_arbequina_eref <- ggplot(vars_suit, aes(x = eref_wgs84, y = results_arbequina)) +
  geom_smooth() + 
  labs(
    x = "EREF", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_arbequina_ocd <- ggplot(vars_suit, aes(x = OCD, y = results_arbequina)) +
  geom_smooth() + 
  labs(
    x = "OCD", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_arbequina_ph <- ggplot(vars_suit, aes(x = pH, y = results_arbequina)) +
  geom_smooth() + 
  labs(
    x = "pH", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_arbequina_sand <- ggplot(vars_suit, aes(x = Sand, y = results_arbequina)) +
  geom_smooth() + 
  labs(
    x = "Sand", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_arbequina_tri <- ggplot(vars_suit, aes(x = TRI, y = results_arbequina)) +
  geom_smooth() + 
  labs(
    x = "TRI", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_arbequina_twi <- ggplot(vars_suit, aes(x = TWI, y = results_arbequina)) +
  geom_smooth() + 
  labs(
    x = "TWI", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)

#Plot all
plot_arbequina_list <- list(
  plot_arbequina_bio2,
  plot_arbequina_bio3,
  plot_arbequina_bio13,
  plot_arbequina_bio15,
  plot_arbequina_nffd,
  plot_arbequina_eref,
  plot_arbequina_ocd,
  plot_arbequina_ph,
  plot_arbequina_sand,
  plot_arbequina_tri,
  plot_arbequina_twi
)

gridExtra::grid.arrange(grobs = plot_arbequina_list, nrow = 3) 

# 4.4. picual
plot_picual_bio2 <- ggplot(vars_suit, aes(x = bio2, y = results_picual)) +
  geom_smooth() + 
  labs(
    x = "bio2", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_picual_bio3 <- ggplot(vars_suit, aes(x = bio3, y = results_picual)) +
  geom_smooth() + 
  labs(
    x = "bio3", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_picual_bio13 <- ggplot(vars_suit, aes(x = bio13, y = results_picual)) +
  geom_smooth() + 
  labs(
    x = "bio13", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_picual_bio15 <- ggplot(vars_suit, aes(x = bio15, y = results_picual)) +
  geom_smooth() + 
  labs(
    x = "bio15", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_picual_nffd <- ggplot(vars_suit, aes(x = nffd_wgs84, y = results_picual)) +
  geom_smooth() + 
  labs(
    x = "NFFD", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_picual_eref <- ggplot(vars_suit, aes(x = eref_wgs84, y = results_picual)) +
  geom_smooth() + 
  labs(
    x = "EREF", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_picual_ocd <- ggplot(vars_suit, aes(x = OCD, y = results_picual)) +
  geom_smooth() + 
  labs(
    x = "OCD", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_picual_ph <- ggplot(vars_suit, aes(x = pH, y = results_picual)) +
  geom_smooth() + 
  labs(
    x = "pH", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_picual_sand <- ggplot(vars_suit, aes(x = Sand, y = results_picual)) +
  geom_smooth() + 
  labs(
    x = "Sand", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_picual_tri <- ggplot(vars_suit, aes(x = TRI, y = results_picual)) +
  geom_smooth() + 
  labs(
    x = "TRI", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_picual_twi <- ggplot(vars_suit, aes(x = TWI, y = results_picual)) +
  geom_smooth() + 
  labs(
    x = "TWI", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)

#Plot all
plot_picual_list <- list(
  plot_picual_bio2,
  plot_picual_bio3,
  plot_picual_bio13,
  plot_picual_bio15,
  plot_picual_nffd,
  plot_picual_eref,
  plot_picual_ocd,
  plot_picual_ph,
  plot_picual_sand,
  plot_picual_tri,
  plot_picual_twi
)

gridExtra::grid.arrange(grobs = plot_picual_list, nrow = 3) 

# 4.5. cordovilTM
plot_cordovilTM_bio2 <- ggplot(vars_suit, aes(x = bio2, y = results_cordovilTM)) +
  geom_smooth() + 
  labs(
    x = "bio2", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cordovilTM_bio3 <- ggplot(vars_suit, aes(x = bio3, y = results_cordovilTM)) +
  geom_smooth() + 
  labs(
    x = "bio3", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cordovilTM_bio13 <- ggplot(vars_suit, aes(x = bio13, y = results_cordovilTM)) +
  geom_smooth() + 
  labs(
    x = "bio13", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cordovilTM_bio15 <- ggplot(vars_suit, aes(x = bio15, y = results_cordovilTM)) +
  geom_smooth() + 
  labs(
    x = "bio15", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cordovilTM_nffd <- ggplot(vars_suit, aes(x = nffd_wgs84, y = results_cordovilTM)) +
  geom_smooth() + 
  labs(
    x = "NFFD", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cordovilTM_eref <- ggplot(vars_suit, aes(x = eref_wgs84, y = results_cordovilTM)) +
  geom_smooth() + 
  labs(
    x = "EREF", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cordovilTM_ocd <- ggplot(vars_suit, aes(x = OCD, y = results_cordovilTM)) +
  geom_smooth() + 
  labs(
    x = "OCD", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cordovilTM_ph <- ggplot(vars_suit, aes(x = pH, y = results_cordovilTM)) +
  geom_smooth() + 
  labs(
    x = "pH", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cordovilTM_sand <- ggplot(vars_suit, aes(x = Sand, y = results_cordovilTM)) +
  geom_smooth() + 
  labs(
    x = "Sand", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cordovilTM_tri <- ggplot(vars_suit, aes(x = TRI, y = results_cordovilTM)) +
  geom_smooth() + 
  labs(
    x = "TRI", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cordovilTM_twi <- ggplot(vars_suit, aes(x = TWI, y = results_cordovilTM)) +
  geom_smooth() + 
  labs(
    x = "TWI", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)

#Plot all
plot_cordovilTM_list <- list(
  plot_cordovilTM_bio2,
  plot_cordovilTM_bio3,
  plot_cordovilTM_bio13,
  plot_cordovilTM_bio15,
  plot_cordovilTM_nffd,
  plot_cordovilTM_eref,
  plot_cordovilTM_ocd,
  plot_cordovilTM_ph,
  plot_cordovilTM_sand,
  plot_cordovilTM_tri,
  plot_cordovilTM_twi
)

gridExtra::grid.arrange(grobs = plot_cordovilTM_list, nrow = 3) 

# 4.6. cordovilSE
plot_cordovilSE_bio2 <- ggplot(vars_suit, aes(x = bio2, y = results_cordovilSE)) +
  geom_smooth() + 
  labs(
    x = "bio2", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cordovilSE_bio3 <- ggplot(vars_suit, aes(x = bio3, y = results_cordovilSE)) +
  geom_smooth() + 
  labs(
    x = "bio3", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cordovilSE_bio13 <- ggplot(vars_suit, aes(x = bio13, y = results_cordovilSE)) +
  geom_smooth() + 
  labs(
    x = "bio13", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cordovilSE_bio15 <- ggplot(vars_suit, aes(x = bio15, y = results_cordovilSE)) +
  geom_smooth() + 
  labs(
    x = "bio15", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cordovilSE_nffd <- ggplot(vars_suit, aes(x = nffd_wgs84, y = results_cordovilSE)) +
  geom_smooth() + 
  labs(
    x = "NFFD", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cordovilSE_eref <- ggplot(vars_suit, aes(x = eref_wgs84, y = results_cordovilSE)) +
  geom_smooth() + 
  labs(
    x = "EREF", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cordovilSE_ocd <- ggplot(vars_suit, aes(x = OCD, y = results_cordovilSE)) +
  geom_smooth() + 
  labs(
    x = "OCD", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cordovilSE_ph <- ggplot(vars_suit, aes(x = pH, y = results_cordovilSE)) +
  geom_smooth() + 
  labs(
    x = "pH", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cordovilSE_sand <- ggplot(vars_suit, aes(x = Sand, y = results_cordovilSE)) +
  geom_smooth() + 
  labs(
    x = "Sand", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cordovilSE_tri <- ggplot(vars_suit, aes(x = TRI, y = results_cordovilSE)) +
  geom_smooth() + 
  labs(
    x = "TRI", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_cordovilSE_twi <- ggplot(vars_suit, aes(x = TWI, y = results_cordovilSE)) +
  geom_smooth() + 
  labs(
    x = "TWI", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)

#Plot all
plot_cordovilSE_list <- list(
  plot_cordovilSE_bio2,
  plot_cordovilSE_bio3,
  plot_cordovilSE_bio13,
  plot_cordovilSE_bio15,
  plot_cordovilSE_nffd,
  plot_cordovilSE_eref,
  plot_cordovilSE_ocd,
  plot_cordovilSE_ph,
  plot_cordovilSE_sand,
  plot_cordovilSE_tri,
  plot_cordovilSE_twi
)

gridExtra::grid.arrange(grobs = plot_cordovilSE_list, nrow = 3) 

# 4.7. madural
plot_madural_bio2 <- ggplot(vars_suit, aes(x = bio2, y = results_madural)) +
  geom_smooth() + 
  labs(
    x = "bio2", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_madural_bio3 <- ggplot(vars_suit, aes(x = bio3, y = results_madural)) +
  geom_smooth() + 
  labs(
    x = "bio3", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_madural_bio13 <- ggplot(vars_suit, aes(x = bio13, y = results_madural)) +
  geom_smooth() + 
  labs(
    x = "bio13", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_madural_bio15 <- ggplot(vars_suit, aes(x = bio15, y = results_madural)) +
  geom_smooth() + 
  labs(
    x = "bio15", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_madural_nffd <- ggplot(vars_suit, aes(x = nffd_wgs84, y = results_madural)) +
  geom_smooth() + 
  labs(
    x = "NFFD", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_madural_eref <- ggplot(vars_suit, aes(x = eref_wgs84, y = results_madural)) +
  geom_smooth() + 
  labs(
    x = "EREF", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_madural_ocd <- ggplot(vars_suit, aes(x = OCD, y = results_madural)) +
  geom_smooth() + 
  labs(
    x = "OCD", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_madural_ph <- ggplot(vars_suit, aes(x = pH, y = results_madural)) +
  geom_smooth() + 
  labs(
    x = "pH", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_madural_sand <- ggplot(vars_suit, aes(x = Sand, y = results_madural)) +
  geom_smooth() + 
  labs(
    x = "Sand", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_madural_tri <- ggplot(vars_suit, aes(x = TRI, y = results_madural)) +
  geom_smooth() + 
  labs(
    x = "TRI", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_madural_twi <- ggplot(vars_suit, aes(x = TWI, y = results_madural)) +
  geom_smooth() + 
  labs(
    x = "TWI", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)

#Plot all
plot_madural_list <- list(
  plot_madural_bio2,
  plot_madural_bio3,
  plot_madural_bio13,
  plot_madural_bio15,
  plot_madural_nffd,
  plot_madural_eref,
  plot_madural_ocd,
  plot_madural_ph,
  plot_madural_sand,
  plot_madural_tri,
  plot_madural_twi
)

gridExtra::grid.arrange(grobs = plot_madural_list, nrow = 3) 

# 4.8. verdeal
plot_verdeal_bio2 <- ggplot(vars_suit, aes(x = bio2, y = results_verdeal)) +
  geom_smooth() + 
  labs(
    x = "bio2", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_verdeal_bio3 <- ggplot(vars_suit, aes(x = bio3, y = results_verdeal)) +
  geom_smooth() + 
  labs(
    x = "bio3", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_verdeal_bio13 <- ggplot(vars_suit, aes(x = bio13, y = results_verdeal)) +
  geom_smooth() + 
  labs(
    x = "bio13", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_verdeal_bio15 <- ggplot(vars_suit, aes(x = bio15, y = results_verdeal)) +
  geom_smooth() + 
  labs(
    x = "bio15", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_verdeal_nffd <- ggplot(vars_suit, aes(x = nffd_wgs84, y = results_verdeal)) +
  geom_smooth() + 
  labs(
    x = "NFFD", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_verdeal_eref <- ggplot(vars_suit, aes(x = eref_wgs84, y = results_verdeal)) +
  geom_smooth() + 
  labs(
    x = "EREF", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_verdeal_ocd <- ggplot(vars_suit, aes(x = OCD, y = results_verdeal)) +
  geom_smooth() + 
  labs(
    x = "OCD", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_verdeal_ph <- ggplot(vars_suit, aes(x = pH, y = results_verdeal)) +
  geom_smooth() + 
  labs(
    x = "pH", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_verdeal_sand <- ggplot(vars_suit, aes(x = Sand, y = results_verdeal)) +
  geom_smooth() + 
  labs(
    x = "Sand", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_verdeal_tri <- ggplot(vars_suit, aes(x = TRI, y = results_verdeal)) +
  geom_smooth() + 
  labs(
    x = "TRI", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)
#
plot_verdeal_twi <- ggplot(vars_suit, aes(x = TWI, y = results_verdeal)) +
  geom_smooth() + 
  labs(
    x = "TWI", 
    y = "suitability" 
  ) +
  theme_classic() +
  ylim(0, 1)

#Plot all
plot_verdeal_list <- list(
  plot_verdeal_bio2,
  plot_verdeal_bio3,
  plot_verdeal_bio13,
  plot_verdeal_bio15,
  plot_verdeal_nffd,
  plot_verdeal_eref,
  plot_verdeal_ocd,
  plot_verdeal_ph,
  plot_verdeal_sand,
  plot_verdeal_tri,
  plot_verdeal_twi
)

gridExtra::grid.arrange(grobs = plot_verdeal_list, nrow = 3) 


