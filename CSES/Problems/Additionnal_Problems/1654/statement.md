Problem Content in Markdown:


CSES \- Bit Problem




* **Time limit:** 1\.00 s
* **Memory limit:** 512 MB




Given a list of n integers, your task is to calculate for each element x:


1. the number of elements y such that x \\mid y \= x
2. the number of elements y such that x \\mathrel{\\\&} y \= x
3. the number of elements y such that x \\mathrel{\\\&} y \\neq 0


Input
=====


The first input line has an integer n: the size of the list.


The next line has n integers x\_1,x\_2,\\dots,x\_n: the elements of the list.


Output
======


Print n lines: for each element the required values.


Constraints
===========


* 1 \\le n \\le 2 \\cdot 10^5
* 1 \\le x\_i \\le 10^6


Example
=======


Input:



```
5
3 7 2 9 2

```

Output:



```
3 2 5
4 1 5
2 4 4
1 1 3
2 4 4

```
 
