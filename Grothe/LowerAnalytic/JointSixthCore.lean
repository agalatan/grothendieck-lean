import Grothe.LowerAnalytic.CircularTensor

/-!
# Tensor and scalar estimates for joint sixth moments

The common proof of J2 and J3: Hilbert–Schmidt and cubic-trace bounds,
completion of squares, the scalar Young estimate, and the conversion from the
sixth cumulant to a normalized circular cubic. The contraction estimates do
not assume positivity of the symmetrized contraction operator.

The Gram-coordinate specialization is in `JointContractions`; the capped and
parameterized refinements are in `JointSixth`.
-/

open MvPolynomial

namespace Grothe.LowerAnalytic

noncomputable section

/-- For `s₀, h₀ ≥ 0` with `x² = (8/3)s₀ + 4h₀`, `x ≥ 0`, `α > 0` and `c₁, c₂, c₃ ≥ 0`:
`c₁ h₀√h₀ + c₂ s₀√h₀ + c₃ h₀√s₀ ≤ x ((5c₂/16) α s₀ + (c₁/2 + 5c₂/(16α) + 5c₃/8) h₀)`. -/
lemma joint_scalar {s0 h0 x al c1 c2 c3 : ℝ} (hs : 0 ≤ s0) (hh : 0 ≤ h0) (hx : 0 ≤ x)
    (hχ : x ^ 2 = 8 / 3 * s0 + 4 * h0) (hal : 0 < al) (h1 : 0 ≤ c1) (h2 : 0 ≤ c2) (h3 : 0 ≤ c3) :
    c1 * (h0 * √h0) + c2 * (s0 * √h0) + c3 * (h0 * √s0)
      ≤ x * (5 * c2 / 16 * al * s0 + (c1 / 2 + 5 * c2 / (16 * al) + 5 * c3 / 8) * h0) := by
  obtain ⟨p, hp0, rfl⟩ : ∃ p, 0 ≤ p ∧ p ^ 2 = s0 := ⟨√s0, Real.sqrt_nonneg _, Real.sq_sqrt hs⟩
  obtain ⟨q, hq0, rfl⟩ : ∃ q, 0 ≤ q ∧ q ^ 2 = h0 := ⟨√h0, Real.sqrt_nonneg _, Real.sq_sqrt hh⟩
  rw [Real.sqrt_sq hp0, Real.sqrt_sq hq0]
  have hq : q ≤ x / 2 := by nlinarith [sq_nonneg p, sq_nonneg (x / 2 - q)]
  have hp : p ≤ 5 * x / 8 := by nlinarith [sq_nonneg q, sq_nonneg (5 * x / 8 - p)]
  have hpq : 2 * (p * q) ≤ al * p ^ 2 + q ^ 2 / al := by
    have e : al * p ^ 2 + q ^ 2 / al - 2 * (p * q) = (al * p - q) ^ 2 / al := by
      field_simp; ring
    have : 0 ≤ (al * p - q) ^ 2 / al := div_nonneg (sq_nonneg _) hal.le
    linarith
  have t1 : c1 * (q ^ 2 * q) ≤ c1 * (q ^ 2 * (x / 2)) :=
    mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left hq (sq_nonneg q)) h1
  have t3 : c3 * (q ^ 2 * p) ≤ c3 * (q ^ 2 * (5 * x / 8)) :=
    mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left hp (sq_nonneg q)) h3
  have t2 : c2 * (p ^ 2 * q) ≤ c2 * (5 * x / 8 * ((al * p ^ 2 + q ^ 2 / al) / 2)) := by
    have e : p ^ 2 * q = p * (p * q) := by ring
    rw [e]
    refine mul_le_mul_of_nonneg_left ?_ h2
    calc p * (p * q) ≤ 5 * x / 8 * (p * q) :=
          mul_le_mul_of_nonneg_right hp (mul_nonneg hp0 hq0)
      _ ≤ 5 * x / 8 * ((al * p ^ 2 + q ^ 2 / al) / 2) :=
          mul_le_mul_of_nonneg_left (by linarith) (by linarith)
  have e : x * (5 * c2 / 16 * al * p ^ 2 + (c1 / 2 + 5 * c2 / (16 * al) + 5 * c3 / 8) * q ^ 2)
      = c1 * (q ^ 2 * (x / 2)) + c2 * (5 * x / 8 * ((al * p ^ 2 + q ^ 2 / al) / 2))
        + c3 * (q ^ 2 * (5 * x / 8)) := by
    field_simp; ring
  rw [e]
  linarith

namespace JointSixth

variable {ι : Type*} [Fintype ι]

