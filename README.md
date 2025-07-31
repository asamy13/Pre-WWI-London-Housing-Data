Replication files for "Measuring the Edwardian Property Slump: House Prices and Rents in Residential London, 1895-1914"
Antoninus M. Samy

The folders contain the data and STATA/SAS files required to generate the price indices presented in the article. This document describes the data and the programs used to generate the indexes

Due to non-disclosure agreements, data from the building societies are not provided in the replication files. All data in the replication files are compiled from the yearbooks of the London Auction Mart.

A. Data

The data folder contains two files:
1. lonmart.csv - this dataset contains the property sales data taken from the yearbooks of the London Auction Mart. The dataset includes the variables used in the hedonic regressions for the calculation of the House Prices (Figure 5), Rents (Figure 6), and Ground Rents Price Index (Figure 7). Note: This dataset does not have variables derived from linkage of the sales data with the UK censuses of 1901 and 1911. Those seeking to replicate the results of this study must apply to the UK data archive to gain access to the UK census micro-data and link the sales data to them themselves.

Variable list:
street_number			street number of the property
actual_street_name		street name of the property
suburb				suburb/town of the property
borough				London borough in which the property is located
County				County in which the property is located
london_region			Whether in INNER or OUTER London
region				Whether in GREATER LONDON or NOT
year				Year when the property was traded at auction
tenure_type			Whether the property is FREEHOLD, LEASEHOLD, COPYHOLD
leasehold_unexpired_term	The number of years until leasehold term expires (set to 999 for freehold properties)
value				price at which the property was exchanged at auction
ground_rent_inpounds		annual ground rent (in pounds)
rent_yearly_inpounds		annual rent (in pounds)
years_purchase			calculated as value / rent_yearly_inpounds


2. lonmart_repeatsales_1895_1914.csv - this dataset contains property sales that repeated over time data.

Variable list:
street_number			street number of the property
actual_street_name		street name of the property
suburb				suburb/town of the property
d_<year>			dummy variable for whether property was sold in the year (-1 if it was the original 				time it was exchanged in <year>, 1 if it the repeat sale happened in <year>)
lprice_diff			calculated as log(price of property when repeated sale) - log(price of property at original sale)
lrents_diff			calculated as log(annual rent when repeated sale) - log (annual rent at original sale)
lgroundrents_diff		calculated as log(annual ground rent when repeated sale) - log (annual ground rent at original sale)
	

B. STATA programs

The hedonics regressions were estimated in STATA.

1. HPI_lonmart.do, RPI_lonmart.do, and GRPI_lonmart.do estimate the hedonic regressions for the house price index, rent price index and ground price index based on the London Auction Mart sales data. The predicted values from the hedonic regressions are then saved to datasets that are imported by the SAS files below to generate the price indices.

2. all_lonmart_repeatsales.do estimates the repeated sales indices for house prices, rents, and ground prices. The coefficients for the year dummy variables are used to construct the index. 



C. SAS programs

1. HPI_lonmart.sas, RPI_lonmart.sas and GRPI_lonmart.sas take the imputed prices from the hedonics regressions and estimate Laspeyres, Paasche and Fisher indices. The chained Fisher indices are reported in the article.

