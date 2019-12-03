\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{naklatex}

% Basisklasse laden
\LoadClass[12pt,a4paper]{article}

% Pakete
\RequirePackage[ngerman]{babel}                                             % deutsches Sprachpaket
\RequirePackage[ngerman=ngerman-x-latest]{hyphsubst}
\RequirePackage[utf8]{inputenc}                                             % UTF8 Support
\RequirePackage[babel, german=quotes]{csquotes}                             % Erweiterte Zitationsoptionen
\RequirePackage{graphicx}                                                   % Ermöglicht das Einbinden von Bildern
\RequirePackage[justification=RaggedRight, singlelinecheck=false]{caption}  % Ermöglicht das Beschriften von Bildern
\RequirePackage{subcaption}                                                 % Ermöglicht eine Beschriftung für mehrere Bilder
\RequirePackage{microtype}													% Tool zur verbesserten Textausrichtung in der generierten PDF, siehe http://www.khirevich.com/latex/microtype/
\RequirePackage{eurosym}                                                    % Euro Symbol
\RequirePackage[titles]{tocloft}											% Packet für die Erstellung des Anhangs-Verzeichnisses
\RequirePackage[parfill]{parskip} 											% Keine Einrückung bei neuen Absätzen

% Times New Roman und Zeilenabstand
\RequirePackage{mathptmx}
\RequirePackage[scaled=0.9]{helvet}
\RequirePackage{courier}
\RequirePackage[T1]{fontenc}                                                % Westeuropäisches Encoding & bessere Silbentrennung
\RequirePackage{setspace}
\setstretch{1.25}

% Seitenränder
\RequirePackage[left=2cm,right=2cm,top=2cm,bottom=2cm,footskip=1cm]{geometry}

% Seitenumbrüche per Section
\RequirePackage{titlesec}
\newcommand{\sectionbreak}{\cleardoublepage}

% Kopf- und Fußzeile
\RequirePackage{fancyhdr}
\pagestyle{fancy} 															% eigener Seitenstil
\fancyhf{} 																	% alle Kopf- und Fußzeilenfelder bereinigen
\renewcommand{\headrulewidth}{0pt} 											% obere Trennlinie entfernen
\fancyfoot[R]{\thepage} 													% Seitennummer nach rechts schieben

% Seitennummerierung für die einzelnen Environments vorbereiten
\newcommand{\romannumbering}{
	\pagenumbering{Roman}
	\setcounter{page}{2}}

\newcommand{\arabicnumbering}{
	\newcounter{frontmatter}
	\setcounter{frontmatter}{\value{page}}
	\pagenumbering{arabic}
	\setcounter{page}{1}}

\newcommand{\romannumberingtwo}{
	\pagenumbering{Roman}
	\setcounter{page}{\value{frontmatter}}}

\newenvironment{mainmatter}{\arabicnumbering}{\pagebreak}
\newenvironment{frontmatter}{\romannumbering}{\pagebreak}
\newenvironment{backmatter}{\romannumberingtwo}{}

% Verzeichnisbefehle ergänzen
\newcommand{\inhaltsverzeichnis}{
	\sectionbreak
	\phantomsection
	\tableofcontents}

\newcommand{\abbildungsverzeichnis}{
	\sectionbreak
	\phantomsection
	\addcontentsline{toc}{section}{Abbildungsverzeichnis}
	\addtocontents{lof}{\vskip 0.4cm}
	\listoffigures}

\newcommand{\tabellenverzeichnis}{
	\sectionbreak
	\phantomsection
	\addcontentsline{toc}{section}{Tabellenverzeichnis}
	\addtocontents{lot}{\vskip 0.4cm}
	\listoftables
}

\newcommand{\literaturverzeichnis}{
	\sectionbreak
	\phantomsection
	\addcontentsline{toc}{section}{Literaturverzeichnis}
	\printbibliography[title={Literaturverzeichnis}]
}

% Hyperref muss am Ende, allerdings vor Glossaries geladen werden
 \RequirePackage[hidelinks]{hyperref}
 \hypersetup{bookmarksnumbered}
% Hyperref funktioniert momentan nicht und ich habe noch nicht die Zeit gefunden, herauszufinden wieso das so ist

% Glossar-Paket laden und konfigurieren
\RequirePackage[automake,nonumberlist,acronym,toc]{glossaries}
\makeglossaries