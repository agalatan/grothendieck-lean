import Grothe.Lower.Stein
import Grothe.LowerAnalytic.RadialParts

/-!
# The Stein inputs of cubic Gaussian chaos

For real polynomials `a`, `b` on `Fin d → ℝ` with `ouL a = −3a`, `ouL b = −3b`, put `U = a² + b²`,
`w = S/3` and `r = [A (a² − b²) + 2 B ab] / (3U)` (zero where `U = 0`), with `S`, `A`, `B` as in
`Fluctuation`; for `q = a + ib` this is `r = Re(c q̄²)/U`.  Every certificate test satisfies, under
the standard Gaussian measure,

  `E[Φ(U) − φ(U)] = E[(w − 1) φ(U) + r Y(U)]`

(`radial_cut`): the test `h = Φ/u` is differentiable on the whole half-line, the primitive `Φ`
being `C¹` across the knots (`cutPrim_deriv`) and `h` affine near zero.

Together with the fluctuation bound this gives `Grothe.Lower.SteinInputs` for the law of `U`
whenever `a`, `b` are in the third chaos with `E a² = E b² = 1/2`, `E ab = 0`
(`gaussian_steinInputs`).
-/

open MeasureTheory MvPolynomial Grothe.Lower

namespace Grothe.LowerAnalytic

/-! ### The primitive is differentiable across the knots -/

/-- `φ` on a cell. -/
noncomputable def cellPhi (c : CutCell) (u : ℝ) : ℝ := c.A + c.B * u

/-- `Φ` on a cell. -/
noncomputable def cellPrim (c : CutCell) (u : ℝ) : ℝ := c.e0 + c.A * u + c.B / 2 * u ^ 2

