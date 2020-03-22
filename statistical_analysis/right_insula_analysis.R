## transform extracted data to Hedges'g and perform meta-analysis
# ---------------------------------------------------------------

rm(list=ls())
library(readr) # reads csv files
library(esc)   # computes effect sizes
library(meta)  # meta-analysis package
library(dplyr) # manipulates data frame

# set working directory
setwd("D:/meta_meditation/statistical_analysis")

# load extracted data
data <- read_csv("right_insula_extracted.csv")
View(data)

# transform stat values to g
# ---------------------------
TE <- c()
SE <- c()

# t-tests 
for (row in 1:6){
  tval = as.numeric(data[row,6])
  out = esc_t(t=tval, grp1n=data[row,2], grp2n=data[row,3], es.type="g")
  TE  <- append(TE,unlist(out[1]))
  SE  <- append(SE,unlist(out[2]))
}

# regression
out = esc_B(b=0.116,sdy=6.08,grp1n = 19,grp2n = 19,es.type = "g")
TE  <- append(TE,unlist(out[1]))
SE  <- append(SE,unlist(out[2]))  

names(TE) <- NULL
names(SE) <- NULL

# make new dataframe and export
Author <- data[1:nrow(data),1]
results  <- data.frame(Author, TE, SE)
write.csv(results,'right_insula_sizes.csv')

# meta-analysis
m.hksj <- metagen(TE,
                  SE,
                  data = results,
                  studlab = paste(Author),
                  comb.fixed = FALSE,
                  comb.random = TRUE,
                  method.tau = "ML",
                  hakn = TRUE,
                  prediction = TRUE,
                  sm = "SMD")
print(m.hksj)

# make a forest plot with all data
forest(m.hksj, layout = "RevMan5", digits.sd = 2)

