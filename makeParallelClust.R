require(snow)
require(foreach)
require(doSNOW)

cores=c(2)

clust = makeCluster(cores)
registerDoSNOW(clust)