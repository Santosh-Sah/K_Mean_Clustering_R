source("KMeanClusteringUtils.R")
library(ggplot2)
library(cluster)

#reading dataset 
kMeanClusteringDataset = importKMeanClusteringDataset("K_Mean_Clustering_Mall_Customers.csv")


#reading KMeanClustering model
kMeanClusteringModel = readRDS("KMeanClusteringModel.RDS")

#Using the elbow method to find the optimal number of clusters
kMeanClusteringElbowMethod <- function(kMeanClusteringDataset){
  
  set.seed(1234)
  
  wcss = vector()
  for(i in 1:10) wcss[i] = sum(kmeans(kMeanClusteringDataset, i)$withinss)
  
  png("KMeanClusteringElbowMethod.png")
  plot(1:10,
       wcss,
       type = "b",
       main = paste("The elbow method"),
       xlab = "Number of clusters",
       ylab = "WCSS")
  
  dev.off()
  
}

#visualizing cluster
kMeanClusteringClusters <- function(kMeanClusteringDataset, kMeanClusteringModel){
  
  y_kmeans = kMeanClusteringModel$cluster
  
  png("KMeanClusteringClusters.png")
  
  clusplot(kMeanClusteringDataset,
           y_kmeans,
           lines = 0,
           shade = TRUE,
           color = TRUE,
           labels = 2,
           plotchar = FALSE,
           span = TRUE,
           main = paste('Clusters of customers'),
           xlab = 'Annual Income',
           ylab = 'Spending Score')
  
  dev.off()
  
}

#kMeanClusteringElbowMethod(kMeanClusteringDataset)
kMeanClusteringClusters(kMeanClusteringDataset, kMeanClusteringModel)
