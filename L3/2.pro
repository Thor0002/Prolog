pr(P) :- P >= 2, S is sqrt(P), help(P,2,S).
help(P,P1,S) :- P1 =< S , 0 =\= P mod P1, P2 is P1+1, help(P,P2,S).
help(_,P1,S) :- P1 > S.

delete([H|T],L) :-   pr(H),delete(T,L1),L = [H | L1];
                   \+pr(H),delete(T,L1),L = L1.
delete([],[]).