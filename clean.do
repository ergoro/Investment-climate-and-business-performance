*Clean
quietly{
*Analyze only one sector
keep if (d1a2==1810)
*Drop non-south American countries
drop if country=="ElSalvador"
drop if country=="Guatemala"
drop if country=="Mexico"
drop if country=="Panama"

sort country year
by country year: sum Y LW K M E VA1 VA2 VA3
*twoway (scatter Y LW, mlabel(idstd)), by(year) ytitle("Sales") xtitle("Workers") ysize(20) xsize(20) caption("Source: LAC, ES")
noisily{
twoway (scatter y lw, mlabel(idstd)), by(year) ysize(20) xsize(20) ytitle("Sales (log)") xtitle("Workers (log)") caption("Source: LAC, ES - ISIC: 1810")
twoway (scatter y k, mlabel(idstd)), by(year) ysize(20) xsize(20) ytitle("Sales (log)") xtitle("Capital (log)") caption("Source: LAC, ES - ISIC: 1810")
twoway (scatter y m, mlabel(idstd)), by(year) ysize(20) xsize(20) ytitle("Sales (log)") xtitle("Raw mat. & Int. Goods (log)") caption("Source: LAC, ES - ISIC: 1810")
twoway (scatter y e, mlabel(idstd)), by(year) ysize(20) xsize(20) ytitle("Sales (log)") xtitle("Electricity (log)") caption("Source: LAC, ES - ISIC: 1810")
}
regress y lw, robust
eststo model1
regress y k, robust
eststo model2
regress y m, robust
eststo model3
regress y e, robust
eststo model4
esttab, compress r2 ar2 se scalar(rmse) star(* 0.10 ** 0.05 *** 0.01)
eststo clear
*Post-estimation Analysis of outliers
*lw
regress y lw
lvr2plot, mlabel(idstd) title("Workers (log)")
*Discrepancy measures (values more extrema than 3 could be a problem)
*Standardized residuals
predict stdresid, rstandard
replace lw=. if stdresid>3
replace lw=. if stdresid<-3
extremes stdresid idstd
drop stdresid
*l
regress y l
lvr2plot, mlabel(idstd) title("Workers - Annual cost (log)")
*Discrepancy measures (values more extrema than 3 could be a problem)
*Standardized residuals
predict stdresid, rstandard
replace l=. if stdresid>3
replace l=. if stdresid<-3
extremes stdresid idstd
drop stdresid
*k
regress y k
lvr2plot, mlabel(idstd) title("Capital (log)")
*Discrepancy measures (values more extrema than 3 could be a problem)
*Standardized residuals
predict stdresid, rstandard
replace k=. if stdresid>3
replace k=. if stdresid<-3
extremes stdresid idstd
drop stdresid
*k2
regress y k2
lvr2plot, mlabel(idstd) title("Capital + Land and Building (log)")
*Discrepancy measures (values more extrema than 3 could be a problem)
*Standardized residuals
predict stdresid, rstandard
replace k2=. if stdresid>3
replace k2=. if stdresid<-3
extremes stdresid idstd
drop stdresid
*k3
regress y k3
lvr2plot, mlabel(idstd) title("Capital + Land and Building (log)")
*Discrepancy measures (values more extrema than 3 could be a problem)
*Standardized residuals
predict stdresid, rstandard
replace k3=. if stdresid>3
replace k3=. if stdresid<-3
extremes stdresid idstd
drop stdresid
*m
regress y m
lvr2plot, mlabel(idstd) title("Raw mat. & Int. Goods (log)")
*Discrepancy measures (values more extrema than 3 could be a problem)
*Standardized residuals
predict stdresid, rstandard
replace m=. if stdresid>3
replace m=. if stdresid<-3
extremes stdresid idstd
drop stdresid
*e
regress y e
lvr2plot, mlabel(idstd) title("Electricity (log)")
*Discrepancy measures (values more extrema than 3 could be a problem)
*Standardized residuals
predict stdresid, rstandard
replace e=. if stdresid>3
replace e=. if stdresid<-3
extremes stdresid idstd
drop stdresid
*eduworker
regress y eduworker
lvr2plot, mlabel(idstd) title("eduworker")
*Discrepancy measures (values more extrema than 3 could be a problem)
*Standardized residuals
predict stdresid, rstandard
replace eduworker=. if stdresid>3
replace eduworker=. if stdresid<-3
extremes stdresid idstd
drop stdresid
*lw_w
regress y lw_w
lvr2plot, mlabel(idstd) title("workers white collar")
*Discrepancy measures (values more extrema than 3 could be a problem)
*Standardized residuals
predict stdresid, rstandard
replace lw_w=. if stdresid>3
replace lw_w=. if stdresid<-3
extremes stdresid idstd
drop stdresid
*lw_w
regress y lw_b
lvr2plot, mlabel(idstd) title("workers blue collar")
*Discrepancy measures (values more extrema than 3 could be a problem)
*Standardized residuals
predict stdresid, rstandard
replace lw_b=. if stdresid>3
replace lw_b=. if stdresid<-3
extremes stdresid idstd
drop stdresid

*y_lagged
regress y_lagged lw_3
lvr2plot, mlabel(idstd) title("lagged variables")
*Discrepancy measures (values more extrema than 3 could be a problem)
*Standardized residuals
predict stdresid, rstandard
replace y_lagged=. if stdresid>3
replace y_lagged=. if stdresid<-3
extremes stdresid idstd
drop stdresid
}
