\documentclass{article}
%include polycode.fmt
\setlength{\parindent}{0pt}
\setlength{\parskip}{1ex plus 0.5ex minus 0.2ex}
\begin{document}

\section*{Exercises from Chapter 1}

\subsection*{Exercise 1.4}
The replacement of the condition |k^2 > n| by |k^2 >= n| in the definition of |ldf| makes no difference. This is because, in the case where |k| is such that |k^2 = n|, the condition |divides k n| is true. Thus the case is handled by the first guarded equation.

\subsection*{Exercise 1.6}
Based only on |divides|, I would guess:  
\begin{spec}
  rem :: Integer -> Integer -> Integer
\end{spec}

\subsection*{Exercise 1.7}
|divides 5| is a procedure that takes an integer as a parameter and returns a boolean value. Thus it is an expression of type |Integer -> Bool|.

|divides 5 7| evaluates to a boolean value, thus it is an expression of type |Bool|.

\subsection*{Exercise 1.9}
A function that gives the maximum of a list of integers, using the predefined function |max|.

\begin{code}
  maxInt         ::  [Int] -> Int
  maxInt []      =   error "empty list"
  maxInt [x]     =   x
  maxInt (x:xs)  =   max x (maxInt xs)
\end{code}

\subsection*{Exercise 1.10}
A function |removeFst| that removes the first occurrence of an integer |m| from a list of integers. If |m| does not occur in the list, the list remains unchanged.

\begin{code}
  removeFst            ::  Int -> [Int] -> [Int]
  removeFst _  []      =   []
  removeFst m  (x:xs)  |   m == x     =  xs
                       |   otherwise  =  x : removeFst m xs
\end{code}

\subsection*{Exercise 1.13}
A function |count| for counting the number of occurences of a character in a string.

\begin{code}
  count            ::  Char -> String -> Int
  count _  []      =   0
  count c  (x:xs)  |   c == x     =  1 + count c xs
                   |   otherwise  =  count c xs
\end{code}

\subsection*{Exercise 1.14}
A function |blowup| that converts a string $a_1, a_2, a_3, \dots$ to $a_1, a_2, a_2, a_3, a_3, a_3 \dots$

Using explicit recursion:
\begin{code}
  blowup  ::  String -> String
  blowup  =   blowHelper 1
    where
      blowHelper            ::  Int -> String -> String
      blowHelper _  []      =   []
      blowHelper n  (x:xs)  =   replicate n x ++ blowHelper (n+1) xs
\end{code}

More elegant solution:
\begin{code}
  blowup'  ::  String -> String
  blowup'  =   concat . (zipWith replicate [1..])
\end{code}

\subsection*{Exercise 1.15}
A function |srtString :: [String] -> [String]| that sorts a list of strings in alphabetical order

\begin{code}
  srtString                ::  [String] -> [String]
  srtString     []         =   []
  srtString     xs         =   m : (srtString (removeString m xs))
    where m = mnmString xs

  removeString             ::  String -> [String] -> [String]
  removeString  _  []      =   []
  removeString  m  (x:xs)  |   m == x     =  xs
                           |   otherwise  =  x : removeString m xs

  mnmString                ::  [String] -> String
  mnmString     []         =   []
  mnmString     [x]        =   x
  mnmString     (x:xs)     =   min x (mnmString xs)
\end{code}

\subsection*{Exercise 1.17}
A function |substring :: String -> String -> Bool| that checks whether |str1| is a substring of |str2|.

\begin{code}
  prefix                  ::  String -> String -> Bool
  prefix  []      ys      =   True
  prefix  (x:xs)  []      =   False
  prefix  (x:xs)  (y:ys)  =   (x==y) && prefix xs ys

  substring               ::  String -> String -> Bool
  substring  []   _       =   True
  substring  _    []      =   False
  substring  xs   (y:ys)  |   prefix xs (y:ys)  =  True
                          |   substring xs ys   =  True
                          |   otherwise         =  False
\end{code}

\subsection*{Exercise 1.18}
Find expressions with the following types:
\begin{enumerate}
  \item |[String]|\\
     answer: |["Text", "More text"]|

  \item |(Bool,String)|\\
     answer: |(True, "Indeed")|

  \item |[(Bool,String)]|\\
     answer: |[(True, "Yes"), (False, "No")]|

  \item |([Bool],String)|\\
     answer: |([True, False], "What?")|

  \item |Bool -> Bool|\\
     answer: |not|
\end{enumerate}

\subsection*{Exercise 1.19}
Find the types of the following predefined functions, supply them with arguments of the expected types, and try to guess what they do.

\begin{enumerate}
  \item |head :: [a] -> a|\\
     returns the first element from a list

  \item |last :: [a] -> a|\\
     returns the last element from a list

  \item |init :: [a] -> [a]|\\
     returns a new list with the last element from the old list removed

  \item |fst :: (a,b) -> a|\\
     returns the first element of a pair

  \item |(++) :: [a] -> [a] -> [a]|\\
     returns a list with the contents of the second list appended to the end of the first list

  \item |flip :: (a -> b -> c) -> b -> a -> c|\\
     given a function of 2 arguments, returns a function with the order of the two arguments interchanged

  \item |flip (++) :: [a] -> [a] -> [a]|\\
     returns a list with the contents of the first list appended to the end of the second list
\end{enumerate}

\subsection*{Exercise 1.20}
Use |map| to write a function |lengths| that takes a list of lists and returns a list of the corresponding list lengths.

\begin{code}
  lengths  ::  [[a]] -> [Int]
  lengths  =   map length
\end{code}

\subsection*{Exercise 1.21}
Use |map| to write a function |sumLengths| that takes a list of lists and returns the sum of their lenghts.

\begin{code}
  sumLengths  ::  [[a]] -> Int
  sumLengths  =   sum . map length
\end{code}

\subsection*{Exercise 1.22}
We modify the defining equation of |ldp| as follows:
\begin{spec}
  ldp  ::  Integer -> Integer
  ldp  =   ldpf primes1
\end{spec}

Now, |ldp| works exactly as though we had written |ldp n = ldpf primes1 n|.

|ldpf| is a function of type |[Integer] -> Integer -> Integer|. What we did above was to supply it with only a first argument, causing it to return a function of type |Integer -> Integer| -- which is what we wanted for |ldp|.

\end{document}
