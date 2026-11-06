import Grothe.UpperQuad.TwistSound
import Grothe.UpperChaos.HermiteBasis

/-!
# The Hermite dilation identity

For a real `μ` the dilated normalised Hermite functions expand finitely in the undilated ones,

    h_{e,f}(μ w) = Σ_{g,h} T[e,f; g,h] h_{g,h}(w),

with `T = dilT μ` defined by the recurrence of `GrotheQuadKernel/Dilate.lean` (`docs/UPPER_CLOSURE.md`
§8.1), which mirrors the normalised ladders

    w h_{g,h} = √(g+1) h_{g+1,h} + √h h_{g,h−1},     w̄ h_{g,h} = √(h+1) h_{g,h+1} + √g h_{g−1,h}

(`w_mul_hfun`, `conj_mul_hfun`, from `X0_mul_H`, `X1_mul_H`).  `T[e,f; g,h]` vanishes unless `g ≤ e`,
`h ≤ f` and `g − h = e − f` (`dilT_eq_zero`), and the identity holds with the sums over any box
`g, h < N`, `N ≥ e + f + 2` (`hfun_dilate`); `sum_box_eq_sum_min` turns the box sum into the
kernel's sum over `m = min(g, h)` (`pairOfMin`).

Agent-ID: claude-b9ee. Refs #41, #313.
-/

namespace Grothe.UpperQuad

open GrotheQuad Grothe.UpperChaos MvPolynomial Complex
open scoped ComplexConjugate

noncomputable section

/-- The dilation coefficients `T[e,f; g,h]` (the recurrence of `Dilate.lean`). -/
def dilT (μ : ℝ) : ℕ → ℕ → ℕ → ℕ → ℝ
  | 0, 0, g, h => if g = 0 ∧ h = 0 then 1 else 0
  | 0, f + 1, g, h =>
      μ * (Real.sqrt (h : ℕ) * dilT μ 0 f g (h - 1) +
        Real.sqrt ((g + 1 : ℕ) : ℝ) * dilT μ 0 f (g + 1) h) / Real.sqrt ((f + 1 : ℕ) : ℝ)
  | e + 1, f, g, h =>
      (μ * (Real.sqrt (g : ℕ) * dilT μ e f (g - 1) h +
          Real.sqrt ((h + 1 : ℕ) : ℝ) * dilT μ e f g (h + 1)) -
        Real.sqrt (f : ℕ) * dilT μ e (f - 1) g h) / Real.sqrt ((e + 1 : ℕ) : ℝ)
termination_by e f _ _ => (e, f)

lemma dilT_zero_zero (μ : ℝ) (g h : ℕ) : dilT μ 0 0 g h = if g = 0 ∧ h = 0 then 1 else 0 := by
  rw [dilT]

lemma dilT_zero_succ (μ : ℝ) (f g h : ℕ) :
    dilT μ 0 (f + 1) g h = μ * (Real.sqrt (h : ℕ) * dilT μ 0 f g (h - 1) +
        Real.sqrt ((g + 1 : ℕ) : ℝ) * dilT μ 0 f (g + 1) h) / Real.sqrt ((f + 1 : ℕ) : ℝ) := by
  rw [dilT]

lemma dilT_succ (μ : ℝ) (e f g h : ℕ) :
    dilT μ (e + 1) f g h = (μ * (Real.sqrt (g : ℕ) * dilT μ e f (g - 1) h +
          Real.sqrt ((h + 1 : ℕ) : ℝ) * dilT μ e f g (h + 1)) -
        Real.sqrt (f : ℕ) * dilT μ e (f - 1) g h) / Real.sqrt ((e + 1 : ℕ) : ℝ) := by
  rw [dilT]