lemma cellPrim_deriv (c : CutCell) (u : ℝ) : HasDerivAt (cellPrim c) (cellPhi c u) u := by
  have h1 : HasDerivAt (fun x : ℝ => (c.e0 : ℝ) + c.A * x) (c.A * 1) u :=
    ((hasDerivAt_id' u).const_mul (c.A : ℝ)).const_add (c.e0 : ℝ)
  have h2 : HasDerivAt (fun x : ℝ => (c.B : ℝ) / 2 * x ^ 2) ((c.B : ℝ) / 2 * (2 * u)) u :=
    ((hasDerivAt_pow 2 u).const_mul ((c.B : ℝ) / 2)).congr_deriv (by norm_num)
  exact (h1.add h2).congr_deriv (by unfold cellPhi; ring)

/-- Two differentiable functions that agree to first order at `s` glue to a differentiable one. -/
lemma hasDerivAt_glue {f g f' g' : ℝ → ℝ} (s : ℝ) (hf : ∀ u, HasDerivAt f (f' u) u)
    (hg : ∀ u, HasDerivAt g (g' u) u) (hv : f s = g s) (hd : f' s = g' s) (u : ℝ) :
    HasDerivAt (fun u => if u < s then f u else g u) (if u < s then f' u else g' u) u := by
  rcases lt_trichotomy u s with h | h | h
  · simp only [h, ↓reduceIte]
    refine (hf u).congr_of_eventuallyEq ?_
    filter_upwards [Iio_mem_nhds h] with y hy
    have hy' : y < s := hy
    simp only [hy', ↓reduceIte]
  · subst h
    simp only [lt_self_iff_false, ↓reduceIte]
    have hl : HasDerivWithinAt (fun y => if y < u then f y else g y) (g' u) (Set.Iic u) u := by
      refine ((hf u).hasDerivWithinAt.congr_deriv hd).congr (fun y hy => ?_) ?_
      · by_cases h : y < u
        · simp only [h, ↓reduceIte]
        · simp only [h, ↓reduceIte]
          rw [le_antisymm hy (not_lt.1 h)]
          exact hv.symm
      · simp only [lt_self_iff_false, ↓reduceIte]
        exact hv.symm
    have hr : HasDerivWithinAt (fun y => if y < u then f y else g y) (g' u) (Set.Ici u) u := by
      refine (hg u).hasDerivWithinAt.congr (fun y hy => ?_) ?_
      · have hy' : ¬ y < u := not_lt.2 hy
        simp only [hy', ↓reduceIte]
      · simp only [lt_self_iff_false, ↓reduceIte]
    have h := hl.union hr
    rwa [Set.Iic_union_Ici, hasDerivWithinAt_univ] at h
  · have h' : ¬ u < s := not_lt.2 h.le
    simp only [h', ↓reduceIte]
    refine (hg u).congr_of_eventuallyEq ?_
    filter_upwards [Ioi_mem_nhds h] with y hy
    have hy' : ¬ y < s := not_lt.2 (le_of_lt hy)
    simp only [hy', ↓reduceIte]

lemma cutAux_deriv (cv : List ℚ) : ∀ (vs : List ℚ) (a t c Phi : ℚ) (i : ℕ), 0 ≤ a → t = a ^ 2 →
    meshOK a vs = true → c = cv.getD i 0 → cv.length ≤ i + vs.length →
    (∀ u : ℝ, HasDerivAt
      (fun u => cellPrim ((cutAux cv t c Phi i vs).getD (pickIdx vs (√u)) ⟨0, 0, 0⟩) u)
      (cellPhi ((cutAux cv t c Phi i vs).getD (pickIdx vs (√u)) ⟨0, 0, 0⟩) u) u) ∧
    cellPrim ((cutAux cv t c Phi i vs).getD (pickIdx vs (√(t : ℝ))) ⟨0, 0, 0⟩) t = Phi ∧
    cellPhi ((cutAux cv t c Phi i vs).getD (pickIdx vs (√(t : ℝ))) ⟨0, 0, 0⟩) t = c
  | [], a, t, c, Phi, i, _, _, _, hc, hi => by
    have hc0 : c = 0 := by rw [hc]; exact List.getD_eq_default _ _ (by simpa using hi)
    simp only [cutAux, pickIdx, List.getD_cons_zero, cellPrim, cellPhi, Rat.cast_zero, zero_mul,
      add_zero, zero_div, hc0, and_true]
    exact fun u => hasDerivAt_const u _
  | w :: rest, a, t, c, Phi, i, ha, ht, hm, hc, hi => by
    simp only [meshOK, Bool.and_eq_true, decide_eq_true_eq] at hm
    obtain ⟨haw, hm⟩ := hm
    have hw : (0 : ℝ) < w := by exact_mod_cast ha.trans_lt haw
    have ih := cutAux_deriv cv rest w (w ^ 2) (cv.getD (i + 1) 0)
      (Phi + (c + cv.getD (i + 1) 0) / 2 * (w ^ 2 - t)) (i + 1) (ha.trans haw.le) rfl hm rfl
      (by simp only [List.length_cons] at hi; omega)
    obtain ⟨ihd, ihP, ihc⟩ := ih
    have hlt : ∀ u : ℝ, √u < (w : ℝ) ↔ u < (w : ℝ) ^ 2 := fun u => Real.sqrt_lt' hw
    have htw : (t : ℝ) < (w : ℝ) ^ 2 := by
      rw [ht]; push_cast
      have h1 : (a : ℝ) < w := by exact_mod_cast haw
      have h0 : (0 : ℝ) ≤ a := by exact_mod_cast ha
      nlinarith
    obtain ⟨c', hc'⟩ : ∃ c' : ℚ, c' = cv.getD (i + 1) 0 := ⟨_, rfl⟩
    rw [← hc'] at ihd ihP ihc
    obtain ⟨tail, htail⟩ : ∃ tail, tail = cutAux cv (w ^ 2) c' (Phi + (c + c') / 2 * (w ^ 2 - t))
      (i + 1) rest := ⟨_, rfl⟩
    rw [← htail] at ihd ihP ihc
    obtain ⟨c0, hc0⟩ : ∃ c0 : CutCell, c0 = ⟨c - (c' - c) / (w ^ 2 - t) * t, (c' - c) / (w ^ 2 - t),
      Phi - (c - (c' - c) / (w ^ 2 - t) * t) * t - (c' - c) / (w ^ 2 - t) / 2 * t ^ 2⟩ := ⟨_, rfl⟩
    have hcells : cutAux cv t c Phi i (w :: rest) = c0 :: tail := by
      rw [hc0, htail, hc']; rfl
    have hpick : ∀ u : ℝ, (c0 :: tail).getD (pickIdx (w :: rest) (√u)) ⟨0, 0, 0⟩
        = if u < (w : ℝ) ^ 2 then c0 else tail.getD (pickIdx rest (√u)) ⟨0, 0, 0⟩ := fun u => by
      simp only [pickIdx, hlt]
      split_ifs <;> simp
    have hne : (w : ℝ) ^ 2 - t ≠ 0 := (sub_pos.2 htw).ne'
    have hA : (c0.A : ℝ) = c - (c' - c) / ((w : ℝ) ^ 2 - t) * t := by rw [hc0]; push_cast; ring
    have hB : (c0.B : ℝ) = (c' - c) / ((w : ℝ) ^ 2 - t) := by rw [hc0]; push_cast; ring
    have hE : (c0.e0 : ℝ) = Phi - (c - (c' - c) / ((w : ℝ) ^ 2 - t) * t) * t
        - (c' - c) / ((w : ℝ) ^ 2 - t) / 2 * (t : ℝ) ^ 2 := by rw [hc0]; push_cast; ring
    have hsq : √((w : ℝ) ^ 2) = w := Real.sqrt_sq hw.le
    have ihP' : cellPrim (tail.getD (pickIdx rest (w : ℝ)) ⟨0, 0, 0⟩) ((w : ℝ) ^ 2)
        = Phi + (c + c') / 2 * ((w : ℝ) ^ 2 - t) := by
      have := ihP; push_cast at this; rwa [hsq] at this
    have ihc' : cellPhi (tail.getD (pickIdx rest (w : ℝ)) ⟨0, 0, 0⟩) ((w : ℝ) ^ 2) = c' := by
      have := ihc; push_cast at this; rwa [hsq] at this
    have hv : cellPrim c0 ((w : ℝ) ^ 2)
        = cellPrim (tail.getD (pickIdx rest (√((w : ℝ) ^ 2))) ⟨0, 0, 0⟩) ((w : ℝ) ^ 2) := by
      rw [hsq, ihP', cellPrim, hA, hB, hE]; field_simp; ring
    have hd : cellPhi c0 ((w : ℝ) ^ 2)
        = cellPhi (tail.getD (pickIdx rest (√((w : ℝ) ^ 2))) ⟨0, 0, 0⟩) ((w : ℝ) ^ 2) := by
      rw [hsq, ihc', cellPhi, hA, hB]; field_simp; ring
    rw [hcells]
    refine ⟨fun u => ?_, ?_, ?_⟩
    · have h := hasDerivAt_glue ((w : ℝ) ^ 2) (cellPrim_deriv c0) ihd hv hd u
      have e1 : (fun u => cellPrim ((c0 :: tail).getD (pickIdx (w :: rest) (√u)) ⟨0, 0, 0⟩) u)
          = fun u => if u < (w : ℝ) ^ 2 then cellPrim c0 u
            else cellPrim (tail.getD (pickIdx rest (√u)) ⟨0, 0, 0⟩) u := by
        funext y; rw [hpick]; split_ifs <;> rfl
      rw [e1, hpick]
      split_ifs with hu
      · simp only [hu, ↓reduceIte] at h
        exact h
      · simp only [hu, ↓reduceIte] at h
        exact h
    · rw [hpick]
      simp only [htw, ↓reduceIte]
      rw [cellPrim, hA, hB, hE]; ring
    · rw [hpick]
      simp only [htw, ↓reduceIte]
      rw [cellPhi, hA, hB]; ring

/-- `Φ` of the test `(vs, z)`, as a function of `u`. -/
noncomputable def cutPrim (vs z : List ℚ) (u : ℝ) : ℝ := cellPrim (cellAt vs z (√u)) u

/-- `φ` of the test `(vs, z)`, as a function of `u`. -/
noncomputable def cutTest (vs z : List ℚ) (u : ℝ) : ℝ := cellPhi (cellAt vs z (√u)) u

/-- **The primitive is differentiable with derivative `φ`**, also at the knots. -/
theorem cutPrim_deriv (vs z : List ℚ) (hvs : meshOK 0 vs = true) (u : ℝ) :
    HasDerivAt (cutPrim vs z) (cutTest vs z u) u :=
  (cutAux_deriv (z.take vs.length) vs 0 0 _ 0 0 le_rfl (by norm_num) hvs rfl
    (by simp)).1 u

lemma pickIdx_zero (vs : List ℚ) (hvs : meshOK 0 vs = true) :
    ∃ s : ℝ, 0 < s ∧ ∀ y : ℝ, y < s → pickIdx vs (√y) = 0 := by
  cases vs with
  | nil => exact ⟨1, one_pos, fun _ _ => rfl⟩
  | cons w rest =>
    simp only [meshOK, Bool.and_eq_true, decide_eq_true_eq] at hvs
    have hw : (0 : ℝ) < w := by exact_mod_cast hvs.1
    refine ⟨(w : ℝ) ^ 2, by positivity, fun y hy => ?_⟩
    simp only [pickIdx, (Real.sqrt_lt' hw).2 hy, ↓reduceIte]

lemma cut_at (vs z : List ℚ) {u : ℝ} (hu : 0 ≤ u) :
    cutPhi vs z (√u) = cutTest vs z u ∧ cutGap vs z (√u) = cutPrim vs z u - cutTest vs z u ∧
    cutY vs z (√u) = if u = 0 then 0 else cutTest vs z u - cutPrim vs z u / u := by
  refine ⟨?_, ?_, ?_⟩ <;>
    simp only [cutPhi, cutGap, cutY, cutTest, cutPrim, cellPhi, cellPrim, Real.sq_sqrt hu]

/-! ### The test `h = Φ/u` -/

/-- The first cell. -/
noncomputable def cell0 (vs z : List ℚ) : CutCell := (cutCells vs z).getD 0 ⟨0, 0, 0⟩

/-- The test `h(u) = Φ(u)/u`, continued by its affine germ at zero. -/
noncomputable def cutH (vs z : List ℚ) (u : ℝ) : ℝ :=
  if u ≤ 0 then (cell0 vs z).A + (cell0 vs z).B / 2 * u else cutPrim vs z u / u

/-- The derivative of `cutH`. -/
noncomputable def cutH' (vs z : List ℚ) (u : ℝ) : ℝ :=
  if u ≤ 0 then (cell0 vs z).B / 2 else (cutTest vs z u - cutPrim vs z u / u) / u

lemma cutPrim_first (vs z : List ℚ) {y : ℝ} (hy : pickIdx vs (√y) = 0) :
    cutPrim vs z y = (cell0 vs z).A * y + (cell0 vs z).B / 2 * y ^ 2 := by
  have he : ((cell0 vs z).e0 : ℝ) = 0 := by
    unfold cell0; rw [cutCells_head_e0]; simp
  unfold cutPrim cellAt
  rw [hy, cellPrim]
  change ((cell0 vs z).e0 : ℝ) + _ + _ = _
  rw [he, zero_add]
  rfl

lemma cutTest_first (vs z : List ℚ) {y : ℝ} (hy : pickIdx vs (√y) = 0) :
    cutTest vs z y = (cell0 vs z).A + (cell0 vs z).B * y := by
  unfold cutTest cellAt
  rw [hy, cellPhi]
  rfl

lemma cutH_deriv (vs z : List ℚ) (hvs : meshOK 0 vs = true) (u : ℝ) :
    HasDerivAt (cutH vs z) (cutH' vs z u) u := by
  obtain ⟨s, hs, hpick⟩ := pickIdx_zero vs hvs
  have haff : HasDerivAt (fun y : ℝ => ((cell0 vs z).A : ℝ) + (cell0 vs z).B / 2 * y)
      ((cell0 vs z).B / 2) u := by
    have h := ((hasDerivAt_id' u).const_mul (((cell0 vs z).B : ℝ) / 2)).const_add
      ((cell0 vs z).A : ℝ)
    rwa [mul_one] at h
  by_cases hu : u ≤ 0
  · unfold cutH'
    simp only [hu, ↓reduceIte]
    refine haff.congr_of_eventuallyEq ?_
    filter_upwards [Iio_mem_nhds (hu.trans_lt hs)] with y hy
    unfold cutH
    split_ifs with h0
    · rfl
    · have hy0 : y ≠ 0 := fun h => h0 h.le
      rw [cutPrim_first vs z (hpick y hy)]
      field_simp
  · have hu0 : 0 < u := not_le.1 hu
    unfold cutH'
    simp only [hu, ↓reduceIte]
    have h := (cutPrim_deriv vs z hvs u).div (hasDerivAt_id' u) hu0.ne'
    refine (h.congr_deriv ?_).congr_of_eventuallyEq ?_
    · field_simp
    · filter_upwards [Ioi_mem_nhds hu0] with y hy
      have hy' : ¬ y ≤ 0 := not_le.2 hy
      unfold cutH
      simp only [hy', ↓reduceIte]
      rfl

lemma cutH_at (vs z : List ℚ) (hvs : meshOK 0 vs = true) {u : ℝ} (hu : 0 ≤ u) :
    cutH vs z u = cutPhi vs z (√u) - cutY vs z (√u) ∧ u * cutH' vs z u = cutY vs z (√u) ∧
    u * cutH vs z u = cutGap vs z (√u) + cutPhi vs z (√u) := by
  obtain ⟨s, hs, hpick⟩ := pickIdx_zero vs hvs
  obtain ⟨h1, h2, h3⟩ := cut_at vs z hu
  rw [h1, h2, h3]
  rcases hu.eq_or_lt with h0 | h0
  · subst h0
    simp only [cutH, cutH', le_refl, ↓reduceIte, cutPrim_first vs z (hpick 0 hs),
      cutTest_first vs z (hpick 0 hs)]
    refine ⟨by ring, by ring, by ring⟩
  · simp only [cutH, cutH', not_le.2 h0, h0.ne', ↓reduceIte]
    refine ⟨by ring, by field_simp, by field_simp; ring⟩

lemma cutH_radialTest (vs z : List ℚ) (hvs : meshOK 0 vs = true) :
    ∃ M : ℝ, RadialTest (cutH vs z) (cutH' vs z) M := by
  obtain ⟨C, hC⟩ := cutY_le vs z hvs
  refine ⟨cellBound vs z + C, cutH_deriv vs z hvs, fun u hu => ?_, fun u hu => ?_⟩
  · rw [(cutH_at vs z hvs hu).1]
    have h1 := cutPhi_le vs z (√u)
    have h2 := hC (√u)
    rw [Real.sq_sqrt hu] at h1 h2
    calc |cutPhi vs z (√u) - cutY vs z (√u)| ≤ |cutPhi vs z (√u)| + |cutY vs z (√u)| := abs_sub _ _
      _ ≤ (cellBound vs z + C) * (1 + u) := by linarith
  · rw [(cutH_at vs z hvs hu).2.1]
    have h1 := cutPhi_le vs z (√u)
    have h2 := hC (√u)
    rw [Real.sq_sqrt hu] at h1 h2
    linarith [abs_nonneg (cutPhi vs z (√u))]

/-! ### The integration-by-parts input -/

variable {d : ℕ}

/-- Three times the numerator of `r`. -/
noncomputable def radN (a b : MvPolynomial (Fin d) ℝ) : MvPolynomial (Fin d) ℝ :=
  radA a b * (a * a - b * b) + radB a b * (2 * (a * b))

/-- `r = Re(c q̄²/U)`. -/
noncomputable def radR (a b : MvPolynomial (Fin d) ℝ) (x : Fin d → ℝ) : ℝ :=
  if eval x (radU a b) = 0 then 0 else eval x (radN a b) / (3 * eval x (radU a b))

lemma radT_eq (a b : MvPolynomial (Fin d) ℝ) :
    2 * radT a b = radU a b * radS a b + radN a b := by
  simp only [radT, radS, radN, radA, radB, radU, radV, gam, Finset.mul_sum, Finset.sum_mul,
    add_mul, sub_mul, mul_add, ← Finset.sum_add_distrib, ← Finset.sum_sub_distrib]
  exact Finset.sum_congr rfl fun j _ => by ring

lemma radR_mul (a b : MvPolynomial (Fin d) ℝ) (x : Fin d → ℝ) :
    radR a b x * eval x (radU a b) = eval x (radN a b) / 3 := by
  unfold radR
  split_ifs with h
  · have h' := h
    rw [eval_radU] at h'
    have ha : eval x a = 0 := by nlinarith [mul_self_nonneg (eval x a), mul_self_nonneg (eval x b)]
    have hb : eval x b = 0 := by nlinarith [mul_self_nonneg (eval x a), mul_self_nonneg (eval x b)]
    simp only [radN, map_add, map_mul, map_sub, ha, hb]
    ring
  · field_simp

lemma measurable_radR (a b : MvPolynomial (Fin d) ℝ) : Measurable (radR a b) :=
  Measurable.ite (measurableSet_eq_fun (continuous_eval _).measurable measurable_const)
    measurable_const
    ((continuous_eval _).measurable.div ((continuous_eval _).measurable.const_mul 3))

private lemma r_bound (A B α β : ℝ) (h : α * α + β * β ≠ 0) :
    ((A * (α * α - β * β) + B * (2 * (α * β))) / (3 * (α * α + β * β))) ^ 2
      ≤ (A * A + B * B) / 9 := by
  have hU : 0 < α * α + β * β :=
    lt_of_le_of_ne (by nlinarith [mul_self_nonneg α, mul_self_nonneg β]) (Ne.symm h)
  rw [div_pow, div_le_iff₀ (by positivity)]
  have h1 : (A * (α * α - β * β) + B * (2 * (α * β))) ^ 2
      ≤ (A * A + B * B) * ((α * α - β * β) ^ 2 + (2 * (α * β)) ^ 2) := by
    nlinarith [sq_nonneg (A * (2 * (α * β)) - B * (α * α - β * β))]
  have h2 : (α * α - β * β) ^ 2 + (2 * (α * β)) ^ 2 = (α * α + β * β) ^ 2 := by ring
  have h3 : (A * A + B * B) / 9 * (3 * (α * α + β * β)) ^ 2
      = (A * A + B * B) * (α * α + β * β) ^ 2 := by ring
  rw [h3, ← h2]
  exact h1

/-- `r² ≤ c_R² + c_I²`, with `3c_R = radA` and `3c_I = radB`. -/
lemma radR_sq_le (a b : MvPolynomial (Fin d) ℝ) (x : Fin d → ℝ) :
    radR a b x ^ 2
      ≤ (eval x (radA a b) * eval x (radA a b) + eval x (radB a b) * eval x (radB a b)) / 9 := by
  unfold radR
  split_ifs with h
  · nlinarith [mul_self_nonneg (eval x (radA a b)), mul_self_nonneg (eval x (radB a b))]
  · rw [eval_radU] at h ⊢
    simp only [radN, map_add, map_mul, map_sub, map_ofNat]
    exact r_bound _ _ _ _ h

lemma memLp_radR (a b : MvPolynomial (Fin d) ℝ) : MemLp (radR a b) 2 (stdGaussian d) := by
  rw [memLp_two_iff_integrable_sq (measurable_radR a b).aestronglyMeasurable]
  refine integrable_of_abs_le_eval ((measurable_radR a b).pow_const 2).aestronglyMeasurable
    (radA a b * radA a b + radB a b * radB a b) fun x => ?_
  rw [abs_of_nonneg (sq_nonneg _)]
  simp only [map_add, map_mul]
  nlinarith [radR_sq_le a b x, mul_self_nonneg (eval x (radA a b)),
    mul_self_nonneg (eval x (radB a b))]

/-- **The integration-by-parts input of the Stein cuts.** -/
theorem radial_cut (a b : MvPolynomial (Fin d) ℝ) (ha : ouL a = -(3 * a)) (hb : ouL b = -(3 * b))
    (vs z : List ℚ) (hvs : meshOK 0 vs = true) :
    ∫ x, cutGap vs z (√(eval x (radU a b))) ∂(stdGaussian d)
      = ∫ x, ((eval x (radS a b) / 3 - 1) * cutPhi vs z (√(eval x (radU a b)))
          + radR a b x * cutY vs z (√(eval x (radU a b)))) ∂(stdGaussian d) := by
  obtain ⟨M, hT⟩ := cutH_radialTest vs z hvs
  have key := radial_parts hT a b ha hb
  have i0 : Integrable (fun x => cutH vs z (eval x (radU a b))) (stdGaussian d) :=
    (hT.integrable a b 1).congr (Filter.Eventually.of_forall fun x => by simp)
  have i1 := hT.integrable a b (radU a b)
  have i2 := hT.integrable' a b (radU a b) 1 fun x => by
    rw [abs_of_nonneg (eval_radU_nonneg a b x)]; simp
  have i3 := hT.integrable a b (radS a b)
  have i4 := hT.integrable' a b (radT a b) (radS a b) (eval_radT_le a b)
  have eL : ∫ x, cutGap vs z (√(eval x (radU a b))) ∂(stdGaussian d)
      = ∫ x, (eval x (radU a b) * cutH vs z (eval x (radU a b)) - cutH vs z (eval x (radU a b))
        - eval x (radU a b) * cutH' vs z (eval x (radU a b))) ∂(stdGaussian d) :=
    integral_congr_ae (Filter.Eventually.of_forall fun x => by
      obtain ⟨h1, h2, h3⟩ := cutH_at vs z hvs (eval_radU_nonneg a b x)
      beta_reduce
      linear_combination (-1 : ℝ) * h3 + h1 + h2)
  have eR : ∫ x, ((eval x (radS a b) / 3 - 1) * cutPhi vs z (√(eval x (radU a b)))
          + radR a b x * cutY vs z (√(eval x (radU a b)))) ∂(stdGaussian d)
      = ∫ x, (1 / 3 * (eval x (radS a b) * cutH vs z (eval x (radU a b)))
          - cutH vs z (eval x (radU a b))
          - eval x (radU a b) * cutH' vs z (eval x (radU a b))
          + 2 / 3 * (eval x (radT a b) * cutH' vs z (eval x (radU a b)))) ∂(stdGaussian d) :=
    integral_congr_ae (Filter.Eventually.of_forall fun x => by
      obtain ⟨h1, h2, h3⟩ := cutH_at vs z hvs (eval_radU_nonneg a b x)
      have hr := radR_mul a b x
      have ht := congrArg (eval x) (radT_eq a b)
      simp only [map_mul, map_add, map_ofNat] at ht
      beta_reduce
      linear_combination (1 - eval x (radS a b) / 3) * h1
        + (1 - eval x (radS a b) / 3 - radR a b x) * h2
        + cutH' vs z (eval x (radU a b)) * hr - (cutH' vs z (eval x (radU a b)) / 3) * ht)
  have i10 : Integrable (fun x => eval x (radU a b) * cutH vs z (eval x (radU a b))
      - cutH vs z (eval x (radU a b))) (stdGaussian d) := i1.sub i0
  have j3 : Integrable (fun x => 1 / 3 * (eval x (radS a b) * cutH vs z (eval x (radU a b))))
      (stdGaussian d) := i3.const_mul _
  have j30 : Integrable (fun x => 1 / 3 * (eval x (radS a b) * cutH vs z (eval x (radU a b)))
      - cutH vs z (eval x (radU a b))) (stdGaussian d) := j3.sub i0
  have j302 : Integrable (fun x => 1 / 3 * (eval x (radS a b) * cutH vs z (eval x (radU a b)))
      - cutH vs z (eval x (radU a b))
      - eval x (radU a b) * cutH' vs z (eval x (radU a b))) (stdGaussian d) := j30.sub i2
  have j4 : Integrable (fun x => 2 / 3 * (eval x (radT a b) * cutH' vs z (eval x (radU a b))))
      (stdGaussian d) := i4.const_mul _
  rw [eL, eR, integral_sub i10 i2, integral_sub i1 i0, integral_add j302 j4,
    integral_sub j30 i2, integral_sub j3 i0, integral_const_mul, integral_const_mul]
  linarith

/-- **The Stein inputs of cubic Gaussian chaos.**  For `a`, `b` in the third chaos with
`E a² = E b² = 1/2` and `E ab = 0` (the real and imaginary parts of a normalized `q` of bidegree
`(2,1)`), the law of `U = a² + b²` under the standard Gaussian measure has the two analytic inputs
of the Stein cuts, with `v = w − 1` and `r` as above: the fluctuation bound and the integration by
parts. -/
theorem gaussian_steinInputs (a b : MvPolynomial (Fin d) ℝ) (ha : Chaos3 a) (hb : Chaos3 b)
    (haa : ∫ x, eval x a ^ 2 ∂(stdGaussian d) = 1 / 2)
    (hbb : ∫ x, eval x b ^ 2 ∂(stdGaussian d) = 1 / 2)
    (hab : ∫ x, eval x a * eval x b ∂(stdGaussian d) = 0) :
    SteinInputs (stdGaussian d) fun x => eval x (radU a b) := by
  have hE := gaussE_isGaussianExpectation d
  have haa' : gaussE d (a * a) = 1 / 2 := by
    rw [gaussE_apply, ← haa]
    exact integral_congr_ae (Filter.Eventually.of_forall fun x => by simp only [map_mul]; ring)
  have hbb' : gaussE d (b * b) = 1 / 2 := by
    rw [gaussE_apply, ← hbb]
    exact integral_congr_ae (Filter.Eventually.of_forall fun x => by simp only [map_mul]; ring)
  have hab' : gaussE d (a * b) = 0 := by
    rw [gaussE_apply, ← hab]
    exact integral_congr_ae (Filter.Eventually.of_forall fun x => by simp only [map_mul])
  have hmean := fluctuation_mean hE ha hb haa' hbb'
  have hbound := fluctuation_bound hE gaussE_mul_self_nonneg ha hb haa' hbb' hab'
  simp only [gaussE_apply] at hmean hbound
  have hv : MemLp (fun x => eval x (radS a b) / 3 - 1) 2 (stdGaussian d) := by
    refine (memLp_congr_ae (Filter.Eventually.of_forall fun x => ?_)).1
      (memLp_eval (C (1 / 3 : ℝ) * radS a b - 1))
    simp only [map_sub, map_mul, eval_C, map_one]; ring
  have hv0 : ∫ x, (eval x (radS a b) / 3 - 1) ∂(stdGaussian d) = 0 := by
    rw [integral_sub ((integrable_eval _).div_const 3) (integrable_const _), integral_div, hmean,
      integral_const, probReal_univ]
    norm_num
  have e1 : ∫ x, (eval x (radS a b) / 3 - 1) ^ 2 ∂(stdGaussian d)
      = 1 / 9 * ∫ x, eval x ((radS a b - 3) * (radS a b - 3)) ∂(stdGaussian d) := by
    rw [← integral_const_mul]
    exact integral_congr_ae (Filter.Eventually.of_forall fun x => by
      simp only [map_mul, map_sub, map_ofNat]; ring)
  have e2 : ∫ x, radR a b x ^ 2 ∂(stdGaussian d)
      ≤ 1 / 9 * (∫ x, eval x (radA a b * radA a b) ∂(stdGaussian d)
        + ∫ x, eval x (radB a b * radB a b) ∂(stdGaussian d)) := by
    rw [← integral_add (integrable_eval _) (integrable_eval _), ← integral_const_mul]
    refine integral_mono (memLp_radR a b).integrable_sq
      (((integrable_eval _).add (integrable_eval _)).const_mul _) fun x => ?_
    have h := radR_sq_le a b x
    simp only [map_mul]
    linarith
  have e3 : ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d)
      = ∫ x, eval x (radU a b * radU a b) ∂(stdGaussian d) :=
    integral_congr_ae (Filter.Eventually.of_forall fun x => by simp only [map_mul]; ring)
  refine ⟨⟨_, radR a b, hv, memLp_radR a b, hv0, ?_, fun vs z h =>
    radial_cut a b ha.eig hb.eig vs z h⟩⟩
  rw [e1, e3]
  linarith

end Grothe.LowerAnalytic
