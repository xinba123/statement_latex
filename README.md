# README #

# How to install:

	(1) Install TeX Live 2012
			sudo add-apt-repository ppa:texlive-backports/ppa 
			sudo apt-get update 
			sudo apt-get install texlive
			
	(2) Install necessay package
			tlmgr install datatool
			tlmgr install xfor
			tlmgr install substr
			tlmgr install etoolbox

# How to run/compile on windows/linux(ubuntu):

    pdflatex -halt-on-error -interaction=nonstopmode --jobname=bankstatement "\def\statementperiod{1.2.2017-2.2.2017}\def\statementnumber{123}\def\accountnumber{123}\def\accountholder{Alex}\def\inputfilename{acx.csv}\input{bankstatement.tex}"

# Input:

  (1) paraments:
  
      halt-on-error -interaction=nonstopmode: continue to run when an error occurs
      jobname: the output pdf file name
      statementperiod: the period when the transactions happened
      statementnumber: statement number
      accountnumber: account number
      accountholder: account holder
      inputfilename: input filename

  (2) csv:
  
       An example csv file is acx.csv
	

Output:

     bankstatement.pdf


# A list of important files:

	bankstatement.cls: main file for formating the bankstatement
	Bankstatement.tex: latex file. File to Compile
	Csv-camt.def: define the structure of the table in the statement

# A list of dependent packages

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
  
