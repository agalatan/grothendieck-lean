import GrotheKernel.Bivar

/-!
Native timing of `bivarFull` on a synthetic `200 × 40` table (entries at `n + m` odd),
`P` with 12 coefficients (`ρ` of degree 23), `Q` with 8 (`σ` of degree 15).
Copy this file to `Grothe/Upper/BivarTiming.lean` and `lake build Grothe.Upper.BivarTiming`
to run it against the precompiled kernel; in `lake env lean` it runs interpreted.
-/

open GrotheKernel

def synthP : List Ival := (List.range 12).map fun j => ofRatI ((9 : Rat) / 10 / (2 ^ j))
def synthQ : List Ival := (List.range 8).map fun j => ofRatI (-(1 : Rat) / 2 / (3 ^ j))

def synthTab : List RowI :=
  (List.range 41).map fun m =>
    (m, ((List.range 201).filter fun n => (n + m) % 2 == 1).map fun n =>
      (n, ofRatI ((1 : Rat) / ((n + 1) * (m + 1)) / 4)))

def main : IO Unit := do
  let t0 ← IO.monoMsNow
  let B := bivarFull synthTab synthP synthQ 200 40
  IO.println s!"length {B.length}, head lo {B.getD 0 zeroI |>.lo}, sum|c| beyond 800: {absSumFrom 800 B}"
  let t1 ← IO.monoMsNow
  IO.println s!"{t1 - t0} ms (table 200×40, |P| = 12, |Q| = 8)"

#eval main
