check(E1,E2,P) :- call(P,E1,E2).
choosePairs(L1,L2,P,R) :- choosePairs1(L1,L2,P,R1), permutation(R1,R).
choosePairs1([H1|T1],[H2|T2],P,R) :- choosePairs1(T1,T2,P,R1),(check(H1,H2,P) -> (X = H1-H2,R = [X|R1] ); R = R1).
choosePairs1([],[],_,[]).                                    
