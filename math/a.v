Require Import Nat.

(* returns the number of k in 0, ..., n-1 s.t. f k is true *)
Fixpoint count (f : nat -> bool) n :=
  match n with
  | O => 0
  | S n => (if f n then 1 else 0) + count f n
  end.

(* returns the number of k in 1, ..., n s.t. f k is true *)
Definition count1 f n := count (fun k => f (1 + k)) n.

Definition phi n := count (fun k => gcd k n =? 1) n.
