import Grothe.UpperQuad.SeedSound
import Grothe.UpperChaos.OriginalMomentTaylorSeed

/-!
# The seed enclosure, obligation S2: `J₀(x) = moment 0 x ∈ seedJ0I P piI xI`

`J₀(x) = OriginalPositiveMoment.moment 0 x = (2/π) ∫₀¹ t^{-1/2} √(1−t) e^{−xt} dt` is the seed of the
conditional node recurrence.  The kernel encloses it by the series `Σ_n (−x)ⁿ (2n)!/(4ⁿ (n!)³ (n+1))`
for `x < 150` and by the Watson form for `x ≥ 150` (`GrotheQuadKernel/Seed.lean`).

* **The series branch is proved from master**: the kernel's terms are master's Taylor terms
  `(−x)ⁿ · J_n(0)/n!` (`seedTerm_eq`), and `OriginalMomentTaylorSeed.moment_zero_taylorSeed_error`
  bounds the tail by the next term, which is below the kernel's geometric tail
  (`mem_seedJ0SeriesI_moment`).
* **The Watson branch** is reduced to one analytic statement, `WatsonHyp N`: for `x > 2N + 2`,
  `|J₀(x) − (2/√π) x^{−1/2} Σ_{n≤N} w_n x^{−n}| ≤ (2/π)(√π g_{N+1} x^{−N−3/2} + 4 e^{−x}/x)` with
  `w_n = c_n g_n` (`c_n` the binomial coefficients of `√(1−t)`, `g_n = (2n)!/(4ⁿ n!) = Γ(n+½)/√π`).
  The kernel's evaluation of the sum, the Gamma factors and the error bound is proved sound here
  (`mem_seedJ0AsymI_moment`), every division handled also in its `hugeI` fallback; `WatsonHyp` itself
  is proved in `Grothe/UpperQuad/WatsonSeed.lean`.
* `mem_seedJ0I_moment`: S2 for the kernel's `seedJ0I` (series with 800 terms below 150, Watson with
  70 terms above), from `WatsonHyp 70`.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad

open GrotheQuad Grothe.UpperChaos Grothe.UpperChaos.OriginalPositiveMoment

/-! ### `0 < J₀(x) ≤ 1` and the information-free interval -/

/-- `J₀(x) ≤ 1` for `x ≥ 0`: the integrand is dominated by its value at `x = 0`, where `J₀(0) = 1`. -/
lemma moment_zero_le_one {x : ℝ} (hx : 0 ≤ x) : moment 0 x ≤ 1 := by
  rw [← moment_zero_zero]
  unfold moment
  apply mul_le_mul_of_nonneg_left _ (by positivity)
  apply intervalIntegral.integral_mono_on zero_le_one (integrand_intervalIntegrable 0 x)
    (integrand_intervalIntegrable 0 0)
  intro t ht
  unfold integrand
  apply mul_le_mul_of_nonneg_left _ (Real.rpow_nonneg ht.1 _)
  apply mul_le_mul_of_nonneg_left _ (Real.sqrt_nonneg _)
  rw [neg_zero, zero_mul, Real.exp_zero]
  exact Real.exp_le_one_iff.mpr (by nlinarith [ht.1])

lemma mem_hugeI (P : ℕ) {J : ℝ} (hJ : |J| ≤ (2 : ℝ) ^ (2 * P)) : mem J (hugeI P) := by
  unfold mem hugeI
  simp only [zpow_zero, mul_one, Int.cast_neg, pow2_cast]
  exact abs_le.mp hJ

lemma one_le_two_pow_two_mul (P : ℕ) : (1 : ℝ) ≤ (2 : ℝ) ^ (2 * P) :=
  one_le_pow₀ (by norm_num)

lemma four_le_two_pow_two_mul {P : ℕ} (hP : 1 ≤ P) : (4 : ℝ) ≤ (2 : ℝ) ^ (2 * P) := by
  calc (4 : ℝ) = 2 ^ (2 * 1) := by norm_num
    _ ≤ 2 ^ (2 * P) := pow_le_pow_right₀ (by norm_num) (by omega)

