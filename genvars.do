*Generate variables
quietly{
*vars_tfp

*SALES (Y)
*(total annual sales)
*The sales variable is in national currency. I want to convert it to 2005 USD
*exchange rates:
gen erat=.
replace erat=2.9036575 if (country_year=="Argentina2006")
replace erat=3.71010683052328 if (country_year=="Argentina2010")
replace erat=8.0660625 if (country_year=="Bolivia2006")
replace erat=7.02 if (country_year=="Bolivia2010")
replace erat=559.7675 if (country_year=="Chile2006")
replace erat=560.85989484127 if (country_year=="Chile2010")
replace erat=2320.83417666667 if (country_year=="Colombia2006")
replace erat=2158.25590299025 if (country_year=="Colombia2010")
*replace erat=25000 if (country_year=="Ecuador2006")
replace erat=1 if (country_year=="Ecuador2006")
replace erat=1 if (country_year=="Ecuador2010")
replace erat=8.75 if (country_year=="ElSalvador2006")
replace erat=8.75 if (country_year=="Elsalvador2010")
replace erat=7.63394416666667 if (country_year=="Guatemala2006")
replace erat=8.16155541666667 if (country_year=="Guatemala2010")
replace erat=18.8323416666667 if (country_year=="Honduras2006")
replace erat=18.8951 if (country_year=="Honduras2010")
replace erat=10.8978916666667 if (country_year=="Mexico2006")
replace erat=13.513475 if (country_year=="Mexico2010")
replace erat=16.7333295340502 if (country_year=="Nicaragua2006")
replace erat=20.3394818701997 if (country_year=="Nicaragua2010")
replace erat=1 if (country_year=="Panama2006")
replace erat=1 if (country_year=="Panama2010")
replace erat=6177.95833333333 if (country_year=="Paraguay2006")
replace erat=4965.39166666667 if (country_year=="Paraguay2010")
replace erat=3.29584166666667 if (country_year=="Peru2006")
replace erat=3.01150833333333 if (country_year=="Peru2010")
replace erat=24.4786 if (country_year=="Uruguay2006")
replace erat=22.5679833333333 if (country_year=="Uruguay2010")
replace erat=2.08975 if (country_year=="Venezuela2006")
replace erat=2.147 if (country_year=="Venezuela2010")
*drop if (country_year=="Ecuador2006" | country_year=="Ecuador2010")
drop if (country_year=="Venezuela2006" | country_year=="Venezuela2010")
gen cpiusa=.
replace cpiusa=1 if (year==1)
replace cpiusa=1.09849974398361 if (year==2)
replace d2=. if (d2==-9 | d2==-8)
gen Y=(d2/erat)/cpiusa

*lagged sales: n3
replace n3=. if (n3<0)
gen Y_lagged=.
replace Y_lagged=(n3/3.09564884920635)/1.06165898617512 if country_year=="Argentina2010"
replace Y_lagged=(n3/2.90062916666667)/0.942140296979007 if country_year=="Argentina2006"
replace Y_lagged=(n3/7.85124516125)/1.06165898617512 if country_year=="Bolivia2010"
replace Y_lagged=(n3/7.65916666666667)/0.942140296979007 if country_year=="Bolivia2006"
replace Y_lagged=(n3/522.464166666667)/1.06165898617512 if country_year=="Chile2010"
replace Y_lagged=(n3/691.3975)/0.942140296979007 if country_year=="Chile2006"
replace Y_lagged=(n3/2078.29183666667)/1.06165898617512 if country_year=="Colombia2010"
replace Y_lagged=(n3/2877.65245833333)/0.942140296979007 if country_year=="Colombia2006"
replace Y_lagged=(n3/1)/1.06165898617512 if country_year=="Ecuador2010"
replace Y_lagged=(n3/1)/0.942140296979007 if country_year=="Ecuador2006"
replace Y_lagged=(n3/5032.71666666667)/1.06165898617512 if country_year=="Paraguay2010"
replace Y_lagged=(n3/6424.33916666667)/0.942140296979007 if country_year=="Paraguay2006"
replace Y_lagged=(n3/3.12804457735247)/1.06165898617512 if country_year=="Peru2010"
replace Y_lagged=(n3/3.478467)/0.942140296979007 if country_year=="Peru2006"
replace Y_lagged=(n3/23.471025)/1.06165898617512 if country_year=="Uruguay2010"
replace Y_lagged=(n3/28.2086833333333)/0.942140296979007 if country_year=="Uruguay2006"


*LABOR (L)
*(number of full-time permanent and temporary workers at the end of the fiscal year)
replace l1=. if (l1==-9 | l1==-8)
replace l6=. if (l6==-9 | l6==-8)
egen LW=rowtotal(l1 l6)
*generate LW=l1

replace l2=. if (l2==-9 | l2==-8)
gen LW_3=l2
gen lw_3=log(LW_3)

replace n2a=. if (n2a==-9 | n2a==-8)
gen L=(n2a/erat)/cpiusa

gen avg_wage=L/LW
gen ln_avg_wage=log(avg_wage)

replace l9=. if (l9==-9 | l9==-8)
*l9a is average number of years of education
replace l9a=. if (l9a==-9 | l9a==-8)
generate eduworker=.
replace eduworker=l9 if (year==1)
replace eduworker=1 if (year==2 & l9a<4)
replace eduworker=2 if (year==2 & l9a>3 & l9a<7)
replace eduworker=3 if (year==2 & l9a>6 & l9a<10)
replace eduworker=4 if (year==2 & l9a>10 & l9a<13)
replace eduworker=4 if (year==2 & l9a>12)

replace l3b=. if (l3b==-9 | l3b==-8)
generate LW_W=l3b
replace l3a=. if (l3a==-9 | l3a==-8)
generate LW_B=l3a



/*replace l4a=. if (l4a==-9 | l4a==-8)
generate LW_W=l4a
replace l4b=. if (l4b==-9 | l4b==-8)
generate LW_B=l4b*/


*CAPITAL (K)
*(Net book value, the value of assets after depreciation, of machinery, equipment (including vehicles),land and buildings at the end of the fiscal year)
*I was suggested not to include lands and buildings for the case of my research
generate n6=n6a
replace n6=. if n6<0
generate K=(n6/erat)/cpiusa

replace n6b=. if n6b<0
generate K_2=((n6b/erat)/cpiusa)
egen K2=rowtotal(K_2 K)

replace n7a=. if n7a<0
generate K3=(n7a/erat)/cpiusa

*CHECKING VALID VALUES FOR PROXIES
preserve
sort n2e
by n2e: gen eno=_n
by n2e: egen emax=max(eno)
collapse emax, by(n2e)
noisily {
extremes emax n2e
}
restore
preserve
sort n2b
by n2b: gen eno=_n
by n2b: egen emax=max(eno)
collapse emax, by(n2b)
noisily {
extremes emax n2b
}
restore
preserve
sort n2c
by n2c: gen eno=_n
by n2c: egen emax=max(eno)
collapse emax, by(n2c)
noisily {
extremes emax n2c
}
restore
preserve
sort n2f
by n2f: gen eno=_n
by n2f: egen emax=max(eno)
collapse emax, by(n2f)
noisily {
extremes emax n2f
}
restore
*(It could be said that electricity is the variable with lower number of missing observations)

*RAW MATERIALS AND INTERMEDIATE GOODS (M)
replace n2e=. if (n2e==-9 | n2e==-8)
generate M=(n2e/erat)/cpiusa

*ELECTRICITY
replace n2b=. if (n2b==-9 | n2b==-8)
generate E=(n2b/erat)/cpiusa

*FUEL
replace n2f=. if (n2f==-9 | n2f==-8)
generate F=(n2f/erat)/cpiusa

*OTHER COSTS (communications, transportation, water)
replace n2c=. if n2c<0
replace n2g=. if n2g<0
replace n2h=. if n2h<0
egen n2oc=rowtotal(n2c n2g n2h), missing
generate OC=(n2oc/erat)/cpiusa

*INVESTMENT
replace n5a=. if (n2f==-9 | n2f==-8)
generate INV=(n5a/erat)/cpiusa

*PROFITS
*Important point is that OC should not be included in TC. It is defined like this in the paper and also OC is available only for 2006
egen TC=rowtotal(L M)
generate PROFIT=Y-TC

*VALUE ADDED
generate VA1=Y-M
generate VA2=Y-E
generate VA3=Y-M-E

*obtain logarithms
generate y=ln(Y)
generate y_lagged=ln(Y_lagged)
generate lw=ln(LW)
generate l=ln(L)
generate lw_w=ln(LW_W)
generate lw_b=ln(LW_B)
generate k=ln(K)
generate k2=ln(K2)
generate k3=ln(K3)
generate m=ln(M)
generate e=ln(E)
generate f=ln(F)
generate oc=ln(OC)
generate profit=ln(PROFIT)
generate inv=ln(INV)
generate va1=ln(VA1)
generate va2=ln(VA2)
generate va3=ln(VA3)

*year variable for panel
gen year2=1
replace year2=2 if (year==2)
encode country, gen(country2)


/*
*===INDEPENDET VARIABLES

*CITY
sort country
by country: tab a3ax
replace a3ax="Valparaiso" if a3ax=="Valparaíso"
replace a3ax="Rest of the country" if (a3ax=="Resto del pais" & country=="ElSalvador")
replace a3ax="rest_country_SLV" if (a3ax=="Rest of the country" & country=="ElSalvador")
replace a3ax="Rest of the country" if (a3ax=="Resto del pais" & country=="Guatemala")
replace a3ax="rest_country_GTM" if (a3ax=="Rest of the country" & country=="Guatemala")
replace a3ax="rest_country_PAN" if (a3ax=="Rest of the country" & country=="Panama")
rename a3ax city
by country: tab city

*POPULATION
gen population=.
*Province (Population 2010-10-27 Census)
replace population=15625084 if city=="Buenos Aires"
replace population=1055259 if city=="Chaco"
replace population=3528700 if city=="Cordoba"
replace population=3308876 if city=="Mendoza"
replace population=1193605 if city=="Rosario"
*Department (Population 2012-11-21 Census)
replace population=1762761 if city=="Cochabamba"
replace population=2719344 if city=="La Paz"
replace population=2657762 if city=="Santa Cruz"
*Region (Population P 2014-07-01 Census)
replace population=613300 if city=="Antofagasta"
replace population=2100500 if city=="Bío Bío"
replace population=834700 if city=="Los Lagos"
replace population=7228600 if city=="Santiago"
replace population=1808300 if city=="Valparaiso"
*Department (Population P 2014-07-01 Census)
replace population=2432000 if city=="Barranquilla"
replace population=7776800 if city=="Bogota"
replace population=4566900 if city=="Cali"
replace population=6378100 if city=="Medellin"
*Provinces (Population P 2014-07-01 Census)
replace population=796200 if city=="Azuay"
replace population=4024900 if city=="Guayas"
replace population=2891500 if city=="Pichincha"
*Departments (Population P 2014-06-30 Census)
replace population=1753100 if city=="San Salvador"
replace population=357546.15 if city=="rest_country_SLV"
*Departments (Population P 2014-06-30 Census)
replace population=3207600 if city=="Guatemala City"
replace population=565052.38 if city=="rest_country_GTM"
*States (Population Cf 2010-05-31 Census)
replace population=3406465 if city=="Chihuahua"
replace population=3406465 if city=="Coahuila"
replace population=2748391 if city=="Coahuila de Zaragoza"
replace population=15175862 if city=="Estado de Mexico"
replace population=5486372 if city=="Guanajuato"
replace population=7350682 if city=="Jalisco"
replace population=8851080 if city=="Mexico DF"
replace population=4653458 if city=="Nuevo Leon"
replace population=5779829 if city=="Puebla"
replace population=7643194 if city=="Veracruz"
*Provinces (Population Cf 2010-05-16 Census)
replace population=241928 if city=="Colon"
replace population=1713070 if city=="Panama City"
replace population=145081.5 if city=="rest_country_PAN"
*Provinces (Population P 2010 Census)
replace population=518200 if city=="Asuncion"
replace population=518200 if city=="Central"
*Regions (Population C 2007-10-21 Census)
replace population=1152303 if city=="Arequipa"
replace population=1112868 if city=="Chiclayo"
replace population=8445211 if city=="Lima"
replace population=1617050 if city=="Trujillo"
*Departments (Population Cf 2011-09-01 Census)
replace population=520187 if city=="Canelones"
replace population=1319108 if city=="Montevideo"
gen log_population=log(population)

*DISTANCE_PORT
gen distance_port=.
*Province (Distance_port 2010-10-27 Census)
replace distance_port=0 if city=="Buenos Aires"
replace distance_port=1000 if city=="Chaco"
replace distance_port=650 if city=="Cordoba"
replace distance_port=260 if city=="Mendoza"
replace distance_port=300 if city=="Rosario"
*Department (Distance_port 2012-11-21 Census)
replace distance_port=500 if city=="Cochabamba"
replace distance_port=450 if city=="La Paz"
replace distance_port=800 if city=="Santa Cruz"
*Region (Distance_port P 2014-07-01 Census)
replace distance_port=0 if city=="Antofagasta"
replace distance_port=0 if city=="Bío Bío"
replace distance_port=0 if city=="Los Lagos"
replace distance_port=0 if city=="Santiago"
replace distance_port=0 if city=="Valparaiso"
*Department (Distance_port P 2014-07-01 Census)
replace distance_port=0 if city=="Barranquilla"
replace distance_port=350 if city=="Bogota"
replace distance_port=0 if city=="Cali"
replace distance_port=300 if city=="Medellin"
*Provinces (Distance_port P 2014-07-01 Census)
replace distance_port=110 if city=="Azuay"
replace distance_port=0 if city=="Guayas"
replace distance_port=180 if city=="Pichincha"
*Departments (Distance_port P 2014-06-30 Census)
replace distance_port=0 if city=="San Salvador"
replace distance_port=0 if city=="rest_country_SLV"
*Departments (Distance_port P 2014-06-30 Census)
replace distance_port=0 if city=="Guatemala City"
replace distance_port=0 if city=="rest_country_GTM"
*States (Distance_port Cf 2010-05-31 Census)
replace distance_port=600 if city=="Chihuahua"
replace distance_port=600 if city=="Coahuila"
replace distance_port=700 if city=="Coahuila de Zaragoza"
replace distance_port=280 if city=="Estado de Mexico"
replace distance_port=330 if city=="Guanajuato"
replace distance_port=150 if city=="Jalisco"
replace distance_port=320 if city=="Mexico DF"
replace distance_port=390 if city=="Nuevo Leon"
replace distance_port=200 if city=="Puebla"
replace distance_port=0 if city=="Veracruz"
*Provinces (Distance_port Cf 2010-05-16 Census)
replace distance_port=0 if city=="Colon"
replace distance_port=0 if city=="Panama City"
replace distance_port=0 if city=="rest_country_PAN"
*Provinces (Distance_port P 2010 Census)
replace distance_port=900 if city=="Asuncion"
replace distance_port=900 if city=="Central"
*Regions (Distance_port C 2007-10-21 Census)
replace distance_port=250 if city=="Arequipa"
replace distance_port=0 if city=="Chiclayo"
replace distance_port=0 if city=="Lima"
replace distance_port=0 if city=="Trujillo"
*Departments (Distance_port Cf 2011-09-01 Census)
replace distance_port=0 if city=="Canelones"
replace distance_port=0 if city=="Montevideo"
gen log_distance_port=log(distance_port)
replace log_distance_port=0 if (log_distance_port==.)

*DISTANCE_MARKET
gen distance_market=.
*Province (Distance_market 2010-10-27 Census)
replace distance_market=8300 if city=="Buenos Aires"
replace distance_market=7400 if city=="Chaco"
replace distance_market=7900 if city=="Cordoba"
replace distance_market=8000 if city=="Mendoza"
replace distance_market=8100 if city=="Rosario"
*Department (Distance_market 2012-11-21 Census)
replace distance_market=6300 if city=="Cochabamba"
replace distance_market=6200 if city=="La Paz"
replace distance_market=6500 if city=="Santa Cruz"
*Region (Distance_market P 2014-07-01 Census)
replace distance_market=6900 if city=="Antofagasta"
replace distance_market=8400 if city=="Bío Bío"
replace distance_market=8900 if city=="Los Lagos"
replace distance_market=8000 if city=="Santiago"
replace distance_market=7900 if city=="Valparaiso"
*Department (Distance_market P 2014-07-01 Census)
replace distance_market=3100 if city=="Barranquilla"
replace distance_market=3800 if city=="Bogota"
replace distance_market=3900 if city=="Cali"
replace distance_market=3600 if city=="Medellin"
*Provinces (Distance_market P 2014-07-01 Census)
replace distance_market=4600 if city=="Azuay"
replace distance_market=4500 if city=="Guayas"
replace distance_market=4300 if city=="Pichincha"
*Departments (Distance_market P 2014-06-30 Census)
replace distance_market=3000 if city=="San Salvador"
replace distance_market=3000 if city=="rest_country_SLV"
*Departments (Distance_market P 2014-06-30 Census)
replace distance_market=2900 if city=="Guatemala City"
replace distance_market=2900 if city=="rest_country_GTM"
*States (Distance_market Cf 2010-05-31 Census)
replace distance_market=2800 if city=="Chihuahua"
replace distance_market=2600 if city=="Coahuila"
replace distance_market=2400 if city=="Coahuila de Zaragoza"
replace distance_market=3000 if city=="Estado de Mexico"
replace distance_market=3000 if city=="Guanajuato"
replace distance_market=3200 if city=="Jalisco"
replace distance_market=3000 if city=="Mexico DF"
replace distance_market=2600 if city=="Nuevo Leon"
replace distance_market=2900 if city=="Puebla"
replace distance_market=2800 if city=="Veracruz"
*Provinces (Distance_market Cf 2010-05-16 Census)
replace distance_market=3200 if city=="Colon"
replace distance_market=3300 if city=="Panama City"
replace distance_market=3300 if city=="rest_country_PAN"
*Provinces (Distance_market P 2010 Census)
replace distance_market=7400 if city=="Asuncion"
replace distance_market=7400 if city=="Central"
*Regions (Distance_market C 2007-10-21 Census)
replace distance_market=6100 if city=="Arequipa"
replace distance_market=5000 if city=="Chiclayo"
replace distance_market=5600 if city=="Lima"
replace distance_market=5200 if city=="Trujillo"
*Departments (Distance_market Cf 2011-09-01 Census)
replace distance_market=8400 if city=="Canelones"
replace distance_market=8450 if city=="Montevideo"
gen log_distance_market=log(distance_market)

*COUNTRY GDP (GDP per capita (constant 2005 US$) - 2008
/*
gen gdp=.
replace gdp=6195.4 if country=="Argentina"
replace gdp=1129.5  if country=="Bolivia"
replace gdp=8382.3 if country=="Chile"
replace gdp=3832.5 if country=="Colombia"
replace gdp=3245.4 if country=="Ecuador"
replace gdp=1646.0 if country=="Paraguay"
replace gdp=3335.2 if country=="Peru"
replace gdp=6162.8 if country=="Uruguay"
gen ln_gdp=log(gdp)
*/
*assuming different GDP in 2006 and 2010
gen gdp=.
replace gdp=6195.4 if country_year=="Argentina2006"
replace gdp=10368.4555595933 if country_year=="Argentina2010"
replace gdp=1051.47175616328 if country_year=="Bolivia2006"
replace gdp=1176.9744750324 if country_year=="Bolivia2010"
replace gdp=7869.60422243812 if country_year=="Chile2006"
replace gdp=8610.02204254411 if country_year=="Chile2010"
replace gdp=3565.88638893629 if country_year=="Colombia2006"
replace gdp=3937.86720135467 if country_year=="Colombia2010"
replace gdp=3090.15946014973 if country_year=="Ecuador2006"
replace gdp=3268.81379042526 if country_year=="Ecuador2010"
replace gdp=1522.00663722925 if country_year=="Paraguay2006"
replace gdp=1725.79480030659 if country_year=="Paraguay2010"
replace gdp=2875.69480185211 if country_year=="Peru2006"
replace gdp=3575.40973236373 if country_year=="Peru2010"
replace gdp=5427.42514206169 if country_year=="Uruguay2006"
replace gdp=6791.05041499911 if country_year=="Uruguay2010"
gen ln_gdp=log(gdp)

sort country city

*INSPECTIONS PER YEAR
replace j4=. if (j4==-9 | j4==-8)
generate num_insp=j4
by country city: egen m_num_insp=mean(num_insp)

*TIME DEALING WITH REGULATIONS (% IN A WEEK)
replace j2=. if (j2==-9 | j2==-8)
generate time_regulation=j2
by country city: egen m_time_regulation=mean(time_regulation)

*UNOFFICIAL PAYMENTS (% SALES)
replace j7a=. if (j7a==-9 | j7a==-8)
replace j7b=. if (j7b==-9 | j7b==-8)
replace j7b=(j7b/d2)*100
generate unoff_pay=j7a
replace unoff_pay=j7b if (j7a==.)
by country city: egen m_unoff_pay=mean(unoff_pay)

*CUSTOMS EXPORTS (DAYS)
replace d4=. if (d4==-9 | d4==-8)
generate customs_exp=d4
by country city: egen m_customs_exp=mean(customs_exp)

*CUSTOMS IMPORTS (DAYS)
replace d14=. if (d14==-9 | d14==-8)
generate customs_imp=d14
by country city: egen m_customs_imp=mean(customs_imp)

*ELECTRICITY
replace c7=. if (c7==-9 | c7==-8)
generate n_powerloss=c7
by country city: egen m_n_powerloss=mean(n_powerloss)

replace c9a=. if (c9a==-9 | c9a==-8)
replace c9b=. if (c9b==-9 | c9b==-8)
replace c9b=(c9b/d2)*100
generate a_powerloss=c9a
replace a_powerloss=c9b if (c9a==.)
by country city: egen m_a_powerloss=mean(a_powerloss)

replace c11=. if (c11==-9 | c11==-8)
generate a_generator=c11
by country city: egen m_a_generator=mean(a_generator)

*PHONE
replace c20=. if (c20==-9 | c20==-8)
generate days_phone=c20
by country city: egen m_days_phone=mean(days_phone)

*WATER (% FROM PUBLIC SOURCE)
replace c18=. if (c18==-9 | c18==-8)
generate pub_water=c18
by country city: egen m_pub_water=mean(pub_water)

*FINANCE
replace k3bc=. if (k3bc<0)
generate share_bank_wk=k3bc
by country city: egen m_share_bank_wk=mean(share_bank_wk)

replace k5bc=. if (k5bc==-9 | k5bc==-8)
generate share_bank_k=k5bc
by country city: egen m_share_bank_k=mean(share_bank_k)

replace k7=. if (k7==-9 | k7==-8)
generate overdraft=k7
by country city: egen m_overdraft=mean(overdraft)

replace k6=. if (k6==-9 | k6==-8)
generate check_savg=k6
by country city: egen m_check_savg=mean(check_savg)

replace k30=. if (k30<0)
generate finance=k30
by country city: egen m_finance=mean(finance)

*STABILITY
replace j30e=. if (j30e<0)
generate stability=j30e
by country city: egen m_stability=mean(stability)

*INFORMAL
replace e30=. if (e30<0)
generate informal=e30
by country city: egen m_informal=mean(informal)

*CORRRUPTION
replace j30f=. if (j30f<0)
generate corrupt=j30f
by country city: egen m_corrupt=mean(corrupt)

*INFRASTRUCTURE
replace c30a=. if (c30a<0)
generate elec=c30a
by country city: egen m_elec=mean(elec)
replace d30a=. if (d30a<0)
generate transport=d30a
by country city: egen m_transport=mean(transport)
generate infrastructure=((0.5*elec)+(0.5*transport))
by country city: egen m_infrastructure=mean(infrastructure)

*TRADE
replace d30b=. if (d30b<0)
generate trade=d30b
by country city: egen m_trade=mean(trade)

*TAX
replace j30a=. if (j30a<0)
generate taxrate=j30a
by country city: egen m_taxrate=mean(taxrate)
replace j30b=. if (j30b<0)
generate taxadm=j30b
by country city: egen m_taxadm=mean(taxadm)
generate tax1=((0.5*taxrate)+(0.5*taxadm))
by country city: egen m_tax1=mean(tax1)

*OPENING
replace j30c=. if (j30c<0)
generate opening=j30c
by country city: egen m_opening=mean(opening)

*LABOR
replace l30a=. if (l30a<0)
generate labor=l30a
by country city: egen m_labor=mean(labor)

*COURTS
replace h30=. if (h30<0)
generate courts=h30
by country city: egen m_courts=mean(courts)

*CRIME
replace i30=. if (i30<0)
generate crime=i30
by country city: egen m_crime=mean(crime)

*TRAINNING
replace l10=. if (l10<0)
generate trainning=l10

*DOMESTIC SUPPLIES
replace d12a=. if (d12a<0)
generate domsupply=(d12a/100)

*DOMESTIC SALES
replace d3a=. if (d3a<0)
generate domsale=(d3a/100)

*SIZE
replace a6b=. if (a6b<0)
gen size=a6b+1
gen ln_size=log(size)

*AGE
replace b5=. if b5<0
generate age=.
replace age=2007-b5 if year==2006
replace age=2011-b5 if year==2010
gen ln_age=log(age)
generate age2=age^2
gen ln_age_2=log(age2)

*DOMESTIC OWNERSHIP
replace b2a=. if (b2a<0)
generate domown=(b2a/100)

*CAPACITY UTILIZATION
replace f1=. if (f1<0)
generate capacityu=(f1/100)
by country city: egen m_capacityu=mean(capacityu)

*FEMALE (OWNER)
replace b4=. if (b4<0)
generate female=b4
replace female=0 if b4==2

*YEARS OF EXPERIENCE (OWNER)
replace b7=. if (b7<0)
generate yearsexp=ln(b7)

*OTHER VARIABLES
*% Sales of main product
replace d1a3=. if (d1a3<0)
generate sales_main_prod=d1a3

*% Sales exports
replace d3a=. if (d3a<0)
generate export_sales=100-d3a

*Dummies
gen Bolivia_logK=0
replace Bolivia_logK=k if (country=="Bolivia")
gen Chile_logK=0
replace Chile_logK=k if (country=="Chile")
gen Colombia_logK=0
replace Colombia_logK=k if (country=="Colombia")
gen Ecuador_logK=0
replace Ecuador_logK=k if (country=="Ecuador")
gen ElSalvador_logK=0
replace ElSalvador_logK=k if (country=="ElSalvador")
gen Guatemala_logK=0
replace Guatemala_logK=k if (country=="Guatemala")
gen Mexico_logK=0
replace Mexico_logK=k if (country=="Mexico")
gen Panama_logK=0
replace Panama_logK=k if (country=="Panama")
gen Paraguay_logK=0
replace Paraguay_logK=k if (country=="Paraguay")
gen Peru_logK=0
replace Peru_logK=k if (country=="Peru")
gen Uruguay_logK=0
replace Uruguay_logK=k if (country=="Uruguay")

gen Bolivia_logL=0
replace Bolivia_logL=lw if (country=="Bolivia")
gen Chile_logL=0
replace Chile_logL=lw if (country=="Chile")
gen Colombia_logL=0
replace Colombia_logL=lw if (country=="Colombia")
gen Ecuador_logL=0
replace Ecuador_logL=lw if (country=="Ecuador")
gen ElSalvador_logL=0
replace ElSalvador_logL=lw if (country=="ElSalvador")
gen Guatemala_logL=0
replace Guatemala_logL=lw if (country=="Guatemala")
gen Mexico_logL=0
replace Mexico_logL=lw if (country=="Mexico")
gen Panama_logL=0
replace Panama_logL=lw if (country=="Panama")
gen Paraguay_logL=0
replace Paraguay_logL=lw if (country=="Paraguay")
gen Peru_logL=0
replace Peru_logL=lw if (country=="Peru")
gen Uruguay_logL=0
replace Uruguay_logL=lw if (country=="Uruguay")


gen ln_m_customs_exp=log(m_customs_exp)
gen ln_m_customs_imp=log(m_customs_imp)
gen ln_m_n_powerloss=log(m_n_powerloss)
gen ln_m_days_phone=log(m_days_phone)
gen ln_m_overdraft=log(m_overdraft)
gen ln_m_share_bank_wk=log(m_share_bank_wk)
gen ln_m_stability=log(m_stability)
gen ln_m_informal=log(m_informal)
gen ln_m_corrupt=log(m_corrupt)
gen ln_m_trade=log(m_trade)
gen ln_m_tax1=log(m_tax1)
gen ln_m_opening=log(m_opening)
gen ln_m_labor=log(m_labor)
gen ln_m_finance=log(m_finance)
gen ln_m_courts=log(m_courts)
gen ln_m_crime=log(m_crime)
gen ln_m_infrastructure=log(m_infrastructure)
gen ln_capacityu=log(capacityu)
gen ln_eduworker=log(eduworker)

gen profit_employee=PROFIT/LW
gen ln_profit_employee=ln(profit_employee)

*SALES growth rate
*option1
gen sales_growth_rate=.
replace sales_growth_rate=(Y-Y_lagged)/Y_lagged
gen ln_sales_growth=ln(sales_growth)
*option2
gen sales2010=.
replace sales2010=Y if year==2010
gen sales2006=.
replace sales2006=Y if year==2006
sort idpanel
by idpanel: egen sales1=max(sales2010)
by idpanel: egen sales2=max(sales2006)
gen sales3=.
replace sales3=(sales1-sales2)/sales2 if (year==2010 & sales1~=. & sales2~=.)
replace sales3=(sales2-Y_lagged)/Y_lagged if (year==2006 & sales1~=. & sales2~=.)
replace sales3=(sales1-Y_lagged)/Y_lagged if (sales2==. & year==2010)
replace sales3=(sales2-Y_lagged)/Y_lagged if (sales1==. & year==2006)
gen sales_growth_rate2=sales3
gen ln_sales_growth_rate2=ln(sales_growth_rate2)
gen sales_gr=.
replace sales_gr=0 if (sales_growth_rate2<0 & sales_growth_rate2~=.)
replace sales_gr=1 if (sales_growth_rate2>=0 & sales_growth_rate2~=.)
gen Y_lagged2=.
replace Y_lagged2=sales2 if (year==2010 & sales1~=. & sales2~=.)
replace Y_lagged2=Y_lagged if (year==2006 & sales1~=. & sales2~=.)
replace Y_lagged2=Y_lagged if (sales2==. & year==2010)
replace Y_lagged2=Y_lagged if (sales1==. & year==2006)
gen y_lagged2=ln(Y_lagged2)

gen temp=d1a2
tostring temp, replace
gen industry_dummy=substr(temp,1,2)
destring industry_dummy, replace

*EMPLOYMENT growth rates
*option1
gen emp_growth_rate=.
replace emp_growth_rate=(l1-l2)/l2
gen ln_emp_growth=ln(emp_growth_rate)
*option2
gen emp2010=.
replace emp2010=l1 if year==2010
gen emp2006=.
replace emp2006=l1 if year==2006
sort idpanel
by idpanel: egen emp1=max(emp2010)
by idpanel: egen emp2=max(emp2006)
gen emp3=.
replace emp3=(emp1-emp2)/emp2 if (year==2010 & emp1~=. & emp2~=.)
replace emp3=(emp2-l2)/l2 if (year==2006 & emp1~=. & emp2~=.)
replace emp3=(emp1-l2)/l2 if (emp2==. & year==2010)
replace emp3=(emp2-l2)/l2 if (emp1==. & year==2006)
gen emp_growth_rate2=emp3
gen ln_emp_growth_rate2=ln(emp_growth_rate2)
gen emp_gr=.
replace emp_gr=0 if (emp_growth_rate2<0 & emp_growth_rate2~=.)
replace emp_gr=1 if (emp_growth_rate2>=0 & emp_growth_rate2~=.)
gen l2_lagged=.
replace l2_lagged=emp2 if (year==2010 & emp1~=. & emp2~=.)
replace l2_lagged=l2 if (year==2006 & emp1~=. & emp2~=.)
replace l2_lagged=l2 if (emp2==. & year==2010)
replace l2_lagged=l2 if (emp1==. & year==2006)
gen ln_l2_lagged=ln(l2_lagged)
*/


*USING NEW INVESTMENT CLIMATE VARIABLES (3: EXCLUDING 1810)

*===INDEPENDET VARIABLES

*CITY
sort country
by country: tab a3ax
replace a3ax="Valparaiso" if a3ax=="Valparaíso"
replace a3ax="Rest of the country" if (a3ax=="Resto del pais" & country=="ElSalvador")
replace a3ax="rest_country_SLV" if (a3ax=="Rest of the country" & country=="ElSalvador")
replace a3ax="Rest of the country" if (a3ax=="Resto del pais" & country=="Guatemala")
replace a3ax="rest_country_GTM" if (a3ax=="Rest of the country" & country=="Guatemala")
replace a3ax="rest_country_PAN" if (a3ax=="Rest of the country" & country=="Panama")
rename a3ax city
by country: tab city

*POPULATION
gen population=.
*Province (Population 2010-10-27 Census)
replace population=15625084 if city=="Buenos Aires"
replace population=1055259 if city=="Chaco"
replace population=3528700 if city=="Cordoba"
replace population=3308876 if city=="Mendoza"
replace population=1193605 if city=="Rosario"
*Department (Population 2012-11-21 Census)
replace population=1762761 if city=="Cochabamba"
replace population=2719344 if city=="La Paz"
replace population=2657762 if city=="Santa Cruz"
*Region (Population P 2014-07-01 Census)
replace population=613300 if city=="Antofagasta"
replace population=2100500 if city=="Bío Bío"
replace population=834700 if city=="Los Lagos"
replace population=7228600 if city=="Santiago"
replace population=1808300 if city=="Valparaiso"
*Department (Population P 2014-07-01 Census)
replace population=2432000 if city=="Barranquilla"
replace population=7776800 if city=="Bogota"
replace population=4566900 if city=="Cali"
replace population=6378100 if city=="Medellin"
*Provinces (Population P 2014-07-01 Census)
replace population=796200 if city=="Azuay"
replace population=4024900 if city=="Guayas"
replace population=2891500 if city=="Pichincha"
*Departments (Population P 2014-06-30 Census)
replace population=1753100 if city=="San Salvador"
replace population=357546.15 if city=="rest_country_SLV"
*Departments (Population P 2014-06-30 Census)
replace population=3207600 if city=="Guatemala City"
replace population=565052.38 if city=="rest_country_GTM"
*States (Population Cf 2010-05-31 Census)
replace population=3406465 if city=="Chihuahua"
replace population=3406465 if city=="Coahuila"
replace population=2748391 if city=="Coahuila de Zaragoza"
replace population=15175862 if city=="Estado de Mexico"
replace population=5486372 if city=="Guanajuato"
replace population=7350682 if city=="Jalisco"
replace population=8851080 if city=="Mexico DF"
replace population=4653458 if city=="Nuevo Leon"
replace population=5779829 if city=="Puebla"
replace population=7643194 if city=="Veracruz"
*Provinces (Population Cf 2010-05-16 Census)
replace population=241928 if city=="Colon"
replace population=1713070 if city=="Panama City"
replace population=145081.5 if city=="rest_country_PAN"
*Provinces (Population P 2010 Census)
replace population=518200 if city=="Asuncion"
replace population=518200 if city=="Central"
*Regions (Population C 2007-10-21 Census)
replace population=1152303 if city=="Arequipa"
replace population=1112868 if city=="Chiclayo"
replace population=8445211 if city=="Lima"
replace population=1617050 if city=="Trujillo"
*Departments (Population Cf 2011-09-01 Census)
replace population=520187 if city=="Canelones"
replace population=1319108 if city=="Montevideo"
gen log_population=log(population)

*DISTANCE_PORT
gen distance_port=.
*Province (Distance_port 2010-10-27 Census)
replace distance_port=0 if city=="Buenos Aires"
replace distance_port=1000 if city=="Chaco"
replace distance_port=650 if city=="Cordoba"
replace distance_port=260 if city=="Mendoza"
replace distance_port=300 if city=="Rosario"
*Department (Distance_port 2012-11-21 Census)
replace distance_port=500 if city=="Cochabamba"
replace distance_port=450 if city=="La Paz"
replace distance_port=800 if city=="Santa Cruz"
*Region (Distance_port P 2014-07-01 Census)
replace distance_port=0 if city=="Antofagasta"
replace distance_port=0 if city=="Bío Bío"
replace distance_port=0 if city=="Los Lagos"
replace distance_port=0 if city=="Santiago"
replace distance_port=0 if city=="Valparaiso"
*Department (Distance_port P 2014-07-01 Census)
replace distance_port=0 if city=="Barranquilla"
replace distance_port=350 if city=="Bogota"
replace distance_port=0 if city=="Cali"
replace distance_port=300 if city=="Medellin"
*Provinces (Distance_port P 2014-07-01 Census)
replace distance_port=110 if city=="Azuay"
replace distance_port=0 if city=="Guayas"
replace distance_port=180 if city=="Pichincha"
*Departments (Distance_port P 2014-06-30 Census)
replace distance_port=0 if city=="San Salvador"
replace distance_port=0 if city=="rest_country_SLV"
*Departments (Distance_port P 2014-06-30 Census)
replace distance_port=0 if city=="Guatemala City"
replace distance_port=0 if city=="rest_country_GTM"
*States (Distance_port Cf 2010-05-31 Census)
replace distance_port=600 if city=="Chihuahua"
replace distance_port=600 if city=="Coahuila"
replace distance_port=700 if city=="Coahuila de Zaragoza"
replace distance_port=280 if city=="Estado de Mexico"
replace distance_port=330 if city=="Guanajuato"
replace distance_port=150 if city=="Jalisco"
replace distance_port=320 if city=="Mexico DF"
replace distance_port=390 if city=="Nuevo Leon"
replace distance_port=200 if city=="Puebla"
replace distance_port=0 if city=="Veracruz"
*Provinces (Distance_port Cf 2010-05-16 Census)
replace distance_port=0 if city=="Colon"
replace distance_port=0 if city=="Panama City"
replace distance_port=0 if city=="rest_country_PAN"
*Provinces (Distance_port P 2010 Census)
replace distance_port=900 if city=="Asuncion"
replace distance_port=900 if city=="Central"
*Regions (Distance_port C 2007-10-21 Census)
replace distance_port=250 if city=="Arequipa"
replace distance_port=0 if city=="Chiclayo"
replace distance_port=0 if city=="Lima"
replace distance_port=0 if city=="Trujillo"
*Departments (Distance_port Cf 2011-09-01 Census)
replace distance_port=0 if city=="Canelones"
replace distance_port=0 if city=="Montevideo"
gen log_distance_port=log(distance_port)
replace log_distance_port=0 if (log_distance_port==.)

*DISTANCE_MARKET
gen distance_market=.
*Province (Distance_market 2010-10-27 Census)
replace distance_market=8300 if city=="Buenos Aires"
replace distance_market=7400 if city=="Chaco"
replace distance_market=7900 if city=="Cordoba"
replace distance_market=8000 if city=="Mendoza"
replace distance_market=8100 if city=="Rosario"
*Department (Distance_market 2012-11-21 Census)
replace distance_market=6300 if city=="Cochabamba"
replace distance_market=6200 if city=="La Paz"
replace distance_market=6500 if city=="Santa Cruz"
*Region (Distance_market P 2014-07-01 Census)
replace distance_market=6900 if city=="Antofagasta"
replace distance_market=8400 if city=="Bío Bío"
replace distance_market=8900 if city=="Los Lagos"
replace distance_market=8000 if city=="Santiago"
replace distance_market=7900 if city=="Valparaiso"
*Department (Distance_market P 2014-07-01 Census)
replace distance_market=3100 if city=="Barranquilla"
replace distance_market=3800 if city=="Bogota"
replace distance_market=3900 if city=="Cali"
replace distance_market=3600 if city=="Medellin"
*Provinces (Distance_market P 2014-07-01 Census)
replace distance_market=4600 if city=="Azuay"
replace distance_market=4500 if city=="Guayas"
replace distance_market=4300 if city=="Pichincha"
*Departments (Distance_market P 2014-06-30 Census)
replace distance_market=3000 if city=="San Salvador"
replace distance_market=3000 if city=="rest_country_SLV"
*Departments (Distance_market P 2014-06-30 Census)
replace distance_market=2900 if city=="Guatemala City"
replace distance_market=2900 if city=="rest_country_GTM"
*States (Distance_market Cf 2010-05-31 Census)
replace distance_market=2800 if city=="Chihuahua"
replace distance_market=2600 if city=="Coahuila"
replace distance_market=2400 if city=="Coahuila de Zaragoza"
replace distance_market=3000 if city=="Estado de Mexico"
replace distance_market=3000 if city=="Guanajuato"
replace distance_market=3200 if city=="Jalisco"
replace distance_market=3000 if city=="Mexico DF"
replace distance_market=2600 if city=="Nuevo Leon"
replace distance_market=2900 if city=="Puebla"
replace distance_market=2800 if city=="Veracruz"
*Provinces (Distance_market Cf 2010-05-16 Census)
replace distance_market=3200 if city=="Colon"
replace distance_market=3300 if city=="Panama City"
replace distance_market=3300 if city=="rest_country_PAN"
*Provinces (Distance_market P 2010 Census)
replace distance_market=7400 if city=="Asuncion"
replace distance_market=7400 if city=="Central"
*Regions (Distance_market C 2007-10-21 Census)
replace distance_market=6100 if city=="Arequipa"
replace distance_market=5000 if city=="Chiclayo"
replace distance_market=5600 if city=="Lima"
replace distance_market=5200 if city=="Trujillo"
*Departments (Distance_market Cf 2011-09-01 Census)
replace distance_market=8400 if city=="Canelones"
replace distance_market=8450 if city=="Montevideo"
gen log_distance_market=log(distance_market)

*COUNTRY GDP (GDP per capita (constant 2005 US$) - 2008
/*
gen gdp=.
replace gdp=6195.4 if country=="Argentina"
replace gdp=1129.5  if country=="Bolivia"
replace gdp=8382.3 if country=="Chile"
replace gdp=3832.5 if country=="Colombia"
replace gdp=3245.4 if country=="Ecuador"
replace gdp=1646.0 if country=="Paraguay"
replace gdp=3335.2 if country=="Peru"
replace gdp=6162.8 if country=="Uruguay"
gen ln_gdp=log(gdp)
*/
*assuming different GDP in 2006 and 2010
gen gdp=.
replace gdp=6195.4 if country_year=="Argentina2006"
replace gdp=10368.4555595933 if country_year=="Argentina2010"
replace gdp=1051.47175616328 if country_year=="Bolivia2006"
replace gdp=1176.9744750324 if country_year=="Bolivia2010"
replace gdp=7869.60422243812 if country_year=="Chile2006"
replace gdp=8610.02204254411 if country_year=="Chile2010"
replace gdp=3565.88638893629 if country_year=="Colombia2006"
replace gdp=3937.86720135467 if country_year=="Colombia2010"
replace gdp=3090.15946014973 if country_year=="Ecuador2006"
replace gdp=3268.81379042526 if country_year=="Ecuador2010"
replace gdp=1522.00663722925 if country_year=="Paraguay2006"
replace gdp=1725.79480030659 if country_year=="Paraguay2010"
replace gdp=2875.69480185211 if country_year=="Peru2006"
replace gdp=3575.40973236373 if country_year=="Peru2010"
replace gdp=5427.42514206169 if country_year=="Uruguay2006"
replace gdp=6791.05041499911 if country_year=="Uruguay2010"
gen ln_gdp=log(gdp)

sort country city

*INSPECTIONS PER YEAR
replace j4=. if (j4==-9 | j4==-8)
generate num_insp=j4 if (d1a2!=1810)
by country city: egen m_num_insp=mean(num_insp)

*TIME DEALING WITH REGULATIONS (% IN A WEEK)
replace j2=. if (j2==-9 | j2==-8)
generate time_regulation=j2 if (d1a2!=1810)
by country city: egen m_time_regulation=mean(time_regulation)

*UNOFFICIAL PAYMENTS (% SALES)
replace j7a=. if (j7a==-9 | j7a==-8)
replace j7b=. if (j7b==-9 | j7b==-8)
replace j7b=(j7b/d2)*100
generate unoff_pay=j7a if (d1a2!=1810)
replace unoff_pay=j7b if (j7a==.)
by country city: egen m_unoff_pay=mean(unoff_pay)

*CUSTOMS EXPORTS (DAYS)
replace d4=. if (d4==-9 | d4==-8)
generate customs_exp=d4 if (d1a2!=1810)
by country city: egen m_customs_exp=mean(customs_exp)

*CUSTOMS IMPORTS (DAYS)
replace d14=. if (d14==-9 | d14==-8)
generate customs_imp=d14 if (d1a2!=1810)
by country city: egen m_customs_imp=mean(customs_imp)

*ELECTRICITY
replace c7=. if (c7==-9 | c7==-8)
generate n_powerloss=c7 if (d1a2!=1810)
by country city: egen m_n_powerloss=mean(n_powerloss)

replace c9a=. if (c9a==-9 | c9a==-8)
replace c9b=. if (c9b==-9 | c9b==-8)
replace c9b=(c9b/d2)*100
generate a_powerloss=c9a if (d1a2!=1810)
replace a_powerloss=c9b if (c9a==.)
by country city: egen m_a_powerloss=mean(a_powerloss)

replace c11=. if (c11==-9 | c11==-8)
generate a_generator=c11 if (d1a2!=1810)
by country city: egen m_a_generator=mean(a_generator)

*PHONE
replace c20=. if (c20==-9 | c20==-8)
generate days_phone=c20 if (d1a2!=1810)
by country city: egen m_days_phone=mean(days_phone)

*WATER (% FROM PUBLIC SOURCE)
replace c18=. if (c18==-9 | c18==-8)
generate pub_water=c18 if (d1a2!=1810)
by country city: egen m_pub_water=mean(pub_water)

*FINANCE
replace k3bc=. if (k3bc<0)
generate share_bank_wk=k3bc if (d1a2!=1810)
by country city: egen m_share_bank_wk=mean(share_bank_wk)

replace k5bc=. if (k5bc<0)
generate share_bank_k=k5bc if (d1a2!=1810)
by country city: egen m_share_bank_k=mean(share_bank_k)

replace k7=. if (k7<0)
generate overdraft=k7 if (d1a2!=1810)
by country city: egen m_overdraft=mean(overdraft)

replace k6=. if (k6<0)
generate check_savg=k6 if (d1a2!=1810)
by country city: egen m_check_savg=mean(check_savg)

replace k30=. if (k30<0)
generate finance=k30 if (d1a2!=1810)
by country city: egen m_finance=mean(finance)

*STABILITY
replace j30e=. if (j30e<0)
generate stability=j30e if (d1a2!=1810)
by country city: egen m_stability=mean(stability)

*INFORMAL
replace e30=. if (e30<0)
generate informal=e30 if (d1a2!=1810)
by country city: egen m_informal=mean(informal)

*CORRRUPTION
replace j30f=. if (j30f<0)
generate corrupt=j30f if (d1a2!=1810)
by country city: egen m_corrupt=mean(corrupt)

*INFRASTRUCTURE
replace c30a=. if (c30a<0)
generate elec=c30a if (d1a2!=1810)
by country city: egen m_elec=mean(elec)
replace d30a=. if (d30a<0)
generate transport=d30a if (d1a2!=1810)
by country city: egen m_transport=mean(transport)
generate infrastructure=((0.5*elec)+(0.5*transport)) if (d1a2!=1810)
by country city: egen m_infrastructure=mean(infrastructure)

*TRADE
replace d30b=. if (d30b<0)
generate trade=d30b if (d1a2!=1810)
by country city: egen m_trade=mean(trade)

*TAX
replace j30a=. if (j30a<0)
generate taxrate=j30a if (d1a2!=1810)
by country city: egen m_taxrate=mean(taxrate)
replace j30b=. if (j30b<0)
generate taxadm=j30b if (d1a2!=1810)
by country city: egen m_taxadm=mean(taxadm)
generate tax1=((0.5*taxrate)+(0.5*taxadm)) if (d1a2!=1810)
by country city: egen m_tax1=mean(tax1)

*OPENING
replace j30c=. if (j30c<0)
generate opening=j30c if (d1a2!=1810)
by country city: egen m_opening=mean(opening)

*LABOR
replace l30a=. if (l30a<0)
generate labor=l30a if (d1a2!=1810)
by country city: egen m_labor=mean(labor)

*COURTS
replace h30=. if (h30<0)
generate courts=h30 if (d1a2!=1810)
by country city: egen m_courts=mean(courts)

*CRIME
replace i30=. if (i30<0)
generate crime=i30 if (d1a2!=1810)
by country city: egen m_crime=mean(crime)

*TRAINNING
replace l10=. if (l10<0)
generate trainning=l10

*DOMESTIC SUPPLIES
replace d12a=. if (d12a<0)
generate domsupply=(d12a/100)

*DOMESTIC SALES
replace d3a=. if (d3a<0)
generate domsale=(d3a/100)

*SIZE
replace a6b=. if (a6b<0)
gen size2=a6b+1
gen ln_size2=log(size2)

*AGE
replace b5=. if b5<0
generate age=.
replace age=2007-b5 if year==1
replace age=2011-b5 if year==2
gen ln_age=log(age)
generate age2=age^2
gen ln_age_2=log(age2)

*DOMESTIC OWNERSHIP
replace b2a=. if (b2a<0)
generate domown=(b2a/100)

*CAPACITY UTILIZATION
replace f1=. if (f1<0)
generate capacityu=f1 if (d1a2!=1810)
replace capacityu=(f1/100)
by country city: egen m_capacityu=mean(capacityu)

*FEMALE (OWNER)
replace b4=. if (b4<0)
generate female=b4
replace female=0 if b4==2

*YEARS OF EXPERIENCE (OWNER)
replace b7=. if (b7<0)
generate yearsexp=ln(b7)

*OTHER VARIABLES
*% Sales of main product
replace d1a3=. if (d1a3<0)
generate sales_main_prod=d1a3

*% Sales exports
replace d3a=. if (d3a<0)
generate export_sales=100-d3a

*Dummies
gen Bolivia_logK=0
replace Bolivia_logK=k if (country=="Bolivia")
gen Chile_logK=0
replace Chile_logK=k if (country=="Chile")
gen Colombia_logK=0
replace Colombia_logK=k if (country=="Colombia")
gen Ecuador_logK=0
replace Ecuador_logK=k if (country=="Ecuador")
gen ElSalvador_logK=0
replace ElSalvador_logK=k if (country=="ElSalvador")
gen Guatemala_logK=0
replace Guatemala_logK=k if (country=="Guatemala")
gen Mexico_logK=0
replace Mexico_logK=k if (country=="Mexico")
gen Panama_logK=0
replace Panama_logK=k if (country=="Panama")
gen Paraguay_logK=0
replace Paraguay_logK=k if (country=="Paraguay")
gen Peru_logK=0
replace Peru_logK=k if (country=="Peru")
gen Uruguay_logK=0
replace Uruguay_logK=k if (country=="Uruguay")

gen Bolivia_logL=0
replace Bolivia_logL=lw if (country=="Bolivia")
gen Chile_logL=0
replace Chile_logL=lw if (country=="Chile")
gen Colombia_logL=0
replace Colombia_logL=lw if (country=="Colombia")
gen Ecuador_logL=0
replace Ecuador_logL=lw if (country=="Ecuador")
gen ElSalvador_logL=0
replace ElSalvador_logL=lw if (country=="ElSalvador")
gen Guatemala_logL=0
replace Guatemala_logL=lw if (country=="Guatemala")
gen Mexico_logL=0
replace Mexico_logL=lw if (country=="Mexico")
gen Panama_logL=0
replace Panama_logL=lw if (country=="Panama")
gen Paraguay_logL=0
replace Paraguay_logL=lw if (country=="Paraguay")
gen Peru_logL=0
replace Peru_logL=lw if (country=="Peru")
gen Uruguay_logL=0
replace Uruguay_logL=lw if (country=="Uruguay")


gen ln_m_customs_exp=log(m_customs_exp)
gen ln_m_customs_imp=log(m_customs_imp)
gen ln_m_n_powerloss=log(m_n_powerloss)
gen ln_m_days_phone=log(m_days_phone)
gen ln_m_overdraft=log(m_overdraft)
gen ln_m_share_bank_wk=log(m_share_bank_wk)
gen ln_m_share_bank_k=log(m_share_bank_k)
gen ln_m_check_savg=log(m_check_savg)
gen ln_m_stability=log(m_stability)
gen ln_m_informal=log(m_informal)
gen ln_m_corrupt=log(m_corrupt)
gen ln_m_trade=log(m_trade)
gen ln_m_tax1=log(m_tax1)
gen ln_m_opening=log(m_opening)
gen ln_m_labor=log(m_labor)
gen ln_m_finance=log(m_finance)
gen ln_m_courts=log(m_courts)
gen ln_m_crime=log(m_crime)
gen ln_m_infrastructure=log(m_infrastructure)
gen ln_capacityu=log(capacityu)
gen ln_eduworker=log(eduworker)

gen profit_employee=PROFIT/LW
gen ln_profit_employee=ln(profit_employee)

gen temp=d1a2
tostring temp, replace
gen industry_dummy=substr(temp,1,2)
destring industry_dummy, replace

*Alternatives for calculating IC variables
/*
*Country city year

sort country city year
replace k3bc=. if (k3bc==-9 | k3bc==-8)
generate share_bank_wk2=k3bc
by country city year: egen m_share_bank_wk2=mean(share_bank_wk2)

replace j30e=. if (j30e<0)
generate stability2=j30e
by country city year: egen m_stability2=mean(stability2)

replace e30=. if (e30<0)
generate informal2=e30
by country city year: egen m_informal2=mean(informal2)

replace j30f=. if (j30f<0)
generate corrupt2=j30f
by country city year: egen m_corrupt2=mean(corrupt2)

replace c30a=. if (c30a<0)
generate elec2=c30a
by country city year: egen m_elec2=mean(elec2)
replace d30a=. if (d30a<0)
generate transport2=d30a
by country city year: egen m_transport2=mean(transport2)
generate infrastructure2=((0.5*elec2)+(0.5*transport2))
by country city year: egen m_infrastructure2=mean(infrastructure2)

replace d30b=. if (d30b<0)
generate trade2=d30b
by country city year: egen m_trade2=mean(trade2)

replace j30a=. if (j30a<0)
generate taxrate2=j30a
by country city year: egen m_taxrate2=mean(taxrate2)
replace j30b=. if (j30b<0)
generate taxadm2=j30b
by country city year: egen m_taxadm2=mean(taxadm2)
generate tax12=((0.5*taxrate2)+(0.5*taxadm2))
by country city year: egen m_tax12=mean(tax12)

replace j30c=. if (j30c<0)
generate opening2=j30c
by country city year: egen m_opening2=mean(opening2)

replace l30a=. if (l30a<0)
generate labor2=l30a
by country city year: egen m_labor2=mean(labor2)

replace h30=. if (h30<0)
generate courts2=h30
by country city year: egen m_courts2=mean(courts2)

replace i30=. if (i30<0)
generate crime2=i30
by country city year: egen m_crime2=mean(crime2)

replace f1=. if (f1<0)
generate capacityu2=(f1/100)
by country city year: egen m_capacityu2=mean(capacityu2)

gen ln_m_share_bank_wk2=log(m_share_bank_wk2)
gen ln_m_stability2=log(m_stability2)
gen ln_m_informal2=log(m_informal2)
gen ln_m_corrupt2=log(m_corrupt2)
gen ln_m_trade2=log(m_trade2)
gen ln_m_tax12=log(m_tax12)
gen ln_m_opening2=log(m_opening2)
gen ln_m_labor2=log(m_labor2)
gen ln_m_courts2=log(m_courts2)
gen ln_m_crime2=log(m_crime2)
gen ln_m_infrastructure2=log(m_infrastructure2)
gen ln_capacityu2=log(capacityu2)
*/

*Convert to 0 to 1 and combine macro and micro indicators
gen m_opening_DB=.
replace m_opening_DB=1-0.7202 if country_year=="Argentina2006"
replace m_opening_DB=1-0.7225 if country_year=="Argentina2010"
replace m_opening_DB=1-0.4645 if country_year=="Bolivia2006"
replace m_opening_DB=1-0.5441 if country_year=="Bolivia2010"
replace m_opening_DB=1-0.7652 if country_year=="Chile2006"
replace m_opening_DB=1-0.7745 if country_year=="Chile2010"
replace m_opening_DB=1-0.7229 if country_year=="Colombia2006"
replace m_opening_DB=1-0.8367 if country_year=="Colombia2010"
replace m_opening_DB=1-0.5834 if country_year=="Ecuador2006"
replace m_opening_DB=1-0.6167 if country_year=="Ecuador2010"
replace m_opening_DB=1-0.4003 if country_year=="Paraguay2006"
replace m_opening_DB=1-0.7542 if country_year=="Paraguay2010"
replace m_opening_DB=1-0.5701 if country_year=="Peru2006"
replace m_opening_DB=1-0.7615 if country_year=="Peru2010"
replace m_opening_DB=1-0.5914 if country_year=="Uruguay2006"
replace m_opening_DB=1-0.6434 if country_year=="Uruguay2010"
gen m_share_bank_wk_DB=.
replace m_share_bank_wk_DB=1-0.625 if country_year=="Argentina2006"
replace m_share_bank_wk_DB=1-0.625 if country_year=="Argentina2010"
replace m_share_bank_wk_DB=1-0.3125 if country_year=="Bolivia2006"
replace m_share_bank_wk_DB=1-0.375 if country_year=="Bolivia2010"
replace m_share_bank_wk_DB=1-0.5625 if country_year=="Chile2006"
replace m_share_bank_wk_DB=1-0.5625 if country_year=="Chile2010"
replace m_share_bank_wk_DB=1-0.625 if country_year=="Colombia2006"
replace m_share_bank_wk_DB=1-0.625 if country_year=="Colombia2010"
replace m_share_bank_wk_DB=1-0.375 if country_year=="Ecuador2006"
replace m_share_bank_wk_DB=1-0.5 if country_year=="Ecuador2010"
replace m_share_bank_wk_DB=1-0.5625 if country_year=="Paraguay2006"
replace m_share_bank_wk_DB=1-0.5625 if country_year=="Paraguay2010"
replace m_share_bank_wk_DB=1-0.5625 if country_year=="Peru2006"
replace m_share_bank_wk_DB=1-0.8125 if country_year=="Peru2010"
replace m_share_bank_wk_DB=1-0.5625 if country_year=="Uruguay2006"
replace m_share_bank_wk_DB=1-0.625 if country_year=="Uruguay2010"
gen m_stability_GCR=.
replace m_stability_GCR=0.463673341 if country_year=="Argentina2006"
replace m_stability_GCR=0.40788073 if country_year=="Argentina2010"
replace m_stability_GCR=0.822068471 if country_year=="Bolivia2006"
replace m_stability_GCR=0.443258259 if country_year=="Bolivia2010"
replace m_stability_GCR=0 if country_year=="Chile2006"
replace m_stability_GCR=0 if country_year=="Chile2010"
replace m_stability_GCR=0.547891991 if country_year=="Colombia2006"
replace m_stability_GCR=0.336740089 if country_year=="Colombia2010"
replace m_stability_GCR=0.198135417 if country_year=="Ecuador2006"
replace m_stability_GCR=0.408964139 if country_year=="Ecuador2010"
replace m_stability_GCR=0.860938017 if country_year=="Paraguay2006"
replace m_stability_GCR=0.819013275 if country_year=="Paraguay2010"
replace m_stability_GCR=0.512841831 if country_year=="Peru2006"
replace m_stability_GCR=0.616221474 if country_year=="Peru2010"
replace m_stability_GCR=1 if country_year=="Uruguay2006"
replace m_stability_GCR=1 if country_year=="Uruguay2010"
gen m_informal_GCR=.
replace m_informal_GCR=0.725717079 if country_year=="Argentina2006"
replace m_informal_GCR=0.823698341 if country_year=="Argentina2010"
replace m_informal_GCR=0.896066721 if country_year=="Bolivia2006"
replace m_informal_GCR=0.867469417 if country_year=="Bolivia2010"
replace m_informal_GCR=0 if country_year=="Chile2006"
replace m_informal_GCR=0 if country_year=="Chile2010"
replace m_informal_GCR=0.304128898 if country_year=="Colombia2006"
replace m_informal_GCR=0.582454293 if country_year=="Colombia2010"
replace m_informal_GCR=0.668019293 if country_year=="Ecuador2006"
replace m_informal_GCR=0.821031303 if country_year=="Ecuador2010"
replace m_informal_GCR=1 if country_year=="Paraguay2006"
replace m_informal_GCR=1 if country_year=="Paraguay2010"
replace m_informal_GCR=0.548409869 if country_year=="Peru2006"
replace m_informal_GCR=0.698261975 if country_year=="Peru2010"
replace m_informal_GCR=0.335464345 if country_year=="Uruguay2006"
replace m_informal_GCR=0.111479065 if country_year=="Uruguay2010"
gen m_corrupt_GCR=.
replace m_corrupt_GCR=0.840795675 if country_year=="Argentina2006"
replace m_corrupt_GCR=0.958767879 if country_year=="Argentina2010"
replace m_corrupt_GCR=0.881247314 if country_year=="Bolivia2006"
replace m_corrupt_GCR=0.881142041 if country_year=="Bolivia2010"
replace m_corrupt_GCR=0 if country_year=="Chile2006"
replace m_corrupt_GCR=0.069889719 if country_year=="Chile2010"
replace m_corrupt_GCR=0.696991915 if country_year=="Colombia2006"
replace m_corrupt_GCR=0.754214631 if country_year=="Colombia2010"
replace m_corrupt_GCR=0.975710123 if country_year=="Ecuador2006"
replace m_corrupt_GCR=0.889642447 if country_year=="Ecuador2010"
replace m_corrupt_GCR=1 if country_year=="Paraguay2006"
replace m_corrupt_GCR=1 if country_year=="Paraguay2010"
replace m_corrupt_GCR=0.762466031 if country_year=="Peru2006"
replace m_corrupt_GCR=0.675674307 if country_year=="Peru2010"
replace m_corrupt_GCR=0.110280649 if country_year=="Uruguay2006"
replace m_corrupt_GCR=0 if country_year=="Uruguay2010"
gen m_trade_DB=.
replace m_trade_DB=0.5364 if country_year=="Argentina2006"
replace m_trade_DB=0.3834 if country_year=="Argentina2010"
replace m_trade_DB=0.4529 if country_year=="Bolivia2006"
replace m_trade_DB=0.3569 if country_year=="Bolivia2010"
replace m_trade_DB=0.202 if country_year=="Chile2006"
replace m_trade_DB=0.1965 if country_year=="Chile2010"
replace m_trade_DB=0.4595 if country_year=="Colombia2006"
replace m_trade_DB=0.2614 if country_year=="Colombia2010"
replace m_trade_DB=0.4439 if country_year=="Ecuador2006"
replace m_trade_DB=0.3465 if country_year=="Ecuador2010"
replace m_trade_DB=0.4896 if country_year=="Paraguay2006"
replace m_trade_DB=0.4625 if country_year=="Paraguay2010"
replace m_trade_DB=0.2727 if country_year=="Peru2006"
replace m_trade_DB=0.2676 if country_year=="Peru2010"
replace m_trade_DB=0.3433 if country_year=="Uruguay2006"
replace m_trade_DB=0.3128 if country_year=="Uruguay2010"
gen m_tax1_DB=.
replace m_tax1_DB=0.8693 if country_year=="Argentina2006"
replace m_tax1_DB=0.5748 if country_year=="Argentina2010"
replace m_tax1_DB=0.8442 if country_year=="Bolivia2006"
replace m_tax1_DB=0.8443 if country_year=="Bolivia2010"
replace m_tax1_DB=0.1653 if country_year=="Chile2006"
replace m_tax1_DB=0.1653 if country_year=="Chile2010"
replace m_tax1_DB=0.8717 if country_year=="Colombia2006"
replace m_tax1_DB=0.4781 if country_year=="Colombia2010"
replace m_tax1_DB=0.3546 if country_year=="Ecuador2006"
replace m_tax1_DB=0.353 if country_year=="Ecuador2010"
replace m_tax1_DB=0.4606 if country_year=="Paraguay2006"
replace m_tax1_DB=0.363 if country_year=="Paraguay2010"
replace m_tax1_DB=0.2847 if country_year=="Peru2006"
replace m_tax1_DB=0.256 if country_year=="Peru2010"
replace m_tax1_DB=0.6544 if country_year=="Uruguay2006"
replace m_tax1_DB=0.5005 if country_year=="Uruguay2010"
gen m_labor_GCR=.
replace m_labor_GCR=1 if country_year=="Argentina2006"
replace m_labor_GCR=0.767949972 if country_year=="Argentina2010"
replace m_labor_GCR=0.796809957 if country_year=="Bolivia2006"
replace m_labor_GCR=0.984952319 if country_year=="Bolivia2010"
replace m_labor_GCR=0 if country_year=="Chile2006"
replace m_labor_GCR=0 if country_year=="Chile2010"
replace m_labor_GCR=0.467980396 if country_year=="Colombia2006"
replace m_labor_GCR=0.165603054 if country_year=="Colombia2010"
replace m_labor_GCR=0.879003533 if country_year=="Ecuador2006"
replace m_labor_GCR=1 if country_year=="Ecuador2010"
replace m_labor_GCR=0.981151467 if country_year=="Paraguay2006"
replace m_labor_GCR=0.644627248 if country_year=="Paraguay2010"
replace m_labor_GCR=0.586156018 if country_year=="Peru2006"
replace m_labor_GCR=0.084398317 if country_year=="Peru2010"
replace m_labor_GCR=0.538543802 if country_year=="Uruguay2006"
replace m_labor_GCR=0.595696685 if country_year=="Uruguay2010"
gen m_courts_DB=.
replace m_courts_DB=0.3462 if country_year=="Argentina2006"
replace m_courts_DB=0.3462 if country_year=="Argentina2010"
replace m_courts_DB=0.4507 if country_year=="Bolivia2006"
replace m_courts_DB=0.4507 if country_year=="Bolivia2010"
replace m_courts_DB=0.3615 if country_year=="Chile2006"
replace m_courts_DB=0.3615 if country_year=="Chile2010"
replace m_courts_DB=0.6376 if country_year=="Colombia2006"
replace m_courts_DB=0.6376 if country_year=="Colombia2010"
replace m_courts_DB=0.417 if country_year=="Ecuador2006"
replace m_courts_DB=0.417 if country_year=="Ecuador2010"
replace m_courts_DB=0.4179 if country_year=="Paraguay2006"
replace m_courts_DB=0.4179 if country_year=="Paraguay2010"
replace m_courts_DB=0.4694 if country_year=="Peru2006"
replace m_courts_DB=0.426 if country_year=="Peru2010"
replace m_courts_DB=0.4326 if country_year=="Uruguay2006"
replace m_courts_DB=0.4327 if country_year=="Uruguay2010"
gen m_crime_GCR=.
replace m_crime_GCR=0.807491959 if country_year=="Argentina2006"
replace m_crime_GCR=0.47834651 if country_year=="Argentina2010"
replace m_crime_GCR=0.602585885 if country_year=="Bolivia2006"
replace m_crime_GCR=0.378174075 if country_year=="Bolivia2010"
replace m_crime_GCR=0 if country_year=="Chile2006"
replace m_crime_GCR=0.093655283 if country_year=="Chile2010"
replace m_crime_GCR=0.750635064 if country_year=="Colombia2006"
replace m_crime_GCR=1 if country_year=="Colombia2010"
replace m_crime_GCR=1 if country_year=="Ecuador2006"
replace m_crime_GCR=0.481874478 if country_year=="Ecuador2010"
replace m_crime_GCR=0.951350168 if country_year=="Paraguay2006"
replace m_crime_GCR=0.608370233 if country_year=="Paraguay2010"
replace m_crime_GCR=0.925189207 if country_year=="Peru2006"
replace m_crime_GCR=0.533757762 if country_year=="Peru2010"
replace m_crime_GCR=0.341394729 if country_year=="Uruguay2006"
replace m_crime_GCR=0 if country_year=="Uruguay2010"
gen m_infrastructure_GCR=.
replace m_infrastructure_GCR=0.465048674 if country_year=="Argentina2006"
replace m_infrastructure_GCR=0.477763373 if country_year=="Argentina2010"
replace m_infrastructure_GCR=0.943180739 if country_year=="Bolivia2006"
replace m_infrastructure_GCR=0.739530757 if country_year=="Bolivia2010"
replace m_infrastructure_GCR=0 if country_year=="Chile2006"
replace m_infrastructure_GCR=0 if country_year=="Chile2010"
replace m_infrastructure_GCR=0.647572799 if country_year=="Colombia2006"
replace m_infrastructure_GCR=0.494082654 if country_year=="Colombia2010"
replace m_infrastructure_GCR=0.74142654 if country_year=="Ecuador2006"
replace m_infrastructure_GCR=0.678036739 if country_year=="Ecuador2010"
replace m_infrastructure_GCR=1 if country_year=="Paraguay2006"
replace m_infrastructure_GCR=1 if country_year=="Paraguay2010"
replace m_infrastructure_GCR=0.773426319 if country_year=="Peru2006"
replace m_infrastructure_GCR=0.546956805 if country_year=="Peru2010"
replace m_infrastructure_GCR=0.388159892 if country_year=="Uruguay2006"
replace m_infrastructure_GCR=0.1826652 if country_year=="Uruguay2010"

quietly sum m_share_bank_wk
gen m_share_bank_wk3=((m_share_bank_wk-r(min))/(r(max)-r(min)))
quietly sum m_stability
gen m_stability3=((m_stability-r(min))/(r(max)-r(min)))
quietly sum m_informal
gen m_informal3=((m_informal-r(min))/(r(max)-r(min)))
quietly sum m_corrupt
gen m_corrupt3=((m_corrupt-r(min))/(r(max)-r(min)))
quietly sum m_trade
gen m_trade3=((m_trade-r(min))/(r(max)-r(min)))
quietly sum m_tax1
gen m_tax13=((m_tax1-r(min))/(r(max)-r(min)))
quietly sum m_opening
gen m_opening3=((m_opening-r(min))/(r(max)-r(min)))
quietly sum m_labor
gen m_labor3=((m_labor-r(min))/(r(max)-r(min)))
quietly sum m_courts
gen m_courts3=((m_courts-r(min))/(r(max)-r(min)))
quietly sum m_crime
gen m_crime3=((m_crime-r(min))/(r(max)-r(min)))
quietly sum m_infrastructure
gen m_infrastructure3=((m_infrastructure-r(min))/(r(max)-r(min)))

replace m_share_bank_wk3=(0.5*m_share_bank_wk3)+(0.5*m_share_bank_wk_DB)
replace m_stability3=(0.5*m_stability3)+(0.5*m_stability_GCR)
replace m_informal3=(0.5*m_informal3)+(0.5*m_informal_GCR)
replace m_corrupt3=(0.5*m_corrupt3)+(0.5*m_corrupt_GCR)
replace m_trade3=(0.5*m_trade3)+(0.5*m_trade_DB)
replace m_tax13=(0.5*m_tax13)+(0.5*m_tax1_DB)
replace m_opening3=(0.5*m_opening3)+(0.5*m_opening_DB)
replace m_labor3=(0.5*m_labor3)+(0.5*m_labor_GCR)
replace m_courts3=(0.5*m_courts3)+(0.5*m_courts_DB)
replace m_crime3=(0.5*m_crime3)+(0.5*m_crime_GCR)
replace m_infrastructure3=(0.5*m_infrastructure3)+(0.5*m_infrastructure_GCR)

replace m_share_bank_wk3=(0.7*m_share_bank_wk3)+(0.3*m_share_bank_wk_DB)
replace m_stability3=(0.7*m_stability3)+(0.3*m_stability_GCR)
replace m_informal3=(0.7*m_informal3)+(0.3*m_informal_GCR)
replace m_corrupt3=(0.7*m_corrupt3)+(0.3*m_corrupt_GCR)
replace m_trade3=(0.7*m_trade3)+(0.3*m_trade_DB)
replace m_tax13=(0.7*m_tax13)+(0.3*m_tax1_DB)
replace m_opening3=(0.7*m_opening3)+(0.3*m_opening_DB)
replace m_labor3=(0.7*m_labor3)+(0.3*m_labor_GCR)
replace m_courts3=(0.7*m_courts3)+(0.3*m_courts_DB)
replace m_crime3=(0.7*m_crime3)+(0.3*m_crime_GCR)
replace m_infrastructure3=(0.7*m_infrastructure3)+(0.3*m_infrastructure_GCR)

replace m_share_bank_wk3=(0.9*m_share_bank_wk3)+(0.1*m_share_bank_wk_DB)
replace m_stability3=(0.9*m_stability3)+(0.1*m_stability_GCR)
replace m_informal3=(0.9*m_informal3)+(0.1*m_informal_GCR)
replace m_corrupt3=(0.9*m_corrupt3)+(0.1*m_corrupt_GCR)
replace m_trade3=(0.9*m_trade3)+(0.1*m_trade_DB)
replace m_tax13=(0.9*m_tax13)+(0.1*m_tax1_DB)
replace m_opening3=(0.9*m_opening3)+(0.1*m_opening_DB)
replace m_labor3=(0.9*m_labor3)+(0.1*m_labor_GCR)
replace m_courts3=(0.9*m_courts3)+(0.1*m_courts_DB)
replace m_crime3=(0.9*m_crime3)+(0.1*m_crime_GCR)
replace m_infrastructure3=(0.9*m_infrastructure3)+(0.1*m_infrastructure_GCR)

gen ln_m_share_bank_wk3=log(m_share_bank_wk3)
gen ln_m_stability3=log(m_stability3)
gen ln_m_informal3=log(m_informal3)
gen ln_m_corrupt3=log(m_corrupt3)
gen ln_m_trade3=log(m_trade3)
gen ln_m_tax13=log(m_tax13)
gen ln_m_opening3=log(m_opening3)
gen ln_m_labor3=log(m_labor3)
gen ln_m_courts3=log(m_courts3)
gen ln_m_crime3=log(m_crime3)
gen ln_m_infrastructure3=log(m_infrastructure3)
}
