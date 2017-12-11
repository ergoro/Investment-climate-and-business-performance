*Instrumental Variables (IV) procedure - Average wage rates. profits
quietly{
*CREATING VARIABLES IN MAIN DATASET FOR IV
gen ethnicfr=.
replace ethnic=0.255 if country=="Argentina"
replace ethnic=0.739625 if country=="Bolivia"
replace ethnic=0.186146 if country=="Chile"
replace ethnic=0.6014 if country=="Colombia"
replace ethnic=0.655 if country=="Ecuador"
replace ethnic=0.1689 if country=="Paraguay"
replace ethnic=0.656577 if country=="Peru"
replace ethnic=0.2504 if country=="Uruguay"
gen religionfr=.
replace religionfr=0.2236207 if country=="Argentina"
replace religionfr=0.2084686 if country=="Bolivia"
replace religionfr=0.3841057 if country=="Chile"
replace religionfr=0.1478351 if country=="Colombia"
replace religionfr=0.1417125 if country=="Ecuador"
replace religionfr=0.2122512 if country=="Paraguay"
replace religionfr=0.1987815 if country=="Peru"
replace religionfr=0.3548297 if country=="Uruguay"
gen latitude=.
replace latitude=0.262777778 if city=="Antofagasta"
replace latitude=0.182037037 if city=="Arequipa"
replace latitude=0.280740741 if city=="Asuncion"
replace latitude=0.032037037 if city=="Azuay"
replace latitude=0.121820988 if city=="Baranquilla"
replace latitude=0.051089507 if city=="Bogota"
replace latitude=0.384481481 if city=="Buenos Aires"
replace latitude=0.409259259 if city=="Bío Bío"
replace latitude=0.038006173 if city=="Cali"
replace latitude=0.383518519 if city=="Canelones"
replace latitude=0.281111111 if city=="Central"
replace latitude=0.305015433 if city=="Chaco"
replace latitude=0.075144011 if city=="Chiclayo"
replace latitude=0.193148144 if city=="Cochabamba"
replace latitude=0.349074078 if city=="Cordoba"
replace latitude=0.024444444 if city=="Guayas"
replace latitude=0.183333333 if city=="La Paz"
replace latitude=0.133814811 if city=="Lima"
replace latitude=0.4607963 if city=="Los Lagos"
replace latitude=0.069231478 if city=="Medellin"
replace latitude=0.365370367 if city=="Mendoza"
replace latitude=0.387595678 if city=="Montevideo"
replace latitude=0.011636667 if city=="Pichincha"
replace latitude=0.366111111 if city=="Rosario"
replace latitude=0.204644444 if city=="Santa Cruz"
replace latitude=0.371666667 if city=="Santiago"
replace latitude=0.090133333 if city=="Trujillo"
replace latitude=0.367222222 if city=="Valparaiso"
gen settlermo=.
replace settlermo=4.232656 if country=="Argentina"
replace settlermo=4.26268 if country=="Bolivia"
replace settlermo=4.232656 if country=="Chile"
replace settlermo=4.26268 if country=="Colombia"
replace settlermo=4.26268 if country=="Ecuador"
replace settlermo=4.35799 if country=="Paraguay"
replace settlermo=4.26268 if country=="Peru"
replace settlermo=4.26268 if country=="Uruguay"
gen ethnicfr_latitude=ethnicfr*latitude
gen religionfr_latitude=religionfr*latitude
*estimation
sum m_share_bank_wk
gen m_share_bank_wk_scaled=((m_share_bank_wk-r(min))/(r(max)-r(min)))*5
egen ic=rmean(m_stability m_infrastructure m_informal m_corrupt m_trade m_tax1 m_opening m_labor m_share_bank_wk_scaled m_courts m_crime)
factor ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime, pcf
rotate
predict ic1 ic2 ic3
noisily{
graph matrix ic ethnicfr_latitude religionfr_latitude ethnicfr religionfr latitude, half
}

gen Bolivia=0
replace Bolivia=1 if (country=="Bolivia")
gen Chile=0
replace Chile=1 if (country=="Chile")
gen Colombia=0
replace Colombia=1 if (country=="Colombia")
gen Ecuador=0
replace Ecuador=1 if (country=="Ecuador")
gen Paraguay=0
replace Paraguay=1 if (country=="Paraguay")
gen Peru=0
replace Peru=1 if (country=="Peru")
gen Uruguay=0
replace Uruguay=1 if (country=="Uruguay")

gen id15=0
replace id15=1 if (industry_dummy==15)
gen id16=0
replace id16=1 if (industry_dummy==16)
gen id17=0
replace id17=1 if (industry_dummy==17)
gen id18=0
replace id18=1 if (industry_dummy==18)
gen id19=0
replace id19=1 if (industry_dummy==19)
gen id20=0
replace id20=1 if (industry_dummy==20)
gen id21=0
replace id21=1 if (industry_dummy==21)
gen id22=0
replace id22=1 if (industry_dummy==22)
gen id23=0
replace id23=1 if (industry_dummy==23)
gen id24=0
replace id24=1 if (industry_dummy==24)
gen id25=0
replace id25=1 if (industry_dummy==25)
gen id26=0
replace id26=1 if (industry_dummy==26)
gen id27=0
replace id27=1 if (industry_dummy==27)
gen id28=0
replace id28=1 if (industry_dummy==28)
gen id29=0
replace id29=1 if (industry_dummy==29)
gen id30=0
replace id30=1 if (industry_dummy==30)
gen id31=0
replace id31=1 if (industry_dummy==31)
gen id32=0
replace id32=1 if (industry_dummy==32)
gen id33=0
replace id33=1 if (industry_dummy==33)
gen id34=0
replace id34=1 if (industry_dummy==34)
gen id35=0
replace id35=1 if (industry_dummy==35)
gen id36=0
replace id36=1 if (industry_dummy==36)
gen id37=0
replace id37=1 if (industry_dummy==37)
gen id45=0
replace id45=1 if (industry_dummy==45)
gen id50=0
replace id50=1 if (industry_dummy==50)
gen id51=0
replace id51=1 if (industry_dummy==51)
gen id52=0
replace id52=1 if (industry_dummy==52)
gen id55=0
replace id55=1 if (industry_dummy==55)
gen id60=0
replace id60=1 if (industry_dummy==60)
gen id61=0
replace id61=1 if (industry_dummy==61)
gen id62=0
replace id62=1 if (industry_dummy==62)
gen id63=0
replace id63=1 if (industry_dummy==63)
gen id64=0
replace id64=1 if (industry_dummy==64)
gen id65=0
replace id65=1 if (industry_dummy==65)
gen id70=0
replace id70=1 if (industry_dummy==70)
gen id72=0
replace id72=1 if (industry_dummy==72)
gen id83=0
replace id83=1 if (industry_dummy==83)
gen id93=0
replace id93=1 if (industry_dummy==93)

gen year2010=0
replace year2010=1 if year==2

*overall IVs
ivreg2 ln_avg_wage ln_age lw_3 eduworker ln_capacityu log_distance_market log_distance_port log_population i.country2 i.year i.industry_dummy (ic = latitude), robust small first  cluster(idpanel)
outreg2 using myreg5.doc, replace
ivreg2 ln_avg_wage ln_age lw_3 eduworker ln_capacityu log_distance_market log_distance_port log_population i.country2 i.year i.industry_dummy (ic1 ic2 ic3 = latitude ethnicfr_latitude religionfr_latitude), robust small first  cluster(idpanel)
outreg2 using myreg5.doc
ivreg2 ln_profit_employee ln_age lw_3 eduworker ln_capacityu log_distance_market log_distance_port log_population i.country2 i.year i.industry_dummy (ic = latitude), robust small first  cluster(idpanel)
outreg2 using myreg5.doc
ivreg2 ln_profit_employee ln_age lw_3 eduworker ln_capacityu log_distance_market log_distance_port log_population i.country2 i.year i.industry_dummy (ic1 ic2 ic3 = latitude ethnicfr_latitude religionfr_latitude), robust small first  cluster(idpanel)
outreg2 using myreg5.doc
}

