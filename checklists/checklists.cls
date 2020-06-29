% This is a class to write checlists for airplanes

% TeX
\NeedsTeXFormat{LaTeX2e}[1998/12/01]
\newcommand*{\GIclsChecklistsV}{1.0}
\newcommand*{\GIclsChecklistsD}{2020/06/29}
% Class name {{{
% Tell your name and your birthday and describe yourself in 5 words
\newcommand*{\GIclsChecklistsN}{checklists}
\ProvidesClass{\GIclsChecklistsN}[\GIclsChecklistsD\ v. \GIclsChecklistsV\ Checklists for airplanes]
\LoadClass[12pt,a4paper,twoside]{article}
% }}}
% Packages needed {{{
% What do you want?
% Syntax: \RequirePackage[options]{package}[date]
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage[english]{babel}
\RequirePackage{amssymb}
\RequirePackage{enumitem}
\setlist{noitemsep}
\RequirePackage{ifthen}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage[yyyymmdd]{datetime}
\renewcommand*{\dateseparator}{-}
\RequirePackage{xcolor}
\RequirePackage{mdframed}
\RequirePackage{wasysym}
\RequirePackage{hyperref}
% }}}
% Options provided {{{
% What options do you give the users?
% Syntax: \DeclareOption{option}{code}
% Syntax for default: \DeclareOption*{code}
\DeclareOption*{\ClassWarning{\GIclsChecklistsN}{Unkonwn option `\CurrentOption'}}
% \ExecuteOptions{default options here}
\ProcessOptions\relax
% }}}
% Events handled: AtEndOfClass AtEndOfPackage AtBeginDocument AtEndDocument
% Errors and warnings: (Class|Package)(Info|Error|Warning(NoLine)?)
% What do you do?
%
% Defining some commands {{{
\newcommand*{\Gael}{Ga\"el Induni}
\newcommand*{\oC}{\ensuremath{^{\circ}C}}
\newcommand*{\oF}{\ensuremath{^{\circ}F}}
\newcommand*{\DEG}{\ensuremath{^{\circ}} }
\newcommand*{\RPM}[1]{#1 \textsc{rpm}}
\renewcommand*{\geq}{\geqslant}
\renewcommand*{\leq}{\leqslant}
%
\newcommand*{\SrcVersion}{}
\newcommand*{\SrcName}{}
\newcommand*{\DocV}[2]{%
\renewcommand*{\SrcName}{#1}%
\renewcommand*{\SrcVersion}{#2}%
\ifthenelse{\equal{\SrcName}{}}{}{\renewcommand*{\SrcFoot}{from \SrcName\ v\SrcVersion}}%
}
%
\newcommand*{\ID}{}
\newcommand*{\LongPlane}{}
\newcommand*{\ShortPlane}{}
\newcommand*{\SetPlane}[3]{%
	\renewcommand*{\LongPlane}{#1}%
	\renewcommand*{\ShortPlane}{#2}%
	\renewcommand*{\ID}{#3}%
}
% }}}
% Document size {{{
\setlength{\topmargin}{-20mm}
\setlength{\textheight}{264mm}
\setlength{\hoffset}{-15mm}
\setlength{\textwidth}{190mm}
\setlength{\evensidemargin}{-5mm}
\setlength{\parskip}{0.5ex}
% }}}
\hypersetup{% {{{
	colorlinks        = true,
	%bookmarks         = true,
	bookmarksnumbered = false,
	linkcolor         = black,
	urlcolor          = blue,
	citecolor         = blue,
	filecolor         = blue,
	%hyperfigures      = true,
	breaklinks        = false,
	%ps2pdf,
	pdftitle          = {\jobname.pdf},% \today},
	pdfsubject        = {\jobname.pdf},% \today},
	pdfauthor         = {\Gael}
}% }}}
% Fancy {{{
\newcommand*{\SrcFoot}{}
\fancypagestyle{plain}{%
\fancyhf{}
\fancyhf[HC]{%
	\textbf{\LongPlane}%
	\ifthenelse{\equal{\ShortPlane}{}}{}{ (\ShortPlane)}%
	\ifthenelse{\equal{\ID}{}}{}{ \ID}%
}
\fancyhf[FL]{\Gael}
\fancyhf[FC]{%
\jobname.pdf %
\textbf{v\SrcVersion.\today}\ %
cls v\GIclsChecklistsV\ %
\textbf{\SrcFoot}%
}
\fancyhf[FR]{\thepage/\pageref{LastPage}}
% Rules at top and bottom
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
}
\pagestyle{plain}
% }}}
% mdframed env {{{
\mdfsetup{%
	linecolor=white,
	skipabove=0,
	skipbelow=0,
	innertopmargin=0,
	innerbottommargin=0
}
\newmdenv[
	backgroundcolor=yellow!50,
	innerbottommargin=2pt,
	innertopmargin=1.2mm
]{MDeven}
\newmdenv[
	backgroundcolor=orange!80,
	innerbottommargin=2pt,
	innertopmargin=1.2mm
]{MDheartEnv}
\newmdenv[
	backgroundcolor=orange!80,
	innerleftmargin=9mm,
	innertopmargin=3pt,
	innerbottommargin=4pt
]{MDheartItem}
\newmdenv[
	backgroundcolor=blue!10,
	skipabove=3pt,
	innertopmargin=3pt
]{MDconditional}
\newmdenv[
	backgroundcolor=blue!30,
	innertopmargin=2mm,
	innerbottommargin=2mm,
	skipbelow=5mm
]{MDinfobox}
% }}}
%
%
\newcounter{SubCheck}
\newcounter{CheckOddEven}
\setcounter{CheckOddEven}{0}
%
\newcommand{\EndRule}[1][0.95]{% {{{
	\vspace{-10mm}%
	\begin{center}%
	\rule{#1\textwidth}{1pt}%
	\end{center}%
	\vspace{1pt}%
}% }}}
\newcommand{\CheckSec}[1]{% {{{
	\begin{flushleft}
	\noindent\textbf{\Large #1}%
	\end{flushleft}
	\vspace{-6mm}%
}% }}}
\newcommand{\CheckSub}[1]{% {{{
	\noindent\hspace{7mm}\textbf{#1:}%
	\vspace{-5mm}%
}% }}}
\newcommand*{\Heart}{}
\newenvironment{CheckList}[2]{% {{{
	\renewcommand{\Heart}{#2}%
	\ifthenelse{\equal{\Heart}{h}}{%
		\vspace{-5mm}%
		\begin{MDheartEnv}%
	}{%
		\stepcounter{CheckOddEven}%
		\ifthenelse{\isodd{\value{CheckOddEven}} }{%
			\vspace{-11mm}%
		}{%
			\vspace{-5mm}%
			\begin{MDeven}%
		}%
	}
	\CheckSec{#1}%
	\ifthenelse{\isodd{\value{CheckOddEven}} }{\vspace{-4mm}}{}%
	\begin{enumerate}%
}{%
	\end{enumerate}%
	\ifthenelse{\equal{\Heart}{h}}{%
		\end{MDheartEnv}%
	}{%
		\ifthenelse{\isodd{\value{CheckOddEven}} }{\vspace{-3mm}}{\end{MDeven}}%
	}%
	\setcounter{SubCheck}{0}%
}% }}}
\newenvironment{CheckListRule}[2]{% {{{
	\begin{CheckList}{#1}{#2}%
}{%
	\end{CheckList}%
	\EndRule%
}% }}}
\newenvironment{SubWrapper}[2]{% {{{
	\renewcommand{\Heart}{#2}%
	\ifthenelse{\equal{\Heart}{h}}{%
		\begin{MDheartEnv}%
	}{%
		\stepcounter{CheckOddEven}%
		\ifthenelse{\isodd{\value{CheckOddEven}} }{%
			\vspace{-7mm}%
		}{%
			\vspace{-5mm}%
			\begin{MDeven}%
		}%
	}
	\CheckSec{#1}%
}{%
	\ifthenelse{\equal{\Heart}{h}}{%
		\end{MDheartEnv}%
	}{%
		\ifthenelse{\isodd{\value{CheckOddEven}} }{\vspace{-3mm}}{\end{MDeven}}%
	}%
	\setcounter{SubCheck}{0}%
}% }}}
\newenvironment{SubWrapperRule}[2]{% {{{
	\begin{SubWrapper}{#1}{#2}%
}{%
	\end{SubWrapper}%
	\EndRule%
}% }}}
\newenvironment{SubCheckList}[1]{% {{{
	\CheckSub{#1}%
	\begin{enumerate}%
	\setcounter{enumi}{\value{SubCheck}}
}{%
	\setcounter{SubCheck}{\value{enumi}}%
	\end{enumerate}%
}% }}}
\newenvironment{ConditionalChecks}[1]{% {{{
	\begin{MDconditional}%
	\textbf{#1}%
}{%
	\end{MDconditional}%
}% }}}
%\setlength{leftmargin}{0mm}%
\newcommand{\Check}[3][]{% {{{
	\ifthenelse{\equal{#1}{h} }{\vspace{2pt}}{}%
	\stepcounter{enumi}
	\item[\arabic{enumi}.]
	\ifthenelse{\equal{#1}{h} \OR \equal{#1}{hh}}{\begin{MDheartItem}}{}%
	#2\dotfill\ifthenelse{\equal{#3}{}}{CHECKED}{#3}%
	\ifthenelse{\equal{#1}{h} \OR \equal{#1}{hh}}{\end{MDheartItem}\vspace{-1pt}}{}%
}% }}}
\newcommand{\CheckBis}[1]{% {{{
	\item[]\dotfill #1%
}% }}}
\newenvironment{InfoBox}{% {{{
	\begin{MDinfobox}%
	\Large%
}{%
	\vspace{-2pt}%
	\end{MDinfobox}%
}% }}}
\newenvironment{InfoDistances}[1]{% {{{
	\begin{InfoBox}%
		\normalsize
		\vspace{-1mm}%
		\begin{tabular}{r|c|c|c|c|}%
			$[m]$ (50ft)
			& #1 ft 1003hPa $+20\oC$
			& 993hPa = +300 ft
			& $+30\oC =$ +1200 ft
			& Grass
			\\\hline
}{%
		\end{tabular}%
		\vspace{-1mm}%
	\end{InfoBox}%
}% }}}
\newcommand{\InfoSpeedsTakeOff}[5]{% {{{
{\large%
$\VBmath{1} = #1$ kts%
\hfill%
$\VBtxt{r} = #2$ kts%
\hfill%
$\VBmath{x} = #3$ kts%
\hfill%
$\VBmath{y} = #4$ kts%
\hfill%
$\VBmath{cc} = #5$ kts%
\\%
}}% }}}
\newcommand{\InfoSpeedsLandingCriticals}[4]{% {{{
{\large%
$\VBtxt{app} = #1$ kts%
\hfill%
$\VBtxt{fin} = #2$ kts%
\hfill%
$\VBmath{a} = #3$ kts%
\hfill%
$\VBtxt{glide} = #4$ kts%
\\%
}}% }}}
\newcommand{\InfoSpeedsMore}[6]{% {{{
{\large%
($\VBtxt{plan} = #1$ kts)%
\hfill%
Glide ratio: 1:#2 (1000 ft: #3 NM)%
\\%
Fuel: #4/h%
\hfill%
Max X-wind comp: #6 kts%
\\%
Downwind pwr: #5%
}}% }}}
\newcommand{\BoxSpace}{\mbox{}\vspace{-8mm}}
\newcommand{\SkipPage}{\clearpage\BoxSpace}
\newcommand*{\Vtxt}[1]{\ensuremath{\textrm{v}_{\textrm{\small #1}} }}
\newcommand*{\Vmath}[1]{\ensuremath{\textrm{v}_{#1} }}
\newcommand*{\VBtxt}[1]{\ensuremath{\textbf{v}_{\textrm{\small #1}} }}
\newcommand*{\VBmath}[1]{\ensuremath{\textbf{v}_{#1} }}
\newcommand*{\WriteTime}[1]{\Check{#1 time}{WRITTEN}}
\newcommand*{\BlockTime}[1]{\WriteTime{Block-#1}}
\newcommand*{\BlockOff}{\BlockTime{off}}
\newcommand*{\BlockOn}{\BlockTime{on}}
\newcommand*{\BlockOnCounter}{\Check{Block-on time, hour meter stand}{WRITTEN}}
\newcommand*{\TakeOffTime}{\WriteTime{Take-off}}
\newcommand*{\LandingTime}{\WriteTime{Landing}}
\newcommand*{\FuelPump}[1]{\Check{Fuel pump}{#1, PRESSURE CHECKED}}
\newcommand*{\FuelQuantity}[1][CHECKED]{\Check{Fuel quantity}{#1, Endurance}}
\newcommand*{\CheckChecklist}[1]{\Check{On-board checklist version}{#1}}
\newcommand*{\MagnetosGrounding}{\Check{Magnetos grounding (at idle)}{DONE}}
%
%
%
\AtBeginDocument{\BoxSpace\large}
%
