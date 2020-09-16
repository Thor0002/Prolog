subsets(L,B) :- nonvar(L),sort(L,L1),reverse(L1,Lr),
                help(Lr,[],R),(var(B) ->  B = R;
                                         (map(B,sort,A),sort(R,R1), sort(A,R1) ) ).
subsets(L,B) :- var(L),nonvar(B),maxl(B,R),permutation(R,L).

help([],R,[R]).
help([H|T],L,R) :- help(T,[H|L],R1),help(T,L,R2), append(R1,R2,R).

map([H1|T1],P,R) :- map(T1,P,R1),call(P,H1,C),R = [C|R1].
map([],_,[]).

maxl([H|T],R) :- maxl(T,R1),length(R1,L1),length(H,L2),( L2>L1 -> R = H; R = R1).
maxl([H],H).







%__________________________________________________________________________________________
sub1([H|T],B) :- sub1(T,R),addHead(H,R,R1),append(R,R1,B). 
sub1([],[[]]).
addHead(E,[H1|T1],R) :- addHead(E,T1,R1), R = [[E|H1]|R1].
addHead(_,[],[]).

%sub1 работает дольше чем subset в режиме поиска:
%Тест- L1=[H|T]=[1,2,3,4,5,6,7,8,9,10,11], sub1 работает за 94ms; subsets работает за 78ms.