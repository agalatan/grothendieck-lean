import Grothe.LowerAnalytic.SixthMomentData

/-!
# The sixth moment of complex Gaussian cubic chaos

For a normalized complex Gaussian cubic chaos `q` (`E|q|² = 1`, bidegree `(2, 1)`) with
`m = E|q|⁴`,

  `E|q|⁶ ≤ 9m − 12 + C₆ (m − 2)^{3/2}`,  `C₆ = 81641/2000 = 40.8205`.

Write `f` for the real symmetric kernel of `√2 Re q`, `F_{ab,c} = f_{abc}`, `G = FᵀF`, `C = FFᵀ`,
`S = Sym₄ C`, and `s = ‖G‖²`, `h = ‖S‖²`, `V = tr G³`, `T₃ = tr S³`, `T₄ = tr S⁴`,
`Q = ⟨vec G, S vec G⟩`, `U = SF`, `D = FG`, `Ga = ‖G_anti‖²`, `tt = ‖S₊₂,₊₂‖²`.  The Wick
contractions give `κ₄ = 1296 (s + 3h/2)` and
`κ₆ / 46656 = (135/2) T₃ − 20 V + (135/2) Q + (165/2) ⟨D, U⟩ + 45 ‖U‖²`, and the tensor
lemmas (charge-one sum of squares, block traces, the projected test-matrix bound, the positive
trace bound for `G`, Cauchy–Schwarz against `C − θS` with `⟨C, S⟩ = h`) are the hypotheses of
`cumulant_bound`.  In the normalized coordinates
`y = √(h/s)`, `w = Ga/s`, `u = √(V/s^{3/2})`, `z = T₃/h^{3/2}`, `b₄ = √T₄/h`,
`c_G = Q/(s√h)`, `v = ‖U‖²/(h√s)`, `t = tt/h` the cumulant ratio is
`κ₆/κ₄^{3/2} = P / (1 + 3y²/2)^{3/2}` with
`P = (135/2) z y³ + 45 v y² + (135/2) c_G y − 20 u² + (165/2) u y √v`, and the scalar theorem
`scalar_sixth` proves `(3√6/10) P ≤ C₆ (1 + 3y²/2)^{3/2}`:

* low range `y ≤ 409/500`: uniform bounds `z ≤ aa`, `v ≤ b₄ ≤ bb`, `c_G ≤ cc`, `√v ≤ dd`,
  `u ≤ 1` give `P ≤ Plow(y, u)`, and `lowGap ≥ 0` on `[0, 409/500] × [0, 1]`;
* high range `y ≥ 409/500`: the tangent `√v ≤ (v + r₀²)/(2r₀)`, the correlated bound on `v`
  substituted after combining the coefficients of `z`, the affine majorants `La, Lb, Lc, LN`,
  the blended lower bound `t ≥ t_λ` (both lines decrease), monotonicity in `u` up to `Lu(w)`
  (`Dhat ≥ 0`), and `highGap ≥ 0` on `[409/500, yHi] × [0, 1/2]`.

Finally `κ₄ = 3(m−2)/2` and `κ₆ = (5/2)(E|q|⁶ − 9m + 12)` (circular symmetry) turn the cumulant
bound into `sixth_moment_complex`.
-/

namespace Grothe.LowerAnalytic

noncomputable section

/-! ### Elementary facts -/

lemma le_of_sq_le_sq' {X L : ℝ} (hL : 0 ≤ L) (h : X ^ 2 ≤ L ^ 2) : X ≤ L := by
  by_contra hc
  push Not at hc
  nlinarith

lemma rpow_three_halves {a : ℝ} (ha : 0 ≤ a) : a ^ ((3 : ℝ) / 2) = a * √a := by
  rw [show (3 : ℝ) / 2 = 1 + 1 / 2 by norm_num, Real.rpow_add' ha (by norm_num), Real.rpow_one,
    ← Real.sqrt_eq_rpow]

lemma C6_pos : 0 < C6 := by unfold C6; norm_num

/-- From `P ≤ 0` or `(27/50) P² ≤ C₆² D³` to `(3√6/10) P ≤ C₆ D^{3/2}`. -/
lemma conclude_of_sq (P D : ℝ) (hD : 0 ≤ D) (h : P ≤ 0 ∨ 27 / 50 * P ^ 2 ≤ C6 ^ 2 * D ^ 3) :
    3 * √6 / 10 * P ≤ C6 * D ^ ((3 : ℝ) / 2) := by
  rw [rpow_three_halves hD]
  have h6 : (0 : ℝ) ≤ √6 := Real.sqrt_nonneg _
  have hR : 0 ≤ C6 * (D * √D) := mul_nonneg C6_pos.le (mul_nonneg hD (Real.sqrt_nonneg _))
  rcases h with h | h
  · nlinarith
  · apply le_of_sq_le_sq' hR
    have e1 : (3 * √6 / 10 * P) ^ 2 = 27 / 50 * P ^ 2 := by
      rw [mul_pow, div_pow, mul_pow, Real.sq_sqrt (by norm_num)]; ring
    have e2 : (C6 * (D * √D)) ^ 2 = C6 ^ 2 * D ^ 3 := by
      rw [mul_pow, mul_pow, Real.sq_sqrt hD]; ring
    rw [e1, e2]; exact h

