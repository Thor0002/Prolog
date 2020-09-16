%get_list(L) :- L=[A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z].
 get_list(L) :- L=[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_].                                     % - алфавит переменных
get_var(C,L,R) :- char_code(C,X), X1 is X-96, nth(X1,L,R).

eq([H|T],X,L) :- var(X),(X = H, L = T);get(T,X,[H],L).                                                       %  eq([1,2,3],X,L) -> (X = 1,L = [2,3]);(X = 2, L = [1,3]);
eq(L,X,L) :- nonvar(X).                                                                                      %                     (X = 3,L = [1,2])

get([H|T],X,P,R) :- (X = H, add(P,T,R));get(T,X,[H|P],R).                                                    % вспомогательная для eq, тут делается все сопоставления кроме первого,
                                                                                                             % оно делается в самом eq
add([],R,R).                                                                                                 %   add([2,1],[4],R) -> R = [1,2,4].
add([H|T],R1,R) :- add(T,[H|R1],R).                                                                 

numlst([H|T],N) :-  help1([H|T],0,N) .                                                                       % numlst([1,2,3],N) -> N = 123
                   
help1([],N,N).                                                                                               % вспомогательная для numlst
help1([H|T],R,N) :- R1 is R*10 + H,help1(T,R1,N).                   

rebus2(W1,W2,W3,Res) :- atom_chars(W1,L1),atom_chars(W2,L2),atom_chars(W3,L3),rebus1(L1,L2,L3,Res).          % решение 7б  - принимает атомы, представляющие слова.

rebus1(L1,L2,L3,Res) :- E = [0,1,2,3,4,5,6,7,8,9],                                                           %  решение 7а - предикат который надо вызвать, чтобы получить ответ 
                       get_list(L),reverse(L1,L11),reverse(L2,L21),reverse(L3,L31),                          %  Он примиаем 3 списка из символов слов
                       help(L,E,L11,L21,L31,0,[[],[],[]],[R1,R2,R3]),                                        %   он вызывает help который и считает ответ в виде - 
                       numlst(R1,N1),numlst(R2,N2),numlst(R3,N3),                                            %   - [ list1_of_number1,list2_of_number2,list3_of_number3]
                       Y =.. [+,N1,N2],Res =..[=,Y,N3].     

help(_,_,[],[],[],Rem,Res,Res) :- Rem = 0.                                                                   %   тот момент когда help выдаёт ответ, 

help(L,_,[],[],[H3|T3],Rem,[Res1,Res2,Res3],Res) :-                                                          %  случай когда первые два слова закончились а 3 нет
                                         get_var(H3,L,R3),R3 = Rem,Rem \= 0,
                                         help(L,_,[],[],T3,0,[Res1,Res2,[R3|Res3]],Res).

help(L,E,[],[H2|T2],[H3|T3],Rem,[Res1,Res2,Res3],Res) :-                                                    %   случай когда первое слово закончились а 2,3 нет
                                      get_var(H2,L,R2),get_var(H3,L,R3),
                                      eq(E,R2,E1), R3 is (R2 + Rem) mod 10,Rem1 is (R2 + Rem) div 10,
                                      delete(E1,R3,E2),
                                      help(L,E2,[],T2,T3,Rem1,[Res1,[R2|Res2],[R3|Res3]],Res).

help(L,E,[H1|T1],[],[H3|T3],Rem,[Res1,Res2,Res3],Res) :-                                                    %   случай когда второе слово закончились а 1,3 нет
                                      get_var(H1,L,R1),get_var(H3,L,R3),
                                      eq(E,R1,E1), R3 is (R1 + Rem) mod 10,Rem1 is (R1 + Rem) div 10,
                                      delete(E1,R3,E2),
                                      help(L,E2,T1,[],T3,Rem1,[[R1|Res1],Res2,[R3|Res3]],Res).

help(L,E,[H1|T1],[H2|T2],[H3|T3],Rem,[Res1,Res2,Res3],Res) :-                                               %   случай когда все слова есть
                                                                                                            %   параметры help : Res - переменная которой будет сопоставлен результат,
                               get_var(H1,L,R1),get_var(H2,L,R2),get_var(H3,L,R3),eq(E,R1,E1),eq(E1,R2,E2), % L - алфавит, E - свободые цифры которые можно сопоставить оставшимся буква
                               Rem1 is (R1 + R2 + Rem) div 10,                                              % [H1|T1],[H2|T2],[H3|T3] - остаток 1,2,3 слова
                               (nonvar(R3) -> (R3 is (R1 + R2 + Rem) mod 10, E3 = E2); 			    % Rem - остаток от сложения предыдущего разряда
	                                      (R3 is (R1 + R2 + Rem) mod 10, select(R3,E2,E3) ) ),          % [Res1,Res2,Res3] - накопившися результат из частей нужных чисел,
                               help(L,E3,T1,T2,T3,Rem1,[[R1|Res1],[R2|Res2],[R3|Res3]],Res).                % предсавленный в виде списка из 3 списков,каждый из которых
                                                                                                            % состоит из цифр, которые были сопоставлены предыдущим буквам
