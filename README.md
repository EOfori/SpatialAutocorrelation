# SpatialAutocorrelation
 In this project, I test for Spatial autocorrelation in 2017 Kansas county level ag land values. Ag land values ($/acre) in the 2017_KS_AgLandValues.csv file are obtained from USDA NASS using API and preprocessed. 
 
 First, I read in the ag land values data, then use the "tigris" package to access kansas county level shapefile.
 Next, I join the ag land value data to the shapefile.
 
To provide perspective, I map the ag lan value distribution.

I then proceed to test for spatial autocorrelation using the regular Moran's I test as well as Moran's I test based on Monte Carlo simulated method.
For both tests the null of no spatial autocrelation is rejected.
