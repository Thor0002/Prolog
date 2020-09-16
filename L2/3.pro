qntDigit(X,Y,N,K) :- X =< Y, A is abs(X), X1 is X + 1,( (contain(A,N),  qntDigit(X1,Y,N,K1), K is K1 + 1);
                                                        (\+contain(A,N),  qntDigit(X1,Y,N,K1), K is K1) ).
qntDigit(X,Y,_,0) :- X > Y.
contain(A,N) :- A > 9, (N =:= A mod 10; (B is A div 10, contain(B,N) ) ).
contain(0,0).
contain(A,N) :- A > 0, A < 10 , A =:= N. 