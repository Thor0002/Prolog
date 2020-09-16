ch(X) :- X >= 0, help(X,S), 0=:= S mod 2.
help(X,S) :- X > 0, X1 is X div 2, help(X1,S1), S is S1 + X mod 2.
help(0,0).
%help(1,1). 