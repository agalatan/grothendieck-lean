import Grothe.UpperQuad.QuadEllipseCheck
import Grothe.UpperQuad.IntervalSound
import Grothe.UpperQuad.ProfileSound
import Grothe.UpperQuad.PiSound
import Grothe.UpperQuad.QuadDiskBound

/-!
# Soundness of the ellipse checker, part 1: the interval primitives

Every executable step of `QuadEllipseCheck` encloses its real counterpart: the rationals (`qI`),
the guarded division (`dv`), binary powers (`powB`), the exponential upper bound (`expUp`), the
off-axis series (`ySeries`), the Horner sum, and the profile coefficients `ĉ_k = π^{1/4} v_k`
(`mem_chatI`), their Taylor coefficients (`mem_taylorI`) and the deviation (`devI`).

Agent-ID: claude-b9ee. Refs #303.
-/

namespace Grothe.UpperQuad.EllCheck

open GrotheQuad Grothe.UpperQuad Grothe.UpperChaos Grothe.UpperQuad.QuadRem

lemma hP : 1 ≤ P := by decide

lemma mem_qI (q : ℚ) : mem (q : ℝ) (qI q) := by
  unfold qI
  have := mem_ratI P hP q.num q.den_pos
  rwa [Rat.cast_def]

lemma mem_dv {x y : ℝ} {a b r : Ival} (hx : mem x a) (hy : mem y b) (h : dv a b = some r) :
    mem (x / y) r ∧ 0 < y := by
  unfold dv at h
  split_ifs at h with hb
  · simp only [Option.some.injEq] at h
    subst h
    exact ⟨mem_divI P hx hy (lo_pos_of_isPos hb), pos_of_isPos hb hy⟩

lemma guard'_eq {b : Bool} (h : guard' b = some ()) : b = true := by
  unfold guard' at h; split_ifs at h with hb; exact hb

lemma mem_powB {x : ℝ} {a : Ival} (hx : mem x a) (n : ℕ) : mem (x ^ n) (powB a n) := by
  induction n using Nat.strong_induction_on with
  | _ n ih =>
    cases n with
    | zero => unfold powB; simpa using mem_ofInt P 1
    | succ n =>
      unfold powB
      have hk := ih ((n + 1) / 2) (by omega)
      simp only
      split_ifs with he
      · have h2 : n + 1 = (n + 1) / 2 + (n + 1) / 2 := by
          have := Nat.mod_two_eq_zero_or_one (n + 1)
          simp only [beq_iff_eq] at he; omega
        have hx2 : x ^ (n + 1) = x ^ ((n + 1) / 2) * x ^ ((n + 1) / 2) := by
          rw [← pow_add, ← h2]
        rw [hx2]; exact mem_sqI P hk
      · have h2 : n + 1 = (n + 1) / 2 + (n + 1) / 2 + 1 := by
          have := Nat.mod_two_eq_zero_or_one (n + 1)
          simp only [beq_iff_eq] at he; omega
        have hx2 : x ^ (n + 1) = x ^ ((n + 1) / 2) * x ^ ((n + 1) / 2) * x := by
          rw [← pow_add, ← pow_succ, ← h2]
        rw [hx2]; exact mem_mulI P (mem_sqI P hk) hx

