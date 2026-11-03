import Grothe.UpperChaos.Q0BasePairKernel

/-!
# Continuity of the actual degree-one base kernels

The direct kernels are continuous globally. Reciprocal kernels are continuous
on any rectangle whose auxiliary coordinate is bounded away from zero. The
profile is the actual production `q0Kappa`, including its normalization.

Agent-ID: codex-aa04.
-/

namespace Grothe.UpperChaos.Q0BasePairKernelContinuity

open Set LeanCertProductionProfile

noncomputable def directFirst (η s u : ℝ) : ℝ :=
  Q0BasePairKernel.first η s (q0Kappa s) u

noncomputable def directCompanion (η s u : ℝ) : ℝ :=
  Q0BasePairKernel.companion η s (q0Kappa s) u

noncomputable def reciprocalFirst (η s v : ℝ) : ℝ :=
  Q0BasePairKernel.reciprocalFirst η s (q0Kappa s) v

noncomputable def reciprocalCompanion (η s v : ℝ) : ℝ :=
  Q0BasePairKernel.reciprocalCompanion η s (q0Kappa s) v

private theorem continuous_profile : Continuous q0Kappa := by
  unfold q0Kappa
  exact continuous_const.mul continuous_vprof

/-- Both direct kernels use a denominator at least one, for every real input. -/
theorem continuous_direct_pair (η : ℝ) :
    Continuous (Function.uncurry (directFirst η)) ∧
      Continuous (Function.uncurry (directCompanion η)) := by
  have hk : Continuous (fun p : ℝ × ℝ => q0Kappa p.1) :=
    continuous_profile.comp continuous_fst
  have hd : Continuous (fun p : ℝ × ℝ => 1 + (q0Kappa p.1)^2 * p.2^2) :=
    continuous_const.add ((hk.pow 2).mul (continuous_snd.pow 2))
  have hdne (p : ℝ × ℝ) : 1 + (q0Kappa p.1)^2 * p.2^2 ≠ 0 := by positivity
  have ha : Continuous (fun p : ℝ × ℝ =>
      p.2^2 * p.1 / (1 + (q0Kappa p.1)^2 * p.2^2)) :=
    ((continuous_snd.pow 2).mul continuous_fst).div hd hdne
  have he : Continuous (fun p : ℝ × ℝ =>
      Real.exp (-(η^2 * p.2^2) - p.1 -
        p.2^2 * p.1 / (1 + (q0Kappa p.1)^2 * p.2^2))) :=
    Real.continuous_exp.comp
      (((continuous_const.mul (continuous_snd.pow 2)).neg.sub continuous_fst).sub ha)
  have hc : Continuous (fun p : ℝ × ℝ =>
      Q0BasePairKernel.common η p.1 (q0Kappa p.1) p.2) :=
    he.div (hd.pow 2) (fun p => pow_ne_zero 2 (hdne p))
  exact ⟨(continuous_const.mul continuous_fst).mul hc,
    ((continuous_const.mul hk).mul (continuous_const.sub ha)).mul hc⟩

/-- A positive auxiliary lower endpoint excludes both reciprocal poles.
Endpoint ordering is unnecessary for continuity, since an empty rectangle
also satisfies the conclusion. -/
theorem continuousOn_reciprocal_pair (η sLo sHi auxLo auxHi : ℝ)
    (hauxLo : 0 < auxLo) :
    ContinuousOn (Function.uncurry (reciprocalFirst η))
        (Icc sLo sHi ×ˢ Icc auxLo auxHi) ∧
      ContinuousOn (Function.uncurry (reciprocalCompanion η))
        (Icc sLo sHi ×ˢ Icc auxLo auxHi) := by
  let cell := Icc sLo sHi ×ˢ Icc auxLo auxHi
  have hk : ContinuousOn (fun p : ℝ × ℝ => q0Kappa p.1) cell :=
    (continuous_profile.comp continuous_fst).continuousOn
  have hvne (p : ℝ × ℝ) (hp : p ∈ cell) : p.2 ≠ 0 :=
    (lt_of_lt_of_le hauxLo hp.2.1).ne'
  have hd : ContinuousOn (fun p : ℝ × ℝ => p.2^2 + (q0Kappa p.1)^2) cell :=
    (continuous_snd.continuousOn.pow 2).add (hk.pow 2)
  have hdne (p : ℝ × ℝ) (hp : p ∈ cell) : p.2^2 + (q0Kappa p.1)^2 ≠ 0 :=
    (add_pos_of_pos_of_nonneg (sq_pos_of_ne_zero (hvne p hp)) (sq_nonneg _)).ne'
  have ha : ContinuousOn (fun p : ℝ × ℝ => p.1 / (p.2^2 + (q0Kappa p.1)^2)) cell :=
    continuous_fst.continuousOn.div hd hdne
  have hη : ContinuousOn (fun p : ℝ × ℝ => η^2 / p.2^2) cell :=
    continuousOn_const.div (continuous_snd.continuousOn.pow 2)
      (fun p hp => pow_ne_zero 2 (hvne p hp))
  have he : ContinuousOn (fun p : ℝ × ℝ => Real.exp (-(η^2 / p.2^2) -
      p.1 - p.1 / (p.2^2 + (q0Kappa p.1)^2))) cell :=
    Real.continuous_exp.comp_continuousOn ((hη.neg.sub continuous_fst.continuousOn).sub ha)
  have hc : ContinuousOn (fun p : ℝ × ℝ =>
      Q0BasePairKernel.reciprocalCommon η p.1 (q0Kappa p.1) p.2) cell :=
    ((continuous_snd.continuousOn.pow 2).mul he).div (hd.pow 2)
      (fun p hp => pow_ne_zero 2 (hdne p hp))
  exact ⟨(continuousOn_const.mul continuous_fst.continuousOn).mul hc,
    ((continuousOn_const.mul hk).mul (continuousOn_const.sub ha)).mul hc⟩

end Grothe.UpperChaos.Q0BasePairKernelContinuity