/-! ### The affine majorants -/

lemma a_le_La {t : ℝ} (h0 : 0 ≤ t) (h1 : t ≤ 1 / 6) : √t * (9 / 2 - 17 * t) ≤ La t := by
  have g := gapLa_nonneg t h0 (by linarith)
  apply le_of_sq_le_sq' (by unfold La; norm_num; linarith)
  rw [mul_pow, Real.sq_sqrt h0]; linarith

lemma b_le_Lb {t : ℝ} (h0 : 0 ≤ t) (h1 : t ≤ 1 / 6) : √(1 / 2 + 8 * t - 48 * t ^ 2) ≤ Lb t := by
  have g := gapLb_nonneg t h0 (by linarith)
  have hL : 0 ≤ Lb t := by unfold Lb; norm_num; linarith
  rw [Real.sqrt_le_left hL]; linarith

lemma c_le_Lc {w : ℝ} (h0 : 0 ≤ w) (h1 : w ≤ 1 / 2) :
    √(2 / 3 + 4 * w / 3 - 11 * w ^ 2 / 6) ≤ Lc w := by
  have g := gapLc_nonneg w h0 (by linarith)
  have hL : 0 ≤ Lc w := by unfold Lc; norm_num; linarith
  rw [Real.sqrt_le_left hL]; linarith

lemma u_le_Lu {w u : ℝ} (h0 : 0 ≤ w) (h1 : w ≤ 1 / 2)
    (hu : u ^ 4 ≤ (1 + 2 * w) ^ 2 * (1 - w) / 2) : u ≤ Lu w := by
  have g := gapLu_nonneg w h0 (by linarith)
  have hL : 0 ≤ Lu w := by unfold Lu; norm_num; linarith
  exact le_of_pow_le_pow_left₀ (n := 4) (by norm_num) hL (by linarith)

lemma N_le_LN {x : ℝ} (h0 : 0 ≤ x) (h1 : x ≤ 1) : √(1 + 21 / 100 * x) ≤ LN x := by
  have g := gapLN_nonneg x h0 h1
  have hL : 0 ≤ LN x := by unfold LN; norm_num; linarith
  rw [Real.sqrt_le_left hL]; linarith

/-! ### The scalar theorem -/

/-- The normalized sixth-cumulant expression. -/
def Pcum (y u z v cG : ℝ) : ℝ :=
  135 / 2 * z * y ^ 3 + 45 * v * y ^ 2 + 135 / 2 * cG * y - 20 * u ^ 2 + 165 / 2 * u * y * √v

/-- Hypotheses of the scalar theorem: the normalized tensor lemmas. -/
structure TensorHyp (y w u z b4 cG v t : ℝ) : Prop where
  y0 : 0 ≤ y
  y1 : y ^ 2 ≤ 37 / 39
  w0 : 0 ≤ w
  w1 : w ≤ 1 / 2
  u0 : 0 ≤ u
  u1 : u ^ 4 ≤ (1 + 2 * w) ^ 2 * (1 - w) / 2
  t0 : 0 ≤ t
  t1 : t ≤ 1 / 6
  t7 : 7 * (3 * y ^ 2 - 1) + 8 * w ≤ 144 * y ^ 2 * t
  t6 : 6 * (3 * y ^ 2 - 1) + 14 * w ≤ 144 * y ^ 2 * t
  z1 : z ≤ √t * (9 / 2 - 17 * t)
  b0 : 0 ≤ b4
  b1 : b4 ^ 2 ≤ 1 / 2 + 8 * t - 48 * t ^ 2
  c1 : cG ≤ √(2 / 3 + 4 * w / 3 - 11 * w ^ 2 / 6)
  v0 : 0 ≤ v
  v1 : v ≤ b4
  v2 : v ≤ -1 / 10 * y * z + √(1 + 21 / 100 * y ^ 2) * b4

