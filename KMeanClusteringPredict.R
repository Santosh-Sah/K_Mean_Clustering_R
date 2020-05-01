source("KMeanClusteringUtils.R")
library(cluster)

#reading KMeanClustering model
kMeanClusteringModel = readRDS("KMeanClusteringModel.RDS")

inputValue <- importKMeanClusteringDataset("K_Mean_Clustering_Mall_Customers.csv")
inputValue = inputValue[170,]

#predicting new set
KMeanClusteringPredictNewClusters(inputValue, kMeanClusteringModel[["centers"]])
