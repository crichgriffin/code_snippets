
input_object = "something.h5ad"
scanpy_layer = "X"


sc <- reticulate::import("scanpy")
# use scanpy to read in anndata
adata= sc$read_h5ad(input_object)


# convert to SingleCellExperiment

if(scanpy_layer=="X"){
sce <- SingleCellExperiment(
	assays      = list(logcounts = t(adata$X)),
	colData     = adata$obs,
	rowData     = adata$var
	)
}else{
	sce <- SingleCellExperiment(
		assays      = list(logcounts = t(adata$layers[opt$scanpy_layer])),
		colData     = adata$obs,
		rowData     = adata$var
	)
}

# convert to Seurat
# load data
if(scanpy_layer=="X"){
    # exprs = as(adata$X,"matrix")
      exprs <- as(t(adata$X), "CsparseMatrix")
   }else{
      exprs = t(adata$layers[opt$scanpy_layer])
  }
  colnames(exprs) <- adata$obs_names$to_list()
  rownames(exprs) <- adata$var_names$to_list()

  # Create the Seurat object
  s.obj <- CreateSeuratObject(exprs)
  # Set the expression assay
  s.obj <- SetAssayData(s.obj, "data", exprs)
  # Add observation metadata
  s.obj <- AddMetaData(s.obj, adata$obs)


  # Add fetaure metadata
  # s.obj[["RNA"]][["n_cells"]] <- adata$var["n_cells"]
  # Add embedding
  # embedding <- adata$obsm["X_umap"]
  # rownames(embedding) <- adata$obs_names$to_list()
  # colnames(embedding) <- c("umap_1", "umap_2")
  # s.obj[["umap"]] <- CreateDimReducObject(embedding, key = "umap_")
