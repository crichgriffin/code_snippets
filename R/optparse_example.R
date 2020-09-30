library(optparse)
option_list <- list(
    make_option(c("--anndata"), default="../../data/scanpy_pipe_test/pbmc3k.h5ad",
                help=""),
    make_option(c("--scanpy_layer"), default="X",
                help="")
)

opt <- parse_args(OptionParser(option_list=option_list))

