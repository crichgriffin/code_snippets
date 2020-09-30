import pandas as pd

# equiv to group_by(list) and summarise n=n()
def list_counts_from_pandas(df, lst):
    return df[lst].value_counts().to_frame().reset_index().rename({0:'n'}, axis=1)


# make a dictionary from two columns (one to many mapping)
marker_list={k: list(v) for k,v in df.groupby("cluster")["gene"]}
