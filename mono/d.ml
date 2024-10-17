open Printf
open C

let rec int_of_nat = function
  | O -> 0
  | S n -> 1 + int_of_nat n

let rec nat_of_int = function
  | 0 -> O
  | n -> S (nat_of_int (n - 1))

let () =
  for n = 1 to 10 do
    printf "phi(%d) = %d\n" n (int_of_nat (phi (nat_of_int n)))
  done
