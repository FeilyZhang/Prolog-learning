count(0,[]).
/*
Count 返回值，即最终的结果，初值为0，因为空列表不存在元素，即为0
[Head|Tail] 形参，即要计算的列表
我们对求元素个数的描述为：每次去掉列表的头元素，然后总长度加1。count()表达式的输入为列表，返回值为当前已经计算的长度，那么每调用一次都会得到一个新的列表，返回值也是一个结果
*/
count(Count,[Head|Tail]) :-
    count(TailCount,Tail),Count is TailCount + 1.
	
	/*
	描述每个参数的方法如下
	下一个Count等于当前Count的TailCount加1(真正的计算逻辑)
	下一个Count列表等于当前列表的Tail部分
	以上构成再次尾递归的两个形参
	*/
sum(0,[]).
sum(Total,[Head|Tail]) :-
    sum(Sum,Tail),Total is Sum + Head.
	
/*
方法
解释
*/