/-- Scaling a point interval by `2^{−k}`. -/
lemma mem_scale {y : ℝ} {a : Ival} (h : mem y a) (k : ℕ) :
    mem (y / (2 : ℝ) ^ k) ⟨a.lo, a.hi, a.e - k⟩ := by
  obtain ⟨h1, h2⟩ := h
  have hk : (2 : ℝ) ^ (a.e - (k : ℤ)) = (2 : ℝ) ^ a.e / (2 : ℝ) ^ k := by
    rw [zpow_sub₀ (by norm_num), zpow_natCast]
  have hpos : (0 : ℝ) < (2 : ℝ) ^ k := by positivity
  constructor
  · show (a.lo : ℝ) * (2 : ℝ) ^ (a.e - (k : ℤ)) ≤ y / 2 ^ k
    rw [hk, mul_div_assoc', div_le_div_iff_of_pos_right hpos]; exact h1
  · show y / 2 ^ k ≤ (a.hi : ℝ) * (2 : ℝ) ^ (a.e - (k : ℤ))
    rw [hk, mul_div_assoc', div_le_div_iff_of_pos_right hpos]; exact h2

lemma mem_expSq {y : ℝ} {a : Ival} (hy0 : 0 ≤ y) (hy : mem y a) (k : ℕ)
    (hv : expPosValid P 24 ⟨a.lo, a.hi, a.e - k⟩ = true) : mem (Real.exp y) (expSq k a) := by
  unfold expSq
  have hbase := mem_expPosI P hP 24 (by positivity) (mem_scale hy k) hv
  -- `k` squarings of `exp(y/2^k)` give `exp y`
  suffices ∀ j ≤ k, mem (Real.exp (y / 2 ^ k * 2 ^ j))
      ((List.range j).foldl (fun a _ => sqI P a) (expPosI P 24 ⟨a.lo, a.hi, a.e - k⟩)) by
    have := this k le_rfl
    rwa [div_mul_cancel₀ _ (by positivity)] at this
  intro j _
  induction j with
  | zero => simpa using hbase
  | succ j ih =>
    rw [foldl_range_succ]
    have := mem_sqI P (ih (by omega))
    rw [← Real.exp_add] at this
    convert this using 2
    rw [pow_succ]; ring

/-- `expUp a = some u` gives `e^y ≤ u` for every `y ∈ a`. -/
lemma expUp_sound {y : ℝ} {a u : Ival} (hy : mem y a) (h : expUp a = some u) :
    ∃ v, mem v u ∧ Real.exp y ≤ v := by
  have hhi : y ≤ (a.hi : ℝ) * (2 : ℝ) ^ a.e := hy.2
  set Y : ℝ := (a.hi : ℝ) * (2 : ℝ) ^ a.e
  have hYm : mem Y ⟨a.hi, a.hi, a.e⟩ := ⟨le_rfl, le_rfl⟩
  unfold expUp at h
  simp only at h
  split_ifs at h with h0 h1 h1
  · simp only [Option.some.injEq] at h
    subst h
    have hY0 : 0 ≤ Y := mul_nonneg (by exact_mod_cast h0) (two_zpow_pos _).le
    exact ⟨Real.exp Y, mem_expSq hY0 hYm 10 h1, Real.exp_le_exp.mpr hhi⟩
  · simp only [Option.some.injEq] at h
    subst h
    have hY0 : Y < 0 := mul_neg_of_neg_of_pos (by exact_mod_cast (not_le.mp h0)) (two_zpow_pos _)
    have hneg : mem (-Y) (negI ⟨a.hi, a.hi, a.e⟩) := mem_negI hYm
    have hv : expPosValid P 24 ⟨(negI ⟨a.hi, a.hi, a.e⟩).lo, (negI ⟨a.hi, a.hi, a.e⟩).hi,
        (negI ⟨a.hi, a.hi, a.e⟩).e - 10⟩ = true := by
      simpa [negI] using h1.1
    have hE := mem_expSq (by linarith) hneg 10 hv
    have hinv := mem_invI P hE (lo_pos_of_isPos h1.2)
    refine ⟨1 / Real.exp (-Y), hinv, ?_⟩
    rw [Real.exp_neg, one_div, inv_inv]
    exact Real.exp_le_exp.mpr hhi

/-! ### The off-axis series and the Horner sum -/

open Grothe.UpperQuad.TaylorShift in
/-- **The truncated off-axis series** encloses an upper bound of `Σ_r shiftTerm 501 t r`. -/
lemma ySeries_sound {t : ℝ} (ht : 0 ≤ t) {tI : Ival} (htI : mem t tI) :
    ∀ (fuel r : ℕ) (termI accI y : Ival), mem (shiftTerm 501 t r) termI →
      mem (∑ i ∈ Finset.range r, shiftTerm 501 t i) accI →
      ySeries tI fuel r termI accI = some y →
      ∃ Y, mem Y y ∧ ∑' i, shiftTerm 501 t i ≤ Y := by
  intro fuel
  induction fuel with
  | zero => intro r termI accI y _ _ h; simp [ySeries] at h
  | succ fuel ih =>
    intro r termI accI y hterm hacc h
    unfold ySeries at h
    split_ifs at h with hstop
    · simp only [Option.some.injEq] at h
      subst h
      refine ⟨_, mem_addI P hacc (mem_mulN P 2 hterm), ?_⟩
      have hc := pos_of_isPos hstop (mem_subI P (mem_ofNat P ((r + 1) ^ 2))
        (mem_mulN P (8 * (502 + r)) (mem_sqI P htI)))
      have hR : 2 * t ^ 2 * ((501 : ℕ) + 1 + r : ℝ) ≤ (1 / 2 : ℝ) ^ 2 * ((r : ℝ) + 1) ^ 2 := by
        push_cast at hc ⊢; nlinarith
      exact (tsum_shiftTerm_le 501 ht r (by norm_num : (0 : ℝ) ≤ 1 / 2) (by norm_num) hR).trans_eq
        (by push_cast; ring)
    · apply ih (r + 1) _ _ y _ _ h
      · rw [shiftTerm_succ 501 ht r]
        have hs := mem_sqrtI P (by positivity) (mem_ofNat P (2 * (502 + r)))
        have := mem_divN P hP (Nat.succ_pos r) (mem_mulI P (mem_mulI P hterm htI) hs)
        convert this using 1
        push_cast; ring_nf
      · rw [Finset.sum_range_succ]; exact mem_addI P hacc hterm

/-- The Horner sum. -/
lemma mem_horner {x : ℝ} {xI : Ival} (hx : mem x xI) :
    ∀ (g : List Ival) (G : List ℝ), g.length = G.length →
      (∀ m, m < g.length → mem (G.getD m 0) (g.getD m zeroI)) →
      mem (∑ m ∈ Finset.range G.length, G.getD m 0 * x ^ m) (horner g xI) := by
  intro g
  induction g with
  | nil => intro G hl _; rw [← hl]; simp [horner]; exact (mem_zeroI_iff 0).2 rfl
  | cons a g ih =>
    intro G hl hm
    cases G with
    | nil => simp at hl
    | cons b G =>
      simp only [List.length_cons, Nat.add_right_cancel_iff] at hl
      have ha := hm 0 (by simp)
      simp only [List.getD_cons_zero] at ha
      have hrest := ih G hl (fun m hm' => by simpa using hm (m + 1) (by simp; omega))
      unfold horner at hrest ⊢
      rw [List.foldr_cons, List.length_cons, Finset.sum_range_succ']
      have := mem_addI P ha (mem_mulI P hx hrest)
      convert this using 1
      simp only [List.getD_cons_succ, List.getD_cons_zero, pow_zero, mul_one, pow_succ]
      rw [Finset.mul_sum, add_comm]
      congr 1
      apply Finset.sum_congr rfl
      intro m _
      ring

/-! ### The coefficients `G_m = m! T_m` -/

lemma mem_tmI (m : ℕ) : mem (Tm m) (tmI m) := by
  unfold tmI Tm
  by_cases hm : m = 0
  · subst hm; simpa using mem_ofInt P 1
  · simp only [hm, ite_false, beq_iff_eq]
    apply mem_sumRangeI P (m + 1)
    intro c _
    have hr := mem_ratI P hP ((m + c : ℕ) : ℤ) (Nat.pos_of_ne_zero hm)
    have h1 : ((((m + c : ℕ) : ℤ) : ℝ) / (m : ℝ)) = 1 + (c : ℝ) / m := by
      have : (m : ℝ) ≠ 0 := by exact_mod_cast hm
      push_cast; field_simp
    rw [h1] at hr
    have := mem_mulN P (natChoose m c) (mem_powB hr (2 * (m - c + 1)))
    rw [natChoose_eq] at this ⊢; exact this

lemma gList_length : gList.length = 502 := by simp [gList]

lemma mem_gList (m : ℕ) (hm : m < 502) :
    mem ((m.factorial : ℝ) * Tm m) (gList.getD m zeroI) := by
  unfold gList
  rw [List.getD_eq_getElem?_getD, List.getElem?_map, List.getElem?_range hm]
  simp only [Option.map_some, Option.getD_some]
  have := mem_mulN P (factNat m) (mem_tmI m)
  rw [factNat_eq] at this ⊢; exact this

/-- The Horner sum over `gList` is the large-`|A|` series. -/
lemma mem_horner_gList {x : ℝ} {xI : Ival} (hx : mem x xI) :
    mem (∑ m ∈ Finset.range 502, (m.factorial : ℝ) * Tm m * x ^ m) (horner gList xI) := by
  have h := mem_horner hx gList ((List.range 502).map fun m => (m.factorial : ℝ) * Tm m)
    (by simp [gList]) (fun m hm => by
      rw [gList_length] at hm
      rw [List.getD_eq_getElem?_getD, List.getElem?_map, List.getElem?_range hm]
      exact mem_gList m hm)
  simp only [List.length_map, List.length_range] at h
  convert h using 2 with m hm
  rw [List.getD_eq_getElem?_getD, List.getElem?_map,
    List.getElem?_range (Finset.mem_range.mp hm)]
  rfl

/-! ### The profile coefficients -/

/-- `nrmHalf j = π^{1/4} √β_j`. -/
lemma nrmHalf_eq (j : ℕ) :
    nrmHalf j = Real.sqrt (Real.sqrt Real.pi) *
      Real.sqrt (((2 * j).factorial : ℝ) / (4 ^ j * (j.factorial : ℝ) ^ 2)) := by
  unfold nrmHalf
  rw [← Real.sqrt_mul (Real.sqrt_nonneg _)]
  congr 1
  ring

lemma mem_sqrtBetaI (j : ℕ) :
    mem (Real.sqrt (((2 * j).factorial : ℝ) / (4 ^ j * (j.factorial : ℝ) ^ 2))) (sqrtBetaI j) := by
  unfold sqrtBetaI
  apply mem_sqrtI P (by positivity)
  rw [factNat_eq, factNat_eq]
  have := mem_divN P hP (by positivity : 0 < 4 ^ j * (j.factorial) ^ 2)
    (mem_ofNat P (2 * j).factorial)
  convert this using 1
  push_cast; ring

/-- The scaled profile coefficient `ĉ_k = π^{1/4} v_k`. -/
noncomputable def chat (k : ℕ) : ℝ := Real.sqrt (Real.sqrt Real.pi) * vcoef k

lemma chatOK_spec (h : chatOK = true) (j : ℕ) (hj : j < 12) : isPos (sqrtBetaI j) = true := by
  unfold chatOK at h
  rw [List.all_eq_true] at h
  exact h j (List.mem_range.mpr hj)

lemma mem_chatI (hc : chatOK = true) (k : ℕ) : mem (chat k) (chatI k) := by
  unfold chat vcoef chatI
  rw [Finset.mul_sum]
  apply mem_sumRangeI P 12
  intro j hj
  unfold chatTerm
  by_cases hkj : k ≤ j
  · simp only [hkj, ite_true]
    rw [factNat_eq]
    obtain ⟨hpos, heq⟩ := binHalfRat_eq j k
    have hb := mem_ratI P hP (binHalfRat j k).1 hpos
    rw [heq] at hb
    have hx := mem_qI (Grothe.Upper.profileQ.getD j 0)
    have hfac := mem_divN P hP (Nat.factorial_pos k) (mem_mulI P hx hb)
    have ht := mem_divI P hfac (mem_sqrtBetaI j) (lo_pos_of_isPos (chatOK_spec hc j hj))
    have hβ : 0 < Real.sqrt (((2 * j).factorial : ℝ) / (4 ^ j * (j.factorial : ℝ) ^ 2)) :=
      Real.sqrt_pos.mpr (by positivity)
    have hπ : 0 < Real.sqrt (Real.sqrt Real.pi) :=
      Real.sqrt_pos.mpr (Real.sqrt_pos.mpr Real.pi_pos)
    have hval : Real.sqrt (Real.sqrt Real.pi) *
        (((Grothe.Upper.profileQ.getD j 0 : ℚ) : ℝ) * ((-1) ^ k * binHalf j k / (k.factorial : ℝ)) /
          nrmHalf j) =
        (-1) ^ k * (((Grothe.Upper.profileQ.getD j 0 : ℚ) : ℝ) * binHalf j k / (k.factorial : ℝ) /
          Real.sqrt (((2 * j).factorial : ℝ) / (4 ^ j * (j.factorial : ℝ) ^ 2))) := by
      rw [nrmHalf_eq]; field_simp
    rw [hval]
    split_ifs with hodd
    · have hk' : k % 2 = 1 := by simpa using hodd
      have hneg : ((-1 : ℝ) ^ k) = -1 := by
        rw [← Nat.div_add_mod k 2, hk', pow_add, pow_mul]; simp
      rw [hneg, neg_one_mul]; exact mem_negI ht
    · have hk' : k % 2 = 0 := by
        have := Nat.mod_two_eq_zero_or_one k; simp at hodd; omega
      have hone : ((-1 : ℝ) ^ k) = 1 := by
        rw [← Nat.div_add_mod k 2, hk', add_zero, pow_mul]; simp
      rw [hone, one_mul]; exact ht
  · simp only [hkj, ite_false, mul_zero]
    exact (mem_zeroI_iff 0).2 rfl

lemma chatArr_getD (k : ℕ) (hk : k < 12) : chatArr.getD k zeroI = chatI k := by
  unfold chatArr
  rw [Array.getD_eq_getD_getElem?, Array.getElem?_map, Array.getElem?_range]
  simp [hk]

/-- The scaled Taylor coefficient `t̂_k(x) = π^{1/4} t_k(x)`. -/
lemma mem_taylorI (hc : chatOK = true) {x : ℝ} {xI : Ival} (hx : mem x xI) (k : ℕ) :
    mem (Real.sqrt (Real.sqrt Real.pi) * tcoef k x) (taylorI xI k) := by
  unfold tcoef taylorI
  rw [Finset.mul_sum]
  apply mem_sumRangeI P (12 - k)
  intro i hi
  rw [chatArr_getD (i + k) (by omega)]
  have := mem_mulI P (mem_mulN P (natChoose (i + k) k) (mem_chatI hc (i + k))) (mem_powI P hx i)
  rw [natChoose_eq] at this ⊢
  convert this using 1
  unfold chat; ring

/-- The deviation enclosure dominates the scaled deviation. -/
lemma devI_sound (hc : chatOK = true) {x R : ℝ} {xI RI : Ival} (hx : mem x xI) (hR : mem R RI)
    (hR0 : 0 ≤ R) :
    ∃ D, mem D (devI xI RI) ∧ Real.sqrt (Real.sqrt Real.pi) * devR x R ≤ D := by
  refine ⟨∑ k ∈ Finset.range 11, bval (taylorI xI (k + 1)) * R ^ (k + 1), ?_, ?_⟩
  · unfold devI
    exact mem_sumRangeI P 11 fun k _ => mem_mulI P (mem_absUpper _) (mem_powI P hR (k + 1))
  · unfold devR
    rw [Finset.mul_sum]
    apply Finset.sum_le_sum
    intro k _
    have hb := abs_le_bval (mem_taylorI hc hx (k + 1))
    rw [abs_mul, abs_of_pos (Real.sqrt_pos.mpr (Real.sqrt_pos.mpr Real.pi_pos))] at hb
    rw [← mul_assoc]
    exact mul_le_mul_of_nonneg_right hb (pow_nonneg hR0 _)

end Grothe.UpperQuad.EllCheck