/-- Hilbert–Schmidt submultiplicativity for the symmetrized contraction. -/
lemma tenT4_le (f : ι → ι → ι → ℝ) : tenT4 f ≤ tenH f ^ 2 := by
  have h := ip4_comp_le (kerS f) (kerS f)
  simpa only [tenT4, kerS2, comp, ip4, tenH, sq] using h

/-- The cubic trace estimate does not require `kerS f` to be positive. -/
lemma tenT3_le (f : ι → ι → ι → ℝ) (hf : ∀ a b c, f a b c = f b a c) :
    tenT3 f ≤ tenH f * Real.sqrt (tenH f) := by
  have h : tenT3 f ^ 2 ≤ tenT4 f * tenH f := by
    have h := ip4_sq_le (comp (kerS f) (kerS f)) (kerS f)
    simpa only [ip4, comp, tenT3, tenT4, tenH, kerS2, kerS_swap f hf, sq] using h
  have hh := tenH_nonneg f
  have ht := tenT4_le f
  have hr := Real.sq_sqrt hh
  have hp : 0 ≤ tenH f * Real.sqrt (tenH f) := by positivity
  nlinarith [mul_le_mul_of_nonneg_right ht hh,
    sq_nonneg (tenT3 f - tenH f * Real.sqrt (tenH f))]

/-- The quadratic form estimate uses only the Hilbert–Schmidt norm of `S`. -/
lemma tenQ_le (f : ι → ι → ι → ℝ) :
    tenQ f ≤ tenS f * Real.sqrt (tenH f) := by
  have h := ip2_ap4_self_sq_le (kerS f) (kerG f)
  rw [← tenQ_eq_ip2, ← tenS_eq_ip2, ← tenH_eq_ip4] at h
  have hs := tenS_nonneg f
  have hh := Real.sq_sqrt (tenH_nonneg f)
  have hp : 0 ≤ tenS f * Real.sqrt (tenH f) := by positivity
  apply le_of_sq_le_sq' hp
  calc
    tenQ f ^ 2 ≤ tenS f * (tenH f * tenS f) := h
    _ = (tenS f * Real.sqrt (tenH f)) ^ 2 := by rw [mul_pow, hh]; ring

/-- `‖SF‖² ≤ h √s`. -/
lemma tenU2_le (f : ι → ι → ι → ℝ) (hf : ∀ a b c, f a b c = f b a c) :
    tenU2 f ≤ tenH f * Real.sqrt (tenS f) := by
  have h := Grothe.LowerAnalytic.tenU2_le f hf
  have hroot := Real.sqrt_le_sqrt (tenT4_le f)
  rw [Real.sqrt_sq (tenH_nonneg f)] at hroot
  nlinarith [mul_le_mul_of_nonneg_left hroot (Real.sqrt_nonneg (tenS f))]

/-- A finite real matrix has cubic trace at most its Hilbert–Schmidt norm cubed. -/
lemma trace_cube_le {α : Type*} [Fintype α] (A : α → α → ℝ) :
    ∑ a, ∑ b, ∑ c, A a b * A b c * A c a
      ≤ (∑ a, ∑ b, A a b ^ 2) * Real.sqrt (∑ a, ∑ b, A a b ^ 2) := by
  let B a c := ∑ b, A a b * A b c
  let s := ∑ a, ∑ b, A a b ^ 2
  have hs : 0 ≤ s := by dsimp [s]; positivity
  have hB : (∑ a, ∑ c, B a c ^ 2) ≤ s ^ 2 := by
    calc
      _ ≤ ∑ a, ∑ c, (∑ b, A a b ^ 2) * (∑ b, A b c ^ 2) := by
        exact Finset.sum_le_sum fun a _ => Finset.sum_le_sum fun c _ =>
          Finset.sum_mul_sq_le_sq_mul_sq _ _ _
      _ = s ^ 2 := by
        simp only [← Finset.mul_sum, ← Finset.sum_mul]
        rw [Finset.sum_comm (f := fun c b => A b c ^ 2)]
        dsimp [s]; ring
  have hCS := Finset.sum_mul_sq_le_sq_mul_sq (Finset.univ : Finset (α × α))
    (fun p => B p.1 p.2) (fun p => A p.2 p.1)
  simp only [Fintype.sum_prod_type] at hCS
  have htr : (∑ a, ∑ c, B a c * A c a) = ∑ a, ∑ b, ∑ c, A a b * A b c * A c a := by
    simp only [B, Finset.sum_mul]
    exact Finset.sum_congr rfl fun a _ => Finset.sum_comm
  rw [htr, Finset.sum_comm (f := fun a c => A c a ^ 2)] at hCS
  have hr := Real.sq_sqrt hs
  have hp : 0 ≤ s * Real.sqrt s := by positivity
  have hbound := mul_le_mul_of_nonneg_right hB hs
  change _ ≤ s * Real.sqrt s
  change _ ≤ _ * s at hCS
  nlinarith

