import Grothe.HJM.OriginData
import Grothe.Haagerup.Phase
import Grothe.Upper.Head

/-!
# The exact asymmetric origin responses

Agent-ID: codex-aa04.

These are the sixth response pair in HJM, arXiv:2609.25462, §4.2. All
parameters come from the hash-pinned rational input in `OriginData`. Taking
the phase of each product is equivalent to the paper's factored expression.
The convention `ph 0 = 0` keeps the functions disk-valued everywhere,
including their irrelevant value at the Gaussian origin.

The right radial numerator at zero is exactly `-I` times the left one.
Consequently the real part of the endpoint cross product vanishes. This
algebraic cancellation is the reason to subtract the phase mode before
estimating the spectral tail.
-/

open MeasureTheory Grothe.Haag Grothe.Upper
open scoped ComplexConjugate

namespace Grothe.HJM.Origin

noncomputable section

/-- The exact degree-nine polynomial from the origin certificate. -/
def P (s : ℝ) : ℂ :=
  ((ofListQ OriginData.pReal).eval s : ℂ) +
    Complex.I * ((ofListQ OriginData.pImag).eval s : ℂ)

def A : ℂ := (OriginData.aReal : ℂ) + Complex.I * (OriginData.aImag : ℂ)

def C : ℂ := (OriginData.cReal : ℂ) + Complex.I * (OriginData.cImag : ℂ)

def B : ℂ := (OriginData.bReal : ℂ) + Complex.I * (OriginData.bImag : ℂ)

/-- The two polynomial numerators whose phases form the radial pair. -/
def leftNumerator (s : ℝ) : ℂ := P s * ((s : ℂ) + (OriginData.delta : ℂ) * A)

def rightNumerator (s : ℝ) : ℂ :=
  C * conj (P s) * ((s : ℂ) + (OriginData.delta : ℂ) * B)

def f (s : ℝ) : ℂ := ph (leftNumerator s)

def g (s : ℝ) : ℂ := ph (rightNumerator s)

/-- The actual scalar Gaussian responses, with their original chaos grading. -/
def F (z : ℂ) : ℂ := ph z * f (‖z‖ ^ 2)

def G (z : ℂ) : ℂ := ph z * g (‖z‖ ^ 2)

lemma phase_mul (z w : ℂ) : ph (z * w) = ph z * ph w := by
  simp only [ph, norm_mul, Complex.ofReal_mul, div_mul_div_comm]

lemma phase_of_norm_one {z : ℂ} (hz : ‖z‖ = 1) : ph z = z := by
  simp [ph, hz]

lemma phase_conj (z : ℂ) : ph (conj z) = conj (ph z) := by
  simp [ph, map_div₀]

lemma norm_phase {z : ℂ} (hz : z ≠ 0) : ‖ph z‖ = 1 := by
  simp only [ph, norm_div, Complex.norm_real, Real.norm_of_nonneg (norm_nonneg _)]
  exact div_self (norm_ne_zero_iff.mpr hz)

lemma phase_unit_mul {c : ℂ} (hc : ‖c‖ = 1) (z : ℂ) : ph (c * z) = c * ph z := by
  rw [phase_mul, phase_of_norm_one hc]

lemma norm_C : ‖C‖ = 1 := by
  have h : Complex.normSq C = 1 := by
    norm_num [C, OriginData.cReal, OriginData.cImag, Complex.normSq_apply]
  rw [Complex.normSq_eq_norm_sq] at h
  nlinarith [norm_nonneg C]

/-- Agreement with the factored left response in the paper. -/
lemma f_factored (s : ℝ) :
    f s = ph (P s) * ph ((s : ℂ) + (OriginData.delta : ℂ) * A) :=
  phase_mul _ _

/-- Agreement with the factored right response in the paper. -/
lemma g_factored (s : ℝ) :
    g s = C * conj (ph (P s)) * ph ((s : ℂ) + (OriginData.delta : ℂ) * B) := by
  simp only [g, rightNumerator, phase_mul, phase_of_norm_one norm_C, phase_conj]

lemma continuous_P : Continuous P := by unfold P; fun_prop

