
#FMestre
#20-06-2024

library(terra)

antigo <- data.frame(terra::vect("antigo\\antigo.shp"))

recente <- data.frame(terra::vect("recente\\recente.shp"))

antigo[is.na(antigo)] <- 0
recente[is.na(recente)] <- 0

antigo_df <- data.frame(colSums(antigo[,-c(1:2)]))
recente_df <- data.frame(colSums(recente[,-c(1:2)]))

colnames(antigo_df) <- "antigo"
colnames(recente_df) <- "recente"

rownames(antigo_df)
rownames(recente_df)

antigo_df[order(antigo_df$antigo, decreasing = TRUE),]
recente_df[order(recente_df$recente, decreasing = TRUE),]

View(antigo_df)
View(recente_df)

#Check a particular olive variety
recente_df[which(rownames(recente_df)=="VerdealTM"),]
antigo_df[which(rownames(antigo_df)=="VerdealTM"),]
