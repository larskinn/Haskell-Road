\documentclass{article}
%include polycode.fmt
%format <+> = "\xor"
%format <=> = "\iff"
%format ==> = "\Longrightarrow"

\long\def\ignore#1{}

\renewcommand{\iff}{\Leftrightarrow}
\newcommand{\xor}{\oplus}
\newcommand{\implies}{\Rightarrow}

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

\subsection*{Ecercise 2.11}
\begin{enumerate}
\item Law of double negation:

\begin{tabular}{ccccc}
  \hline
  $P$ & $\iff$ & $\neg$ & $\neg$ & $P$ \\
  \hline
   t  &    t   &    t   &    f   &  t  \\
   f  &    t   &    f   &    t   &  f  \\
  \hline
\end{tabular}

\item Laws of idempotence:

\begin{tabular}{ccccc}
  \hline
  $P$ & $\land$ & $P$ & $\iff$ & $P$ \\
  \hline
   t  &    t    &  t  &    t   &  t  \\
   f  &    f    &  f  &    t   &  f  \\
  \hline
\end{tabular}
\quad
\begin{tabular}{ccccc}
  \hline
  $P$ & $\lor$ & $P$ & $\iff$ & $P$ \\
  \hline
   t  &    t    &  t  &    t   &  t  \\
   f  &    f    &  f  &    t   &  f  \\
  \hline
\end{tabular}

\item
\begin{tabular}{cccccccc}
  \hline
  $P$ & $\implies$ & $Q$ & $\iff$ & $\neg$ & $P$ & $\lor$ & $Q$ \\
  \hline
   t  &      t     &  t  &    t   &    f   &  t  &    t   &  t  \\
   t  &      f     &  f  &    t   &    f   &  t  &    f   &  f  \\
   f  &      t     &  t  &    t   &    t   &  f  &    t   &  t  \\
   f  &      t     &  f  &    t   &    t   &  f  &    t   &  f  \\
  \hline
\end{tabular}

\begin{tabular}{ccccccccc}
  \hline
  $\neg$ & $(P$ & $\implies$ & $Q)$ & $\iff$ & $P$ & $\land$ & $\neg$ & $Q$ \\
  \hline
     f   &   t  &      t     &  t   &    t   &  t  &    f    &    f   &  t  \\
     t   &   t  &      f     &  f   &    t   &  t  &    t    &    t   &  f  \\
     f   &   f  &      t     &  t   &    t   &  f  &    f    &    f   &  t  \\
     f   &   f  &      t     &  f   &    t   &  f  &    f    &    t   &  f  \\
  \hline
\end{tabular}

\item Laws of contraposition:

\begin{tabular}{ccccccccc}
  \hline
  $(\neg$ & $P$ & $\implies$ & $\neg$ & $Q)$ & $\iff$ & $(Q$ & $\implies$ & $P)$ \\
  \hline
      f   &  t  &      t     &    f   &  t   &    t   &   t  &      t     &  t   \\
      f   &  t  &      t     &    t   &  f   &    t   &   f  &      t     &  t   \\
      t   &  f  &      f     &    f   &  t   &    t   &   t  &      f     &  f   \\
      t   &  f  &      t     &    t   &  f   &    t   &   f  &      t     &  f   \\
  \hline
\end{tabular}

\begin{tabular}{ccccccccc}
  \hline
  $(P$ & $\implies$ & $\neg$ & $Q)$ & $\iff$ & $(Q$ & $\implies$ & $\neg$ & $P)$ \\
  \hline
    t  &      f     &    f   &  t   &    t   &   t  &      f     &    f   &  t   \\
    t  &      t     &    t   &  f   &    t   &   f  &      t     &    f   &  t   \\
    f  &      t     &    f   &  t   &    t   &   t  &      t     &    t   &  f   \\
    f  &      t     &    t   &  f   &    t   &   f  &      t     &    t   &  f   \\
  \hline
\end{tabular}

\begin{tabular}{ccccccccc}
  \hline
  $(\neg$ & $P$ & $\implies$ & $Q)$ & $\iff$ & $(\neg$ & $Q$ & $\implies$ & $P)$ \\
  \hline
      f   &  t  &      t     &  t   &    t   &     f   &  t  &      t     &  t   \\
      f   &  t  &      t     &  f   &    t   &     t   &  f  &      t     &  t   \\
      t   &  f  &      t     &  t   &    t   &     f   &  t  &      t     &  f   \\
      t   &  f  &      f     &  f   &    t   &     t   &  f  &      f     &  f   \\
  \hline
\end{tabular}

