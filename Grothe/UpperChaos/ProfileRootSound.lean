import Grothe.UpperChaos.ProfileRootScreen
import Grothe.UpperChaos.ProfileRootNormalization
import Mathlib.Algebra.BigOperators.Intervals
import Mathlib.Data.Nat.Choose.Sum

/-! Sound root cover for the actual tracked profile.

The exact arithmetic screen is connected to `sqrt (1 + aQ^2) * vprof` through
normalization, Laguerre coefficients, and centered Horner evaluation. The final
theorems bound the profile on the three root neighborhoods and separate it from
zero elsewhere in `[0,80]`; no numerical enclosure is left as a hypothesis.
Agent-ID: codex-b7f2.
-/

namespace Grothe.UpperChaos.ProfileRootScreen
open GrotheKernel GrotheKernel.HardyArc

/-- Each generated gamma interval contains the actual normalization factor. -/
theorem actual_gamma_mem (j : ℕ) (hj : j < 12) :
    Grothe.Upper.mem (gammaFactor j) (gammas.getD j zeroI) := by
  have hc := gamma_checked j hj
  simp only [gammaSQOK, decide_eq_true_eq] at hc
  let g := gammas.getD j zeroI
  let L : ℝ := (g.lo : ℝ) / (D : ℝ)
  let U : ℝ := (g.hi : ℝ) / (D : ℝ)
  have hL : 0 ≤ L := by
    dsimp [L, g]
    exact_mod_cast hc.1.le
  have hLU : L ≤ U := by
    dsimp [L, U, g]
    exact_mod_cast hc.2.1
  have hU : 0 ≤ U := hL.trans hLU
  have hLower : L ^ 2 * ((sqrtPiHi : ℝ) * normalizationRatio j) ≤
      1 + (Grothe.Upper.aQ : ℝ) ^ 2 := by
    have h : L ^ 2 * (sqrtPiHi : ℝ) * normalizationRatio j ≤
        1 + (Grothe.Upper.aQ : ℝ) ^ 2 := by
      dsimp [L, g, normalizationRatio]
      have hcast : (((((gammas.getD j zeroI).lo : ℚ) / (D : ℚ)) ^ 2 * sqrtPiHi *
          (((2*j).factorial : ℚ) / (4^j * (j.factorial : ℚ)^2)) : ℚ) : ℝ) ≤
          ((1 + Grothe.Upper.aQ^2 : ℚ) : ℝ) := Rat.cast_le.mpr hc.2.2.1
      simpa only [Rat.cast_mul, Rat.cast_div, Rat.cast_pow, Rat.cast_intCast,
        Rat.cast_natCast, Rat.cast_add, Rat.cast_one, Rat.cast_ofNat] using hcast
    simpa only [mul_assoc] using h
  have hUpper : 1 + (Grothe.Upper.aQ : ℝ) ^ 2 ≤
      U ^ 2 * ((sqrtPiLo : ℝ) * normalizationRatio j) := by
    have h : 1 + (Grothe.Upper.aQ : ℝ) ^ 2 ≤
        U ^ 2 * (sqrtPiLo : ℝ) * normalizationRatio j := by
      dsimp [U, g, normalizationRatio]
      have hcast : ((1 + Grothe.Upper.aQ^2 : ℚ) : ℝ) ≤
          (((((gammas.getD j zeroI).hi : ℚ) / (D : ℚ)) ^ 2 * sqrtPiLo *
            (((2*j).factorial : ℚ) / (4^j * (j.factorial : ℚ)^2)) : ℚ) : ℝ) :=
        Rat.cast_le.mpr hc.2.2.2
      simpa only [Rat.cast_mul, Rat.cast_div, Rat.cast_pow, Rat.cast_intCast,
        Rat.cast_natCast, Rat.cast_add, Rat.cast_one, Rat.cast_ofNat] using hcast
    simpa only [mul_assoc] using h
  have hb := gammaFactor_bounds j L U (sqrtPiLo : ℝ) (sqrtPiHi : ℝ)
    hL hU sqrtPi_real_bounds.1 sqrtPi_real_bounds.2 hLower hUpper
  have hD : 0 < (D : ℝ) := Grothe.Upper.D_pos
  change (g.lo : ℝ) ≤ gammaFactor j * D ∧ gammaFactor j * D ≤ (g.hi : ℝ)
  constructor
  · have h := mul_le_mul_of_nonneg_right hb.1 hD.le
    dsimp [L] at h
    have hcancel : (g.lo : ℝ) / D * D = (g.lo : ℝ) := by field_simp [ne_of_gt hD]
    simpa only [hcancel] using h
  · have h := mul_le_mul_of_nonneg_right hb.2 hD.le
    dsimp [U] at h
    have hcancel : (g.hi : ℝ) / D * D = (g.hi : ℝ) := by field_simp [ne_of_gt hD]
    simpa only [hcancel] using h