/-- The Gram cubic trace is nonnegative and at most `s √s`. -/
lemma tenV_le (f : ι → ι → ι → ℝ) :
    tenV f ≤ tenS f * Real.sqrt (tenS f) := trace_cube_le (kerG f)

/-- The negative cubic trace pays for the mixed contraction by completing a square. -/
lemma complete_square (v w d : ℝ) (hv : 0 ≤ v) (hw : 0 ≤ w)
    (hd : d ≤ Real.sqrt v * Real.sqrt w) :
    -20 * v + 165 / 2 * d ≤ 5445 / 64 * w := by
  have hv' := Real.sq_sqrt hv
  have hw' := Real.sq_sqrt hw
  nlinarith [sq_nonneg (Real.sqrt v - 33 / 16 * Real.sqrt w)]

/-- J4 bounded by Hilbert–Schmidt estimates, with its negative term retained (J6). -/
lemma tensor_j6 (f : ι → ι → ι → ℝ) (hf : ∀ a b c, f a b c = f b a c) :
    135 / 2 * tenT3 f - 20 * tenV f + 135 / 2 * tenQ f
      + 165 / 2 * tenDU f + 45 * tenU2 f
    ≤ 135 / 2 * (tenH f * Real.sqrt (tenH f))
      + 135 / 2 * (tenS f * Real.sqrt (tenH f))
      + 8325 / 64 * (tenH f * Real.sqrt (tenS f)) := by
  have hT := tenT3_le f hf
  have hQ := tenQ_le f
  have hU := tenU2_le f hf
  have hsq := complete_square (tenV f) (tenU2 f) (tenDU f)
    (tenV_nonneg f) (tenU2_nonneg f) (tenDU_le f)
  linarith

/-- J4 bounded after dropping its negative term (J5). -/
lemma tensor_j5 (f : ι → ι → ι → ℝ) (hf : ∀ a b c, f a b c = f b a c) :
    135 / 2 * tenT3 f - 20 * tenV f + 135 / 2 * tenQ f
      + 165 / 2 * tenDU f + 45 * tenU2 f
    ≤ 135 / 2 * (tenH f * Real.sqrt (tenH f))
      + 150 * (tenS f * Real.sqrt (tenH f))
      + 45 * (tenH f * Real.sqrt (tenS f)) := by
  have hs := tenS_nonneg f
  have hh := tenH_nonneg f
  have hV := tenV_le f
  have hU := tenU2_le f hf
  have hD := tenDU_le f
  have hDsq : (Real.sqrt (tenV f) * Real.sqrt (tenU2 f)) ^ 2
      ≤ (tenS f * Real.sqrt (tenH f)) ^ 2 := by
    have h := mul_le_mul hV hU (tenU2_nonneg f) (by positivity)
    rw [mul_pow, Real.sq_sqrt (tenV_nonneg f), Real.sq_sqrt (tenU2_nonneg f)]
    calc
      tenV f * tenU2 f ≤ _ := h
      _ = (tenS f * Real.sqrt (tenH f)) ^ 2 := by
        rw [mul_pow, Real.sq_sqrt hh]
        calc
          _ = tenS f * tenH f * (Real.sqrt (tenS f)) ^ 2 := by ring
          _ = _ := by rw [Real.sq_sqrt hs]; ring
  have hD' : tenDU f ≤ tenS f * Real.sqrt (tenH f) := by
    have hp : 0 ≤ tenS f * Real.sqrt (tenH f) := by positivity
    nlinarith [sq_nonneg (Real.sqrt (tenV f) * Real.sqrt (tenU2 f)
      - tenS f * Real.sqrt (tenH f))]
  have hT := tenT3_le f hf
  have hQ := tenQ_le f
  have hV0 := tenV_nonneg f
  linarith

/-- The square root bounds from J1, including the zero case. -/
lemma roots_le {s h x : ℝ} (hs : 0 ≤ s) (hh : 0 ≤ h) (hx : 0 ≤ x)
    (hchi : x ^ 2 = 8 / 3 * s + 4 * h) :
    Real.sqrt s ≤ 5 * x / 8 ∧ Real.sqrt h ≤ x / 2 := by
  constructor
  · have := Real.sq_sqrt hs
    nlinarith [Real.sqrt_nonneg s]
  · have := Real.sq_sqrt hh
    nlinarith [Real.sqrt_nonneg h]

