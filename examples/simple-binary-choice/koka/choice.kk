// Declare as `control` (versus `fun` or `val`) is because we need
// an explicit `resume` in the operation definition (i.e. we modify control)
ambient control choose() : bool

// example computation
fun f() {
  val x = if (choose()) then 10 else 15
  val y = if (choose()) then 5 else 10
  x - y
}

// always pick false
fun example1() {
  with fun choose() { False }   // just an ambient function; no control modification
  f()
}

// collect all choices into a list
fun example2() {
  with control choose() { (resume(False) + resume(True) : list<int>) }
  [f()]
}

// pick the choice that maximizes the result
fun example3() {
  with control choose() { (max(resume(False),resume(True)) : int) }
  f()
}

fun main() {
  example1().println
  example2().show-list(show).println
  example3().println
}
