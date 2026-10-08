import Grothe.Upper.BivarSpec
import Grothe.Upper.CheckerDefs

/-!
# Concrete interval data of a certificate with two-coordinate branches (definitions only)

Everything here is computable.  For a certificate `C` (`Cert`), `dloIntC C` is the scaled
integer `mix₀ − Σ_{n≥1} |mixₙ| − Σᵢ wtᵢ · tailᵢ` certified by the kernel (`BivarCert.lean` proves
its soundness), with the retained length `C.K`; the branch columns are computed in parallel.
`restQ C = Σᵢ wtᵢ · Tᵢ · Mxᵢ` is the analytic part of the tail budget (the unknown parts of the
tables), and `massQ C = Σᵢ wtᵢ`.
-/

namespace Grothe.Upper

open GrotheKernel

/-- `[h_0/π, …, h_{K−1}/π]` as exact rationals. -/
def hRatQN (K : ℕ) : List ℚ := hRatFrom 0 (1 / 4) K

/-- Intervals for `h_j/π`, `j < K`. -/
def hRatLN (K : ℕ) : List Ival := (hRatQN K).map ofRatI

/-- Lower bounds for `h_j/π`, `j < K`. -/
def hRatLoN (K : ℕ) : List Int := (hRatQN K).map ofRatLo

/-- Absolute coefficients (the positive majorant). -/
def absL (row : List ℚ) : List ℚ := row.map fun q => |q|

/-- Scaled lower bound of `Σ_{n < K} π · sProf |row| n`. -/
def majSumLoN (K : ℕ) (row : List ℚ) : Int :=
  ((composeLo K ((absL row).map ofRatLo) (hRatLoN K)).map (mulLo piI.lo)).sum

/-- The retained column of a Haagerup branch and the scaled majorant tail budget
`1 − Σ_{n<K} (𝔥 ∘ |ρ|)_n` (clamped at `0`). -/
def scalarColI (K : ℕ) (row : List ℚ) : List Ival × Int :=
  ((composeI K (row.map ofRatI) (hRatLN K)).map (mulI piI), max 0 (D - majSumLoN K row))

/-- Interval coefficients of `P`. -/
def PI (d : BivarData) : List Ival := d.P.map ofRatI

/-- Interval coefficients of `Q`. -/
def QI (d : BivarData) : List Ival := d.Q.map ofRatI

/-- The retained column of a two-coordinate branch and the scaled sum of its discarded
known coefficients. -/
def bivarColI (K : ℕ) (d : BivarData) : List Ival × Int :=
  bivarCol (tabI d) (PI d) (QI d) d.NZ d.MW K

/-- The column of a branch. -/
def colOfSpec (K : ℕ) : BranchSpec → List Ival × Int
  | .scalar row => scalarColI K row
  | .bivar d => bivarColI K d

/-- The analytic tail budget of a branch: `T · Mx` for a two-coordinate branch. -/
def extraQ : BranchSpec → ℚ
  | .scalar _ => 0
  | .bivar d => d.T * d.Mx

/-- All columns, computed in parallel. -/
def allColsC (C : Cert) : List (List Ival × Int) :=
  (C.specs.map fun s => Task.spawn fun _ => colOfSpec C.K s).map Task.get

/-- The `i`-th branch. -/
def specAt (C : Cert) (i : ℕ) : BranchSpec := C.specs.getD i (.scalar [])

/-- The computed column of branch `i`. -/
def colC (C : Cert) (i : ℕ) : List Ival × Int := (allColsC C).getD i ([], 0)

/-- The weight of branch `i` as a rational. -/
def wtQC (C : Cert) (i : ℕ) : ℚ := C.wts.getD i 0

/-- The weight of branch `i` as an interval. -/
def wtIC (C : Cert) (i : ℕ) : Ival := ofRatI (wtQC C i)

/-- The retained mixture column. -/
def mixColC (C : Cert) : List Ival :=
  mixL (List.ofFn fun i : Fin C.specs.length => wtIC C i)
    (List.ofFn fun i : Fin C.specs.length => (colC C i).1)

/-- Scaled upper bound of the weighted computed tails. -/
def tailsIntC (C : Cert) : Int :=
  (List.ofFn fun i : Fin C.specs.length => wTailUp (wtIC C i) (colC C i).2).sum

/-- The certified scaled value. -/
def dloIntC (C : Cert) : Int := headLo (mixColC C) - absSumFrom 1 (mixColC C) - tailsIntC C

/-- The weighted analytic tail budget `Σᵢ wtᵢ · Tᵢ · Mxᵢ`. -/
def restQ (C : Cert) : ℚ :=
  (List.ofFn fun i : Fin C.specs.length => wtQC C i * extraQ (specAt C i)).sum

/-- The mass `Σᵢ wtᵢ`. -/
def massQ (C : Cert) : ℚ := (List.ofFn fun i : Fin C.specs.length => wtQC C i).sum

/-- Every odd-parity index of the box `[0,NZ] × [0,MW]` is listed. -/
def coversBox (d : BivarData) : Bool :=
  (List.range (d.NZ + 1)).all fun n => (List.range (d.MW + 1)).all fun m =>
    (n + m) % 2 == 0 || (idxList d).contains (n, m)

/-- Data side conditions of a branch. -/
def specOK : BranchSpec → Bool
  | .scalar row => decide ((absL row).sum ≤ 1)
  | .bivar d =>
    tabOK d && coversBox d && decide ((absL d.P).sum ≤ 1) && decide ((absL d.Q).sum ≤ 1)
      && decide ((absL d.P).sum ^ (d.NZ + 1) ≤ d.Mx) && decide ((absL d.Q).sum ^ (d.MW + 1) ≤ d.Mx)
      && decide (0 ≤ d.T)

/-- Data side conditions of a certificate. -/
def certOK (C : Cert) : Bool :=
  C.wts.length == C.specs.length && C.specs.length != 0 && decide (0 < C.K)
    && C.wts.all (fun w => decide (0 < w)) && C.specs.all specOK

end Grothe.Upper
