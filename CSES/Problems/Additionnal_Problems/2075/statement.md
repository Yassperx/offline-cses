Problem Content in Markdown:


CSES \- Reversal Sorting




* **Time limit:** 1\.00 s
* **Memory limit:** 512 MB




You have an array that contains a permutation of integers 1,2,\\dots,n. Your task is to sort the array in increasing order by reversing subarrays. You can construct any solution that has at most n reversals.


Input
=====


The first input line has an integer n: the size of the array. The array elements are numbered 1,2,\\dots,n.


The next line has n integers x\_1,x\_2,\\dots,x\_n: the contents of the array.


Output
======


First print an integer k: the number of reversals.


After that, print k lines that describe the reversals. Each line has two integers a and b: you reverse a subarray from position a to position b.


Constraints
===========


* 1 \\le n \\le 2 \\cdot 10^5


Example
=======


Input:



```
4
2 3 1 4

```

Output:



```
2
1 3
2 3

```
 