/-! Interval-sound finite sums used by the centered profile checker. -/

open GrotheKernel Grothe.Upper

/-- Folding outward interval addition encloses the corresponding exact sum. -/
theorem mem_foldl_sum {α : Type*} (xs : List α) (f : α → ℝ) (F : α → Ival)
    (hF : ∀ x ∈ xs, mem (f x) (F x)) (a : ℝ) (A : Ival) (ha : mem a A) :
    mem (a + (xs.map f).sum) (xs.foldl (fun acc x => addI acc (F x)) A) := by
  induction xs generalizing a A with
  | nil => simpa using ha
  | cons x xs ih =>
    have hx : mem (f x) (F x) := hF x (by simp)
    have hxs : ∀ y ∈ xs, mem (f y) (F y) := by
      intro y hy
      exact hF y (by simp [hy])
    have ht := ih hxs (a + f x) (addI A (F x)) (mem_add ha hx)
    simpa [List.foldl, List.map, List.sum_cons, add_assoc] using ht

/-- The list and finite-set presentations of an initial segment have the same sum. -/
theorem list_range_sum (n : ℕ) (f : ℕ → ℝ) :
    ((List.range n).map f).sum = ∑ i ∈ Finset.range n, f i := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [List.range_succ, List.map_append, List.sum_append, Finset.sum_range_succ]
    simp [ih]

/-- Each actual profile coefficient is in its computed interval. -/
theorem actual_coeff_mem_computed (k : ℕ) (hk : k < 12) :
    Grothe.Upper.mem
      (∑ i ∈ Finset.range (12-k), gammaFactor (k+i) *
        ((Grothe.Upper.profileQ.getD (k+i) 0 * lagCoeffQ (k+i) k : ℚ) : ℝ))
      (computedCoeff k) := by
  let f : ℕ → ℝ := fun i => gammaFactor (k+i) *
    ((Grothe.Upper.profileQ.getD (k+i) 0 * lagCoeffQ (k+i) k : ℚ) : ℝ)
  let F : ℕ → Ival := fun i => mulI (gammas.getD (k+i) zeroI)
    (ofRatI (Grothe.Upper.profileQ.getD (k+i) 0 * lagCoeffQ (k+i) k))
  have hF : ∀ i ∈ List.range (12-k), Grothe.Upper.mem (f i) (F i) := by
    intro i hi
    have hki : k+i < 12 := by
      have := List.mem_range.mp hi
      omega
    exact Grothe.Upper.mem_mul (actual_gamma_mem (k+i) hki)
      (Grothe.Upper.mem_ofRatI _)
  have h := mem_foldl_sum (List.range (12-k)) f F hF 0 zeroI Grothe.Upper.mem_zero
  simpa [computedCoeff, f, F, list_range_sum] using h

/-- The checked outer interval contains each actual profile coefficient. -/
theorem actual_coeff_mem (k : ℕ) (hk : k < 12) :
    Grothe.Upper.mem
      (∑ i ∈ Finset.range (12-k), gammaFactor (k+i) *
        ((Grothe.Upper.profileQ.getD (k+i) 0 * lagCoeffQ (k+i) k : ℚ) : ℝ))
      (coeffs.getD k zeroI) := by
  have hc := coeff_checked k hk
  simp only [coeffOK, decide_eq_true_eq] at hc
  have hm := actual_coeff_mem_computed k hk
  unfold Grothe.Upper.mem at hm ⊢
  have hlo : ((coeffs.getD k zeroI).lo : ℝ) ≤ ((computedCoeff k).lo : ℝ) := by
    exact_mod_cast hc.1
  have hhi : ((computedCoeff k).hi : ℝ) ≤ ((coeffs.getD k zeroI).hi : ℝ) := by
    exact_mod_cast hc.2
  exact ⟨hlo.trans hm.1, hm.2.trans hhi⟩

