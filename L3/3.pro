pref([],_).
pref([H1|T1],[H2|T2]) :- H1 = H2, pref(T1,T2).
subl(L1,[H|T]) :- pref(L1,[H|T]);subl(L1,T).
sub1([],[]).