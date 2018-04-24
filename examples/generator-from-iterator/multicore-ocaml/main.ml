(* A list iterator *)
let list_iter lst f =
  let rec iter = function
    | [] -> ()
    | x :: xs -> f x ; iter xs
  in
  iter lst

(* A tree iterator *)
type 'a tree = Empty | Node of 'a * 'a tree * 'a tree

let leaf x = Node (x, Empty, Empty)

let tree_iter tree f =
  let rec iter = function
    | Empty -> ()
    | Node (x, l, r) -> iter l ; f x ; iter r
  in
  iter tree

(* A polymorphic generator from iterator *)
let make_generator (type a) (iter : (a -> unit) -> unit) : (unit -> a option) =
  let module M = struct effect Yield : a -> unit end in
  let open M in
  let step = ref (fun () -> assert false) in
  let first_step () =
    try
      iter (fun x -> perform (Yield x)) ;
      None
    with effect (Yield v) k ->
      step := continue k;
      Some v
  in
  step := first_step;
  fun () -> !step ()

(* Example *)
let example =

   let it1 = list_iter [10; 20; 30; 40; 50] in
   let it2 = tree_iter (Node (5, Node (3, leaf 1, leaf 4), leaf 6)) in
   let g1 = make_generator it1 in
   let g2 = make_generator it2 in
   let rec loop () =
     match g1(), g2() with
     | Some x, Some y -> (x, y) :: loop ()
     | _, _ -> []
   in
   loop ()
