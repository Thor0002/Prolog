%state(here/not_here(A),(B),(D),(V),(G)).

where(here).
where(not_here).

opposite(here,not_here).
opposite(not_here,here).

student(A,B,D,V,G) :-
 where(A),where(B),where(D),where(V),where(G),
 ( (A = here, D = here) -> B = not_here;true),
 ( (A = here, D = not_here ) -> (B = here, V = not_here);true ),
 ( A = here -> V = here;true),
 ( A = not_here -> V = not_here;true),
 ( D = here -> G = not_here;true),
 ( (B = not_here, V = not_here) -> D = here;true),
 ( (B = not_here, V = here) -> (D = not_here, G = here);true),
 ( B = here -> A = here;true).
 
 
