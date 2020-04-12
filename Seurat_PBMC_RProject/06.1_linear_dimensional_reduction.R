# we perform PCA on the scaled data.
pbmc <- RunPCA(pbmc, features = VariableFeatures(object = pbmc))
# Examine and visualize PCA results a few different ways
print(pbmc[["pca"]], dims = 1:5, nfeatures = 5)

# Seurat provides several useful ways of visualizing both cells and features that define the PCA
VizDimLoadings(pbmc, dims = 1:2, reduction = "pca")
DimPlot(pbmc, reduction = "pca")
DimHeatmap(pbmc, dims = 1, cells = 500, balanced = TRUE)
DimHeatmap(pbmc, dims = 1:15, cells = 500, balanced = TRUE)

# Determine the ‘dimensionality’ of the dataset

# NOTE: This process can take a long time for big datasets, comment out for expediency. More
# approximate techniques such as those implemented in ElbowPlot() can be used to reduce
# computation time
pbmc <- JackStraw(pbmc, num.replicate = 100)
pbmc <- ScoreJackStraw(pbmc, dims = 1:20)
# The JackStrawPlot function provides a visualization tool for comparing the distribution of p-values 
# for each PC with a uniform distribution (dashed line).
JackStrawPlot(pbmc, dims = 1:15)

# An alternative heuristic method generates an ‘Elbow plot’: a ranking of principle components based on
# the percentage of variance explained by each one (ElbowPlot function).
ElbowPlot(pbmc)

# Cluster the cells

# To cluster the cells, we next apply modularity optimization techniques such as the Louvain algorithm (default) or SLM
pbmc <- FindNeighbors(pbmc, dims = 1:10)
pbmc <- FindClusters(pbmc, resolution = 0.5)
# Look at cluster IDs of the first 5 cells
head(Idents(pbmc), 5)