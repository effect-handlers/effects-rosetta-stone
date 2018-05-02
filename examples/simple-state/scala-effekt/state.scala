import effekt._

trait Get extends Eff { def get: Op[Int] }
trait Set extends Eff { def set(n: Int): Op[Unit] }

// group the effect operations together
trait State extends Get with Set

// Some boilerplate, necessary to automatically choose the available
// capability.
object State {
  def get(): Int using Get = implicit c => use(c) { c.handler.get }
  def set(n: Int): Unit using Set = implicit c => use(c) { c.handler.set(n) }
}

object StateExample extends App {

  import State._

  // The "standard" state handler, interpreting a stateful computation
  // into a reader of state.
  trait StateHandler[R] extends Handler.Basic[R, Int => Control[R]] with State {
    def unit = a => n => pure(a)
    def get            = pure(s => runState(resume(s), s))
    def set(n: Int)    = pure(s => runState(resume(()), n))
  }

  def state[T](initial: Int, prog: T using State): Control[T] =
    runState(handle(new StateHandler[T] {})(prog), initial)

  def runState[T](prog: Control[Int => Control[T]], state: Int): Control[T] =
    prog flatMap { _ apply state }

  // Example 1: compute the answer
  val example1 = state(10, for {
    x <- get()
    _ <- set(4 + x)
    r <- get()
  } yield 3 * r)

  // Example 2: add numbers from 1 to 100
  val example2 = {
    // add numbers k, k-1, ..., 2, 1 to the state
    def loop: Int => Unit using State = {
      case 0 => pure(())
      case k => for {
        n <- get()
        _ <- set(k + n)
        _ <- loop(k - 1)
      } yield ()
    }

    // run the loop and read the final state
    state(0 , for {
      _ <- loop(100)
      r <- get()
    } yield r)
  }

  println(example1.run())
  println(example2.run())
}

