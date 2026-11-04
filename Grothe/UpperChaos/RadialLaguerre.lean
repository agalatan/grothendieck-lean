import Grothe.UpperChaos.HermiteFallingFactorial
import Grothe.UpperChaos.HermiteBasis
import Mathlib.Algebra.BigOperators.Intervals
import Mathlib.Tactic
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
# Hermite radial factors and associated Laguerre polynomials

Exact finite identities for the production Hermite convention and normalization.
The radial factor retains the natural power of the radius, including zero radius
and zero charge. No numerical matrix bound or quadrature estimate is assumed.

Agent-ID: codex-8c4d. Refs #21.
-/

set_option warningAsError true
open scoped ComplexConjugate
open Finset

namespace Grothe.UpperChaos.RadialLaguerre
noncomputable section

/-- Integer-parameter associated Laguerre, with its standard finite coefficients. -/
def assocLaguerre (k m : ℕ) (s : ℝ) : ℝ :=
  ∑ j ∈ range (m + 1),
    (-1 : ℝ) ^ j * ((m + k).choose (m - j) : ℝ) /
      (j.factorial : ℝ) * s ^ j

/-- Positive normalization; the Hermite radial factor also has (-1)^m and r^k. -/
def normalizedLaguerre (k m : ℕ) (s : ℝ) : ℝ :=
  Real.sqrt ((m.factorial : ℝ) / ((m + k).factorial : ℝ)) * assocLaguerre k m s

/-- Exact real primary factor, retaining r^k to cover k=0,s=0 without rpow. -/
def radialFactor (k m : ℕ) (s : ℝ) : ℝ :=
  (-1 : ℝ) ^ m * (Real.sqrt s) ^ k * normalizedLaguerre k m s

private def radialTerm (k m : ℕ) (r : ℝ) (t : ℕ) : ℝ :=
  (-1 : ℝ) ^ t * ((m + k).choose t : ℝ) * (m.descFactorial t : ℝ) *
    r ^ (m + k - t) * r ^ (m - t)

private theorem real_expansion (k m : ℕ) (r : ℝ) :
    ev (r : ℂ) (H (m + k) m) =
      ((∑ t ∈ range (m + k + 1), radialTerm k m r t : ℝ) : ℂ) := by
  rw [HermiteFallingFactorial.ev_H_eq_fallingFactorial]
  simp [radialTerm]

private theorem descFactorial_reflected (m j : ℕ) (hj : j ≤ m) :
    (m.descFactorial (m - j) : ℝ) = (m.factorial : ℝ) / (j.factorial : ℝ) := by
  have hsub : m - (m - j) = j := by omega
  have hn : j.factorial * m.descFactorial (m - j) = m.factorial := by
    simpa only [hsub] using Nat.factorial_mul_descFactorial (Nat.sub_le m j)
  have hr : (j.factorial : ℝ) * (m.descFactorial (m - j) : ℝ) =
      (m.factorial : ℝ) := by exact_mod_cast hn
  apply (eq_div_iff (by exact_mod_cast Nat.factorial_ne_zero j)).2
  simpa only [mul_comm] using hr

private theorem sign_reflected (m j : ℕ) (hj : j ≤ m) :
    (-1 : ℝ) ^ (m - j) = (-1 : ℝ) ^ m * (-1 : ℝ) ^ j := by
  have hu : ((-1 : ℝ) ^ j) ^ 2 = 1 := by
    rw [← pow_mul, Nat.mul_comm j 2, pow_mul]
    norm_num
  have hm : (-1 : ℝ) ^ m = (-1 : ℝ) ^ (m - j) * (-1 : ℝ) ^ j := by
    rw [← pow_add, Nat.sub_add_cancel hj]
  symm
  rw [hm, mul_assoc, ← pow_two, hu, mul_one]

