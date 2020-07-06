"""
Testing best way to save compressed arrays out of python
CRG 2020-06-16
run locally
"""

import numpy as np
import time
import scanpy as sc
import pandas as pd
import h5py

adata = sc.read_h5ad('/Users/crg/Documents/combat/data/scanpy_pipe_test/pbmc3k.h5ad')
scaled_dat = adata.X

# np save txt with gzip
# start = time.time()
# # np.savetxt('/Users/crg/Desktop/pbmc3k_scaled_data.txt.gz', scaled_dat, delimiter='\t')
# end = time.time()
# print(end - start)
# 173 seconds
# size: 369M

# h5 not compressed
# start = time.time()
# hf = h5py.File('/Users/crg/Desktop/pbmc3k_scaled_data.h5', 'w')
# hf.create_dataset('scaled_counts', data=scaled_dat)
# hf.close()
# end = time.time()
# print(end - start)
# 0.06 secs
# size: 139M

# h5 compressed
# start = time.time()
# hf = h5py.File('/Users/crg/Desktop/pbmc3k_scaled_data.h5.gz', 'w')
# hf.create_dataset('scaled_counts', data=scaled_dat, compression="gzip")
# hf.close()
# end = time.time()
# print(end - start)
# 0.8 secs
# size: 19M
hf = h5py.File('/Users/crg/Desktop/pbmc3k_scaled_data2.h5.gz', 'w')
hf.create_dataset('scaled_counts', data=scaled_dat, compression="gzip")
hf.create_dataset('barcodes', data=np.array(adata.obs_names), compression="gzip")
hf.create_dataset('features', data=np.array(adata.var_names), compression="gzip")
hf.close()





# how to read into python
start = time.time()
hf2 = h5py.File('/Users/crg/Desktop/pbmc3k_scaled_data2.h5.gz', 'r')
hf2.keys()
scaled_dat2 = hf2.get('scaled_counts')
end = time.time()
print(end - start)
## quick test on a much bigger array
# df = np.random.random(size = (10000,200000))
# start = time.time()
# hf = h5py.File('/Users/crg/Desktop/data2.h5', 'w')
# hf.create_dataset('df', data=df)
# hf.close()
# end = time.time()
# print(end - start)
# 5 secs