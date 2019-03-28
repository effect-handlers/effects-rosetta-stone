// This file mimics the Multicore-OCaml version closest. Since we have
// effect types, we can see that it is stateful `st<h>` in a heap `h` to
// implement the generator. That is not great, but it is more flexible as
// the returned stepper function is not limited to the lexical scope.
// Note that it is inferred that `main` is not stateful anymore (since
// heap `h` no longer occurs in any types when generalizing `main` and
// can thus no longer be observed)

// We declare as `control` (versus `fun` or `val`) since we need `resume` inside `yield`
ambient<a> control yield(x:a) : ()

fun generator( xs : list<a> ) : <st<h>> (() -> <st<h>,div|e> maybe<a>) {
  val todo = ref(fun(){ Nothing })      // create a mutable reference
  fun first-step() {
    with control yield(x) {
      todo := (fun(){ resume(()) })     // store the resumption for next time
      Just(x)                           // and return
    }
    xs.foreach( yield )
    Nothing
  }
  todo := first-step
  (fun(){ (!todo)() })
}

fun main() : <exn,div,console> () {      // inferred
  val g1 = [1,2,3,4].generator
  val g2 = ['a','b','c','d'].generator
  fun zipstep() {
    match((g1(),g2())) {
      (Just(x),Just(y)) -> Cons((x,y), zipstep())  // keep stepping until done
      _ -> Nil
    }
  }
  zipstep().show.println()
}


fun show( xs : list<(int,char)> ) : string {
  xs.show-list( fun(x) { "(" + x.fst.show + "," + x.snd.show + ")" })
}
