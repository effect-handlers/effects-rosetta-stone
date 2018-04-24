# Generator from list

The goal of this example is to make a generator from a list. Dynamic creation of
an effect (instance) is required, since every list gets its own generator.

Specifically, a **generator** for a list `[x₁, …, xᵢ]` is a map `1 → Option α`
which returns the elements `x₁`, …, `xᵢ` in turn on successive calls (and
nothing after that).

We implement a function `make_generator : List α → (1 → Option α)` which uses
the iterator over the list to make the generator.

An important point about this example is that `make_generator` is polymorphic,
and therefore it has to dynamically create effects at different types.

To test the function, we create two generators

    g1 = make_generator [1, 2, 3, 4]
    g2 = make_generator ["a", "b", "c", "d"]

and simultaneously consume them to create the list of pairs

    [(1,"a"), (2, "b"), (3, "c"), (4, "d")]
