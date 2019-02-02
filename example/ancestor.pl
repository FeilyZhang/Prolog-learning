father(zeb, john_boy_sr).
father(john_boy_sr, john_boy_jr).

/*
核心代码
*/
ancestor(X, Y) :-
    father(X, Y).
ancestor(X, Y) :-
    father(X, Z), ancestor(Z, Y).
/*	
X = {zeb, john_boy_sr};
Y = {john_boy_sr, john_boy_jr}
*/