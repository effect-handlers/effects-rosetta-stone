// Declare a non-(co)inductive effect `:moo` with one operation `moo`
ambient rec fun moo() : (() -> <moo,div> ())

fun main() {             // inferred type: () -> <div,console> ()
  with fun moo() {       // bind `moo` dynamically over the rest of the scope
    println("moo")
    (fun(){ moo()() })   // return (=tail-resume) with a function that calls `moo` again
  }
  moo()()                // and call moo
}


/* --------------------------------------------------------------------
The above ambient declaration is equivalent to:
>  effect rec moo {
>    fun moo() : (() -> <moo,div>) ()
>  }

Since Koka tracks potential divergence as an effect (modeled
as an ambient `fix` combinator), we need to declare the `:moo`
effect as an arbitrarily recursive type. If we leave it out,
the compiler complains:

  test\algeff\eff-rec1a.kk(1, 1): error: Type .ops-moo is declared
    as being (co)inductive but it occurs recursively in a negative position.
    hint: declare it as a 'type rec' (or 'effect rec)' to allow negative occurrences

Similarly, we need to declare the divergence effect in the `moo`
operation signature or we get an error when we try to resume.
If we leave it out, we get:

  test\algeff\eff-rec1a.kk(6,13): error: types do not match
    context      :     resume( { moo()() } )
    term         :             { moo()() }
    inferred type: () -> <moo,div> ()
    expected type: () -> moo ()

Good! We won't accidentally write a crazy cow program :-)
*/
