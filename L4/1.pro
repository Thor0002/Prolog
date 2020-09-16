:- initialization(consult('kinship.pro')).
answ(X,Y,[]) :- X = _, Y = _.
answ(R1,R2,[[X,Y]|T]) :- (R1 = X,R2 = Y); answ(R1,R2,T). 
%____________________________________________________________________________________________________________________________________

pred(X,Y) :- \+ (var(X),var(Y)),setof( [X,Y],help(X,Y),L ),answ(X,Y,L).      %pred(X,Y) :- \+ (var(X),var(Y)),pred(X,Z),pred(Z,Y).

pred(X,Y) :- var(X),var(Y),setof( [X,Y],help(X,Y),L ),answ(X,Y,L).           %(male(X);female(X)),pred(X,Y). %,assertz( (pred(X,Y) ).

help(X,Y) :- nonvar(X) -> (parent(X,Y);(parent(X,C),help(C,Y)) );
                          (parent(X,Y);(parent(P,Y),help(X,P)) ).
%_____________________________________________________________________________________________________________________________________

brother(X,Y) :- \+ (var(X),var(Y)), 
                (nonvar(X) -> (male(X),parent(P,X),male(P),parent(P,Y),male(Y),\+ X = Y);
                              (male(Y),parent(P,Y),male(P),parent(P,X),male(X),\+ X = Y) ).
brother(X,Y) :-  var(X),var(Y),male(X),parent(P,X),male(P),parent(P,Y),male(Y),X @< Y.
%_____________________________________________________________________________________________________________________________________

married(X,Y) :- \+ (var(X),var(Y)), 
                (nonvar(X) -> setof( [X,Y],C^(parent(X,C),parent(Y,C),\+ X = Y ),L);
                              setof( [X,Y],C^(parent(Y,C),parent(X,C),\+ X = Y ),L) ),answ(X,Y,L).
married(X,Y) :- var(X),var(Y),setof( [X,Y],C^(parent(X,C),parent(Y,C), X @< Y),L ),answ(X,Y,L). 
%______________________________________________________________________________________________________________________________________

husband(X,Y) :- male(X),married(X,Y).
%______________________________________________________________________________________________________________________________________

cousin(X,Y) :- \+ (var(X),var(Y)), 
               (nonvar(X) -> setof([X,Y],GP^P1^P2^(parent(P1,X),parent(GP,P1),parent(GP,P2),\+ P1 = P2, parent(P2,Y)),L);
                             setof([X,Y],GP^P1^P2^(parent(P1,Y),parent(GP,P1),parent(GP,P2),\+ P1 = P2, parent(P2,X)),L) ),answ(X,Y,L).
cousin(X,Y) :- var(X),var(Y), (male(X);female(X)), cousin(X,Y), X @< Y.
%______________________________________________________________________________________________________________________________________

num_of_children(X,N) :- (male(X);female(X)),findall(C,parent(X,C),Lst), length(Lst,N).
%______________________________________________________________________________________________________________________________________

nephews(X,Y) :- (male(Y);female(Y)),
                findall(C,( parent(P,Y),parent(P,S),\+ S = Y,parent(S,C) ), L), sort(L,X).
%______________________________________________________________________________________________________________________________________

family(X) :- X = [F,M | T],married(F,M),child(F,M,T).
child(F,M,L) :- male(F),female(M),setof( C,(parent(F,C),parent(M,C) ),L1),L = L1.
