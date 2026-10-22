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
