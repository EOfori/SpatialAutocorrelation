## Spatial autocorrelation test for 2017 Kansas county level ag land values

library(tidyverse)
mydata <- as.data.frame(read_csv("2017_KS_AgLandValues.csv")) # read in ag land value data

library(tigris)
kansas <- counties(state = "KS",  cb = TRUE) # read in kansas shapefile using "tigris" package

ks_df <- geo_join(kansas, mydata, "NAME", "County", how="left") # Merging data using geo_join


## Data visualization ####
library(tmap)
tm_shape(ks_df) + tm_polygons(style="quantile", col = "AgLandValue") +
  tm_legend(outside = TRUE, text.size = .8) 


## Moran's I test on Ag land values  ####     
library(spdep)
nb <- poly2nb(ks_df, queen=TRUE) # construct neighbours based on counties

lw <- nb2listw(nb, style="W", zero.policy=TRUE) # create weight matrix

AgLandValue.lag <- lag.listw(lw, ks_df$AgLandValue) # create spatially lagged values

moran.test(ks_df$AgLandValue,lw) # moran's I test

MC <- moran.mc(ks_df$AgLandValue, lw, nsim=500); MC  # moran's I test based on Monte Carlo simulated method

plot(MC, main="", las=1) # Plot the distribution 
