
boys(Mh,Mx,P,D) :- 
L = [druzhok,elisey,fantik,murlika],
permutation(L,[Mh,Mx,P,D]),
permutation(L,[W,B,G,R]),
(
(W \= druzhok, G \= elisey),
(Mh = B, Mx = murlika),
(P = elisey, D = W),
(D \= fantik, G = druzhok),
(D = druzhok, Mh = elisey),write(1);

(R \= fantik, G \= murlika),
(Mh = B, Mx = murlika),
(P = elisey, D = W),
(D \= fantik, G = druzhok),
(D = druzhok, Mh = elisey),write(2);

(R \= fantik, G \= murlika),
(W \= druzhok, G \= elisey),
(P = elisey, D = W),
(D \= fantik, G = druzhok),
(D = druzhok, Mh = elisey),write(3);

(R \= fantik, G \= murlika),
(W \= druzhok, G \= elisey),
(Mh = B, Mx = murlika),
(D \= fantik, G = druzhok),
(D = druzhok, Mh = elisey),write(4);

(R \= fantik, G \= murlika),
(W \= druzhok, G \= elisey),
(Mh = B, Mx = murlika),
(P = elisey, D = W),
(D = druzhok, Mh = elisey),write(5);

(R \= fantik, G \= murlika),
(W \= druzhok, G \= elisey),
(Mh = B, Mx = murlika),
(P = elisey, D = W),
(D \= fantik, G = druzhok),write(6)
).
                 