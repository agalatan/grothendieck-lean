import Grothe.UpperChaos.GradedHermite

/-!
# Finite coefficient certificates for charge-one bands

Parseval reduces a bounded total-degree projection to the finite normalized
Hermite coefficients in that band. This identity supplies an interface for
verified numerical enclosures; it proves no Gaussian coefficient estimates.

Agent-ID: codex-2ca4
-/
open MeasureTheory Finset
open scoped InnerProductSpace
namespace Grothe.UpperChaos
noncomputable section

/-- Parseval for any finite total-degree band of a charge-one vector.
This is the common interface for per-coefficient interval certificates. -/
theorem norm_projOn_chargeOne_sq_coefficients (B : Set Idx2)
    [DecidablePred (· ∈ B)] (N : ℕ) (F : Lp ℂ 2 mu2) (hF : ChargeOne F)
    (hdegree : ∀ i ∈ B, (bideg i).1 + (bideg i).2 < 2 * N) :
    ‖projOn B F‖ ^ 2 =
      ∑ i ∈ (gradedSupport N).filter (· ∈ B), ‖⟪hvec2 i, F⟫_ℂ‖ ^ 2 := by
  let S := (gradedSupport N).filter (· ∈ B)
  have hz : ∀ i ∉ S, ‖⟪hvec2 i, projOn B F⟫_ℂ‖ ^ 2 = 0 := by
    intro i hi
    rw [inner_projOn]
    by_cases hb : i ∈ B
    · simp only [hb, ite_true]
      by_cases hc : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1
      · exfalso
        apply hi
        apply Finset.mem_filter.mpr
        refine ⟨mem_gradedSupport_iff.mpr ⟨?_, hc⟩, hb⟩
        have hd := hdegree i hb
        simp only [bideg] at hd
        omega
      · rw [hF i hc]
        simp
    · simp [hb]
  have hs := (hasSum_energy2 (projOn B F)).tsum_eq
  rw [tsum_eq_sum hz] at hs
  calc
    _ = ∑ i ∈ S, ‖⟪hvec2 i, projOn B F⟫_ℂ‖ ^ 2 := hs.symm
    _ = _ := by
      apply Finset.sum_congr rfl
      intro i hi
      have hb : i ∈ B := (Finset.mem_filter.mp hi).2
      rw [inner_projOn, ite_eq_left hb]


end
end Grothe.UpperChaos
