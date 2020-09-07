library(dplyr)
mtcars %>%
	group_by(am, gear) %>%
	summarise(n = n()) %>%
	mutate(freq = n / sum(n))