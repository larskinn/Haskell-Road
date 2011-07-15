Exercises from Chapter 2
========================

Exercise 2.2
------------
The truth table for the *exclusive* version of *or*:
 
 P | Q | P XOR Q  
 t | t |    f  
 t | f |    t  
 f | t |    t  
 f | f |    f

Exercise 2.4
------------
The truth table for |not (P <=> Q)|:

 P | Q | P <=> Q | not (P <=> Q)  
 t | t |    t    |       f  
 t | f |    f    |       t  
 f | t |    f    |       t  
 f | f |    t    |       f  

As we can see, the the column for |not (P <=> Q)| is identical to the column for |P XOR Q| in exercise 2.2. Then |x <+> y = not (x <=> y) = not (x == y) = x /= y|, and the implementation of |<+>| is correct.

Exercise 2.9
------------

(P <+> Q) <+> Q <=> P
 t  f  t   t  t  t  t
 t  t  f   t  f  t  t
 f  t  t   f  t  t  f
 f  f  f   f  f  t  f

|(P <+> Q) <+> Q <=> P| is a logical validity, thus |(P <+> Q) <+> Q| is equivalent to |P|.
