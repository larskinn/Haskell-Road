\documentclass[leqno]{article}
%include polycode.fmt
%format <+> = "\xor"
%format <=> = "\iff"
%format ==> = "\Longrightarrow"

\usepackage{amsmath}

\long\def\ignore#1{}

\renewcommand{\iff}{\Leftrightarrow}
\newcommand{\xor}{\oplus}
\renewcommand{\implies}{\Rightarrow}

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

\subsection*{Exercise 2.16}
Useful denials for every sentence of Exercise 2.31:
\begin{enumerate}
  \item The equation $x^2 + 1 = 0$ does not have a solution.
  \item A largest natural number exists.
  \item The number 13 is not prime.
  \item The number $n$ is not prime.
  \item There are a finite number of primes.
\end{enumerate}

\subsection*{Exercise 2.17}
A denial for the statement that $x < y < z$ (where $x,y,z \in \mathbb{R}$):

$x < y < z \equiv x < y \land y < z$. Thus we can use the First Law of DeMorgan. 
\[ \neg (x < y < z) \equiv \neg (x < y \land y < z) \equiv x \geq y \lor y \geq z \]

\subsection*{Exercise 2.18}
\begin{equation*}
  \tag*{1.}
  \begin{aligned}
    (\Phi \iff \Psi) & \equiv ((\Phi \implies \Psi) \land (\Psi \implies \Phi))
                       && \text{by Theorem 2.10, 5} \\
                     & \equiv ((\neg \Psi \implies \neg \Phi) \land (\neg \Phi \implies \neg \Psi))
                       && \text{by contraposition} \\
                     & \equiv ((\neg \Phi \implies \neg \Psi) \land (\neg \Psi \implies \neg \Phi))
                       && \text{by commutativity of } \land \\
                     & \equiv (\neg \Phi \iff \neg \Psi)
                       && \text{by Theorem 2.10, 5}
  \end{aligned}
\end{equation*}

\begin{equation*}
  \tag*{2.}
  \begin{aligned}
    (\neg \Phi \iff \Psi) & \equiv ((\neg \Phi \implies \Psi) \land (\Psi \implies \neg \Phi))
                            && \text{by Theorem 2.10, 5} \\
                          & \equiv ((\neg \Psi \implies \Phi) \land (\Phi \implies \neg \Psi))
                            && \text{by contraposition} \\
                          & \equiv ((\Phi \implies \neg \Psi) \land (\neg \Psi \implies \Phi))
                            && \text{by commutativity of } \land \\
                          & \equiv (\Phi \iff \neg \Psi)
                            && \text{by Theorem 2.10, 5}
  \end{aligned}
\end{equation*}

\subsection*{Exercise 2.19}
$\Phi \equiv \Psi$ means that, no matter the truth values of $P, Q, \dots$ occuring in the formulas, the formulas $\Phi$ and $\Psi$ produce the same truth values: either both are true, or both are false. In both situations, $\Phi \iff \Psi$ is true.
Thus $(\Phi \equiv \Psi) \implies (\Phi \iff \Psi)$.

Since $\Phi \iff \Psi$ is only true when $\Phi$ and $\Psi$ have the same truth values, we also have $(\Phi \iff \Psi) \implies (\Phi \equiv \Psi)$. By part 5 of Theorem 2.10 we conclude that $(\Phi \equiv \Psi) \iff (\Phi \iff \Psi)$.

