#plotting scaffold lengths from non-boa reads:

install.packages("ggplot2")
install.packages("scales")
library(ggplot2)
library(scales)

setwd("/Users/instructor/Desktop/boa/SRR1984309_spades_assembly")

#load files
lengths.df <- read.delim("scafData.txt", header = F)
colnames(lengths.df) <- c("scaffold","sequence", "scaf_length")
scafplot <- ggplot(lengths.df, aes(scaffold, scaf_length)) + geom_jitter() +
  theme(axis.text.x=element_blank())

scafplot
