import Grothe.HJM.Data
import Grothe.Upper.Compose

/-!
# The HJM scalar preprocessors

The five scalar branches of the HJM certificate use the odd preprocessors `ρ_r(t) = t P_r(t²)`, with the exact
coefficient lists of `Grothe.HJM.Data`. Each has `ℓ¹` norm at most one (`l1_P`), so composing a dominated radial
kernel with it gives a dominated radial kernel again (`dominated_branch`).
-/

namespace Grothe.HJM

open Polynomial

noncomputable section

/-- The coefficient lists of the five scalar preprocessors. -/
def pLists : Fin 5 → List ℚ := ![pList1, pList2, pList3, pList4, pList5]

theorem pLists_norm : ∀ r, ((pLists r).map fun q => |q|).sum ≤ 1 := by decide +kernel

/-- `P_r`, so that `ρ_r(t) = t P_r(t²)`. -/
def P (r : Fin 5) : ℝ[X] := ofListQ (pLists r)

lemma l1_P (r : Fin 5) : l1 (P r) ≤ 1 :=
  (l1_ofListQ_le _).trans (by exact_mod_cast pLists_norm r)

/-- **The scalar branches are dominated**: a dominated radial kernel composed with `ρ_r`. -/
theorem dominated_branch {c : ℕ → ℝ} (hc : Summable fun k => |c k|) (hQ : DominatedKernel (radialKernel c))
    (r : Fin 5) : DominatedKernel (radialKernel (compCoeff c (P r))) :=
  hQ.comp_radial hc (l1_P r)

/-- The six signed weights have absolute sum at most `1 + 10⁻¹²`. -/
theorem weights_norm : (weights.map fun q => |q|).sum ≤ 1 + 1 / 10 ^ 12 := by decide +kernel

end

end Grothe.HJM
