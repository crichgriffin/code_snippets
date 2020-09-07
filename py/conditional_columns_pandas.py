
# pandas new column conditional on columns

demux_out['best_single_guess'] = np.where(demux_out['demux_type'] == 'singlet', demux_out['assignment'], 'NA')
