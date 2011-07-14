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

Exercise 1.14
-------------
A function |blowup| that converts a string $a_1, a_2, a_3, \dots$ to $a_1, a_2, a_2, a_3, a_3, a_3 \dots$

Using explicit recursion:
\begin{code}
  blowup :: String -> String
  blowup = blowHelper 1
    where
      blowHelper :: Int -> String -> String
      blowHelper _ []     = []
      blowHelper n (x:xs) = replicate n x ++ blowHelper (n+1) xs
\end{code}

More elegant solution:
\begin{code}
  blowup' :: String -> String
  blowup' = concat . (zipWith replicate [1..])
\end{code}

Exercise 1.15
-------------
A function |srtString :: [String] -> [String]| that sorts a list of strings in alphabetical order

\begin{code}
  srtString :: [String] -> [String]
  srtString [] = []
  srtString xs = m : (srtString (removeString m xs))
    where m = mnmString xs

  removeString :: String -> [String] -> [String]
  removeString _ []     = []
  removeString m (x:xs) | m == x    = xs
                        | otherwise = x : removeString m xs

  mnmString :: [String] -> String
  mnmString []     = []
  mnmString [x]    = x
  mnmString (x:xs) = min x (mnmString xs)
\end{code}

Exercise 1.17
-------------
A function |substring :: String -> String -> Bool| that checks whether |str1| is a substring of |str2|.

\begin{code}
  prefix :: String -> String -> Bool
  prefix []     ys     = True
  prefix (x:xs) []     = False
  prefix (x:xs) (y:ys) = (x==y) && prefix xs ys

  substring :: String -> String -> Bool
  substring [] _                         = True
  substring _  []                        = False
  substring xs (y:ys) | prefix xs (y:ys) = True
                      | substring xs ys  = True
                      | otherwise        = False
\end{code}

Exercise 1.18
-------------
Find expressions with the following types:

1. [String]  
   answer: ["Text", "More text"]

2. (Bool,String)  
   answer: (True, "Indeed")

3. [(Bool,String)]  
   answer: [(True, "Yes"), (False, "No")]

4. ([Bool],String)  
   answer: ([True, False], "What?")

5. Bool -> Bool  
   answer: not

Exercise 1.19
-------------
Find the types of the following predefined functions, supply them with arguments of the expected types, and try to guess what they do.

1. head :: [a] -> a  
   returns the first element from a list

2. last :: [a] -> a  
   returns the last element from a list

3. init :: [a] -> [a]  
   returns a new list with the last element from the old list removed

4. fst :: (a,b) -> a  
   returns the first element of a pair

5. (++) :: [a] -> [a] -> [a]  
   returns a list with the contents of the second list appended to the end of the first list

6. flip :: (a -> b -> c) -> b -> a -> c  
   given a function of 2 arguments, returns a function with the order of the two arguments interchanged

7. flip (++) :: [a] -> [a] -> [a]  
   returns a list with the contents of the first list appended to the end of the second list

Exercise 1.20
-------------
Use |map| to write a function |lengths| that takes a list of lists and returns a list of the corresponding list lengths.

\begin{code}
  lengths :: [[a]] -> [Int]
  lengths = map length
\end{code}

Exercise 1.21
-------------
Use |map| to write a function |sumLengths| that takes a list of lists and returns the sum of their lenghts.

\begin{code}
  sumLengths :: [[a]] -> Int
  sumLengths = sum . map length
\end{code}

Exercise 1.22
-------------
We modify the defining equation of |ldp| as follows:
\begin{spec}
  ldp :: Integer -> Integer
  ldp = ldpf primes1
\end{spec}

Now, ldp works exactly as though we had written |ldp n = ldpf primes1 n|.

ldpf is a function of type |[Integer] -> Integer -> Integer|. What we did above was to supply it with only a first argument, causing it to return a function of type |Integer -> Integer| -- which is what we wanted for ldp.
