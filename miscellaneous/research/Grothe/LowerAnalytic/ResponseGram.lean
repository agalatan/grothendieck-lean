import Grothe.Lower.Basic

/-!
# Joint response Gram budgets before the fibre supremum

The real Hilbert space can be the realification of complex Gaussian L². `P`
is the full first-chaos projection and `Q` a measured subprojection. The Gram
matrix of the unmeasured projected features lies between zero and the Gram
matrix of all unmeasured features. Both response branches use the same matrix.

These are extraction and completion lemmas, not a new numerical norm cap.
-/

namespace Grothe.LowerAnalytic.ResponseGram

open Finset

noncomputable section

variable {ι H : Type*} [Fintype ι] [NormedAddCommGroup H] [InnerProductSpace ℝ H]

def gram (v : ι → H) (i j : ι) : ℝ := inner ℝ (v i) (v j)

def qform (G : ι → ι → ℝ) (c : ι → ℝ) : ℝ :=
  ∑ i, ∑ j, c i * c j * G i j

theorem gram_qform (v : ι → H) (c : ι → ℝ) :
    qform (gram v) c = ‖∑ i, c i • v i‖ ^ 2 := by
  rw [← real_inner_self_eq_norm_sq]
  simp only [qform, gram, sum_inner, inner_sum, real_inner_smul_left,
    real_inner_smul_right]
  apply sum_congr rfl
  intro i _
  apply sum_congr rfl
  intro j _
  rw [real_inner_comm (v j) (v i)]
  ring

/-- A dimension-free shared residual budget. Taking `v = (f A, g B)`, rather
than separate tuples, retains the mixed Gram block of the same responses. -/
theorem projection_gram_interval (P Q : H →ₗ[ℝ] H)
    (hP : ∀ x, ‖P x‖ ≤ ‖x‖) (hPQ : ∀ x, P (Q x) = Q x)
    (v : ι → H) (c : ι → ℝ) :
    0 ≤ qform (gram (fun i => P (v i) - Q (v i))) c ∧
      qform (gram (fun i => P (v i) - Q (v i))) c ≤
        qform (gram (fun i => v i - Q (v i))) c := by
  rw [gram_qform, gram_qform]
  refine ⟨sq_nonneg _, ?_⟩
  have he : (∑ i, c i • (P (v i) - Q (v i))) =
      P (∑ i, c i • (v i - Q (v i))) := by
    simp only [map_sum, map_smul, map_sub, hPQ]
  rw [he]
  exact pow_le_pow_left₀ (norm_nonneg _) (hP _) 2

/-- The interval for genuine nested orthogonal projections, discharging the
contractivity and range hypotheses in the abstract extraction lemma. -/
theorem nested_projection_gram_interval (S V : Submodule ℝ H)
    [S.HasOrthogonalProjection] [V.HasOrthogonalProjection] (hSV : S ≤ V)
    (v : ι → H) (c : ι → ℝ) :
    0 ≤ qform (gram (fun i => V.starProjection (v i) - S.starProjection (v i))) c ∧
      qform (gram (fun i => V.starProjection (v i) - S.starProjection (v i))) c ≤
        qform (gram (fun i => v i - S.starProjection (v i))) c := by
  apply projection_gram_interval V.starProjection.toLinearMap S.starProjection.toLinearMap
    (fun x => V.norm_starProjection_apply_le x)
  intro x
  exact V.starProjection_eq_self_iff.mpr (hSV (S.starProjection_apply_mem x))

/-- Sharp scalar consequence of the *joint* Gram interval. Its radius is half
the separate Cauchy bound. Here `x,y` are the features after measured modes
have been removed; no independence assumption is made. -/
theorem reflection_cross_bound (P : H →ₗ[ℝ] H)
    (horth : ∀ x y, inner ℝ (P x) (y - P y) = 0) (x y : H) :
    |2 * inner ℝ (P x) (P y) - inner ℝ x y| ≤ ‖x‖ * ‖y‖ := by
  have hxy : inner ℝ (P x) y = inner ℝ (P x) (P y) := by
    have := horth x y
    rw [inner_sub_right] at this
    linarith
  have hxx : inner ℝ (P x) x = ‖P x‖ ^ 2 := by
    have := horth x x
    rw [inner_sub_right, real_inner_self_eq_norm_sq] at this
    linarith
  have hn : ‖(2 : ℝ) • P x - x‖ = ‖x‖ := by
    have hs := norm_sub_sq_real ((2 : ℝ) • P x) x
    rw [norm_smul, real_inner_smul_left] at hs
    norm_num at hs
    rw [hxx] at hs
    nlinarith [norm_nonneg ((2 : ℝ) • P x - x), norm_nonneg x]
  have hi : inner ℝ ((2 : ℝ) • P x - x) y =
      2 * inner ℝ (P x) (P y) - inner ℝ x y := by
    rw [inner_sub_left, real_inner_smul_left, hxy]
  simpa only [hi, hn] using abs_real_inner_le_norm ((2 : ℝ) • P x - x) y

