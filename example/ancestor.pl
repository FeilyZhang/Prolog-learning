father(zeb, john_boy_sr).
father(john_boy_sr, john_boy_jr).
father(zeb, john_boy_br).
father(john_boy_br, john_boy_sr).

/*
递归代码
*/

ancestor(X, Y) :-
    father(X, Y).

ancestor(X, Y) :-
    father(X, Z), ancestor(Z, Y).

/*
非递归代码
*/
/*
ancestor(X, Y) :-
    father(X, Y).

ancestor(X, Y) :-
    father(X, Z), father(Z, Y).
*/