/-- Low range `0 ≤ y ≤ 409/500`. -/
lemma scalar_low {y w u z b4 cG v t : ℝ} (H : TensorHyp y w u z b4 cG v t) (hy : y ≤ 409 / 500) :
    Pcum y u z v cG ≤ 0 ∨ 27 / 50 * Pcum y u z v cG ^ 2 ≤ C6 ^ 2 * (1 + 3 * y ^ 2 / 2) ^ 3 := by
  have hy0 := H.y0
  -- `u ≤ 1`
  have hu1 : u ≤ 1 := by
    have : u ^ 4 ≤ 1 ^ 4 := by nlinarith [H.u1, H.w0, H.w1, sq_nonneg (1 - 2 * w)]
    exact le_of_pow_le_pow_left₀ (by norm_num) (by norm_num) this
  -- uniform bounds
  have hz : z ≤ aaC := by
    refine H.z1.trans (le_of_sq_le_sq' (by unfold aaC; norm_num) ?_)
    rw [mul_pow, Real.sq_sqrt H.t0]
    have : t * (9 / 2 - 17 * t) ^ 2 ≤ 27 / 34 := by
      nlinarith [mul_nonneg (sq_nonneg (t - 3 / 34)) (by linarith [H.t1] : (0 : ℝ) ≤ 6 / 17 - t)]
    unfold aaC; nlinarith
  have hb : b4 ≤ bbC := by
    apply le_of_sq_le_sq' (by unfold bbC; norm_num)
    have := H.b1
    unfold bbC; nlinarith [sq_nonneg (t - 1 / 12)]
  have hv : v ≤ bbC := H.v1.trans hb
  have hsv : √v ≤ ddC := by
    rw [Real.sqrt_le_left (by unfold ddC; norm_num)]
    unfold ddC; unfold bbC at hv; nlinarith
  have hc : cG ≤ ccC := by
    refine H.c1.trans ?_
    rw [Real.sqrt_le_left (by unfold ccC; norm_num)]
    unfold ccC; nlinarith [sq_nonneg (w - 4 / 11)]
  -- `P ≤ Plow`
  have hP : Pcum y u z v cG ≤ Plow y u := by
    have h1 := mul_le_mul_of_nonneg_right hz (pow_nonneg hy0 3)
    have h2 := mul_le_mul_of_nonneg_right hv (pow_nonneg hy0 2)
    have h3 := mul_le_mul_of_nonneg_right hc hy0
    have h4 := mul_le_mul_of_nonneg_left hsv (mul_nonneg H.u0 hy0)
    unfold Pcum Plow
    nlinarith
  have hg := lowGap_nonneg y u hy0 hy H.u0 hu1
  unfold lowGap at hg
  by_cases hP0 : Pcum y u z v cG ≤ 0
  · exact Or.inl hP0
  · right
    push Not at hP0
    have : Pcum y u z v cG ^ 2 ≤ Plow y u ^ 2 := pow_le_pow_left₀ hP0.le hP 2
    nlinarith

/-- High range `409/500 ≤ y`. -/
lemma scalar_high {y w u z b4 cG v t : ℝ} (H : TensorHyp y w u z b4 cG v t) (hy : 409 / 500 ≤ y) :
    Pcum y u z v cG ≤ 0 ∨ 27 / 50 * Pcum y u z v cG ^ 2 ≤ C6 ^ 2 * (1 + 3 * y ^ 2 / 2) ^ 3 := by
  have hy0 : 0 < y := lt_of_lt_of_le (by norm_num) hy
  have hyH : y ≤ 243505383503 / 250000000000 := by nlinarith [H.y1]
  have hy1 : y ^ 2 ≤ 1 := by linarith [H.y1]
  have hLu := u_le_Lu H.w0 H.w1 H.u1
  -- the tangent of `√v`
  have hsq : √v ≤ (v + r0C ^ 2) / (2 * r0C) := by
    rw [le_div_iff₀ (by unfold r0C; norm_num)]
    nlinarith [sq_nonneg (√v - r0C), Real.sq_sqrt H.v0]
  -- step 1: `y P ≤ y P₂` with the combined coefficients
  have hKb : 0 ≤ KbY y u := by unfold KbY r0C; have := H.u0; nlinarith
  have hKa : 0 ≤ KaY y u := by
    have : u ≤ 2 := by unfold Lu at hLu; nlinarith [H.w1]
    unfold KaY thetaC r0C; nlinarith
  set Nn := √(1 + 21 / 100 * y ^ 2) with hNn
  have hN0 : 0 ≤ Nn := Real.sqrt_nonneg _
  have step1 : y * Pcum y u z v cG ≤ y ^ 2 * KaY y u * z + y ^ 2 * KbY y u * Nn * b4
      + 135 / 2 * cG * y ^ 2 - 20 * u ^ 2 * y + 165 / 4 * r0C * u * y ^ 2 := by
    have h1 := mul_le_mul_of_nonneg_left hsq (mul_nonneg H.u0 hy0.le)
    have h2 := mul_le_mul_of_nonneg_left H.v2 (mul_nonneg hy0.le hKb)
    have e : y * Pcum y u z v cG
        = 135 / 2 * z * y ^ 4 + 45 * v * y ^ 3 + 135 / 2 * cG * y ^ 2 - 20 * u ^ 2 * y
          + 165 / 2 * y * (u * y * √v) := by unfold Pcum; ring
    have e2 : u * y * ((v + r0C ^ 2) / (2 * r0C)) = u * y * v / (2 * r0C) + u * y * r0C / 2 := by
      unfold r0C; ring
    rw [e]
    rw [e2] at h1
    have e3 : 165 / 2 * y * (u * y * v / (2 * r0C) + u * y * r0C / 2) + 45 * v * y ^ 3
        = y * KbY y u * v * y + 165 / 4 * r0C * u * y ^ 2 := by unfold KbY r0C; ring
    have e4 : y * KbY y u * (-1 / 10 * y * z + Nn * b4) * y + 135 / 2 * z * y ^ 4
        = y ^ 2 * KaY y u * z + y ^ 2 * KbY y u * Nn * b4 := by unfold KbY KaY thetaC r0C; ring
    have h2' := mul_le_mul_of_nonneg_right h2 hy0.le
    nlinarith [h1, h2', e3, e4]
  -- step 2: the line majorants and `t ≥ t_λ`
  have hz : y ^ 2 * KaY y u * z ≤ KaY y u * LaY y w := by
    have h1 := mul_le_mul_of_nonneg_left (H.z1.trans (a_le_La H.t0 H.t1))
      (mul_nonneg (sq_nonneg y) hKa)
    have htl : tlam y w ≤ 144 * y ^ 2 * t := by
      unfold tlam lamC; nlinarith [H.t7, H.t6]
    have h2 : y ^ 2 * La t ≤ LaY y w := by
      unfold La LaY; nlinarith
    nlinarith [mul_le_mul_of_nonneg_left h2 hKa]
  have hb : y ^ 2 * KbY y u * Nn * b4 ≤ KbY y u * LN (y ^ 2) * LbY y w := by
    have hb1 : b4 ≤ Lb t := by
      refine le_trans ?_ (b_le_Lb H.t0 H.t1)
      rw [Real.le_sqrt H.b0 (by nlinarith [H.b1, sq_nonneg b4])]; exact H.b1
    have hN := N_le_LN (sq_nonneg y) hy1
    have hNb : Nn * b4 ≤ LN (y ^ 2) * Lb t :=
      mul_le_mul hN hb1 H.b0 ((Real.sqrt_nonneg _).trans hN)
    have htl : tlam y w ≤ 144 * y ^ 2 * t := by
      unfold tlam lamC; nlinarith [H.t7, H.t6]
    have h2 : y ^ 2 * Lb t ≤ LbY y w := by
      unfold Lb LbY; nlinarith
    have hLN : 0 ≤ LN (y ^ 2) := by unfold LN; positivity
    have h3 := mul_le_mul_of_nonneg_left hNb (mul_nonneg (sq_nonneg y) hKb)
    have h4 := mul_le_mul_of_nonneg_left h2 (mul_nonneg hKb hLN)
    nlinarith
  have hc : 135 / 2 * cG * y ^ 2 ≤ 135 / 2 * Lc w * y ^ 2 := by
    have := mul_le_mul_of_nonneg_right (H.c1.trans (c_le_Lc H.w0 H.w1)) (sq_nonneg y)
    nlinarith
  have hQ : y * Pcum y u z v cG ≤ Qhat y w u := by
    unfold Qhat; linarith
  -- step 3: monotonicity in `u`
  have hD := dhat_nonneg y w hy hyH H.w0 H.w1
  have hmono : Qhat y w u ≤ Qhat y w (Lu w) := by
    have e : Qhat y w (Lu w) - Qhat y w u = (Lu w - u) * (Dhat y w + 20 * y * (Lu w - u)) := by
      unfold Qhat Dhat KaY KbY; ring
    have : 0 ≤ (Lu w - u) * (Dhat y w + 20 * y * (Lu w - u)) :=
      mul_nonneg (by linarith) (by nlinarith)
    linarith
  -- step 4: the squared terminal inequality
  have hg := highGap_nonneg y w hy hyH H.w0 H.w1
  unfold highGap at hg
  by_cases hP0 : Pcum y u z v cG ≤ 0
  · exact Or.inl hP0
  · right
    push Not at hP0
    have hyP : 0 < y * Pcum y u z v cG := mul_pos hy0 hP0
    have : (y * Pcum y u z v cG) ^ 2 ≤ Qhat y w (Lu w) ^ 2 :=
      pow_le_pow_left₀ hyP.le (hQ.trans hmono) 2
    have hy2 : 0 < y ^ 2 := by positivity
    have key : y ^ 2 * (27 / 50 * Pcum y u z v cG ^ 2) ≤ y ^ 2 * (C6 ^ 2 * (1 + 3 * y ^ 2 / 2) ^ 3) := by
      nlinarith
    exact le_of_mul_le_mul_left key hy2

/-- **Scalar sixth-moment theorem.**  Under the normalized tensor lemmas,
`(3√6/10) P ≤ C₆ (1 + 3y²/2)^{3/2}`. -/
theorem scalar_sixth (y w u z b4 cG v t : ℝ)
    (hy0 : 0 ≤ y) (hy1 : y ^ 2 ≤ 37 / 39) (hw0 : 0 ≤ w) (hw1 : w ≤ 1 / 2)
    (hu0 : 0 ≤ u) (hu1 : u ^ 4 ≤ (1 + 2 * w) ^ 2 * (1 - w) / 2)
    (ht0 : 0 ≤ t) (ht1 : t ≤ 1 / 6)
    (ht7 : 7 * (3 * y ^ 2 - 1) + 8 * w ≤ 144 * y ^ 2 * t)
    (ht6 : 6 * (3 * y ^ 2 - 1) + 14 * w ≤ 144 * y ^ 2 * t)
    (hz : z ≤ √t * (9 / 2 - 17 * t))
    (hb0 : 0 ≤ b4) (hb1 : b4 ^ 2 ≤ 1 / 2 + 8 * t - 48 * t ^ 2)
    (hc : cG ≤ √(2 / 3 + 4 * w / 3 - 11 * w ^ 2 / 6))
    (hv0 : 0 ≤ v) (hv1 : v ≤ b4) (hv2 : v ≤ -1 / 10 * y * z + √(1 + 21 / 100 * y ^ 2) * b4) :
    3 * √6 / 10 * Pcum y u z v cG ≤ C6 * (1 + 3 * y ^ 2 / 2) ^ ((3 : ℝ) / 2) := by
  have H : TensorHyp y w u z b4 cG v t :=
    ⟨hy0, hy1, hw0, hw1, hu0, hu1, ht0, ht1, ht7, ht6, hz, hb0, hb1, hc, hv0, hv1, hv2⟩
  apply conclude_of_sq _ _ (by nlinarith [sq_nonneg y])
  rcases le_total y (409 / 500) with hy | hy
  · exact scalar_low H hy
  · exact scalar_high H hy

/-! ### Tensor and complex forms -/

lemma le_of_sub_eq_div {a b n d : ℝ} (hd : 0 < d) (hn : 0 ≤ n) (h : b - a = n / d) : a ≤ b := by
  have : 0 ≤ n / d := div_nonneg hn hd.le
  linarith

/-- **Cumulant form.**  Let `s = ‖G‖² > 0`, `h = ‖S‖²`, `V = tr G³`, `T₃ = tr S³`,
`T₄ = tr S⁴`, `Q = ⟨vec G, S vec G⟩`, `U₂ = ‖SF‖²`, `DU = ⟨FG, SF⟩`, `Ga = ‖G_anti‖²`,
`tt = ‖S₊₂,₊₂‖²`, with the Wick identities for `κ₄, κ₆` of `√2 Re q` and the tensor lemmas
(`w = Ga/s`).  Then `κ₆ ≤ C₆ (10/(3√6)) κ₄^{3/2}`. -/
theorem cumulant_bound (s h V T3 T4 Q U2 DU Ga tt κ4 κ6 : ℝ) (hs : 0 < s)
    (hκ4 : κ4 = 1296 * (s + 3 * h / 2))
    (hκ6 : κ6 / 46656 = 135 / 2 * T3 - 20 * V + 135 / 2 * Q + 165 / 2 * DU + 45 * U2)
    (hh0 : 0 ≤ h) (hh1 : h ≤ 37 / 39 * s) (hG0 : 0 ≤ Ga) (hG1 : Ga ≤ s / 2) (hV0 : 0 ≤ V)
    (hV : V ^ 2 ≤ s ^ 3 * ((1 + 2 * (Ga / s)) ^ 2 * (1 - Ga / s) / 2))
    (ht0 : 0 ≤ tt) (ht1 : tt ≤ h / 6)
    (ht7 : 7 * (3 * h - s) + 8 * Ga ≤ 144 * tt) (ht6 : 6 * (3 * h - s) + 14 * Ga ≤ 144 * tt)
    (hT3 : T3 ≤ √tt * (9 * h / 2 - 17 * tt))
    (hT40 : 0 ≤ T4) (hT4 : T4 ≤ h ^ 2 / 2 + 8 * h * tt - 48 * tt ^ 2)
    (hQ : Q ≤ s * √h * √(2 / 3 + 4 * (Ga / s) / 3 - 11 * (Ga / s) ^ 2 / 6))
    (hU0 : 0 ≤ U2) (hU1 : U2 ≤ √s * √T4) (hU2 : U2 ≤ -1 / 10 * T3 + √(s + 21 / 100 * h) * √T4)
    (hDU : DU ≤ √V * √U2) :
    κ6 ≤ C6 * (10 / (3 * √6)) * κ4 ^ ((3 : ℝ) / 2) := by
  -- square roots of the nonnegative data
  obtain ⟨σ, hσ, rfl⟩ : ∃ σ, 0 < σ ∧ s = σ ^ 4 :=
    ⟨√√s, Real.sqrt_pos.2 (Real.sqrt_pos.2 hs), by
      rw [show (4 : ℕ) = 2 * 2 from rfl, pow_mul, Real.sq_sqrt (Real.sqrt_nonneg _),
        Real.sq_sqrt hs.le]⟩
  obtain ⟨A, hA, rfl⟩ : ∃ A, 0 ≤ A ∧ V = A ^ 2 := ⟨√V, Real.sqrt_nonneg _, (Real.sq_sqrt hV0).symm⟩
  obtain ⟨B, hB, rfl⟩ : ∃ B, 0 ≤ B ∧ U2 = B ^ 2 := ⟨√U2, Real.sqrt_nonneg _, (Real.sq_sqrt hU0).symm⟩
  obtain ⟨c, hc, rfl⟩ : ∃ c, 0 ≤ c ∧ T4 = c ^ 2 := ⟨√T4, Real.sqrt_nonneg _, (Real.sq_sqrt hT40).symm⟩
  obtain ⟨τ, hτ, rfl⟩ : ∃ τ, 0 ≤ τ ∧ tt = τ ^ 2 := ⟨√tt, Real.sqrt_nonneg _, (Real.sq_sqrt ht0).symm⟩
  have hs4 : √(σ ^ 4) = σ ^ 2 := by
    rw [show σ ^ 4 = (σ ^ 2) ^ 2 by ring, Real.sqrt_sq (by positivity)]
  rw [Real.sqrt_sq hτ] at hT3
  rw [Real.sqrt_sq hc] at hU1 hU2
  rw [hs4] at hU1
  rw [Real.sqrt_sq hA, Real.sqrt_sq hB] at hDU
  -- the right-hand side
  set D : ℝ := 1 + 3 * (h / σ ^ 4) / 2 with hD
  have hD0 : 0 < D := by rw [hD]; positivity
  have hR : κ4 ^ ((3 : ℝ) / 2) = 46656 * σ ^ 6 * (D * √D) := by
    have e : κ4 = (36 * σ ^ 2) ^ 2 * D := by rw [hκ4, hD]; field_simp; ring
    rw [rpow_three_halves (by rw [e]; positivity), e, Real.sqrt_mul (by positivity),
      Real.sqrt_sq (by positivity)]
    ring
  have h6 : (0 : ℝ) < √6 := by positivity
  have hRpos : 0 ≤ C6 * (10 / (3 * √6)) * κ4 ^ ((3 : ℝ) / 2) := by
    rw [hR]; have := C6_pos; positivity
  have hX : κ6 = 46656 * (135 / 2 * T3 - 20 * A ^ 2 + 135 / 2 * Q + 165 / 2 * DU + 45 * B ^ 2) := by
    rw [← hκ6]; ring
  rcases hh0.lt_or_eq with hpos | hzero
  swap
  · -- `h = 0`: every term is nonpositive
    subst hzero
    have hτ0 : τ = 0 :=
      (pow_eq_zero_iff two_ne_zero).1 (le_antisymm (by linarith) (sq_nonneg τ))
    subst hτ0
    have hc0 : c = 0 :=
      (pow_eq_zero_iff two_ne_zero).1 (le_antisymm (by linarith) (sq_nonneg c))
    subst hc0
    have hB0 : B = 0 :=
      (pow_eq_zero_iff two_ne_zero).1 (le_antisymm (by linarith) (sq_nonneg B))
    subst hB0
    rw [Real.sqrt_zero] at hQ
    rw [hX]
    linarith [sq_nonneg A]
  -- `h > 0`: normalize
  obtain ⟨η, hη, rfl⟩ : ∃ η, 0 < η ∧ h = η ^ 2 := ⟨√h, Real.sqrt_pos.2 hpos, (Real.sq_sqrt hh0).symm⟩
  rw [Real.sqrt_sq hη.le] at hQ
  have hsN : √(1 + 21 / 100 * (η / σ ^ 2) ^ 2) = √(σ ^ 4 + 21 / 100 * η ^ 2) / σ ^ 2 := by
    rw [show 1 + 21 / 100 * (η / σ ^ 2) ^ 2 = (σ ^ 4 + 21 / 100 * η ^ 2) / (σ ^ 2) ^ 2 by
      field_simp, Real.sqrt_div' _ (by positivity), Real.sqrt_sq (by positivity)]
  have hst : √(τ ^ 2 / η ^ 2) = τ / η := by
    rw [show τ ^ 2 / η ^ 2 = (τ / η) ^ 2 by ring, Real.sqrt_sq (by positivity)]
  have hsv : √(B ^ 2 / (η ^ 2 * σ ^ 2)) = B / (η * σ) := by
    rw [show B ^ 2 / (η ^ 2 * σ ^ 2) = (B / (η * σ)) ^ 2 by ring, Real.sqrt_sq (by positivity)]
  have hS := scalar_sixth (η / σ ^ 2) (Ga / σ ^ 4) (A / σ ^ 3) (T3 / η ^ 3) (c / η ^ 2)
    (Q / (σ ^ 4 * η)) (B ^ 2 / (η ^ 2 * σ ^ 2)) (τ ^ 2 / η ^ 2)
    (by positivity)
    (le_of_sub_eq_div (d := σ ^ 4) (n := 37 / 39 * σ ^ 4 - η ^ 2) (by positivity) (by linarith)
      (by field_simp))
    (by positivity)
    (le_of_sub_eq_div (d := σ ^ 4) (n := σ ^ 4 / 2 - Ga) (by positivity) (by linarith)
      (by field_simp))
    (by positivity)
    (le_of_sub_eq_div (d := (σ ^ 4) ^ 3)
      (n := (σ ^ 4) ^ 3 * ((1 + 2 * (Ga / σ ^ 4)) ^ 2 * (1 - Ga / σ ^ 4) / 2) - (A ^ 2) ^ 2)
      (by positivity) (by linarith) (by field_simp))
    (by positivity)
    (le_of_sub_eq_div (d := η ^ 2) (n := η ^ 2 / 6 - τ ^ 2) (by positivity) (by linarith)
      (by field_simp))
    (le_of_sub_eq_div (d := σ ^ 4) (n := 144 * τ ^ 2 - (7 * (3 * η ^ 2 - σ ^ 4) + 8 * Ga))
      (by positivity) (by linarith) (by field_simp))
    (le_of_sub_eq_div (d := σ ^ 4) (n := 144 * τ ^ 2 - (6 * (3 * η ^ 2 - σ ^ 4) + 14 * Ga))
      (by positivity) (by linarith) (by field_simp))
    (by
      rw [hst]
      exact le_of_sub_eq_div (d := η ^ 3) (n := τ * (9 * η ^ 2 / 2 - 17 * τ ^ 2) - T3)
        (by positivity) (by linarith) (by field_simp))
    (by positivity)
    (le_of_sub_eq_div (d := η ^ 4) (n := (η ^ 2) ^ 2 / 2 + 8 * η ^ 2 * τ ^ 2 - 48 * (τ ^ 2) ^ 2 - c ^ 2)
      (by positivity) (by linarith) (by field_simp))
    (le_of_sub_eq_div (d := σ ^ 4 * η)
      (n := σ ^ 4 * η * √(2 / 3 + 4 * (Ga / σ ^ 4) / 3 - 11 * (Ga / σ ^ 4) ^ 2 / 6) - Q)
      (by positivity) (by linarith) (by field_simp))
    (by positivity)
    (le_of_sub_eq_div (d := η ^ 2 * σ ^ 2) (n := σ ^ 2 * c - B ^ 2) (by positivity) (by linarith)
      (by field_simp))
    (by
      rw [hsN]
      exact le_of_sub_eq_div (d := η ^ 2 * σ ^ 2)
        (n := -1 / 10 * T3 + √(σ ^ 4 + 21 / 100 * η ^ 2) * c - B ^ 2) (by positivity) (by linarith)
        (by field_simp))
  -- back to the cumulants
  have hDy : 1 + 3 * (η / σ ^ 2) ^ 2 / 2 = D := by rw [hD]; field_simp
  rw [hDy, rpow_three_halves hD0.le] at hS
  have hP : σ ^ 6 * Pcum (η / σ ^ 2) (A / σ ^ 3) (T3 / η ^ 3) (B ^ 2 / (η ^ 2 * σ ^ 2))
      (Q / (σ ^ 4 * η)) = 135 / 2 * T3 - 20 * A ^ 2 + 135 / 2 * Q + 165 / 2 * (A * B) + 45 * B ^ 2 := by
    unfold Pcum
    rw [hsv]
    field_simp
    ring
  have hk : 3 * √6 / 10 * (135 / 2 * T3 - 20 * A ^ 2 + 135 / 2 * Q + 165 / 2 * DU + 45 * B ^ 2)
      ≤ σ ^ 6 * (C6 * (D * √D)) := by
    calc 3 * √6 / 10 * (135 / 2 * T3 - 20 * A ^ 2 + 135 / 2 * Q + 165 / 2 * DU + 45 * B ^ 2)
        ≤ 3 * √6 / 10 * (135 / 2 * T3 - 20 * A ^ 2 + 135 / 2 * Q + 165 / 2 * (A * B) + 45 * B ^ 2) :=
          mul_le_mul_of_nonneg_left (by linarith) (by positivity)
      _ = σ ^ 6 * (3 * √6 / 10 * Pcum (η / σ ^ 2) (A / σ ^ 3) (T3 / η ^ 3)
          (B ^ 2 / (η ^ 2 * σ ^ 2)) (Q / (σ ^ 4 * η))) := by rw [← hP]; ring
      _ ≤ σ ^ 6 * (C6 * (D * √D)) := mul_le_mul_of_nonneg_left hS (by positivity)
  rw [hX, hR]
  have e : C6 * (10 / (3 * √6)) * (46656 * σ ^ 6 * (D * √D))
      = 46656 * (10 / (3 * √6)) * (σ ^ 6 * (C6 * (D * √D))) := by ring
  rw [e]
  have e2 : 46656 * (135 / 2 * T3 - 20 * A ^ 2 + 135 / 2 * Q + 165 / 2 * DU + 45 * B ^ 2)
      = 46656 * (10 / (3 * √6)) * (3 * √6 / 10 *
          (135 / 2 * T3 - 20 * A ^ 2 + 135 / 2 * Q + 165 / 2 * DU + 45 * B ^ 2)) := by
    field_simp
  rw [e2]
  exact mul_le_mul_of_nonneg_left hk (by positivity)

/-- **Complex form.**  If `κ₄ = 3(m − 2)/2` and `κ₆ = (5/2)(M₆ − 9m + 12)` (the fourth and sixth
cumulants of `√2 Re q` for circularly symmetric `q` with `E|q|² = 1`, `m = E|q|⁴`,
`M₆ = E|q|⁶`) satisfy the cumulant bound, then `M₆ ≤ 9m − 12 + C₆ (m − 2)^{3/2}`. -/
theorem sixth_moment_complex (m M6 κ4 κ6 : ℝ) (hm : 2 ≤ m) (h4 : κ4 = 3 * (m - 2) / 2)
    (h6 : κ6 = 5 / 2 * (M6 - 9 * m + 12))
    (hb : κ6 ≤ C6 * (10 / (3 * √6)) * κ4 ^ ((3 : ℝ) / 2)) :
    M6 ≤ 9 * m - 12 + C6 * (m - 2) ^ ((3 : ℝ) / 2) := by
  have hx : 0 ≤ m - 2 := by linarith
  have hq : 0 < √(3 / 2 : ℝ) := by positivity
  have h6' : √6 = 2 * √(3 / 2) := by
    rw [show (6 : ℝ) = 2 ^ 2 * (3 / 2) by norm_num, Real.sqrt_mul (by norm_num),
      Real.sqrt_sq (by norm_num)]
  have hk : √κ4 = √(3 / 2) * √(m - 2) := by
    rw [h4, show 3 * (m - 2) / 2 = 3 / 2 * (m - 2) by ring, Real.sqrt_mul (by norm_num)]
  rw [rpow_three_halves (by rw [h4]; positivity), hk, h6', h4, h6] at hb
  rw [rpow_three_halves hx]
  have e : C6 * (10 / (3 * (2 * √(3 / 2)))) * (3 * (m - 2) / 2 * (√(3 / 2) * √(m - 2)))
      = 5 / 2 * (C6 * ((m - 2) * √(m - 2))) := by
    field_simp
    ring
  rw [e] at hb
  linarith

/-- The complex form with `x = √(m − 2)`: `M₆ ≤ 6 + 9x² + C₆ x³ = nX x`. -/
theorem sixth_moment_le_nX (m M6 κ4 κ6 : ℝ) (hm : 2 ≤ m) (h4 : κ4 = 3 * (m - 2) / 2)
    (h6 : κ6 = 5 / 2 * (M6 - 9 * m + 12))
    (hb : κ6 ≤ C6 * (10 / (3 * √6)) * κ4 ^ ((3 : ℝ) / 2)) :
    M6 ≤ nX √(m - 2) := by
  have h := sixth_moment_complex m M6 κ4 κ6 hm h4 h6 hb
  have hx : 0 ≤ m - 2 := by linarith
  rw [rpow_three_halves hx] at h
  have e : nX √(m - 2) = 9 * m - 12 + C6 * ((m - 2) * √(m - 2)) := by
    unfold nX
    rw [show √(m - 2) ^ 3 = √(m - 2) ^ 2 * √(m - 2) by ring, Real.sq_sqrt hx]
    ring
  rw [e]; exact h

end

end Grothe.LowerAnalytic