/-- The support of `T[e,f; ·]`: `g ≤ e`, `h ≤ f`, `g + f = h + e`. -/
theorem dilT_eq_zero (μ : ℝ) (e f g h : ℕ) (hs : ¬(g ≤ e ∧ h ≤ f ∧ g + f = h + e)) :
    dilT μ e f g h = 0 := by
  induction e generalizing f g h with
  | zero =>
    induction f generalizing g h with
    | zero =>
      rw [dilT_zero_zero, if_neg]
      omega
    | succ f ihf =>
      rw [dilT_zero_succ]
      have h1 : Real.sqrt (h : ℕ) * dilT μ 0 f g (h - 1) = 0 := by
        rcases Nat.eq_zero_or_pos h with rfl | hp
        · simp
        · rw [ihf g (h - 1) (by omega), mul_zero]
      rw [h1, ihf (g + 1) h (by omega)]
      simp
  | succ e ihe =>
    rw [dilT_succ]
    have h1 : Real.sqrt (g : ℕ) * dilT μ e f (g - 1) h = 0 := by
      rcases Nat.eq_zero_or_pos g with rfl | hp
      · simp
      · rw [ihe f (g - 1) h (by omega), mul_zero]
    have h3 : Real.sqrt (f : ℕ) * dilT μ e (f - 1) g h = 0 := by
      rcases Nat.eq_zero_or_pos f with rfl | hp
      · simp
      · rw [ihe (f - 1) g h (by omega), mul_zero]
    rw [h1, h3, ihe f g (h + 1) (by omega)]
    simp

/-! ### The normalised ladders -/

lemma nrm_succ_left (g h : ℕ) : nrm g h = Real.sqrt ((g + 1 : ℕ) : ℝ) * nrm (g + 1) h := by
  unfold nrm
  rw [Nat.factorial_succ]
  have hpos : (0 : ℝ) < ((g.factorial * h.factorial : ℕ) : ℝ) := by positivity
  have hs : Real.sqrt (((g + 1) * g.factorial * h.factorial : ℕ) : ℝ) =
      Real.sqrt ((g + 1 : ℕ) : ℝ) * Real.sqrt ((g.factorial * h.factorial : ℕ) : ℝ) := by
    rw [← Real.sqrt_mul (by positivity)]
    congr 1
    push_cast
    ring
  rw [hs, mul_inv, ← mul_assoc, mul_inv_cancel₀ (by positivity), one_mul]

lemma nrm_succ_right (g h : ℕ) : nrm g h = Real.sqrt ((h + 1 : ℕ) : ℝ) * nrm g (h + 1) := by
  unfold nrm
  rw [Nat.factorial_succ]
  have hs : Real.sqrt ((g.factorial * ((h + 1) * h.factorial) : ℕ) : ℝ) =
      Real.sqrt ((h + 1 : ℕ) : ℝ) * Real.sqrt ((g.factorial * h.factorial : ℕ) : ℝ) := by
    rw [← Real.sqrt_mul (by positivity)]
    congr 1
    push_cast
    ring
  rw [hs, mul_inv, ← mul_assoc, mul_inv_cancel₀ (by positivity), one_mul]

/-- `n · nrm(…, n) = √n · nrm(…, n − 1)` in the second index. -/
lemma natMul_nrm_right (g h : ℕ) : (h : ℝ) * nrm g h = Real.sqrt (h : ℕ) * nrm g (h - 1) := by
  rcases Nat.eq_zero_or_pos h with rfl | hp
  · simp
  · obtain ⟨k, rfl⟩ : ∃ k, h = k + 1 := ⟨h - 1, by omega⟩
    rw [Nat.add_sub_cancel, nrm_succ_right g k, ← mul_assoc]
    congr 1
    rw [← Real.mul_self_sqrt (Nat.cast_nonneg (k + 1))]
    push_cast

lemma natMul_nrm_left (g h : ℕ) : (g : ℝ) * nrm g h = Real.sqrt (g : ℕ) * nrm (g - 1) h := by
  rcases Nat.eq_zero_or_pos g with rfl | hp
  · simp
  · obtain ⟨k, rfl⟩ : ∃ k, g = k + 1 := ⟨g - 1, by omega⟩
    rw [Nat.add_sub_cancel, nrm_succ_left k h, ← mul_assoc]
    congr 1
    rw [← Real.mul_self_sqrt (Nat.cast_nonneg (k + 1))]
    push_cast

lemma ev_X0_mul (w : ℂ) (P : CPoly) : ev w (X 0 * P) = w * ev w P := by
  simp [ev, zv]

lemma ev_X1_mul (w : ℂ) (P : CPoly) : ev w (X 1 * P) = conj w * ev w P := by
  simp [ev, zv]

