Problem Content in Markdown:


CSES \- Book Shop II




* **Time limit:** 1\.00 s
* **Memory limit:** 512 MB




You are in a book shop which sells n different books. You know the price, the number of pages and the number of copies of each book.


You have decided that the total price of your purchases will be at most x. What is the maximum number of pages you can buy? You can buy several copies of the same book.


Input
=====


The first input line contains two integers n and x: the number of book and the maximum total price.


The next line contains n integers h\_1,h\_2,\\ldots,h\_n: the price of each book.


The next line contains n integers s\_1,s\_2,\\ldots,s\_n: the number of pages of each book.


The last line contains n integers k\_1,k\_2,\\ldots,k\_n: the number of copies of each book.


Output
======


Print one integer: the maximum number of pages.


Constraints
===========


* 1 \\le n \\le 100
* 1 \\le x \\le 10^5
* 1 \\le h\_i, s\_i, k\_i \\le 1000


Example
=======


Input:



```
3 10
2 6 3
8 5 4
3 5 2

```

Output:



```
28

```

Explanation: You can buy three copies of book 1 and one copy of book 3\. The price is 3 \\cdot 2 \+ 3 \= 9 and the number of pages is 3 \\cdot 8 \+ 4 \= 28.


 
