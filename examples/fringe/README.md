# Same fringe

Two binary trees are said to have the *same fringe* if the sequences
induced by reading their respective leaves from left-to-right are the
(point-wise) same.

In this example we implement a procedure, `same_fringe`, that given two binary trees
decides whether they have the same fringe.


Some examples
```
                  +             +
                 / \           / \
same_fringe (   1   +    ,    +   3  ) = True
                   / \       / \
                  2   3     1   2

                  +             +
                 / \           / \
same_fringe (   3   +    ,    +   3  ) = False
                   / \       / \
                  2   1     1   2
```