/-- Exact coefficient of the actual radial profile polynomial. -/
noncomputable def profileCoeffR (k : ℕ) : ℝ :=
  ∑ i ∈ Finset.range (12-k), gammaFactor (k+i) *
    ((Grothe.Upper.profileQ.getD (k+i) 0 * lagCoeffQ (k+i) k : ℚ) : ℝ)

theorem mem_powI (c : ℚ) (n : ℕ) :
    Grothe.Upper.mem ((c : ℝ)^n) (powI (ofRatI c) n) := by
  induction n with
  | zero => simpa [powI] using Grothe.UpperChaos.HardyArcSound.mem_intI 1
  | succ n ih =>
    simpa [powI, pow_succ] using Grothe.Upper.mem_mul ih (Grothe.Upper.mem_ofRatI c)

/-- Exact shifted profile coefficients lie in the generated centered intervals. -/
theorem actual_shiftedCoeff_mem (c : ℚ) (j : ℕ) (hj : j < 12) :
    Grothe.Upper.mem
      (∑ i ∈ Finset.range (12-j), profileCoeffR (j+i) *
        ((Nat.choose (j+i) j : ℕ) : ℝ) * (c : ℝ)^i)
      (shiftedCoeff c j) := by
  let f : ℕ → ℝ := fun i => profileCoeffR (j+i) *
    ((Nat.choose (j+i) j : ℕ) : ℝ) * (c : ℝ)^i
  let F : ℕ → Ival := fun i =>
    mulI (mulI (coeffs.getD (j+i) zeroI) (intI (Nat.choose (j+i) j)))
      (powI (ofRatI c) i)
  have hF : ∀ i ∈ List.range (12-j), Grothe.Upper.mem (f i) (F i) := by
    intro i hi
    have hji : j+i < 12 := by have := List.mem_range.mp hi; omega
    have hc : Grothe.Upper.mem (profileCoeffR (j+i)) (coeffs.getD (j+i) zeroI) := by
      exact actual_coeff_mem (j+i) hji
    have hchoose : Grothe.Upper.mem (((Nat.choose (j+i) j : ℕ) : ℝ))
        (intI (Nat.choose (j+i) j)) := by
      simpa using Grothe.UpperChaos.HardyArcSound.mem_intI (Nat.choose (j+i) j)
    exact Grothe.Upper.mem_mul (Grothe.Upper.mem_mul hc hchoose) (mem_powI c i)
  have h := mem_foldl_sum (List.range (12-j)) f F hF 0 zeroI Grothe.Upper.mem_zero
  simpa [shiftedCoeff, f, F, list_range_sum] using h

noncomputable def shiftedExact (c : ℚ) (j : ℕ) : ℝ :=
  ∑ i ∈ Finset.range (12-j), profileCoeffR (j+i) *
    ((Nat.choose (j+i) j : ℕ) : ℝ) * (c : ℝ)^i

/-- Each coefficient of the exact centered polynomial is interval-enclosed. -/
theorem shiftedCoeffs_sound (c : ℚ) :
    List.Forall₂ Grothe.Upper.mem
      ((List.range 12).map (shiftedExact c))
      ((List.range 12).map (shiftedCoeff c)) := by
  rw [List.forall₂_map_left_iff, List.forall₂_map_right_iff, List.forall₂_same]
  intro j hj
  exact actual_shiftedCoeff_mem c j (List.mem_range.mp hj)

