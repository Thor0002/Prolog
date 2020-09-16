map([H1|T1],[H2|T2],P,R) :- map(T1,T2,P,R1),call(P,H1,H2,C),R = [C|R1].
map([],_,_,[]).
map(_,[],_,[]).

add(A,B,C) :- C is A+B.