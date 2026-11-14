import Grothe.UpperQuad.GaussianShiftAnalytic
import Mathlib.Analysis.Analytic.IsolatedZeros

/-!
# Uniqueness of the complex Gaussian coefficient extension

An entire function is determined by its values on the positive real axis. Applying this
identity principle first in the shift and then in the radial coordinate identifies the
norm-controlled Gaussian coefficient with any separately entire common extension of its
bare real integral.

Agent-ID: codex-2f3d. Refs #334, #342.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.GaussianShift

open Complex MeasureTheory Metric Filter Set Grothe.LowerAnalytic Grothe.UpperChaos
open scoped Topology ComplexConjugate

/-- Equality on the positive real axis determines two entire complex functions. -/
theorem eq_of_entire_of_eq_on_positive_reals {f g : ℂ → ℂ}
    (hf : ∀ z, AnalyticAt ℂ f z) (hg : ∀ z, AnalyticAt ℂ g z)
    (hreal : ∀ a : ℝ, 0 < a → f (a : ℂ) = g (a : ℂ)) : f = g := by
  have hfreq : ∃ᶠ z in 𝓝[≠] (0 : ℂ), f z = g z := by
    rw [Filter.frequently_iff]
    intro U hU
    obtain ⟨ε, hε, hεU⟩ := Metric.mem_nhdsWithin_iff.mp hU
    refine ⟨((ε / 2 : ℝ) : ℂ), hεU ⟨?_, ?_⟩, hreal _ (half_pos hε)⟩
    · simpa only [mem_ball, dist_zero_right, Complex.norm_real, Real.norm_eq_abs,
        abs_of_pos (half_pos hε)] using half_lt_self hε
    · simp only [Set.mem_compl_iff, Set.mem_singleton_iff, Complex.ofReal_eq_zero]
      exact ne_of_gt (half_pos hε)
  exact AnalyticOnNhd.eq_of_frequently_eq (fun z _ ↦ hf z) (fun z _ ↦ hg z) hfreq

/-- A separately entire extension agreeing with the coefficient at positive real shifts
agrees at every complex radial coordinate and shift. -/
theorem coefficient_eq_of_real_positive_coefficient (j : ℕ) (hj : 0 < j) (i : ℕ × ℕ)
    {J : ℂ → ℂ → ℂ}
    (hJshift : ∀ r A, AnalyticAt ℂ (J r) A)
    (hJradial : ∀ r A, AnalyticAt ℂ (fun z ↦ J z A) r)
    (hreal : ∀ r a : ℝ, 0 < a → coefficient j (r : ℂ) a 0 i = J (r : ℂ) (a : ℂ))
    (r A : ℂ) : coefficient j r A.re A.im i = J r A := by
  have hshift (s : ℝ) : (fun z ↦ coefficient j (s : ℂ) z.re z.im i) = J (s : ℂ) :=
    eq_of_entire_of_eq_on_positive_reals (fun z ↦ analyticAt_coefficient_shift j hj (s : ℂ) z i)
      (hJshift (s : ℂ)) fun a ha ↦ by
        simpa only [Complex.ofReal_re, Complex.ofReal_im] using hreal s a ha
  have hradial : (fun z ↦ coefficient j z A.re A.im i) = (fun z ↦ J z A) :=
    eq_of_entire_of_eq_on_positive_reals (fun z ↦ analyticAt_coefficient_radial j hj z A i)
      (fun z ↦ hJradial z A) fun s _ ↦ congrFun (hshift s) A
  exact congrFun hradial r

/-- The bare real integral uniquely identifies a separately entire common extension with
the Gaussian coefficient controlled by the vector estimate. Only positive real shifts are needed. -/
theorem coefficient_eq_of_real_positive (j : ℕ) (hj : 0 < j) (i : ℕ × ℕ)
    {J : ℂ → ℂ → ℂ}
    (hJshift : ∀ r A, AnalyticAt ℂ (J r) A)
    (hJradial : ∀ r A, AnalyticAt ℂ (fun z ↦ J z A) r)
    (hreal : ∀ r a : ℝ, 0 < a → J (r : ℂ) (a : ℂ) =
      ∫ w, conj (hfun i w) * (I * (phiT ((r : ℂ), w) : ℂ)) ^ j *
        Haag.ph ((a : ℂ) + w) ∂gaussC)
    (r A : ℂ) : coefficient j r A.re A.im i = J r A := by
  exact coefficient_eq_of_real_positive_coefficient j hj i hJshift hJradial
    (fun s a ha ↦ (coefficient_real_zero j s a i).trans (hreal s a ha).symm) r A

end Grothe.UpperQuad.GaussianShift

open Lean Elab Command
run_cmd do
  let inherited ← Lean.collectAxioms ``Grothe.UpperQuad.GaussianShift.analyticAt_coefficient_shift
  for target in #[``Grothe.UpperQuad.GaussianShift.eq_of_entire_of_eq_on_positive_reals,
      ``Grothe.UpperQuad.GaussianShift.coefficient_eq_of_real_positive_coefficient,
      ``Grothe.UpperQuad.GaussianShift.coefficient_eq_of_real_positive] do
    for dependency in (← Lean.collectAxioms target) do
      unless #[`propext, `Classical.choice, `Quot.sound].contains dependency ||
          inherited.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
