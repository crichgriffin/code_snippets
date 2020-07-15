# Snippets to reorder to two columns rowwise

library(dplyr)


# set up test data
df = tibble::tibble(col1=sample(letters, 26), col2=sample(letters,26))


# alphabetical reorder
df[,1:2] <- df %>%
 select(col1, col2) %>%
 rowwise() %>%
 apply(., 1,function(x) x[order(x)]) %>%
 t()



# by factor levels

ref = rev(letters) # an arbritrary factor level in this case reverse alphabet

df[,1:2] <- df %>%
	select(col1, col2) %>%
	rowwise() %>%
	apply(., 1,function(x) x[order(match(x,ref))]) %>%
	t()
