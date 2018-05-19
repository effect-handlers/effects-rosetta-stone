# Pipes

Standard deep handlers hardwire a particular structural recursion
scheme over a computation tree - namely a /fold/ or /catamorphism/.

Shallow handlers, in contrast, perform a case split on the computation
tree, so the programmer has to make explicit recursive calls. This
however has the advantage that other recursion schemes are naturally
expressed.

Pipes provide such an example. They are naturally expressed using
mutual recursion.

## The handler(s)

Given two computations

    M : 1 ! {send : S -> 1}
    N : A ! {receive : 1 -> S}

the handler (or handlers) should handle them synchronously such that
messages sent by M are received by N, and if N tries to receive when M
has finished an exception `abort ()` is raised:

    pipe M N : {abort : forall a.1 -> a} ! A

## Example 1

1. Implement a computation `sends` that sends a list of values.

2. Implement a computation `catter` that receives and concatenates a
nil-terminated list of lists of values.

3. Pipe a nil-terminated list of strings between `sends` and `catter`.

## Example 2

1. Define a spacer computation of type

    1 ! {receive : 1 -> String; send : String -> 1}

that repeatedly receives a string and then sends the string followed
by a space.

2. Interpose the spacer between `sends` and `catter` using two pipes.
