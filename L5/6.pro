pack(T,Mp) :- getlist(L),sack(W),findall(R,help(L,0,0,[],R,W),A),maxl(A,[Pr|Lr]), T = Lr, Mp = Pr.
getlist(L) :- findall(thing(X,Y,Z),thing(X,Y,Z),L).
eq([H|T],L1) :- T \= [] -> (L1 = [H|T];  eq(T,L1) );
                            L1 = [H|T] .  
eq([],[]).
help([thing(H,W1,P1)|T],P,W,L,R,Wb) :- Wnow is W + W1, 
                                       (Wnow>Wb -> R =[P|L];
                                       (Pnow is P + P1,eq(T,Lnew),help(Lnew,Pnow,Wnow,[H|L],R,Wb) ) ).
help([],P,_,L,[P|L],_).

maxl([[P1|L1]|T1],R) :- maxl(T1,[P2|L2]),(P1 > P2 -> R = [P1|L1]; R = [P2|L2]).
maxl([H],H).



thing(plate,1,1.5).
thing(jar,3,5).
thing(silverSpoon,0.3,15).
sack(3).