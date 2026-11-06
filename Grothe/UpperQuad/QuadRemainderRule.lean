import Grothe.UpperQuad.QuadRemainder
import Grothe.UpperChaos.Q0GaussPolynomialCertificates
import Grothe.UpperChaos.Q0GaussProductionMass

/-!
# The production rule of a panel is an exact Gauss rule (part (Q) of `hQuad`)

For every source panel `p` of order `n` the production nodes `sourceNode ⟨p, i⟩` and weights
`sourceWeight ⟨p, i⟩` (master's `Q0GaussProductionMass`) lie in the panel, are positive, and
integrate the real polynomials of degree `< 2n` exactly (`source_rule_exact`: master's
`Q0GaussPolynomialCertificates.exactness` at the selected roots, transported by `panel_exactness`).

Agent-ID: claude-b9ee. Refs #303.
-/

namespace Grothe.UpperQuad.QuadRem

open Grothe.UpperChaos Grothe.UpperChaos.Q0GaussAddressScan Grothe.UpperChaos.Q0GaussOrdinalEquiv
open Grothe.UpperChaos.Q0GaussProductionMass Grothe.UpperChaos.Q0LegendreInteger MeasureTheory

/-- The reference rule of a selected root family is exact through degree `2n − 1`. -/
theorem selected_exact (n : ℕ) (hn : 1 ≤ n ∧ n ≤ 64)
    (rule : Q0GaussSelected.SelectedRule n) (f : Polynomial ℝ) (hf : f.natDegree < 2 * n) :
    ∫ t in (-1 : ℝ)..1, f.eval t = ∑ i, weight (n - 1) (rule.root i) * f.eval (rule.root i) := by
  obtain ⟨k, rfl⟩ : ∃ k, n = k + 1 := ⟨n - 1, by omega⟩
  have hk : k < 64 := by omega
  have h := Q0GaussPolynomialCertificates.exactness ⟨k, hk⟩ rule.root rule.injective
    (by simpa using rule.isRoot) f (by simpa using hf)
  rw [h]
  apply Finset.sum_congr rfl
  intro i _
  unfold weight
  simp

/-- **The production rule of a panel is exact.** -/
theorem source_rule_exact (p : Fin sourcePanels.length) (q : Polynomial ℝ)
    (hq : q.natDegree < 2 * (sourcePanels.get p).order) :
    ∫ s in ((sourcePanels.get p).lo : ℝ)..(sourcePanels.get p).hi, q.eval s =
      ∑ i : Fin (sourcePanels.get p).order, sourceWeight ⟨p, i⟩ * q.eval (sourceNode ⟨p, i⟩) := by
  have hb : 1 ≤ (sourcePanels.get p).order ∧ (sourcePanels.get p).order ≤ 64 := by
    have := scan_member_order_bounds sourcePanels 0 21577 complete_scan
      (sourcePanels.get p) (List.get_mem sourcePanels p)
    exact this
  have h := Quad.panel_exactness _ _ (source_panel_lt p)
    (fun i => (Q0GaussSelectedChoice.selectedFor _ hb).root i)
    (selected_exact _ hb (Q0GaussSelectedChoice.selectedFor _ hb)) q hq
  rw [h]
  rfl

end Grothe.UpperQuad.QuadRem
