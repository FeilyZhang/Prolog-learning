fibonacci(1,1).
fibonacci(2,1).

fibonacci(No, Value) :- 
    No > 2, No1 is No - 1, No2 is No - 2, fibonacci(No1, Value1),fibonacci(No2,Value2), Value is Value1 + Value2.