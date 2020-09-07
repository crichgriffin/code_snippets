library(optparse)
option_list <- list(
    make_option(c("--anndata"), default="../../data/scanpy_pipe_test/pbmc3k.h5ad",
                help=""),
    make_option(c("--scanpy_layer"), default="X",
                help=""),
    make_option(c("--marker_file"), default="../../data/scanpy_pipe_test/markers/pbmc3k_nn30_algleiden_res0.6_markers_list.txt.gz",
                help=""),
    make_option(c("--output_file"), default="../../data/scanpy_pipe_test/heatmap.pdf",
                help="name of txt file for output"),
    make_option(c("--cluster_file"), default="../../data/scanpy_pipe_test/pbmc3k_nn30_algleiden_res0.6_cluster.txt",
                help="An rds object containing the cluster identities"),
    make_option(c("--docomplex"), default=FALSE,
                help="Whether to plot complex heatmap. Default (if FALSE is set) to Seurat Doheatmap.If true, specify subgroups"),
    make_option(c("--subgroup"), default="batch",
                help="comma separated list of factors to group by if doing complex heatmap.")
)

opt <- parse_args(OptionParser(option_list=option_list))

