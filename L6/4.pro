get_list(L,T) :- (L = [t,f,f,f,f,f,f], T = monday);(L = [f,t,f,f,f,f,f], T = tuesday);
                 (L = [f,f,t,f,f,f,f], T = wednesday);(L = [f,f,f,t,f,f,f], T = thursday);
                 (L = [f,f,f,f,t,f,f], T = friday);(L = [f,f,f,f,f,t,f],T = saturday);
                 (L = [f,f,f,f,f,f,t], T = sunday).
l_to_d(D,[M,Tu,W,Th,F,Sa,Su],X) :- (D = monday, X = M);(D = tuesday, X = Tu);(D = wednesday, X = W);
             (D = thursday, X = Th);(D = friday, X = F);(D = saturday, X = Sa);(D = sunday, X = Su).
day(monday).
day(tuesday).
day(wednesday).
day(thursday).
day(friday).
day(saturday).
day(sunday).
answ(T,D) :- day(D),get_list(L,T),L = [M,Tu,W,_,F,_,_],l_to_d(D,L,X),
           nextday(D,D1),l_to_d(D1,L,X1), 
           nextday(D1,D2),l_to_d(D2,L,X2),      
           cond1(D,X,M,Tu), cond2(D1,X1), cond3(D2,X2,W,F).
nextday(monday,tuesday).
nextday(tuesday,wednesday).
nextday(wednesday,thursday).
nextday(thursday,friday).
nextday(friday,saturday).
nextday(saturday,sunday).
nextday(sunday,monday).
cond1(D,X,M,Tu) :- (D = monday -> (X = t -> X = f; X = t);
                   (D = tuesday-> (X = t -> X = f; X = t);
                   (X = t  -> (M = f, Tu = f);(M = t; Tu = t) ) ) ).

cond2(D1,X1) :- (X1 = t -> (D1 = thursday;D1 = saturday;D1 = sunday);
                           (D1 \= thursday,D1 \= saturday,D1 \= sunday) ).

cond3(D2,X2,W,F) :- (D2 = wednesday -> (X2 = t -> X2 = f; X2 = t);
                    (D2 = friday-> (X2 = t -> X2 = f; X2 = t);
                    (X2 = t  -> (W = f, F = f);(W = t; F = t) ) ) ).