/-- A point in a row lies in its centered offset interval. -/
theorem rowOffset_mem (r : Row) (s : ℝ)
    (hlo : (r.lo : ℝ) ≤ s) (hhi : s ≤ (r.hi : ℝ)) :
    Grothe.Upper.mem (s - (((r.lo+r.hi)/2 : ℚ) : ℝ)) (rowOffset r) := by
  let c : ℚ := (r.lo+r.hi)/2
  let d : ℚ := (r.hi-r.lo)/2
  have hleft : ((-d : ℚ) : ℝ) ≤ s - (c : ℝ) := by
    dsimp [c,d]
    push_cast
    linarith
  have hright : s - (c : ℝ) ≤ (d : ℝ) := by
    dsimp [c,d]
    push_cast
    linarith
  change (ofRatLo (-d) : ℝ) ≤ (s - (c : ℝ)) * D ∧
    (s - (c : ℝ)) * D ≤ (ofRatHi d : ℝ)
  exact ⟨(Grothe.Upper.ofRatLo_le (-d)).trans
      (mul_le_mul_of_nonneg_right hleft Grothe.Upper.D_pos.le),
    (mul_le_mul_of_nonneg_right hright Grothe.Upper.D_pos.le).trans
      (Grothe.Upper.le_ofRatHi d)⟩


/-! Rational coefficient identity for the actual generalized Laguerre profile. -/

open Finset

/-- The generated rational coefficient is exactly the real Laguerre coefficient. -/
theorem lagCoeffQ_cast (j k : ℕ) :
    (lagCoeffQ j k : ℝ) = (-1 : ℝ) ^ k * binHalf j k / (k.factorial : ℝ) := by
  have hprod :
      (((∏ i ∈ range (j - k),
        (((2 * k + 1 + 2 * i : ℕ) : ℚ) / (2 * ((i + 1 : ℕ) : ℚ)))) : ℚ) : ℝ) =
      binHalf j k := by
    simp only [binHalf, Rat.cast_prod]
    apply Finset.prod_congr rfl
    intro i hi
    push_cast
    have hi1 : ((i : ℝ) + 1) ≠ 0 := by positivity
    field_simp [hi1]
  unfold lagCoeffQ
  rw [Rat.cast_div, Rat.cast_mul, Rat.cast_pow, hprod]
  norm_num

/-- The actual real Laguerre polynomial has the generated rational coefficients. -/
theorem lagHalf_eq_coeffQ (j : ℕ) (s : ℝ) :
    lagHalf j s = ∑ k ∈ range (j + 1), (lagCoeffQ j k : ℝ) * s ^ k := by
  unfold lagHalf
  apply Finset.sum_congr rfl
  intro k hk
  rw [lagCoeffQ_cast]
  ring


/-- Reindex a triangular polynomial expansion by monomial degree. -/
theorem triangular_sum (n : ℕ) (f : ℕ → ℕ → ℝ) :
    (∑ j ∈ Finset.range n, ∑ k ∈ Finset.range (j + 1), f j k) =
      ∑ k ∈ Finset.range n, ∑ i ∈ Finset.range (n - k), f (k + i) k := by
  calc
    _ = ∑ k ∈ Finset.range n, ∑ j ∈ Finset.Ico k n, f j k := by
      simpa only [Nat.Ico_zero_eq_range] using
        (Finset.sum_Ico_Ico_comm 0 n (fun k j => f j k)).symm
    _ = _ := by
      apply Finset.sum_congr rfl
      intro k hk
      exact Finset.sum_Ico_eq_sum_range (fun j => f j k) k n