private theorem radial_powers (k m j : ℕ) (r : ℝ) (hj : j ≤ m) :
    r ^ (m + k - (m - j)) * r ^ (m - (m - j)) =
      r ^ k * (r ^ 2) ^ j := by
  have he₁ : m + k - (m - j) = k + j := by omega
  have he₂ : m - (m - j) = j := by omega
  rw [he₁, he₂]
  calc
    r ^ (k + j) * r ^ j = r ^ k * (r ^ j * r ^ j) := by
      rw [pow_add, mul_assoc]
    _ = r ^ k * (r * r) ^ j := by rw [mul_pow]
    _ = r ^ k * (r ^ 2) ^ j := by rw [pow_two]

private theorem radialTerm_reflected (k m j : ℕ) (r : ℝ) (hj : j ≤ m) :
    radialTerm k m r (m - j) =
      ((-1 : ℝ) ^ m * (m.factorial : ℝ) * r ^ k) *
        ((-1 : ℝ) ^ j * ((m + k).choose (m - j) : ℝ) /
          (j.factorial : ℝ) * (r ^ 2) ^ j) := by
  calc
    radialTerm k m r (m - j) =
        ((-1 : ℝ) ^ (m - j) * ((m + k).choose (m - j) : ℝ) *
          (m.descFactorial (m - j) : ℝ)) *
          (r ^ (m + k - (m - j)) * r ^ (m - (m - j))) := by
      unfold radialTerm
      ring
    _ = _ := by
      rw [radial_powers k m j r hj, sign_reflected m j hj,
        descFactorial_reflected m j hj]
      ring

