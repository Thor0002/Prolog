rev(L,R) :- help(L,[],R).
help([],X,X).
help([H | T], L,R) :- L1 = [H | L], help(T,L1,R).
palindrome(L) :- downl(L,L1),rev(L1,Lr), L1 = Lr .
downl([H|T],R) :- lower_upper(H1,H),downl(T,R1), R = [H1|R1].
downl([],[]).
