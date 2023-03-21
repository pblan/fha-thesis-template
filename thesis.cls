% Additional warnings for deprecated things
\RequirePackage[l2tabu, orthodox]{nag}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2022/12/22 v1.0.0 LaTeX-Klasse für die Bachelorarbeit an der FH Aachen]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Optional 'english' language option
\newcommand{\InitThesisLanguage}{\PassOptionsToPackage{english,ngerman}{babel}}
\DeclareOption{english}{\renewcommand{\InitThesisLanguage}{\PassOptionsToPackage{english}{babel}}}
\InitThesisLanguage

% define options for the title page
% logo-position: top, bottom 
\DeclareOption{logo-position}{\def\logoPosition{#1}}
\ProcessOptions\relax
\ProcessOptions

% showframe for debugging and pass to geometry
\DeclareOption{showframe}{\PassOptionsToClass{showframe}{geometry}}
\ProcessOptions\relax

\DeclareOption{showframe}{\PassOptionsToClass{showcrop}{geometry}}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% report format with own styling
\LoadClass[a4paper,twoside,openright]{report}
\renewcommand{\thesection}{\arabic{section}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Enable post-90s text processing
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Colors
\RequirePackage[svgnames, table]{xcolor}

\definecolor{fhmint}{RGB}{1, 169, 159}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Math & Symbols
\usepackage{mathtools}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsthm}
\usepackage{stmaryrd}
\SetSymbolFont{stmry}{bold}{U}{stmry}{m}{n} % https://tex.stackexchange.com/a/106719
\usepackage{braket}
\usepackage{cool}
\usepackage{siunitx}
\usepackage{venndiagram}
\usepackage{tabularx}
\renewcommand\tabularxcolumn[1]{m{#1}}% for vertical centering text in X column
\usepackage{makecell}
\usepackage{pifont}
\newcommand{\cmark}{\ding{51}}%
\newcommand{\xmark}{\ding{55}}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Typesetting
\usepackage{babel}
\usepackage{parskip}
\usepackage{csquotes}
\usepackage{booktabs}
\usepackage{listings}
\usepackage[font=small,labelfont=bf]{caption}

% \usepackage{lmodern} % upgrade default font
% \usepackage[sc]{mathpazo} % pretty font for text

% Fonts
\usepackage{fourier}
\usepackage[subdued,italic]{mathastext}
\usepackage[no-math]{fontspec}
\setmainfont{Verdana}

% Text
\setsansfont{Verdana}
\renewcommand\familydefault\sfdefault

% Math
\Mathastext[sans]
\renewcommand\familydefault\rmdefault

% Schriftgrößen und Zeilenabstände

\usepackage{titlesec}

% Überschrift in fhmint and 19 pt / 8 mm
\titleformat{\section}[block]
{\color{fhmint}\fontsize{19}{27}\selectfont\bfseries}
{\thesection}{1em}{}

% Überschrift 2 in schwarz und 14 pt / 6 mm
\titleformat{\subsection}[block]
{\fontsize{14}{20}\selectfont\bfseries}
{\thesubsection}{1em}{}

% Paragraph in schwarz und 12 pt
\titleformat{\paragraph}[block]
{\fontsize{12}{18}\selectfont\bfseries}
{\theparagraph}{1em}{}


% Schriftgrößen
% \renewcommand{\miniscule}{\fontsize{7}{10.5}\selectfont} % 
\renewcommand{\tiny}{\fontsize{8}{12}\selectfont} % 
\renewcommand{\scriptsize}{\fontsize{9}{14.5}\selectfont} % 
\renewcommand{\footnotesize}{\fontsize{10}{15}\selectfont} % für Fußnoten
\renewcommand{\small}{\fontsize{11}{15.5}\selectfont} % für Bildunterschriften
\renewcommand{\normalsize}{\fontsize{12}{18}\selectfont} % für normale Texte
\renewcommand{\large}{\fontsize{14}{21}\selectfont} % für Überschriften
\renewcommand{\Large}{\fontsize{17}{25.5}\selectfont} % für Überschriften
\renewcommand{\LARGE}{\fontsize{20}{30}\selectfont} % für Überschriften
\renewcommand{\huge}{\fontsize{25}{37.5}\selectfont} % für Überschriften
\renewcommand{\Huge}{\fontsize{30}{45}\selectfont} % für Überschriften
% \renewcommand{\Huge}{\fontsize{36}{54}\selectfont} % 


% Mathe
\renewcommand{\displaystyle}{\fontsize{12}{18}\selectfont}
\renewcommand{\textstyle}{\fontsize{12}{18}\selectfont}

% DIN A4
% Titelseite: Satzspiegel 194 mm x 281 mm (zu allen Seiten Randabstand von 8 mm)
% Innenseite: Satzspiegel 188 mm x 272 mm (Innerer Randabstand 14 mm, unterer Randabstand 17 mm)

% \usepackage[margin=8mm,inner=14mm,bottom=17mm]{geometry}
\usepackage[margin=20mm,inner=32mm,bottom=28mm,top=39mm]{geometry}

% Header
% L: Left, R: Right, C: Center
% O: Odd, E: Even
% \usepackage{emptypage}
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyfoot[CE,CO]{\thepage}

\fancyhead{} % clear all header fields
\fancyhead[LE]{\leftmark} % chapter title in the center of even pages
\fancyhead[RO]{\rightmark} % section name in the center of odd pages

\fancyfoot{} % clear all footer fields
\fancyfoot[C]{\thepage} % page number in the center of odd and even pages

\fancypagestyle{plain}{%  the preset of fancyhdr 
    \fancyhf{} % clear all header and footer fields
    \fancyfoot[C]{\thepage} % except the center
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}}

% New page before section
% \AddToHook{cmd/section/before}{\clearpage}

\renewcommand{\thesection}{\thechapter.\arabic{section}}

\usepackage{tocbasic}

\DeclareTOCStyleEntries[
  %raggedentrytext,
  numwidth=0pt,
  numsep=1ex,
  dynnumwidth
]{tocline}{chapter,figure,table}

\DeclareTOCStyleEntries[
  %raggedentrytext,
  numwidth=0pt,
  numsep=1ex,
  dynnumwidth,
%   indent=0pt,
  dynindent,
]{tocline}{section,subsection,subsubsection,paragraph,subparagraph}

\setcounter{tocdepth}{\subsubsectiontocdepth}

% show chapter numbers in toc for sections
% Chapter.Section.Subsection


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Utilities
\usepackage{blindtext}
\usepackage{censor}

\renewcommand{\blindmarkup}[1]{\emph{#1}}
\blindmathtrue

\usepackage{footnote}
\usepackage{pdfpages}
\usepackage{enumitem}
\usepackage{adjustbox}
\usepackage{mdframed}

% Show most recent revision number and date in date field
\makeatletter
\date{\small \IfLanguageName{ngerman}{Letzte Änderung:}{Last Change:} \filename@parse{\jobname}\IfFileExists{\filename@base.last-change}{\input{\filename@base.last-change}}{\today}}
\makeatother

\usepackage{lstautogobble}

\setlist{nosep}
\makeatother

\makeatletter
% Re-enable paragraph spacing in minipages;
% we choose something smaller than what is used outside of minipages.
\newcommand{\@minipagerestore}{\setlength{\parskip}{0.8\medskipamount}}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Links and Metadata
\usepackage{tcolorbox}
\usepackage{nameref}

\usepackage[]{imakeidx}
\usepackage[
    colorlinks,
    citecolor = fhmint,
    linkcolor = fhmint,
    urlcolor = fhmint
]{hyperref}
% \usepackage{cleveref}
\usepackage{bookmark}


\makeatletter
\AtBeginDocument{
    \hypersetup{
        pdftitle = {\@title},
        pdfauthor = {\@author}
    }
}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Diagrams
\usepackage{tikz}
\usetikzlibrary{chains,scopes,matrix,shapes,decorations,positioning,calc,fit,decorations.pathreplacing,angles,quotes,backgrounds}
\usepackage{tikzscale}
\usepackage{pgfplots, pgfplotstable}
\usepgfplotslibrary{fillbetween}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Context
% emph -> fhmint and bold
\DeclareTextFontCommand{\emph}{\boldmath\bfseries\color{fhmint}}

%\usepackage[]{imakeidx}
\usepackage{iflang}

\usepackage{etoolbox}
\usepackage{tikzpagenodes}

\makeatletter

\let\@studentid\@empty
\let\@supervisorOne\@empty
\let\@supervisorTwo\@empty
\let\@department\@empty
\let\@degreeProgram\@empty
\let\@location\@empty

\def\@logo{\includegraphics[height=20mm]{logo.png}}

\newcommand{\studentid}[1]{\gdef\@studentid{#1}}
\newcommand{\supervisors}[2]{
    \gdef\@supervisorOne{#1}%
    \gdef\@supervisorTwo{#2}%
}
\newcommand{\department}[1]{\gdef\@department{#1}}
\newcommand{\degreeProgram}[1]{\gdef\@degreeProgram{#1}}
\newcommand{\location}[1]{\gdef\@location{#1}}

% Page numbering Guide: https://www.pogodesign.co.nz/graphic-design/page-numbering-tips/

\renewcommand\maketitle{%
    % \newgeometry{margin=8mm}
    \newgeometry{margin=20mm}
        % set page counter for title page
        % being left binding, the first page is the right page
        \setcounter{page}{1}

        \thispagestyle{empty}
        % FH-Logo  
        \begin{tikzpicture}[
                remember picture,
                overlay,
                % shift={(current page.north east)}
            ]
            \node[
                anchor=north east,
                xshift=22.85cm,
                yshift=-0.8cm,
            ]
            at (current page.north west)
            {\includegraphics[height=4.84cm]{layout/img/FHAC.png}};
        \end{tikzpicture}
        %
        % Titelblatt
        \begin{center}
            {\huge\bfseries\IfLanguageName{ngerman}{Fachhochschule Aachen}{Aachen University of Applied Science}\par}
            {\large\@department\par}
            \vspace*{2cm}
            {\Large\bfseries\IfLanguageName{ngerman}{Bachelorarbeit}{Bachelor's Thesis}\par}
            {\ifx\@degreeProgram\@empty\else\large\vspace*{1ex}\par\IfLanguageName{ngerman}{im Studiengang}{in the degree program}\\\@degreeProgram\par\fi}
            \vspace*{2cm}
            {\Large\bfseries\@title\par}
            \vspace*{2cm}
            % \vspace*{8ex}
            {\Large\@author\ifx\@studentid\@empty\else\\\IfLanguageName{ngerman}{Matrikelnummer:}{Student ID:} \@studentid\fi\par}
            \vspace*{2cm}
        \end{center}
        \vfill
        {\large\IfLanguageName{ngerman}{Diese Arbeit wurde betreut von:}{This thesis was supervised by:} \par}
            {\large\ifx\@supervisorOne\@empty\else\vspace*{1ex}\par\IfLanguageName{ngerman}{Erstprüfer*in}{First Supervisor}: \@supervisorOne\par\fi}
            {\large\ifx\@supervisorTwo\@empty\else\vspace*{1ex}\par\IfLanguageName{ngerman}{Zweitprüfer*in}{Second Supervisor}: \@supervisorTwo\par\fi}
            \vspace*{2cm}
            \begin{center}
                {\IfLanguageName{ngerman}{\@location, den}{\@location, the} \today\par}
            \end{center}
            %
        \null
    
    \newgeometry{margin=20mm,inner=32mm,bottom=28mm,top=39mm}
}

% Eidesstattliche Erklärung
\newcommand{\makedeclaration}{%
\clearpage{\thispagestyle{plain}\cleardoublepage}
\thispagestyle{plain}

\begin{center}%
    {\bfseries 
        \IfLanguageName{ngerman}{Eidesstattliche Erklärung}{Declaration of Authenticity}
    }%
\end{center}%
\vspace*{2ex}%

Hiermit versichere ich, dass ich die Bachelorarbeit mit dem Thema

\vspace*{2ex}

\begin{center}
  {\large\emph{\@title}}
\end{center}

\vspace*{2ex}

selbstständig verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel benutzt habe, alle Ausführungen, die anderen Schriften wörtlich oder sinngemäß entnommen wurden, kenntlich gemacht sind und die Arbeit in gleicher oder ähnlicher Fassung noch nicht Bestandteil einer Studien- oder Prüfungsleistung war.

\vspace*{4ex}

Name: \@author

\@location, den \today

\vspace*{10ex}
  { % Signatures short format
  \begin{tabular}{@{}p{3in}@{}}
      \hrulefill \\
      Unterschrift der/des Studierenden
  \end{tabular}
  }

  \clearpage{\thispagestyle{plain}\cleardoublepage}
}

% Danksagung
\newenvironment{acknowledgements}{%
    \clearpage{\thispagestyle{plain}\cleardoublepage}
    \thispagestyle{plain}

    \begin{center}%
        {\bfseries 
            \IfLanguageName{ngerman}{Danksagung}{Acknowledgements}
        }%
    \end{center}%
    \vspace*{2ex}%
}{%
    \vspace*{2ex}%
    \clearpage{\thispagestyle{plain}\cleardoublepage}
}

% Zusammenfassung
\renewenvironment{abstract}{%
    \clearpage{\thispagestyle{plain}\cleardoublepage}
    \thispagestyle{plain}

    \begin{center}%
        {\bfseries 
            \IfLanguageName{ngerman}{Zusammenfassung}{Abstract}
        }%
    \end{center}%
    \vspace*{2ex}%
}{%
    \vspace*{2ex}%
    \clearpage{\thispagestyle{plain}\cleardoublepage}
}

\makeatletter

% Frontmatter
\newcommand\frontmatter{%
    \cleardoublepage
  %\@mainmatterfalse
  \pagenumbering{roman}}

% Mainmatter
\newcommand\mainmatter{%
    \cleardoublepage
 % \@mainmattertrue
  \pagenumbering{arabic}}

% Backmatter
\newcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
 % \@mainmatterfalse
   }

\makeatother


\makeatother

\AtEndDocument{
  \makeatletter
  \makeatother
}