/-- `J₀(x)` lies in the information-free interval. -/
lemma moment_mem_hugeI (P : ℕ) {x : ℝ} (hx : 0 ≤ x) : mem (moment 0 x) (hugeI P) := by
  apply mem_hugeI
  rw [abs_of_pos (moment_pos 0 x)]
  exact (moment_zero_le_one hx).trans (one_le_two_pow_two_mul P)

/-! ### The series branch (`x < 150`) -/

/-- The kernel's series terms are master's Taylor terms `(−x)ⁿ · J_n(0)/n!`. -/
lemma seedTerm_eq (x : ℝ) : ∀ n, seedTerm x n = (-x) ^ n * zeroTaylorCoeff n := by
  intro n
  induction n with
  | zero => simp [seedTerm_zero]
  | succ n ih =>
    rw [seedTerm_succ, ih, zeroTaylorCoeff_succ, pow_succ]
    ring

lemma zeroTaylorCoeff_pos (n : ℕ) : 0 < zeroTaylorCoeff n := by
  unfold zeroTaylorCoeff
  exact div_pos (moment_pos n 0) (by positivity)

/-- The series tail is at most the next term (master's `moment_zero_taylorSeed_error`). -/
lemma moment_sub_seedSeries_le (x : ℝ) (hx : 0 ≤ x) (N : ℕ) :
    |moment 0 x - ∑ n ∈ Finset.range (N + 1), seedTerm x n| ≤ |seedTerm x (N + 1)| := by
  have h := moment_zero_taylorSeed_error x hx N
  unfold zeroTaylorSeed at h
  simp_rw [seedTerm_eq]
  calc _ ≤ x ^ (N + 1) * zeroTaylorCoeff (N + 1) := h
    _ = |(-x) ^ (N + 1) * zeroTaylorCoeff (N + 1)| := by
      rw [abs_mul, abs_pow, abs_neg, abs_of_nonneg hx, abs_of_pos (zeroTaylorCoeff_pos (N + 1))]

/-- **S2, the series branch**: `J₀(x) ∈ seedJ0SeriesI P N xI` when the kernel's tail flag holds. -/
theorem mem_seedJ0SeriesI_moment (P : ℕ) (hP : 1 ≤ P) (N : ℕ) {x : ℝ} {xI : Ival} (hx0 : 0 ≤ x)
    (hx : mem x xI) (hv : seedSeriesValid P N xI = true) :
    mem (moment 0 x) (seedJ0SeriesI P N xI) := by
  apply mem_seedJ0SeriesI P hP N hx0 hx hv
  have hden : mem ((N : ℝ) + 3 - x) (seedDen P N xI) := by
    unfold seedDen
    have := mem_subI P (mem_ofNat P (N + 3)) (mem_clampI hx0 hx)
    push_cast at this
    exact this
  have hpos : (0 : ℝ) < (N : ℝ) + 3 - x := pos_of_isPos hv hden
  have h1 : (1 : ℝ) ≤ (N + 3) / ((N : ℝ) + 3 - x) := by
    rw [le_div_iff₀ hpos]
    linarith
  calc _ ≤ |seedTerm x (N + 1)| := moment_sub_seedSeries_le x hx0 N
    _ = |seedTerm x (N + 1)| * 1 := (mul_one _).symm
    _ ≤ _ := mul_le_mul_of_nonneg_left h1 (abs_nonneg _)

/-! ### The Watson branch (`x ≥ 150`): the real quantities -/

/-- `w_n = c_n (2n)!/(4ⁿ n!)`, the coefficients of the Watson sum: `w_0 = 1`,
`w_{n+1} = w_n (2n−1)(2n+1)/(4(n+1))`. -/
noncomputable def watsonW : ℕ → ℝ
  | 0 => 1
  | n + 1 => watsonW n * ((2 * (n : ℝ) - 1) * (2 * n + 1)) / (4 * (n + 1))

/-- `g_n = (2n)!/(4ⁿ n!) = Γ(n+½)/√π`: `g_0 = 1`, `g_{n+1} = g_n (2n+1)/2`. -/
noncomputable def watsonG : ℕ → ℝ
  | 0 => 1
  | n + 1 => watsonG n * (2 * n + 1) / 2

lemma watsonW_zero : watsonW 0 = 1 := rfl

lemma watsonW_succ (n : ℕ) :
    watsonW (n + 1) = watsonW n * ((2 * (n : ℝ) - 1) * (2 * n + 1)) / (4 * (n + 1)) := rfl

lemma watsonG_zero : watsonG 0 = 1 := rfl

lemma watsonG_succ (n : ℕ) : watsonG (n + 1) = watsonG n * (2 * n + 1) / 2 := rfl

/-- The Watson sum `Σ_{n ≤ N} w_n x^{−n}`. -/
noncomputable def watsonS (N : ℕ) (x : ℝ) : ℝ :=
  ∑ n ∈ Finset.range (N + 1), watsonW n * (1 / x) ^ n

/-- The main term `(2/√π) x^{−1/2} Σ_{n ≤ N} w_n x^{−n}`. -/
noncomputable def watsonMain (N : ℕ) (x : ℝ) : ℝ := 2 * watsonS N x / (√Real.pi * √x)

/-- The first error term `√π g_{N+1} / (x^{N+1} √x) = Γ(N+3/2) x^{−N−3/2}`. -/
noncomputable def watsonU (N : ℕ) (x : ℝ) : ℝ := √Real.pi * watsonG (N + 1) / (x ^ (N + 1) * √x)

/-- The error bound `(2/π)(√π g_{N+1} / (x^{N+1} √x) + 4 e^{−x}/x)`. -/
noncomputable def watsonBound (N : ℕ) (x : ℝ) : ℝ :=
  2 * (watsonU N x + 4 * (Real.exp (-x) * (1 / x))) / Real.pi

/-- **The Watson remainder** (the analytic content of S2 at the large nodes): for `x > 2N + 2`,
`|J₀(x) − (2/√π) x^{−1/2} Σ_{n≤N} w_n x^{−n}| ≤ (2/π)(Γ(N+3/2) x^{−N−3/2} + 4 e^{−x}/x)`. -/
def WatsonHyp (N : ℕ) : Prop :=
  ∀ x : ℝ, 2 * (N : ℝ) + 2 < x → |moment 0 x - watsonMain N x| ≤ watsonBound N x

/-! ### Elementary bounds on `w_n`, `g_n` -/

lemma watsonG_pos : ∀ n, 0 < watsonG n := by
  intro n
  induction n with
  | zero => simp [watsonG_zero]
  | succ n ih => rw [watsonG_succ]; positivity

lemma abs_watsonW_le : ∀ n, |watsonW n| ≤ watsonG n := by
  intro n
  induction n with
  | zero => simp [watsonW_zero, watsonG_zero]
  | succ n ih =>
    have hg := watsonG_pos n
    have h1 : |(2 * (n : ℝ) - 1)| ≤ 2 * n + 2 := by
      rw [abs_le]; constructor <;> linarith
    have hn1 : (0 : ℝ) < 4 * (n + 1) := by positivity
    rw [watsonW_succ, watsonG_succ]
    rw [abs_div, abs_mul, abs_mul, abs_of_pos hn1, abs_of_pos (by positivity : (0 : ℝ) < 2 * n + 1),
      div_le_iff₀ hn1]
    calc |watsonW n| * (|2 * (n : ℝ) - 1| * (2 * n + 1))
        ≤ watsonG n * ((2 * n + 2) * (2 * n + 1)) := by gcongr
      _ = watsonG n * (2 * n + 1) / 2 * (4 * (n + 1)) := by ring

/-- `g_n x^{−n} ≤ 2^{−n}` for `n ≤ N + 1` and `x ≥ 2N + 2`. -/
lemma watsonG_mul_inv_pow_le {N : ℕ} {x : ℝ} (hx : 2 * (N : ℝ) + 2 ≤ x) :
    ∀ n, n ≤ N + 1 → watsonG n * (1 / x) ^ n ≤ (1 / 2) ^ n := by
  have hx0 : (0 : ℝ) < x := by linarith [(Nat.cast_nonneg N : (0 : ℝ) ≤ N)]
  intro n
  induction n with
  | zero => intro _; simp [watsonG_zero]
  | succ n ih =>
    intro hn
    have hih := ih (by omega)
    have hnN : (n : ℝ) ≤ N := by exact_mod_cast (show n ≤ N by omega)
    have hfac : (2 * (n : ℝ) + 1) / 2 * (1 / x) ≤ 1 / 2 := by
      rw [div_mul_eq_mul_div, div_le_div_iff_of_pos_right (by norm_num)]
      rw [mul_one_div, div_le_one hx0]
      linarith
    have hg := watsonG_pos n
    calc watsonG (n + 1) * (1 / x) ^ (n + 1)
        = (watsonG n * (1 / x) ^ n) * ((2 * n + 1) / 2 * (1 / x)) := by
          rw [watsonG_succ]; ring
      _ ≤ (1 / 2) ^ n * (1 / 2) := by
          apply mul_le_mul hih hfac (by positivity) (by positivity)
      _ = (1 / 2) ^ (n + 1) := by ring

/-- `|Σ_{n ≤ N} w_n x^{−n}| ≤ 2` for `x ≥ 2N + 2`. -/
lemma abs_watsonS_le_two {N : ℕ} {x : ℝ} (hx : 2 * (N : ℝ) + 2 ≤ x) : |watsonS N x| ≤ 2 := by
  have hx0 : (0 : ℝ) < x := by linarith [(Nat.cast_nonneg N : (0 : ℝ) ≤ N)]
  unfold watsonS
  calc |∑ n ∈ Finset.range (N + 1), watsonW n * (1 / x) ^ n|
      ≤ ∑ n ∈ Finset.range (N + 1), |watsonW n * (1 / x) ^ n| := Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ n ∈ Finset.range (N + 1), (1 / 2 : ℝ) ^ n := by
        apply Finset.sum_le_sum
        intro n hn
        rw [Finset.mem_range] at hn
        rw [abs_mul, abs_pow, abs_of_pos (by positivity : (0 : ℝ) < 1 / x)]
        calc |watsonW n| * (1 / x) ^ n ≤ watsonG n * (1 / x) ^ n :=
              mul_le_mul_of_nonneg_right (abs_watsonW_le n) (by positivity)
          _ ≤ (1 / 2) ^ n := watsonG_mul_inv_pow_le hx n (by omega)
    _ ≤ 2 := sum_geometric_two_le _

lemma sqrt_pi_le_two : √Real.pi ≤ 2 := by
  rw [Real.sqrt_le_left (by norm_num)]
  nlinarith [Real.pi_lt_d2]

lemma one_le_sqrt_pi : 1 ≤ √Real.pi := by
  rw [Real.le_sqrt (by norm_num) Real.pi_pos.le]
  nlinarith [Real.pi_gt_three]

/-- `0 ≤ u ≤ 2` for the first error term, `x ≥ 2N + 2`. -/
lemma watsonU_nonneg {N : ℕ} {x : ℝ} (hx : 0 ≤ x) : 0 ≤ watsonU N x := by
  unfold watsonU
  have := watsonG_pos (N + 1)
  positivity

lemma watsonU_le_two {N : ℕ} {x : ℝ} (hx : 2 * (N : ℝ) + 2 ≤ x) : watsonU N x ≤ 2 := by
  have hx0 : (0 : ℝ) < x := by linarith [(Nat.cast_nonneg N : (0 : ℝ) ≤ N)]
  have hx1 : (1 : ℝ) ≤ x := by linarith [(Nat.cast_nonneg N : (0 : ℝ) ≤ N)]
  have hsx : 1 ≤ √x := Real.one_le_sqrt.mpr hx1
  have hg := watsonG_mul_inv_pow_le hx (N + 1) le_rfl
  have hg' : watsonG (N + 1) / x ^ (N + 1) ≤ 1 := by
    rw [one_div, inv_pow, ← div_eq_mul_inv] at hg
    exact hg.trans (pow_le_one₀ (by norm_num) (by norm_num))
  have hgpos := watsonG_pos (N + 1)
  unfold watsonU
  rw [div_le_iff₀ (by positivity)]
  calc √Real.pi * watsonG (N + 1) = √Real.pi * (watsonG (N + 1) / x ^ (N + 1)) * x ^ (N + 1) := by
        field_simp
    _ ≤ 2 * 1 * (x ^ (N + 1) * √x) := by
        apply mul_le_mul (mul_le_mul sqrt_pi_le_two hg' (by positivity) (by norm_num))
          (le_mul_of_one_le_right (by positivity) hsx) (by positivity) (by norm_num)
    _ = 2 * (x ^ (N + 1) * √x) := by ring

/-- `0 ≤ watsonBound ≤ 4` for `x ≥ 2N + 2`. -/
lemma watsonBound_nonneg {N : ℕ} {x : ℝ} (hx : 0 ≤ x) : 0 ≤ watsonBound N x := by
  unfold watsonBound
  have := watsonU_nonneg (N := N) hx
  positivity

lemma watsonBound_le_four {N : ℕ} {x : ℝ} (hx : 2 * (N : ℝ) + 2 ≤ x) : watsonBound N x ≤ 4 := by
  have hx2 : (2 : ℝ) ≤ x := by linarith [(Nat.cast_nonneg N : (0 : ℝ) ≤ N)]
  have hu := watsonU_le_two hx
  have he : Real.exp (-x) * (1 / x) ≤ 1 / 2 := by
    have h1 : Real.exp (-x) ≤ 1 := Real.exp_le_one_iff.mpr (by linarith)
    have h2 : 1 / x ≤ 1 / 2 := one_div_le_one_div_of_le (by norm_num) hx2
    calc Real.exp (-x) * (1 / x) ≤ 1 * (1 / 2) :=
          mul_le_mul h1 h2 (by positivity) (by norm_num)
      _ = 1 / 2 := by ring
  unfold watsonBound
  rw [div_le_iff₀ Real.pi_pos]
  nlinarith [Real.pi_gt_three]

/-- `|watsonMain| ≤ 4` for `x ≥ 2N + 2`. -/
lemma abs_watsonMain_le_four {N : ℕ} {x : ℝ} (hx : 2 * (N : ℝ) + 2 ≤ x) : |watsonMain N x| ≤ 4 := by
  have hx1 : (1 : ℝ) ≤ x := by linarith [(Nat.cast_nonneg N : (0 : ℝ) ≤ N)]
  have hsx : 1 ≤ √x := Real.one_le_sqrt.mpr hx1
  have hden : 1 ≤ √Real.pi * √x := one_le_mul_of_one_le_of_one_le one_le_sqrt_pi hsx
  unfold watsonMain
  rw [abs_div, abs_of_pos (by linarith : (0 : ℝ) < √Real.pi * √x), div_le_iff₀ (by linarith),
    abs_mul, abs_of_pos (by norm_num : (0 : ℝ) < 2)]
  calc 2 * |watsonS N x| ≤ 2 * 2 := by gcongr; exact abs_watsonS_le_two hx
    _ = 4 * 1 := by norm_num
    _ ≤ 4 * (√Real.pi * √x) := by gcongr

/-! ### The kernel's evaluation of the Watson form -/

/-- The loop of `watsonSum` encloses the partial sums of `Σ w_n x^{−n}`. -/
lemma watsonLoop_sound (P : ℕ) (hP : 1 ≤ P) {x : ℝ} {invx : Ival} (hinv : mem (1 / x) invx) :
    ∀ (fuel i : ℕ) (a s : Ival), mem (watsonW i * (1 / x) ^ i) a →
      mem (∑ n ∈ Finset.range (i + 1), watsonW n * (1 / x) ^ n) s →
      mem (∑ n ∈ Finset.range (i + fuel + 1), watsonW n * (1 / x) ^ n)
        (watsonLoop P invx fuel i a s) := by
  intro fuel
  induction fuel with
  | zero =>
    intro i a s _ hs
    simpa [watsonLoop] using hs
  | succ fuel ih =>
    intro i a s ha hs
    have ha' : mem (watsonW (i + 1) * (1 / x) ^ (i + 1))
        (divN P (4 * (i + 1)) (mulZ P ((2 * (i : ℤ) - 1) * (2 * (i : ℤ) + 1)) (mulI P a invx))) := by
      have h := mem_divN P hP (by positivity : 0 < 4 * (i + 1))
        (mem_mulZ P ((2 * (i : ℤ) - 1) * (2 * (i : ℤ) + 1)) (mem_mulI P ha hinv))
      convert h using 1
      rw [watsonW_succ]
      push_cast
      ring
    have hs' : mem (∑ n ∈ Finset.range (i + 1 + 1), watsonW n * (1 / x) ^ n)
        (addI P s (divN P (4 * (i + 1))
          (mulZ P ((2 * (i : ℤ) - 1) * (2 * (i : ℤ) + 1)) (mulI P a invx)))) := by
      rw [Finset.sum_range_succ]
      exact mem_addI P hs ha'
    have := ih (i + 1) _ _ ha' hs'
    rw [show i + 1 + fuel = i + (fuel + 1) by ring] at this
    simpa [watsonLoop] using this

lemma mem_watsonSum (P : ℕ) (hP : 1 ≤ P) (N : ℕ) {x : ℝ} {xI : Ival} (hx : mem x xI)
    (hlo : 0 < xI.lo) : mem (watsonS N x) (watsonSum P N xI) := by
  have hinv : mem (1 / x) (invI P xI) := mem_invI P hx hlo
  have h0 : mem (watsonW 0 * (1 / x) ^ 0) (ofInt P 1) := by
    simpa [watsonW_zero] using mem_one P
  have hs0 : mem (∑ n ∈ Finset.range (0 + 1), watsonW n * (1 / x) ^ n) (ofInt P 1) := by
    simpa [watsonW_zero] using mem_one P
  have := watsonLoop_sound P hP hinv N 0 _ _ h0 hs0
  simpa [watsonSum, watsonS] using this

lemma mem_watsonGamma (P : ℕ) (hP : 1 ≤ P) : ∀ n, mem (watsonG n) (watsonGamma P n) := by
  intro n
  induction n with
  | zero => simpa [watsonG_zero, watsonGamma] using mem_one P
  | succ n ih =>
    have h := mem_divN P hP (by norm_num : 0 < 2) (mem_mulN P (2 * n + 1) ih)
    rw [watsonG_succ]
    unfold watsonGamma
    convert h using 1
    push_cast
    ring

/-- `e^{−x} ≤ 2^{−L}` for every integer `L ≤ x`, `x ≥ 0`. -/
lemma exp_neg_le_two_zpow {x : ℝ} {L : ℤ} (hx : 0 ≤ x) (hL : (L : ℝ) ≤ x) :
    Real.exp (-x) ≤ (2 : ℝ) ^ (-L) := by
  rcases le_or_gt 0 L with hL0 | hL0
  · obtain ⟨n, rfl⟩ : ∃ n : ℕ, L = n := ⟨L.toNat, (Int.toNat_of_nonneg hL0).symm⟩
    have h2e : (2 : ℝ) ≤ Real.exp 1 := by
      have := Real.add_one_le_exp (1 : ℝ)
      linarith
    have hpow : (2 : ℝ) ^ n ≤ Real.exp n := by
      rw [← Real.exp_one_pow]
      exact pow_le_pow_left₀ (by norm_num) h2e n
    calc Real.exp (-x) ≤ Real.exp (-(n : ℝ)) := Real.exp_le_exp.mpr (by push_cast at hL; linarith)
      _ = (Real.exp n)⁻¹ := by rw [Real.exp_neg]
      _ ≤ ((2 : ℝ) ^ n)⁻¹ := inv_anti₀ (by positivity) hpow
      _ = (2 : ℝ) ^ (-(n : ℤ)) := by rw [zpow_neg, zpow_natCast]
  · have h1 : Real.exp (-x) ≤ 1 := Real.exp_le_one_iff.mpr (by linarith)
    have h2 : (1 : ℝ) ≤ (2 : ℝ) ^ (-L) := one_le_zpow₀ (by norm_num) (by omega)
    exact h1.trans h2

/-- The kernel's enclosure `[0, 2^{−⌊x_lo⌋}]` of `e^{−x}`. -/
lemma mem_expTerm {x : ℝ} {xI : Ival} (hx0 : 0 ≤ x) (hx : mem x xI) :
    mem (Real.exp (-x)) ⟨0, 1, -(toFixedLo 0 xI)⟩ := by
  have hL : ((toFixedLo 0 xI : ℤ) : ℝ) ≤ x := by
    have := toFixedLo_le 0 hx
    simpa using this
  unfold mem
  simp only [Int.cast_zero, zero_mul, Int.cast_one, one_mul]
  exact ⟨(Real.exp_pos _).le, exp_neg_le_two_zpow hx0 hL⟩

/-- The lower end of an interval decided above a natural number is positive. -/
lemma lo_pos_of_gtNat {a : Ival} {n : ℕ} (h : gtNat a n = true) : 0 < a.lo := by
  unfold gtNat at h
  have h' := lt_of_mantLtInt (x := ((-a.lo : ℤ) : ℝ) * (2 : ℝ) ^ a.e) h le_rfl
  have hp := two_zpow_pos a.e
  have hn : (0 : ℝ) ≤ n := Nat.cast_nonneg n
  push_cast at h'
  have : (0 : ℝ) < (a.lo : ℝ) * (2 : ℝ) ^ a.e := by linarith
  exact_mod_cast pos_of_mul_pos_left this hp.le

/-- A division whose divisor has a nonpositive lower end returns `hugeI`; otherwise the quotient
is enclosed.  Every real quotient of absolute value at most `2^(2P)` is enclosed either way. -/
lemma mem_divI_or_huge {u v : ℝ} {a b : Ival} (P : ℕ) (hu : mem u a) (hv : mem v b)
    (hbound : |u / v| ≤ (2 : ℝ) ^ (2 * P)) : mem (u / v) (divI P a b) := by
  by_cases hb : 0 < b.lo
  · exact mem_divI P hu hv hb
  · unfold divI
    simp only [not_lt.mp hb, ↓reduceIte]
    exact mem_hugeI P hbound

/-- The error term of the Watson form is enclosed by `watsonErr` (for `x ≥ 2N + 2`). -/
lemma mem_watsonErr (P : ℕ) (hP : 1 ≤ P) (N : ℕ) {piI xI : Ival} (hpi : mem Real.pi piI) {x : ℝ}
    (hx : mem x xI) (hlo : 0 < xI.lo) (hxN : 2 * (N : ℝ) + 2 ≤ x) :
    mem (watsonBound N x) (watsonErr P N piI xI) := by
  have hx0 : 0 ≤ x := by linarith [(Nat.cast_nonneg N : (0 : ℝ) ≤ N)]
  have h4 := four_le_two_pow_two_mul hP
  have hU : mem (watsonU N x)
      (divI P (mulI P (sqrtI P piI) (watsonGamma P (N + 1)))
        (mulI P (powI P xI (N + 1)) (sqrtI P xI))) := by
    apply mem_divI_or_huge P (mem_mulI P (mem_sqrtI P Real.pi_pos.le hpi) (mem_watsonGamma P hP (N + 1)))
      (mem_mulI P (mem_powI P hx (N + 1)) (mem_sqrtI P hx0 hx))
    change |watsonU N x| ≤ _
    rw [abs_of_nonneg (watsonU_nonneg hx0)]
    exact (watsonU_le_two hxN).trans (by linarith)
  have hT : mem (4 * (Real.exp (-x) * (1 / x)))
      (mulN P 4 (mulI P ⟨0, 1, -(toFixedLo 0 xI)⟩ (invI P xI))) := by
    have := mem_mulN P 4 (mem_mulI P (mem_expTerm hx0 hx) (mem_invI P hx hlo))
    push_cast at this
    exact this
  have hsum := mem_mulN P 2 (mem_addI P hU hT)
  push_cast at hsum
  unfold watsonErr watsonBound
  apply mem_divI_or_huge P hsum hpi
  change |watsonBound N x| ≤ _
  rw [abs_of_nonneg (watsonBound_nonneg hx0)]
  exact (watsonBound_le_four hxN).trans h4

/-- The main term of the Watson form is enclosed (for `x ≥ 2N + 2`). -/
lemma mem_watsonMainI (P : ℕ) (hP : 1 ≤ P) (N : ℕ) {piI xI : Ival} (hpi : mem Real.pi piI) {x : ℝ}
    (hx : mem x xI) (hlo : 0 < xI.lo) (hxN : 2 * (N : ℝ) + 2 ≤ x) :
    mem (watsonMain N x)
      (divI P (mulN P 2 (watsonSum P N xI)) (mulI P (sqrtI P piI) (sqrtI P xI))) := by
  have hx0 : 0 ≤ x := by linarith [(Nat.cast_nonneg N : (0 : ℝ) ≤ N)]
  have hS := mem_mulN P 2 (mem_watsonSum P hP N hx hlo)
  push_cast at hS
  unfold watsonMain
  apply mem_divI_or_huge P hS (mem_mulI P (mem_sqrtI P Real.pi_pos.le hpi) (mem_sqrtI P hx0 hx))
  exact (abs_watsonMain_le_four hxN).trans (four_le_two_pow_two_mul hP)

/-- **S2, the Watson branch**: `J₀(x) ∈ seedJ0AsymI P N piI xI` when the kernel's flag holds, from
the Watson remainder `WatsonHyp N`. -/
theorem mem_seedJ0AsymI_moment (P : ℕ) (hP : 1 ≤ P) (N : ℕ) {piI xI : Ival} (hpi : mem Real.pi piI)
    {x : ℝ} (hx : mem x xI) (hv : watsonValid N xI = true) (hW : WatsonHyp N) :
    mem (moment 0 x) (seedJ0AsymI P N piI xI) := by
  have hxN : 2 * (N : ℝ) + 2 < x := by
    have := gt_of_gtNat hv hx
    push_cast at this
    linarith
  have hlo : 0 < xI.lo := lo_pos_of_gtNat hv
  unfold seedJ0AsymI
  simp only [hv, ↓reduceIte]
  have hmain := mem_watsonMainI P hP N hpi hx hlo hxN.le
  have herr := mem_watsonErr P hP N hpi hx hlo hxN.le
  have hy : |moment 0 x - watsonMain N x| ≤ bval (watsonErr P N piI xI) :=
    (hW x hxN).trans ((le_abs_self _).trans (abs_le_bval herr))
  have := mem_widen P hmain hy
  simpa using this

/-- **S2 for the kernel's seed enclosure** `seedJ0I` (the series with 800 terms below `x = 150`, the
Watson form with 70 terms above), from the Watson remainder `WatsonHyp 70`. -/
theorem mem_seedJ0I_moment (P : ℕ) (hP : 1 ≤ P) {piI xI : Ival} (hpi : mem Real.pi piI) {x : ℝ}
    (hx0 : 0 ≤ x) (hx : mem x xI) (hW : WatsonHyp 70) : mem (moment 0 x) (seedJ0I P piI xI) := by
  unfold seedJ0I
  split_ifs with h
  · by_cases hv : seedSeriesValid P 800 xI = true
    · exact mem_seedJ0SeriesI_moment P hP 800 hx0 hx hv
    · simp only [Bool.not_eq_true] at hv
      unfold seedJ0SeriesI
      simp only [hv, Bool.false_eq_true, ↓reduceIte]
      exact moment_mem_hugeI P hx0
  · by_cases hv : watsonValid 70 xI = true
    · exact mem_seedJ0AsymI_moment P hP 70 hpi hx hv hW
    · simp only [Bool.not_eq_true] at hv
      unfold seedJ0AsymI
      simp only [hv, Bool.false_eq_true, ↓reduceIte]
      exact moment_mem_hugeI P hx0

end Grothe.UpperQuad
