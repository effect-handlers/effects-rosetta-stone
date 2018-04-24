# Generator from iterator

The goal of this example is to make a generator from an iterator. Dynamic
creation of effect instances is required, since each iterator gets its own
effect.

Since there is a lot of confusion regarding precise definition of terms, let us
make them concrete. Given a collection of elements `x₁`, …, `xᵢ` (presumably
stored in a container such as a list or a tree),

* an **iterator** is a function of type `(a → 1) → 1` that applies the given
  function to each element `x₁`, …, `xᵢ`,
* a **generator** is a function of type `1 → Option a` which retuns a
  function that can successively yields the elements `x₁`, …, `xᵢ` upon
  repeated applications.

We implement a function

    make_generator : ((α → 1) → 1) → (1 → Option α)

If possible, the function should be polymorphic in `α`, otherwise instantiate it
at `int` so that it is applicable to the example below.

We test the function as follows:

1. Create an iterator `i1` for the list `[10,20,30,40,50]`.
2. Create a left-to-right iterator `i2` for the tree

            5
           / \
          3   6
         / \
        1  4

   This step may require a simple implementation of trees, which is fine.

3. Create generators `g1` and `g2` from `i1` and `i2`, respectively.
4. Use the generators to simultaneously traverse the list and the tree.
   For each `x` from the list and `y` from the tree, compute `x + y`
   and accumulate the sums in a list.
5. Return the list.
