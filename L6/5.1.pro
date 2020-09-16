%Lpc = [[a,1], ..., [h,8] ].
lpctolpn([[C,M]|T],Lpn) :- lpctolpn(T,Lpn1),char_code(C,K), N is (K-96)*10+M , Lpn = [N|Lpn1].
lpctolpn([],[]).

unsafe(Lpn,Unsf) :- maplist(f,Lpn,L1),maplist(g,Lpn,L2),appendn([Lpn,L1,L2],Unsf).
f(X,Y) :- Y is X-11.
g(X,Y) :- Y is X+9.
appendn([H|T],R) :- appendn(T,R1),append(H,R1,R).
appendn([],[]).

:- dynamic(help1/5).

kingpath2(Lpc,P,N) :- retractall(help1(_,_,_,_,_)),lpctolpn(Lpc,Lpn),unsafe(Lpn,Unsf),help(11,88,Unsf,P,N),N < 65.

assertlist([[P1,K1]|H],V) :-  P = [V|P1],K is K1 + 1,asserta((help1(V1,88,_,P,K) :- V1 = V, !)),assertlist(H,V).
assertlist([],_). 

help(V,T,_,[T],0) :- V = T,!.
help(V,T,Unsf,P,K) :- help1(V,T,Unsf,Ph1,Kh1) -> (P = Ph1, K = Kh1); 
                      ( Unsf1=[V|Unsf],
                          findall(Nv,move(V,Nv,Unsf1),Lnv),
                         (Lnv \= [] -> ( findall([P1,K1],helpn(Lnv,T,Unsf1,P1,K1),L),P = [V|P1],K is K1 + 1,
                                         assertlist(L) );
                                       (P = [], K = 65) ) ).                                     
helpn([],_,_,[],65).
helpn([V1|L1],T,Unsf,P,K) :-helpn(L1,T,Unsf,P1,K1),help(V1,T,Unsf,P2,K2),
                           (K1 > K2 -> (P = P2,K = K2);
                           (K1 < K2 -> (P = P1,K = K1);
                                       ((P = P2,K = K2);(P = P1,K = K1)) ) ).


move(V,Nv,Unsf) :- (Nv is V-11;Nv is V-1;Nv is V-10;Nv is V+9;
                       Nv is V-9;Nv is V+10;Nv is V+1;Nv is V+11),
                       \+ memberchk(Nv,Unsf), Nv > 10, Nv < 90, N1 is Nv mod 10,N1 > 0, N1 < 9.