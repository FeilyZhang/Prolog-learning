count(0,[]).
count(Count,[Head|Tail]) :-
    count(TailCount, Tail),Count is TailCount + 1.

sum(0, []).
sum(Sum,[Head|Tail]) :-
    sum(Total, Tail),Sum is Total + Head.

multiply(1, []).
multiply(Result,[Head|Tail]) :-
    multiply(Total, Tail), Result is Total * Head.

average(Average,List) :-
    sum(Sum,List), count(Count,List), Average is Sum / Count.