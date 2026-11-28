import Grothe.Lower.SparseSteinEnvelope

/-! # The six children of the signed witness's restricted amplitude cell

The prices are the lower, outward-rounded joint row discounts at scale 121/500.
A physical proof may certify them on smaller bands on the individual children.

Agent-ID: codex-a7c4
-/

set_option warningAsError true
namespace Grothe.LowerAnalytic.SignedBand
open Grothe.Lower

private def weights : List (ℚ × ℕ) := [
  (6424378818105543995790421523729/13412622789067932927021702497500,134941099),
  (6955791291089081748998024723729/13412622789067932927021702497500,128994617),
  (885641188781540837438809812275533/1676577848633491615877712812187500,127463893),
  (887040300987744748676125958115661/1676577848633491615877712812187500,127329889),
  (887376777194638645220450260259149/1676577848633491615877712812187500,127297626),
  (890514803275104634555658037662029/1676577848633491615877712812187500,126996051),
  (7487203764072619502205627923729/13412622789067932927021702497500,122496776)]

/-- The registered starts and the two mixing weights of the imported affine row path. -/
def cells : List (ℚ × ℚ × ℚ) :=
  ([3429/4096,34299/40960,52339463/62500000,209359009/250000000,
    837437149/1000000000,837447529/1000000000] : List ℚ).zip
    ((weights.map Prod.fst).zip ((weights.map Prod.fst).drop 1))

/-- Rounded restricted-scale joint price at an endpoint weight. -/
def price (w : ℚ) : ℚ := ((weights.lookup w).getD 0 : ℚ)/10^13

/-- The gain on the interpolated chord also respects both near-scale end prices. -/
def bonus (w z : ℚ) : ℚ :=
  min (min (4*(SparseStein.smallPrice w-price w)) (4*(SparseStein.smallPrice z-price z)))
    ((2019911/10^10)*(w-z)^2*(SparseStein.smallStop/row08.delta)^2)

/-- Both deductions refer to the same phase pair and the same point on the chord. -/
def Deductions {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (V t : ℝ) (Qh v : E) : Prop :=
  ∀ l w z : ℚ, (l,w,z) ∈ cells → (l : ℝ) ≤ t →
    ∀ {x : ℝ}, 0 ≤ x → x ≤ 1 →
    let θ := (1-x)*(w : ℝ)+x*(z : ℝ)
    ∃ d8 d9 : ℝ,
      (1-x)*(price w : ℝ)+x*(price z : ℝ)+(bonus w z : ℝ)*x*(1-x) ≤ (1-θ)*d8+θ*d9 ∧
      RowHolds ε TightShared.row8.ell TightShared.row8.beta ((TightShared.row8.C : ℝ)-d8) V t Qh v ∧
      RowHolds ε TightShared.row9.ell TightShared.row9.beta ((TightShared.row9.C : ℝ)-d9) V t Qh v

end Grothe.LowerAnalytic.SignedBand
