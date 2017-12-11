*keep
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
