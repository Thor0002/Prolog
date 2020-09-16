numlst(0,[0]).
numlst(N,L) :- \+var(N), N=\=0, help(N,[],R),L = R.
numlst(N,L) :- \+var(L),h1(N1,L,_),N is N1.      %reverse(L,L1),h1(N1,L1),N is N1. 
numlst(N,L) :- var(N),var(L),( (N = 1, L= [1]);
                                k(2,N,L) ).
k(K,N,L) :- var(N),var(L),(N = K, numlst(K,L));
            (K1 is K + 1,k(K1,N,L) ).
help(0,L,R) :- R = L.
help(N,L,R) :-N > 0, X is N // 10,Y is N mod 10,help(X,[Y|L],R).
h1(N,[H],1) :- N = H.
h1(N,[H|T],D) :- h1(N1,T,D1), D is D1 * 10, N is H * D + N1.

%h1(N,[H|T]) :- h1(N1,T), N is H + 10 * N1.
%h1(N,[H]) :- N = H.