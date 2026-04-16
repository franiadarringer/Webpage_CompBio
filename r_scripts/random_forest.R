# april 16th

set.seed(1)

library(ggplot2)
library(psych) 
library(randomForest) 

data(iris)

head(iris)

str(iris)

iris_num <- iris[, 1:4]
iris_species <- iris$Species

round(cor(iris_num), 2)

bart <- cortest.bartlett(cor(iris_num), n = nrow(iris_num))
bart

pca <- prcomp(iris_num, center = TRUE, scale. = TRUE)
summary(pca)

eig <- pca$sdev^2
pve <- eig / sum(eig)

pca_var_table <- data.frame(
  PC = paste0("PC", 1:length(eig)),
  Eigenvalue = round(eig, 3),
  PVE = round(pve, 3),
  CumPVE = round(cumsum(pve), 3)
)
pca_var_table

plot(eig, type = "b", pch = 19,
     xlab = "Principal component",
     ylab = "Eigenvalue",
     main = "Scree plot (iris PCA)")

broken_stick <- function(p) sapply(1:p, function(k) sum(1/(k:p)) / p)
bs <- broken_stick(ncol(iris_num))

retain <- data.frame(
  PC = paste0("PC", 1:length(pve)),
  ObservedPVE = round(pve, 3),
  BrokenStick = round(bs, 3),
  Keep = pve > bs
)
retain

head(pca$x)

pca$rotation

scores <- as.data.frame(pca$x)
scores$Species <- iris_species

plt <- ggplot(scores, aes(PC1, PC2, color = Species)) +
  geom_point(size = 2.6, alpha = 0.85) +
  theme_minimal() +
  labs(title = "PCA on iris", subtitle = "PCA is unsupervised; species used only for coloring")

plt + stat_ellipse()

man <- manova(cbind(PC1, PC2) ~ Species, data = scores)
summary(man, test = "Pillai")

