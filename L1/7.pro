nextDate(D1,D2) :- ok(D1), d1(D1,Nd), D2 = Nd.

d1(D1,Nd) :-  getM(D1,M), getD(D1,D), if(M,D,R), Nd = R.

getM(date(M,_),NM) :- NM = M.
getD(date(_,D),ND) :- ND is D.

ok(date(M,D)) :- numOfDays(M,K), D > 0, D =< K.

if(M,D,R) :- numOfDays(M,K), nextMonth(M,M1),
             (K=D, R = date(M1,1); 
              K=\=D,D1 is D+1, R = date(M,D1)).

numOfDays(jan,31). numOfDays(feb,28). numOfDays(mar,31).
numOfDays(apr,30). numOfDays(may,31). numOfDays(jun,30).
numOfDays(jul,31). numOfDays(aug,31). numOfDays(sep,30).
numOfDays(oct,31). numOfDays(nov,30). numOfDays(dec,31).

nextMonth(jna,feb). nextMonth(feb,mar).
nextMonth(mar,apr). nextMonth(apr,may).
nextMonth(may,jun). nextMonth(jun,jul).
nextMonth(jul,aug). nextMonth(aug,sep).
nextMonth(sep,oct). nextMonth(oct,nov).
nextMonth(nov,dec). nextMonth(dec,jan).