\item
\renewcommand{\tabcolsep}{3pt}
\begin{tabular}{ccccccccccccccccccccc}
  \hline
  $(P$ & $\iff$ & $Q)$ & $\iff$ & $((P$ & $\implies$ & $Q)$ & $\land$ & $(Q$ & $\implies$ & $P))$
                & $\iff$ & $((P$ & $\land$ & $Q)$ & $\lor$ & $(\neg$ & $P$ & $\land$ & $\neg$ & $Q))$ \\
  \hline
 %%(P \iff Q) \iff ((P \implies Q) \land (Q \implies P)) \iff ((P \land Q) \lor (\neg P \land \neg Q))
   t & t & t &  t & t &   t   & t &  t  & t &   t  & t  &  t &  t & t & t &  t &  f & t & f  & f & t  \\ 
   t & f & f &  t & t &   f   & f &  f  & f &   t  & t  &  t &  t & f & f &  f &  f & t & f  & t & f  \\ 
   f & f & t &  t & f &   t   & t &  f  & t &   f  & f  &  t &  f & f & t &  f &  t & f & f  & f & t  \\ 
   f & t & f &  t & f &   t   & f &  t  & f &   t  & f  &  t &  f & f & f &  t &  t & f & t  & t & f  \\ 
  \hline
\end{tabular}
%% Return to default table column seperator
\renewcommand{\tabcolsep}{6pt}

\item Laws of commutativity:

\begin{tabular}{ccccccc}
  \hline
  $P$ & $\land$ & $Q$ & $\iff$ & $Q$ & $\land$ & $P$ \\
  \hline
   t  &    t    &  t  &   t    &  t  &    t    &  t  \\
   t  &    f    &  f  &   t    &  f  &    f    &  t  \\
   f  &    f    &  t  &   t    &  t  &    f    &  f  \\
   f  &    f    &  f  &   t    &  f  &    f    &  f  \\
  \hline
\end{tabular}
\quad
\begin{tabular}{ccccccc}
  \hline
  $P$ & $\lor$ & $Q$ & $\iff$ & $Q$ & $\lor$ & $P$ \\
  \hline
   t  &    t   &  t  &   t    &  t  &    t   &  t  \\
   t  &    t   &  f  &   t    &  f  &    t   &  t  \\
   f  &    t   &  t  &   t    &  t  &    t   &  f  \\
   f  &    f   &  f  &   t    &  f  &    f   &  f  \\
  \hline
\end{tabular}

\item DeMorgan laws:

\begin{tabular}{cccccccccc}
  \hline
  $\neg$ & $(P$ & $\land$ & $Q)$ & $\iff$ & $\neg$ & $P$ & $\lor$ & $\neg$ & $Q$ \\
  \hline
     f   &   t  &    t    &  t   &    t   &    f   &  t  &    f   &    f   &  t  \\
     t   &   t  &    f    &  f   &    t   &    f   &  t  &    t   &    t   &  f  \\
     t   &   f  &    f    &  t   &    t   &    t   &  f  &    t   &    f   &  t  \\
     t   &   f  &    f    &  f   &    t   &    t   &  f  &    t   &    t   &  f  \\
  \hline
\end{tabular}

\begin{tabular}{cccccccccc}
  \hline
  $\neg$ & $(P$ & $\lor$ & $Q)$ & $\iff$ & $\neg$ & $P$ & $\land$ & $\neg$ & $Q$ \\
  \hline
     f   &   t  &   t    &  t   &    t   &    f   &  t  &    f    &    f   &  t  \\
     f   &   t  &   t    &  f   &    t   &    f   &  t  &    f    &    t   &  f  \\
     f   &   f  &   t    &  t   &    t   &    t   &  f  &    f    &    f   &  t  \\
     t   &   f  &   f    &  f   &    t   &    t   &  f  &    t    &    t   &  f  \\
  \hline
\end{tabular}

\item Laws of associativity:

\begin{tabular}{ccccccccccc}
  \hline
  $P$ & $\land$ & $(Q$ & $\land$ & $R)$ & $\iff$ & $(P$ & $\land$ & $Q)$ & $\land$ & $R$ \\
  \hline
   t  &    t    &   t  &    t    &  t   &   t    &   t  &    t    &  t   &    t    &  t  \\
   t  &    f    &   t  &    f    &  f   &   t    &   t  &    t    &  t   &    f    &  f  \\
   t  &    f    &   f  &    f    &  t   &   t    &   t  &    f    &  f   &    f    &  t  \\
   t  &    f    &   f  &    f    &  f   &   t    &   t  &    f    &  f   &    f    &  f  \\
   f  &    f    &   t  &    t    &  t   &   t    &   f  &    f    &  t   &    f    &  t  \\
   f  &    f    &   t  &    f    &  f   &   t    &   f  &    f    &  t   &    f    &  f  \\
   f  &    f    &   f  &    f    &  t   &   t    &   f  &    f    &  f   &    f    &  t  \\
   f  &    f    &   f  &    f    &  f   &   t    &   f  &    f    &  f   &    f    &  f  \\
  \hline
\end{tabular}