theorem orthogonal_projection_cross_bound (V : Submodule ℝ H)
    [V.HasOrthogonalProjection] (x y : H) :
    |2 * inner ℝ (V.starProjection x) (V.starProjection y) - inner ℝ x y| ≤ ‖x‖ * ‖y‖ := by
  apply reflection_cross_bound V.starProjection.toLinearMap
  intro u v
  rw [real_inner_comm]
  exact V.starProjection_inner_eq_zero v _ (V.starProjection_apply_mem u)

/-- Rational PSD prices can be supplied as sums of rank-one squares. This is
the weak dual bound for `0 ≤ K ≤ V`, without a numerical eigendecomposition. -/
theorem factored_price_bound {α β : Type*} [Fintype α] [Fintype β]
    (K V : ι → ι → ℝ) (a : α → ι → ℝ) (b : β → ι → ℝ)
    (hK : ∀ c, 0 ≤ qform K c) (hKV : ∀ c, qform K c ≤ qform V c) :
    (∑ i, qform K (a i)) - (∑ j, qform K (b j)) ≤ ∑ i, qform V (a i) := by
  have h1 := sum_le_sum fun i (_ : i ∈ (univ : Finset α)) => hKV (a i)
  have h2 : 0 ≤ ∑ j, qform K (b j) := sum_nonneg fun j _ => hK (b j)
  linarith

/-- Keep the measured joint moments until *after* a pointwise support bound.
The multipliers have arbitrary sign; equality constraints do not require
nonnegative prices. No interchange of a supremum and an infimum is used. -/
theorem moment_support_bound {α β : Type*} [Fintype α] [Fintype β]
    (w : α → ℝ) (hw : ∀ i, 0 ≤ w i) (F cap : α → ℝ)
    (mom : β → α → ℝ) (price : β → ℝ)
    (hpoint : ∀ i, F i + ∑ j, price j * mom j i ≤ cap i) :
    ∑ i, w i * F i ≤ (∑ i, w i * cap i) -
      ∑ j, price j * (∑ i, w i * mom j i) := by
  have h := sum_le_sum fun i (_ : i ∈ (univ : Finset α)) =>
    mul_le_mul_of_nonneg_left (hpoint i) (hw i)
  have he : (∑ i, w i * (F i + ∑ j, price j * mom j i)) =
      (∑ i, w i * F i) + ∑ j, price j * (∑ i, w i * mom j i) := by
    simp_rw [mul_add, sum_add_distrib, mul_sum]
    congr 1
    rw [sum_comm]
    apply sum_congr rfl
    intro j _
    apply sum_congr rfl
    intro i _
    ring
  rw [he] at h
  linarith

/-- Eliminate an unknown residual cross coefficient without setting it to zero.
`a` includes any near-maximizer allowance in the stability inequality. -/
theorem completion_screen (c k v r a : ℝ)
    (hgram : |2 * k - v| ≤ r) (hstable : |c + k| ≤ a) :
    |2 * c + v| ≤ r + 2 * a := by
  obtain ⟨hgl, hgu⟩ := abs_le.mp hgram
  obtain ⟨hsl, hsu⟩ := abs_le.mp hstable
  apply abs_le.mpr
  constructor <;> linarith

/-- A strict failure of the scalar screen excludes *every* completion that
obeys both the shared Gram budget and the response stability constraint. -/
theorem no_completion (c v r a : ℝ) (h : r + 2 * a < |2 * c + v|) :
    ¬ ∃ k : ℝ, |2 * k - v| ≤ r ∧ |c + k| ≤ a := by
  rintro ⟨k, hg, hs⟩
  exact (not_lt_of_ge (completion_screen c k v r a hg hs)) h

/-- Pricing a stability inequality preserves its near-maximizer error. A
global majorant for the priced objective bounds the original supremum after
passing to a maximizing sequence; no maximum is assumed attained. -/
theorem priced_nearmax_bound (J M H B price err deficit : ℝ)
    (hp : 0 ≤ price) (hJ : M - deficit ≤ J) (hH : -err ≤ H)
    (hpriced : J + price * H ≤ B) :
    M ≤ B + deficit + price * err := by
  nlinarith [mul_nonneg hp (show 0 ≤ H + err by linarith)]

/-- The weighted phase-alignment inequality on the realification of L².
For a complex scalar take `v = phase(z)` and `a = |z|`. -/
theorem weighted_alignment (u v : H) (hu : ‖u‖ ≤ 1) (hv : ‖v‖ ≤ 1)
    (a : ℝ) (ha : 0 ≤ a) :
    a * ‖u - v‖ ^ 2 ≤ 2 * (a - a * inner ℝ u v) := by
  rw [norm_sub_sq_real]
  have hu2 : ‖u‖ ^ 2 ≤ 1 := by nlinarith [norm_nonneg u]
  have hv2 : ‖v‖ ^ 2 ≤ 1 := by nlinarith [norm_nonneg v]
  nlinarith [mul_nonneg ha (show 0 ≤ 1 - ‖u‖ ^ 2 by linarith),
    mul_nonneg ha (show 0 ≤ 1 - ‖v‖ ^ 2 by linarith)]

