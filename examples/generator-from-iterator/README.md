# Generator from iterator 

The goal of this example is to make a generator from an iterator for a list.

Since there is a lot of confusion regarding precise definition of terms, let us
make them concrete. Given a container of type `C a`, an iterator is a function
that has the type `C a -> (a -> 1) -> 1` and applies the given function over
each element of the container. A generator is a function with type `C a -> (1 ->
Option a)` that retuns a function that can be repeatedly applied to yield values
from the container.

## Specifics

* Implement a function `make_generator : List a -> (1 -> Option a)` which uses
  the iterator over the list to make the generator. 
* Initialise two lists 
  
      l1 = [1,2,3,4]  
      l2 = [a,b,c,d]

* Instantiate generators `g1` and `g2` for the lists `l1` and `l2`.
* Consume values alternately from `g1` and `g2` and print out results to stdout.
* The result of the program should be:

      1a2b3c4d

