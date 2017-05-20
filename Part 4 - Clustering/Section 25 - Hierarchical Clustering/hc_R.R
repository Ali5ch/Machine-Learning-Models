# Hierarchical Clustering 

#importing the mall dataset
dataset = read.csv('Mall.csv')
X = dataset[4:5]

# Using the dendrogram to find the optimal number of cluster
dendrogram = hclust(dist(X, method = 'euclidean'),
                    method = 'ward.D')
plot(dendrogram,
     main = paste('Dendrogram'),
     xlab = 'Customers',
     ylab = 'Euclidean distances')

#Fitting Hierarchical Clustering to the mall dataset 
hc = hclust(dist(X, method = 'euclidean'),
                    method = 'ward.D')
y_hc = cutree(hc, 5)

# Visualising the clussters
library(cluster)
clusplot(X,
         y_hc, 
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Cluster of clients'),
         xlab= "Annual Income",
         ylab = "Spending Score")