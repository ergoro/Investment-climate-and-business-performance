*keep
/*
*Analizyng Export and Import Data
sort reporteriso commoditycode year
sort reporteriso commoditycode
by reporteriso commoditycode: egen avg_cc=mean(tradevalueus)
collapse tradevalueus , by(reporteriso commoditycode commodity avg_cc)
sort reporteriso
by reporteriso: egen etotal=max(tradevalueus)
gen ec_per=(tradevalueus/etotal)*100

encode commoditycode, gen(cc)
encode reporteriso, gen(id)

preserve
drop if cc==11
#delimit ;
twoway 
	scatter ec_per cc if id==1, connect(1) 
	|| scatter ec_per cc if id==2, connect(1) msymbol(circle) lpattern(solid)
	|| scatter ec_per cc if id==3, connect(1) msymbol(diamond) lpattern(dash) 
	|| scatter ec_per cc if id==4, connect(1) msymbol(triangle) lpattern(dot)
	|| scatter ec_per cc if id==5, connect(1) msymbol(square) lpattern(dash_dot)
	|| scatter ec_per cc if id==6, connect(1) msymbol(plus) lpattern(solid)
	|| scatter ec_per cc if id==7, connect(1) msymbol(circle) lpattern(dash)
	|| scatter ec_per cc if id==8, connect(1) msymbol(diamond) lpattern(dot)
	|| scatter ec_per cc if id==9, connect(1) msymbol(triangle) lpattern(dash_dot)
	|| scatter ec_per cc if id==10, connect(1) msymbol(square) lpattern(solid)
	|| scatter ec_per cc if id==11, connect(1) msymbol(plus) lpattern(dash)
	|| scatter ec_per cc if id==12, connect(1) lpattern(dot)
	legend(col(6) label(1 "ARG") label(2 "BOL") label(3 "CHL") label(4 "COL") label(5 "ECU") label(6 "GTM")
			label(7 "MEX") label(8 "PAN") label(9 "PER") label(10 "PRY") label(11 "SLV") label(12 "URY") textwidth(*2) size(vsmall)) 
	xlabel(1 "Food and live animals" 
	2 `" "Beverages,"  "and tobaco" "'
	3 `" "Crude materials,"  "inedible, except fuels" "' 
	4 `" "Mineral fuels, lubricants"  "and related materials" "' 
	5 `" "Animal and vegetable"  "oils, fats and waxes" "' 
	6 `" "Chemicals and related"  "products, n.e.s." "'
	7 `" "Manufactured goods"  "classified chiefly" "by material" "'
	8 `" "Machinery and"  "transport equipment" "'
	9 `" "Miscellaneous"  "manufactured articles" "'
	10 `" "Commodities and"  "transactions not classified" "elsewhere in the SITC" "', angle(vertical) labsize(small)) 
	ylabel(,labsize(small))
	ytitle("") 
	xtitle("")
  ;
#delimit cr
*ytitle("Trade Value - Percentage of Total", size(vsmall) margin(large)) 
*xtitle("SITC")
restore
*/


quietly{
*Keep only LAC
drop if (region==1 | region==2 | region==3 | region==5 | region==6)
*Keep Chile from OECD
drop if (country=="Czech Republic2009" | country=="Czech Republic2013" | country=="Estonia2009" | country=="Estonia2013" | country=="Israel2013" | country=="Poland2009" | country=="Poland2013" | country=="Slovak Republic2009" | country=="Slovak Republic2013" | country=="Slovenia2009" | country=="Slovenia2013" | country=="Sweden2014")
*Keep Uruguay from non-OECD
drop if (country=="Czech Republic2009" | country=="Czech Republic2013" | country=="Estonia2009" | country=="Estonia2013" | country=="Israel2013" | country=="Poland2009" | country=="Poland2013" | country=="Slovak Republic2009" | country=="Slovak Republic2013" | country=="Slovenia2009" | country=="Slovenia2013" | country=="Sweden2014")
*Drop Brazil2009
drop if (country=="Brazil2009")
*Drop Antiguaandbarbuda2010 Bahamas2010 Barbados2010 Belize2010 Costarica2010 DOminica2010 DominicanRepublic2010 Grenada2010 Guyana2010 Jamaica2010 StKittsandNevis2010 StLucia2010 StVincentandGrenadines2010 Suriname2010 TrinidadandTobago2010
drop if (country=="Antiguaandbarbuda2010" | country=="Bahamas2010" | country=="Barbados2010" | country=="Croatia2007" | country=="Croatia2013" | country=="Latvia2009" | country=="Latvia2013" | country=="Lithuania2009" | country=="Lithuania2013" | country=="StKittandNevis2010" | country=="TrinidadandTobago2010") 
drop if (country=="Belize2010" | country=="Costarica2010" | country=="Dominica2010" | country=="DominicanRepublic2010" | country=="Grenada2010" | country=="Guyana2010" | country=="Jamaica2010" | country=="StKittsandNevis2010" | country=="StLucia2010" | country=="StVincentandGrenadines2010" | country=="Suriname2010" | country=="TrinidadandTobago2010")
*Drop Honduras and Nicaragua
drop if (country=="Honduras2006" | country=="Honduras2010")
drop if (country=="Nicaragua2006" | country=="Nicaragua2010")
drop if (country=="Venezuela2006" | country=="Venezuela2010")
*Drop ElSalvador, Guatemala, MExico, Panama
drop if (country=="ElSalvador2006" | country=="ElSalvador2010" | country=="ElSalvador2016")
drop if (country=="Guatemala2006" | country=="Guatemala2010")
drop if (country=="Panama2006" | country=="Panama2010")
drop if (country=="Mexico2006" | country=="Mexico2010")

sort idstd
merge 1:1 idstd using "C:\Users\Erick Gonzales\Documents\2_Data\ES_WBG\Panel\StandardizedNew-2006_2016--core4-\lac8_2006_2010_panel.dta", keepusing(id2010 idPANEL2006 panel)
drop _merge

/*
sort idstd
merge 1:1 idstd using "C:\Users\Erick Gonzales\Documents\2_Data\ES_WBG\Panel\StandardizedNew-2006_2016--core4-\Bolivia_2006_2010_Panel.dta"
drop _merge
merge 1:1 idstd using "C:\Users\Erick Gonzales\Documents\2_Data\ES_WBG\Panel\StandardizedNew-2006_2016--core4-\Chile_2006_2010_Panel.dta"
drop _merge
merge 1:1 idstd using "C:\Users\Erick Gonzales\Documents\2_Data\ES_WBG\Panel\StandardizedNew-2006_2016--core4-\Colombia_2006_2010_Panel.dta"
drop _merge
merge 1:1 idstd using "C:\Users\Erick Gonzales\Documents\2_Data\ES_WBG\Panel\StandardizedNew-2006_2016--core4-\Ecuador_2006_2010_Panel.dta"
drop _merge
merge 1:1 idstd using "C:\Users\Erick Gonzales\Documents\2_Data\ES_WBG\Panel\StandardizedNew-2006_2016--core4-\Paraguay_2006_2010_Panel.dta"
drop _merge
merge 1:1 idstd using "C:\Users\Erick Gonzales\Documents\2_Data\ES_WBG\Panel\StandardizedNew-2006_2016--core4-\Peru_2006_2010_Panel.dta"
drop _merge
merge 1:1 idstd using "C:\Users\Erick Gonzales\Documents\2_Data\ES_WBG\Panel\StandardizedNew-2006_2016--core4-\Uruguay_2006_2010_Panel.dta"
drop _merge
*/
}
