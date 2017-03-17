# README #

How to install:

How to run/compile on windows/linux(ubuntu):

    pdflatex --jobname=bankstatement "\def\statementperiod{1.2.2017-2.2.2017}\def\statementnumber{123}\def\accountnumber{123}\input{bankstatement.tex}"

Input:

  (1) paraments:	
  
      jobname: the pdf file name
      statementperiod: the period when the transactions happened
      statementnumber: statement number
      accountnumber: account number
  (2) csv:
  
       A example csv file is acx.csv 
	

Output:

     bankstatement.pdf


A list of important files:

	bankstatement.cls: main file for formating the bankstatement
	Bankstatement.tex: latex file. File to Compile
	Csv-camt.def: define the structure of the table in the statement

A list of dependent packages

  longtable  
  tabularx  
  xcolor  
  graphicx  
  booktabs  
  datatool  
  calc  
  ifthen  
  xkeyval  
  xkvltxp  
  babel  
  inputenc  
  fontenc  
  textcomp  
  bera
  
