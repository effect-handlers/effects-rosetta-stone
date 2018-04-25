// A state effect that is polymorphic in the state of type `a`
effect state<a> {
  fun get() : a
  fun put( x : a) : ()
}

// We define first a state handler using functions.
// But you would never do this in practice in Koka! --
// use a parameterised handler instead: see `fun state` for that.
//
// inferred type: forall<a,b> (init : a, action : () -> state<a> b) -> b
fun fstate(init,action) {
  (handle(action) {
    get()    -> fun(st){ resume(st)(st) }
    put(x)   -> fun(st){ resume(())(x) }
    return x -> fun(_st){ x }
  })(init)
}


fun example1a() {
  // In koka an anonymous function without arguments can be written
  // with just braces (and passed outside the argument parenthesis)
  fstate(10) {
    val x = get()
    put(4 + x)
    3*get()
  }
}

fun example1b() {
  // Koka has `using` syntactic sugar to make the rest of the scope
  // the anonymous function argument, and this is equivalent to the
  // previous example.
  using fstate(10)
  val x = get()
  put(4 + x)
  3*get()
}

fun example2() 
{
  fun add-to(x : int) { 
    put(get() + x) 
  }
  using fstate(0)
  for(1,100,add-to)
  get()
}

// Here we use a paremeterised handler with a local state `st`
// The last argument to `resume` contains the new local state
// under which to resume. This is *much* more efficient than
// the previous `fstate` handler that builds explicit functions.
// inferred type:
// forall<a,b,e> (st : a, action : () -> <state<a>|e> b) -> e b
val state = handler(st) {
  get()  -> resume(st,st)
  put(x) -> resume((),x)
}

fun example1c() {
  using state(10)
  val x = get()
  put(4 + x)
  3*get()
}

fun main() {
  example1a().println
  example1b().println
  example2().println
  example1c().println
}
