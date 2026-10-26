import Grothe.LowerAnalytic.CapLinAlgDefs

/-!
# Computable integrated-majorant piece checks

These rational matrix checks contain no fibre-potential soundness propositions.
Their analytic interpretation is proved in `CapPiece`.
-/

namespace Grothe.LowerAnalytic

/-- The map `P(w₀, y) = (w₀, w₀ s a + M y)` on `ℝ¹³`. -/
def pMat (Mq : ℕ → ℕ → ℚ) (av : ℕ → ℚ) (s : ℚ) (r c : ℕ) : ℚ :=
  if r = 0 then (if c = 0 then 1 else 0) else if c = 0 then s * av (r - 1) else Mq (r - 1) (c - 1)

/-- `N = cap e₀e₀ᵀ + diag(0, M) − Pᵀ T⁺ P`. -/
def pieceN (Mq : ℕ → ℕ → ℚ) (av : ℕ → ℚ) (s cap : ℚ) (Tup : QMat) : QMat :=
  QMat.ofFn 13 fun i j =>
    (if i = 0 ∧ j = 0 then cap else 0) + (if i ≠ 0 ∧ j ≠ 0 then Mq (i - 1) (j - 1) else 0)
      - ((List.range 13).map fun k => ((List.range 13).map fun l =>
          pMat Mq av s k i * Tup.at k l * pMat Mq av s l j).sum).sum

/-- **The piece check**: enclosure sanity, Loewner matrix, exact `LDLᵀ` of `N`. -/
def pieceOK (lo up : QMat) (Mq : ℕ → ℕ → ℚ) (av : ℕ → ℚ) (s cap : ℚ) : Bool :=
  enclOK lo up 13 && ldlOK (pieceN Mq av s cap (loewnerUp lo up 13)) 13

end Grothe.LowerAnalytic
