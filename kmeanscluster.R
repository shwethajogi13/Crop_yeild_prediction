cropyeild <- read.csv("C:/Users/lenovo/OneDrive/Desktop/AgrcultureDataset.csv")
cropyeild
cropyeild.features <- cropyeild
cropyeild.features$State_Name <- NULL
cropyeild.features$District_Name <- NULL
cropyeild.features$Season <- NULL
cropyeild.features$Crop <- NULL
cropyeild.features
results <- kmeans(cropyeild.features,4)
results
results$size
results$cluster
table(cropyeild$Season, results$cluster)
plot(cropyeild[c("Area","Production")], col = results$cluster)
plot(cropyeild[c("Area","Production")], col = cropyeild$Season)

#cropyeild.labels
cropyeild.labels <- cropyeild$Season
cropyeild.labels

#cropyeild.features
cropyeild.features

#scale data
cropyeild.features_scale <- scale(cropyeild.features)
cropyeild.features_scale

#distance euclidean distance
cropyeild.features <- dist(cropyeild.features_scale)
cropyeild.features

#claculate how many clusters we need
#elbow plot method is with in sum squres
library(factoextra)
fviz_nbclust(cropyeild.features_scale, kmeans, method ="wss") + labs(subtitle = "Elbow method")

#applying kmeans
km.out <- kmeans(cropyeild.features_scale, centers=4, nstart = 100)
print(km.out)

#visualising the clustering algorithm result
km.cluster <- km.out$cluster
rownames(cropyeild.features_scale) <- cropyeild$Season
cropyeild.features_scale
rownames(cropyeild.features_scale) <- paste(cropyeild$Season, 1:dim(cropyeild)[1], sep = "_")
cropyeild.features_scale

fviz_cluster(list(data=cropyeild.features_scale,cluster = km.cluster))
table(km.cluster, cropyeild$season)


#heirarchial clustering algorithm
hc.out <- hclust(cropyeild.features, method = "complete")
hc.out
#dendogram
plot(hc.out)
rect.hclust(hc.out, k = 4, border = 2:5)
