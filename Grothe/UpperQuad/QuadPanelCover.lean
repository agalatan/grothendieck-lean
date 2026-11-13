import Grothe.UpperQuad.QuadDecomp
import Grothe.UpperQuad.OmittedTotal
import Grothe.UpperQuad.QuadRemainderRadial

/-!
# Regrouping the Gauss sums and the covered integral by panel (part (Q) of `hQuad`)

* `gaussCoeffFull_canonical`: for a canonical entry (`c ≤ d + 1`) the exact Gauss sum without the
  cutoffs is `Σ_{p} Σ_{i < order p} W_{p,i} f_{qcd}(x_{p,i})` with master's production nodes and
  weights and the real node integrand `f_{qcd}(s) = ψ_{d+1−c,q−d}(s) e^{−s} nodeCoef s (c,d)`.

Agent-ID: claude-b9ee. Refs #303.
-/

namespace Grothe.UpperQuad.QuadRem

open GrotheQuad Grothe.UpperChaos Grothe.UpperChaos.Q0GaussAddressScan
open Grothe.UpperChaos.Q0GaussOrdinalEquiv Grothe.UpperChaos.Q0GaussProductionMass
open Grothe.UpperChaos.F0ConditionalEvaluator

noncomputable section

/-- The real node integrand of the canonical entry `(q, c, d)`. -/
def nodeF (q c d : ℕ) (s : ℝ) : ℝ :=
  RadialLaguerre.radialFactor (d + 1 - c) (q - d) s * Real.exp (-s) * nodeCoef s (c, d)

/-- The node term of a canonical entry is the weighted node integrand. -/
lemma nodeTerm_canonical (s W : ℝ) (q c d : ℕ) (hq : q < 251) (hd : d ≤ q) (hc : c ≤ d + 1) :
    nodeTerm s W 531 0 251 (d + 1 - c) (q - d) (if d + 1 - c = 0 then c - 1 else c) =
      W * nodeF q c d s := by
  unfold nodeTerm nodeF
  rw [pairOf_canonical c d hc, entryGrade_canonical q c d hd hc]
  have hcond : (if d + 1 - c = 0 then c - 1 else c) < activeCols (d + 1 - c) (q - d) ∧
      0 ≤ q ∧ q < 251 ∧ c + d ≤ 531 :=
    ⟨col_lt_activeCols q c d hq hd hc, Nat.zero_le _, hq, by omega⟩
  simp only [hcond, and_self, ↓reduceIte]
  ring

/-- The full Gauss sums as sums over master's source addresses. -/
theorem gaussRawFull_eq_sum_address (k j cIdx : ℕ) :
    gaussRawFull partitionSpecs rootOf k j cIdx =
      ∑ a : Address, nodeTerm (sourceNode a) (sourceWeight a) 531 0 251 k j cIdx := by
  unfold gaussRawFull
  rw [sum_partitionSpecs]
  exact Finset.sum_congr rfl fun a _ ↦ by rw [specNode_rootOf, specWeight_rootOf]

/-- **The canonical Gauss sum, panel by panel.** -/
theorem gaussCoeffFull_canonical (q c d : ℕ) (hq : q < 251) (hd : d ≤ q) (hc : c ≤ d + 1) :
    gaussCoeffFull partitionSpecs rootOf q c d =
      ∑ p : Fin sourcePanels.length, ∑ i : Fin (sourcePanels.get p).order,
        sourceWeight ⟨p, i⟩ * nodeF q c d (sourceNode ⟨p, i⟩) := by
  unfold gaussCoeffFull gradeValue rawValue
  simp only [hc, ↓reduceIte, add_zero]
  rw [gaussRawFull_eq_sum_address, Fintype.sum_sigma]
  exact Finset.sum_congr rfl fun p _ ↦ Finset.sum_congr rfl fun i _ ↦
    nodeTerm_canonical _ _ q c d hq hd hc

end

end Grothe.UpperQuad.QuadRem
