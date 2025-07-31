/* Program: Ground Rent RPI London Auction Data */

#delimit ;
clear;
eststo clear;

insheet using "<Insert-Folder-Path>\lonmart.csv";

drop if year < 1895 | year > 1914;
drop if value < 100 | value > 1000;
drop if rent_yearly_inpounds < 20 | rent_yearly_inpounds > 100;
drop if years_purchase < 2.8 | years_purchase > 30;


tabstat(ground_rent_inpounds), by(year) statistics(n median min max sd);


*Variables;
gen lgrent = log(ground_rent_inpounds);
gen lrent = log(rent_yearly_inpounds);
replace leasehold_unexpired = 100 if tenure_type=="COPYHOLD";



*Hedonics Regression;
*Annual rpis;
sort year;
by year: sum ground_rent_inpounds;
char tenure_type[omit] "FREEHOLD";

*Full Model;
eststo: xi: qui reg lgrent i.year i.borough i.tenure_type;
predict lrentp if e(sample);
corr lgrent lrentp if e(sample);
di r(rho)^2;

esttab using "<Insert-Folder-Path>\londonmart_grpi_regcoeffs.csv", plain not scalars(r2) replace;



