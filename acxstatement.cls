
\NeedsTeXFormat{LaTeX2e}%
\ProvidesClass{acxstatement}[2015/11/14 class for csv based bank statements v0.9.2]%
\RequirePackage{xkeyval}%
\RequirePackage{xkvltxp}%
\newcommand*\STM@JK@define@key[4]%
{%
  \expandafter\gdef\csname#1@#3\endcsname{#4}%
  \define@key{#2.cls}{#3}[#4]%
  {%
    \expandafter\gdef\csname#1@#3\endcsname{##1}%
  }%
  \define@key{#2}{#3}%
  {%
    \expandafter\def\csname#1@#3\endcsname{##1}%
  }%
}%
\STM@JK@define@key{STM@JK}{acxstatement}{format}{csv-camt}%
\STM@JK@define@key{STM@JK}{acxstatement}{language}{english}%
\STM@JK@define@key{STM@JK}{acxstatement}{title}{}%
\STM@JK@define@key{STM@JK}{acxstatement}{logo}{}%
\STM@JK@define@key{STM@JK}{acxstatement}{logowidth}{4cm}%
\STM@JK@define@key{STM@JK}{acxstatement}{transactionwidth}{5cm}%
\STM@JK@define@key{STM@JK}{acxstatement}{negativecolor}{red}%
\STM@JK@define@key{STM@JK}{acxstatement}{sort}{}%
\STM@JK@define@key{STM@JK}{acxstatement}{accountnumber}{none}%
\STM@JK@define@key{STM@JK}{acxstatement}{accountholder}{none}%
\STM@JK@define@key{STM@JK}{acxstatement}{addressone}{none}%
\STM@JK@define@key{STM@JK}{acxstatement}{addresstwo}{none}%
\STM@JK@define@key{STM@JK}{acxstatement}{statementperiod}{none}%
\STM@JK@define@key{STM@JK}{acxstatement}{statementnumber}{none}%
\STM@JK@define@key{STM@JK}{acxstatement}{openingbalance}{none}%
\STM@JK@define@key{STM@JK}{acxstatement}{closingbalance}{none}%
\STM@JK@define@key{STM@JK}{acxstatement}{left}{1cm}%
\STM@JK@define@key{STM@JK}{acxstatement}{right}{1cm}%
\STM@JK@define@key{STM@JK}{acxstatement}{top}{0.5cm}%
\STM@JK@define@key{STM@JK}{acxstatement}{bottom}{2cm}%
\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{article}}%
\ExecuteOptionsX{format,language,title,logo,logowidth,%
                 transactionwidth,negativecolor,sort,openingbalance,%
                 closingbalance,statementperiod,statementnumber,accountnumber,accountholder,addressone,addresstwo,left,right,top,bottom}%
\ProcessOptionsX*\relax%
\LoadClass{article}%
\RequirePackage[left=\STM@JK@left,right=\STM@JK@right,top=\STM@JK@top,%
                bottom=\STM@JK@bottom]{geometry}%
\RequirePackage{longtable}%
\RequirePackage{tabularx}%
\RequirePackage{xcolor}%
\RequirePackage{graphicx}%
\RequirePackage{booktabs}%
\RequirePackage{datatool}%
\RequirePackage{calc}%
\RequirePackage{ifthen}%
\RequirePackage{color}
\newcommand*\STM@JK@dbkeys{}%
\newcommand*\STM@JK@DTLforeach{}%
\newcommand*\STM@JK@holdername{}%
\newcommand*\STM@JK@bicname{}%
\newcommand*\STM@JK@ibanname{}%
\newcommand*\STM@JK@firstcolumnheading{}%
\newcommand*\STM@JK@secondcolumnheading{}%
\newcommand*\STM@JK@thirdcolumnheading{}%
\newcommand*\STM@JK@fourthcolumnheading{}%
\newcommand*\STM@JK@fifthcolumnheading{}%
\newcommand*\STM@JK@openingbalancename{}%
\newcommand*\STM@JK@closingbalancename{}%
\newcommand*\STM@JK@headingsep{0.5cm}%
\newcommand*\STM@JK@statementperiodname{Statement Period}%
\newcommand*\STM@JK@statementnumbername{Statement Number}%
\newcommand*\STM@JK@accountnumbername{Account Number}%
\newcommand*\STM@JK@noheader{false}%
\newcounter{STM@JK@count}%
\input{\STM@JK@format.def}%
\input{stm\STM@JK@language.def}%
\newcommand*\STM@JK@includelogo%
{%
  {\includegraphics[width=\STM@JK@logowidth]{\STM@JK@logo}}%
}%
\newcommand*\STM@JK@address%
{%
  \begin{tabular}{l}
  {Level 2, 89-91 City Rd}\\{Southbank Melbourne}\\{Victoria Australia}
  \end{tabular}
}%

\newcommand*\STM@JK@header%
{%
  \noindent%
  \begin{tabularx}{\textwidth}{XXr}%
    \multicolumn{3}{l}%
      {\begin{tabular}{l}\STM@JK@includelogo\\\STM@JK@address\end{tabular}}%
      \hfill{\begin{tabular}{l}


        \textbf{\STM@JK@statementperiodname}\\%
          {\raggedleft\STM@JK@statementperiod}\\\hline\\%
        \textbf{\STM@JK@statementnumbername}\\%
          {\raggedleft\STM@JK@statementnumber}\\\hline\\%
        \textbf{\STM@JK@accountnumbername}\\%
          {\raggedleft\STM@JK@accountnumber}\\\hline%
      \end{tabular}}\\

      &\\%
      \begin{tabular}{l}
      \\\\\\
      \hspace*{2cm}\STM@JK@accountholder\\
      \hspace*{2cm}\STM@JK@addressone\\
      \hspace*{2cm}\STM@JK@addresstwo
      \end{tabular} &%
      & %

  \end{tabularx}%
  \vspace{\STM@JK@headingsep}%
}%

\newcommand\acxstatement[2][]%
{%
  \begingroup%
    \setkeys{acxstatement}{#1}%
    \stepcounter{STM@JK@count}%
    \xdef\STM@JK@dbname{stm\arabic{STM@JK@count}}%
    \ifthenelse{\equal{\STM@JK@noheader}{false}}%
    {\DTLloadrawdb[keys={\STM@JK@dbkeys},noheader=false]{\STM@JK@dbname}{#2}}%
    {\DTLloadrawdb[keys={\STM@JK@dbkeys},noheader=true]{\STM@JK@dbname}{#2}}%
    \ifthenelse{\equal{\STM@JK@sort}{}}%
    {}%
    {\DTLsort{\STM@JK@sort}{\STM@JK@dbname}}%

    \STM@JK@header%

    \begin{longtable}{@{\extracolsep{\fill}}cccccc}%k
    \toprule%
    \STM@JK@firstcolumnheading &%
    \STM@JK@secondcolumnheading &%
    \STM@JK@thirdcolumnheading &%
    \STM@JK@fourthcolumnheading &%
    \STM@JK@fifthcolumnheading %
    \\\toprule%
    \endhead%
    
    %%define the table
    \STM@JK@DTLforeach%

    \end{longtable}%
  \endgroup%
}%
\AtBeginDocument{\disable@keys{acxstatement}%
                              {format,language,left,right,top,bottom}}%
\endinput