\subsection*{Exercise 2.20}
\begin{enumerate}
  \item $\neg P \implies Q$ and $P \implies \neg Q$ are not equivalent. The truth table below shows that $(\neg P \implies Q) \iff (P \implies \neg Q)$ is not a logical validity:
        \begin{center}
        \begin{tabular}{ccccccccc}
          \hline
          $(\neg$ & $P$ & $\implies$ & $Q)$ & $\iff$ & $(P$ & $\implies$ & $\neg$ & $Q)$ \\
          \hline
              f   &  t  &      t     &  t   &    f   &   t  &      f     &    f   &  t   \\
              f   &  t  &      t     &  f   &    t   &   t  &      t     &    t   &  f   \\
              t   &  f  &      t     &  t   &    t   &   f  &      t     &    f   &  t   \\
              t   &  f  &      f     &  f   &    f   &   f  &      t     &    t   &  f   \\
          \hline
        \end{tabular}
        \end{center}
        Verifying with Haskell:
        \begin{spec}
          logEquiv2 (\ p q -> not p ==> q) (\ p q -> p ==> not q)
          False
        \end{spec}

  \item $\neg P \implies Q$ and $Q \implies \neg P$ are not equivalent. By part 4 of Theorem 2.10 we see that $Q \implies \neg P$ is the contrapositive of $P \implies \neg Q$, which we have already shown to be non-equivalent to $\neg P \implies Q$.

        Verifying with Haskell:
        \begin{spec}
          logEquiv2 (\ p q -> not p ==> q) (\ p q -> q ==> not p)
          False
        \end{spec}

  \item $\neg P \implies Q$ and $\neg Q \implies P$ are equivalent, by part 4 of Theorem 2.10.

        Verifying with Haskell:
        \begin{spec}
          logEquiv2 (\ p q -> not p ==> q) (\ p q -> not q ==> p)
          True
        \end{spec}

  \item $P \implies (Q \implies R)$ and $Q \implies (P \implies R)$ are equivalent:
        \begin{align*}
          (P \implies (Q \implies R))   &\equiv \neg P \lor (\neg Q \lor R)
            && \text{by Theorem 2.10, part 3} \\
                                        &\equiv \neg P \lor \neg Q \lor R
            && \text{by associativity of } \lor \\
                                        &\equiv \neg Q \lor \neg P \lor R
            && \text{by commutativity of } \lor \\
                                        &\equiv \neg Q \lor (\neg P \lor R)
            && \text{by associativity of } \lor \\
                                        &\equiv (Q \implies (P \implies R))
            && \text{by Theorem 2.10, part 3}
        \end{align*}
        Verifying with Haskell:
        \begin{spec}
          logEquiv3 (\ p q r -> p ==> (q ==> r)) (\ p q r -> q ==> (p ==> r))
          True
        \end{spec}

  \item $P \implies (Q \implies R)$ and $(P \implies Q) \implies R$ are not equivalent:
        \begin{align*}
          (P \implies (Q \implies R))   &\equiv \neg P \lor (\neg Q \lor R)
            && \text{by Theorem 2.10, part 3} \\
                                        &\equiv \neg P \lor \neg Q \lor R
            && \text{by associativity of } \lor \\
                                        &\equiv \neg (P \land Q) \lor R
            && \text{by DeMorgan} \\
                                        &\equiv (P \land Q) \implies R
            && \text{by Theorem 2.10, part 3} \\
        \end{align*}
        Now, if $(P \land Q) \implies R$ and $(P \implies Q) \implies R$ are equivalent,
        then $P \land Q$ and $P \implies Q$ must also be equivalent. We check using a truth table:
        \begin{center}
        \begin{tabular}{ccccccc}
          \hline
          $P$ & $\land$ & $Q$ & $\iff$ & $(P$ & $\implies$ & $Q)$ \\
          \hline
           t  &    t    &  t  &    t   &   t  &      t     &  t   \\
           t  &    f    &  f  &    t   &   t  &      f     &  f   \\
           f  &    f    &  t  &    f   &   f  &      t     &  t   \\
           f  &    f    &  f  &    f   &   f  &      t     &  f   \\
          \hline
        \end{tabular}
        \end{center}
        As we can see from the $\iff$ column, the two are not equivalent. Thus $P \implies (Q \implies R)$ and $(P \implies Q) \implies R$ are not equivalent.

        Verifying with Haskell:
        \begin{spec}
          logEquiv3 (\ p q r -> p ==> (q ==> r)) (\ p q r -> (p ==> q) ==> r)
          False
        \end{spec}

  \item $(P \implies Q) \implies P$ and $P$ are equivalent:
        \begin{center}
        \begin{tabular}{ccccccc}
          \hline
          $(P$ & $\implies$ & $Q)$ & $\implies$ & $P$ & $\iff$ & $P$ \\
          \hline
            t  &      t     &  t   &     t      &  t  &    t   &  t  \\
            t  &      f     &  f   &     t      &  t  &    t   &  t  \\
            f  &      t     &  t   &     f      &  f  &    t   &  f  \\
            f  &      t     &  f   &     f      &  f  &    t   &  f  \\
          \hline
        \end{tabular}
        \end{center}
        Verifying with Haskell:
        \begin{spec}
          logEquiv2 (\ p q -> (p ==> q) ==> p) (\ p q -> p)
          True
        \end{spec}
  
  \item $P \lor Q \implies R$ and $(P \implies R) \land (Q \implies R)$ are equivalent:
        \begin{align*}
          (P \lor Q \implies R) &\equiv \neg (P \lor Q) \lor R
              && \text{by Theorem 2.10, part 3} \\
                                &\equiv (\neg P \land \neg Q) \lor R
              && \text{by DeMorgan} \\
                                &\equiv (\neg P \lor R) \land (\neg Q \lor R)
              && \text{by distribution} \\
                                &\equiv (P \implies R) \land (Q \implies R)
              && \text{by Theorem 2.10, part 3}
        \end{align*}
        Verifying with Haskell:
        \begin{spec}
          logEquiv3 (\ p q r -> p || q ==> r) (\ p q r -> (p ==> r) && (q ==> r))
          True
        \end{spec}
