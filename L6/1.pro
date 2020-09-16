%state(B,P,C,F,M,S1,S2,D1,D2)
start(ResPath) :- dfs(state(left,left,left,left,left,left,left,left,left),
                      state(right,right,right,right,right,right,right,right,right),[],ResPath).

dfs(Target,Target,Path,[Target|Path]).
dfs(V,Target,Path,ResPath) :-    move(V,U), 
  \+ unsafe(U),
  \+ member(U,Path),
  dfs(U,Target,[V|Path], ResPath).

opposite(left,right).
opposite(right,left).
move(state(P,P,C,F,M,S1,S2,D1,D2),state(P1,P1,C,F,M,S1,S2,D1,D2)) :- opposite(P,P1).
move(state(P,P,P,F,M,S1,S2,D1,D2),state(P1,P1,P1,F,M,S1,S2,D1,D2)) :- opposite(P,P1).
move(state(P,P,C,P,M,S1,S2,D1,D2),state(P1,P1,C,P1,M,S1,S2,D1,D2)) :- opposite(P,P1).
move(state(P,P,C,F,P,S1,S2,D1,D2),state(P1,P1,C,F,P1,S1,S2,D1,D2)) :- opposite(P,P1).
move(state(P,P,C,F,M,P,S2,D1,D2), state(P1,P1,C,F,M,P1,S2,D1,D2)) :- opposite(P,P1).
move(state(P,P,C,F,M,S1,P,D1,D2), state(P1,P1,C,F,M,S1,P1,D1,D2)) :- opposite(P,P1).
move(state(P,P,C,F,M,S1,S2,P,D2), state(P1,P1,C,F,M,S1,S2,P1,D2)) :- opposite(P,P1).
move(state(P,P,C,F,M,S1,S2,D1,P), state(P1,P1,C,F,M,S1,S2,D1,P1)) :- opposite(P,P1).

move(state(F,P,C,F,M,S1,S2,D1,D2),state(F1,P,C,F1,M,S1,S2,D1,D2)) :- opposite(F,F1).
move(state(F,P,C,F,F,S1,S2,D1,D2),state(F1,P,C,F1,F1,S1,S2,D1,D2)) :- opposite(F,F1).
move(state(F,P,C,F,M,F,S2,D1,D2), state(F1,P,C,F1,M,F1,S2,D1,D2)) :- opposite(F,F1).
move(state(F,P,C,F,M,S1,F,D1,D2), state(F1,P,C,F1,M,S1,F1,D1,D2)) :- opposite(F,F1).
move(state(F,P,C,F,M,S1,S2,F,D2), state(F1,P,C,F1,M,S1,S2,F1,D2)) :- opposite(F,F1).
move(state(F,P,C,F,M,S1,S2,D1,F), state(F1,P,C,F1,M,S1,S2,D1,F1)) :- opposite(F,F1).

move(state(M,P,C,F,M,S1,S2,D1,D2),state(M1,P,C,F,M1,S1,S2,D1,D2)) :- opposite(M,M1).
move(state(M,P,C,F,M,M,S2,D1,D2), state(M1,P,C,F,M1,M1,S2,D1,D2)) :- opposite(M,M1).
move(state(M,P,C,F,M,S1,M,D1,D2), state(M1,P,C,F,M1,S1,M1,D1,D2)) :- opposite(M,M1).
move(state(M,P,C,F,M,S1,S2,M,D2), state(M1,P,C,F,M1,S1,S2,M1,D2)) :- opposite(M,M1).
move(state(M,P,C,F,M,S1,S2,D1,M), state(M1,P,C,F,M1,S1,S2,D1,M1)) :- opposite(M,M1).

unsafe(state(_,P,C,F,M,S1,S2,D1,D2)) :- opposite(P,C),
          (opposite(P,F);opposite(P,M);opposite(P,S1);opposite(P,S2);opposite(P,D1);opposite(P,D2) ).
unsafe(state(_,_,_,F,M,S1,_,_,_)) :- opposite(F,S1),opposite(F,M).
unsafe(state(_,_,_,F,M,_,S2,_,_)) :- opposite(F,S2),opposite(F,M).
unsafe(state(_,_,_,F,M,_,_,D1,_)) :- opposite(M,D1),opposite(M,F).
unsafe(state(_,_,_,F,M,_,_,_,D2)) :- opposite(M,D2),opposite(M,F).
