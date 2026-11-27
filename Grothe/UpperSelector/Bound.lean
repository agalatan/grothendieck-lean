import Grothe.UpperSelector.MixedPhysical
import Grothe.UpperSelector.NumericWitness
import Grothe.UpperSix.Certificate.Bound

/-! # Complex Grothendieck bound with a seventh Gaussian angular selector -/

set_option warningAsError true

namespace Haagerup.AngularSelector

open SixChannel NumericWitness

/-- The complete seven-channel bound for every finite complex matrix. -/
theorem isBound : Statement.IsBound ((10 : ℝ)^27 / 711968565817136711740669035) := by
  obtain ⟨h, hs, hd, hm, he⟩ := exists_certified_channels
  have hlen (p : Fin 6) : (headIntervals p).length ≤ 320 + 1 := by
    rw [head_length]
    simp only [lastIndex]
    split <;> decide
  have ht := mixed_isBound (N := 320) (w := weight) (h := h) (I := headIntervals)
    (caps := phaseTailCap) (col := Certificate.production) (δ := residual)
    weight_nonneg weight_sum hs hd hlen
    (by rw [Certificate.production_head_size]; decide) hm he Certificate.production_sound
    selector_budget_ok head_ok (le_refl _) residual_lt_center
  have hv : 1 / (1 - (residual : ℝ)) = (10 : ℝ)^27 / 711968565817136711740669035 := by
    rw [residual_eq]
    norm_num
  rwa [← hv]

end Haagerup.AngularSelector
