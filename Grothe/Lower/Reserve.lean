import Grothe.Lower.Gram

/-!
# Reserved contraction-Gram budgets

A node must pay for all constraints using the same tensor. `Reserve` records an arbitrary
signed linear functional of the five contraction invariants. `reserveCert` subtracts it from
the five coefficient remainders before accepting the existing PSD proof. Soundness retains
this functional on the left side of the law budget. No componentwise sign condition on the
reserve is imposed: useful nonnegative tensor functionals can have negative coefficients.
-/

namespace Grothe.Lower

/-- A rational linear functional on the contraction invariants `(n,h,b,y,z)`. -/
structure Reserve where
  n : ℚ
  h : ℚ
  b : ℚ
  y : ℚ
  z : ℚ

/-- Evaluate the reserve on a tensor's five real invariants. -/
def Reserve.value (r : Reserve) (n h b y z : ℝ) : ℝ :=
  r.n * n + r.h * h + r.b * b + r.y * y + r.z * z

/-- The same two PSD multipliers, with a reserve deducted from every remainder. -/
def reserveCert (lam mu : ℚ) (g : GramData) (r : Reserve) : Bool := decide (
  0 ≤ lam ∧ 0 ≤ mu ∧
  0 ≤ g.m00 ∧ 0 ≤ g.m11 ∧ g.m01 ^ 2 ≤ g.m00 * g.m11 ∧
  0 ≤ g.k00 ∧ 0 ≤ g.k11 ∧ g.k01 ^ 2 ≤ g.k00 * g.k11 ∧
  0 ≤ g.ga ∧ 0 ≤ g.gb ∧
  r.n ≤ g.en lam ∧ r.h ≤ g.eh lam ∧ r.b ≤ g.eb lam mu ∧
  r.y ≤ g.ey lam mu ∧ r.z ≤ g.ez lam)

