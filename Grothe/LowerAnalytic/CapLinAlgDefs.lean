import Mathlib.Data.Rat.Floor

/-!
# Computable rational matrix checks for the cap certificates

Exact matrix construction, LDL elimination and enclosure predicates are separate
from their quadratic-form soundness proofs in `CapLinAlg`.
-/

namespace Grothe.LowerAnalytic

/-- A rational matrix as a list of rows. -/
abbrev QMat := List (List ℚ)

/-- The entry `(i, j)` (zero outside the list). -/
def QMat.at (m : QMat) (i j : ℕ) : ℚ := (m.getD i []).getD j 0

/-- The matrix built from a function. -/
def QMat.ofFn (n : ℕ) (f : ℕ → ℕ → ℚ) : QMat := (List.range n).map fun i => (List.range n).map (f i)

/-- One step of the elimination: given the rows `L₀ … L_{k−1}` (as lists of length `k`) and the
pivots, the next row and pivot. -/
def ldlStep (m : QMat) (Ls : List (List ℚ)) (ds : List ℚ) (k : ℕ) : List ℚ × ℚ :=
  let row : List ℚ := (List.range k).foldl (fun acc j =>
    let s := ((List.range j).map fun t => (acc.getD t 0) * ((Ls.getD j []).getD t 0) * ds.getD t 0).sum
    let dj := ds.getD j 0
    acc ++ [if dj = 0 then 0 else (m.at k j - s) / dj]) []
  let dk := m.at k k - ((List.range k).map fun t => (row.getD t 0) ^ 2 * ds.getD t 0).sum
  (row ++ [1], dk)

/-- The exact `LDLᵀ` elimination of the leading `n × n` block. -/
def ldl (m : QMat) (n : ℕ) : QMat × List ℚ :=
  (List.range n).foldl (fun (acc : QMat × List ℚ) k =>
    let r := ldlStep m acc.1 acc.2 k
    (acc.1 ++ [r.1], acc.2 ++ [r.2])) ([], [])

/-- The check `m = L diag(d) Lᵀ`, `d ≥ 0` of the elimination. -/
def ldlOK (m : QMat) (n : ℕ) : Bool :=
  let r := ldl m n
  (List.range n).all (fun i => (List.range n).all fun j =>
    m.at i j == ((List.range n).map fun k => r.1.at i k * r.2.getD k 0 * r.1.at j k).sum) &&
  (List.range n).all fun k => decide (0 ≤ r.2.getD k 0)

/-- The midpoint `(lo + hi)/2`. -/
def midM (lo hi : QMat) (i j : ℕ) : ℚ := (lo.at i j + hi.at i j) / 2
/-- The radius `(hi − lo)/2`. -/
def radM (lo hi : QMat) (i j : ℕ) : ℚ := (hi.at i j - lo.at i j) / 2

/-- The largest row sum of the radii. -/
def rhoM (lo hi : QMat) (n : ℕ) : ℚ :=
  (List.range n).foldl (fun acc i => max acc ((List.range n).map (radM lo hi i)).sum) 0

/-- `mid + ρ I`. -/
def loewnerUp (lo hi : QMat) (n : ℕ) : QMat :=
  QMat.ofFn n fun i j => midM lo hi i j + if i = j then rhoM lo hi n else 0

/-- The enclosure check: `lo ≤ hi` and both symmetric on the leading `n × n` block. -/
def enclOK (lo hi : QMat) (n : ℕ) : Bool :=
  (List.range n).all fun i => (List.range n).all fun j =>
    decide (lo.at i j ≤ hi.at i j) && lo.at i j == lo.at j i && hi.at i j == hi.at j i

end Grothe.LowerAnalytic
