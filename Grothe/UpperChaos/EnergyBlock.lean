import Grothe.UpperChaos.Energy2

/-! The finite Hermite coefficient vector of one bidegree. -/
namespace Grothe.UpperChaos

open MeasureTheory Finset
open scoped InnerProductSpace

noncomputable section

def blockEquiv (p : ℕ × ℕ) : (Fin (p.1 + 1) × Fin (p.2 + 1)) ≃ ↑(bideg ⁻¹' {p}) where
  toFun a := ⟨((a.1, p.1 - a.1), (a.2, p.2 - a.2)), by
    simp only [Set.mem_preimage, Set.mem_singleton_iff, bideg, Prod.ext_iff]
    constructor <;> omega⟩
  invFun i := (⟨i.1.1.1, by
    have h := i.2
    simp only [Set.mem_preimage, Set.mem_singleton_iff, bideg, Prod.ext_iff] at h
    omega⟩, ⟨i.1.2.1, by
    have h := i.2
    simp only [Set.mem_preimage, Set.mem_singleton_iff, bideg, Prod.ext_iff] at h
    omega⟩)
  left_inv a := by ext <;> rfl
  right_inv i := by
    apply Subtype.ext
    have h := i.2
    simp only [Set.mem_preimage, Set.mem_singleton_iff, bideg, Prod.ext_iff] at h
    ext <;> simp only <;> omega

def energyBlock (G : Lp ℂ 2 mu2) (p : ℕ × ℕ) :
    EuclideanSpace ℂ (Fin (p.1 + 1) × Fin (p.2 + 1)) :=
  WithLp.toLp 2 fun a => ⟪hvec2 ((blockEquiv p) a).1, G⟫_ℂ

lemma norm_energyBlock_sq (G : Lp ℂ 2 mu2) (p : ℕ × ℕ) :
    ‖energyBlock G p‖ ^ 2 = energy G p := by
  rw [EuclideanSpace.norm_sq_eq, energy]
  change (∑ a : Fin (p.1 + 1) × Fin (p.2 + 1), ‖⟪hvec2 ((blockEquiv p) a).1, G⟫_ℂ‖ ^ 2) = _
  simpa only [tsum_fintype] using
    (Equiv.tsum_eq (blockEquiv p) (fun i => ‖⟪hvec2 i.1, G⟫_ℂ‖ ^ 2))

lemma energyBlock_sub (G X : Lp ℂ 2 mu2) (p : ℕ × ℕ) :
    energyBlock (G - X) p = energyBlock G p - energyBlock X p := by
  ext a
  simp [energyBlock, inner_sub_right]

lemma energyBlock_sum {κ : Type*} (J : Finset κ) (D : κ → Lp ℂ 2 mu2) (p : ℕ × ℕ) :
    energyBlock (∑ j ∈ J, D j) p = ∑ j ∈ J, energyBlock (D j) p := by
  ext a
  simp [energyBlock, inner_sum]

lemma energy_sum_le_norm_sq (G : Lp ℂ 2 mu2) (S : Finset (ℕ × ℕ)) :
    ∑ p ∈ S, energy G p ≤ ‖G‖ ^ 2 :=
  ((hasSum_energy_bideg G).summable.sum_le_tsum S fun p _ => energy_nonneg G p).trans_eq
    (hasSum_energy_bideg G).tsum_eq

end
end Grothe.UpperChaos
