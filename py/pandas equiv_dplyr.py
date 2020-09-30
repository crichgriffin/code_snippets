# Pandas equiv to dplyr
import pandas as pd

# groupby %>% top_n
df = mf.groupby('cluster').apply(lambda x: x.nlargest(3,['scores'])).reset_index(drop=True)
