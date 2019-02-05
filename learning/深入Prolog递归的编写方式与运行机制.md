# 深入Prolog递归的编写方式与运行机制

### Prolog递归的运行机制

我们首先要知道一个Prolog表达式的定义，常量相当于输入，变量相当于输出(返回值)，关于参数实际意义的描述，具有以下几种情况：

+ 当推论表达式的参数均为变量时，那么说明均为输出(返回值)，这时在终端执行表达式命令，那么会一一列举出变量的所有可能值；
+ 当推论表达式的参数中有常量也有变量时，那么常量代表输入，变量代表输出，可以像理解函数一样理解这里的输入输出。

我们这里重点讲述的是Prolog的递归，Prolog采用尾递归优化的手段来解决栈溢出的问题，而对于尾递归来说，就是在递归次数一致的前提下(递归顺序不一定递增)顺序完成计算逻辑。

还要应该理解的就是我们在编写Prolog规则约束和推论表达式的时候，一定要按照逻辑推理的方式去思考问题和编写程序，不能盲目的将结构化程序设计中的编程方式套用过来，那么你会发现越学越懵。

我们以计算列表中元素个数的推论表达式为例，来说明Prolog递归

Prolog对列表的处理，可以通过[Head|Tail]来说明，即我们每次递归只取上一层函数的Tail部分，然后总长度加一即可，部分程序定义如下

```
count(0,[]).
```

上述含义为，当输入空列表时，其长度为0，这是递归的子目标，我们以后只需要在此基础之上将0每次加一即可，剩余的程序定义如下

```
count(Count,[Head|Tail]) :-
    count(TailCount,Tail),Count is TailCount + 1.
```

上述含义为我们要推论列表[Head|Tail]的元素个数`Count`，那么我们就将操作传递到`count(TailCount,Tail),Count is TailCount + 1.`上

`count(TailCount,Tail),Count is TailCount + 1.`的含义为如果输入列表为`Tail`，那么其(列表Tail)元素个数为`TailCount`(输出)，且本次递归调用最终的`Count`(最终输出)就是前面的输出`TailCount + 1`.

有点绕口吧？同样看张表格，再回想一下尾递归的本质就明白了，我们以Count(Count, [1, 2, 3, 4, 5])为例

|step|code|Count|TailCount|Head|Tail|
|------|------|------|------|------|------|
|1|count(TailCount,Tail)|——|0|1|[2, 3, 4, 5]|
|1|Count is TailCount + 1|1(0 + 1)|——|——|——|
|2|count(TailCount,Tail)|1(0 + 1)|1(0 + 1)|2|[3, 4, 5]|
|2|Count is TailCount + 1|2(0 + 1 + 1)|——|——|——|
|3|count(TailCount,Tail)|2(0 + 1 + 1)|2(0 + 1 + 1)|3|[4, 5]|
|3|Count is TailCount + 1|3(0 + 1 + 1 + 1)|——|——|——|
|4|count(TailCount,Tail)|3(0 + 1 + 1 + 1)|3(0 + 1 + 1 + 1)|4|[5]|
|4|Count is TailCount + 1|4(0 + 1 + 1 + 1 + 1)|——|——|——|
|5|count(TailCount,Tail)|4(0 + 1 + 1 + 1 + 1)|4(0 + 1 + 1 + 1 + 1)|5|[]|
|5|Count is TailCount + 1|5(0 + 1 + 1 + 1 + 1 + 1)|——|——|——|
|break|count(TailCount,Tail)|5(0 + 1 + 1 + 1 + 1 + 1 + 0)|5(0 + 1 + 1 + 1 + 1 + 1)|——|[]|

可见，我们仍然是从头元素开始，顺序计算的，那么什么时候判断退出呢？即当列表为空时，就会调用count(0,[])，然后就会退出了，可见count(0,[])不仅是初始化逻辑也是判断逻辑。而count(TailCount,Tail)总是先调用count(0,[])完成初始化操作，然后每次执行到这里时为下一次递归调用准备Tail和TailCount。

如果还不明白？那么我们只需要记住其编写方式就好了，如下

### Prolog的编写方式

以上一个完整程序为例

```
count(0,[]).

count(Count,[Head|Tail]) :-
    count(TailCount,Tail),Count is TailCount + 1.
```

尾递归就像是普遍的迭代操作，其每次“迭代”参数间的关系如下图

![Prolog尾递归参数关系图](http://feily/tech/image/20190205124257.png)

理解了这些张图，以及表格，自然对Prolog尾递归的编写方式更进一步。