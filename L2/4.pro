isSearchTree(nil).
isSearchTree(tr(D,Lt,Rt)) :- h(Lt,-9999999,D), h(Rt,D,999999).
h(nil,_,_).
h(tr(D,Lt,Rt),A,B) :- D > A, D < B, h(Lt,A,D), h(Rt,D,B).

%--------------------------------------

contains(tr(D,Lt,Rt),N) :- (var(N), (N is D; contains(Lt,N); contains(Rt,N) ) );
                           (nonvar(N), ( (N = D); (N > D, contains(Rt,N) ); (N < D, contains(Lt,N) ) ) ).

%--------------------------------------

insert(tr(D,Lt,Rt),N,R) :- (D = N, R = tr(D,Lt,Rt) );
                           (N > D, insert(Rt,N,R1), R = tr(D,Lt,R1) );
                           (N < D, insert(Lt,N,R1), R = tr(D,R1,Rt) ).
insert(nil,N,tr(N,nil,nil) ).

%--------------------------------------

printTree(tr(D,Lt,Rt)) :- write(D), nl, (\+(Lt = nil),\+(Rt = nil), h1(Lt,"","| "), h1(Rt,"","| ");
                                        ((Lt = nil);(Rt = nil)), h1(Lt,"","  "), h1(Rt,"","  ") ).
h1(tr(D,Lt,Rt),N,S) :- format('~s',[N]), write('+'), write('-'), write(D), nl, 
                     (\+(Lt = nil),\+(Rt = nil),append(N,S,N1), h1(Lt,N1,"| "), h1(Rt,N1,"| ");
                     ((Lt = nil);(Rt = nil)),append(N,S,N1), h1(Lt,N1,"  "), h1(Rt,N1,"  ") ),!.
h1(nil,_,_).

%--------------------------------------

remove(tr(D,Lt,Rt),N,R) :- (N < D, remove(Lt,N,R1), R = tr(D,R1,Rt) );
                           (N > D, remove(Rt,N,R1), R = tr(D,Lt,R1) );
                           (N = D, help(Lt,Rt,R1), R = R1 ).
remove(nil,_,nil).
help(nil,nil,R) :- R = nil.
help(nil,Rt,R) :- \+(Rt = nil), R = Rt.
help(Lt,nil,R) :- \+(Lt = nil), R = Lt.
help(Lt,tr(D,nil,Rt),R) :- \+(Lt = nil),  R = tr(D,Lt,Rt).
help(Lt,tr(D,Lt1,Rt),R) :- \+(Lt = nil), \+(Lt1 = nil), findl(Lt1,X), remove(tr(D,Lt1,Rt),X,R1), R = tr(X,Lt,R1).
findl(tr(D,nil,_),X) :- X = D.
findl(tr(_,Lt,_),X) :- findl(Lt,X1), X = X1.

