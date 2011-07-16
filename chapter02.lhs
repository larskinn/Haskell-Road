\documentclass{article}
%include polycode.fmt
%format <+> = "\xor"
%format <=> = "\iff"

\renewcommand{\iff}{\Leftrightarrow}
\newcommand{\xor}{\oplus}

\setlength{\parindent}{0pt}
\setlength{\parskip}{1ex plus 0.5ex minus 0.2ex}
\begin{document}

\section*{Exercises from Chapter 2}

\subsection*{Exercise 2.2}
The truth table for the \emph{exclusive} version of \emph{or}:

\begin{tabular}{ccc}
  \hline
  $P$ & $Q$ & $P \xor Q$ \\
  \hline
   t  &  t  &      f \\
   t  &  f  &      t \\
   f  &  t  &      t \\
   f  &  f  &      f \\
  \hline
\end{tabular}

\subsection*{Exercise 2.4}
The truth table for $\neg (P \iff Q)$:

\begin{tabular}{cccc}
  \hline
  $P$ & $Q$ & $P \iff Q$ & $\neg (P \iff Q)$ \\
  \hline
  t & t &    t    &       f \\
  t & f &    f    &       t \\
  f & t &    f    &       t \\
  f & f &    t    &       f \\
  \hline
\end{tabular}

As we can see, the the column for $\neg (P \iff Q)$ is identical to the column for $P \xor Q$ in exercise 2.2. Then
\begin{spec}
  x <+> y = not (x <=> y) = not (x == y) = x /= y
\end{spec}
Thus the implementation of |(<+>)| is correct.

\subsection*{Exercise 2.9}
\begin{tabular}{ccccccc}
  \hline
  $(P$ & $\iff$ & $Q)$ & $\xor$ & $Q$ & $\iff$ & $P$ \\
  \hline
   t  &  f  & t  &  t  & t &  t  & t \\
   t  &  t  & f  &  t  & f &  t  & t \\
   f  &  t  & t  &  f  & t &  t  & f \\
   f  &  f  & f  &  f  & f &  t  & f \\
  \hline
\end{tabular}

$(P \xor Q) \xor Q \iff P$ is a logical validity, thus $(P \xor Q) \xor Q$ is equivalent to $P$.

\end{document}