lemma ev_nsmul (w : ℂ) (n : ℕ) (P : CPoly) : ev w (n • P) = n * ev w P := by
  simp [ev, nsmul_eq_mul]

/-- `w h_{g,h} = √(g+1) h_{g+1,h} + √h h_{g,h−1}`. -/
theorem w_mul_hfun (g h : ℕ) (w : ℂ) :
    w * hfun (g, h) w = (Real.sqrt ((g + 1 : ℕ) : ℝ) : ℂ) * hfun (g + 1, h) w +
      (Real.sqrt (h : ℕ) : ℂ) * hfun (g, h - 1) w := by
  simp only [hfun]
  have he := congrArg (ev w) (X0_mul_H g h)
  rw [ev_X0_mul, map_add, ev_nsmul] at he
  calc w * ((nrm g h : ℂ) * ev w (H g h)) = (nrm g h : ℂ) * (w * ev w (H g h)) := by ring
    _ = (nrm g h : ℂ) * (ev w (H (g + 1) h) + h * ev w (H g (h - 1))) := by rw [he]
    _ = ((Real.sqrt ((g + 1 : ℕ) : ℝ) * nrm (g + 1) h : ℝ) : ℂ) * ev w (H (g + 1) h) +
        (((h : ℝ) * nrm g h : ℝ) : ℂ) * ev w (H g (h - 1)) := by
          rw [← nrm_succ_left]; push_cast; ring
    _ = _ := by rw [natMul_nrm_right]; push_cast; ring

/-- `w̄ h_{g,h} = √(h+1) h_{g,h+1} + √g h_{g−1,h}`. -/
theorem conj_mul_hfun (g h : ℕ) (w : ℂ) :
    conj w * hfun (g, h) w = (Real.sqrt ((h + 1 : ℕ) : ℝ) : ℂ) * hfun (g, h + 1) w +
      (Real.sqrt (g : ℕ) : ℂ) * hfun (g - 1, h) w := by
  simp only [hfun]
  have he := congrArg (ev w) (X1_mul_H g h)
  rw [ev_X1_mul, map_add, ev_nsmul] at he
  calc conj w * ((nrm g h : ℂ) * ev w (H g h)) = (nrm g h : ℂ) * (conj w * ev w (H g h)) := by ring
    _ = (nrm g h : ℂ) * (ev w (H g (h + 1)) + g * ev w (H (g - 1) h)) := by rw [he]
    _ = ((Real.sqrt ((h + 1 : ℕ) : ℝ) * nrm g (h + 1) : ℝ) : ℂ) * ev w (H g (h + 1)) +
        (((g : ℝ) * nrm g h : ℝ) : ℂ) * ev w (H (g - 1) h) := by
          rw [← nrm_succ_right]; push_cast; ring
    _ = _ := by rw [natMul_nrm_left]; push_cast; ring

/-! ### Shifting box sums -/

/-- The box sum `Σ_{g,h < N} c_{g,h} h_{g,h}(w)`. -/
def boxSum (N : ℕ) (c : ℕ → ℕ → ℂ) (w : ℂ) : ℂ :=
  ∑ g ∈ Finset.range N, ∑ h ∈ Finset.range N, c g h * hfun (g, h) w

/-- `c` is supported in the box `g, h < N − 1`. -/
def BoxSupp (N : ℕ) (c : ℕ → ℕ → ℂ) : Prop := ∀ g h, (N ≤ g + 1 ∨ N ≤ h + 1) → c g h = 0

