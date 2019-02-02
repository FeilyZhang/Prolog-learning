love(zhangsan, lisi).
love(zhangsan,wangwu).
male(zhangsan).
male(wangwu).
female(lisi).
stillLove(B, A) :- love(A,B), male(A), female(B).