\end{enumerate}

\subsection*{Exercise 2.21}
\begin{enumerate}
  \item
  Let $\Phi$ be defined as $P \lor \neg Q$. Now $\Phi$ has the desired truth table:
  \begin{center}
    \begin{tabular}{cccc||c}
      \hline
      $P$ & $\lor$ & $\neg$ & $Q$ & $\Phi$ \\
      \hline
       t  &    t   &    f   &  t  &    t   \\
       t  &    t   &    t   &  f  &    t   \\
       f  &    f   &    f   &  t  &    f   \\
       f  &    t   &    t   &  f  &    t   \\
      \hline
    \end{tabular}
  \end{center}

  \item
  There are a total of $2^4 = 16$ truth tables for 2-letter formulas.

  \item
  All 16 truth tables, with formulas, are listed in table~\ref{tab:2letterformulas} on page~\pageref{tab:2letterformulas}.

  \begin{table}
  \begin{tabular}{ll}
      \begin{tabular}{||cc||c||}
        \hline
        $P$ & $Q$ & $\Phi$ \\
        \hline
         t  &  t  &    f   \\
         t  &  f  &    f   \\
         f  &  t  &    f   \\
         f  &  f  &    f   \\
        \hline
      \end{tabular}
      \quad $\Phi := P \land \neg P$
      &
      \begin{tabular}{||cc||c||}
        \hline
        $P$ & $Q$ & $\Phi$ \\
        \hline
         t  &  t  &    f   \\
         t  &  f  &    f   \\
         f  &  t  &    f   \\
         f  &  f  &    t   \\
        \hline
      \end{tabular}
      \quad $\Phi := \neg (P \lor Q)$
      \\
      \begin{tabular}{||cc||c||}
        \hline
        $P$ & $Q$ & $\Phi$ \\
        \hline
         t  &  t  &    f   \\
         t  &  f  &    f   \\
         f  &  t  &    t   \\
         f  &  f  &    f   \\
        \hline
      \end{tabular}
      \quad $\Phi := \neg P \land Q$
      &
      \begin{tabular}{||cc||c||}
        \hline
        $P$ & $Q$ & $\Phi$ \\
        \hline
         t  &  t  &    f   \\
         t  &  f  &    f   \\
         f  &  t  &    t   \\
         f  &  f  &    t   \\
        \hline
      \end{tabular}
      \quad $\Phi := \neg P$
      \\
      \begin{tabular}{||cc||c||}
        \hline
        $P$ & $Q$ & $\Phi$ \\
        \hline
         t  &  t  &    f   \\
         t  &  f  &    t   \\
         f  &  t  &    f   \\
         f  &  f  &    f   \\
        \hline
      \end{tabular}
      \quad $\Phi := P \land \neg Q$
      &
      \begin{tabular}{||cc||c||}
        \hline
        $P$ & $Q$ & $\Phi$ \\
        \hline
         t  &  t  &    f   \\
         t  &  f  &    t   \\
         f  &  t  &    f   \\
         f  &  f  &    t   \\
        \hline
      \end{tabular}
      \quad $\Phi := \neg Q$
      \\
      \begin{tabular}{||cc||c||}
        \hline
        $P$ & $Q$ & $\Phi$ \\
        \hline
         t  &  t  &    f   \\
         t  &  f  &    t   \\
         f  &  t  &    t   \\
         f  &  f  &    f   \\
        \hline
      \end{tabular}
      \quad $\Phi := (P \land \neg Q) \lor (\neg P \land Q)$
      &
      \begin{tabular}{||cc||c||}
        \hline
        $P$ & $Q$ & $\Phi$ \\
        \hline
         t  &  t  &    f   \\
         t  &  f  &    t   \\
         f  &  t  &    t   \\
         f  &  f  &    t   \\
        \hline
      \end{tabular}
      \quad $\Phi := \neg (P \land Q)$
      \\
      \begin{tabular}{||cc||c||}
        \hline
        $P$ & $Q$ & $\Phi$ \\
        \hline
         t  &  t  &    t   \\
         t  &  f  &    f   \\
         f  &  t  &    f   \\
         f  &  f  &    f   \\
        \hline
      \end{tabular}
      \quad $\Phi := P \land Q$
      &
      \begin{tabular}{||cc||c||}
        \hline
        $P$ & $Q$ & $\Phi$ \\
        \hline
         t  &  t  &    t   \\
         t  &  f  &    f   \\
         f  &  t  &    f   \\
         f  &  f  &    t   \\
        \hline
      \end{tabular}
      \quad $\Phi := (P \land Q) \lor \neg (P \lor Q)$
      \\
      \begin{tabular}{||cc||c||}
        \hline
        $P$ & $Q$ & $\Phi$ \\
        \hline
         t  &  t  &    t   \\
         t  &  f  &    f   \\
         f  &  t  &    t   \\
         f  &  f  &    f   \\
        \hline
      \end{tabular}
      \quad $\Phi := Q$
      &
      \begin{tabular}{||cc||c||}
        \hline
        $P$ & $Q$ & $\Phi$ \\
        \hline
         t  &  t  &    t   \\
         t  &  f  &    f   \\
         f  &  t  &    t   \\
         f  &  f  &    t   \\
        \hline
      \end{tabular}
      \quad $\Phi := \neg P \lor Q$
      \\
      \begin{tabular}{||cc||c||}
        \hline
        $P$ & $Q$ & $\Phi$ \\
        \hline
         t  &  t  &    t   \\
         t  &  f  &    t   \\
         f  &  t  &    f   \\
         f  &  f  &    f   \\
        \hline
      \end{tabular}
      \quad $\Phi := P$
      &
      \begin{tabular}{||cc||c||}
        \hline
        $P$ & $Q$ & $\Phi$ \\
        \hline
         t  &  t  &    t   \\
         t  &  f  &    t   \\
         f  &  t  &    f   \\
         f  &  f  &    t   \\
        \hline
      \end{tabular}
      \quad $\Phi := P \lor \neg Q$
      \\
      \begin{tabular}{||cc||c||}
        \hline
        $P$ & $Q$ & $\Phi$ \\
        \hline
         t  &  t  &    t   \\
         t  &  f  &    t   \\
         f  &  t  &    t   \\
         f  &  f  &    f   \\
        \hline
      \end{tabular}
      \quad $\Phi := P \lor Q$
      &
      \begin{tabular}{||cc||c||}
        \hline
        $P$ & $Q$ & $\Phi$ \\
        \hline
         t  &  t  &    t   \\
         t  &  f  &    t   \\
         f  &  t  &    t   \\
         f  &  f  &    t   \\
        \hline
      \end{tabular}
      \quad $\Phi := P \lor \neg P$
  \end{tabular}
  \caption{The 16 truth tables for 2-letter formulas}
  \label{tab:2letterformulas}
  \end{table}

  \item
  I do not know if there is a general method for finding these formulas.
  There probably is, seeing as constructing the above formulas was very easy,
  but I am unable to precisely define the process.

  \item
  There would be a total of $2^8 = 256$ truth tables for 3-letter formulas.
  As for the question of a general method of finding the formulas, see the previous
  answer.
