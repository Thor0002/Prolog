quick_sort([],[]).
quick_sort([H|T],L) :- split(H,T,[],[],[L1,L2]),quick_sort(L1,A),quick_sort(L2,B),append(A,[H|B],L).
split(H,[X|T],L1,L2,R) :- X < H, split(H,T,[X|L1],L2,R);
                        \+X < H, split(H,T,L1,[X|L2],R).
split(_,[],L1,L2,R) :- R = [L1,L2]. 