#+++++++++++++++++++++++++
# Function to calculate the mean and the standard deviation
# for each group
#+++++++++++++++++++++++++
# data : a data frame
# varname : the name of a column containing the variable
#to be summariezed
# groupnames : vector of column names to be used as
# grouping variables
data_summary <- function(data, varname, groupnames){
	require(plyr)
	summary_func <- function(x, col){
		c(mean = mean(x[[col]], na.rm=TRUE),
			sd = sd(x[[col]], na.rm=TRUE))
	}
	data_sum<-ddply(data, groupnames, .fun=summary_func,
									varname)
	data_sum <- rename(data_sum, c("mean" = varname))
	return(data_sum)
}

library(ggplot2)
df <- ToothGrowth
df$dose <- as.factor(df$dose)
head(df)

df2 <- data_summary(ToothGrowth, varname="len", 
										groupnames=c("supp", "dose"))
# Convert dose to a factor variable
df2$dose=as.factor(df2$dose)
head(df2)

ggplot(df, aes(x=dose, y=len)) + geom_boxplot()