\end{enumerate}

\subsection*{Exercise 2.26}
\begin{enumerate}
  \item
  $\exists x,y \in \mathbb{Q} ~ (x < y)$

  \item
  $\forall x \in \mathbb{R} ~ \exists y \in {R} ~ (x < y)$

  \item
  $\forall x \in \mathbb{Z} ~ \exists m,n \in \mathbb{N} ~ (x = m - n)$
\end{enumerate}

\subsection*{Exercise 2.27}
\begin{enumerate}
  \item
  $\forall x ~ (x \in \mathbb{Q} \implies
   \exists m,n ~ (m \in \mathbb{Z} \land n \in \mathbb{Z} \implies
   n \neq 0 \land x = m/n))$

  \item
  $\forall x,y ~ (x \in F \land y \in D \implies (Oxy \implies Bxy))$
\end{enumerate}

\subsection*{Exercise 2.31}
\begin{enumerate}
  \item
  The equation $x^2 + 1 = 0$ has a solution: \\
  $\exists x~(x^2 + 1 = 0)$

  \item
  A largest natural number does not exist: \\
  $\forall x \in \mathbb{N}~\exists y \in \mathbb{N}~(x < y)$

  \item
  The number 13 is prime ($d||n$ means `$d$ divides $n$'): \\
  $\forall d~(d||13 \implies d = 1 \lor d = 13)$

  \item
  The number $n$ is prime: \\
  $\forall d~(n \neq 1 \land (d||n \implies d = 1 \lor d = n))$

  \item
  There are infinitely many primes: \\
  $\forall x~(\exists n \forall d~
   (n \neq 1 \land (d||n \implies d = 1 \lor d = n) \land x < n))$
\end{enumerate}

\end{document}
