import GrotheKernel.Table

/-! A coefficient cost for one retained bidegree. Short shifted heads are
computed by interval arithmetic; all other terms retain their unit cost. -/
namespace GrotheKernel

/-- The interval coefficients of the unshifted term, with the known factor
`X^m` removed from the auxiliary polynomial. -/
def weightTerm (K : Nat) (pp qq : List (List Ival)) (n m : Nat) : List Ival :=
  (convI (pp.getD n []) (qq.getD m [])).take K

/-- Safe cost in `[0,1]`. The two power tables are constructed from the
primary polynomial and the auxiliary polynomial divided by `X`. -/
def headWeight (N L : Nat) (pp qq : List (List Ival)) (n m : Nat) : Rat :=
  let k := (N + 1) / 2 - (n / 2 + m / 2 + m)
  if n ≤ N && m ≤ N / 3 && k ≤ L then
    min 1 (max 0 ((absSum (weightTerm k pp qq n m) : Rat) / (D : Rat)))
  else 1

end GrotheKernel
