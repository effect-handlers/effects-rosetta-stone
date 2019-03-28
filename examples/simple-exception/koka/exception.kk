// Declare an abort effect and operation that is polymorphic in its
// result type. That ensures we can never resume as inside the operation
// it becomes an abstract existential type and we cannot provide an
// argument of such type. Another possibility is to give `abort` the `:void`
// type result which has no inhabitants.
ambient control abort() : a

// Function that recurses `n` times and then calls `abort`
fun deep( n : int ) {
  if (n <= 0) then abort() else deep(n - 1)
}

// Handle abort.
fun example1() {
  with control abort() { 42 }   // on abort, return 42
  deep(100000)                  // large `n` works too
  13                            // we never get here
}

// abort, catch it, and re-throw it
fun example2() {
  with control abort() { 42 }
  with control abort() { abort(); 13 }  // this abort goes to the outer handler
  val x = 2
  abort()
  val y = 3
  x+y
}

fun main() {
  example1().println
  example2().println
}
