# Prolog 语言入门
### 一、关于Prolog语言
先看一段正式的介绍
> Prolog is a logic programming language associated with artificial intelligence and computational linguistics.  Prolog has its roots in first-order logic, a formal logic, and unlike many other programming languages, Prolog is intended primarily as a declarative programming language: the program logic is expressed in terms of relations, represented as facts and rules. A computation is initiated by running a query over these relations.

以上介绍来自维基百科：[https://en.wikipedia.org/wiki/Prolog](https://en.wikipedia.org/wiki/Prolog)
今天闲来无事，就上网搜了搜有哪些小众冷门但却实用的编程语言，毫无疑问，Prolog脱颖而出。平时总是在写结构化的逻辑代码，似乎只要知道顺序、选择、循环三种结构，再加上常用的算法和数据结构就能解决绝大多数问题，不免觉得无趣。所以对这门以逻辑标榜的编程语言甚是钟情。
国内网上关于Prolog的资料和文档寥寥无几，在阮一峰老师的博客中倒是发现一篇文章足以入门Prolog，甚是开心，本文结合阮一峰老师的文章和原文出处[Solving murder with Prolog](https://xmonader.github.io/prolog/2018/12/21/solving-murder-prolog.html)，再加上本人实践，综合而成，感谢两位的无私奉献。
---
### 二、Prolog运行环境SWI-Prolog的安装
在官网下载相应操作系统的二进制安装包，然后安装，一定要将安装路径加入环境变量，一般在安装的时候会提示，勾选即可。
在命令行键入swipl命令即可进入Prolog的shell
```
C:\Users\Administrator>swipl
Welcome to SWI-Prolog (threaded, 64 bits, version 8.0.1)
SWI-Prolog comes with ABSOLUTELY NO WARRANTY. This is free software.
Please run ?- license. for legal details.

For online help and background, visit http://www.swi-prolog.org
For built-in help, use ?- help(Topic). or ?- apropos(Word).

1 ?- 
```
这就进入了Prolog的运行环境，键入以下命令退出shell(别忘了最后的.)
```
halt.
```
Prolog运行环境和源文件下每条语句是以.符号结束的，相当于Java中;符号的作用。
Prolog标准输出函数为write().
hello, world输出如下
```
1 ?- write('hello, world').
hello, world
true.
```
其中true.为返回结果，代表加载成功！