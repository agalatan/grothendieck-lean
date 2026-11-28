import Grothe.LowerAnalytic.Frame

/-!
# The per-row Gaussian reduction (L4): `ReductionHyp` from the node caps

`reductionHyp_of_nodeCaps`: for `n ≥ 2` every unimodular pair satisfies `ReductionHyp n e ν f g`
(rotate `P₁,₀h` to the visible coordinate by a unitary frame, then `sharedReduction_frame`), for
every witness with weight `e` and tail `ν` whose hat weight is the constant `ε` of the rows, given
`TailNodeCaps (nuHat ν)` (`RowGaussian.lean`), the node caps of the potentials of the rows with the identity tail.
The envelope converts this reduction into the lower endpoint (`LowerBound.lean`).
-/

open MeasureTheory Grothe.Lower

namespace Grothe.LowerAnalytic

noncomputable section

/-- **The per-row Gaussian reduction** (L4): `ReductionHyp` for every unimodular pair in dimension
`n + 1 ≥ 2`, from the node caps alone, for a witness with weight `e` and tail `ν` whose hat weight
is the constant `ε` of the rows and the node caps of the potentials with the tail `ν̂ = nuHat ν`. -/
theorem reductionHyp_of_nodeCaps {e ν : ℝ} (he : epsHat e ν = ε) (hcaps : TailNodeCaps (nuHat ν))
    {n : ℕ} (hn : 0 < n) (f g : L2G (n + 1))
    (hf : f ∈ Unimod (stdGaussian ((n + 1) + (n + 1))))
    (hg : g ∈ Unimod (stdGaussian ((n + 1) + (n + 1)))) : ReductionHyp (n + 1) e ν f g := by
  obtain ⟨ζ, hζ, hζ1, hP⟩ := exists_frame_vector (n + 1) (Nat.succ_pos n) (hOf (n + 1) f g)
  obtain ⟨W, hW⟩ := exists_Cop_eq (Nat.succ_pos n) hζ hζ1
  have hP' : (H10 (n + 1)).starProjection (hOf (n + 1) (Cop W f) (Cop W g))
      = ((tOf (n + 1) (Cop W f) (Cop W g) : ℝ) : ℂ) • zeta0 n := by
    rw [hOf_Cop, P_Cop, hP, map_smul, hW, tOf_Cop]
    rfl
  have hS := sharedReduction_frame hn he (Cop W f) (Cop W g) (Cop_unimod W hf) (Cop_unimod W hg)
    hP' hcaps
  rw [VhatOf_Cop, tOf_Cop, QhOf_Cop] at hS
  refine ⟨Cop W.symm (vL (n + 1) 0), by rw [LinearIsometry.norm_map, norm_vL_sq], ?_⟩
  refine sharedReduction_congr hS fun c => ?_
  rw [← LinearIsometry.norm_map (Cop W) (QhOf (n + 1) f g + c • Cop W.symm (vL (n + 1) 0))]
  congr 1
  rw [map_add, RCLike.real_smul_eq_coe_smul (K := ℂ) c (Cop W.symm (vL (n + 1) 0)), map_smul,
    Cop_Cop_symm, ← RCLike.real_smul_eq_coe_smul (K := ℂ)]

/-- The circular-law reduction hypothesis exposing `(A, B)` and `‖p‖ ≤ 93/100`. -/
def CircularReductionHyp (n : ℕ) (e ν : ℝ) (f g : L2G n) (scaleOK : ℝ → Prop := fun τ ↦ τ ≤ ρ) : Prop :=
  ∃ v : L2G n, ‖v‖ ^ 2 = 2 ∧
    CircularSharedReduction rowData (VhatOf n e ν f g) (tOf n f g) (QhOf n f g) v scaleOK

/-- **The circular per-row Gaussian reduction**: `CircularReductionHyp` for every unimodular pair
in dimension `n + 1 ≥ 2`, from the node caps alone. -/
theorem circularReductionHyp_of_nodeCaps_rice {e ν : ℝ} (he : epsHat e ν = ε)
    (hcaps : TailNodeCaps (nuHat ν)) {n : ℕ} (hn : 0 < n) (f g : L2G (n + 1))
    (hf : f ∈ Unimod (stdGaussian ((n + 1) + (n + 1))))
    (hg : g ∈ Unimod (stdGaussian ((n + 1) + (n + 1)))) :
    CircularReductionHyp (n + 1) e ν f g (physicalScale (tOf (n+1) f g)) := by
  obtain ⟨ζ, hζ, hζ1, hP⟩ := exists_frame_vector (n + 1) (Nat.succ_pos n) (hOf (n + 1) f g)
  obtain ⟨W, hW⟩ := exists_Cop_eq (Nat.succ_pos n) hζ hζ1
  have hP' : (H10 (n + 1)).starProjection (hOf (n + 1) (Cop W f) (Cop W g))
      = ((tOf (n + 1) (Cop W f) (Cop W g) : ℝ) : ℂ) • zeta0 n := by
    rw [hOf_Cop, P_Cop, hP, map_smul, hW, tOf_Cop]
    rfl
  have hS := circularSharedReduction_frame_rice hn he (Cop W f) (Cop W g) (Cop_unimod W hf)
    (Cop_unimod W hg) hP' hcaps
  rw [VhatOf_Cop, tOf_Cop, QhOf_Cop] at hS
  refine ⟨Cop W.symm (vL (n + 1) 0), by rw [LinearIsometry.norm_map, norm_vL_sq], ?_⟩
  refine circularSharedReduction_congr hS fun c => ?_
  rw [← LinearIsometry.norm_map (Cop W) (QhOf (n + 1) f g + c • Cop W.symm (vL (n + 1) 0))]
  congr 1
  rw [map_add, RCLike.real_smul_eq_coe_smul (K := ℂ) c (Cop W.symm (vL (n + 1) 0)), map_smul,
    Cop_Cop_symm, ← RCLike.real_smul_eq_coe_smul (K := ℂ)]

/-- The uniform-radius reduction from the same node caps. -/
theorem circularReductionHyp_of_nodeCaps {e ν : ℝ} (he : epsHat e ν = ε)
    (hcaps : TailNodeCaps (nuHat ν)) {n : ℕ} (hn : 0 < n) (f g : L2G (n + 1))
    (hf : f ∈ Unimod (stdGaussian ((n + 1) + (n + 1))))
    (hg : g ∈ Unimod (stdGaussian ((n + 1) + (n + 1)))) :
    CircularReductionHyp (n + 1) e ν f g := by
  obtain ⟨v,hv,hp⟩ := circularReductionHyp_of_nodeCaps_rice he hcaps hn f g hf hg
  exact ⟨v,hv,hp.weaken fun _ h ↦ h.1⟩

end

end Grothe.LowerAnalytic
