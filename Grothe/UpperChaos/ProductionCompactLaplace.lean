import Grothe.UpperChaos.ProductionFiniteLaplace
import Grothe.UpperChaos.ProductionRadialTail

/-! A simultaneous radial and auxiliary cutoff for the actual Taylor sources.
The entire regularization and both omitted domains fit in one `5e-15` L²
budget, uniformly in the Taylor order. Agent-ID: codex-aa04. -/

open MeasureTheory Set

namespace Grothe.UpperChaos
noncomputable section

/-- A radial cutoff of eighty costs at most `10⁻¹⁷`, including Taylor order zero. -/
theorem norm_source_eighty_le (j : ℕ) :
    ‖(TaylorRadialTail.source_memLp 80 j).toLp (TaylorRadialTail.source 80 j)‖ ≤
      (1 / 10 ^ 17 : ℝ) := by
  apply (sq_le_sq₀ (norm_nonneg _) (by positivity : (0 : ℝ) ≤ 1 / 10 ^ 17)).mp
  have he : Real.exp (-80) = (Real.exp (-40)) ^ 2 := by
    rw [pow_two, ← Real.exp_add]
    norm_num
  calc
    _ ≤ Real.exp (-80) := TaylorRadialTail.norm_source_sq_le_exp 80 (by norm_num) j
    _ = (Real.exp (-40)) ^ 2 := he
    _ ≤ _ := pow_le_pow_left₀ (Real.exp_pos _).le exp_neg_forty_le 2

/-- The production source with both the radial and auxiliary domains cut off. -/
def compactLaplaceHpow (η T L : ℝ) (j : ℕ) : ℂ × ℂ → ℂ :=
  ((TaylorRadialTail.cutoffSet L)ᶜ).indicator (finiteLaplaceHpow η T j)

def compactLaplaceError (η T L : ℝ) (j : ℕ) : ℂ × ℂ → ℂ :=
  hpow j - compactLaplaceHpow η T L j

lemma compactLaplaceError_eq (η T L : ℝ) (j : ℕ) :
    compactLaplaceError η T L j = TaylorRadialTail.source L j +
      ((TaylorRadialTail.cutoffSet L)ᶜ).indicator (finiteLaplaceError η T j) := by
  funext u
  by_cases hu : u ∈ TaylorRadialTail.cutoffSet L <;>
    simp [compactLaplaceError, compactLaplaceHpow, TaylorRadialTail.source,
      finiteLaplaceError, hu]

lemma compactLaplaceError_memLp (η T L : ℝ) (hη : 0 < η) (hT : 0 ≤ T) (j : ℕ) :
    MemLp (compactLaplaceError η T L j) 2 mu2 := by
  rw [compactLaplaceError_eq]
  exact (TaylorRadialTail.source_memLp L j).add
    ((finiteLaplaceError_memLp η T hη hT j).indicator
      (TaylorRadialTail.measurableSet_cutoffSet L).compl)

lemma norm_toLp_indicator_le {f : ℂ × ℂ → ℂ} (hf : MemLp f 2 mu2)
    {S : Set (ℂ × ℂ)} (hS : MeasurableSet S) :
    ‖(hf.indicator hS).toLp (S.indicator f)‖ ≤ ‖hf.toLp f‖ := by
  rw [Lp.norm_toLp, Lp.norm_toLp]
  exact ENNReal.toReal_mono hf.eLpNorm_ne_top (eLpNorm_indicator_le f hS)

/-- Restricting the finite-integral error cannot increase its L² norm. -/
theorem norm_compactLaplaceError_le (η T L : ℝ) (hη : 0 < η) (hT : 0 ≤ T) (j : ℕ) :
    ‖(compactLaplaceError_memLp η T L hη hT j).toLp (compactLaplaceError η T L j)‖ ≤
      ‖(TaylorRadialTail.source_memLp L j).toLp (TaylorRadialTail.source L j)‖ +
        ((10 / 3 : ℝ) * η + Real.exp (-(η ^ 2 * T))) := by
  have heq := (compactLaplaceError_memLp η T L hη hT j).toLp_congr
    ((TaylorRadialTail.source_memLp L j).add
      ((finiteLaplaceError_memLp η T hη hT j).indicator
        (TaylorRadialTail.measurableSet_cutoffSet L).compl))
    (Filter.Eventually.of_forall fun u => congrFun (compactLaplaceError_eq η T L j) u)
  rw [heq, MemLp.toLp_add (TaylorRadialTail.source_memLp L j)
    ((finiteLaplaceError_memLp η T hη hT j).indicator
      (TaylorRadialTail.measurableSet_cutoffSet L).compl)]
  refine (norm_add_le _ _).trans (add_le_add le_rfl ?_)
  exact (norm_toLp_indicator_le (finiteLaplaceError_memLp η T hη hT j)
    (TaylorRadialTail.measurableSet_cutoffSet L).compl).trans
      (norm_finiteLaplaceError_le η T hη hT j)

/-- The full error from softening, radial cutoff and auxiliary cutoff meets
one production reserve. The finite interior quadrature is still a separate task. -/
theorem norm_compactLaplaceError_cutoff_lt (j : ℕ) :
    ‖(compactLaplaceError_memLp finiteLaplaceEta finiteLaplaceCutoff 80
      finiteLaplaceEta_pos finiteLaplaceCutoff_nonneg j).toLp
      (compactLaplaceError finiteLaplaceEta finiteLaplaceCutoff 80 j)‖ < (5 / 10 ^ 15 : ℝ) := by
  have h := norm_compactLaplaceError_le finiteLaplaceEta finiteLaplaceCutoff 80
    finiteLaplaceEta_pos finiteLaplaceCutoff_nonneg j
  have hr := norm_source_eighty_le j
  have ht := exp_neg_scaled_finiteLaplaceCutoff_le
  exact h.trans_lt ((add_le_add hr (add_le_add le_rfl ht)).trans_lt
    (by norm_num [finiteLaplaceEta]))

/-- The compact-domain reduction controls every band after actual smoothing. -/
theorem norm_projOn_smooth_compactLaplaceError_cutoff_lt (B : Set Idx2) (j : ℕ) :
    ‖projOn B (smoothOp ((compactLaplaceError_memLp finiteLaplaceEta finiteLaplaceCutoff 80
      finiteLaplaceEta_pos finiteLaplaceCutoff_nonneg j).toLp
      (compactLaplaceError finiteLaplaceEta finiteLaplaceCutoff 80 j)))‖ < (5 / 10 ^ 15 : ℝ) :=
  ((modeSpace B).norm_starProjection_apply_le _).trans_lt
    ((norm_smoothOp_le _).trans_lt (norm_compactLaplaceError_cutoff_lt j))

end
end Grothe.UpperChaos
