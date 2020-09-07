import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--input',
                    default = '../../data/anndata.h5ad',
                    help = 'path to h5ad-formatted hdf5 file containing AnnData object')
parser.add_argument('--umi_counts', default = 3,
                    help = 'UMI counts to use for gene filtering, genes must have at least umi_counts * min_percent * numberofcells counts to be retained')
parser.add_argument('--min_percent', default = 0.01,
                    help = 'percentage of cells for gene filtering, genes must have at least min_percent * numberofcells counts to be retained')
parser.add_argument('--downsample', action = 'store_true',
                    help = 'include if you want to downsample your expression matrix, False by default')
parser.add_argument('--cell_number', default = 10000,
                    help = "cell number to downsample to, default is 10000, must be used in combination with --downsample")
parser.add_argument('--output', default = "filtered-raw-expression.csv",
                    help = "path to output file")
args = parser.parse_args()
