love(zhangsan, lisi).
love(zhangsan,wangwu).
male(zhangsan).
male(wangwu).
female(lisi).
stillLove(B, A) :- love(A,B).
stillLove1(B, A) :- love(A,B), male(A), female(B).
stillLove2(B, A) :- love(A,B), \+female(B).