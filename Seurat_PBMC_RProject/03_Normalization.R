# By default, we employ a global-scaling normalization method “LogNormalize” that normalizes the feature expression measurements for each cell
# by the total expression, multiplies this by a scale factor (10,000 by default), and log-transforms the result.
# Normalized values are stored in pbmc[["RNA"]]@data
pbmc <- NormalizeData(pbmc, normalization.method = "LogNormalize", scale.factor = 10000)
# OR
pbmc <- NormalizeData(pbmc)
