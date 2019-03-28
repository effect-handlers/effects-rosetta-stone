// A state effect that is polymorphic in the state of type `s`
effect state<s> {
  fun get() : s
  fun put( x : s) : ()
}

// The standard state handler as a state monad.
// Note: you would never do this in practice in Koka,
// but instead use local variables or parameterized handlers instead (see below)
// Inferred type: `forall<a,e,s> (init: s, action: () -> <state<s>|e> a) -> e a`
fun state(init,action) {
  (handle(action) {
    get()    -> fun(st){ resume(st)(st) }
    put(x)   -> fun(st){ resume(())(x) }
    return x -> fun(_st){ x }
  })(init)
}

fun example1() {
  // An anonymous function without arguments can be written
  // with just braces (and passed outside of the argument parenthesis)
  state(10) {
    put(4 + get())
    3*get()
  }
}

fun example2() {
  // The `with` syntactic sugar makes the rest of the scope
  // into an anonymous function argument, and the following is
  // equivalent to the previous example.
  with state(10)
  put(4 + get())
  3*get()
}

fun example3() {
  with state(0)
  for(1,100) fun(x){     // `for` is just a library function  
    put(get() + x)
  }
  get()
}

// --------------------------------------------------------------------
// The recommended way to have stateful handlers is to use ambient functions
// with a mutable local variable (which is builtin using the semantics of `state`).
ambient<s> fun read() : s
ambient<s> fun write( x : s) : ()

// Inferred type: forall<a,s,e> (init : s, action : () -> <read<s>,write<s>|e> a) -> e a
fun astate(init,action) {
  var s := init                  // local unobservable state
  with fun read()   { s }        // `with` is also used to dynamically bind ambients over the rest of the scope
  with fun write(x) { s := x }
  action()
}

fun example4() {
  with astate(10)
  write(4 + read())
  3*read()
}

// --------------------------------------------------------------------
// Yet another cool way to encode state which unfortunately
// uses more and more stack space unless we improve on our
// runtime system to remove handlers followed by a mask.
ambient<s> val peek : s
ambient<s> control poke(x : s) : ()

fun cstate(init,action) {
  with val peek = init      // initial state as a value
  with control poke(x) {
    with mask<peek>         // mask `:peek` to ignore the previous/inner peek binding
    with val peek = x       // re-bind `peek` to the new state
    resume(())              // and resume under the new binding for `peek`
  }
  action()
}

fun example5() {
  with cstate(10)
  poke(4 + peek)
  3*peek
}

// --------------------------------------------------------------------
// Here we use a parameterised handler with a local state `st`
// The last argument to `resume` contains the new local state
// under which to resume. This is much more efficient than
// the previous `state` handler that builds explicit functions.
// Inferred type: `forall<a,s,e> (st : s, action : () -> <state<s>|e> a) -> e a`
val pstate = handler(st) {
  get()  -> resume(st,st)
  put(x) -> resume((),x)
}

fun example6() {
  with pstate(10)
  put(4 + get())
  3*get()
}

fun main() {
  example1().println
  example2().println
  example3().println
  example4().println
  example5().println
  example6().println
}
