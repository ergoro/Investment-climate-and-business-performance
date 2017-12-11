*===Productivity and investment climate
quietly{
xtset idpanel year
xtreg tfp_re ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, re vce(cluster idpanel)
outreg2 using myreg2.doc, replace
xtreg tfp_lp ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, re vce(cluster idpanel)
outreg2 using myreg2.doc
xtreg tfp_acf ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, re vce(cluster idpanel)
outreg2 using myreg2.doc
xtreg tfp_stch ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, re vce(cluster idpanel)
outreg2 using myreg2.doc
xtset, clear

preserve
drop if a6b==3
drop if b2a<100
xtset idpanel year
xtreg tfp_re ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, re vce(cluster idpanel)
outreg2 using myreg2.doc
xtreg tfp_lp ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, re vce(cluster idpanel)
outreg2 using myreg2.doc
xtreg tfp_acf ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, re vce(cluster idpanel)
outreg2 using myreg2.doc
xtreg tfp_stch ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, re vce(cluster idpanel)
outreg2 using myreg2.doc
xtset, clear
restore
}

xtset idpanel year
xtreg tfp_re ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, re vce(cluster idpanel)
test ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime
xtreg tfp_lp ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, re vce(cluster idpanel)
test ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime
xtreg tfp_acf ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, re vce(cluster idpanel)
test ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime
xtreg tfp_stch ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, re vce(cluster idpanel)
test ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime
xtset, clear

preserve
drop if a6b==3
drop if b2a<100
xtset idpanel year
xtreg tfp_re ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, re vce(cluster idpanel)
test ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime
xtreg tfp_lp ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, re vce(cluster idpanel)
test ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime
xtreg tfp_acf ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, re vce(cluster idpanel)
test ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime
xtreg tfp_stch ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, re vce(cluster idpanel)
test ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime
xtset, clear
restore


quietly{
/*
factor ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime, pcf
rotate
keep if (d1a2==1810)
predict ic1 ic2 ic3
xtset idpanel year
xtreg tfp_re ic1 ic2 ic3 log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, re vce(cluster idpanel)
outreg2 using myreg2_2.doc
xtreg tfp_lp ic1 ic2 ic3 log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, re vce(cluster idpanel)
outreg2 using myreg2_2.doc
xtreg tfp_acf ic1 ic2 ic3 log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, re vce(cluster idpanel)
outreg2 using myreg2_2.doc
xtreg tfp_stch ic1 ic2 ic3 log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, re vce(cluster idpanel)
outreg2 using myreg2_2.doc
xtset, clear


*===Productivity and investment climate
quietly{
xtset idpanel year
xtreg tfp_re ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, vce(cluster idpanel)
outreg2 using myreg2.doc
xtreg tfp_lp ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, vce(cluster idpanel)
outreg2 using myreg2.doc
xtreg tfp_acf ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, vce(cluster idpanel)
outreg2 using myreg2.doc
xtreg tfp_stch ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, vce(cluster idpanel)
outreg2 using myreg2.doc
xtset, clear

preserve
drop if a6b==3
drop if b2a<100
xtset idpanel year
xtreg tfp_re ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, vce(cluster idpanel)
outreg2 using myreg2.doc
xtreg tfp_lp ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, vce(cluster idpanel)
outreg2 using myreg2.doc
xtreg tfp_acf ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, vce(cluster idpanel)
outreg2 using myreg2.doc
xtreg tfp_stch ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, vce(cluster idpanel)
outreg2 using myreg2.doc
xtset, clear
restore
}

xtset idpanel year
xtreg tfp_re ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, vce(cluster idpanel)
test ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime
xtreg tfp_lp ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, vce(cluster idpanel)
test ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime
xtreg tfp_acf ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, vce(cluster idpanel)
test ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime
xtreg tfp_stch ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, vce(cluster idpanel)
test ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime
xtset, clear

preserve
drop if a6b==3
drop if b2a<100
xtset idpanel year
xtreg tfp_re ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, vce(cluster idpanel)
test ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime
xtreg tfp_lp ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, vce(cluster idpanel)
test ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime
xtreg tfp_acf ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, vce(cluster idpanel)
test ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime
xtreg tfp_stch ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime log_distance_market log_distance_port log_population ln_age eduworker ln_capacityu i.country2, vce(cluster idpanel)
test ln_m_stability ln_m_infrastructure ln_m_informal ln_m_corrupt ln_m_trade ln_m_tax1 ln_m_opening ln_m_labor ln_m_share_bank_wk ln_m_courts ln_m_crime
xtset, clear
restore
*/
}

