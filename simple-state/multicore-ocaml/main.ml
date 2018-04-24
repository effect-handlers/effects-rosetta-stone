(* Declaration of the operations for state *)
effect Get: int
effect Set: int -> unit

(* The standard state handler *)
let run_state f init =
  let comp =
    match f () with
    | v -> (fun _ -> v)
    | effect (Set s) k -> (fun _ -> (continue k ()) s)
    | effect Get k -> (fun s -> (continue k s) s)
  in
  comp init

(* Example 1: compute the answer *)
let example1 =
  let f () =
    let x = perform Get in
    perform (Set (4 + x));
    3 * perform Get
  in
  run_state f 10
;;

assert (example1 = 42);;

(* Example 2: add numbers from 1 to 100 *)
let example2 =

  (* add v to the state *)
  let add_to v = perform (Set (v + perform Get)) in

  (* add numbers v, v-1, ..., 2, 1 to the state *)
  let rec loop = function
    | 0 -> ()
    | v -> add_to v; loop (v -1)
  in

  (* run the loop and read the final state *)
  run_state (fun () ->
    loop 100;
    perform Get) 0
;;

assert (example2 = 5050)