ivreg2 ln_avg_wage ln_age lw_3 eduworker ln_capacityu log_distance_market log_distance_port log_population i.country2 i.year i.industry_dummy (ic = latitude), robust small first savefirst cluster(idpanel)
est restore _ivreg2_ic
outreg2 using myreg6.doc, replace
ivreg2 ln_avg_wage ln_age lw_3 eduworker ln_capacityu log_distance_market log_distance_port log_population i.country2 i.year i.industry_dummy (ic1 ic2 ic3 = latitude ethnicfr_latitude religionfr_latitude), robust small first savefirst cluster(idpanel)
est restore _ivreg2_ic1
outreg2 using myreg6.doc
ivreg2 ln_avg_wage ln_age lw_3 eduworker ln_capacityu log_distance_market log_distance_port log_population i.country2 i.year i.industry_dummy (ic1 ic2 ic3 = latitude ethnicfr_latitude religionfr_latitude), robust small first savefirst cluster(idpanel)
est restore _ivreg2_ic2
outreg2 using myreg6.doc
ivreg2 ln_avg_wage ln_age lw_3 eduworker ln_capacityu log_distance_market log_distance_port log_population i.country2 i.year i.industry_dummy (ic1 ic2 ic3 = latitude ethnicfr_latitude religionfr_latitude), robust small first savefirst cluster(idpanel)
est restore _ivreg2_ic3
outreg2 using myreg6.doc

ivreg2 ln_profit_employee ln_age lw_3 eduworker ln_capacityu log_distance_market log_distance_port log_population i.country2 i.year i.industry_dummy (ic = latitude), robust small first savefirst cluster(idpanel)
est restore _ivreg2_ic
outreg2 using myreg7.doc, replace
ivreg2 ln_profit_employee ln_age lw_3 eduworker ln_capacityu log_distance_market log_distance_port log_population i.country2 i.year i.industry_dummy (ic1 ic2 ic3 = latitude ethnicfr_latitude religionfr_latitude), robust small first savefirst cluster(idpanel)
est restore _ivreg2_ic1
outreg2 using myreg7.doc
ivreg2 ln_profit_employee ln_age lw_3 eduworker ln_capacityu log_distance_market log_distance_port log_population i.country2 i.year i.industry_dummy (ic1 ic2 ic3 = latitude ethnicfr_latitude religionfr_latitude), robust small first savefirst cluster(idpanel)
est restore _ivreg2_ic2
outreg2 using myreg7.doc
ivreg2 ln_profit_employee ln_age lw_3 eduworker ln_capacityu log_distance_market log_distance_port log_population i.country2 i.year i.industry_dummy (ic1 ic2 ic3 = latitude ethnicfr_latitude religionfr_latitude), robust small first savefirst cluster(idpanel)
est restore _ivreg2_ic3
outreg2 using myreg7.doc