lemma continuous_leftNumerator : Continuous leftNumerator := by
  unfold leftNumerator
  exact continuous_P.mul (by fun_prop)

lemma continuous_rightNumerator : Continuous rightNumerator := by
  unfold rightNumerator
  exact (continuous_const.mul (Complex.continuous_conj.comp continuous_P)).mul (by fun_prop)

lemma measurable_f : Measurable f := measurable_ph.comp continuous_leftNumerator.measurable

lemma measurable_g : Measurable g := measurable_ph.comp continuous_rightNumerator.measurable

lemma measurable_F : Measurable F :=
  measurable_ph.mul (measurable_f.comp (by fun_prop))

lemma measurable_G : Measurable G :=
  measurable_ph.mul (measurable_g.comp (by fun_prop))

lemma norm_f_le (s : ℝ) : ‖f s‖ ≤ 1 := norm_ph_le _

lemma norm_g_le (s : ℝ) : ‖g s‖ ≤ 1 := norm_ph_le _

lemma norm_F_le (z : ℂ) : ‖F z‖ ≤ 1 := by
  rw [F, norm_mul]
  simpa only [one_mul] using mul_le_mul (norm_ph_le z) (norm_f_le (‖z‖ ^ 2))
    (norm_nonneg _) zero_le_one

lemma norm_G_le (z : ℂ) : ‖G z‖ ≤ 1 := by
  rw [G, norm_mul]
  simpa only [one_mul] using mul_le_mul (norm_ph_le z) (norm_g_le (‖z‖ ^ 2))
    (norm_nonneg _) zero_le_one

lemma F_charge (c z : ℂ) (hc : ‖c‖ = 1) : F (c * z) = c * F z := by
  simp only [F, norm_mul, hc, one_mul, phase_unit_mul hc, mul_assoc]

lemma G_charge (c z : ℂ) (hc : ‖c‖ = 1) : G (c * z) = c * G z := by
  simp only [G, norm_mul, hc, one_mul, phase_unit_mul hc, mul_assoc]

/-- Exact rational identity that produces the endpoint cancellation. -/
lemma rightNumerator_zero : rightNumerator 0 = -Complex.I * leftNumerator 0 := by
  ext <;> norm_num [rightNumerator, leftNumerator, P, A, B, C, ofListQ,
    OriginData.pReal, OriginData.pImag, OriginData.delta, OriginData.aReal,
    OriginData.aImag, OriginData.bReal, OriginData.bImag, OriginData.cReal,
    OriginData.cImag]

lemma leftNumerator_zero_ne : leftNumerator 0 ≠ 0 := by
  intro h
  have := congrArg Complex.re h
  norm_num [leftNumerator, P, A, ofListQ, OriginData.pReal, OriginData.pImag,
    OriginData.delta, OriginData.aReal, OriginData.aImag] at this

lemma g_zero : g 0 = -Complex.I * f 0 := by
  rw [g, rightNumerator_zero, phase_unit_mul (by simp)]
  rfl

lemma norm_f_zero : ‖f 0‖ = 1 := norm_phase leftNumerator_zero_ne

/-- The paper's endpoint convention: the product is exactly `I`. -/
theorem endpoint_cross : f 0 * conj (g 0) = Complex.I := by
  have hu : f 0 * conj (f 0) = 1 := by
    rw [Complex.mul_conj, Complex.normSq_eq_norm_sq, norm_f_zero]
    norm_num
  rw [g_zero, map_mul]
  simp only [map_neg, Complex.conj_I, neg_neg]
  calc
    f 0 * (Complex.I * conj (f 0)) = Complex.I * (f 0 * conj (f 0)) := by ring
    _ = Complex.I := by rw [hu, mul_one]

/-- Lean's conjugate-first convention has the opposite imaginary sign. -/
theorem endpoint_cross_conj_first : conj (f 0) * g 0 = -Complex.I := by
  have h := congrArg (fun z : ℂ => conj z) endpoint_cross
  simpa only [map_mul, Complex.conj_conj, Complex.conj_I] using h

theorem endpoint_cross_re : (conj (f 0) * g 0).re = 0 := by
  rw [endpoint_cross_conj_first]
  simp

end

end Grothe.HJM.Origin
