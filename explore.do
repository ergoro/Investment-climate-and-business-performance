*Explore

quietly{
*Create and assign year
generate year=substr(country,-4,4)
destring year, replace
replace year=1 if year==2006
replace year=2 if year==2010

*Rename "country variables"
gen country_year=country
gen temp=substr(country,1,strlen(country)-4)
drop country
gen country=temp
drop temp

*create idpanel
sort country idPANEL2006 year
*by country: gen idpanel=cond(idPANEL2006==.,idstd,cond(idPANEL2006==idPANEL2006[_n-1], idstd[_n-1], idstd))
by country: gen idpanel=cond(missing(idPANEL2006),idstd,cond(idPANEL2006==idPANEL2006[_n-1], idstd[_n-1], idstd))
*by country: gen idpanel=cond(idPANEL2006==idPANEL2006[_n-1], idstd[_n-1], idstd)
*sort country idpanel
*by country idpanel: gen idpanelno=_n
*by country idpanel: egen idpanelmax=max(idpanelno)
*tabulate idpanelno year

*Number of observations by region and year (2006 only; 2010 only; 2006 and 2010)
	replace a3a="Valparaiso" if a3a=="Valparaíso"
	sort country
	by country: tab a3a panel
	noisily {
	tab a3a panel
	}

*Assigns an ISIC code (2 digit level) and analyzes the number of observations by sector
*do pdf_brazil_sectors_isic2.do
/*
*Assigns an ISIC code (4 digit level) and analyzes the number of observations by sector
do pdf_brazil_sectors_isic4.do
*/
}
