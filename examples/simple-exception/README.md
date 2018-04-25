# Simple exception

An exception is an algebraic operation which of empty arity. This causes it to
be non-resumable, since there is no element of the empty type that we could pass to the continuation.

In this example we implement a simple exception `Abort` and show how it can be
handled. For an implementation to be truly correct, it must be *impossible* to
resume the continuation.

