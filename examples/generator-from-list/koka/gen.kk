// See `main-strict` for a closer copy of the multicore-Ocaml example,
// However, we think the version shown here is nicer as it does not use heap mutation,
// (but less flexible as the generators are now scoped).

// Declare an ambient instance. These are essentially named handlers.
// Usually you declare them under an umbrella effect, like `heap` for
// references, or `file-system` for files, but you can leave it out (as we
// do here) for trivial cases and then it defaults to the `inst` effect
// which is handled by `main`.
// So, the type of `step` becomes `forall<a> (gen<a>) -> <exn,inst> maybe<a>`
// Unfortunately with `exn` as we currently do not check statically if
// an instance name escapes its dynamic scope.
ambient instance gen<a> { fun step() : maybe<a> }

fun generator( xs : list<a>, action : gen<a> -> e b ) : e b {
  var todo := xs                           // local unobservable state (not heap allocated, it works with backtracking too)
  with g = instance fun step() {           // fresh instance binding named `g`
    match(todo) {
      Nil        { Nothing }
      Cons(x,xx) { todo := xx; Just(x) }   // update and return (=resume)
    }
  }
  action(g)
}

fun main() : <exn,div,console,inst> () {   // inferred
  with g1 = [1,2,3,4].generator            // this `with` just passes the rest of the scope as a function: `generator([1,2,3,4], fun(g1){...})`
  with g2 = ['a','b','c','d'].generator
  fun zipstep() {
    match((g1.step(),g2.step())) {
      (Just(x),Just(y)) -> Cons((x,y), zipstep())  // keep stepping until done
      _ -> Nil
    }
  }
  zipstep().show.println()
}


fun show( xs : list<(int,char)> ) : string {
  xs.show-list( fun(x) { "(" + x.fst.show + "," + x.snd.show + ")" })
}