private theorem radial_sum (k m : ℕ) (r : ℝ) :
    (∑ t ∈ range (m + k + 1), radialTerm k m r t) =
      (-1 : ℝ) ^ m * (m.factorial : ℝ) * r ^ k * assocLaguerre k m (r ^ 2) := by
  calc
    (∑ t ∈ range (m + k + 1), radialTerm k m r t) =
        ∑ t ∈ range (m + 1), radialTerm k m r t := by
      symm
      apply Finset.sum_subset (Finset.range_mono (by omega))
      intro t _ ht
      have hmt : m < t := by
        have hnot : ¬t < m + 1 := by simpa only [Finset.mem_range] using ht
        omega
      simp only [radialTerm, Nat.descFactorial_eq_zero_iff_lt.mpr hmt,
        Nat.cast_zero, mul_zero, zero_mul]
    _ = ∑ j ∈ range (m + 1), radialTerm k m r (m - j) := by
      simpa only [Nat.add_sub_cancel] using
        (Finset.sum_range_reflect (radialTerm k m r) (m + 1)).symm
    _ = _ := by
      rw [assocLaguerre, Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro j hj
      exact radialTerm_reflected k m j r (by
        have := Finset.mem_range.mp hj
        omega)

/-- The actual production polynomial restricted to the real axis. -/
theorem ev_H_real_laguerre (k m : ℕ) (r : ℝ) :
    ev (r : ℂ) (H (m + k) m) =
      (((-1 : ℝ) ^ m * (m.factorial : ℝ) * r ^ k *
        assocLaguerre k m (r ^ 2) : ℝ) : ℂ) := by
  rw [real_expansion, radial_sum]

/-- The actual radial polynomial, with no conjugation or factorial omitted. -/
theorem ev_H_radial_laguerre (k m : ℕ) {s : ℝ} (hs : 0 ≤ s) :
    ev (Real.sqrt s : ℂ) (H (m + k) m) =
      (((-1 : ℝ) ^ m * (m.factorial : ℝ) * (Real.sqrt s) ^ k *
        assocLaguerre k m s : ℝ) : ℂ) := by
  rw [ev_H_real_laguerre, Real.sq_sqrt hs]

/-- Uses the already proved production normalization square identity. -/
theorem nrm_mul_factorial (k m : ℕ) :
    nrm (m + k) m * (m.factorial : ℝ) =
      Real.sqrt ((m.factorial : ℝ) / ((m + k).factorial : ℝ)) := by
  have hp : 0 < ((m + k).factorial : ℝ) := by
    exact_mod_cast Nat.factorial_pos (m + k)
  have hm : 0 < (m.factorial : ℝ) := by exact_mod_cast Nat.factorial_pos m
  have hn : nrm (m + k) m * nrm (m + k) m *
      (((m + k).factorial : ℝ) * (m.factorial : ℝ)) = 1 := by
    simpa only [Nat.cast_mul] using nrm_sq_mul (m + k) m
  have hsquare : (nrm (m + k) m * (m.factorial : ℝ)) ^ 2 =
      (m.factorial : ℝ) / ((m + k).factorial : ℝ) := by
    apply (eq_div_iff hp.ne').2
    calc
      (nrm (m + k) m * (m.factorial : ℝ)) ^ 2 * ((m + k).factorial : ℝ) =
          (nrm (m + k) m * nrm (m + k) m *
            (((m + k).factorial : ℝ) * (m.factorial : ℝ))) * (m.factorial : ℝ) := by
        ring
      _ = (m.factorial : ℝ) := by rw [hn, one_mul]
  symm
  apply (Real.sqrt_eq_iff_eq_sq (div_nonneg hm.le hp.le)
    (mul_nonneg (nrm_pos (m + k) m).le hm.le)).2
  exact hsquare.symm

/-- The normalized production hfun is precisely the signed Laguerre radial factor. -/
theorem hfun_radial_laguerre (k m : ℕ) {s : ℝ} (hs : 0 ≤ s) :
    hfun (m + k, m) (Real.sqrt s : ℂ) = (radialFactor k m s : ℂ) := by
  change (nrm (m + k) m : ℂ) * ev (Real.sqrt s : ℂ) (H (m + k) m) = _
  rw [ev_H_radial_laguerre k m hs]
  calc
    (nrm (m + k) m : ℂ) *
        (((-1 : ℝ) ^ m * (m.factorial : ℝ) * (Real.sqrt s) ^ k *
          assocLaguerre k m s : ℝ) : ℂ) =
      (((-1 : ℝ) ^ m * (nrm (m + k) m * (m.factorial : ℝ)) *
        (Real.sqrt s) ^ k * assocLaguerre k m s : ℝ) : ℂ) := by
      push_cast
      ring
    _ = (radialFactor k m s : ℂ) := by
      rw [nrm_mul_factorial]
      unfold radialFactor normalizedLaguerre
      congr 1
      ring

/-- Conjugation does not introduce a second sign on a nonnegative real radius. -/
theorem conj_hfun_radial_laguerre (k m : ℕ) {s : ℝ} (hs : 0 ≤ s) :
    conj (hfun (m + k, m) (Real.sqrt s : ℂ)) = (radialFactor k m s : ℂ) := by
  rw [hfun_radial_laguerre k m hs, Complex.conj_ofReal]

/-- Exact primary arguments of the degree-501 contraction, before any matrix bound. -/
theorem conj_primary_laguerre (q c d : ℕ) (hdq : d ≤ q) (hcd : c ≤ d + 1)
    {s : ℝ} (hs : 0 ≤ s) :
    conj (hfun (q + 1 - c, q - d) (Real.sqrt s : ℂ)) =
      (radialFactor (d + 1 - c) (q - d) s : ℂ) := by
  have hi : q + 1 - c = (q - d) + (d + 1 - c) := by omega
  rw [hi]
  exact conj_hfun_radial_laguerre (d + 1 - c) (q - d) hs

end
end Grothe.UpperChaos.RadialLaguerre

open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.RadialLaguerre.assocLaguerre,
      ``Grothe.UpperChaos.RadialLaguerre.normalizedLaguerre,
      ``Grothe.UpperChaos.RadialLaguerre.radialFactor,
      ``Grothe.UpperChaos.RadialLaguerre.ev_H_real_laguerre,
      ``Grothe.UpperChaos.RadialLaguerre.ev_H_radial_laguerre,
      ``Grothe.UpperChaos.RadialLaguerre.nrm_mul_factorial,
      ``Grothe.UpperChaos.RadialLaguerre.hfun_radial_laguerre,
      ``Grothe.UpperChaos.RadialLaguerre.conj_hfun_radial_laguerre,
      ``Grothe.UpperChaos.RadialLaguerre.conj_primary_laguerre] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
