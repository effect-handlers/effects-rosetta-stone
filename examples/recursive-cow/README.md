# Recursive cow

Handlers can hide recursion in the effect signature. We can abuse this to write
a program that superficially looks like it is terminating but it actually
cycles. Here is one such program:

1. Declare an operation `Cow` that returns a function of type `unit -> unit`.

2. Run the computation

        Cow ()

   which obtains a function `unit -> unit` from the handler and activates it.

3. Handle the above computation with the handler which handles `Cow` as follows:
   print `"moo "` and pass as the result the function `λ () . Cow ()`.

If we track the effect information, we will see that `Cow` should be typed as

    Cow : (unit → unit ! Cow)

and therein lies recursion.
