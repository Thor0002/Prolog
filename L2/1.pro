sumOfDigits(N,S) :- N1 is abs(N), help(N1,S).
help(N,S) :- N > 0, N1 is N div 10, help(N1,S1), S is S1 + (N mod 10).
help(0,0).
