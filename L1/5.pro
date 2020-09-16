pr(P) :- P >= 2, S is sqrt(P), help(P,2,S).
%pr(2).
%pr(3).
help(P,P1,S) :- P1 =< S , 0 =\= P mod P1, P2 is P1+1, help(P,P2,S).
help(_,P1,S) :- P1 > S.