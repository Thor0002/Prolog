foldl(X0,F,L,R) :- help(X0,F,L,R1),R = R1.
help(X,_,[],X).
help(X,F,[H|T],R) :- call(F,X,H,A),help(A,F,T,R).