let make_generator (type a) (t : a list) : (unit -> a option) =
  let module M = struct effect Yield : a -> unit end in
  let open M in
  let step = ref (fun () -> assert false) in
  let first_step () =
    try
      List.iter (fun x -> perform (Yield x)) t;
      None
    with effect (Yield v) k ->
      step := continue k;
      Some v
  in
  step := first_step;
  fun () -> !step ()

let l1 = [1;2;3;4]
let l2 = ["a";"b";"c";"d"]

let example =
  let g1 = make_generator l1 in
  let g2 = make_generator l2 in
  let rec loop () =
    match g1(), g2() with
    | Some v1, Some v2 ->
        print_int v1;
        print_string v2;
        loop ()
    | _ -> print_endline ""
  in
  loop ()
