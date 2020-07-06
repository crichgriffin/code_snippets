# if (!requireNamespace("BiocManager", quietly = TRUE))
# 	install.packages("BiocManager")
# BiocManager::install(version = "3.11")

# BiocManager::install("hd5r")
# library("hd5r")
BiocManager::install("rhdf5")
library("rhdf5")

# read in to R
h5f = H5Fopen("~/Desktop/pbmc3k_scaled_data.h5")
scaled_dat = h5f$scaled_counts


# save out
h5writeDataset.matrix(scaled_dat, file="~/Desktop/pbmc3k_scaled_data2.h5",
				name="scaled_dat")