/-- A cutoff transfers a weighted alignment gap into an ordinary L² error.
It avoids division by a small or zero image modulus. -/
theorem regularized_alignment_bound (a tau err gap : ℝ)
    (ha : 0 ≤ a) (ht : 0 < tau) (hg : 0 ≤ gap)
    (halign : a * err ≤ 2 * gap) :
    a / (a + tau) * err ≤ 2 * gap / tau := by
  rw [div_mul_eq_mul_div]
  apply (div_le_div_iff₀ (by linarith : 0 < a + tau) ht).mpr
  nlinarith [mul_nonneg ha hg,
    mul_nonneg ht.le (show 0 ≤ 2 * gap - a * err by linarith)]

/-- Continuity of the cross Gram entry with the full error retained. -/
theorem inner_perturbation_bound (x y x' y' : H) :
    |inner ℝ x y - inner ℝ x' y'| ≤
      ‖x - x'‖ * ‖y‖ + ‖x'‖ * ‖y - y'‖ := by
  have he : inner ℝ x y - inner ℝ x' y' =
      inner ℝ (x - x') y + inner ℝ x' (y - y') := by
    simp only [inner_sub_left, inner_sub_right]
    ring
  rw [he]
  exact (abs_add_le _ _).trans
    (add_le_add (abs_real_inner_le_norm _ _) (abs_real_inner_le_norm _ _))

/-- Exact radial support after one complex response disc is eliminated. -/
def diskQuad (b r : ℝ) : ℝ :=
  if 0 ≤ 2 * b + r then b + r else -(r ^ 2) / (4 * b)

theorem disk_quadratic_bound (b r t : ℝ) (hr : 0 ≤ r) (ht0 : 0 ≤ t) (ht1 : t ≤ 1) :
    b * t ^ 2 + r * t ≤ diskQuad b r := by
  unfold diskQuad
  split_ifs with h
  · by_cases hb : 0 ≤ b
    · nlinarith [mul_nonneg hb (show 0 ≤ 1 - t ^ 2 by nlinarith),
        mul_nonneg hr (show 0 ≤ 1 - t by linarith)]
    · have hn : 0 ≤ r + b * (1 + t) := by
        nlinarith [mul_nonneg (show 0 ≤ -b by linarith) (show 0 ≤ 1 - t by linarith)]
      nlinarith [mul_nonneg (show 0 ≤ 1 - t by linarith) hn]
  · have hb : 4 * b < 0 := by linarith
    apply (le_div_iff_of_neg hb).mpr
    nlinarith [sq_nonneg (2 * b * t + r)]

theorem disk_quadratic_attained (b r : ℝ) (hr : 0 ≤ r) :
    ∃ t : ℝ, 0 ≤ t ∧ t ≤ 1 ∧ b * t ^ 2 + r * t = diskQuad b r := by
  unfold diskQuad
  split_ifs with h
  · exact ⟨1, by norm_num, le_rfl, by ring⟩
  · have hb : b < 0 := by linarith
    have hden : 0 < -2 * b := by linarith
    refine ⟨r / (-2 * b), div_nonneg hr hden.le, (div_le_one hden).mpr ?_, ?_⟩
    · linarith
    · field_simp [ne_of_lt hb]; ring

/-- The homogenized Hermitian quadratic payoff on two complex discs. -/
def twoDiscValue (a b : ℝ) (p q w u v : ℂ) : ℝ :=
  a * ‖u‖ ^ 2 + b * ‖v‖ ^ 2 +
    (star p * u + star q * v + 2 * star u * w * v).re

/-- A positive homogeneous three-variable slack supplies the local support
bound. Exact matrix positivity is a separate finite certificate obligation;
the rank-one exactness argument is written in the manuscript, not assumed here. -/
theorem two_disc_price_bound (a b l0 l1 l2 : ℝ) (p q w : ℂ)
    (hl1 : 0 ≤ l1) (hl2 : 0 ≤ l2)
    (hslack : ∀ z0 u v : ℂ, 0 ≤ l0 * ‖z0‖ ^ 2 + (l1 - a) * ‖u‖ ^ 2 +
      (l2 - b) * ‖v‖ ^ 2 -
      (star z0 * star p * u + star z0 * star q * v + 2 * star u * w * v).re)
    (u v : ℂ) (hu : ‖u‖ ≤ 1) (hv : ‖v‖ ≤ 1) :
    twoDiscValue a b p q w u v ≤ l0 + l1 + l2 := by
  have h := hslack 1 u v
  simp only [norm_one, one_pow, mul_one, star_one, one_mul] at h
  have hu2 : ‖u‖ ^ 2 ≤ 1 := by nlinarith [norm_nonneg u]
  have hv2 : ‖v‖ ^ 2 ≤ 1 := by nlinarith [norm_nonneg v]
  unfold twoDiscValue
  nlinarith [mul_nonneg hl1 (show 0 ≤ 1 - ‖u‖ ^ 2 by linarith),
    mul_nonneg hl2 (show 0 ≤ 1 - ‖v‖ ^ 2 by linarith)]

end

end Grothe.LowerAnalytic.ResponseGram