/-- Weighted Young inequality with square roots. -/
lemma young {s h t : ℝ} (hs : 0 ≤ s) (hh : 0 ≤ h) (ht : 0 < t) :
    2 * Real.sqrt s * Real.sqrt h ≤ t * s + h / t := by
  have hsq := sq_nonneg (t * Real.sqrt s - Real.sqrt h)
  have he : t * (t * s + h / t - 2 * Real.sqrt s * Real.sqrt h)
      = (t * Real.sqrt s - Real.sqrt h) ^ 2 := by
    rw [mul_sub, mul_add, mul_div_cancel₀ _ (ne_of_gt ht)]
    rw [sub_sq, mul_pow, Real.sq_sqrt hs, Real.sq_sqrt hh]
    ring
  have := (mul_nonneg_iff_of_pos_left ht).1 (he.symm ▸ hsq)
  linarith

/-- The scalar passage from J5 to J2. -/
lemma j2_of_j5 {s h x m : ℝ} (hs : 0 ≤ s) (hh : 0 ≤ h) (hx : 0 ≤ x)
    (hchi : x ^ 2 = 8 / 3 * s + 4 * h)
    (hm : m ≤ 216 * h * Real.sqrt h + 480 * s * Real.sqrt h
      + 144 * h * Real.sqrt s) {t : ℝ} (ht : 0 < t) :
    m ≤ x * (150 * t * s + (198 + 150 / t) * h) := by
  have hj := joint_scalar hs hh hx hchi ht
    (c1 := 216) (c2 := 480) (c3 := 144) (by norm_num) (by norm_num) (by norm_num)
  apply hm.trans
  convert hj using 1 <;> (field_simp; ring)

/-- The scalar passage from J6 to J3. -/
lemma j3_of_j6 {s h x m : ℝ} (hs : 0 ≤ s) (hh : 0 ≤ h) (hx : 0 ≤ x)
    (hchi : x ^ 2 = 8 / 3 * s + 4 * h)
    (hm : m ≤ 216 * h * Real.sqrt h + 216 * s * Real.sqrt h
      + 1665 / 4 * h * Real.sqrt s) {t : ℝ} (ht : 0 < t) :
    m ≤ x * (135 * t / 2 * s + (11781 / 32 + 135 / (2 * t)) * h) := by
  have hj := joint_scalar hs hh hx hchi ht
    (c1 := 216) (c2 := 216) (c3 := 1665 / 4) (by norm_num) (by norm_num) (by norm_num)
  apply hm.trans
  convert hj using 1 <;> (field_simp; ring)

