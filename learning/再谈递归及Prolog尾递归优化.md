# 再谈递归及Prolog尾递归优化

递归指的是函数自己调用自己的行为。我们用斐波那契数列的前五项求值来说明递归调用的过程

Prolog求斐波那契数列的第N项，显得格外优雅，你只需要定义好基本的关系和求解的规则约束即可。

斐波那契数列存在两项基本关系，即第一项和第二项的值为1，描述如下

```
fibonacci(1,1).
fibonacci(2,1).
```

含义为第1项的斐波那契数列值为1；第二项的斐波那契数列值为1

那么求解斐波那契第N项的规则约束如下描述：

**第N项的斐波那契值等于第N - 1项与第N - 2项斐波那契值之和。**那么我们首先要用Prolog描述第N - 1项是哪一项、第N - 2项是哪一项、第N - 1项对应的值是多少、第N - 2项对应的值是多少、以及最终的结果是多少.这些规则约束用Prolog描述如下

```
fibonacci(No, Value) :- 
    No > 2, No1 is No - 1, No2 is No - 2, fibonacci(No1, Value1),fibonacci(No2,Value2), Value is Value1 + Value2.
```

含义为当项数No大于2(即从第三项开始)时，第N - 1项的项数为No - 1(用No1表示),第N - 2项的项数为No - 2(用No2表示),第No1项的斐波那契值为fibonacci(No1, Value1),第No2项的斐波那契值为fibonacci(No2, Value2),这两个表达式会返回Value1与Value2的值，那么最终的结果就是Value = Value1 + Value2.

**从这里我们也可以看到，对Prolog表达式的调用，总是输入常量值返回变量值。**

测试如下

```
?- fibonacci(1, Vlaue).
Vlaue = 1 ;
false.

?- fibonacci(2, Value).
Value = 1 ;
false.

?- fibonacci(3, Value).
Value = 2 ;
false.

?- fibonacci(4, Value).
Value = 3 ;
false.

?- fibonacci(5, Value).
Value = 5 ;
false.
```

那么我们这里当No为1和2时，相当于直接查询关系，即直接返回1

我们以斐波那契的第五项来说明递归调用的过程，如下

