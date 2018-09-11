## install packages as needed:
# install.packages('rvest')
# install.packages('stringr')
# install.packages('tidyr')

## import packages
library('rvest')
library('stringr')
library('tidyr')


## get the data
draft17_url <- 'https://www.pro-football-reference.com/years/2017/draft.htm'
draft17_webpage <- read_html(draft17_url)
draft17_table <- html_nodes(draft17_webpage, 'table')
draft17 <- html_table(draft17_table)[[1]]

## tidy the data
## first, drop the unwanted last column
draft17 <- draft17[,(1:28)]
## next rename the columns
colnames(draft17) <- c("Rnd", "Pick", "Tm", "Player", "Pos", "Age", "To",
                       "AP1", "PB", "St", "CarAV", "DrAV", "G",
                       "PassCmp", "PassAtt", "PassYds", "PassTD", "PassInt",
                       "RushAtt", "RushYds", "RushTD", 
                       "RecRec", "RecYds", "RecTD", 
                       "Tkl", "Int", "Sk",
                       "College")

## now drop the rows with the html headers we don't need; ignore the Warning message
draft17 <- draft17[!is.na(as.numeric(as.character(draft17$Rnd))),]  

## we can do the same thing to mine data from 1936 to 2018
## how do I write a function to iterate the first half, then cbind all the data.frames into one large one, then be good?


