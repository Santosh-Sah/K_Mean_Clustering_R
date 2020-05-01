importKMeanClusteringDataset <- function(kMeanClusteringDatasetFileName) {
  
  #importing dataset
  kMeanClusteringDataset = read.csv(kMeanClusteringDatasetFileName)
  
  #getting the required columns
  kMeanClusteringDataset = kMeanClusteringDataset[4:5]
  
  return (kMeanClusteringDataset)
  
}

#Save KMeanClustering Model
saveKMeanClusteringModel <- function(kMeanClusteringModel) {
  
  saveRDS(kMeanClusteringModel, file = "KMeanClusteringModel.RDS")
}

#predict new
KMeanClusteringPredictNewClusters <- function(newDataSet, centers) {
  # compute squared euclidean distance from each sample to each cluster center
  tmp <- sapply(seq_len(nrow(newDataSet)),
                function(i) apply(centers, 1,
                                  function(v) sum((newDataSet[i, ]-v)^2)))
  max.col(-t(tmp))  # find index of min distance
}
