# To create a directory, first check if it already exists using os.path.exists(directory). Then you can create it using:

import os
if not os.path.exists('my_folder'):
    os.makedirs('my_folder')

# You can also use the python idiom EAFP: Easier to ask for forgiveness than permission. For example,

import os
try:
    os.makedirs('my_folder')
except OSError as e:
    if e.errno != errno.EEXIST:
        raise

