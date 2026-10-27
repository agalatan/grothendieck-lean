import Mathlib.Analysis.Complex.Basic

/-!
# Finite radius-angle polynomial certificates

The radius and angular variable must remain independent polynomial variables
until their algebraic cancellations are complete. These lemmas justify a
carry-free coefficient encoding and a centered, finite Taylor-jet bound on
complex patches. They make no claim about a numerical Gaussian integral.
-/

namespace Grothe.Upper.RadiusJet

open Finset

/-- Encode the radius exponent first and the angular exponent second. -/
def pack (stride radius angle : ℕ) : ℕ := radius*stride+angle

/-- Decoding is exact while the angular exponent is below the stride. -/
theorem unpack (stride radius angle : ℕ) (h : angle < stride) :
    pack stride radius angle / stride = radius ∧
      pack stride radius angle % stride = angle := by
  have hs : 0 < stride := Nat.zero_lt_of_lt h
  constructor
  · unfold pack
    rw [Nat.add_comm, Nat.add_mul_div_right _ _ hs, Nat.div_eq_of_lt h, Nat.zero_add]
  · unfold pack
    rw [Nat.mul_add_mod_self_right, Nat.mod_eq_of_lt h]

/-- Thus a packed coefficient has a unique pair of exponents. -/
theorem pack_injective (stride a b c d : ℕ) (hb : b < stride) (hd : d < stride)
    (h : pack stride a b = pack stride c d) : a = c ∧ b = d := by
  have hq := congrArg (fun n => n/stride) h
  have hr := congrArg (fun n => n%stride) h
  rw [(unpack stride a b hb).1, (unpack stride c d hd).1] at hq
  rw [(unpack stride a b hb).2, (unpack stride c d hd).2] at hr
  exact ⟨hq, hr⟩

/-- Ordinary polynomial convolution implements the bivariate exponent sum.
Decoding the result additionally requires that the angular sum not carry. -/
theorem pack_product (stride a b c d : ℕ) :
    pack stride a b+pack stride c d = pack stride (a+c) (b+d) := by
  simp only [pack, Nat.add_mul]
  ac_rfl

/-- Exact radius translation, before any interval is substituted. Applying
this identity termwise gives the finite radius jet used by the evaluator. -/
theorem translate_monomial (r₀ h : ℂ) (n : ℕ) :
    (r₀+h)^n = ∑ i ∈ range (n+1), (n.choose i : ℂ)*r₀^(n-i)*h^i := by
  rw [add_comm r₀ h, add_pow]
  apply sum_congr rfl
  intro i _
  ac_rfl

/-- A finite centered jet bounds its entire complex patch. Both radii are
explicit and no value at the patch center is substituted for an interval. -/
theorem patch_bound (I J : Finset ℕ) (a : ℕ → ℕ → ℂ)
    (r r₀ x x₀ : ℂ) (R X : ℝ) (hR : 0 ≤ R)
    (hr : ‖r-r₀‖ ≤ R) (hx : ‖x-x₀‖ ≤ X) :
    ‖∑ i ∈ I, ∑ j ∈ J, a i j*(r-r₀)^i*(x-x₀)^j‖ ≤
      ∑ i ∈ I, ∑ j ∈ J, ‖a i j‖*R^i*X^j := by
  refine (norm_sum_le _ _).trans (sum_le_sum fun i _ => ?_)
  refine (norm_sum_le _ _).trans (sum_le_sum fun j _ => ?_)
  rw [norm_mul, norm_mul, norm_pow, norm_pow]
  have hi := pow_le_pow_left₀ (norm_nonneg (r-r₀)) hr i
  have hj := pow_le_pow_left₀ (norm_nonneg (x-x₀)) hx j
  exact mul_le_mul (mul_le_mul_of_nonneg_left hi (norm_nonneg _)) hj
    (pow_nonneg (norm_nonneg _) _) (mul_nonneg (norm_nonneg _) (pow_nonneg hR _))

end Grothe.Upper.RadiusJet
