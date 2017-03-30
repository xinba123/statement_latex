# README #

# How to install:

	(1) Install TeX Live 2012(http://askubuntu.com/questions/163682/how-do-i-install-the-latest-tex-live-2012)
			sudo add-apt-repository ppa:texlive-backports/ppa 
			sudo apt-get update 
			sudo apt-get install texlive
			
	(2) Install necessay package(tested on my linux VPS)
			tlmgr install datatool
			tlmgr install xfor
			tlmgr install substr
			tlmgr install etoolbox

# How to run on windows/linux(ubuntu):

**IMPORTANT Need to run _twice_ for [longtable to build properly](http://tex.stackexchange.com/questions/163697/table-widths-have-changed-rerun-latex)**

    pdflatex -halt-on-error -interaction=nonstopmode --jobname=bankstatement "\def\statementperiod{1.2.2017-2.2.2017}\def\statementnumber{123}\def\accountnumber{123}\def\accountholder{Alex}\def\addressone{Level 2, 89-91 City Rd}\def\addresstwo{Southbank Melbourne}\def\inputfilename{acx.csv}\input{bankstatement.tex}"

# Input:

  (1) paraments:
  
      halt-on-error -interaction=nonstopmode: continue to run when an error occurs
      jobname: the output pdf file name(can not be absolute path, all pdf files will be saved in the same dir as the tex file)
      statementperiod: the period when the transactions happened
      statementnumber: statement number
      accountnumber: account number
      accountholder: account holder
      addressone: street/road
      addresstwo: state/country
      inputfilename: input filename(can be absolute path like /root/latex/acx.csv)

  (2) csv:
  
       An example csv file is acx.csv
	

Output:

     bankstatement.pdf


# A list of important files:

	bankstatement.cls: main file for formating the bankstatement
	Bankstatement.tex: latex file. File to Compile
	Csv-camt.def: define the structure of the table in the statement

# A list of dependent packages(Just in case missing packages)

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
  
