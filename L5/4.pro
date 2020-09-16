addHead(E,[H1|T1],R) :- addHead(E,T1,R1), R = [[E|H1]|R1].
addHead(_,[],[]).