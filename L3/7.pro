subl([],[]).
subl([H|T],L1) :- help([H|T],Ms,Ml,S,L), (L < Ml,L1 = Ms;
                                        \+L < Ml,L1 = S).
help([A],[A],1,[A],1).
help([H|T],Ms,Ml,S,L) :- help(T,Ms1,Ml1,[H1|Ts],L1),S1 = [H1|Ts],
                         (H < H1, Ms = Ms1,Ml = Ml1,S = [H|S1],L is L1 + 1;
                        \+H < H1, (L1 < Ml1, Ms = Ms1,Ml = Ml1, S = [H], L = 1;
                                \+L1 < Ml1, Ms = S1, Ml = L1,S = [H], L = 1) ).



%subl([A],[A]).
%subl([],[]).
%subl([H1,H2|T],L) :- H1 < H2,help([H1,H2|T],[H1,H2],2,[H1,H2],2,R), reverse(R,L);
%                    \+H1 < H2,help([H1,H2|T],[H1],1,[H2],1,R),reverse(R,L).
%help([],Ms,Ml,S,L,R) :- L < Ml,R = Ms;
%                      \+L < Ml,R = S.
%help([H|T],Ms,Ml,[Hs|Ts],L,R) :- Hs < H,L1 is L + 1,help(T,Ms,Ml,[H,Hs|Ts],L1,R);
%                               \+Hs < H,(L < Ml, help(T,Ms,Ml,[H],1,R);
%                                       \+L < Ml, help(T,[Hs|Ts],L,[H],1,R) ).  