/-- The actual radial factor has the generated coefficient formula. -/
theorem profile_eq_triangular_expansion (s : ℝ) :
    Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof s =
      ∑ j ∈ Finset.range 12, ∑ k ∈ Finset.range (j + 1),
        (Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) / nrmHalf j) *
          ((Grothe.Upper.profileQ.getD j 0 * lagCoeffQ j k : ℚ) : ℝ) * s ^ k := by
  have hlen : Grothe.Upper.profileQ.length = 12 := by decide
  unfold vprof
  rw [hlen, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro j hj
  rw [lagHalf_eq_coeffQ, Finset.mul_sum]
  rw [Finset.sum_div, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro k hk
  push_cast
  ring

/-- Grouping the triangular expression yields the 12 monomial coefficients. -/
theorem profile_eq_coeff_expansion (s : ℝ) :
    Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof s =
      ∑ k ∈ Finset.range 12,
        (∑ i ∈ Finset.range (12 - k),
          (Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) / nrmHalf (k + i)) *
            ((Grothe.Upper.profileQ.getD (k + i) 0 * lagCoeffQ (k + i) k : ℚ) : ℝ)) * s ^ k := by
  rw [profile_eq_triangular_expansion, triangular_sum]
  apply Finset.sum_congr rfl
  intro k hk
  rw [Finset.sum_mul]


/-- Binomial shift of any finite polynomial power sum. -/
theorem shifted_sum (n : ℕ) (a : ℕ → ℝ) (c x : ℝ) :
    (∑ k ∈ Finset.range n, a k * (c + x) ^ k) =
      ∑ j ∈ Finset.range n,
        (∑ i ∈ Finset.range (n - j),
          a (j+i) * ((Nat.choose (j+i) j : ℕ) : ℝ) * c ^ i) * x ^ j := by
  calc
    _ = ∑ k ∈ Finset.range n, ∑ j ∈ Finset.range (k + 1),
        (a k * (Nat.choose k j : ℝ) * c ^ (k-j)) * x ^ j := by
      apply Finset.sum_congr rfl
      intro k hk
      rw [add_comm c x, add_pow, Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro j hj
      ring
    _ = ∑ j ∈ Finset.range n, ∑ i ∈ Finset.range (n-j),
        (a (j+i) * (Nat.choose (j+i) j : ℝ) * c ^ ((j+i)-j)) * x ^ j :=
      triangular_sum n _
    _ = _ := by
      simp only [Nat.add_sub_cancel_left, Finset.sum_mul]

/-- Twelve-term real Horner evaluation agrees with the power sum. -/
theorem hornerR_twelve (a : ℕ → ℝ) (x : ℝ) :
    (Grothe.UpperChaos.HardyArcSound.hornerR (x : ℂ) ((List.range 12).map a)).re =
      ∑ j ∈ Finset.range 12, a j * x^j := by
  norm_num [Grothe.UpperChaos.HardyArcSound.hornerR, List.range_succ,
    Finset.sum_range_succ, Complex.add_re, Complex.mul_re]; ring

/-- Centered Horner evaluation equals the actual radial profile. -/
theorem centered_horner_profile (c : ℚ) (s : ℝ) :
    (Grothe.UpperChaos.HardyArcSound.hornerR
      ((s-(c : ℝ)) : ℂ) ((List.range 12).map (shiftedExact c))).re =
      Real.sqrt (1 + (Grothe.Upper.aQ : ℝ)^2) * vprof s := by
  have hp : Real.sqrt (1 + (Grothe.Upper.aQ : ℝ)^2) * vprof s =
      ∑ k ∈ Finset.range 12, profileCoeffR k * s^k := by
    simpa [profileCoeffR, gammaFactor] using profile_eq_coeff_expansion s
  rw [← Complex.ofReal_sub, hornerR_twelve]
  have hshift := shifted_sum 12 profileCoeffR (c : ℝ) (s-(c : ℝ))
  have hc : (c : ℝ) + (s-(c : ℝ)) = s := by ring
  rw [hc] at hshift
  simpa [shiftedExact] using hshift.symm.trans hp.symm

/-- The checked Horner interval encloses the exact centered polynomial. -/
theorem row_horner_mem (r : Row) (s : ℝ)
    (hlo : (r.lo : ℝ) ≤ s) (hhi : s ≤ (r.hi : ℝ)) :
    Grothe.Upper.mem
      (Grothe.UpperChaos.HardyArcSound.hornerR
        ((s - (((r.lo+r.hi)/2 : ℚ) : ℝ)) : ℂ)
        ((List.range 12).map (shiftedExact ((r.lo+r.hi)/2)))).re (evalRow r) := by
  have hx := Grothe.UpperChaos.HardyArcSound.memC_ofR (rowOffset_mem r s hlo hhi)
  have h := Grothe.UpperChaos.HardyArcSound.memC_horner hx
    (shiftedCoeffs_sound ((r.lo+r.hi)/2))
  simpa [evalRow] using h.1

/-- Any checked inner row bounds its exact centered polynomial by 1/5. -/
theorem inner_row_bound (r : Row) (s : ℝ) (hr : r ∈ rows) (hin : r.inner = true)
    (hlo : (r.lo : ℝ) ≤ s) (hhi : s ≤ (r.hi : ℝ)) :
    |(Grothe.UpperChaos.HardyArcSound.hornerR
      ((s - (((r.lo+r.hi)/2 : ℚ) : ℝ)) : ℂ)
      ((List.range 12).map (shiftedExact ((r.lo+r.hi)/2)))).re| < 1/5 := by
  let y : ℝ := (Grothe.UpperChaos.HardyArcSound.hornerR
    ((s - (((r.lo+r.hi)/2 : ℚ) : ℝ)) : ℂ)
    ((List.range 12).map (shiftedExact ((r.lo+r.hi)/2)))).re
  have hm : Grothe.Upper.mem y (evalRow r) := row_horner_mem r s hlo hhi
  have hc := row_checked r hr
  simp [rowOK, hin] at hc
  have hlow : -(D : ℝ) < 5 * ((evalRow r).lo : ℝ) := by exact_mod_cast hc.1
  have hhigh : 5 * ((evalRow r).hi : ℝ) < (D : ℝ) := by exact_mod_cast hc.2
  have hD : 0 < (D : ℝ) := Grothe.Upper.D_pos
  unfold Grothe.Upper.mem at hm
  apply abs_lt.mpr
  constructor
  · by_contra h
    have ht : (5*y+1) * D ≤ 0 :=
      mul_nonpos_of_nonpos_of_nonneg (by linarith) hD.le
    nlinarith [hm.1]
  · by_contra h
    have ht : (1-5*y) * D ≤ 0 :=
      mul_nonpos_of_nonpos_of_nonneg (by linarith) hD.le
    nlinarith [hm.2]

/-- Any checked outer row separates its exact centered polynomial from zero. -/
theorem outer_row_bound (r : Row) (s : ℝ) (hr : r ∈ rows) (hout : r.inner = false)
    (hlo : (r.lo : ℝ) ≤ s) (hhi : s ≤ (r.hi : ℝ)) :
    (1/1000 : ℝ) < |(Grothe.UpperChaos.HardyArcSound.hornerR
      ((s - (((r.lo+r.hi)/2 : ℚ) : ℝ)) : ℂ)
      ((List.range 12).map (shiftedExact ((r.lo+r.hi)/2)))).re| := by
  let y : ℝ := (Grothe.UpperChaos.HardyArcSound.hornerR
    ((s - (((r.lo+r.hi)/2 : ℚ) : ℝ)) : ℂ)
    ((List.range 12).map (shiftedExact ((r.lo+r.hi)/2)))).re
  have hm : Grothe.Upper.mem y (evalRow r) := row_horner_mem r s hlo hhi
  have hc := row_checked r hr
  simp [rowOK, hout] at hc
  have hD : 0 < (D : ℝ) := Grothe.Upper.D_pos
  unfold Grothe.Upper.mem at hm
  rcases hc with hp | hn
  · have hpR : (D : ℝ) < 1000 * ((evalRow r).lo : ℝ) := by exact_mod_cast hp
    have hy : (1/1000 : ℝ) < y := by
      by_contra h
      have ht : (1000*y-1) * D ≤ 0 :=
        mul_nonpos_of_nonpos_of_nonneg (by linarith) hD.le
      nlinarith [hm.1]
    exact hy.trans_le (le_abs_self y)
  · have hnR : 1000 * ((evalRow r).hi : ℝ) < -(D : ℝ) := by exact_mod_cast hn
    have hy : y < (-1/1000 : ℝ) := by
      by_contra h
      have ht : (1000*y+1) * D ≥ 0 :=
        mul_nonneg (by linarith) hD.le
      nlinarith [hm.2]
    have : (1/1000 : ℝ) < -y := by linarith
    exact this.trans_le (neg_le_abs y)

/-- A checked inner row bounds the actual profile. -/
theorem inner_row_profile (r : Row) (s : ℝ) (hr : r ∈ rows) (hin : r.inner = true)
    (hlo : (r.lo : ℝ) ≤ s) (hhi : s ≤ (r.hi : ℝ)) :
    |Real.sqrt (1 + (Grothe.Upper.aQ : ℝ)^2) * vprof s| < 1/5 := by
  simpa only [centered_horner_profile] using inner_row_bound r s hr hin hlo hhi

/-- A checked outer row separates the actual profile from zero. -/
theorem outer_row_profile (r : Row) (s : ℝ) (hr : r ∈ rows) (hout : r.inner = false)
    (hlo : (r.lo : ℝ) ≤ s) (hhi : s ≤ (r.hi : ℝ)) :
    (1/1000 : ℝ) < |Real.sqrt (1 + (Grothe.Upper.aQ : ℝ)^2) * vprof s| := by
  simpa only [centered_horner_profile] using outer_row_bound r s hr hout hlo hhi

/-- Check that the rows cover an interval, allowing overlapping rows. -/
def coverCheck (a b : ℚ) : List Row → Bool
  | [] => false
  | r :: rs => decide (r.lo ≤ a) &&
      (decide (b ≤ r.hi) || coverCheck r.hi b rs)

/-- A checked row list covers every real point of the requested interval. -/
theorem coverCheck_sound (rs : List Row) :
    ∀ (a b : ℚ) (s : ℝ), coverCheck a b rs = true →
      (a : ℝ) ≤ s → s ≤ (b : ℝ) →
      ∃ r ∈ rs, (r.lo : ℝ) ≤ s ∧ s ≤ (r.hi : ℝ) := by
  induction rs with
  | nil =>
      intro a b s hc
      simp only [coverCheck, Bool.false_eq_true] at hc
  | cons r rs ih =>
      intro a b s hc ha hb
      simp only [coverCheck, Bool.and_eq_true, Bool.or_eq_true,
        decide_eq_true_eq] at hc
      have hlo : (r.lo : ℝ) ≤ (a : ℝ) := Rat.cast_le.mpr hc.1
      by_cases hs : s ≤ (r.hi : ℝ)
      · exact ⟨r, List.mem_cons_self .., hlo.trans ha, hs⟩
      · have hnext : coverCheck r.hi b rs = true := by
          rcases hc.2 with hstop | hnext
          · have hstopR : (b : ℝ) ≤ (r.hi : ℝ) := Rat.cast_le.mpr hstop
            exact False.elim (hs (hb.trans hstopR))
          · exact hnext
        obtain ⟨r', hr', hlo', hhi'⟩ :=
          ih r.hi b s hnext (le_of_lt (lt_of_not_ge hs)) hb
        exact ⟨r', List.mem_cons_of_mem r hr', hlo', hhi'⟩

theorem rowsCoverChecked : coverCheck 0 80 rows = true := by
  decide +kernel

theorem rows_cover (s : ℝ) (h0 : 0 ≤ s) (h80 : s ≤ 80) :
    ∃ r ∈ rows, (r.lo : ℝ) ≤ s ∧ s ≤ (r.hi : ℝ) := by
  exact coverCheck_sound rows 0 80 s rowsCoverChecked
    (by simpa using h0) (by simpa using h80)

def InRootNeighborhood (s : ℝ) : Prop :=
  (12 ≤ s ∧ s ≤ 15) ∨ ((83/4 : ℝ) ≤ s ∧ s ≤ 522/25) ∨
    ((126/5 : ℝ) ≤ s ∧ s ≤ 2521/100)

def rootRows (a b : ℚ) : List Row :=
  rows.filter (fun r => r.inner && rowIn r a b)

theorem rootRows_cover (a b : ℚ)
    (hc : coverCheck a b (rootRows a b) = true)
    (s : ℝ) (ha : (a : ℝ) ≤ s) (hb : s ≤ (b : ℝ)) :
    ∃ r ∈ rows, r.inner = true ∧ (r.lo : ℝ) ≤ s ∧ s ≤ (r.hi : ℝ) := by
  obtain ⟨r, hr, hlo, hhi⟩ := coverCheck_sound (rootRows a b) a b s hc ha hb
  have hm : r ∈ rows ∧ (r.inner && rowIn r a b) = true :=
    List.mem_filter.mp hr
  exact ⟨r, hm.1, (Bool.and_eq_true_iff.mp hm.2).1, hlo, hhi⟩

theorem firstRootCover : coverCheck 12 15 (rootRows 12 15) = true := by
  decide +kernel

theorem secondRootCover :
    coverCheck (83/4) (522/25) (rootRows (83/4) (522/25)) = true := by
  decide +kernel

theorem thirdRootCover :
    coverCheck (126/5) (2521/100) (rootRows (126/5) (2521/100)) = true := by
  decide +kernel

theorem inner_rows_cover (s : ℝ) (hs : InRootNeighborhood s) :
    ∃ r ∈ rows, r.inner = true ∧ (r.lo : ℝ) ≤ s ∧ s ≤ (r.hi : ℝ) := by
  rcases hs with ⟨hlo, hhi⟩ | ⟨hlo, hhi⟩ | ⟨hlo, hhi⟩
  · exact rootRows_cover 12 15 firstRootCover s
      (by simpa only [Rat.cast_ofNat] using hlo)
      (by simpa only [Rat.cast_ofNat] using hhi)
  · exact rootRows_cover (83/4) (522/25) secondRootCover s
      (by simpa only [Rat.cast_div, Rat.cast_ofNat] using hlo)
      (by simpa only [Rat.cast_div, Rat.cast_ofNat] using hhi)
  · exact rootRows_cover (126/5) (2521/100) thirdRootCover s
      (by simpa only [Rat.cast_div, Rat.cast_ofNat] using hlo)
      (by simpa only [Rat.cast_div, Rat.cast_ofNat] using hhi)

/-- Each inner-tagged row is contained in a root neighborhood. -/
theorem inner_row_contained (r : Row) (s : ℝ) (hr : r ∈ rows)
    (hin : r.inner = true) (hlo : (r.lo : ℝ) ≤ s) (hhi : s ≤ (r.hi : ℝ)) :
    InRootNeighborhood s := by
  have h := (List.all_eq_true.mp allRegionsOK) r hr
  simp only [rowRegionOK, hin, ite_true, Bool.and_eq_true, Bool.or_eq_true,
    rowIn, decide_eq_true_eq] at h
  rcases h.2 with (h | h) | h
  · left
    have h1 : (12 : ℝ) ≤ r.lo := by exact_mod_cast h.1
    have h2 : (r.hi : ℝ) ≤ 15 := by exact_mod_cast h.2
    exact ⟨h1.trans hlo, hhi.trans h2⟩
  · right; left
    have h1 : (83/4 : ℝ) ≤ r.lo := by
      simpa only [Rat.cast_div, Rat.cast_ofNat] using
        (Rat.cast_le.mpr h.1 : ((83/4 : ℚ) : ℝ) ≤ (r.lo : ℝ))
    have h2 : (r.hi : ℝ) ≤ 522/25 := by
      simpa only [Rat.cast_div, Rat.cast_ofNat] using
        (Rat.cast_le.mpr h.2 : (r.hi : ℝ) ≤ ((522/25 : ℚ) : ℝ))
    exact ⟨h1.trans hlo, hhi.trans h2⟩
  · right; right
    have h1 : (126/5 : ℝ) ≤ r.lo := by
      simpa only [Rat.cast_div, Rat.cast_ofNat] using
        (Rat.cast_le.mpr h.1 : ((126/5 : ℚ) : ℝ) ≤ (r.lo : ℝ))
    have h2 : (r.hi : ℝ) ≤ 2521/100 := by
      simpa only [Rat.cast_div, Rat.cast_ofNat] using
        (Rat.cast_le.mpr h.2 : (r.hi : ℝ) ≤ ((2521/100 : ℚ) : ℝ))
    exact ⟨h1.trans hlo, hhi.trans h2⟩

/-- The actual profile is separated from zero off the root neighborhoods. -/
theorem profile_outer (s : ℝ) (h0 : 0 ≤ s) (h80 : s ≤ 80)
    (hout : ¬ InRootNeighborhood s) :
    (1/1000 : ℝ) < |Real.sqrt (1 + (Grothe.Upper.aQ : ℝ)^2) * vprof s| := by
  obtain ⟨r, hr, hlo, hhi⟩ := rows_cover s h0 h80
  have hb : r.inner = false := by
    cases he : r.inner with
    | false => rfl
    | true => exact False.elim (hout (inner_row_contained r s hr he hlo hhi))
  exact outer_row_profile r s hr hb hlo hhi

/-- The actual profile is bounded throughout the root neighborhoods. -/
theorem profile_inner (s : ℝ) (hs : InRootNeighborhood s) :
    |Real.sqrt (1 + (Grothe.Upper.aQ : ℝ)^2) * vprof s| < 1/5 := by
  obtain ⟨r, hr, hin, hlo, hhi⟩ := inner_rows_cover s hs
  exact inner_row_profile r s hr hin hlo hhi


end Grothe.UpperChaos.ProfileRootScreen
