*Production function and TFP
quietly{
*Production Function
xtset idpanel year
*OLS
regress va3 k lw, vce(cluster idpanel)
outreg2 using myreg.doc, replace
*GEE
xtgee va3 k lw
outreg2 using myreg.doc
*RE
xtreg va3 k lw, re vce(cluster idpanel)
outreg2 using myreg.doc
xtreg va3 k lw c.k#country2 c.lw#country2, re vce(cluster idpanel)
outreg2 using myreg.doc
*FE
xtreg va3 k lw, fe vce(cluster idpanel)
outreg2 using myreg.doc
*LP
levpet va3, free(lw) proxy(e) capital(k) valueadded reps(250)
outreg2 using myreg.doc
*ACF
acfest va3, state(k) proxy(e) free(lw) nbs(200) va
outreg2 using myreg.doc
*Stochastic
xtfrontier va3 k lw, tvd iter(100)
outreg2 using myreg.doc
xtset, clear

*TFP
*OLS
xtset idpanel year
regress va3 k lw, vce(cluster idpanel)
generate tfp_ols=va3-((_b[k])*k)-((_b[lw])*lw)
*GEE
xtgee va3 k lw
generate tfp_gee=va3-((_b[k])*k)-((_b[lw])*lw)
*RE
xtreg va3 k lw, re vce(cluster idpanel)
generate tfp_re=va3-((_b[k])*k)-((_b[lw])*lw)
*FE
xtreg va3 k lw, fe vce(cluster idpanel)
generate tfp_fe=va3-((_b[k])*k)-((_b[lw])*lw)
*LP
levpet va3, free(lw) proxy(e) capital(k) valueadded reps(250)
generate tfp_lp=va3-((_b[k])*k)-((_b[lw])*lw)
*ACF
acfest va3, state(k) proxy(e) free(lw) nbs(200) va
generate tfp_acf=va3-((_b[k])*k)-((_b[lw])*lw)
*Stochastic
xtfrontier va3 k lw, tvd iter(100)
generate tfp_stch=va3-((_b[k])*k)-((_b[lw])*lw)
}
sum tfp_ols tfp_gee tfp_re tfp_fe tfp_lp tfp_acf tfp_stch