\begin{tabular}{ccccccccccc}
  \hline
  $P$ & $\lor$ & $(Q$ & $\lor$ & $R)$ & $\iff$ & $(P$ & $\lor$ & $Q)$ & $\lor$ & $R$ \\
  \hline
   t  &    t   &   t  &    t   &  t   &   t    &   t  &   t    &  t   &   t    &  t  \\
   t  &    t   &   t  &    t   &  f   &   t    &   t  &   t    &  t   &   t    &  f  \\
   t  &    t   &   f  &    t   &  t   &   t    &   t  &   t    &  f   &   t    &  t  \\
   t  &    t   &   f  &    f   &  f   &   t    &   t  &   t    &  f   &   t    &  f  \\
   f  &    t   &   t  &    t   &  t   &   t    &   f  &   t    &  t   &   t    &  t  \\
   f  &    t   &   t  &    t   &  f   &   t    &   f  &   t    &  t   &   t    &  f  \\
   f  &    t   &   f  &    t   &  t   &   t    &   f  &   f    &  f   &   t    &  t  \\
   f  &    f   &   f  &    f   &  f   &   t    &   f  &   f    &  f   &   f    &  f  \\
  \hline
\end{tabular}

\item Distribution laws:

\begin{tabular}{ccccccccccccc}
  \hline
  $P$ & $\land$ & $(Q$ & $\lor$ & $R)$ & $\iff$ & $(P$ & $\land$ & $Q)$ & $\lor$ & $(P$ & $\land$ & $R)$ \\
  \hline
   t  &    t    &   t  &    t   &  t   &    t   &   t  &    t    &  t   &    t   &   t  &    t    &  t   \\
   t  &    t    &   t  &    t   &  f   &    t   &   t  &    t    &  t   &    t   &   t  &    f    &  f   \\
   t  &    t    &   f  &    t   &  t   &    t   &   t  &    f    &  f   &    t   &   t  &    t    &  t   \\
   t  &    f    &   f  &    f   &  f   &    t   &   t  &    f    &  f   &    f   &   t  &    f    &  f   \\
   f  &    f    &   t  &    t   &  t   &    t   &   f  &    f    &  t   &    f   &   f  &    f    &  t   \\
   f  &    f    &   t  &    t   &  f   &    t   &   f  &    f    &  t   &    f   &   f  &    f    &  f   \\
   f  &    f    &   f  &    t   &  t   &    t   &   f  &    f    &  f   &    f   &   f  &    f    &  t   \\
   f  &    f    &   f  &    f   &  f   &    t   &   f  &    f    &  f   &    f   &   f  &    f    &  f   \\
  \hline
\end{tabular}

\begin{tabular}{ccccccccccccc}
  \hline
  $P$ & $\lor$ & $(Q$ & $\land$ & $R)$ & $\iff$ & $(P$ & $\lor$ & $Q)$ & $\land$ & $(P$ & $\lor$ & $R)$ \\
  \hline
   t  &    t   &   t  &    t    &  t   &    t   &   t  &    t   &  t   &    t    &   t  &    t   &  t   \\
   t  &    t   &   t  &    f    &  f   &    t   &   t  &    t   &  t   &    t    &   t  &    t   &  f   \\
   t  &    t   &   f  &    f    &  t   &    t   &   t  &    t   &  f   &    t    &   t  &    t   &  t   \\
   t  &    t   &   f  &    f    &  f   &    t   &   t  &    t   &  f   &    t    &   t  &    t   &  f   \\
   f  &    t   &   t  &    t    &  t   &    t   &   f  &    t   &  t   &    t    &   f  &    t   &  t   \\
   f  &    f   &   t  &    f    &  f   &    t   &   f  &    t   &  t   &    f    &   f  &    f   &  f   \\
   f  &    f   &   f  &    f    &  t   &    t   &   f  &    f   &  f   &    f    &   f  &    t   &  t   \\
   f  &    f   &   f  &    f    &  f   &    t   &   f  &    f   &  f   &    f    &   f  &    f   &  f   \\
  \hline
\end{tabular}
\end{enumerate}

\subsection*{Exercise 2.13}
Checks for the principles from Theorem 2.12:
\begin{code}
  import TAMO

  test'1a  =  not True == False
  test'1b  =  not False == True
  test'2   =  logEquiv1 (\ p -> p ==> False) (\ p -> not p)
  test'3a  =  logEquiv1 (\ p -> p || True) (\ p -> True)
  test'3b  =  logEquiv1 (\ p -> p && False) (\ p -> False)
  test'4a  =  logEquiv1 (\ p -> p || False) id
  test'4b  =  logEquiv1 (\ p -> p && True) id
  test'5   =  logEquiv1 (\ p -> p || not p) (\ p -> True)
  test'6   =  logEquiv1 (\ p -> p && not p) (\ p -> False)
\end{code}

\subsection*{Exercise 2.15}
Contradiction tests for propositional functions with one, two and three variables:
\begin{code}
  bools = [True, False]

  contra1     ::  (Bool -> Bool) -> Bool
  contra1 bf  =   and [not (bf p) | p <- bools]

  contra2     ::  (Bool -> Bool -> Bool) -> Bool
  contra2 bf  =   and [not (bf p q) |  p <- bools, q <- bools]

  contra3     ::  (Bool -> Bool -> Bool -> Bool) -> Bool
  contra3 bf  =   and [not (bf p q r) |  p <- bools, q <- bools, r <- bools]
\end{code}

\end{document}
