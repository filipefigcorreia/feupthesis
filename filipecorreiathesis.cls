%%
%% Filipe Correia LaTeX Thesis Class
%% Heavily based on Hugo Ferreira's Thesis Class (hugothesis)
%%

\ProvidesClass{filipecorreiathesis}
\NeedsTeXFormat{LaTeX2e}

% Based on the book class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass[a4paper,twoside,openright,12pt,pdftex]{book}

%%
%% Fixes
%%

\RequirePackage{memhfixc}
\RequirePackage{etex} % increase register size

% more lenient line breaking (avoids text protruding into margins)
\sloppy

%%
%% Fonts
%%

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8x]{inputenc}
%\RequirePackage{lmodern}
\RequirePackage[sc,osf]{mathpazo}
\renewcommand{\sfdefault}{\rmdefault} % Ensure caps have serifs
%\linespread{1.05}         % Palatino needs more leading (space between lines)
%\usepackage{setspace}
%\setstretch{1.05} % for custom spacing

%%
%% Page layout
%%

\raggedbottom

% No orphans
\clubpenalty = 500
\widowpenalty = 1000
% \checkandfixthelayout

%%
%% Line breaking
%%

\RequirePackage[final=true,step=1]{microtype}
\RequirePackage{ragged2e}

%%
%% Colors
%%

\RequirePackage[table]{xcolor}

\definecolor{feup}{cmyk}{0.2,0.9,1.0,0.2}
\definecolor{feupwashed}{RGB}{250,243,243}
\definecolor{feupstrong}{RGB}{103,13,0}
\definecolor{bar}{HTML}{AAAAAA}
\definecolor{cloudwhite}{cmyk}{0,0,0,0.025}
\definecolor{gray}{HTML}{949698}

\colorlet{partnum}{feup}
\colorlet{urlcolor}{feup}
\colorlet{tocchapnum}{feup}

%%
%% Captions
%%

\RequirePackage[hang,footnotesize,bf]{caption}

\newcommand{\reducecaption}[1]{%
  \strictpagechecktrue
}

\setlength{\captionmargin}{18pt}

%%
%% Division styles
%%

\RequirePackage{sectsty}
\definecolor{chaptergrey}{rgb}{0.6,0.6,0.6}

\providecommand*{\defaultcnfont}{pbk}

\allsectionsfont{\sffamily}
%\renewcommand{\chaptername}{}
%\allsectionsfont{\sffamily}
%\chapterfont{\raggedleft\sffamily\color{black}}
%\chapternumberfont{\vspace{-4cm}\raggedleft\usefont{T1}{\defaultcnfont}{b}{n}\fontsize{100}{130}\selectfont\color{chaptergrey}}

\partnumberfont{\color{feup}}
\parttitlefont{\color{black}}

%%
%% Environments
%%


%%
%% Hyperlinks
%%

\RequirePackage[pdftex,plainpages=false,pagebackref,breaklinks,bookmarksnumbered=true]{hyperref}


% break also on hyphens inside the \url command
\def\UrlBreaks{\do\.\do\@\do\\\do\/\do\!\do\_\do\|\do\;\do\>\do\]%
  \do\)\do\,\do\?\do\'\do+\do\=\do\#\do-} % \do- is new!

\urlstyle{sf}

\hypersetup{%
  colorlinks=true,
  linkcolor=feup,
  anchorcolor=feup,
  citecolor=feup,
  urlcolor=feup,
  pdfstartview={FitV},
  pdftitle = {The Thesis Title}, 
  pdfauthor = {Your Full Name},
  pdfborder=0 0 0
}


% Introduce backreferences links
\renewcommand*{\backref}[1]{}
\renewcommand*{\backrefalt}[4]{%
  \ifcase #1 %
    No citations.%
  \or
    Cited on p.~#2.%
  \else
    Cited on pp.~#2.%
  \fi
}

% Fix references to figures, tables, etc.
% \RequirePackage[all]{hypcap}

% MiniTOC
\RequirePackage[tight]{minitoc}
\setcounter{minitocdepth}{1} 
\renewcommand{\mtctitle}{}
\renewcommand{\kernafterminitoc}{\vspace{0.3cm}}
\renewcommand{\mtcoffset}{-0.3cm}

%%
%% Reference shorthands.
%%

\newcounter{cPage}
\newcommand\optref[1]{%
 \refstepcounter{cPage}\label{current\thecPage}%
 \ifthenelse{\equal{\pageref{#1}}{\pageref{current\thecPage}}}%
  {}{~(p.~\pageref{#1})}%
}

\newcommand\coderef[1]{Source~\ref{#1}\optref{#1}}
\newcommand\figureref[1]{Figure~\ref{#1}\optref{#1}}
\newcommand\tableref[1]{Table~\ref{#1}\optref{#1}}
\newcommand\chapterref[1]{Chapter~\ref{#1} (p.~\pageref{#1})}
\newcommand\sectionref[1]{\textsection~\ref{#1}\optref{#1}}
\newcommand\appendixref[1]{Appendix~\ref{#1} (p.~\pageref{#1})}

%%
%% Declerative formatting
%%

% Footnotes
\RequirePackage[hang,flushmargin]{footmisc}
\footnotemargin 0.8em
\long\def\symbolfootnote[#1]#2{\begingroup\def\thefootnote{\fnsymbol{footnote}}\footnote[#1]{#2}\endgroup}

% Nomenclature
\RequirePackage{nomencl}
\renewcommand{\nomentryend}{.}
\renewcommand{\nomlabel}[1]{\hfil\textbf{#1}}

% Typesetting conventions
\newcommand{\oldand}{\emph{\& }}
\newcommand{\class}[1]{{\tt #1}}
\newcommand{\ymarker}[1]{\colorbox{yellow}{\emph{#1}}}
\newcommand{\smallcaps}[1]{\MakeLowercase{\textsc{#1}}}
\newcommand{\acronym}[1]{\smallcaps{#1}}
\newcommand{\monotxt}[1]{{\small \texttt{#1}}}

% Epigraphs
\usepackage{epigraph}
\setlength{\epigraphwidth}{9cm}
\expandafter\def\expandafter\quotation\expandafter{\quotation\em\small}

%%
%% Front matter
%%

\RequirePackage{pdfpages}
\renewcommand{\maketitle}{%
  \begin{titlepage} 
    \centering
	\footnotesize 
	\textbf{\href{http://www.fe.up.pt}{\ \ \ U N I V E R S I D A D E\ \ \ D O\ \ \ P O R T O\ \ \ \textbullet\ \ \ F A C U L D A D E\ \ \ D E\ \ \ E N G E N H A R I A}} \\ 
	\ \\ 
	\ \\ 
	\ \\ 
	\ \\ 
	\Huge \textsf{\textbf{The Full Title}} \\
	\huge \textsf{\textbf{Of The Thesis}} \\

	\vspace{4pc}
	%\includegraphics[scale=0.40]{media/layout/ornament} \\
	\vspace{4pc}

	\large \@author \normalsize
	\vspace{1pc} \\
	January 2015
	\ \\
	\vfill
	\ \\
	Scientific Supervision by \\
	\ \\
	The Advisor's Name, His Title \\
	Departmento de Engenharia Informática \\

	\vspace{4pc}

	In partial fulfillment of requirements for the degree of \\
	Doctor of Philosophy in Informatics Engineering \\
	by the ProDEI Doctoral Programme \\
	\clearpage
  \end{titlepage} 
}