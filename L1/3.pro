fact(N,S) :- 0 =:= N mod 2, chet(N,S);
             1 =:= N mod 2, nech(N,S).
nech(N,S) :- N >= 3, N1 is N-2, nech(N1,S1), S is S1*N.
nech(1,1).
chet(N,S) :- N >= 2, N1 is N-2, chet(N1,S1), S is S1*N.
chet(2,2).