lemma sum_range_shift_down {M : ℕ} (F : ℕ → ℂ) (h0 : F 0 = 0) :
    ∑ g ∈ Finset.range (M + 1), F g = ∑ g ∈ Finset.range M, F (g + 1) := by
  rw [Finset.sum_range_succ', h0, add_zero]

lemma sum_range_last {M : ℕ} (F : ℕ → ℂ) (hM : F M = 0) :
    ∑ g ∈ Finset.range (M + 1), F g = ∑ g ∈ Finset.range M, F g := by
  rw [Finset.sum_range_succ, hM, add_zero]

/-- Multiplication by `w` on a box sum. -/
theorem w_mul_boxSum {N : ℕ} {c : ℕ → ℕ → ℂ} (hc : BoxSupp N c) (hN : 1 ≤ N) (w : ℂ) :
    w * boxSum N c w = boxSum N (fun g h => (Real.sqrt (g : ℕ) : ℂ) * c (g - 1) h +
      (Real.sqrt ((h + 1 : ℕ) : ℝ) : ℂ) * c g (h + 1)) w := by
  obtain ⟨M, rfl⟩ : ∃ M, N = M + 1 := ⟨N - 1, by omega⟩
  unfold boxSum
  simp only [Finset.mul_sum, add_mul, Finset.sum_add_distrib]
  have hterm : ∀ g h, w * (c g h * hfun (g, h) w) =
      c g h * (Real.sqrt ((g + 1 : ℕ) : ℝ) : ℂ) * hfun (g + 1, h) w +
        c g h * (Real.sqrt (h : ℕ) : ℂ) * hfun (g, h - 1) w := by
    intro g h
    rw [show w * (c g h * hfun (g, h) w) = c g h * (w * hfun (g, h) w) by ring, w_mul_hfun]
    ring
  simp only [hterm, Finset.sum_add_distrib]
  congr 1
  · -- the raising part: reindex `g + 1 ↦ g`
    rw [Finset.sum_comm, Finset.sum_comm (f := fun g h => (Real.sqrt (g : ℕ) : ℂ) * c (g - 1) h *
      hfun (g, h) w)]
    apply Finset.sum_congr rfl
    intro h _
    rw [sum_range_last (fun g => c g h * (Real.sqrt ((g + 1 : ℕ) : ℝ) : ℂ) * hfun (g + 1, h) w)
      (by simp [hc M h (Or.inl le_rfl)]),
      sum_range_shift_down (fun g => (Real.sqrt (g : ℕ) : ℂ) * c (g - 1) h * hfun (g, h) w)
      (by simp)]
    apply Finset.sum_congr rfl
    intro g _
    simp only [Nat.add_sub_cancel]
    ring
  · -- the lowering part: reindex `h − 1 ↦ h`
    apply Finset.sum_congr rfl
    intro g _
    rw [sum_range_shift_down (fun h => c g h * (Real.sqrt (h : ℕ) : ℂ) * hfun (g, h - 1) w)
      (by simp),
      sum_range_last (fun h => (Real.sqrt ((h + 1 : ℕ) : ℝ) : ℂ) * c g (h + 1) * hfun (g, h) w)
      (by simp [hc g (M + 1) (Or.inr (by omega))])]
    apply Finset.sum_congr rfl
    intro h _
    simp only [Nat.add_sub_cancel]
    ring

/-- Multiplication by `w̄` on a box sum. -/
theorem conj_mul_boxSum {N : ℕ} {c : ℕ → ℕ → ℂ} (hc : BoxSupp N c) (hN : 1 ≤ N) (w : ℂ) :
    conj w * boxSum N c w = boxSum N (fun g h => (Real.sqrt (h : ℕ) : ℂ) * c g (h - 1) +
      (Real.sqrt ((g + 1 : ℕ) : ℝ) : ℂ) * c (g + 1) h) w := by
  obtain ⟨M, rfl⟩ : ∃ M, N = M + 1 := ⟨N - 1, by omega⟩
  unfold boxSum
  simp only [Finset.mul_sum, add_mul, Finset.sum_add_distrib]
  have hterm : ∀ g h, conj w * (c g h * hfun (g, h) w) =
      c g h * (Real.sqrt ((h + 1 : ℕ) : ℝ) : ℂ) * hfun (g, h + 1) w +
        c g h * (Real.sqrt (g : ℕ) : ℂ) * hfun (g - 1, h) w := by
    intro g h
    rw [show conj w * (c g h * hfun (g, h) w) = c g h * (conj w * hfun (g, h) w) by ring,
      conj_mul_hfun]
    ring
  simp only [hterm, Finset.sum_add_distrib]
  congr 1
  · apply Finset.sum_congr rfl
    intro g _
    rw [sum_range_last (fun h => c g h * (Real.sqrt ((h + 1 : ℕ) : ℝ) : ℂ) * hfun (g, h + 1) w)
      (by simp [hc g M (Or.inr le_rfl)]),
      sum_range_shift_down (fun h => (Real.sqrt (h : ℕ) : ℂ) * c g (h - 1) * hfun (g, h) w)
      (by simp)]
    apply Finset.sum_congr rfl
    intro h _
    simp only [Nat.add_sub_cancel]
    ring
  · rw [Finset.sum_comm, Finset.sum_comm (f := fun g h => (Real.sqrt ((g + 1 : ℕ) : ℝ) : ℂ) *
      c (g + 1) h * hfun (g, h) w)]
    apply Finset.sum_congr rfl
    intro h _
    rw [sum_range_shift_down (fun g => c g h * (Real.sqrt (g : ℕ) : ℂ) * hfun (g - 1, h) w)
      (by simp),
      sum_range_last (fun g => (Real.sqrt ((g + 1 : ℕ) : ℝ) : ℂ) * c (g + 1) h * hfun (g, h) w)
      (by simp [hc (M + 1) h (Or.inl (by omega))])]
    apply Finset.sum_congr rfl
    intro g _
    simp only [Nat.add_sub_cancel]
    ring

/-! ### The dilation identity -/

lemma dilT_boxSupp (μ : ℝ) {e f N : ℕ} (hN : e + f + 2 ≤ N) :
    BoxSupp N (fun g h => (dilT μ e f g h : ℂ)) := by
  intro g h hgh
  simp only [Complex.ofReal_eq_zero]
  exact dilT_eq_zero μ e f g h (by omega)

lemma hfun_zero_zero (w : ℂ) : hfun (0, 0) w = 1 := by
  simp [hfun, nrm, H_zero_zero, ev]

lemma sqrt_succ_ne (n : ℕ) : (Real.sqrt ((n + 1 : ℕ) : ℝ) : ℂ) ≠ 0 := by
  rw [Complex.ofReal_ne_zero]
  exact (Real.sqrt_pos.mpr (by positivity)).ne'

/-- **The dilation identity**: `h_{e,f}(μ w) = Σ_{g,h < N} T[e,f; g,h] h_{g,h}(w)` for every box
`N ≥ e + f + 2`. -/
theorem hfun_dilate (μ : ℝ) (e f N : ℕ) (hN : e + f + 2 ≤ N) (w : ℂ) :
    hfun (e, f) ((μ : ℂ) * w) = boxSum N (fun g h => (dilT μ e f g h : ℂ)) w := by
  induction e generalizing f with
  | zero =>
    induction f with
    | zero =>
      rw [hfun_zero_zero]
      unfold boxSum
      rw [Finset.sum_eq_single 0, Finset.sum_eq_single 0]
      · simp [dilT_zero_zero, hfun_zero_zero]
      · intro h _ hh; simp [dilT_zero_zero, hh]
      · intro hh; exfalso; exact hh (Finset.mem_range.mpr (by omega))
      · intro g _ hg
        apply Finset.sum_eq_zero
        intro h _
        simp [dilT_zero_zero, hg]
      · intro hh; exfalso; exact hh (Finset.mem_range.mpr (by omega))
    | succ f ihf =>
      have hl := conj_mul_hfun 0 f ((μ : ℂ) * w)
      simp only [Nat.zero_sub, Real.sqrt_zero, Nat.cast_zero, Complex.ofReal_zero, zero_mul,
        add_zero] at hl
      have hx : hfun (0, f + 1) ((μ : ℂ) * w) =
          (μ : ℂ) * (conj w * hfun (0, f) ((μ : ℂ) * w)) / (Real.sqrt ((f + 1 : ℕ) : ℝ) : ℂ) := by
        rw [eq_div_iff (sqrt_succ_ne f)]
        rw [show (μ : ℂ) * (conj w * hfun (0, f) ((μ : ℂ) * w)) =
          conj ((μ : ℂ) * w) * hfun (0, f) ((μ : ℂ) * w) by simp [map_mul]; ring, hl]
        ring
      rw [hx, ihf (by omega), conj_mul_boxSum (dilT_boxSupp μ (by omega)) (by omega)]
      unfold boxSum
      rw [Finset.mul_sum, Finset.sum_div]
      apply Finset.sum_congr rfl
      intro g _
      rw [Finset.mul_sum, Finset.sum_div]
      apply Finset.sum_congr rfl
      intro h _
      rw [dilT_zero_succ]
      push_cast
      ring
  | succ e ihe =>
    have hl := w_mul_hfun e f ((μ : ℂ) * w)
    have hx : hfun (e + 1, f) ((μ : ℂ) * w) =
        ((μ : ℂ) * (w * hfun (e, f) ((μ : ℂ) * w)) -
          (Real.sqrt (f : ℕ) : ℂ) * hfun (e, f - 1) ((μ : ℂ) * w)) /
          (Real.sqrt ((e + 1 : ℕ) : ℝ) : ℂ) := by
      rw [eq_div_iff (sqrt_succ_ne e)]
      rw [show (μ : ℂ) * (w * hfun (e, f) ((μ : ℂ) * w)) =
        (μ : ℂ) * w * hfun (e, f) ((μ : ℂ) * w) by ring, hl]
      ring
    rw [hx, ihe f (by omega), ihe (f - 1) (by omega),
      w_mul_boxSum (dilT_boxSupp μ (by omega)) (by omega)]
    unfold boxSum
    rw [Finset.mul_sum, Finset.mul_sum, ← Finset.sum_sub_distrib, Finset.sum_div]
    apply Finset.sum_congr rfl
    intro g _
    rw [Finset.mul_sum, Finset.mul_sum, ← Finset.sum_sub_distrib, Finset.sum_div]
    apply Finset.sum_congr rfl
    intro h _
    rw [dilT_succ]
    push_cast
    ring

/-! ### From the box to the kernel's index `m = min(g, h)` -/

/-- The box sum of a function supported on `T[e,f; ·]` is the kernel's sum over `m ≤ min(e, f)`. -/
theorem sum_box_eq_sum_min {M : Type*} [AddCommMonoid M] (e f N : ℕ) (hN : e + f + 2 ≤ N)
    (X : ℕ → ℕ → M) (hX : ∀ g h, ¬(g ≤ e ∧ h ≤ f ∧ g + f = h + e) → X g h = 0) :
    ∑ g ∈ Finset.range N, ∑ h ∈ Finset.range N, X g h =
      ∑ m ∈ Finset.range (min e f + 1), X (pairOfMin e f m).1 (pairOfMin e f m).2 := by
  -- the inner sum keeps the single `h` of the right charge
  have hinner : ∀ g ∈ Finset.range N, ∑ h ∈ Finset.range N, X g h =
      if e ≤ g + f ∧ g ≤ e then X g (g + f - e) else 0 := by
    intro g _
    split_ifs with hg
    · rw [Finset.sum_eq_single (g + f - e)]
      · intro h _ hh; exact hX g h (by omega)
      · intro hh; exfalso; exact hh (Finset.mem_range.mpr (by omega))
    · apply Finset.sum_eq_zero
      intro h _
      exact hX g h (by omega)
  rw [Finset.sum_congr rfl hinner, Finset.sum_ite, Finset.sum_const_zero, add_zero]
  -- the remaining `g` are `e − min(e,f) + m`
  symm
  apply Finset.sum_nbij (fun m => (pairOfMin e f m).1)
  · intro m hm
    simp only [Finset.mem_range] at hm
    simp only [Finset.mem_filter, Finset.mem_range, pairOfMin]
    split_ifs <;> omega
  · intro m₁ hm₁ m₂ hm₂ h12
    simp only [pairOfMin] at h12
    split_ifs at h12 <;> omega
  · intro g hg
    simp only [Finset.coe_filter, Finset.mem_range, Set.mem_setOf_eq] at hg
    simp only [Finset.coe_range, Set.mem_image, Set.mem_Iio, pairOfMin]
    by_cases hef : f ≤ e
    · exact ⟨g - (e - f), by omega, by simp [hef]; omega⟩
    · exact ⟨g, by omega, by simp [show ¬(f ≤ e) from hef]⟩
  · intro m hm
    simp only [Finset.mem_range] at hm
    simp only [pairOfMin]
    split_ifs with hef
    · congr 1; omega
    · congr 1; omega

end

end Grothe.UpperQuad
