install.packages("tidyverse")
install.packages("meta")
install.packages("metafor")
install.packages("devtools")
install.packages("esc")

library("tidyverse")
library("meta")
library("metafor")
library("devtools")
library(esc)


devtools::install_github("MathiasHarrer/dmetar")

?esc_t

### t-tests maxima

#Chetelat, 2017
esc_t(t = 2.236, grp1n = 6, grp2n = 67,es.type="g")
# 0.9427

#Engen, 2018
esc_t(t = 1.971, grp1n = 17, grp2n = 15,es.type="g")
# 0.6806

#Fahmy, 2018
esc_t(t = 3.063, grp1n = 10, grp2n = 9,es.type="g")
# 1.3443

#Grant, 2010
esc_t(t = 4.14, grp1n = 17, grp2n = 18,es.type="g")
# 1.3681

#Grant, 2013
esc_t(t = 2.37, grp1n = 18, grp2n = 18,es.type="g")
# 0.7724

#Hernandez, 2016
esc_t(t = 5.02, grp1n = 23, grp2n = 23,es.type="g")
# 1.4549

#Holzel, 2007
esc_t(t = 3.77, grp1n = 20, grp2n = 20,es.type="g")
# 1.1685

#Kumar, 2013
esc_t(t = 3, grp1n = 14, grp2n = 14,es.type="g")
# 1.1009

#Kurth, 2015
esc_t(t = 2.1751, grp1n = 50, grp2n = 50,es.type="g")
# 0.4317

#Leung, 2012
esc_t(t = 4.87, grp1n = 10, grp2n = 15,es.type="g")
# 1.9226

#Luders, 2009
esc_t(t = 2.882, grp1n = 22, grp2n = 22,es.type="g")
# 0.8533

#Luders, 2012
esc_t(t = 3.119, grp1n = 30, grp2n = 30,es.type="g")
# 0.7949

#Luders, 2013
esc_t(t = 1.8798, grp1n = 50, grp2n = 50,es.type="g")
# 0.3731

#Luders, 2015 Larger...men
esc_t(t = 3.9161, grp1n = 15, grp2n = 15,es.type="g")
# 1.3913

#Vestergaard-Poulsen, 2009
esc_t(t = 104.9, grp1n = 10, grp2n = 10,es.type="g")
# 44.9305

#Luders, 2015 Forever.. younger
esc_t(t = 3.89, grp1n = 50, grp2n = 50,es.type="g")
# 0.7720

#Pagnoni, 2007
esc_t(t = 5.45, grp1n = 13, grp2n = 13,es.type="g")
# 2.0702



### regression maxima

#Friedel, 2015
esc_B(b=0.277,sdy=0.807,grp1n = 82,grp2n = 82,es.type = "g")
# 0.3458

#Murakami, 2012
esc_B(b=0.116,sdy=5,grp1n = 19,grp2n = 19,es.type = "g")
# 0.0224



### correlation maxima

#Lazar, 2005
esc_rpb(r = -0.05, grp1n = 20, grp2n = 15, es.type = "g")
# -0.0988

esc_rpb(r = -0.76, grp1n = 20, grp2n = 15, es.type = "g")
# -2.3089

-0.0988-(-2.3089)
# 2.2101

#Kurth, 2014
esc_rpb(r = 0.5, grp1n = 50, grp2n = 50, es.type = "g")
# 1.1458

#Taren, 2013
esc_rpb(r = 0.175, grp1n = 155, grp2n = 155, es.type = "g")
# 0.3546

#Lu, 2014
esc_rpb(r = 0.169, grp1n = 247, grp2n = 247, es.type = "g")
# 0.3424



### t-test right insula

#Engen, 2018
esc_t(t = 1.524, grp1n = 17, grp2n = 15,es.type="g")
# 0.5263

#Fahmy, 2018
esc_t(t = 2.765, grp1n = 10, grp2n = 9,es.type="g")
# 1.2135

#Grant, 2010
esc_t(t = 1.93, grp1n = 17, grp2n = 18,es.type="g")
# 0.6378

#Hernandez, 2016
esc_t(t = 5.02, grp1n = 23, grp2n = 23,es.type="g")
# 1.4549

#Holzel, 2007
esc_t(t = 3.51, grp1n = 20, grp2n = 20,es.type="g")
# 1.0879

#Luders, 2009
esc_t(t = 0.3515, grp1n = 22, grp2n = 22,es.type="g")
# 0.1041

#Luders, 2015 Forever.. younger
esc_t(t = 3.59, grp1n = 50, grp2n = 50,es.type="g")
# 0.7125


### t-test left insula

#Fahmy, 2018
esc_t(t = 2.765, grp1n = 10, grp2n = 9,es.type="g")
#1.2135

#Grant, 2010
esc_t(t = 2.55, grp1n = 17, grp2n = 18,es.type="g")
#0.8427

#Luders, 2015 Forever.. younger
esc_t(t = 3.91, grp1n = 50, grp2n = 50,es.type="g")
#0.7760

#Pagnoni, 2007
esc_t(t = 5.45, grp1n = 13, grp2n = 13,es.type="g")
#2.0702



### meta maxima

madata <- random_effect

m.hksj <- metagen(TE,
                  seTE,
                  data = madata,
                  studlab = paste(Author),
                  comb.fixed = FALSE,
                  comb.random = TRUE,
                  method.tau = "ML",
                  hakn = TRUE,
                  prediction = TRUE,
                  sm = "SMD")
m.hksj


funnel(m.hksj,xlab = "Hedges' g")

forest(m.hksj)



### meta right insula

madata_r <- right_insula

m.hksj_r <- metagen(TE,
                  seTE,
                  data = madata_r,
                  studlab = paste(Author),
                  comb.fixed = FALSE,
                  comb.random = TRUE,
                  method.tau = "ML",
                  hakn = TRUE,
                  prediction = TRUE,
                  sm = "SMD")

m.hksj_r



### meta left insula

madata_l <- left_insula

m.hksj_l <- metagen(TE,
                  seTE,
                  data = madata_l,
                  studlab = paste(Author),
                  comb.fixed = FALSE,
                  comb.random = TRUE,
                  method.tau = "ML",
                  hakn = TRUE,
                  prediction = TRUE,
                  sm = "SMD")

m.hksj_l
