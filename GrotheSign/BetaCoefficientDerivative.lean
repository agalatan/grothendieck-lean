import GrotheSign.InverseSeries
import Mathlib.Analysis.Calculus.Deriv.Inv
import Mathlib.Analysis.Calculus.Deriv.Add

/-!
# Parameter derivatives of actual inverse coefficients

All differentiation is coefficientwise. Products use finite antidiagonals, and smoothness of the
reciprocal uses its finite coefficient recursion. No topology or convergence of a formal series
is assumed. Lagrange's formula then differentiates the coefficients of the actual radial inverse.

Proof implementation: codex-1a87. Refs #365.
-/

set_option warningAsError true

namespace GrotheSign

open PowerSeries Filter
open scoped Topology

/-- Ordinary real differentiation of each formal coefficient separately. -/
def HasCoeffDerivAt (F : ℝ → ℝ⟦X⟧) (F' : ℝ⟦X⟧) (c : ℝ) : Prop :=
  ∀ n, HasDerivAt (fun x ↦ coeff n (F x)) (coeff n F') c

namespace HasCoeffDerivAt

variable {F G : ℝ → ℝ⟦X⟧} {F' G' : ℝ⟦X⟧} {c : ℝ}

theorem const (A : ℝ⟦X⟧) (c : ℝ) : HasCoeffDerivAt (fun _ ↦ A) 0 c := by
  intro n
  simpa only [map_zero] using hasDerivAt_const c (coeff n A)

theorem congr_deriv (h : HasCoeffDerivAt F F' c) (he : F' = G') :
    HasCoeffDerivAt F G' c := he ▸ h

theorem mul (hF : HasCoeffDerivAt F F' c) (hG : HasCoeffDerivAt G G' c) :
    HasCoeffDerivAt (fun x ↦ F x * G x) (F' * G c + F c * G') c := by
  intro n
  have hd : HasDerivAt
      (fun x ↦ ∑ a ∈ Finset.antidiagonal n, coeff a.1 (F x) * coeff a.2 (G x))
      (∑ a ∈ Finset.antidiagonal n,
        (coeff a.1 F' * coeff a.2 (G c) + coeff a.1 (F c) * coeff a.2 G')) c :=
    HasDerivAt.fun_sum (u := Finset.antidiagonal n) (fun a _ ↦ (hF a.1).mul (hG a.2))
  simpa only [coeff_mul, map_add, Finset.sum_add_distrib] using hd

theorem pow (hF : HasCoeffDerivAt F F' c) (N : ℕ) :
    HasCoeffDerivAt (fun x ↦ F x ^ N) ((N : ℝ⟦X⟧) * (F c ^ (N - 1) * F')) c := by
  induction N with
  | zero => simpa only [pow_zero, Nat.cast_zero, zero_mul] using const (1 : ℝ⟦X⟧) c
  | succ N ih =>
    have hd := ih.mul hF
    have he : (N : ℝ⟦X⟧) * (F c ^ (N - 1) * F') * F c + F c ^ N * F' =
        ((N + 1 : ℕ) : ℝ⟦X⟧) * (F c ^ N * F') := by
      cases N with
      | zero => simp
      | succ N => simp only [Nat.add_sub_cancel, Nat.cast_add, Nat.cast_one, pow_succ]; ring
    simpa only [pow_succ, Nat.add_sub_cancel] using hd.congr_deriv he

/-- Reciprocal coefficients are differentiable by induction through their finite recursion. -/
theorem differentiableAt_coeff_inv (hF : HasCoeffDerivAt F F' c)
    (hunit : constantCoeff (F c) ≠ 0) (n : ℕ) :
    DifferentiableAt ℝ (fun x ↦ coeff n (F x)⁻¹) c := by
  have hzero : DifferentiableAt ℝ (fun x ↦ constantCoeff (F x)) c := by
    simpa only [coeff_zero_eq_constantCoeff_apply] using (hF 0).differentiableAt
  induction n using Nat.strong_induction_on with
  | h n ih =>
    by_cases hn : n = 0
    · subst n
      have hi : DifferentiableAt ℝ (fun x ↦ (constantCoeff (F x))⁻¹) c := hzero.inv hunit
      simpa only [coeff_zero_eq_constantCoeff_apply, constantCoeff_inv] using hi
    · have he : (fun x ↦ coeff n (F x)⁻¹) =
          fun x ↦ -(constantCoeff (F x))⁻¹ *
            ∑ a ∈ Finset.antidiagonal n,
              if a.2 < n then coeff a.1 (F x) * coeff a.2 (F x)⁻¹ else 0 := by
        funext x
        rw [coeff_inv, ite_eq_right hn]
      rw [he]
      refine (hzero.inv hunit).neg.mul (DifferentiableAt.fun_sum ?_)
      intro a _
      by_cases ha : a.2 < n
      · simp only [ite_eq_left ha]
        exact (hF a.1).differentiableAt.mul (ih a.2 ha)
      · simp only [ite_eq_right ha]
        exact differentiableAt_const 0

/-- The reciprocal derivative follows from the locally constant identity `F * F⁻¹ = 1`. -/
theorem inv (hF : HasCoeffDerivAt F F' c) (hunit : constantCoeff (F c) ≠ 0) :
    HasCoeffDerivAt (fun x ↦ (F x)⁻¹) (-(F c)⁻¹ ^ 2 * F') c := by
  let D : ℝ⟦X⟧ := mk (fun n ↦ deriv (fun x ↦ coeff n (F x)⁻¹) c)
  have hD : HasCoeffDerivAt (fun x ↦ (F x)⁻¹) D c := by
    intro n
    simpa only [D, coeff_mk] using (hF.differentiableAt_coeff_inv hunit n).hasDerivAt
  have hzero : ContinuousAt (fun x ↦ constantCoeff (F x)) c := by
    simpa only [coeff_zero_eq_constantCoeff_apply] using (hF 0).continuousAt
  have hu : ∀ᶠ x in 𝓝 c, constantCoeff (F x) ≠ 0 := hzero.eventually_ne hunit
  have hprod : F' * (F c)⁻¹ + F c * D = 0 := by
    ext n
    have hone : HasDerivAt (fun x ↦ coeff n (F x * (F x)⁻¹)) 0 c := by
      apply (hasDerivAt_const c (coeff n (1 : ℝ⟦X⟧))).congr_of_eventuallyEq
      filter_upwards [hu] with x hx
      rw [PowerSeries.mul_inv_cancel (F x) hx]
    simpa only [map_zero] using ((hF.mul hD) n).unique hone
  have hFD : F c * D = -(F' * (F c)⁻¹) := by linear_combination hprod
  have hresult : D = -(F c)⁻¹ ^ 2 * F' := by
    calc
      D = ((F c)⁻¹ * F c) * D := by rw [PowerSeries.inv_mul_cancel (F c) hunit, one_mul]
      _ = (F c)⁻¹ * (F c * D) := by ring
      _ = (F c)⁻¹ * (-(F' * (F c)⁻¹)) := by rw [hFD]
      _ = _ := by ring
  exact hD.congr_deriv hresult

/-- Coefficientwise differentiation of every natural reciprocal power. -/
theorem inv_pow (hF : HasCoeffDerivAt F F' c) (hunit : constantCoeff (F c) ≠ 0) (N : ℕ) :
    HasCoeffDerivAt (fun x ↦ (F x)⁻¹ ^ N)
      (-(N : ℝ⟦X⟧) * ((F c)⁻¹ ^ (N + 1) * F')) c := by
  apply ((hF.inv hunit).pow N).congr_deriv
  cases N with
  | zero => simp
  | succ N => simp only [Nat.add_sub_cancel, pow_succ]; ring

end HasCoeffDerivAt

/-- Scalar form of reciprocal-power differentiation, with the natural factor outside
the coefficient. -/
theorem hasDerivAt_coeff_inv_pow {F : ℝ → ℝ⟦X⟧} {F' : ℝ⟦X⟧} {c : ℝ}
    (hF : HasCoeffDerivAt F F' c) (hunit : constantCoeff (F c) ≠ 0) (N k : ℕ) :
    HasDerivAt (fun x ↦ coeff k ((F x)⁻¹ ^ N))
      (-(N : ℝ) * coeff k ((F c)⁻¹ ^ (N + 1) * F')) c := by
  simpa only [neg_mul, map_neg, coeff_natCast_mul] using (hF.inv_pow hunit N) k

/-- The radial coefficients of the actual odd inverse have the expected parameter derivative. -/
theorem hasDerivAt_coeff_inverseRadial {F : ℝ → ℝ⟦X⟧} {F' : ℝ⟦X⟧} {c : ℝ}
    (hF : HasCoeffDerivAt F F' c) (hunit : constantCoeff (F c) ≠ 0) (k : ℕ) :
    HasDerivAt (fun x ↦ coeff k (inverseRadial (F x)))
      (-coeff k ((F c)⁻¹ ^ (2 * k + 2) * F')) c := by
  have hd := (hasDerivAt_coeff_inv_pow hF hunit (2 * k + 1) k).div_const (2 * (k : ℝ) + 1)
  have he : (-((2 * k + 1 : ℕ) : ℝ) * coeff k ((F c)⁻¹ ^ (2 * k + 1 + 1) * F')) /
      (2 * (k : ℝ) + 1) = -coeff k ((F c)⁻¹ ^ (2 * k + 2) * F') := by
    have hk : 2 * (k : ℝ) + 1 ≠ 0 := by positivity
    push_cast
    rw [show 2 * k + 1 + 1 = 2 * k + 2 by omega]
    field_simp
  simpa only [coeff_inverseRadial] using hd.congr_deriv he

/-- Positive-index coefficients of the actual inverse profile differentiate without a sign loss. -/
theorem hasDerivAt_coeff_inverseProfile {F : ℝ → ℝ⟦X⟧} {F' : ℝ⟦X⟧} {c : ℝ}
    (hF : HasCoeffDerivAt F F' c) (hunit : constantCoeff (F c) ≠ 0) (k : ℕ) (hk : 0 < k) :
    HasDerivAt (fun x ↦ coeff k (inverseProfile (F x)))
      (coeff k ((F c)⁻¹ ^ (2 * k + 2) * F')) c := by
  have hd : HasDerivAt (fun x ↦ -coeff k (inverseRadial (F x)))
      (-(-coeff k ((F c)⁻¹ ^ (2 * k + 2) * F'))) c :=
    (hasDerivAt_coeff_inverseRadial hF hunit k).neg
  simpa only [coeff_inverseProfile_of_pos _ k hk, neg_neg] using hd

end GrotheSign
