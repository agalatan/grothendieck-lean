import Grothe.LowerAnalytic.GramSpectral

/-!
# Joint sixth-moment bounds

The real-kernel interface uses `f = cubicKernel a`, with `E a² = 1/2`.
The normalized fourth-order invariants are `s₀ = 1296 tenS f` and
`h₀ = 1296 tenH f`: standardizing `a` by `√2` multiplies both by four.
All tensor estimates below hold without positivity of the operator `kerS f`.
-/

open MvPolynomial

namespace Grothe.LowerAnalytic.JointSixth

noncomputable section

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
  obtain ⟨hrs, hrh⟩ := roots_le hs hh hx hchi
  have h1 := mul_le_mul_of_nonneg_left hrh (show 0 ≤ h by exact hh)
  have h2 := mul_le_mul_of_nonneg_left hrs hh
  have h3 := mul_le_mul_of_nonneg_right hrs
    (show 0 ≤ Real.sqrt s * Real.sqrt h by positivity)
  have h4 := mul_le_mul_of_nonneg_left (young hs hh ht) hx
  have hr := Real.sq_sqrt hs
  have he : s * Real.sqrt h = Real.sqrt s * (Real.sqrt s * Real.sqrt h) := by
    rw [← mul_assoc, ← sq, hr]
  rw [← he] at h3
  have h5 : m ≤ 198 * x * h + 300 * x * (Real.sqrt s * Real.sqrt h) := by
    nlinarith
  have he' : x * (150 * t * s + (198 + 150 / t) * h)
      = 198 * x * h + 150 * x * (t * s + h / t) := by ring
  rw [he']
  nlinarith

/-- The scalar passage from J6 to J3. -/
lemma j3_of_j6 {s h x m : ℝ} (hs : 0 ≤ s) (hh : 0 ≤ h) (hx : 0 ≤ x)
    (hchi : x ^ 2 = 8 / 3 * s + 4 * h)
    (hm : m ≤ 216 * h * Real.sqrt h + 216 * s * Real.sqrt h
      + 1665 / 4 * h * Real.sqrt s) {t : ℝ} (ht : 0 < t) :
    m ≤ x * (135 * t / 2 * s + (11781 / 32 + 135 / (2 * t)) * h) := by
  obtain ⟨hrs, hrh⟩ := roots_le hs hh hx hchi
  have h1 := mul_le_mul_of_nonneg_left hrh hh
  have h2 := mul_le_mul_of_nonneg_left hrs hh
  have h3 := mul_le_mul_of_nonneg_right hrs
    (show 0 ≤ Real.sqrt s * Real.sqrt h by positivity)
  have h4 := mul_le_mul_of_nonneg_left (young hs hh ht) hx
  have he : s * Real.sqrt h = Real.sqrt s * (Real.sqrt s * Real.sqrt h) := by
    rw [← mul_assoc, ← sq, Real.sq_sqrt hs]
  rw [← he] at h3
  have h5 : m ≤ 11781 / 32 * x * h + 135 * x * (Real.sqrt s * Real.sqrt h) := by
    nlinarith
  have he' : x * (135 * t / 2 * s + (11781 / 32 + 135 / (2 * t)) * h)
      = 11781 / 32 * x * h + 135 / 2 * x * (t * s + h / t) := by ring
  rw [he']
  nlinarith

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

/-- `‖Sym(τ ⋆ τ)‖²` as two real squared norms. -/
lemma hip_sym_tau (f g : ι → ι → ι → ℝ) :
    (hip (csym4 (ccon (tauC f g) (tauC f g)))
      (csym4 (ccon (tauC f g) (tauC f g)))).re
    = ip4 (kerS f - kerS g) (kerS f - kerS g)
      + ip4 (sym4 (con g f + con f g)) (sym4 (con g f + con f g)) := by
  have hre : ∀ a b c d,
      (csym4 (ccon (tauC f g) (tauC f g)) a b c d).re
        = (kerS f - kerS g) a b c d := by
    intro a b c d
    simp only [csym4_re, ccon_tauC_re]
    change sym4 (con f f - con g g) a b c d = _
    rw [sym4_sub]; rfl
  have him : ∀ a b c d,
      (csym4 (ccon (tauC f g) (tauC f g)) a b c d).im
        = sym4 (con g f + con f g) a b c d := by
    intro a b c d
    simp only [csym4_im, ccon_tauC_im]
    change sym4 (con f g + con g f) a b c d = _
    rw [add_comm]
  simp only [hip, Complex.re_sum, Complex.mul_re, Complex.conj_re, Complex.conj_im, mul_neg, sub_neg_eq_add, hre, him, ip4,
    ← Finset.sum_add_distrib]

/-- The Gram certificate's `h₀`, with all four normalization factors explicit. -/
theorem gram_h0 [DecidableEq ι] {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (hc : Circular J a b) :
    1296 * tenH (cubicKernel a)
      = (8 / 3 * gramN (gramT J a b) + 2 / 3 * gramH (gramT J a b)
          + 8 / 3 * gramB (gramT J a b) + 24 * gramY (gramT J a b)
          - 16 / 3 * gramZ (gramT J a b)) := by
  have hsum := sum_kerS_sq hc.isCplx (cubicKernel a) (cubicKernel b)
    hc.tauC_eq (gramT_symm12 J a b) (cubicKernel_symm12 a) (cubicKernel_symm12 b)
  have hv := hipV_V hc.isCplx (cubicKernel a) (cubicKernel b)
    hc.tauC_eq (gramT_symm12 J a b)
  rw [hip_sym_tau] at hv
  have hgg := ip4_Sg_Sg hc.isCplx hc.der3_left hc.der3_right
  have hfg := ip4_S_Sg hc.isCplx hc.der3_left hc.der3_right
  rw [← kerS_eq_sym4, ← kerS_eq_sym4] at hgg hfg
  have hsum' : ip4 (kerS (cubicKernel a) + kerS (cubicKernel b))
      (kerS (cubicKernel a) + kerS (cubicKernel b))
      = (gramH (gramT J a b) + 4 * gramN (gramT J a b)
        + 4 * gramB (gramT J a b) + 16 * gramT0 (gramT J a b)) / 486 := by
    simpa only [ip4, Pi.add_apply, ← sq, gramT] using hsum
  have hsym := gramY_eq (gramT_symm12 J a b)
  simp only [ip4_add_left, ip4_add_right, ip4_sub_left, ip4_sub_right,
    ip4_comm (kerS (cubicKernel b)) (kerS (cubicKernel a)), hgg, hfg] at hsum' hv
  rw [tenH_eq_ip4]
  change _ = _ at hsym
  change _ = 4 / 81 * gramY (gramT J a b) at hv
  linarith

/-- The Gram certificate's J1, from the already proved chaos-energy identity. -/
lemma gram_chi [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
    (hE : IsGaussianExpectation E) {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (ha : Chaos3 a) (hc : Circular J a b) (haa : E (a * a) = 1 / 2) :
    E (radU a b ^ 2) - 2
      = 32 * gramN (gramT J a b) + 8 * gramH (gramT J a b)
        + 32 * gramB (gramT J a b) + 96 * gramY (gramT J a b) := by
  have hb := hc.chaos3_right ha
  have hbb : E (b * b) = 1 / 2 := by rw [← hc.gE_sq_eq hE, haa]
  have h := quartic_identity hE ha hb haa hbb (hc.gE_mul hE)
  change 3 * (E (radU a b * radU a b) - 2 * (1 : ℝ) ^ 2)
    = 4 * specU2 E a b + 2 * specV2 E a b + 2 * specU4 E a b + specV4 E a b at h
  rw [hc.specU2_eq hE ha haa, hc.specV2_eq hE ha haa,
    hc.specU4_eq hE ha haa, hc.specV4_eq hE ha haa, ← sq] at h
  linarith

/-- The Gram certificate's `s₀` in the normalization of `cubicKernel a`. -/
theorem gram_s0 [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
    (hE : IsGaussianExpectation E) {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (ha : Chaos3 a) (hc : Circular J a b) (haa : E (a * a) = 1 / 2) :
    1296 * tenS (cubicKernel a)
      = 8 * gramN (gramT J a b) + 2 * gramH (gramT J a b)
        + 8 * gramB (gramT J a b) + 8 * gramZ (gramT J a b) := by
  have h := circular_j1 hE ha hc haa
  rw [gram_h0 hc, gram_chi hE ha hc haa] at h
  linarith

/-- The certificate's first joint invariant, in coordinate order `(n,h,b,y,z)`. -/
def s0 (t : ι → ι → ι → ℂ) : ℝ :=
  8 * gramN t + 2 * gramH t + 8 * gramB t + 8 * gramZ t

/-- The certificate's second joint invariant: `(s₀ + 48T)/3`, `T = (3y-z)/2`. -/
def h0 (t : ι → ι → ι → ℂ) : ℝ := (s0 t + 24 * (3 * gramY t - gramZ t)) / 3

lemma h0_eq (t : ι → ι → ι → ℂ) :
    h0 t = 8 / 3 * gramN t + 2 / 3 * gramH t + 8 / 3 * gramB t
      + 24 * gramY t - 16 / 3 * gramZ t := by unfold h0 s0; ring

/-- Linear coefficients for a reserve against the same five contraction invariants. -/
lemma weighted_invariants (t : ι → ι → ι → ℂ) (p q : ℝ) :
    p * s0 t + q * h0 t
      = (8 * p + 8 / 3 * q) * gramN t + (2 * p + 2 / 3 * q) * gramH t
        + (8 * p + 8 / 3 * q) * gramB t + (24 * q) * gramY t
        + (8 * p - 16 / 3 * q) * gramZ t := by unfold h0 s0; ring

/-- Normalization bridge for `s₀` of a genuine circular cubic. -/
theorem s0_eq_tensor [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
    (hE : IsGaussianExpectation E) {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (ha : Chaos3 a) (hc : Circular J a b) (haa : E (a * a) = 1 / 2) :
    s0 (gramT J a b) = 1296 * tenS (cubicKernel a) := (gram_s0 hE ha hc haa).symm

/-- Normalization bridge for `h₀` of a genuine circular cubic. -/
theorem h0_eq_tensor [DecidableEq ι] {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (hc : Circular J a b) :
    h0 (gramT J a b) = 1296 * tenH (cubicKernel a) := by
  rw [h0_eq]; exact (gram_h0 hc).symm

/-- J1 and positivity, at exactly the interface consumed by the Gram certificate. -/
theorem gram_j1 [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
    (hE : IsGaussianExpectation E) {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (ha : Chaos3 a) (hc : Circular J a b) (haa : E (a * a) = 1 / 2) :
    0 ≤ s0 (gramT J a b) ∧ 0 ≤ h0 (gramT J a b) ∧
      E (radU a b ^ 2) - 2 = 8 / 3 * s0 (gramT J a b) + 4 * h0 (gramT J a b) := by
  rw [s0_eq_tensor hE ha hc haa, h0_eq_tensor hc]
  exact ⟨mul_nonneg (by norm_num) (tenS_nonneg _),
    mul_nonneg (by norm_num) (tenH_nonneg _), circular_j1 hE ha hc haa⟩

/-- J2 for the certificate's five contractions, for every positive Young parameter. -/
theorem gram_j2 [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
    (hE : IsGaussianExpectation E) {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (ha : Chaos3 a) (hc : Circular J a b) (haa : E (a * a) = 1 / 2)
    {t : ℝ} (ht : 0 < t) :
    E (radU a b ^ 3) ≤ 6 + 9 * (E (radU a b ^ 2) - 2)
      + Real.sqrt (E (radU a b ^ 2) - 2) *
        (150 * t * s0 (gramT J a b) + (198 + 150 / t) * h0 (gramT J a b)) := by
  rw [s0_eq_tensor hE ha hc haa, h0_eq_tensor hc]
  exact circular_j2 hE ha hc haa ht

/-- J3 for the certificate's five contractions, for every positive Young parameter. -/
theorem gram_j3 [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
    (hE : IsGaussianExpectation E) {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (ha : Chaos3 a) (hc : Circular J a b) (haa : E (a * a) = 1 / 2)
    {t : ℝ} (ht : 0 < t) :
    E (radU a b ^ 3) ≤ 6 + 9 * (E (radU a b ^ 2) - 2)
      + Real.sqrt (E (radU a b ^ 2) - 2) *
        (135 * t / 2 * s0 (gramT J a b)
          + (11781 / 32 + 135 / (2 * t)) * h0 (gramT J a b)) := by
  rw [s0_eq_tensor hE ha hc haa, h0_eq_tensor hc]
  exact circular_j3 hE ha hc haa ht

end

end Grothe.LowerAnalytic.JointSixth

namespace Grothe.LowerAnalytic.JointSixth

noncomputable section

variable {ι : Type*} [Fintype ι]

/-- Retaining both caps places the maximum at `v = A` when `256 A ≤ 1089 B`.
The proof uses no division and includes `A = 0` and `B = 0`. -/
lemma capped_complete_square {v w d A B : ℝ} (hv : 0 ≤ v) (hvA : v ≤ A)
    (hw : 0 ≤ w) (hwB : w ≤ B) (hd : d ≤ Real.sqrt v * Real.sqrt w)
    (hratio : 256 * A ≤ 1089 * B) :
    -20 * v + 165 / 2 * d ≤ -20 * A + 165 / 2 * (Real.sqrt A * Real.sqrt B) := by
  have hA : 0 ≤ A := hv.trans hvA
  have hB : 0 ≤ B := hw.trans hwB
  have hrv := Real.sqrt_le_sqrt hvA
  have hrw := Real.sqrt_le_sqrt hwB
  have hthreshold : 40 * Real.sqrt A ≤ 165 / 2 * Real.sqrt B := by
    apply le_of_sq_le_sq' (by positivity)
    nlinarith [Real.sq_sqrt hA, Real.sq_sqrt hB]
  have hd' : d ≤ Real.sqrt v * Real.sqrt B :=
    hd.trans (mul_le_mul_of_nonneg_left hrw (Real.sqrt_nonneg v))
  have hfactor : 0 ≤ 165 / 2 * Real.sqrt B - 20 * (Real.sqrt A + Real.sqrt v) := by
    linarith
  have hprod := mul_nonneg (sub_nonneg.mpr hrv) hfactor
  nlinarith [Real.sq_sqrt hv, Real.sq_sqrt hA]

/-- The two contraction caps have product of square roots exactly `s √h`. -/
lemma sqrt_caps_mul {s h : ℝ} (hs : 0 ≤ s) :
    Real.sqrt (s * Real.sqrt s) * Real.sqrt (h * Real.sqrt s) = s * Real.sqrt h := by
  rw [← Real.sqrt_mul (mul_nonneg hs (Real.sqrt_nonneg s))]
  have he : (s * Real.sqrt s) * (h * Real.sqrt s) = s ^ 2 * h := by
    calc
      _ = s * h * (Real.sqrt s) ^ 2 := by ring
      _ = _ := by rw [Real.sq_sqrt hs]; ring
  rw [he, Real.sqrt_mul (sq_nonneg s), Real.sqrt_sq hs]

/-- Regional strengthening of J5, retaining `V ≤ s √s` and `W ≤ h √s` together. -/
theorem tensor_j5_capped (f : ι → ι → ι → ℝ)
    (hf : ∀ a b c, f a b c = f b a c) (hratio : 256 * tenS f ≤ 1089 * tenH f) :
    135 / 2 * tenT3 f - 20 * tenV f + 135 / 2 * tenQ f
      + 165 / 2 * tenDU f + 45 * tenU2 f
    ≤ 135 / 2 * (tenH f * Real.sqrt (tenH f))
      + 150 * (tenS f * Real.sqrt (tenH f))
      + 45 * (tenH f * Real.sqrt (tenS f))
      - 20 * (tenS f * Real.sqrt (tenS f)) := by
  have hcap := capped_complete_square (tenV_nonneg f) (tenV_le f)
    (tenU2_nonneg f) (tenU2_le f hf) (tenDU_le f)
    (show 256 * (tenS f * Real.sqrt (tenS f))
      ≤ 1089 * (tenH f * Real.sqrt (tenS f)) by
      nlinarith [mul_le_mul_of_nonneg_right hratio (Real.sqrt_nonneg (tenS f))])
  rw [sqrt_caps_mul (tenS_nonneg f)] at hcap
  have hT := tenT3_le f hf
  have hQ := tenQ_le f
  have hU := tenU2_le f hf
  linarith

/-- The capped J5 estimate in the normalization `E a² = 1/2`. -/
theorem circular_j5_capped [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
    (hE : IsGaussianExpectation E) {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (ha : Chaos3 a) (hc : Circular J a b) (haa : E (a * a) = 1 / 2)
    (hratio : 256 * tenS (cubicKernel a) ≤ 1089 * tenH (cubicKernel a)) :
    E (radU a b ^ 3) - 6 - 9 * (E (radU a b ^ 2) - 2)
      ≤ 216 * (1296 * tenH (cubicKernel a)) * Real.sqrt (1296 * tenH (cubicKernel a))
        + 480 * (1296 * tenS (cubicKernel a)) * Real.sqrt (1296 * tenH (cubicKernel a))
        + 144 * (1296 * tenH (cubicKernel a)) * Real.sqrt (1296 * tenS (cubicKernel a))
        - 64 * (1296 * tenS (cubicKernel a)) * Real.sqrt (1296 * tenS (cubicKernel a)) := by
  rw [circular_wick6 hE ha hc haa, sqrt_1296, sqrt_1296]
  have h := tensor_j5_capped (cubicKernel a) (cubicKernel_symm12 a) hratio
  linarith

/-- The regional ratio is unchanged by the fourth-order normalization bridge. -/
lemma gram_capped_ratio_iff [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
    (hE : IsGaussianExpectation E) {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (ha : Chaos3 a) (hc : Circular J a b) (haa : E (a * a) = 1 / 2) :
    256 * s0 (gramT J a b) ≤ 1089 * h0 (gramT J a b) ↔
      256 * tenS (cubicKernel a) ≤ 1089 * tenH (cubicKernel a) := by
  rw [s0_eq_tensor hE ha hc haa, h0_eq_tensor hc]
  constructor <;> intro h <;> linarith

/-- The regional sixth-moment bound in the certificate's five contraction invariants.
It includes the boundary `1089 h₀ = 256 s₀` and all zero cases. -/
theorem gram_j5_capped [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
    (hE : IsGaussianExpectation E) {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (ha : Chaos3 a) (hc : Circular J a b) (haa : E (a * a) = 1 / 2)
    (hratio : 256 * s0 (gramT J a b) ≤ 1089 * h0 (gramT J a b)) :
    E (radU a b ^ 3) - 6 - 9 * (E (radU a b ^ 2) - 2)
      ≤ 216 * h0 (gramT J a b) * Real.sqrt (h0 (gramT J a b))
        + 480 * s0 (gramT J a b) * Real.sqrt (h0 (gramT J a b))
        + 144 * h0 (gramT J a b) * Real.sqrt (s0 (gramT J a b))
        - 64 * s0 (gramT J a b) * Real.sqrt (s0 (gramT J a b)) := by
  have hr := (gram_capped_ratio_iff hE ha hc haa).mp hratio
  rw [s0_eq_tensor hE ha hc haa, h0_eq_tensor hc]
  exact circular_j5_capped hE ha hc haa hr

/-- The improvement over the unconstrained J6 bound is a square, even off the regional domain. -/
lemma capped_gap_j6 {s h : ℝ} (hs : 0 ≤ s) (hh : 0 ≤ h) :
    (216 * h * Real.sqrt h + 216 * s * Real.sqrt h + 1665 / 4 * h * Real.sqrt s)
      - (216 * h * Real.sqrt h + 480 * s * Real.sqrt h + 144 * h * Real.sqrt s
        - 64 * s * Real.sqrt s)
      = Real.sqrt s * (33 / 2 * Real.sqrt h - 8 * Real.sqrt s) ^ 2 := by
  simp only [sub_sq, mul_pow, Real.sq_sqrt hs, Real.sq_sqrt hh]
  have he : Real.sqrt s * (Real.sqrt s * Real.sqrt h) = s * Real.sqrt h := by
    rw [← mul_assoc, ← sq, Real.sq_sqrt hs]
  nlinarith [he]

/-- On nonnegative invariants the regional right-hand side is at most the J6 right-hand side. -/
lemma capped_le_j6 {s h : ℝ} (hs : 0 ≤ s) (hh : 0 ≤ h) :
    216 * h * Real.sqrt h + 480 * s * Real.sqrt h + 144 * h * Real.sqrt s
      - 64 * s * Real.sqrt s
    ≤ 216 * h * Real.sqrt h + 216 * s * Real.sqrt h + 1665 / 4 * h * Real.sqrt s := by
  have hgap := capped_gap_j6 hs hh
  have hnonneg := mul_nonneg (Real.sqrt_nonneg s)
    (sq_nonneg (33 / 2 * Real.sqrt h - 8 * Real.sqrt s))
  linarith

/-- The regional right-hand side strictly improves J5 whenever `s > 0`. -/
lemma capped_lt_j5 {s h : ℝ} (hs : 0 < s) :
    216 * h * Real.sqrt h + 480 * s * Real.sqrt h + 144 * h * Real.sqrt s
      - 64 * s * Real.sqrt s
    < 216 * h * Real.sqrt h + 480 * s * Real.sqrt h + 144 * h * Real.sqrt s := by
  have hr := Real.sqrt_pos.2 hs
  nlinarith [mul_pos hs hr]

end

end Grothe.LowerAnalytic.JointSixth

namespace Grothe.LowerAnalytic.JointSixth

noncomputable section

variable {ι : Type*} [Fintype ι]

/-- The global square with coefficient `20 + η`, including `v = 0` and `w = 0`. -/
lemma eta_complete_square {v w d η : ℝ} (hv : 0 ≤ v) (hw : 0 ≤ w)
    (hd : d ≤ Real.sqrt v * Real.sqrt w) (hη : 0 ≤ η) :
    -20 * v + 165 / 2 * d ≤ η * v + 27225 / (16 * (20 + η)) * w := by
  have hk : 0 < 20 + η := by linarith
  have he : (20 + η) * v + 27225 / (16 * (20 + η)) * w
        - 165 / 2 * (Real.sqrt v * Real.sqrt w)
      = (20 + η) * (Real.sqrt v - 165 / (4 * (20 + η)) * Real.sqrt w) ^ 2 := by
    simp only [sub_sq, mul_pow, Real.sq_sqrt hv, Real.sq_sqrt hw]
    field_simp [ne_of_gt hk]
    ring
  have hsq := mul_nonneg (le_of_lt hk)
    (sq_nonneg (Real.sqrt v - 165 / (4 * (20 + η)) * Real.sqrt w))
  linarith

/-- A global family retaining the upper bounds on both `V` and `W`. -/
theorem tensor_j6_eta (f : ι → ι → ι → ℝ)
    (hf : ∀ a b c, f a b c = f b a c) {η : ℝ} (hη : 0 ≤ η) :
    135 / 2 * tenT3 f - 20 * tenV f + 135 / 2 * tenQ f
      + 165 / 2 * tenDU f + 45 * tenU2 f
    ≤ 135 / 2 * (tenH f * Real.sqrt (tenH f))
      + 135 / 2 * (tenS f * Real.sqrt (tenH f))
      + (45 + 27225 / (16 * (20 + η))) * (tenH f * Real.sqrt (tenS f))
      + η * (tenS f * Real.sqrt (tenS f)) := by
  have hsq := eta_complete_square (tenV_nonneg f) (tenU2_nonneg f) (tenDU_le f) hη
  have hV := mul_le_mul_of_nonneg_left (tenV_le f) hη
  have hU := mul_le_mul_of_nonneg_left (tenU2_le f hf)
    (show 0 ≤ 27225 / (16 * (20 + η)) by positivity)
  have hU' := tenU2_le f hf
  have hT := tenT3_le f hf
  have hQ := tenQ_le f
  linarith

/-- The global η family before the final square-root and Young estimates. -/
theorem circular_j6_eta [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
    (hE : IsGaussianExpectation E) {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (ha : Chaos3 a) (hc : Circular J a b) (haa : E (a * a) = 1 / 2)
    {η : ℝ} (hη : 0 ≤ η) :
    E (radU a b ^ 3) - 6 - 9 * (E (radU a b ^ 2) - 2)
      ≤ 216 * (1296 * tenH (cubicKernel a)) * Real.sqrt (1296 * tenH (cubicKernel a))
        + 216 * (1296 * tenS (cubicKernel a)) * Real.sqrt (1296 * tenH (cubicKernel a))
        + (144 + 5445 / (20 + η)) * (1296 * tenH (cubicKernel a))
          * Real.sqrt (1296 * tenS (cubicKernel a))
        + (16 * η / 5) * (1296 * tenS (cubicKernel a))
          * Real.sqrt (1296 * tenS (cubicKernel a)) := by
  rw [circular_wick6 hE ha hc haa, sqrt_1296, sqrt_1296]
  have h := mul_le_mul_of_nonneg_left
    (tensor_j6_eta (cubicKernel a) (cubicKernel_symm12 a) hη)
    (show (0 : ℝ) ≤ 16 / 5 * 46656 by norm_num)
  simp only [div_mul_eq_div_div] at h ⊢
  convert h using 1
  ring

/-- The normalized complex η family, with no regional restriction on `s₀,h₀`. -/
theorem gram_j6_eta [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
    (hE : IsGaussianExpectation E) {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (ha : Chaos3 a) (hc : Circular J a b) (haa : E (a * a) = 1 / 2)
    {η : ℝ} (hη : 0 ≤ η) :
    E (radU a b ^ 3) - 6 - 9 * (E (radU a b ^ 2) - 2)
      ≤ 216 * h0 (gramT J a b) * Real.sqrt (h0 (gramT J a b))
        + 216 * s0 (gramT J a b) * Real.sqrt (h0 (gramT J a b))
        + (144 + 5445 / (20 + η)) * h0 (gramT J a b) * Real.sqrt (s0 (gramT J a b))
        + (16 * η / 5) * s0 (gramT J a b) * Real.sqrt (s0 (gramT J a b)) := by
  rw [s0_eq_tensor hE ha hc haa, h0_eq_tensor hc]
  exact circular_j6_eta hE ha hc haa hη

/-- Scalar reduction of the global η family using J1 and an arbitrary positive Young parameter. -/
lemma j_eta_of_j6 {s h x m η β : ℝ} (hs : 0 ≤ s) (hh : 0 ≤ h) (hx : 0 ≤ x)
    (hchi : x ^ 2 = 8 / 3 * s + 4 * h) (hη : 0 ≤ η) (hβ : 0 < β)
    (hm : m ≤ 216 * h * Real.sqrt h + 216 * s * Real.sqrt h
      + (144 + 5445 / (20 + η)) * h * Real.sqrt s
      + (16 * η / 5) * s * Real.sqrt s) :
    m ≤ x * ((135 * β / 2 + 2 * η) * s
      + (198 + 27225 / (8 * (20 + η)) + 135 / (2 * β)) * h) := by
  obtain ⟨hrs, hrh⟩ := roots_le hs hh hx hchi
  have h1 := mul_le_mul_of_nonneg_left hrh hh
  have h2 := mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left hrs hh)
    (show 0 ≤ 144 + 5445 / (20 + η) by positivity)
  have h3 := mul_le_mul_of_nonneg_right hrs
    (show 0 ≤ Real.sqrt s * Real.sqrt h by positivity)
  have h4 := mul_le_mul_of_nonneg_left (young hs hh hβ) hx
  have h5 := mul_le_mul_of_nonneg_left hrs (show 0 ≤ (16 * η / 5) * s by positivity)
  have he : s * Real.sqrt h = Real.sqrt s * (Real.sqrt s * Real.sqrt h) := by
    rw [← mul_assoc, ← sq, Real.sq_sqrt hs]
  rw [← he] at h3
  have hb : m ≤ (108 + 5 / 8 * (144 + 5445 / (20 + η))) * x * h
      + 135 * x * (Real.sqrt s * Real.sqrt h) + 2 * η * x * s := by
    nlinarith
  have he' : x * ((135 * β / 2 + 2 * η) * s
        + (198 + 27225 / (8 * (20 + η)) + 135 / (2 * β)) * h)
      = (108 + 5 / 8 * (144 + 5445 / (20 + η))) * x * h
        + 135 / 2 * x * (β * s + h / β) + 2 * η * x * s := by
    simp only [div_mul_eq_div_div]
    ring
  rw [he']
  nlinarith

/-- Global joint sixth-moment family.  `η = 0` recovers J3's coefficients exactly. -/
theorem gram_j_eta [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
    (hE : IsGaussianExpectation E) {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (ha : Chaos3 a) (hc : Circular J a b) (haa : E (a * a) = 1 / 2)
    {η β : ℝ} (hη : 0 ≤ η) (hβ : 0 < β) :
    E (radU a b ^ 3) ≤ 6 + 9 * (E (radU a b ^ 2) - 2)
      + Real.sqrt (E (radU a b ^ 2) - 2) *
        ((135 * β / 2 + 2 * η) * s0 (gramT J a b)
          + (198 + 27225 / (8 * (20 + η)) + 135 / (2 * β)) * h0 (gramT J a b)) := by
  obtain ⟨hs, hh, hchi⟩ := gram_j1 hE ha hc haa
  have hchi0 : 0 ≤ E (radU a b ^ 2) - 2 := by rw [hchi]; positivity
  have h := j_eta_of_j6 hs hh (Real.sqrt_nonneg _) ((Real.sq_sqrt hchi0).trans hchi)
    hη hβ (gram_j6_eta hE ha hc haa hη)
  linarith

/-- Independent rational audit of the shifted Young substitution. -/
lemma shifted_coefficients {α : ℝ} (hα : 12 / 55 ≤ α) :
    135 * (α + 4 / 15) / 2 + 2 * (165 * α / 4 - 9) = 150 * α ∧
      198 + 27225 / (8 * (20 + (165 * α / 4 - 9))) + 135 / (2 * (α + 4 / 15))
        = 198 + 150 / (α + 4 / 15) := by
  constructor
  · ring
  · have hβ : α + 4 / 15 ≠ 0 := by linarith
    rw [show 20 + (165 * α / 4 - 9) = 165 / 4 * (α + 4 / 15) by ring]
    field_simp [hβ]
    ring

/-- Globally stronger J2 for every `α ≥ 12/55`, with the same coefficient of `s₀`. -/
theorem gram_j2_shifted [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
    (hE : IsGaussianExpectation E) {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (ha : Chaos3 a) (hc : Circular J a b) (haa : E (a * a) = 1 / 2)
    {α : ℝ} (hα : 12 / 55 ≤ α) :
    E (radU a b ^ 3) ≤ 6 + 9 * (E (radU a b ^ 2) - 2)
      + Real.sqrt (E (radU a b ^ 2) - 2) *
        (150 * α * s0 (gramT J a b) + (198 + 150 / (α + 4 / 15)) * h0 (gramT J a b)) := by
  have hη : 0 ≤ 165 * α / 4 - 9 := by linarith
  have hβ : 0 < α + 4 / 15 := by linarith
  have h := gram_j_eta hE ha hc haa hη hβ
  obtain ⟨hs, hh⟩ := shifted_coefficients hα
  rw [hs, hh] at h
  exact h

/-- The shifted family's `h₀` coefficient is strictly smaller than J2's for positive `α`. -/
lemma shifted_hcoeff_lt {α : ℝ} (hα : 0 < α) :
    198 + 150 / (α + 4 / 15) < 198 + 150 / α := by
  have h : (150 : ℝ) / (α + 4 / 15) < 150 / α :=
    (div_lt_div_iff₀ (by linarith) hα).2 (by nlinarith)
  linarith

end

end Grothe.LowerAnalytic.JointSixth
