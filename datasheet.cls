\ProvidesClass{datasheet}[Document class for documentation]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% ========== PACKAGES ========== 

% PAGE MARGINS
\RequirePackage[a4paper,left=1in,right=1in,top=1in,bottom=1in]{geometry}

% HEADER AND FOOTER
\RequirePackage{fancyhdr} 
\RequirePackage{lastpage}

% REMOVE INDENTS
\RequirePackage{parskip}

% SI UNITS
\RequirePackage{siunitx}

% CODE
\RequirePackage{minted}

% FONTS
\RequirePackage{fontspec}[Contextuals=Alternate]
\setmonofont[Scale=0.9]{JetBrains Mono}

% CAPTIONS
\RequirePackage[font=bf, skip=8pt, justification=raggedright, format=hang, singlelinecheck=off]{caption}

% IMAGES
\RequirePackage{graphicx} 
\RequirePackage{rotating}

% TABLES
\RequirePackage{multirow}
\RequirePackage{multicol}
\RequirePackage{tabularx}
\RequirePackage{threeparttable}
\RequirePackage[table]{xcolor}

% OPTIONALS
\RequirePackage{emoji}
\RequirePackage{hyperref}


% ========== END PACKAGES ========== 

% ========== COMMANDS ========== 

% REVISION
\gdef\@revision{}
\newcommand{\revision}[1]{\gdef\@revision{#1}}

% UNUMBERED SECTIOND
\newcommand{\usection}[1]{\section*{#1}
\addcontentsline{toc}{section}{\protect\numberline{}#1}}

\newcommand{\usubsection}[1]{\subsection*{#1}
\addcontentsline{toc}{subsection}{\protect\numberline{}#1}}

\newcommand{\usubsubsection}[1]{\subsubsection*{#1}
\addcontentsline{toc}{subsubsection}{\protect\numberline{}#1}}

% TODO
\newcommand{\TODO}[1]{\color{red}\textbf{TODO: {#1}}\color{black}}

% SUBTITLE
\newcommand{\subtitle}[1]{
\medskip
\textbf{#1}
\medskip
\newline
}

% INLINE CODE
\newcommand{\code}[1]{
\mintinline{vhdl}{#1}}

% RENEW COMMANDS

% TABLE SPACING
\renewcommand{\arraystretch}{1.5}

% TITLE
\renewcommand{\maketitle}{
    \begin{center}
    {\Huge\bfseries\@title} \\
    \vspace{6cm}
    \includegraphics[width=0.2\linewidth]{images/ENSEEIHT_logo.png} \\
    \includegraphics[width=0.2\linewidth]{images/nanoXplore_logo.png} \\
    {\@date} \\
    \vspace{2cm}
    {\@revision}
    \end{center}
    \pagestyle{normalpage}
    \thispagestyle{firstpage}
}
% ========== END COMMANDS ========== 

% ========== PAGE LAYOUT ========== 
% FIRST PAGE
\fancypagestyle{firstpage}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

% OTHERS PAGES
\fancypagestyle{normalpage}{
    \setlength{\headheight}{24pt}
    \renewcommand{\headrulewidth}{0.5pt}
    \renewcommand{\footrulewidth}{0.5pt}
    \fancyhead[L]{\nouppercase{\leftmark}}
    \fancyhead[R]{\slshape\@title}
    \fancyfoot[L]{\@revision}
    \fancyfoot[C]{\@date}
    \fancyfoot[R]{Page \thepage\ of \pageref{LastPage}}
}
% ========== PAGE LAYOUT ========== 