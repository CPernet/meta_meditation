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
data <- read_csv("maxima_extracted.csv")
View(data)

# just get total N per groups
sapply(data[1:23,2:3], sum)

# same but only for studies comparing controls to meditators
sapply(data[1:18,2:3], sum)

# transform stat values to g
# ---------------------------
TE <- c()
SE <- c()

# t-tests 
for (row in 1:18){
  tval = as.numeric(data[row,7])
  out = esc_t(t=tval, grp1n=data[row,2], grp2n=data[row,3], es.type="g")
  TE  <- append(TE,unlist(out[1]))
  SE  <- append(SE,unlist(out[2]))
}

# regressions
# Lu et al. use the t-value
out = esc_t(t=as.numeric(data[19,7]), totaln=data[19,3], es.type="g") 
TE  <- append(TE,unlist(out[1]))
SE  <- append(SE,unlist(out[2]))
# Friedel & Murakami use b (slope) and std of the dependent variabe
out = esc_B(b=0.277,sdy=0.807,grp1n = 82,grp2n = 82,es.type = "g")
TE  <- append(TE,unlist(out[1]))
SE  <- append(SE,unlist(out[2]))
out = esc_B(b=0.116,sdy=6.08,grp1n = 19,grp2n = 19,es.type = "g")
TE  <- append(TE,unlist(out[1]))
SE  <- append(SE,unlist(out[2]))  

# Correlations
out     = esc_rpb(r = 0.05, totaln = 50, es.type = "g")
TE      <- append(TE,unlist(out[1]))
SE      <- append(SE,unlist(out[2]))
out     = esc_rpb(r = 0.175, totaln = 155, es.type = "g")
TE      <- append(TE,unlist(out[1]))
SE      <- append(SE,unlist(out[2]))

names(TE) <- NULL
names(SE) <- NULL

# make new dataframe and export
Author <- data[1:nrow(data),1]
results  <- data.frame(Author, TE, SE)
write.csv(results,'maxima_effect_sizes.csv')

# meta-analysis of all maxima
main_analysis <- metagen(TE,
                         SE,
                         data = results,
                         studlab = paste(Author),
                         comb.fixed = FALSE,
                         comb.random = TRUE,
                         method.tau = "ML",
                         hakn = TRUE,
                         prediction = TRUE,
                         sm = "SMD")
print(main_analysis)

# meta-analysis of direct control vs meditators
Author <- data[1:18,1]
results  <- data.frame(Author, TE[1:18], SE[1:18])

sub_analysis <- metagen(results[1:18,2],
                        results[1:18,3],
                        data = results,
                        studlab = paste(Author),
                        comb.fixed = FALSE,
                        comb.random = TRUE,
                        method.tau = "ML",
                        hakn = TRUE,
                        prediction = TRUE,
                        sm = "SMD")
print(sub_analysis)

# make a forest plot with all data
forest(sub_analysis, layout = "RevMan5", digits.sd = 2)

# since we have one outliers, just for visualization - redo removing it
# exclude Vestergaard-Poulsen, 2009 for the plot
clean_results <- dplyr::filter(results,!Author %in% c("Vestergaard-Poulsen, 2009"))
tmp <- metagen(clean_results[1:17,2],
               clean_results[1:17,3],
               data = clean_results,
               studlab = paste(Author),
               comb.fixed = FALSE,
               comb.random = TRUE,
               method.tau = "ML",
               hakn = TRUE,
               prediction = TRUE,
               sm = "SMD")
forest(tmp, layout = "RevMan5", digits.sd = 2)
funnel(tmp,xlab = "Hedges' g",ref.triangle = TRUE)


