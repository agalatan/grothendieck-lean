import Grothe.LowerAnalytic.Frame
import Grothe.LowerAnalytic.NodeCaps

/-!
# The per-row Gaussian reduction (L4): `ReductionHyp` from the node caps

`NodeCaps` is the shared node-cap hypothesis from `NodeCaps.lean`, bounding the same
19 certified fibre potentials `rowPot k` at every stored node.

`reductionHyp_of_nodeCaps`: for `n ≥ 2` every unimodular pair satisfies `ReductionHyp n f g`
(rotate `P₁,₀h` to the visible coordinate by a unitary frame, then `sharedReduction_frame`).
The refined finite-cover layer converts this reduction into the lower endpoint.
-/

open MeasureTheory Grothe.Lower

namespace Grothe.LowerAnalytic

noncomputable section

/-- **The per-row Gaussian reduction** (L4): `ReductionHyp` for every unimodular pair in dimension
`n + 1 ≥ 2`, from the node caps alone. -/
theorem reductionHyp_of_nodeCaps (hcaps : NodeCaps) {n : ℕ} (hn : 0 < n) (f g : L2G (n + 1))
    (hf : f ∈ Unimod (stdGaussian ((n + 1) + (n + 1))))
    (hg : g ∈ Unimod (stdGaussian ((n + 1) + (n + 1)))) : ReductionHyp (n + 1) f g := by
  obtain ⟨ζ, hζ, hζ1, hP⟩ := exists_frame_vector (n + 1) (Nat.succ_pos n) (hOf (n + 1) f g)
  obtain ⟨W, hW⟩ := exists_Cop_eq (Nat.succ_pos n) hζ hζ1
  have hP' : (H10 (n + 1)).starProjection (hOf (n + 1) (Cop W f) (Cop W g))
      = ((tOf (n + 1) (Cop W f) (Cop W g) : ℝ) : ℂ) • zeta0 n := by
    rw [hOf_Cop, P_Cop, hP, map_smul, hW, tOf_Cop]
    rfl
  have hS := sharedReduction_frame hn (Cop W f) (Cop W g) (Cop_unimod W hf) (Cop_unimod W hg) hP'
    hcaps
  rw [VOf_Cop, tOf_Cop, QhOf_Cop] at hS
  refine ⟨Cop W.symm (vL (n + 1) 0), by rw [LinearIsometry.norm_map, norm_vL_sq], ?_⟩
  refine sharedReduction_congr hS fun c => ?_
  rw [← LinearIsometry.norm_map (Cop W) (QhOf (n + 1) f g + c • Cop W.symm (vL (n + 1) 0))]
  congr 1
  rw [map_add, RCLike.real_smul_eq_coe_smul (K := ℂ) c (Cop W.symm (vL (n + 1) 0)), map_smul,
    Cop_Cop_symm, ← RCLike.real_smul_eq_coe_smul (K := ℂ)]

end

end Grothe.LowerAnalytic
