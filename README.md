## Investment-climate-and-business-performance

## 1. Project Overview
This research project executes the analyses below using Stata and Enterprise Surveys data:
1. Estimation of business performance
- Productivity (methods: Ordinary Least Squares (OLS), Generalized Estimated Equation (GEE), Random Effects (RE), Fixed Effects (FE), Levinsohn and Petrin (LP), Ackerberg, Caves and Frazer (ACF) and a non-parametric (Stochastic))
- Average wages
- Profits per employee
2. Estimation of Investment Climate
Using a methodology for avoiding simultaneity bias in subjective Enterprise Survey data.
3. Impact of investment climate on business performance at the firm level
Including an Instrumental Variables procedure

## 2. Data Sources and sample
The data source is the World Bank's Enterprise Survey (ES) dataset for eight countries corresponding to the years 2006 and 2010 (unbalanced panel data). ES provides an extensive array of data at the firm level. For instance, useful information for measuring firms' performance and aspects of the investment climate, among others, could be found. Data is collected from a representative sample of an economy's private sector. Through a stratified random sample process, firms in the manufacturing and services sectors in major cities and localities are selected (data does not include the agricultural sector). More info at Enterprise Surveys (http://www.enterprisesurveys.org), The World Bank.

After cleaning procedure (including post-estmation of outliers), a sector at the 4 digit level ISIC code was selected based on the homogeneity, significance and number of observations. The selected sector is ISIC 1810 (Manufacture of wearing apparel; dressing and dyeing of fur).

## 3. Structuring and generating data

This module contains four sections

### Select countries
- Inputs
  - [Data (.dta file)](https://github.com/cmg777/firm-tfp-convergence-brazil/blob/master/Build_database/Brazil_2003_2009_panel.dta)
- Code
  - [select and keep countries](https://github.com/cmg777/firm-tfp-convergence-brazil/blob/master/Build_database/pdf_brazil_build_dataset_main.do)
- Outputs
  - [Dataset ready for generating vars (.dta file)]

### Generating variables
- Inputs
  - [Data from previous step (.dta file)]
- Code
  - [generating variables](https://github.com/cmg777/firm-tfp-convergence-brazil/blob/master/Estimating_TFP/pdf_brazil_tfp_main.do)
- Outputs
  - [Dataset ready for cleaning (.dta file)]
  
 ### Cleaning data
- Inputs
  - [Data from previous step (.dta file)]
- Code
  - [data cleaning](https://github.com/cmg777/firm-tfp-convergence-brazil/blob/master/Estimating_TFP/pdf_brazil_tfp_main.do)
- Outputs
  - [Dataset ready (.dta file)]
   
 ### Descriptive statistics
- Inputs
  - [Data from previous step (.dta file)]
- Code
  - [descriptive statistics](https://github.com/cmg777/firm-tfp-convergence-brazil/blob/master/Estimating_TFP/pdf_brazil_tfp_main.do)
- Outputs
  - [Dataset ready for analysis (.dta file)]
 
## 4. Estimation of Total Factor Productivity (TFP)
 
- [Inputs]
  - [Data from previous step (.dta file)]
- Code:
  - [Estimating TFP](https://github.com/cmg777/firm-tfp-convergence-brazil/blob/master/Distribution-Dynamics-analysis/%20ISIC18LC-acf/RUN_convergence123.m)
- [Outputs]
  - [Dataset including TFP measuremnts, 7 methods (.dta file)]

## 5. Analysis of investment climate and productivity
 
- [Inputs]
  - [Data from previous step (.dta file)]
- Code:
  - [Estimating relationship](https://github.com/cmg777/firm-tfp-convergence-brazil/blob/master/Distribution-Dynamics-analysis/%20ISIC18LC-acf/RUN_convergence123.m)
- [Outputs]
  - [Dataset with analysis results (.dta file)]
  
 ## 6. Exploring causality, Instrumental Variables (IV) procedure
 
- [Inputs]
  - [Data from previous step (.dta file)]
- Code:
  - [IV procedure](https://github.com/cmg777/firm-tfp-convergence-brazil/blob/master/Distribution-Dynamics-analysis/%20ISIC18LC-acf/RUN_convergence123.m)
- [Outputs]
  - [Dataset with final results (.dta file)]
