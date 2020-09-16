slijanie([],L2,L2).
slijanie(L1,[],L1).
slijanie([H1|T1],[H2|T2],L3) :- H1<H2,slijanie(T1,[H2|T2],L), L3 = [H1|L];
                                H1>=H2,slijanie([H1|T1],T2,L), L3 = [H2|L].
