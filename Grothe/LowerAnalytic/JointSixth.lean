import Grothe.LowerAnalytic.JointContractions

/-!
# Joint sixth-moment bounds

The real-kernel interface uses `f = cubicKernel a`, with `E a² = 1/2`.
The normalized fourth-order invariants are `s₀ = 1296 tenS f` and
`h₀ = 1296 tenH f`: standardizing `a` by `√2` multiplies both by four.
The common tensor and circular estimates are imported from `JointSixthCore` through
`JointContractions`; the invariant adapters and capped/η refinements are developed here.
The tensor estimates require no positivity of the operator `kerS f`.
-/

open MvPolynomial

namespace Grothe.LowerAnalytic.JointSixth

noncomputable section

variable {ι : Type*} [Fintype ι]

/-- The Gram certificate's `h₀`, with all four normalization factors explicit. -/
theorem gram_h0 [DecidableEq ι] {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (hc : Circular J a b) :
    1296 * tenH (cubicKernel a)
      = (8 / 3 * gramN (gramT J a b) + 2 / 3 * gramH (gramT J a b)
          + 8 / 3 * gramB (gramT J a b) + 24 * gramY (gramT J a b)
          - 16 / 3 * gramZ (gramT J a b)) := by
  simpa only [jointH0] using hc.jointH0_eq.symm

/-- The Gram certificate's J1, from the shared fourth-cumulant identity. -/
lemma gram_chi [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
    (hE : IsGaussianExpectation E) {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (ha : Chaos3 a) (hc : Circular J a b) (haa : E (a * a) = 1 / 2) :
    E (radU a b ^ 2) - 2
      = 32 * gramN (gramT J a b) + 8 * gramH (gramT J a b)
        + 32 * gramB (gramT J a b) + 96 * gramY (gramT J a b) := by
  have h := circular_j1 hE ha hc haa
  rw [← hc.jointS0_eq, ← hc.jointH0_eq] at h
  calc
    E (radU a b ^ 2) - 2 = _ := h
    _ = _ := by unfold jointS0 jointH0; ring

/-- The Gram certificate's `s₀` in the normalization of `cubicKernel a`. -/
theorem gram_s0 [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
    (hE : IsGaussianExpectation E) {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (ha : Chaos3 a) (hc : Circular J a b) (haa : E (a * a) = 1 / 2) :
    1296 * tenS (cubicKernel a)
      = 8 * gramN (gramT J a b) + 2 * gramH (gramT J a b)
        + 8 * gramB (gramT J a b) + 8 * gramZ (gramT J a b) := by
  clear hE ha haa
  simpa only [jointS0] using hc.jointS0_eq.symm

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