/-- **Soundness with a signed reserve.** The same Gram proof pays both for the Stein
fluctuations and the additional linear functional. This prevents counting two incompatible
savings separately. -/
theorem reserved_gram_budget (lam mu : ℚ) (g : GramData) (r : Reserve)
    (hg : reserveCert lam mu g r = true)
    (n h b y z P Q X2 C2 : ℝ) (hn : 0 ≤ n) (hh : 0 ≤ h) (hb : 0 ≤ b) (hy : 0 ≤ y) (hz : 0 ≤ z)
    (hbn : b ≤ n) (hyz : y ≤ z) (hG0 : z ^ 2 ≤ n * h) (hG1a : 0 ≤ n + b + (3 * y - z))
    (hG1b : (3 * y - z) ^ 2 ≤ h * (n + b + (3 * y - z)))
    (hP : P = 16 * n + 4 * h + 16 / 3 * b + 32 * y) (hQ : Q = 64 / 3 * b + 32 * y)
    (hX : X2 = (80 * n + 20 * h + 16 * b + 96 * y + 32 * z) / 9)
    (hC : C2 = (128 * b + 96 * y) / 9) :
    (lam : ℝ) * X2 + mu * C2 + r.value n h b y z ≤ g.A * P + g.B * Q := by
  simp only [reserveCert, decide_eq_true_eq] at hg
  obtain ⟨-, -, h00, h11, h01, k00, k11, k01, hga, hgb, en, eh, eb, ey, ez⟩ := hg
  have t0 := psd_pair (p := (g.m00 : ℝ)) (q := (g.m01 : ℝ)) (r := (g.m11 : ℝ)) (a := n) (c := h)
    (s := z) (by exact_mod_cast h00) (by exact_mod_cast h11) (by exact_mod_cast h01) hn hh hG0
  have t1 := psd_pair (p := (g.k00 : ℝ)) (q := (g.k01 : ℝ)) (r := (g.k11 : ℝ)) (a := h)
    (c := (n + b + (3 * y - z)) / 4) (s := (3 * y - z) / 2) (by exact_mod_cast k00)
    (by exact_mod_cast k11) (by exact_mod_cast k01) hh (by linarith) (by nlinarith)
  have en' : (0 : ℝ) ≤ ((g.en lam - r.n : ℚ) : ℝ) := by exact_mod_cast sub_nonneg.2 en
  have eh' : (0 : ℝ) ≤ ((g.eh lam - r.h : ℚ) : ℝ) := by exact_mod_cast sub_nonneg.2 eh
  have eb' : (0 : ℝ) ≤ ((g.eb lam mu - r.b : ℚ) : ℝ) := by exact_mod_cast sub_nonneg.2 eb
  have ey' : (0 : ℝ) ≤ ((g.ey lam mu - r.y : ℚ) : ℝ) := by exact_mod_cast sub_nonneg.2 ey
  have ez' : (0 : ℝ) ≤ ((g.ez lam - r.z : ℚ) : ℝ) := by exact_mod_cast sub_nonneg.2 ez
  simp only [GramData.en, GramData.eh, GramData.eb, GramData.ey, GramData.ez] at en' eh' eb' ey' ez'
  push_cast at en' eh' eb' ey' ez'
  have hga' : (0 : ℝ) ≤ g.ga := by exact_mod_cast hga
  have hgb' : (0 : ℝ) ≤ g.gb := by exact_mod_cast hgb
  rw [hP, hQ, hX, hC, Reserve.value]
  nlinarith [mul_nonneg en' hn, mul_nonneg eh' hh, mul_nonneg eb' hb, mul_nonneg ey' hy,
    mul_nonneg ez' hz, mul_nonneg hga' (sub_nonneg.2 hbn), mul_nonneg hgb' (sub_nonneg.2 hyz)]

/-- A reserve of zero is exactly the existing checker, not a stronger assumption. -/
theorem zero_reserve (lam mu : ℚ) (g : GramData) :
    reserveCert lam mu g ⟨0, 0, 0, 0, 0⟩ = true ↔ gramCert lam mu g = true := by
  simp [reserveCert, gramCert, psd2, and_assoc]

/-- Reserve `weight * xmax * (A s₀ + B h₀)` in the certificate's five coordinates. The
negative coefficient of `z` is retained. -/
def Reserve.joint (weight xmax A B : ℚ) : Reserve :=
  ⟨weight * xmax * (8 * A + 8 / 3 * B),
   weight * xmax * (2 * A + 2 / 3 * B),
   weight * xmax * (8 * A + 8 / 3 * B),
   weight * xmax * (24 * B),
   weight * xmax * (8 * A - 16 / 3 * B)⟩

theorem joint_reserve_value (weight xmax A B : ℚ) (n h b y z : ℝ) :
    (Reserve.joint weight xmax A B).value n h b y z =
      (weight : ℝ) * xmax * ((A : ℝ) * (8 * n + 2 * h + 8 * b + 8 * z)
        + (B : ℝ) * (8 / 3 * n + 2 / 3 * h + 8 / 3 * b + 24 * y - 16 / 3 * z)) := by
  simp only [Reserve.joint, Reserve.value]
  push_cast
  ring

/-- Extend a joint moment estimate only to a checked upper endpoint of its kurtosis range. -/
theorem joint_moment_range {m2 m3 x xmax J : ℝ} (hx : x ≤ xmax) (hJ : 0 ≤ J)
    (hm : m3 ≤ 6 + 9 * (m2 - 2) + x * J) :
    m3 ≤ 6 + 9 * (m2 - 2) + xmax * J := by
  nlinarith [mul_le_mul_of_nonneg_right hx hJ]

/-- The moment slack cancels exactly the reserved budget in the corrected radial cut.
`budget` is the old cut expectation after its two nonnegative completion squares. -/
theorem reserved_moment_cut {m2 m3 xmax J weight budget : ℝ} (hw : 0 ≤ weight)
    (hm : m3 ≤ 6 + 9 * (m2 - 2) + xmax * J)
    (hb : weight * xmax * J ≤ budget) :
    0 ≤ budget + weight * (-m3 + 9 * m2 - 12) := by
  nlinarith [mul_nonneg hw (show 0 ≤ 6 + 9 * (m2 - 2) + xmax * J - m3 by linarith)]

end Grothe.Lower