/-- Fourth cumulant in the real-kernel normalization. -/
lemma circular_j1 [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
    (hE : IsGaussianExpectation E) {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (ha : Chaos3 a) (hc : Circular J a b) (haa : E (a * a) = 1 / 2) :
    E (radU a b ^ 2) - 2 = 8 / 3 * (1296 * tenS (cubicKernel a))
      + 4 * (1296 * tenH (cubicKernel a)) := by
  have h4 := ha.wick4 hE
  have hr := hc.gE_pow_four hE
  have h2 : E (a ^ 2) = 1 / 2 := by rw [sq]; exact haa
  rw [hr, h2] at h4
  linarith

/-- Sixth cumulant in terms of the radial sixth moment, without standardizing `a`. -/
lemma circular_wick6 [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
    (hE : IsGaussianExpectation E) {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (ha : Chaos3 a) (hc : Circular J a b) (haa : E (a * a) = 1 / 2) :
    E (radU a b ^ 3) - 6 - 9 * (E (radU a b ^ 2) - 2)
      = (16 / 5 * 46656) *
        (135 / 2 * tenT3 (cubicKernel a) - 20 * tenV (cubicKernel a)
          + 135 / 2 * tenQ (cubicKernel a) + 165 / 2 * tenDU (cubicKernel a)
          + 45 * tenU2 (cubicKernel a)) := by
  have h6 := ha.wick6 hE
  have h4 := hc.gE_pow_four hE
  have hr := hc.gE_pow_six hE
  have h2 : E (a ^ 2) = 1 / 2 := by rw [sq]; exact haa
  rw [hr, h4, h2] at h6
  linarith

/-- The normalization of a square root of a fourth-order contraction. -/
lemma sqrt_1296 (s : ℝ) : Real.sqrt (1296 * s) = 36 * Real.sqrt s := by
  rw [Real.sqrt_mul (by norm_num), show (1296 : ℝ) = 36 ^ 2 by norm_num,
    Real.sqrt_sq (by norm_num)]

/-- J5 for the kernel of a normalized circular cubic. -/
theorem circular_j5 [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
    (hE : IsGaussianExpectation E) {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (ha : Chaos3 a) (hc : Circular J a b) (haa : E (a * a) = 1 / 2) :
    E (radU a b ^ 3) - 6 - 9 * (E (radU a b ^ 2) - 2)
      ≤ 216 * (1296 * tenH (cubicKernel a)) * Real.sqrt (1296 * tenH (cubicKernel a))
        + 480 * (1296 * tenS (cubicKernel a)) * Real.sqrt (1296 * tenH (cubicKernel a))
        + 144 * (1296 * tenH (cubicKernel a)) * Real.sqrt (1296 * tenS (cubicKernel a)) := by
  rw [circular_wick6 hE ha hc haa, sqrt_1296, sqrt_1296]
  have h := tensor_j5 (cubicKernel a) (cubicKernel_symm12 a)
  linarith

/-- J6 for the kernel of a normalized circular cubic. -/
theorem circular_j6 [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
    (hE : IsGaussianExpectation E) {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (ha : Chaos3 a) (hc : Circular J a b) (haa : E (a * a) = 1 / 2) :
    E (radU a b ^ 3) - 6 - 9 * (E (radU a b ^ 2) - 2)
      ≤ 216 * (1296 * tenH (cubicKernel a)) * Real.sqrt (1296 * tenH (cubicKernel a))
        + 216 * (1296 * tenS (cubicKernel a)) * Real.sqrt (1296 * tenH (cubicKernel a))
        + 1665 / 4 * (1296 * tenH (cubicKernel a)) * Real.sqrt (1296 * tenS (cubicKernel a)) := by
  rw [circular_wick6 hE ha hc haa, sqrt_1296, sqrt_1296]
  have h := tensor_j6 (cubicKernel a) (cubicKernel_symm12 a)
  linarith

/-- J2, with the exact real-tensor interface and no additional tensor hypotheses. -/
theorem circular_j2 [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
    (hE : IsGaussianExpectation E) {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (ha : Chaos3 a) (hc : Circular J a b) (haa : E (a * a) = 1 / 2)
    {t : ℝ} (ht : 0 < t) :
    E (radU a b ^ 3) ≤ 6 + 9 * (E (radU a b ^ 2) - 2)
      + Real.sqrt (E (radU a b ^ 2) - 2) *
        (150 * t * (1296 * tenS (cubicKernel a))
          + (198 + 150 / t) * (1296 * tenH (cubicKernel a))) := by
  have h1 := circular_j1 hE ha hc haa
  have hs : 0 ≤ 1296 * tenS (cubicKernel a) := by have := tenS_nonneg (cubicKernel a); positivity
  have hh : 0 ≤ 1296 * tenH (cubicKernel a) := by
    have := tenH_nonneg (cubicKernel a); positivity
  have hchi : 0 ≤ E (radU a b ^ 2) - 2 := by rw [h1]; positivity
  have h := j2_of_j5 hs hh (Real.sqrt_nonneg _) ((Real.sq_sqrt hchi).trans h1)
    (circular_j5 hE ha hc haa) ht
  linarith

/-- J3, with the exact real-tensor interface and no additional tensor hypotheses. -/
theorem circular_j3 [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
    (hE : IsGaussianExpectation E) {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (ha : Chaos3 a) (hc : Circular J a b) (haa : E (a * a) = 1 / 2)
    {t : ℝ} (ht : 0 < t) :
    E (radU a b ^ 3) ≤ 6 + 9 * (E (radU a b ^ 2) - 2)
      + Real.sqrt (E (radU a b ^ 2) - 2) *
        (135 * t / 2 * (1296 * tenS (cubicKernel a))
          + (11781 / 32 + 135 / (2 * t)) * (1296 * tenH (cubicKernel a))) := by
  have h1 := circular_j1 hE ha hc haa
  have hs : 0 ≤ 1296 * tenS (cubicKernel a) := by have := tenS_nonneg (cubicKernel a); positivity
  have hh : 0 ≤ 1296 * tenH (cubicKernel a) := by
    have := tenH_nonneg (cubicKernel a); positivity
  have hchi : 0 ≤ E (radU a b ^ 2) - 2 := by rw [h1]; positivity
  have h := j3_of_j6 hs hh (Real.sqrt_nonneg _) ((Real.sq_sqrt hchi).trans h1)
    (circular_j6 hE ha hc haa) ht
  linarith

end JointSixth

end

end Grothe.LowerAnalytic
