Exercises from Chapter 1
========================

Exercise 1.4
------------
The replacement of the condition |k^2 > n| by |k^2 >= n| in the definition of |ldf| makes no difference. This is because, in the case where |k| is such that |k^2 = n|, the condition |divides k n| is true. Thus the case is handled by the first guarded equation.

Exercise 1.6
------------
Based only on |divides|, I would guess:  
|rem :: Integer -> Integer -> Integer|

Exercise 1.7
------------
|divides 5| is a procedure that takes an integer as a parameter and returns a boolean value. Thus it is an expression of type |Integer -> Bool|.

|divides 5 7| evaluates to a boolean value, thus it is an expression of type |Bool|.

Exercise 1.9
------------
A function that gives the maximum of a list of integers, using the predefined function |max|.

\begin{code}
  maxInt :: [Int] -> Int
  maxInt []     = error "empty list"
  maxInt [x]    = x
  maxInt (x:xs) = max x (maxInt xs)
\end{code}

Exercise 1.10
-------------
A function |removeFst| that removes the first occurrence of an integer |m| from a list of integers. If |m| does not occur in the list, the list remains unchanged.

\begin{code}
  removeFst :: Int -> [Int] -> [Int]
  removeFst _ []     = []
  removeFst m (x:xs) | m == x    = xs
                     | otherwise = x : removeFst m xs
\end{code}

Exercise 1.13
-------------
A function |count| for counting the number of occurences of a character in a string.

\begin{code}
  count :: Char -> String -> Int
  count _ []     = 0
  count c (x:xs) | c == x    = 1 + count c xs
                 | otherwise = count c xs
\end{code}
