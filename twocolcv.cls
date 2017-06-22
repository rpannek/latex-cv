\ProvidesClass{twocolcv}
\LoadClass[twocolumn]{article}

% For huge title
\usepackage{fix-cm}

% To modify sections
\usepackage{titlesec}

% For Swedish letters
\usepackage[utf8]{inputenc}

% To change margins
\usepackage[margin=0.5in, inner=0.5in, outer=0.8in]{geometry}

% For graphics
\usepackage{graphicx}

% For coloring text and bars
\usepackage[usenames,dvipsnames]{color}

% To align tables
\usepackage{tabularx}

% For hyperlinks
\usepackage{hyperref}

% For coloring the picture border
\usepackage{xcolor}

% Format the \section command
\titleformat*{\section}{\LARGE\scshape}

% Remove page numbers
\pagenumbering{gobble}

% Remove URL boxes from hyperref
\hypersetup{%
    pdfborder = {0 0 0}
}
% These control the left and right column widths in tables
\newcommand{\lcolwidth}{2.5cm}
\newcommand{\rcolwidth}{5.5cm}

\titlespacing*{\section}{0pt}{2pt}{7pt}

% This creates a header with a photo, text & horizontal ruler.
\newcommand{\header}[3]{ %params: text, image name, color of ruler
  \twocolumn[
    \setlength\fboxsep{3pt}
    \setlength\fboxrule{1.5pt}
    \fcolorbox{#3}{white}{\includegraphics[width=60pt]{#2}}
    \hfill \hbox{\fontsize{50}{70}\selectfont \scshape #1}
    \normalsize % Reset font size back to normal

    \textcolor{#3}{\rule{\linewidth}{3pt}}
    \vspace{2em}
  ]
}
\newcommand{\uniline}[4]{
  \textbf{#1}, #2, \emph{#3}\newline \scriptsize{#4}\\
}

\newcommand{\cvtable}[1]{
  \begin{tabularx}{\columnwidth}{p{\lcolwidth{}} | p{\rcolwidth}}
  #1
  \end{tabularx}
}

\newcommand{\cvrow}[2]{
  #1 & #2 \\
}

\newcommand{\bulletlist}[2]{
    \subsection*{#1}
    \begin{itemize}
    \itemsep0.1em
    \renewcommand{\labelitemi}{$\triangleright$}
    #2
    \end{itemize}
}

\newcommand{\bitem}[3] {
    \item \textbf{#1} - \ifnum#2=1 Very good
                            \else\ifnum#2=2 Good
                                \else\ifnum#2=3 Decent
                                    \else\ifnum#2=4 OK
                                    \fi
                                \fi
                            \fi
                        \fi - #3
}

\newcommand{\employment}[4] {
    \subsection*{#2}
    \emph{#1}\\
    #3 \newline\newline
    #4
}

\newcommand{\project}[2] {
    \emph{#1}\newline
    \noindent #2
}
