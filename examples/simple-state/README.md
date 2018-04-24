# Simple state

The standard state monad implements a computation of type `T` which uses state
of type `S` as a state-carrying function `S → S × T`. In this example we
implement the monad and two simple examples:

* compute `(10 + 4) × 3` using state
* add numbers from `1` to `100` by adding them to the state
