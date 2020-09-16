sirakuz(N,A0) :- help(N,A0,0).
help(N,A0,K) :- K =< N, write(A0), nl, if(A0,R) , K1 is K + 1, help(N,R,K1). 
help(N,_,K) :- K > N.
if(A0,R) :- 0 =:= A0 mod 2, R is A0//2;
            1 =:= A0 mod 2, R is 1+3*A0.