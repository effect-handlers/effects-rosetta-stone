# Simple binary choice

Non-deterministic binary choice is an operation which returns a boolean value. There are many interesting ways to handle such an operation. Here we demonstrate basic ones:

* always choose `false`
* collect all choices
* choose the bit which maximizes the result

In the examples, we use these handles to handle the computation which assigns
`x` either 10 or 15, assigns `y` either 5 or 10, and returns the difference of
`x - y`.
