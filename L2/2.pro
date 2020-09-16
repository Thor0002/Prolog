toSquares(X,X,1).
toSquares(X,Y,K) :- X =\= Y, Min is min(X,Y), Max is max(X,Y), X1 is Max - Min, toSquares(X1,Min,K1), K is K1 + 1.
