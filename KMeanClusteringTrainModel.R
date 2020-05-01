source("KMeanClusteringUtils.R")

#reading dataset 
kMeanClusteringDataset = importKMeanClusteringDataset("K_Mean_Clustering_Mall_Customers.csv")

set.seed(1234)

# Fitting KMeanClustering to dataset
#With the elbow method we have figured out the total number of cluster is 5
kMeanClustering = kmeans(x = kMeanClusteringDataset, centers = 5)

#saving RandomForestClassification model
saveKMeanClusteringModel(kMeanClustering)
