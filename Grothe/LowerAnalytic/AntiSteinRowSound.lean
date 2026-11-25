import Grothe.LowerAnalytic.AntiSteinRowCheck
import Grothe.LowerAnalytic.RadiusCheck
import Grothe.LowerAnalytic.SharpRadius
import Grothe.Lower.Sweep

/-!
# Soundness of the antiholomorphic Stein row checker

This file proves the analytic soundness of `Grothe/LowerAnalytic/AntiSteinRowCheck.lean` for
every normalized circular cubic Gaussian chaos `q = a + i b` (`Chaos3 a`, `E a² = 1/2`,
`Circular J a b`) and every convex capped fibre potential `Ψ` (`CapsHold Ψ nodes smax`):

* **Pure-integer rational Bernstein soundness** (`segRatOK_sound`, `rayRatOK_sound`,
  `bernAutoOK_sound`): scaling `p` by `D^d` lifts rational endpoints to `RadiusCheck`'s
  `evalBern_toBernSeg`, `evalBern_toBernRay`, and `dcSplit` lemmas.
* **Node-cap envelope soundness** (`mkLinPieces_valid`, `sweepFiniteCell_sound`,
  `sweepTailCell_sound`): convexity (`Grothe.Lower.chord_le`) and the Lipschitz cap
  (`CapsHold.lip`) certify `Ψ(σ r) ≤ α + β r` on each linear envelope segment.
* **Pointwise `AntiNode` soundness** (`checkAntiNode_sound`): general even grid denominator
  `M = an.gridDen` bridge to `complete_squares_pointwise`.
* **Expectation and row assembly** (`antiNode_integral_le`, `checkQuadNode_sound`,
  `checkMomentNode_sound`, `checkAntiCells_sound`): yields `CircularRowBound`, bounding
  `E Ψ(σ √U) − κ σ² ≤ cap` for all `σ ∈ [0, δ · 93/100]` and all circular cubics.
-/

open Finset MeasureTheory MvPolynomial Grothe.Lower

namespace Grothe.LowerAnalytic

noncomputable section

/-! ### Section 1: Pure-integer rational Bernstein soundness -/

lemma pScalePow_length (D : Int) (d : ℕ) (p : List Int) :
    (pScalePow D d p).length = d + 1 := by
  simp [pScalePow]

lemma pTrimOK_pScalePow (D : Int) (d : ℕ) (p : List Int) :
    pTrimOK d (pScalePow D d p) = true := by
  unfold pTrimOK
  rw [List.drop_eq_nil_of_le (by rw [pScalePow_length])]
  rfl

lemma evalInt_pScalePow (D : Int) (d : ℕ) (p : List Int) (ht : pTrimOK d p = true)
    (hD : (D : ℝ) ≠ 0) (x : ℝ) :
    evalInt (pScalePow D d p) x = (D : ℝ) ^ d * evalInt p (x / (D : ℝ)) := by
  rw [evalInt_eq_sum, pScalePow_length, evalInt_eq_sum_of_trim ht, Finset.mul_sum]
  refine Finset.sum_congr rfl fun k hk ↦ ?_
  have hkd : k ≤ d := Nat.lt_succ_iff.1 (Finset.mem_range.1 hk)
  have hget : (pScalePow D d p).getD k 0 = p.getD k 0 * D ^ (d - k) := by
    have hlt : k < (pScalePow D d p).length := by rw [pScalePow_length]; exact Finset.mem_range.1 hk
    rw [List.getD_eq_getElem _ _ hlt]
    simp [pScalePow]
  rw [hget, Int.cast_mul, Int.cast_pow, div_pow]
  have hpow : (D : ℝ) ^ d = (D : ℝ) ^ (d - k) * (D : ℝ) ^ k := by
    rw [← pow_add, Nat.sub_add_cancel hkd]
  rw [hpow]
  field_simp [hD]

theorem bernAutoOK_sound : ∀ (depth : ℕ) (b : List Int), b ≠ [] →
    bernAutoOK depth b = true → ∀ t : ℝ, 0 ≤ t → t ≤ 1 → 0 ≤ evalBern b t
  | 0, b, _, hok, t, ht0, ht1 => by
    simp only [bernAutoOK, List.all_eq_true, decide_eq_true_eq] at hok
    unfold evalBern bbasis
    refine Finset.sum_nonneg fun k hk ↦ ?_
    have hlt : k < b.length := Finset.mem_range.1 hk
    have hbk : (0 : ℝ) ≤ (b.getD k 0 : ℝ) := by
      rw [List.getD_eq_getElem _ _ hlt]
      exact_mod_cast hok b[k] (List.getElem_mem hlt)
    have h1 : 0 ≤ 1 - t := sub_nonneg.2 ht1
    exact mul_nonneg hbk (mul_nonneg (mul_nonneg (Nat.cast_nonneg _) (pow_nonneg ht0 _)) (pow_nonneg h1 _))
  | depth + 1, b, hb, hok, t, ht0, ht1 => by
    simp only [bernAutoOK, Bool.or_eq_true, Bool.and_eq_true] at hok
    rcases hok with hall | ⟨hl, hr⟩
    · simp only [List.all_eq_true, decide_eq_true_eq] at hall
      unfold evalBern bbasis
      refine Finset.sum_nonneg fun k hk ↦ ?_
      have hlt : k < b.length := Finset.mem_range.1 hk
      have hbk : (0 : ℝ) ≤ (b.getD k 0 : ℝ) := by
        rw [List.getD_eq_getElem _ _ hlt]
        exact_mod_cast hall b[k] (List.getElem_mem hlt)
      have h1 : 0 ≤ 1 - t := sub_nonneg.2 ht1
      exact mul_nonneg hbk (mul_nonneg (mul_nonneg (Nat.cast_nonneg _) (pow_nonneg ht0 _)) (pow_nonneg h1 _))
    · have hlen : b.length = (b.length - 1) + 1 := (Nat.sub_add_cancel (List.length_pos_iff.2 hb)).symm
      have hspec := dcSplitAux_spec (b.length - 1) b [] hlen
      have hne_l : (dcSplit b).1 ≠ [] := by
        intro hnil
        have hlen_l : (dcSplit b).1.length = b.length := by
          cases b with
          | nil => exact absurd rfl hb
          | cons _ _ => simp only [dcSplit]; exact hspec.1.trans hlen.symm
        rw [hnil] at hlen_l; exact hb (List.eq_nil_of_length_eq_zero hlen_l.symm)
      have hne_r : (dcSplit b).2 ≠ [] := by
        intro hnil
        have hlen_r : (dcSplit b).2.length = b.length := by
          cases b with
          | nil => exact absurd rfl hb
          | cons _ _ =>
            simp only [dcSplit, hspec.2.2, List.append_nil, List.length_map, List.length_range]
            omega
        rw [hnil] at hlen_r; exact hb (List.eq_nil_of_length_eq_zero hlen_r.symm)
      have hpow : (0 : ℝ) < (2 : ℝ) ^ (b.length - 1) := by positivity
      by_cases hhalf : t ≤ 1 / 2
      · have hval := bernAutoOK_sound depth (dcSplit b).1 hne_l hl (2 * t) (by linarith) (by linarith)
        rw [evalBern_dcSplit_left hb (2 * t), show (2 * t) / 2 = t by ring] at hval
        exact nonneg_of_mul_nonneg_right hval hpow
      · push Not at hhalf
        have hval := bernAutoOK_sound depth (dcSplit b).2 hne_r hr (2 * t - 1) (by linarith) (by linarith)
        rw [evalBern_dcSplit_right hb (2 * t - 1), show (1 + (2 * t - 1)) / 2 = t by ring] at hval
        exact nonneg_of_mul_nonneg_right hval hpow

private lemma rat_mul_lcm_cast (q : ℚ) (D : ℕ) (hdvd : q.den ∣ D) :
    (((q * (D : ℚ)).num : Int) : ℝ) = (q : ℝ) * (D : ℝ) := by
  obtain ⟨k, hk⟩ := hdvd
  have hEq : q * (D : ℚ) = ((q.num * (k : Int) : Int) : ℚ) := by
    have hden0 : (q.den : ℚ) ≠ 0 := by exact_mod_cast q.den_ne_zero
    have hq : q * (q.den : ℚ) = (q.num : ℚ) := by
      conv_lhs => arg 1; rw [← Rat.num_div_den q]
      exact div_mul_cancel₀ _ hden0
    rw [hk]
    push_cast
    rw [← mul_assoc, hq]
  have hnum : (q * (D : ℚ)).num = q.num * (k : Int) := by
    rw [hEq]; exact Rat.num_intCast _
  rw [hnum]
  have hR : ((q * (D : ℚ) : ℚ) : ℝ) = (((q.num * (k : Int) : Int) : ℚ) : ℝ) :=
    congrArg ((↑) : ℚ → ℝ) hEq
  simpa using hR.symm

theorem segRatOK_sound {d depth : ℕ} {lo hi : ℚ} {p : List Int}
    (hok : segRatOK d lo hi p depth = true) {R : ℝ} (hlo : (lo : ℝ) ≤ R) (hhi : R ≤ (hi : ℝ)) :
    0 ≤ evalInt p R := by
  simp only [segRatOK, Bool.and_eq_true, decide_eq_true_eq] at hok
  obtain ⟨⟨hlh, htrim⟩, hbern⟩ := hok
  set D : ℕ := Nat.lcm lo.den hi.den
  have hDpos : 0 < D := Nat.lcm_pos lo.den_pos hi.den_pos
  have hDR : (0 : ℝ) < (D : ℝ) := by exact_mod_cast hDpos
  have haR : (((lo * (D : ℚ)).num : Int) : ℝ) = (lo : ℝ) * (D : ℝ) :=
    rat_mul_lcm_cast lo D (Nat.dvd_lcm_left _ _)
  have hhiR : (((hi * (D : ℚ)).num : Int) : ℝ) = (hi : ℝ) * (D : ℝ) :=
    rat_mul_lcm_cast hi D (Nat.dvd_lcm_right _ _)
  have hwR : ((((hi - lo) * (D : ℚ)).num : Int) : ℝ) = ((hi : ℝ) - (lo : ℝ)) * (D : ℝ) := by
    have hsub : (hi - lo) * (D : ℚ) = ((hi * (D : ℚ)).num - (lo * (D : ℚ)).num : Int) := by
      have h1 : hi * (D : ℚ) = ((hi * (D : ℚ)).num : ℚ) := by
        have hR' : ((hi * (D : ℚ) : ℚ) : ℝ) = (((hi * (D : ℚ)).num : Int) : ℝ) := by
          simpa using hhiR.symm
        exact_mod_cast hR'
      have h2 : lo * (D : ℚ) = ((lo * (D : ℚ)).num : ℚ) := by
        have hR' : ((lo * (D : ℚ) : ℚ) : ℝ) = (((lo * (D : ℚ)).num : Int) : ℝ) := by
          simpa using haR.symm
        exact_mod_cast hR'
      rw [sub_mul, h1, h2]; push_cast; rfl
    rw [hsub, Rat.num_intCast, Int.cast_sub, hhiR, haR]; ring
  have hltR : (lo : ℝ) < (hi : ℝ) := by exact_mod_cast hlh
  set t : ℝ := (R - (lo : ℝ)) / ((hi : ℝ) - (lo : ℝ))
  have ht0 : 0 ≤ t := div_nonneg (sub_nonneg.2 hlo) (sub_pos.2 hltR).le
  have ht1 : t ≤ 1 := (div_le_one (sub_pos.2 hltR)).2 (by linarith)
  have hne : toBernSeg (pScalePow (D : Int) d p) d ((lo * (D : ℚ)).num) (((hi - lo) * (D : ℚ)).num) ≠ [] := by
    intro hnil
    have hlen : (toBernSeg (pScalePow (D : Int) d p) d ((lo * (D : ℚ)).num) (((hi - lo) * (D : ℚ)).num)).length = d + 1 := by
      simp [toBernSeg]
    rw [hnil] at hlen; simp at hlen
  have hge := bernAutoOK_sound depth _ hne hbern t ht0 ht1
  rw [evalBern_toBernSeg (pTrimOK_pScalePow (D : Int) d p) _ _ t] at hge
  have harg : (((lo * (D : ℚ)).num : Int) : ℝ) + ((((hi - lo) * (D : ℚ)).num : Int) : ℝ) * t = (D : ℝ) * R := by
    rw [haR, hwR]; simp only [t]; field_simp [(sub_pos.2 hltR).ne']; ring
  rw [harg, evalInt_pScalePow (D : Int) d p htrim (by exact_mod_cast hDpos.ne'),
    Int.cast_natCast, mul_div_cancel_left₀ R hDR.ne'] at hge
  have hpos : (0 : ℝ) < (lcmChoose d : ℝ) * (D : ℝ) ^ d := by
    have hM : (0 : ℝ) < (lcmChoose d : ℝ) := by exact_mod_cast lcmChoose_pos d
    positivity
  exact nonneg_of_mul_nonneg_right (by linarith only [hge]) hpos

theorem rayRatOK_sound {d depth : ℕ} {lo : ℚ} {p : List Int}
    (hok : rayRatOK d lo p depth = true) {R : ℝ} (hlo : (lo : ℝ) ≤ R) :
    0 ≤ evalInt p R := by
  simp only [rayRatOK, Bool.and_eq_true] at hok
  obtain ⟨htrim, hbern⟩ := hok
  set D : ℕ := lo.den
  have hDpos : 0 < D := lo.den_pos
  have hDR : (0 : ℝ) < (D : ℝ) := by exact_mod_cast hDpos
  have haR : (((lo * (D : ℚ)).num : Int) : ℝ) = (lo : ℝ) * (D : ℝ) :=
    rat_mul_lcm_cast lo D (dvd_refl _)
  set t : ℝ := (R - (lo : ℝ)) / (R - (lo : ℝ) + 10)
  have hden : 0 < R - (lo : ℝ) + 10 := by linarith
  have ht0 : 0 ≤ t := div_nonneg (sub_nonneg.2 hlo) hden.le
  have ht1 : t < 1 := (div_lt_one hden).2 (by linarith)
  have hne : toBernRay (pScalePow (D : Int) d p) d ((lo * (D : ℚ)).num) (10 * (D : Int)) ≠ [] := by
    intro hnil
    have hlen : (toBernRay (pScalePow (D : Int) d p) d ((lo * (D : ℚ)).num) (10 * (D : Int))).length = d + 1 := by
      simp [toBernRay]
    rw [hnil] at hlen; simp at hlen
  have hge := bernAutoOK_sound depth _ hne hbern t ht0 ht1.le
  rw [evalBern_toBernRay (pTrimOK_pScalePow (D : Int) d p) _ _ ht1.ne] at hge
  have harg : (((lo * (D : ℚ)).num : Int) : ℝ) + ((10 * (D : Int) : Int) : ℝ) * (t / (1 - t)) = (D : ℝ) * R := by
    rw [haR, Int.cast_mul, Int.cast_ofNat, Int.cast_natCast]
    have h1t : 1 - t = 10 / (R - (lo : ℝ) + 10) := by
      simp only [t]; field_simp [hden.ne']; ring
    rw [h1t]
    simp only [t]
    field_simp [hden.ne']
    ring
  rw [harg, evalInt_pScalePow (D : Int) d p htrim (by exact_mod_cast hDpos.ne'),
    Int.cast_natCast, mul_div_cancel_left₀ R hDR.ne'] at hge
  have hpos : (0 : ℝ) < (lcmChoose d : ℝ) * ((1 - t) ^ d * (D : ℝ) ^ d) := by
    have hM : (0 : ℝ) < (lcmChoose d : ℝ) := by exact_mod_cast lcmChoose_pos d
    have h1t : 0 < 1 - t := sub_pos.2 ht1
    positivity
  exact nonneg_of_mul_nonneg_right (by linarith only [hge]) hpos

/-! ### Section 2: Node-cap piecewise-linear upper envelope soundness -/

lemma mem_of_isSublistQ : ∀ (sub full : List (ℚ × ℚ)),
    isSublistQ sub full = true → ∀ m ∈ sub, m ∈ full
  | [], _, _, _, hm => by cases hm
  | _ :: _, [], h, _, _ => by simp [isSublistQ] at h
  | a :: as, b :: bs, h, m, hm => by
    simp only [isSublistQ] at h
    split at h
    · next hab =>
      have hab' : a = b := by simpa [beq_iff_eq] using hab
      rcases List.mem_cons.1 hm with rfl | hmas
      · exact hab' ▸ List.mem_cons_self ..
      · exact List.mem_cons_of_mem _ (mem_of_isSublistQ as bs h m hmas)
    · exact List.mem_cons_of_mem _ (mem_of_isSublistQ (a :: as) bs h m hm)

theorem capsHold_of_isSublistQ {Ψ : ℝ → ℝ} {sub full : List (ℚ × ℚ)} {smax : ℚ}
    (hΨ : CapsHold Ψ full smax) (hsub : isSublistQ sub full = true) :
    CapsHold Ψ sub smax where
  convex := hΨ.convex
  caps := fun m hm ↦ hΨ.caps m (mem_of_isSublistQ sub full hsub m hm)
  lip := hΨ.lip

/-- Validity of a list of affine upper-bound pieces for `r ↦ Ψ (σ * r)`. -/
def LinPiecesValid (Ψ : ℝ → ℝ) (σ : ℚ) (lps : List LinPiece) : Prop :=
  ∀ lp ∈ lps, ∀ r : ℝ, (lp.lo : ℝ) ≤ r → (∀ hi, lp.hi? = some hi → r ≤ (hi : ℝ)) →
    Ψ ((σ : ℝ) * r) ≤ (lp.alpha : ℝ) + (lp.beta : ℝ) * r

lemma nodesStrictOK_nonneg : ∀ (nodes : List (ℚ × ℚ)) (x0 : ℚ),
    0 ≤ x0 → nodesStrictOK nodes = true → (∀ m, nodes.head? = some m → x0 ≤ m.1) →
    ∀ m ∈ nodes, 0 ≤ m.1
  | [], _, _, _, _, _, hm => by cases hm
  | [(x, y)], x0, hx0, _, hhd, m, hm => by
    rcases List.mem_singleton.1 hm with rfl
    exact hx0.trans (hhd _ rfl)
  | (x0, y0) :: (x1, y1) :: rest, lb, hlb, hst, hhd, m, hm => by
    simp only [nodesStrictOK, Bool.and_eq_true, decide_eq_true_eq] at hst
    have hx0 : 0 ≤ x0 := hlb.trans (hhd _ rfl)
    rcases List.mem_cons.1 hm with rfl | hm'
    · exact hx0
    · exact nodesStrictOK_nonneg ((x1, y1) :: rest) x1 (hx0.trans hst.1.le) hst.2
        (fun _ h ↦ by cases h; exact le_rfl) m hm'

lemma mkLinPieces_valid {Ψ : ℝ → ℝ} {smax σ : ℚ} (hσ : 0 < σ) :
    ∀ (nodes : List (ℚ × ℚ)), nodesStrictOK nodes = true → (∀ m ∈ nodes, 0 ≤ m.1) →
      CapsHold Ψ nodes smax → LinPiecesValid Ψ σ (mkLinPieces σ smax nodes)
  | [], _, _, _, _, hlp, _, _, _ => by simp [mkLinPieces] at hlp
  | [(x, y)], _, hnn, hΨ, lp, hlp, r, hlo, _ => by
    simp only [mkLinPieces, List.mem_singleton] at hlp
    subst hlp
    have hσR : (0 : ℝ) < (σ : ℝ) := by exact_mod_cast hσ
    have hx0 : (0 : ℝ) ≤ (x : ℝ) := by exact_mod_cast hnn (x, y) (List.mem_singleton_self _)
    have hxr : (x : ℝ) ≤ (σ : ℝ) * r := by
      have : (x : ℝ) / (σ : ℝ) ≤ r := by simpa using hlo
      linarith [(div_le_iff₀ hσR).1 this]
    have hcap : Ψ (x : ℝ) ≤ (y : ℝ) := hΨ.caps (x, y) (List.mem_singleton_self _)
    have hlip := hΨ.lip (x : ℝ) ((σ : ℝ) * r) hx0 hxr
    push_cast
    linarith only [hcap, hlip]
  | (x0, y0) :: (x1, y1) :: rest, hst, hnn, hΨ, lp, hlp, r, hlo, hhi => by
    simp only [nodesStrictOK, Bool.and_eq_true, decide_eq_true_eq] at hst
    simp only [mkLinPieces, List.mem_cons] at hlp
    rcases hlp with rfl | hlp'
    · have hσR : (0 : ℝ) < (σ : ℝ) := by exact_mod_cast hσ
      have hx0 : (0 : ℝ) ≤ (x0 : ℝ) := by exact_mod_cast hnn (x0, y0) (List.mem_cons_self ..)
      have hxlt : (x0 : ℝ) < (x1 : ℝ) := by exact_mod_cast hst.1
      have h1 : (x0 : ℝ) ≤ (σ : ℝ) * r := by
        linarith [(div_le_iff₀ hσR).1 (by simpa using hlo : (x0 : ℝ) / (σ : ℝ) ≤ r)]
      have h2 : (σ : ℝ) * r ≤ (x1 : ℝ) := by
        linarith [(le_div_iff₀ hσR).1 (by simpa using hhi (x1 / σ) rfl : r ≤ (x1 : ℝ) / (σ : ℝ))]
      have hc0 : Ψ (x0 : ℝ) ≤ (y0 : ℝ) := hΨ.caps (x0, y0) (List.mem_cons_self ..)
      have hc1 : Ψ (x1 : ℝ) ≤ (y1 : ℝ) := hΨ.caps (x1, y1) (List.mem_cons_of_mem _ (List.mem_cons_self ..))
      have hch := chord_le Ψ hΨ.convex (x0 : ℝ) (x1 : ℝ) (y0 : ℝ) (y1 : ℝ) ((σ : ℝ) * r)
        hx0 hxlt h1 h2 hc0 hc1
      refine hch.trans_eq ?_
      push_cast; ring
    · have hΨ' : CapsHold Ψ ((x1, y1) :: rest) smax :=
        ⟨hΨ.convex, fun m hm ↦ hΨ.caps m (List.mem_cons_of_mem _ hm), hΨ.lip⟩
      exact mkLinPieces_valid hσ ((x1, y1) :: rest) hst.2
        (fun m hm ↦ hnn m (List.mem_cons_of_mem _ hm)) hΨ' lp hlp' r hlo hhi

lemma subAffineCellOK_sound {first : Bool} {M : ℕ} {Wden : Int} {Pcell : List Int}
    {rLo : ℚ} {rHi? : Option ℚ} {alpha beta : ℚ} (hM : 0 < M) (_hW : 0 < Wden)
    (hok : subAffineCellOK first M Wden Pcell rLo rHi? alpha beta = true)
    {r : ℝ} (hrLo : (rLo : ℝ) ≤ r) (hrHi : ∀ rHi, rHi? = some rHi → r ≤ (rHi : ℝ)) :
    if first then
      (Wden : ℝ) * ((alpha : ℝ) + (beta : ℝ) * r) ≤ evalInt Pcell ((M : ℝ) * r)
    else
      (Wden : ℝ) * ((M : ℝ) * r) ^ 4 * ((alpha : ℝ) + (beta : ℝ) * r) ≤ evalInt Pcell ((M : ℝ) * r) := by
  unfold subAffineCellOK at hok
  set qDen : ℕ := Nat.lcm alpha.den beta.den
  have hqPos : 0 < qDen := Nat.lcm_pos alpha.den_pos beta.den_pos
  have hqR : (0 : ℝ) < (qDen : ℝ) := by exact_mod_cast hqPos
  have hMR : (0 : ℝ) < (M : ℝ) := by exact_mod_cast hM
  have hpAl : (((alpha * (qDen : ℚ)).num : Int) : ℝ) = (alpha : ℝ) * (qDen : ℝ) :=
    rat_mul_lcm_cast alpha qDen (Nat.dvd_lcm_left _ _)
  have hpBe : (((beta * (qDen : ℚ)).num : Int) : ℝ) = (beta : ℝ) * (qDen : ℝ) :=
    rat_mul_lcm_cast beta qDen (Nat.dvd_lcm_right _ _)
  have hqMR : (0 : ℝ) < (qDen : ℝ) * (M : ℝ) := mul_pos hqR hMR
  cases first with
  | true =>
    simp only [↓reduceIte] at hok ⊢
    cases rHi? with
    | none => simp at hok
    | some rHi =>
      have hpoly := segRatOK_sound hok
        (by push_cast; exact mul_le_mul_of_nonneg_left hrLo hMR.le)
        (by push_cast; exact mul_le_mul_of_nonneg_left (hrHi rHi rfl) hMR.le)
      simp only [evalInt_sub, evalInt_scale, evalInt_cons, evalInt_nil, mul_zero, add_zero,
        Int.cast_mul, Int.cast_natCast, hpAl, hpBe] at hpoly
      have hdiff : 0 ≤ ((qDen : ℝ) * (M : ℝ)) * (evalInt Pcell ((M : ℝ) * r)
          - (Wden : ℝ) * ((alpha : ℝ) + (beta : ℝ) * r)) := by
        linarith only [hpoly]
      linarith only [nonneg_of_mul_nonneg_right hdiff hqMR]
  | false =>
    simp only [Bool.false_eq_true, ↓reduceIte] at hok ⊢
    have hpoly : 0 ≤ evalInt (pSub (pScale ((qDen : Int) * (M : Int)) Pcell)
        [0, 0, 0, 0, (alpha * (qDen : ℚ)).num * (M : Int) * Wden,
          (beta * (qDen : ℚ)).num * Wden]) ((M : ℝ) * r) := by
      cases rHi? with
      | none =>
        exact rayRatOK_sound hok (by push_cast; exact mul_le_mul_of_nonneg_left hrLo hMR.le)
      | some rHi =>
        exact segRatOK_sound hok
          (by push_cast; exact mul_le_mul_of_nonneg_left hrLo hMR.le)
          (by push_cast; exact mul_le_mul_of_nonneg_left (hrHi rHi rfl) hMR.le)
    simp only [evalInt_sub, evalInt_scale, evalInt_cons, evalInt_nil, mul_zero, add_zero,
      Int.cast_zero, zero_add, Int.cast_mul, Int.cast_natCast, hpAl, hpBe] at hpoly
    have hdiff : 0 ≤ ((qDen : ℝ) * (M : ℝ)) * (evalInt Pcell ((M : ℝ) * r)
        - (Wden : ℝ) * ((M : ℝ) * r) ^ 4 * ((alpha : ℝ) + (beta : ℝ) * r)) := by
      linarith only [hpoly]
    linarith only [nonneg_of_mul_nonneg_right hdiff hqMR]

lemma sweepFiniteCell_sound {Ψ : ℝ → ℝ} {σ : ℚ} {first : Bool} {M : ℕ} {Wden : Int}
    {Pcell : List Int} (hM : 0 < M) (hW : 0 < Wden) :
    ∀ (lps lps' : List LinPiece) (rLo rHi : ℚ),
      LinPiecesValid Ψ σ lps →
      sweepFiniteCell first M Wden Pcell rLo rHi lps = some lps' →
      LinPiecesValid Ψ σ lps' ∧
      ∀ r : ℝ, (rLo : ℝ) ≤ r → r ≤ (rHi : ℝ) →
        if first then
          (Wden : ℝ) * Ψ ((σ : ℝ) * r) ≤ evalInt Pcell ((M : ℝ) * r)
        else
          (Wden : ℝ) * ((M : ℝ) * r) ^ 4 * Ψ ((σ : ℝ) * r) ≤ evalInt Pcell ((M : ℝ) * r)
  | [], _, _, _, _, hok => by simp [sweepFiniteCell] at hok
  | lp :: rest, lps', rLo, rHi, hval, hok => by
    have hval_rest : LinPiecesValid Ψ σ rest := fun x hx ↦ hval x (List.mem_cons_of_mem _ hx)
    have hWnn : (0 : ℝ) ≤ (Wden : ℝ) := by exact_mod_cast hW.le
    unfold sweepFiniteCell at hok
    cases hhi : lp.hi? with
    | none =>
      rw [hhi] at hok
      simp only [Bool.and_eq_true, decide_eq_true_eq] at hok
      split_ifs at hok with hcond
      · cases hok
        refine ⟨hval, fun r hrLo hrHi ↦ ?_⟩
        have hΨle := hval lp (List.mem_cons_self ..) r ((by exact_mod_cast hcond.1 : (lp.lo : ℝ) ≤ rLo).trans hrLo)
          (fun _ h ↦ by rw [hhi] at h; cases h)
        have hsub := subAffineCellOK_sound hM hW hcond.2 hrLo (fun _ h ↦ by cases h; exact hrHi)
        cases first with
        | true =>
          simp only [↓reduceIte] at hsub ⊢
          nlinarith only [hsub, hΨle, hWnn]
        | false =>
          simp only [Bool.false_eq_true, ↓reduceIte] at hsub ⊢
          have hpow : 0 ≤ (Wden : ℝ) * ((M : ℝ) * r) ^ 4 := by positivity
          nlinarith only [hsub, hΨle, hpow]
    | some lpHi =>
      rw [hhi] at hok
      by_cases hskip : lpHi ≤ rLo
      · simp only [hskip, decide_true, ↓reduceIte] at hok
        exact sweepFiniteCell_sound hM hW rest lps' rLo rHi hval_rest hok
      · simp only [hskip, decide_false, Bool.false_eq_true, ↓reduceIte] at hok
        by_cases hlo : lp.lo ≤ rLo
        · simp only [hlo, decide_true, ↓reduceIte] at hok
          by_cases hend : rHi ≤ lpHi
          · simp only [hend, decide_true, ↓reduceIte] at hok
            by_cases hsubOK : subAffineCellOK first M Wden Pcell rLo (some rHi) lp.alpha lp.beta = true
            · simp only [hsubOK, ↓reduceIte, Option.some.injEq] at hok
              subst hok
              have hval' : LinPiecesValid Ψ σ (if (lpHi == rHi) = true then rest else lp :: rest) := by
                split_ifs <;> assumption
              refine ⟨hval', fun r hrLo hrHi ↦ ?_⟩
              have hΨle := hval lp (List.mem_cons_self ..) r
                ((by exact_mod_cast hlo : (lp.lo : ℝ) ≤ rLo).trans hrLo)
                (fun hi h ↦ by
                  rw [hhi] at h; cases h
                  exact hrHi.trans (by exact_mod_cast hend))
              have hsub := subAffineCellOK_sound hM hW hsubOK hrLo (fun _ h ↦ by cases h; exact hrHi)
              cases first with
              | true =>
                simp only [↓reduceIte] at hsub ⊢; nlinarith only [hsub, hΨle, hWnn]
              | false =>
                simp only [Bool.false_eq_true, ↓reduceIte] at hsub ⊢
                have hpow : 0 ≤ (Wden : ℝ) * ((M : ℝ) * r) ^ 4 := by positivity
                nlinarith only [hsub, hΨle, hpow]
            · simp only [hsubOK, ↓reduceIte, reduceCtorEq] at hok
          · simp only [hend, decide_false, Bool.false_eq_true, ↓reduceIte] at hok
            split_ifs at hok with hsubOK
            · obtain ⟨hval', hrec⟩ := sweepFiniteCell_sound hM hW rest lps' lpHi rHi hval_rest hok
              refine ⟨hval', fun r hrLo hrHi ↦ ?_⟩
              by_cases hr : r ≤ (lpHi : ℝ)
              · have hΨle := hval lp (List.mem_cons_self ..) r
                  ((by exact_mod_cast hlo : (lp.lo : ℝ) ≤ rLo).trans hrLo)
                  (fun hi h ↦ by rw [hhi] at h; cases h; exact hr)
                have hsub := subAffineCellOK_sound hM hW hsubOK hrLo (fun _ h ↦ by cases h; exact hr)
                cases first with
                | true =>
                  simp only [↓reduceIte] at hsub ⊢; nlinarith only [hsub, hΨle, hWnn]
                | false =>
                  simp only [Bool.false_eq_true, ↓reduceIte] at hsub ⊢
                  have hpow : 0 ≤ (Wden : ℝ) * ((M : ℝ) * r) ^ 4 := by positivity
                  nlinarith only [hsub, hΨle, hpow]
              · exact hrec r (le_of_lt (not_le.1 hr)) hrHi
        · simp only [hlo, decide_false, Bool.false_eq_true, ↓reduceIte] at hok; cases hok

lemma sweepTailCell_sound {Ψ : ℝ → ℝ} {σ : ℚ} {M : ℕ} {Wden : Int} {Pcell : List Int}
    (hM : 0 < M) (hW : 0 < Wden) :
    ∀ (lps : List LinPiece) (rLo : ℚ),
      LinPiecesValid Ψ σ lps →
      sweepTailCell M Wden Pcell rLo lps = true →
      ∀ r : ℝ, (rLo : ℝ) ≤ r →
        (Wden : ℝ) * ((M : ℝ) * r) ^ 4 * Ψ ((σ : ℝ) * r) ≤ evalInt Pcell ((M : ℝ) * r)
  | [], _, _, hok => by simp [sweepTailCell] at hok
  | lp :: rest, rLo, hval, hok => by
    have hval_rest : LinPiecesValid Ψ σ rest := fun x hx ↦ hval x (List.mem_cons_of_mem _ hx)
    have hWnn : (0 : ℝ) ≤ (Wden : ℝ) := by exact_mod_cast hW.le
    unfold sweepTailCell at hok
    cases hhi : lp.hi? with
    | none =>
      rw [hhi] at hok
      simp only [Bool.and_eq_true, decide_eq_true_eq] at hok
      intro r hrLo
      have hΨle := hval lp (List.mem_cons_self ..) r
        ((by exact_mod_cast hok.1 : (lp.lo : ℝ) ≤ rLo).trans hrLo)
        (fun _ h ↦ by rw [hhi] at h; cases h)
      have hsub := subAffineCellOK_sound hM hW hok.2 hrLo (fun _ h ↦ by cases h)
      simp only [Bool.false_eq_true, ↓reduceIte] at hsub
      have hpow : 0 ≤ (Wden : ℝ) * ((M : ℝ) * r) ^ 4 := by positivity
      nlinarith only [hsub, hΨle, hpow]
    | some lpHi =>
      rw [hhi] at hok
      by_cases hskip : lpHi ≤ rLo
      · simp only [hskip, decide_true, ↓reduceIte] at hok
        exact sweepTailCell_sound hM hW rest rLo hval_rest hok
      · simp only [hskip, decide_false, Bool.false_eq_true, ↓reduceIte, Bool.and_eq_true,
          decide_eq_true_eq] at hok
        obtain ⟨⟨hlo, hsubOK⟩, hrec⟩ := hok
        intro r hrLo
        by_cases hr : r ≤ (lpHi : ℝ)
        · have hΨle := hval lp (List.mem_cons_self ..) r
            ((by exact_mod_cast hlo : (lp.lo : ℝ) ≤ rLo).trans hrLo)
            (fun hi h ↦ by rw [hhi] at h; cases h; exact hr)
          have hsub := subAffineCellOK_sound hM hW hsubOK hrLo (fun _ h ↦ by cases h; exact hr)
          simp only [Bool.false_eq_true, ↓reduceIte] at hsub
          have hpow : 0 ≤ (Wden : ℝ) * ((M : ℝ) * r) ^ 4 := by positivity
          nlinarith only [hsub, hΨle, hpow]
        · exact sweepTailCell_sound hM hW rest lpHi hval_rest hrec r (le_of_lt (not_le.1 hr))

/-! ### Section 3: Pointwise `AntiNode` soundness (general positive even `gridDen`) -/

/-- Knot mesh `e_1, …, e_K` (positive knots `k / M`) of an `AntiNode`. -/
def antiVs (an : AntiNode) : List ℚ :=
  an.knots.tail.map fun (k : ℕ) ↦ (k : ℚ) / (an.gridDen : ℚ)

def antiSlope1 (an : AntiNode) : ℚ := (an.slope1 : ℚ) / (muScale : ℚ)
def antiSlope2 (an : AntiNode) : ℚ := (an.slope2 : ℚ) / (muScale : ℚ)

/-- Pointwise dual majorant of an `AntiNode` at `(u, c1, c2, ρ)`. -/
def antiMaj (an : AntiNode) (u c1 c2 ρ : ℝ) : ℝ :=
  let vs := antiVs an
  let v1 := rowVals an.phi1
  let v2 := rowVals an.phi2
  let sl1 := antiSlope1 an
  let sl2 := antiSlope2 an
  let sL : ℝ := (lamScale : ℝ)
  let sM : ℝ := (muScale : ℝ)
  let l0 : ℝ := (an.lam0 : ℝ) / sL
  let l1 : ℝ := (an.lam1 : ℝ) / sL
  let l2 : ℝ := (an.lam2 : ℝ) / sL
  let l3 : ℝ := ((an.l3s + an.l3a + an.l3b : Int) : ℝ) / sL
  let m1 : ℝ := (an.mu1 : ℝ) / sM
  let m2 : ℝ := (an.mu2 : ℝ) / sM
  let m3 : ℝ := (an.mu3 : ℝ) / sM
  let m4 : ℝ := (an.mu4 : ℝ) / sM
  let m5 : ℝ := (an.mu5 : ℝ) / sM
  let sig : ℝ := (an.sigmaAt : ℝ) / sM
  l0 + l1 * u + l2 * u ^ 2 + l3 * u ^ 3
    + (plPrim vs v1 sl1 u - c2 * plPhi vs v1 sl1 u - ρ * plY vs v1 sl1 u)
    + (plPrim vs v2 sl2 u - (1 / 2) * c1 * plPhi vs v2 sl2 u - (1 / 2) * ρ * plY vs v2 sl2 u)
    + m1 * (c2 - 1) ^ 2 + m2 * (c1 - c2 - 1) ^ 2 + m3 * (c1 + c2 - 3) ^ 2
    + m4 * (c1 - 2) ^ 2 + m5 * ρ ^ 2 + sig * u * ρ

private lemma int_ediv_two_cast {x : Int} (h : 2 ∣ x) : ((x / 2 : Int) : ℝ) = (x : ℝ) / 2 := by
  obtain ⟨k, rfl⟩ := h
  rw [Int.mul_ediv_cancel_left k (by decide)]
  push_cast; ring

private lemma even_sq_div2 {M : ℕ} (hM2 : M % 2 = 0) :
    ((((M : Int) * (M : Int)) / 2 : Int) : ℝ) = (M : ℝ) ^ 2 / 2 := by
  have hd : (2 : Int) ∣ (M : Int) := by
    have : 2 ∣ M := Nat.dvd_of_mod_eq_zero hM2
    exact_mod_cast this
  rw [int_ediv_two_cast (dvd_mul_of_dvd_left hd _)]
  push_cast; ring

private lemma even_pow4_div2 {M : ℕ} (hM2 : M % 2 = 0) :
    (((((M : Int) * (M : Int)) * ((M : Int) * (M : Int))) / 2 : Int) : ℝ) = (M : ℝ) ^ 4 / 2 := by
  have hd : (2 : Int) ∣ (M : Int) := by
    have : 2 ∣ M := Nat.dvd_of_mod_eq_zero hM2
    exact_mod_cast this
  rw [int_ediv_two_cast (dvd_mul_of_dvd_left (dvd_mul_of_dvd_left hd _) _)]
  push_cast; ring

/-- Exact algebraic bridge between `evalInt (pieceFvWGen ...)` and the real bracket formula
for any positive even grid denominator `M = an.gridDen`. -/
private lemma evalInt_pieceFvWGen_eq (an : AntiNode) (tail : Bool) (k0 k1 : ℕ)
    (p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b g1 g2 : Int)
    (hMpos : 0 < an.gridDen) (hM2 : an.gridDen % 2 = 0)
    (hm1 : 0 < an.mu1) (hm2 : 0 < an.mu2) (hm3 : 0 < an.mu3) (hm4 : 0 < an.mu4) (hm5 : 0 < an.mu5)
    (hdu_pos : tail = true ∨ k0 < k1) (u : ℝ) :
    let M : ℝ := (an.gridDen : ℝ)
    let m1 := an.mu2 * an.mu3 * an.mu4 * an.mu5
    let m2 := an.mu1 * an.mu3 * an.mu4 * an.mu5
    let m3 := an.mu1 * an.mu2 * an.mu4 * an.mu5
    let m4 := an.mu1 * an.mu2 * an.mu3 * an.mu5
    let m5 := an.mu1 * an.mu2 * an.mu3 * an.mu4
    let mAll := an.mu1 * m1
    let U0 : ℝ := ((k0 : ℝ) ^ 2)
    let U1 : ℝ := if tail then U0 else ((k1 : ℝ) ^ 2)
    let du : ℝ := if tail then 1 else U1 - U0
    let interp (a0 a1 : Int) : ℝ :=
      if tail then (a0 : ℝ) / (arrScale : ℝ)
      else ((a0 : ℝ) * U1 - (a1 : ℝ) * U0 + ((a1 : ℝ) - (a0 : ℝ)) * (M ^ 2 * u))
        / ((arrScale : ℝ) * du)
    let phi1 := interp p1a p1b + ((an.slope1 : ℝ) / (muScale : ℝ)) * u
    let phi2 := interp p2a p2b + ((an.slope2 : ℝ) / (muScale : ℝ)) * u
    let c0_1 := if tail then (M ^ 2 * rMA : ℝ) * p1a else (M ^ 2 * rMA : ℝ) * (p1a * U1 - p1b * U0)
    let c1_1 := (if tail then 0 else (M ^ 2 * rMA : ℝ) * (p1b - p1a)) + (an.slope1 : ℝ) * du
    let c0_2 := if tail then (M ^ 2 * rMA : ℝ) * p2a else (M ^ 2 * rMA : ℝ) * (p2a * U1 - p2b * U0)
    let c1_2 := (if tail then 0 else (M ^ 2 * rMA : ℝ) * (p2b - p2a)) + (an.slope2 : ℝ) * du
    let G1 := (du * g1 + 2 * c0_1 * (M ^ 2 * u - U0) + c1_1 * ((M ^ 2 * u) ^ 2 - U0 ^ 2))
      / (2 * M ^ 4 * (muScale : ℝ) * du)
    let G2 := (du * g2 + 2 * c0_2 * (M ^ 2 * u - U0) + c1_2 * ((M ^ 2 * u) ^ 2 - U0 ^ 2))
      / (2 * M ^ 4 * (muScale : ℝ) * du)
    let xi2 := interp x2a x2b
    let xi1 := interp x1a x1b
    let xia := interp xaa xab
    let th2 := interp t2a t2b
    let th4 := interp t4a t4b
    let th3 := xi1 + phi2 / 2 - th2 - th4
    let th1 := xi2 + phi1 + th2 - th3
    let vth5 := u * xia + (u * phi1 - G1) + (u * phi2 - G2) / 2
      - ((an.sigmaAt : ℝ) / (muScale : ℝ)) * u ^ 2
    let sL : ℝ := (lamScale : ℝ)
    let sM : ℝ := (muScale : ℝ)
    let lamP := (an.lam0 : ℝ) / sL + (an.lam1 : ℝ) / sL * u + (an.lam2 : ℝ) / sL * u ^ 2
      + ((an.l3s + an.l3a + an.l3b : Int) : ℝ) / sL * u ^ 3
    let mu1R : ℝ := (an.mu1 : ℝ) / sM
    let mu2R : ℝ := (an.mu2 : ℝ) / sM
    let mu3R : ℝ := (an.mu3 : ℝ) / sM
    let mu4R : ℝ := (an.mu4 : ℝ) / sM
    let mu5R : ℝ := (an.mu5 : ℝ) / sM
    let Wden : ℝ := M ^ 10 * sL * du ^ 2 * (mAll : ℝ)
    evalInt (pieceFvWGen an mAll m1 m2 m3 m4 m5 tail k0 k1
      p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b g1 g2) (M ^ 2 * u)
      = Wden * (u ^ 2 * (lamP + G1 + G2 - (th1 + th2 + 3 * th3 + 2 * th4)
          - (th1 ^ 2 / (4 * mu1R) + th2 ^ 2 / (4 * mu2R)
            + th3 ^ 2 / (4 * mu3R) + th4 ^ 2 / (4 * mu4R)))
        - vth5 ^ 2 / (4 * mu5R)) := by
  intro M m1 m2 m3 m4 m5 mAll U0 U1 du interp phi1 phi2 c0_1 c1_1 c0_2 c1_2 G1 G2
    xi2 xi1 xia th2 th4 th3 th1 vth5 sL sM lamP mu1R mu2R mu3R mu4R mu5R Wden
  have hMne : M ≠ 0 := show (an.gridDen : ℝ) ≠ 0 by exact_mod_cast hMpos.ne'
  have hm1R : (an.mu1 : ℝ) ≠ 0 := by exact_mod_cast hm1.ne'
  have hm2R : (an.mu2 : ℝ) ≠ 0 := by exact_mod_cast hm2.ne'
  have hm3R : (an.mu3 : ℝ) ≠ 0 := by exact_mod_cast hm3.ne'
  have hm4R : (an.mu4 : ℝ) ≠ 0 := by exact_mod_cast hm4.ne'
  have hm5R : (an.mu5 : ℝ) ≠ 0 := by exact_mod_cast hm5.ne'
  have hS_A : (arrScale : ℝ) = 68719476736 := by norm_num [arrScale]
  have hS_M : (muScale : ℝ) = 1125899906842624 := by norm_num [muScale]
  have hS_L : (lamScale : ℝ) = 4611686018427387904 := by norm_num [lamScale]
  have hR_MA : (rMA : ℝ) = 16384 := by norm_num [rMA]
  have hR_LM : (rLM : ℝ) = 4096 := by norm_num [rLM]
  have hdu : du ≠ 0 := by
    cases tail with
    | true => simp [du]
    | false =>
      rcases hdu_pos with h | hlt
      · cases h
      · have hk : (k0 : ℝ) < (k1 : ℝ) := by exact_mod_cast hlt
        have hk0 : (0 : ℝ) ≤ (k0 : ℝ) := Nat.cast_nonneg k0
        simp only [du, U1, U0, Bool.false_eq_true, ↓reduceIte]
        nlinarith
  let MI : Int := (an.gridDen : Int)
  let M2I : Int := MI * MI
  let M4I : Int := M2I * M2I
  let M6I : Int := M4I * M2I
  let U0I : Int := (k0 : Int) * (k0 : Int)
  let U1I : Int := if tail then U0I else (k1 : Int) * (k1 : Int)
  let duI : Int := if tail then 1 else U1I - U0I
  let mkP (a0 a1 : Int) : List Int := if tail then [a0] else [a0 * U1I - a1 * U0I, a1 - a0]
  let ph1p := pAdd (pScale (M2I * rMA) (mkP p1a p1b)) [0, an.slope1 * duI]
  let ph2p := pAdd (pScale (M2I * rMA) (mkP p2a p2b)) [0, an.slope2 * duI]
  let mkG (g : Int) (ph : List Int) : List Int :=
    let c0 := ph.getD 0 0
    let c1 := ph.getD 1 0
    [duI * g - 2 * c0 * U0I - c1 * U0I * U0I, 2 * c0, c1]
  let G1p := mkG g1 ph1p
  let G2p := mkG g2 ph2p
  let T2 := pScale (2 * M2I * rMA) (mkP t2a t2b)
  let T4 := pScale (2 * M2I * rMA) (mkP t4a t4b)
  let T3 := pSub (pSub (pAdd (pScale (2 * M2I * rMA) (mkP x1a x1b)) ph2p) T2) T4
  let T1 := pSub (pAdd (pAdd (pScale (2 * M2I * rMA) (mkP x2a x2b)) (pScale 2 ph1p)) T2) T3
  let T5 := pSub
    (pAdd
      (pSub (pAdd (pShift 1 (pScale (4 * M2I * rMA) (mkP xaa xab))) (pShift 1 (pScale 4 ph1p)))
        (pScale 2 G1p))
      (pSub (pShift 1 (pScale 2 ph2p)) G2p))
    [0, 0, 4 * duI * an.sigmaAt]
  let du2M := duI * duI * mAll
  let L3 := an.l3s + an.l3a + an.l3b
  let lamW := [M6I * an.lam0 * du2M, M4I * an.lam1 * du2M, M2I * an.lam2 * du2M, L3 * du2M]
  let GW := pScale ((M2I / 2) * rLM * duI * mAll) (pAdd G1p G2p)
  let linC := pAdd (pAdd T1 T2) (pAdd (pScale 3 T3) (pScale 2 T4))
  let linW := pScale ((M4I / 2) * rLM * duI * mAll) linC
  let sqW := pAdd
    (pAdd (pScale (256 * M2I * m1) (pMul T1 T1)) (pScale (256 * M2I * m2) (pMul T2 T2)))
    (pAdd (pScale (256 * M2I * m3) (pMul T3 T3)) (pScale (256 * M2I * m4) (pMul T4 T4)))
  let brW := pSub (pSub (pAdd lamW GW) linW) sqW
  change evalInt (pSub (pShift 2 brW) (pScale (64 * M2I * m5) (pMul T5 T5))) (M ^ 2 * u) = _
  have hM2I : (M2I : ℝ) = M ^ 2 := by simp [M2I, MI, M, sq]
  have hM4I : (M4I : ℝ) = M ^ 4 := by simp only [M4I, Int.cast_mul, hM2I]; ring
  have hM6I : (M6I : ℝ) = M ^ 6 := by simp only [M6I, Int.cast_mul, hM4I, hM2I]; ring
  have hM2d2 : ((M2I / 2 : Int) : ℝ) = M ^ 2 / 2 := even_sq_div2 hM2
  have hM4d2 : ((M4I / 2 : Int) : ℝ) = M ^ 4 / 2 := even_pow4_div2 hM2
  have hU0I : (U0I : ℝ) = U0 := by simp [U0I, U0, sq]
  have hU1I : (U1I : ℝ) = U1 := by cases tail <;> simp [U1I, U1, U0I, U0, sq]
  have hduI : (duI : ℝ) = du := by cases tail <;> simp [duI, du, U1I, U0I, U1, U0, sq]
  have hmkP : ∀ a0 a1 : Int, evalInt (mkP a0 a1) (M ^ 2 * u) = (arrScale : ℝ) * du * interp a0 a1 := by
    intro a0 a1
    cases tail with
    | true =>
      simp only [mkP, interp, du, ↓reduceIte, evalInt_cons, evalInt_nil, mul_zero, add_zero, mul_one]
      rw [hS_A]; field_simp
    | false =>
      simp only [mkP, interp, Bool.false_eq_true, ↓reduceIte, evalInt_cons, evalInt_nil, mul_zero,
        add_zero, Int.cast_sub, Int.cast_mul, hU0I, hU1I]
      rw [hS_A]; field_simp [hdu]
  have hph1 : evalInt ph1p (M ^ 2 * u) = M ^ 2 * sM * du * phi1 := by
    simp only [ph1p, evalInt_add, evalInt_scale, hmkP, evalInt_cons, evalInt_nil, mul_zero,
      add_zero, Int.cast_mul, Int.cast_zero, zero_add, hduI, hM2I]
    simp only [phi1, sM, hS_A, hS_M, hR_MA]; field_simp; ring
  have hph2 : evalInt ph2p (M ^ 2 * u) = M ^ 2 * sM * du * phi2 := by
    simp only [ph2p, evalInt_add, evalInt_scale, hmkP, evalInt_cons, evalInt_nil, mul_zero,
      add_zero, Int.cast_mul, Int.cast_zero, zero_add, hduI, hM2I]
    simp only [phi2, sM, hS_A, hS_M, hR_MA]; field_simp; ring
  have hph1_0 : (ph1p.getD 0 0 : ℝ) = c0_1 := by
    cases tail <;> simp [ph1p, mkP, pAdd, pScale, c0_1, hU0I, hU1I, hM2I]
  have hph1_1 : (ph1p.getD 1 0 : ℝ) = c1_1 := by
    cases tail <;> simp [ph1p, mkP, pAdd, pScale, c1_1, hduI, du, hM2I]
  have hph2_0 : (ph2p.getD 0 0 : ℝ) = c0_2 := by
    cases tail <;> simp [ph2p, mkP, pAdd, pScale, c0_2, hU0I, hU1I, hM2I]
  have hph2_1 : (ph2p.getD 1 0 : ℝ) = c1_2 := by
    cases tail <;> simp [ph2p, mkP, pAdd, pScale, c1_2, hduI, du, hM2I]
  have hG1 : evalInt G1p (M ^ 2 * u) = 2 * M ^ 4 * sM * du * G1 := by
    simp only [G1p, mkG, evalInt_cons, evalInt_nil, mul_zero, add_zero, Int.cast_sub, Int.cast_mul,
      Int.cast_ofNat, hduI, hU0I, hph1_0, hph1_1]
    simp only [G1, sM, hS_M]; field_simp [hdu, hMne]; ring
  have hG2 : evalInt G2p (M ^ 2 * u) = 2 * M ^ 4 * sM * du * G2 := by
    simp only [G2p, mkG, evalInt_cons, evalInt_nil, mul_zero, add_zero, Int.cast_sub, Int.cast_mul,
      Int.cast_ofNat, hduI, hU0I, hph2_0, hph2_1]
    simp only [G2, sM, hS_M]; field_simp [hdu, hMne]; ring
  have hT2 : evalInt T2 (M ^ 2 * u) = 2 * M ^ 2 * sM * du * th2 := by
    simp only [T2, evalInt_scale, hmkP, Int.cast_mul, Int.cast_ofNat, hM2I]
    simp only [th2, sM, hS_A, hS_M, hR_MA]; ring
  have hT4 : evalInt T4 (M ^ 2 * u) = 2 * M ^ 2 * sM * du * th4 := by
    simp only [T4, evalInt_scale, hmkP, Int.cast_mul, Int.cast_ofNat, hM2I]
    simp only [th4, sM, hS_A, hS_M, hR_MA]; ring
  have hT3 : evalInt T3 (M ^ 2 * u) = 2 * M ^ 2 * sM * du * th3 := by
    simp only [T3, evalInt_sub, evalInt_add, evalInt_scale, hmkP, hph2, hT2, hT4,
      Int.cast_mul, Int.cast_ofNat, hM2I]
    simp only [th3, xi1, sM, hS_A, hS_M, hR_MA]; ring
  have hT1 : evalInt T1 (M ^ 2 * u) = 2 * M ^ 2 * sM * du * th1 := by
    simp only [T1, evalInt_sub, evalInt_add, evalInt_scale, hmkP, hph1, hT2, hT3,
      Int.cast_mul, Int.cast_ofNat, hM2I]
    simp only [th1, xi2, sM, hS_A, hS_M, hR_MA]; ring
  have hT5 : evalInt T5 (M ^ 2 * u) = 4 * M ^ 4 * sM * du * vth5 := by
    simp only [T5, evalInt_sub, evalInt_add, evalInt_shift, evalInt_scale, hmkP, hph1, hph2,
      hG1, hG2, evalInt_cons, evalInt_nil, mul_zero, add_zero, Int.cast_mul, Int.cast_ofNat,
      Int.cast_zero, zero_add, hduI, hM2I]
    simp only [vth5, xia, sM, hS_A, hS_M, hR_MA]; field_simp; ring
  have hlamW : evalInt lamW (M ^ 2 * u) = M ^ 6 * sL * du ^ 2 * (mAll : ℝ) * lamP := by
    simp only [lamW, L3, du2M, evalInt_cons, evalInt_nil, mul_zero, add_zero, Int.cast_mul,
      hduI, hM2I, hM4I, hM6I]
    simp only [lamP, sL, hS_L]; field_simp; ring
  have hGW : evalInt GW (M ^ 2 * u) = M ^ 6 * sL * du ^ 2 * (mAll : ℝ) * (G1 + G2) := by
    simp only [GW, evalInt_scale, evalInt_add, hG1, hG2, Int.cast_mul, hduI, hM2d2]
    simp only [sL, sM, hS_L, hS_M, hR_LM]; ring
  have hlinW : evalInt linW (M ^ 2 * u)
      = M ^ 6 * sL * du ^ 2 * (mAll : ℝ) * (th1 + th2 + 3 * th3 + 2 * th4) := by
    simp only [linW, linC, evalInt_scale, evalInt_add, hT1, hT2, hT3, hT4,
      Int.cast_mul, Int.cast_ofNat, hduI, hM4d2]
    simp only [sL, sM, hS_L, hS_M, hR_LM]; ring
  have hsqW : evalInt sqW (M ^ 2 * u)
      = M ^ 6 * sL * du ^ 2 * (mAll : ℝ)
        * (th1 ^ 2 / (4 * mu1R) + th2 ^ 2 / (4 * mu2R)
          + th3 ^ 2 / (4 * mu3R) + th4 ^ 2 / (4 * mu4R)) := by
    simp only [sqW, evalInt_add, evalInt_scale, evalInt_mul, hT1, hT2, hT3, hT4,
      Int.cast_mul, Int.cast_ofNat, hM2I]
    simp only [mu1R, mu2R, mu3R, mu4R, mAll, m1, m2, m3, m4, sL, sM, hS_L, hS_M, Int.cast_mul]
    field_simp [hm1R, hm2R, hm3R, hm4R]; ring
  simp only [evalInt_sub, evalInt_shift, evalInt_scale, evalInt_mul, brW, evalInt_add,
    hlamW, hGW, hlinW, hsqW, hT5, Int.cast_mul, Int.cast_ofNat, hM2I]
  simp only [Wden, mu5R, mAll, m1, m5, sL, sM, hS_L, hS_M, Int.cast_mul]
  field_simp [hm5R]
  ring

/-- On the first cell (`k0 = 0`), `evalInt (FvW.drop 2) 0` recovers the `u = 0` value of
`bracket(0) - xia(0)^2 / (4 mu5)`. -/
private lemma evalInt_pieceFvWGen_zero (an : AntiNode) (k1 : ℕ)
    (p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b : Int)
    (hMpos : 0 < an.gridDen) (hM2 : an.gridDen % 2 = 0)
    (hm1 : 0 < an.mu1) (hm2 : 0 < an.mu2) (hm3 : 0 < an.mu3) (hm4 : 0 < an.mu4) (hm5 : 0 < an.mu5)
    (hk1 : 0 < k1)
    (h0 : (pieceFvWGen an (an.mu1 * (an.mu2 * an.mu3 * an.mu4 * an.mu5))
      (an.mu2 * an.mu3 * an.mu4 * an.mu5) (an.mu1 * an.mu3 * an.mu4 * an.mu5)
      (an.mu1 * an.mu2 * an.mu4 * an.mu5) (an.mu1 * an.mu2 * an.mu3 * an.mu5)
      (an.mu1 * an.mu2 * an.mu3 * an.mu4) false 0 k1
      p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b 0 0).getD 0 0 = 0)
    (h1 : (pieceFvWGen an (an.mu1 * (an.mu2 * an.mu3 * an.mu4 * an.mu5))
      (an.mu2 * an.mu3 * an.mu4 * an.mu5) (an.mu1 * an.mu3 * an.mu4 * an.mu5)
      (an.mu1 * an.mu2 * an.mu4 * an.mu5) (an.mu1 * an.mu2 * an.mu3 * an.mu5)
      (an.mu1 * an.mu2 * an.mu3 * an.mu4) false 0 k1
      p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b 0 0).getD 1 0 = 0) :
    let M : ℝ := (an.gridDen : ℝ)
    let m1 := an.mu2 * an.mu3 * an.mu4 * an.mu5
    let m2 := an.mu1 * an.mu3 * an.mu4 * an.mu5
    let m3 := an.mu1 * an.mu2 * an.mu4 * an.mu5
    let m4 := an.mu1 * an.mu2 * an.mu3 * an.mu5
    let m5 := an.mu1 * an.mu2 * an.mu3 * an.mu4
    let mAll := an.mu1 * m1
    let du : ℝ := (k1 : ℝ) ^ 2
    let sL : ℝ := (lamScale : ℝ)
    let sM : ℝ := (muScale : ℝ)
    let p1R : ℝ := (p1a : ℝ) / (arrScale : ℝ)
    let p2R : ℝ := (p2a : ℝ) / (arrScale : ℝ)
    let x2R : ℝ := (x2a : ℝ) / (arrScale : ℝ)
    let x1R : ℝ := (x1a : ℝ) / (arrScale : ℝ)
    let xaR : ℝ := (xaa : ℝ) / (arrScale : ℝ)
    let t2R : ℝ := (t2a : ℝ) / (arrScale : ℝ)
    let t4R : ℝ := (t4a : ℝ) / (arrScale : ℝ)
    let t3R := x1R + p2R / 2 - t2R - t4R
    let t1R := x2R + p1R + t2R - t3R
    let mu1R : ℝ := (an.mu1 : ℝ) / sM
    let mu2R : ℝ := (an.mu2 : ℝ) / sM
    let mu3R : ℝ := (an.mu3 : ℝ) / sM
    let mu4R : ℝ := (an.mu4 : ℝ) / sM
    let mu5R : ℝ := (an.mu5 : ℝ) / sM
    evalInt ((pieceFvWGen an mAll m1 m2 m3 m4 m5 false 0 k1
      p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b 0 0).drop 2) 0
      = (M ^ 6 * sL * du ^ 2 * (mAll : ℝ))
        * ((an.lam0 : ℝ) / sL - (t1R + t2R + 3 * t3R + 2 * t4R)
          - (t1R ^ 2 / (4 * mu1R) + t2R ^ 2 / (4 * mu2R) + t3R ^ 2 / (4 * mu3R)
            + t4R ^ 2 / (4 * mu4R) + xaR ^ 2 / (4 * mu5R))) := by
  intro M m1 m2 m3 m4 m5 mAll du sL sM p1R p2R x2R x1R xaR t2R t4R t3R t1R
    mu1R mu2R mu3R mu4R mu5R
  set Fv := pieceFvWGen an mAll m1 m2 m3 m4 m5 false 0 k1
    p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b 0 0
  have hMposR : (0 : ℝ) < M := show (0 : ℝ) < (an.gridDen : ℝ) by exact_mod_cast hMpos
  have hdu_pos : (0 : ℝ) < du := by
    have : (0 : ℝ) < (k1 : ℝ) := by exact_mod_cast hk1
    positivity
  have hcont_eval : ∀ q : List Int, Continuous fun u : ℝ ↦ evalInt q u := by
    intro q
    induction q with
    | nil => exact continuous_const
    | cons a l ih =>
      show Continuous fun u : ℝ ↦ (a : ℝ) + u * evalInt l u
      exact continuous_const.add (continuous_id.mul ih)
  have hcont_L : Continuous fun u : ℝ ↦ evalInt (Fv.drop 2) (M ^ 2 * u) :=
    (hcont_eval (Fv.drop 2)).comp (by fun_prop)
  let interp (a0 a1 : Int) (u : ℝ) : ℝ :=
    ((a0 : ℝ) * (k1 : ℝ) ^ 2 + ((a1 : ℝ) - (a0 : ℝ)) * (M ^ 2 * u)) / ((arrScale : ℝ) * du)
  let phi1u (u : ℝ) := interp p1a p1b u + ((an.slope1 : ℝ) / sM) * u
  let phi2u (u : ℝ) := interp p2a p2b u + ((an.slope2 : ℝ) / sM) * u
  let c0_1 : ℝ := (M ^ 2 * rMA : ℝ) * (p1a * (k1 : ℝ) ^ 2)
  let c1_1 : ℝ := (M ^ 2 * rMA : ℝ) * (p1b - p1a) + (an.slope1 : ℝ) * du
  let c0_2 : ℝ := (M ^ 2 * rMA : ℝ) * (p2a * (k1 : ℝ) ^ 2)
  let c1_2 : ℝ := (M ^ 2 * rMA : ℝ) * (p2b - p2a) + (an.slope2 : ℝ) * du
  let G1u (u : ℝ) := (2 * c0_1 * (M ^ 2 * u) + c1_1 * (M ^ 2 * u) ^ 2) / (2 * M ^ 4 * sM * du)
  let G2u (u : ℝ) := (2 * c0_2 * (M ^ 2 * u) + c1_2 * (M ^ 2 * u) ^ 2) / (2 * M ^ 4 * sM * du)
  let th2u (u : ℝ) := interp t2a t2b u
  let th4u (u : ℝ) := interp t4a t4b u
  let th3u (u : ℝ) := interp x1a x1b u + phi2u u / 2 - th2u u - th4u u
  let th1u (u : ℝ) := interp x2a x2b u + phi1u u + th2u u - th3u u
  let th5u (u : ℝ) := interp xaa xab u
    + (phi1u u - (2 * c0_1 * M ^ 2 + c1_1 * M ^ 4 * u) / (2 * M ^ 4 * sM * du))
    + (phi2u u - (2 * c0_2 * M ^ 2 + c1_2 * M ^ 4 * u) / (2 * M ^ 4 * sM * du)) / 2
    - ((an.sigmaAt : ℝ) / sM) * u
  let lamPu (u : ℝ) := (an.lam0 : ℝ) / sL + (an.lam1 : ℝ) / sL * u + (an.lam2 : ℝ) / sL * u ^ 2
    + ((an.l3s + an.l3a + an.l3b : Int) : ℝ) / sL * u ^ 3
  let Rfn (u : ℝ) : ℝ :=
    (M ^ 6 * sL * du ^ 2 * (mAll : ℝ))
      * (lamPu u + G1u u + G2u u - (th1u u + th2u u + 3 * th3u u + 2 * th4u u)
        - (th1u u ^ 2 / (4 * mu1R) + th2u u ^ 2 / (4 * mu2R)
          + th3u u ^ 2 / (4 * mu3R) + th4u u ^ 2 / (4 * mu4R)
          + th5u u ^ 2 / (4 * mu5R)))
  have hcont_interp : ∀ a0 a1 : Int, Continuous (interp a0 a1) := fun a0 a1 ↦ by
    unfold interp; fun_prop
  have hcont_R : Continuous Rfn := by
    have hp1 : Continuous phi1u := (hcont_interp p1a p1b).add (continuous_const.mul continuous_id)
    have hp2 : Continuous phi2u := (hcont_interp p2a p2b).add (continuous_const.mul continuous_id)
    have hg1 : Continuous G1u := by unfold G1u; fun_prop
    have hg2 : Continuous G2u := by unfold G2u; fun_prop
    have ht2 : Continuous th2u := hcont_interp t2a t2b
    have ht4 : Continuous th4u := hcont_interp t4a t4b
    have ht3 : Continuous th3u := (((hcont_interp x1a x1b).add (hp2.div_const 2)).sub ht2).sub ht4
    have ht1 : Continuous th1u := (((hcont_interp x2a x2b).add hp1).add ht2).sub ht3
    have ht5 : Continuous th5u := by
      have h1' : Continuous fun u : ℝ ↦ (2 * c0_1 * M ^ 2 + c1_1 * M ^ 4 * u) / (2 * M ^ 4 * sM * du) := by fun_prop
      have h2' : Continuous fun u : ℝ ↦ (2 * c0_2 * M ^ 2 + c1_2 * M ^ 4 * u) / (2 * M ^ 4 * sM * du) := by fun_prop
      exact (((hcont_interp xaa xab).add (hp1.sub h1')).add ((hp2.sub h2').div_const 2)).sub
        (continuous_const.mul continuous_id)
    have hlam : Continuous lamPu := by unfold lamPu; fun_prop
    exact continuous_const.mul
      ((((hlam.add hg1).add hg2).sub (((ht1.add ht2).add (continuous_const.mul ht3)).add
        (continuous_const.mul ht4))).sub
        ((((((ht1.pow 2).div_const _).add ((ht2.pow 2).div_const _)).add
          ((ht3.pow 2).div_const _)).add ((ht4.pow 2).div_const _)).add ((ht5.pow 2).div_const _)))
  have hpos_eq : ∀ u : ℝ, u ≠ 0 → evalInt (Fv.drop 2) (M ^ 2 * u) = Rfn u := by
    intro u hu
    have hbridge := evalInt_pieceFvWGen_eq an false 0 k1
      p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b 0 0 hMpos hM2 hm1 hm2 hm3 hm4 hm5
      (Or.inr hk1) u
    have hdrop := evalInt_drop2 Fv h0 h1 (M ^ 2 * u)
    have hm2u : (M ^ 2 * u) ^ 2 ≠ 0 := pow_ne_zero 2 (mul_ne_zero (pow_ne_zero 2 hMposR.ne') hu)
    have hmu5 : (4 * mu5R) ≠ 0 := by
      have : (0 : ℝ) < mu5R := div_pos (by exact_mod_cast hm5) (by norm_num [sM, muScale])
      linarith
    have hmul : (M ^ 2 * u) ^ 2 * evalInt (Fv.drop 2) (M ^ 2 * u) = (M ^ 2 * u) ^ 2 * Rfn u := by
      rw [← hdrop]
      refine hbridge.trans ?_
      simp only [Bool.false_eq_true, ↓reduceIte, Nat.cast_zero, Int.cast_zero,
        zero_pow (by decide : 2 ≠ 0), mul_zero, zero_add, sub_zero]
      have hth5_eq : u * interp xaa xab u + (u * phi1u u - G1u u) + (u * phi2u u - G2u u) / 2
          - ((an.sigmaAt : ℝ) / sM) * u ^ 2 = u * th5u u := by
        simp only [th5u, G1u, G2u]; ring
      change (M ^ 10 * sL * du ^ 2 * (mAll : ℝ)) * (u ^ 2 * (lamPu u + G1u u + G2u u
          - (th1u u + th2u u + 3 * th3u u + 2 * th4u u)
          - (th1u u ^ 2 / (4 * mu1R) + th2u u ^ 2 / (4 * mu2R)
            + th3u u ^ 2 / (4 * mu3R) + th4u u ^ 2 / (4 * mu4R)))
        - (u * interp xaa xab u + (u * phi1u u - G1u u) + (u * phi2u u - G2u u) / 2
            - ((an.sigmaAt : ℝ) / sM) * u ^ 2) ^ 2 / (4 * mu5R)) = _
      rw [hth5_eq]
      simp only [Rfn]
      field_simp [hmu5]
      ring
    exact mul_left_cancel₀ hm2u hmul
  have heq0 : evalInt (Fv.drop 2) (M ^ 2 * 0) = Rfn 0 := by
    have hL : Filter.Tendsto (fun u : ℝ ↦ evalInt (Fv.drop 2) (M ^ 2 * u))
        (nhdsWithin 0 {(0 : ℝ)}ᶜ) (nhds (evalInt (Fv.drop 2) (M ^ 2 * 0))) :=
      (hcont_L.continuousAt.tendsto).mono_left nhdsWithin_le_nhds
    have hR : Filter.Tendsto Rfn (nhdsWithin 0 {(0 : ℝ)}ᶜ) (nhds (Rfn 0)) :=
      (hcont_R.continuousAt.tendsto).mono_left nhdsWithin_le_nhds
    have hL' : Filter.Tendsto (fun u : ℝ ↦ evalInt (Fv.drop 2) (M ^ 2 * u))
        (nhdsWithin 0 {(0 : ℝ)}ᶜ) (nhds (Rfn 0)) :=
      hR.congr' (eventually_nhdsWithin_of_forall fun u hu ↦ (hpos_eq u hu).symm)
    exact tendsto_nhds_unique hL hL'
  rw [mul_zero] at heq0
  rw [heq0]
  have hinterp0 : ∀ a0 a1 : Int, interp a0 a1 0 = (a0 : ℝ) / (arrScale : ℝ) := fun a0 a1 ↦ by
    simp only [interp, du, mul_zero, add_zero]
    field_simp [hdu_pos.ne']
  have hS_A : (arrScale : ℝ) = 68719476736 := by norm_num [arrScale]
  have hS_M : (muScale : ℝ) = 1125899906842624 := by norm_num [muScale]
  have hR_MA : (rMA : ℝ) = 16384 := by norm_num [rMA]
  have hc01_cancel : (2 * c0_1 * M ^ 2) / (2 * M ^ 4 * sM * du) = p1R := by
    simp only [c0_1, p1R, du, sM, hS_A, hS_M, hR_MA]
    field_simp [hdu_pos.ne', hMposR.ne']; ring
  have hc02_cancel : (2 * c0_2 * M ^ 2) / (2 * M ^ 4 * sM * du) = p2R := by
    simp only [c0_2, p2R, du, sM, hS_A, hS_M, hR_MA]
    field_simp [hdu_pos.ne', hMposR.ne']; ring
  have hth5_0 : th5u 0 = xaR := by
    simp only [th5u, phi1u, phi2u, hinterp0, mul_zero, add_zero, sub_zero]
    rw [hc01_cancel, hc02_cancel]
    simp only [p1R, p2R, xaR]; ring
  simp only [Rfn, hth5_0, lamPu, G1u, G2u, th1u, th3u, phi1u, phi2u,
    th2u, th4u, hinterp0, mul_zero, add_zero, zero_div, ne_eq,
    OfNat.ofNat_ne_zero, not_false_eq_true, zero_pow]
  rfl

private lemma tailConst_antiVals_eq {M : ℕ} {ks : List ℕ} {xs : List Int} (hlen : xs.length = ks.length)
    (hne : ks ≠ []) :
    tailConst (ks.tail.map fun (k : ℕ) ↦ (k : ℚ) / (M : ℚ)) (rowVals xs)
      = ((xs.getLast (by intro h; simp [h] at hlen; exact hne (List.eq_nil_of_length_eq_zero hlen.symm)) : ℚ)
        / (arrScale : ℚ)) := by
  unfold tailConst rowVals
  have hpos : 0 < ks.length := List.length_pos_iff.2 hne
  have hidx : (ks.tail.map fun (k : ℕ) ↦ (k : ℚ) / (M : ℚ)).length = xs.length - 1 := by
    simp [hlen]
  rw [hidx, List.getD_eq_getElem _ _ (by simp; omega)]
  simp [List.getLast_eq_getElem]

private lemma checkAntiPiecesAux_head_cone {an : AntiNode} {mAll m1 m2 m3 m4 m5 : Int}
    {first : Bool} {g1 g2 : Int} {k0 : ℕ} {ks : List ℕ}
    {p1s p2s x2s x1s xas t2s t4s : List Int} {x2a x1a xaa : Int} {lps : List LinPiece}
    (hok : checkAntiPiecesAux an mAll m1 m2 m3 m4 m5 first g1 g2 (k0 :: ks)
      p1s p2s (x2a :: x2s) (x1a :: x1s) (xaa :: xas) t2s t4s lps = true) :
    coneAtOK x2a x1a xaa = true := by
  cases ks with
  | nil =>
    cases p1s with
    | nil => simp [checkAntiPiecesAux] at hok
    | cons _ p1s' =>
      cases p1s' with
      | cons _ _ => simp [checkAntiPiecesAux] at hok
      | nil =>
        cases p2s with
        | nil => simp [checkAntiPiecesAux] at hok
        | cons _ p2s' =>
          cases p2s' with
          | cons _ _ => simp [checkAntiPiecesAux] at hok
          | nil =>
            cases x2s with
            | cons _ _ => simp [checkAntiPiecesAux] at hok
            | nil =>
              cases x1s with
              | cons _ _ => simp [checkAntiPiecesAux] at hok
              | nil =>
                cases xas with
                | cons _ _ => simp [checkAntiPiecesAux] at hok
                | nil =>
                  cases t2s with
                  | nil => simp [checkAntiPiecesAux] at hok
                  | cons _ t2s' =>
                    cases t2s' with
                    | cons _ _ => simp [checkAntiPiecesAux] at hok
                    | nil =>
                      cases t4s with
                      | nil => simp [checkAntiPiecesAux] at hok
                      | cons _ t4s' =>
                        cases t4s' with
                        | cons _ _ => simp [checkAntiPiecesAux] at hok
                        | nil =>
                          simp only [checkAntiPiecesAux, Bool.and_eq_true] at hok
                          exact hok.1.2
  | cons _ _ =>
    cases p1s with
    | nil => simp [checkAntiPiecesAux] at hok
    | cons _ p1s' =>
      cases p1s' with
      | nil => simp [checkAntiPiecesAux] at hok
      | cons _ _ =>
        cases p2s with
        | nil => simp [checkAntiPiecesAux] at hok
        | cons _ p2s' =>
          cases p2s' with
          | nil => simp [checkAntiPiecesAux] at hok
          | cons _ _ =>
            cases x2s with
            | nil => simp [checkAntiPiecesAux] at hok
            | cons _ _ =>
              cases x1s with
              | nil => simp [checkAntiPiecesAux] at hok
              | cons _ _ =>
                cases xas with
                | nil => simp [checkAntiPiecesAux] at hok
                | cons _ _ =>
                  cases t2s with
                  | nil => simp [checkAntiPiecesAux] at hok
                  | cons _ t2s' =>
                    cases t2s' with
                    | nil => simp [checkAntiPiecesAux] at hok
                    | cons _ _ =>
                      cases t4s with
                      | nil => simp [checkAntiPiecesAux] at hok
                      | cons _ t4s' =>
                        cases t4s' with
                        | nil => simp [checkAntiPiecesAux] at hok
                        | cons _ _ =>
                          by_contra hc
                          have hcf : coneAtOK x2a x1a xaa = false := Bool.eq_false_iff.2 hc
                          simp [checkAntiPiecesAux, hcf] at hok

private lemma checkAntiPiecesAux_tail_sound (an : AntiNode) (Ψ : ℝ → ℝ)
    (hMpos : 0 < an.gridDen) (hM2 : an.gridDen % 2 = 0)
    (hm1 : 0 < an.mu1) (hm2 : 0 < an.mu2) (hm3 : 0 < an.mu3) (hm4 : 0 < an.mu4) (hm5 : 0 < an.mu5)
    (cv1 cv2 : List ℚ) (tc1 tc2 : ℚ) (g1 g2 : Int) (Phi1 Phi2 : ℚ) (idx kK : ℕ)
    (p1 p2 x2 x1 xa t2 t4 : Int) (lps : List LinPiece)
    (hkKpos : 0 < kK)
    (htc1 : (p1 : ℚ) / (arrScale : ℚ) = tc1) (htc2 : (p2 : ℚ) / (arrScale : ℚ) = tc2)
    (hg1 : (g1 : ℝ) = 2 * (an.gridDen : ℝ) ^ 4 * (muScale : ℝ)
      * ((Phi1 : ℝ) + (tc1 : ℝ) * ((kK : ℝ) / (an.gridDen : ℝ)) ^ 2
        + (antiSlope1 an : ℝ) / 2 * (((kK : ℝ) / (an.gridDen : ℝ)) ^ 2) ^ 2))
    (hg2 : (g2 : ℝ) = 2 * (an.gridDen : ℝ) ^ 4 * (muScale : ℝ)
      * ((Phi2 : ℝ) + (tc2 : ℝ) * ((kK : ℝ) / (an.gridDen : ℝ)) ^ 2
        + (antiSlope2 an : ℝ) / 2 * (((kK : ℝ) / (an.gridDen : ℝ)) ^ 2) ^ 2))
    (hconeOK : coneAtOK x2 x1 xa = true)
    (hlps : LinPiecesValid Ψ an.sigma lps)
    (hray : sweepTailCell an.gridDen
      ((an.gridDen : Int) ^ 6 * lamScale * (an.mu1 * (an.mu2 * an.mu3 * an.mu4 * an.mu5)))
      (pInSq (pieceFvWGen an (an.mu1 * (an.mu2 * an.mu3 * an.mu4 * an.mu5))
        (an.mu2 * an.mu3 * an.mu4 * an.mu5) (an.mu1 * an.mu3 * an.mu4 * an.mu5)
        (an.mu1 * an.mu2 * an.mu4 * an.mu5) (an.mu1 * an.mu2 * an.mu3 * an.mu5)
        (an.mu1 * an.mu2 * an.mu3 * an.mu4) true kK kK
        p1 p1 p2 p2 x2 x2 x1 x1 xa xa t2 t2 t4 t4 g1 g2))
      ((kK : ℚ) / (an.gridDen : ℚ)) lps = true)
    (u c1 c2 ρ : ℝ) (hu : ((kK : ℝ) / (an.gridDen : ℝ)) ^ 2 ≤ u)
    (hc1 : 0 ≤ c1) (hc2 : 0 ≤ c2) (hρ : ρ ^ 2 ≤ c1 * c2) :
    let t0 : ℚ := ((kK : ℚ) / (an.gridDen : ℚ)) ^ 2
    let cell1 := (cutAux cv1 t0 (cv1.getD idx 0) Phi1 idx []).getD (pickIdx [] (√u)) ⟨0, 0, 0⟩
    let cell2 := (cutAux cv2 t0 (cv2.getD idx 0) Phi2 idx []).getD (pickIdx [] (√u)) ⟨0, 0, 0⟩
    let phi1 := cellPhi cell1 u + (tc1 : ℝ) + (antiSlope1 an : ℝ) * u
    let phi2 := cellPhi cell2 u + (tc2 : ℝ) + (antiSlope2 an : ℝ) * u
    let G1 := cellPrim cell1 u + (tc1 : ℝ) * u + (antiSlope1 an : ℝ) / 2 * u ^ 2
    let G2 := cellPrim cell2 u + (tc2 : ℝ) * u + (antiSlope2 an : ℝ) / 2 * u ^ 2
    let Y1 := (if u = 0 then 0 else cellPhi cell1 u - cellPrim cell1 u / u)
      + (antiSlope1 an : ℝ) / 2 * u
    let Y2 := (if u = 0 then 0 else cellPhi cell2 u - cellPrim cell2 u / u)
      + (antiSlope2 an : ℝ) / 2 * u
    let sL : ℝ := (lamScale : ℝ)
    let sM : ℝ := (muScale : ℝ)
    Ψ ((an.sigma : ℝ) * √u) ≤ (an.lam0 : ℝ) / sL + (an.lam1 : ℝ) / sL * u + (an.lam2 : ℝ) / sL * u ^ 2
        + ((an.l3s + an.l3a + an.l3b : Int) : ℝ) / sL * u ^ 3
        + (G1 - c2 * phi1 - ρ * Y1)
        + (G2 - (1 / 2) * c1 * phi2 - (1 / 2) * ρ * Y2)
        + ((an.mu1 : ℝ) / sM) * (c2 - 1) ^ 2 + ((an.mu2 : ℝ) / sM) * (c1 - c2 - 1) ^ 2
        + ((an.mu3 : ℝ) / sM) * (c1 + c2 - 3) ^ 2 + ((an.mu4 : ℝ) / sM) * (c1 - 2) ^ 2
        + ((an.mu5 : ℝ) / sM) * ρ ^ 2 + ((an.sigmaAt : ℝ) / sM) * u * ρ := by
  set M : ℝ := (an.gridDen : ℝ)
  have hMposR : (0 : ℝ) < M := show (0 : ℝ) < (an.gridDen : ℝ) by exact_mod_cast hMpos
  have hkKposR : (0 : ℝ) < (kK : ℝ) / M := div_pos (by exact_mod_cast hkKpos) hMposR
  have hupos : 0 < u := lt_of_lt_of_le (sq_pos_of_pos hkKposR) hu
  have hr_ge : (kK : ℝ) / M ≤ √u := (Real.le_sqrt hkKposR.le hupos.le).2 hu
  have hS_A : (arrScale : ℝ) = 68719476736 := by norm_num [arrScale]
  have hS_M : (muScale : ℝ) = 1125899906842624 := by norm_num [muScale]
  have hS_L : (lamScale : ℝ) = 4611686018427387904 := by norm_num [lamScale]
  have hR_MA : (rMA : ℝ) = 16384 := by norm_num [rMA]
  have htc1R : (tc1 : ℝ) = (p1 : ℝ) / (arrScale : ℝ) := by exact_mod_cast htc1.symm
  have htc2R : (tc2 : ℝ) = (p2 : ℝ) / (arrScale : ℝ) := by exact_mod_cast htc2.symm
  have hsl1 : (antiSlope1 an : ℝ) = (an.slope1 : ℝ) / (muScale : ℝ) := by
    unfold antiSlope1; push_cast; rfl
  have hsl2 : (antiSlope2 an : ℝ) = (an.slope2 : ℝ) / (muScale : ℝ) := by
    unfold antiSlope2; push_cast; rfl
  obtain ⟨hx2, hx1, hconeR⟩ := coneAtOK_real hconeOK
  set mAll : Int := an.mu1 * (an.mu2 * an.mu3 * an.mu4 * an.mu5)
  have hmAll_pos : 0 < mAll := mul_pos hm1 (mul_pos (mul_pos (mul_pos hm2 hm3) hm4) hm5)
  have hW_pos : 0 < (an.gridDen : Int) ^ 6 * lamScale * mAll := by
    have h1 : (0 : Int) < (an.gridDen : Int) := by exact_mod_cast hMpos
    have h2 : (0 : Int) < lamScale := by decide
    positivity
  have hsw := sweepTailCell_sound hMpos hW_pos lps ((kK : ℚ) / (an.gridDen : ℚ)) hlps hray (√u)
    (by simpa [M] using hr_ge)
  rw [evalInt_inSq, show (M * √u) ^ 2 = M ^ 2 * u by rw [mul_pow, Real.sq_sqrt hupos.le]] at hsw
  have hbridge := evalInt_pieceFvWGen_eq an true kK kK
    p1 p1 p2 p2 x2 x2 x1 x1 xa xa t2 t2 t4 t4 g1 g2 hMpos hM2 hm1 hm2 hm3 hm4 hm5 (Or.inl rfl) u
  simp only [↓reduceIte, one_mul, one_pow, mul_one, zero_add] at hbridge
  rw [hbridge] at hsw
  have hG1_eq : ((g1 : ℝ) + 2 * ((M ^ 2 * (rMA : ℝ)) * (p1 : ℝ)) * (M ^ 2 * u - (kK : ℝ) ^ 2)
      + (an.slope1 : ℝ) * ((M ^ 2 * u) ^ 2 - ((kK : ℝ) ^ 2) ^ 2)) / (2 * M ^ 4 * (muScale : ℝ))
      = (Phi1 : ℝ) + (tc1 : ℝ) * u + (antiSlope1 an : ℝ) / 2 * u ^ 2 := by
    rw [hg1, htc1R, hsl1, hS_A, hS_M, hR_MA]; field_simp [hMposR.ne']; ring
  have hG2_eq : ((g2 : ℝ) + 2 * ((M ^ 2 * (rMA : ℝ)) * (p2 : ℝ)) * (M ^ 2 * u - (kK : ℝ) ^ 2)
      + (an.slope2 : ℝ) * ((M ^ 2 * u) ^ 2 - ((kK : ℝ) ^ 2) ^ 2)) / (2 * M ^ 4 * (muScale : ℝ))
      = (Phi2 : ℝ) + (tc2 : ℝ) * u + (antiSlope2 an : ℝ) / 2 * u ^ 2 := by
    rw [hg2, htc2R, hsl2, hS_A, hS_M, hR_MA]; field_simp [hMposR.ne']; ring
  set phi1_v := (p1 : ℝ) / (arrScale : ℝ) + ((an.slope1 : ℝ) / (muScale : ℝ)) * u
  set phi2_v := (p2 : ℝ) / (arrScale : ℝ) + ((an.slope2 : ℝ) / (muScale : ℝ)) * u
  set G1_v := (Phi1 : ℝ) + (tc1 : ℝ) * u + (antiSlope1 an : ℝ) / 2 * u ^ 2
  set G2_v := (Phi2 : ℝ) + (tc2 : ℝ) * u + (antiSlope2 an : ℝ) / 2 * u ^ 2
  set Y1_v := phi1_v - G1_v / u
  set Y2_v := phi2_v - G2_v / u
  set xi2_v := (x2 : ℝ) / (arrScale : ℝ)
  set xi1_v := (x1 : ℝ) / (arrScale : ℝ)
  set xia_v := (xa : ℝ) / (arrScale : ℝ)
  set th2_v := (t2 : ℝ) / (arrScale : ℝ)
  set th4_v := (t4 : ℝ) / (arrScale : ℝ)
  set th3_v := xi1_v + phi2_v / 2 - th2_v - th4_v
  set th1_v := xi2_v + phi1_v + th2_v - th3_v
  set th5_v := xia_v + Y1_v + Y2_v / 2 - ((an.sigmaAt : ℝ) / (muScale : ℝ)) * u
  set lamP_v := (an.lam0 : ℝ) / (lamScale : ℝ) + (an.lam1 : ℝ) / (lamScale : ℝ) * u
    + (an.lam2 : ℝ) / (lamScale : ℝ) * u ^ 2
    + ((an.l3s + an.l3a + an.l3b : Int) : ℝ) / (lamScale : ℝ) * u ^ 3
  have hvth5 : u * xia_v + (u * phi1_v - G1_v) + (u * phi2_v - G2_v) / 2
      - ((an.sigmaAt : ℝ) / (muScale : ℝ)) * u ^ 2 = u * th5_v := by
    simp only [th5_v, Y1_v, Y2_v]; field_simp [hupos.ne']
  set WdenR : ℝ := M ^ 10 * (lamScale : ℝ) * (mAll : ℝ)
  have hWden_pos : 0 < WdenR := by
    have hSL : (0 : ℝ) < (lamScale : ℝ) := by norm_num [lamScale]
    have hmR : (0 : ℝ) < (mAll : ℝ) := by exact_mod_cast hmAll_pos
    positivity
  have hWmul : (((an.gridDen : Int) ^ 6 * lamScale * mAll : Int) : ℝ) * (M * √u) ^ 4
      = WdenR * u ^ 2 := by
    rw [Int.cast_mul, Int.cast_mul, Int.cast_pow, Int.cast_natCast, mul_pow,
      show (√u) ^ 4 = ((√u) ^ 2) ^ 2 by ring, Real.sq_sqrt hupos.le]
    simp only [WdenR, M]; ring
  rw [hG1_eq, hG2_eq, hWmul] at hsw
  have hsw' : 0 ≤ WdenR * (u ^ 2 * (lamP_v + G1_v + G2_v - (th1_v + th2_v + 3 * th3_v + 2 * th4_v)
      - (th1_v ^ 2 / (4 * ((an.mu1 : ℝ) / (muScale : ℝ)))
        + th2_v ^ 2 / (4 * ((an.mu2 : ℝ) / (muScale : ℝ)))
        + th3_v ^ 2 / (4 * ((an.mu3 : ℝ) / (muScale : ℝ)))
        + th4_v ^ 2 / (4 * ((an.mu4 : ℝ) / (muScale : ℝ)))))
      - u ^ 2 * th5_v ^ 2 / (4 * ((an.mu5 : ℝ) / (muScale : ℝ))))
      - WdenR * u ^ 2 * Ψ ((an.sigma : ℝ) * √u) := by
    have hsq : (u * xia_v + (u * phi1_v - G1_v) + (u * phi2_v - G2_v) / 2
        - ((an.sigmaAt : ℝ) / (muScale : ℝ)) * u ^ 2) ^ 2 = u ^ 2 * th5_v ^ 2 := by
      rw [hvth5]; ring
    have hsw0 : 0 ≤ WdenR * (u ^ 2 * (lamP_v + G1_v + G2_v - (th1_v + th2_v + 3 * th3_v + 2 * th4_v)
        - (th1_v ^ 2 / (4 * ((an.mu1 : ℝ) / (muScale : ℝ)))
          + th2_v ^ 2 / (4 * ((an.mu2 : ℝ) / (muScale : ℝ)))
          + th3_v ^ 2 / (4 * ((an.mu3 : ℝ) / (muScale : ℝ)))
          + th4_v ^ 2 / (4 * ((an.mu4 : ℝ) / (muScale : ℝ)))))
        - (u * xia_v + (u * phi1_v - G1_v) + (u * phi2_v - G2_v) / 2
            - ((an.sigmaAt : ℝ) / (muScale : ℝ)) * u ^ 2) ^ 2
          / (4 * ((an.mu5 : ℝ) / (muScale : ℝ))))
        - WdenR * u ^ 2 * Ψ ((an.sigma : ℝ) * √u) := by
      linarith only [hsw]
    rwa [hsq] at hsw0
  have hbd : Ψ ((an.sigma : ℝ) * √u) ≤ lamP_v + G1_v + G2_v
      - (th1_v + th2_v + 3 * th3_v + 2 * th4_v)
      - (th1_v ^ 2 / (4 * ((an.mu1 : ℝ) / (muScale : ℝ)))
        + th2_v ^ 2 / (4 * ((an.mu2 : ℝ) / (muScale : ℝ)))
        + th3_v ^ 2 / (4 * ((an.mu3 : ℝ) / (muScale : ℝ)))
        + th4_v ^ 2 / (4 * ((an.mu4 : ℝ) / (muScale : ℝ)))
        + th5_v ^ 2 / (4 * ((an.mu5 : ℝ) / (muScale : ℝ)))) :=
    factor_u2_bracket hsw' (mul_pos hWden_pos (sq_pos_of_pos hupos))
  have hcs := complete_squares_pointwise
    (mu1 := (an.mu1 : ℝ) / (muScale : ℝ)) (mu2 := (an.mu2 : ℝ) / (muScale : ℝ))
    (mu3 := (an.mu3 : ℝ) / (muScale : ℝ)) (mu4 := (an.mu4 : ℝ) / (muScale : ℝ))
    (mu5 := (an.mu5 : ℝ) / (muScale : ℝ))
    (div_pos (by exact_mod_cast hm1) (by norm_num [muScale]))
    (div_pos (by exact_mod_cast hm2) (by norm_num [muScale]))
    (div_pos (by exact_mod_cast hm3) (by norm_num [muScale]))
    (div_pos (by exact_mod_cast hm4) (by norm_num [muScale]))
    (div_pos (by exact_mod_cast hm5) (by norm_num [muScale]))
    hc1 hc2 hρ hx2 hx1 hconeR (lamP := lamP_v)
    (G1 := G1_v) (G2 := G2_v) (phi1 := phi1_v) (phi2 := phi2_v)
    (Y1 := Y1_v) (Y2 := Y2_v) (th2 := th2_v) (th4 := th4_v) (sigma := (an.sigmaAt : ℝ) / (muScale : ℝ))
    (u := u)
  have hif : u ≠ 0 := hupos.ne'
  simp only [cutAux, pickIdx, List.getD_cons_zero, cellPhi, cellPrim, Rat.cast_zero, zero_mul,
    zero_add, add_zero, zero_sub, zero_div, hif, ↓reduceIte]
  have hp1_id : (tc1 : ℝ) + (antiSlope1 an : ℝ) * u = phi1_v := by rw [htc1R, hsl1]
  have hp2_id : (tc2 : ℝ) + (antiSlope2 an : ℝ) * u = phi2_v := by rw [htc2R, hsl2]
  have hY1_id : -((Phi1 : ℝ) / u) + (antiSlope1 an : ℝ) / 2 * u = Y1_v := by
    simp only [Y1_v, phi1_v, G1_v, htc1R, hsl1]; field_simp [hupos.ne']; ring
  have hY2_id : -((Phi2 : ℝ) / u) + (antiSlope2 an : ℝ) / 2 * u = Y2_v := by
    simp only [Y2_v, phi2_v, G2_v, htc2R, hsl2]; field_simp [hupos.ne']; ring
  rw [hp1_id, hp2_id, hY1_id, hY2_id]
  exact hbd.trans hcs

set_option maxHeartbeats 800000 in
private lemma checkAntiPiecesAux_seg_sound (an : AntiNode) (Ψ : ℝ → ℝ)
    (hMpos : 0 < an.gridDen) (hM2 : an.gridDen % 2 = 0)
    (hm1 : 0 < an.mu1) (hm2 : 0 < an.mu2) (hm3 : 0 < an.mu3) (hm4 : 0 < an.mu4) (hm5 : 0 < an.mu5)
    (cv1 cv2 : List ℚ) (tc1 tc2 : ℚ) (first : Bool) (g1 g2 : Int) (Phi1 Phi2 : ℚ) (idx : ℕ)
    (k0 k1 : ℕ) (ks : List ℕ) (p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b : Int)
    (lps lps' : List LinPiece) (hk01 : k0 < k1)
    (hfirst : first = true → k0 = 0 ∧ g1 = 0 ∧ g2 = 0 ∧ Phi1 = 0 ∧ Phi2 = 0)
    (hpos : first = false → 0 < k0)
    (hcv1_0 : cv1.getD idx 0 = (p1a : ℚ) / (arrScale : ℚ) - tc1)
    (hcv2_0 : cv2.getD idx 0 = (p2a : ℚ) / (arrScale : ℚ) - tc2)
    (hcv1_1 : cv1.getD (idx + 1) 0 = (p1b : ℚ) / (arrScale : ℚ) - tc1)
    (hcv2_1 : cv2.getD (idx + 1) 0 = (p2b : ℚ) / (arrScale : ℚ) - tc2)
    (hg1 : (g1 : ℝ) = 2 * (an.gridDen : ℝ) ^ 4 * (muScale : ℝ)
      * ((Phi1 : ℝ) + (tc1 : ℝ) * ((k0 : ℝ) / (an.gridDen : ℝ)) ^ 2
        + (antiSlope1 an : ℝ) / 2 * (((k0 : ℝ) / (an.gridDen : ℝ)) ^ 2) ^ 2))
    (hg2 : (g2 : ℝ) = 2 * (an.gridDen : ℝ) ^ 4 * (muScale : ℝ)
      * ((Phi2 : ℝ) + (tc2 : ℝ) * ((k0 : ℝ) / (an.gridDen : ℝ)) ^ 2
        + (antiSlope2 an : ℝ) / 2 * (((k0 : ℝ) / (an.gridDen : ℝ)) ^ 2) ^ 2))
    (hcone0 : coneAtOK x2a x1a xaa = true)
    (hcone1 : coneAtOK x2b x1b xab = true)
    (hdiv : first = true →
      (pieceFvWGen an (an.mu1 * (an.mu2 * an.mu3 * an.mu4 * an.mu5))
        (an.mu2 * an.mu3 * an.mu4 * an.mu5) (an.mu1 * an.mu3 * an.mu4 * an.mu5)
        (an.mu1 * an.mu2 * an.mu4 * an.mu5) (an.mu1 * an.mu2 * an.mu3 * an.mu5)
        (an.mu1 * an.mu2 * an.mu3 * an.mu4) false k0 k1
        p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b g1 g2).getD 0 0 = 0 ∧
      (pieceFvWGen an (an.mu1 * (an.mu2 * an.mu3 * an.mu4 * an.mu5))
        (an.mu2 * an.mu3 * an.mu4 * an.mu5) (an.mu1 * an.mu3 * an.mu4 * an.mu5)
        (an.mu1 * an.mu2 * an.mu4 * an.mu5) (an.mu1 * an.mu2 * an.mu3 * an.mu5)
        (an.mu1 * an.mu2 * an.mu3 * an.mu4) false k0 k1
        p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b g1 g2).getD 1 0 = 0)
    (hlps : LinPiecesValid Ψ an.sigma lps)
    (hsweep : sweepFiniteCell first an.gridDen
      ((an.gridDen : Int) ^ 6 * lamScale
        * (((k1 : Int) * (k1 : Int) - (k0 : Int) * (k0 : Int))
          * ((k1 : Int) * (k1 : Int) - (k0 : Int) * (k0 : Int)))
        * (an.mu1 * (an.mu2 * an.mu3 * an.mu4 * an.mu5)))
      (if first then pInSq ((pieceFvWGen an (an.mu1 * (an.mu2 * an.mu3 * an.mu4 * an.mu5))
        (an.mu2 * an.mu3 * an.mu4 * an.mu5) (an.mu1 * an.mu3 * an.mu4 * an.mu5)
        (an.mu1 * an.mu2 * an.mu4 * an.mu5) (an.mu1 * an.mu2 * an.mu3 * an.mu5)
        (an.mu1 * an.mu2 * an.mu3 * an.mu4) false k0 k1
        p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b g1 g2).drop 2)
      else pInSq (pieceFvWGen an (an.mu1 * (an.mu2 * an.mu3 * an.mu4 * an.mu5))
        (an.mu2 * an.mu3 * an.mu4 * an.mu5) (an.mu1 * an.mu3 * an.mu4 * an.mu5)
        (an.mu1 * an.mu2 * an.mu4 * an.mu5) (an.mu1 * an.mu2 * an.mu3 * an.mu5)
        (an.mu1 * an.mu2 * an.mu3 * an.mu4) false k0 k1
        p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b g1 g2))
      ((k0 : ℚ) / (an.gridDen : ℚ)) ((k1 : ℚ) / (an.gridDen : ℚ)) lps = some lps')
    (u c1 c2 ρ : ℝ) (hu : ((k0 : ℝ) / (an.gridDen : ℝ)) ^ 2 ≤ u) (hlt : √u < (k1 : ℝ) / (an.gridDen : ℝ))
    (hc1 : 0 ≤ c1) (hc2 : 0 ≤ c2) (hρ : ρ ^ 2 ≤ c1 * c2) :
    let vs := (k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / (an.gridDen : ℚ)
    let t0 : ℚ := ((k0 : ℚ) / (an.gridDen : ℚ)) ^ 2
    let cell1 := (cutAux cv1 t0 (cv1.getD idx 0) Phi1 idx vs).getD (pickIdx vs (√u)) ⟨0, 0, 0⟩
    let cell2 := (cutAux cv2 t0 (cv2.getD idx 0) Phi2 idx vs).getD (pickIdx vs (√u)) ⟨0, 0, 0⟩
    let phi1 := cellPhi cell1 u + (tc1 : ℝ) + (antiSlope1 an : ℝ) * u
    let phi2 := cellPhi cell2 u + (tc2 : ℝ) + (antiSlope2 an : ℝ) * u
    let G1 := cellPrim cell1 u + (tc1 : ℝ) * u + (antiSlope1 an : ℝ) / 2 * u ^ 2
    let G2 := cellPrim cell2 u + (tc2 : ℝ) * u + (antiSlope2 an : ℝ) / 2 * u ^ 2
    let Y1 := (if u = 0 then 0 else cellPhi cell1 u - cellPrim cell1 u / u)
      + (antiSlope1 an : ℝ) / 2 * u
    let Y2 := (if u = 0 then 0 else cellPhi cell2 u - cellPrim cell2 u / u)
      + (antiSlope2 an : ℝ) / 2 * u
    let sL : ℝ := (lamScale : ℝ)
    let sM : ℝ := (muScale : ℝ)
    Ψ ((an.sigma : ℝ) * √u) ≤ (an.lam0 : ℝ) / sL + (an.lam1 : ℝ) / sL * u + (an.lam2 : ℝ) / sL * u ^ 2
        + ((an.l3s + an.l3a + an.l3b : Int) : ℝ) / sL * u ^ 3
        + (G1 - c2 * phi1 - ρ * Y1)
        + (G2 - (1 / 2) * c1 * phi2 - (1 / 2) * ρ * Y2)
        + ((an.mu1 : ℝ) / sM) * (c2 - 1) ^ 2 + ((an.mu2 : ℝ) / sM) * (c1 - c2 - 1) ^ 2
        + ((an.mu3 : ℝ) / sM) * (c1 + c2 - 3) ^ 2 + ((an.mu4 : ℝ) / sM) * (c1 - 2) ^ 2
        + ((an.mu5 : ℝ) / sM) * ρ ^ 2 + ((an.sigmaAt : ℝ) / sM) * u * ρ := by
  set M : ℝ := (an.gridDen : ℝ)
  have hMposR : (0 : ℝ) < M := show (0 : ℝ) < (an.gridDen : ℝ) by exact_mod_cast hMpos
  have hu0 : 0 ≤ u := le_trans (sq_nonneg _) hu
  have hr_lo : (k0 : ℝ) / M ≤ √u := (Real.le_sqrt (by positivity) hu0).2 hu
  have hk1_pos : (0 : ℝ) < (k1 : ℝ) / M :=
    div_pos (by exact_mod_cast (Nat.zero_le k0 |>.trans_lt hk01)) hMposR
  have hu_hi : u < ((k1 : ℝ) / M) ^ 2 := (Real.sqrt_lt' hk1_pos).1 hlt
  have hpick : pickIdx ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / (an.gridDen : ℚ)) (√u) = 0 := by
    simp only [List.map_cons, pickIdx]
    have hlt' : √u < (((k1 : ℚ) / (an.gridDen : ℚ) : ℚ) : ℝ) := by simpa [M] using hlt
    simp only [hlt', ↓reduceIte]
  have hduR_pos : (0 : ℝ) < (k1 : ℝ) ^ 2 - (k0 : ℝ) ^ 2 := by
    have hklt : (k0 : ℝ) < (k1 : ℝ) := by exact_mod_cast hk01
    have hk0 : (0 : ℝ) ≤ (k0 : ℝ) := Nat.cast_nonneg k0
    nlinarith only [hklt, hk0]
  have hM2u_lo : (k0 : ℝ) ^ 2 ≤ M ^ 2 * u := by
    have : ((k0 : ℝ) / M) ^ 2 = (k0 : ℝ) ^ 2 / M ^ 2 := by ring
    rw [this, div_le_iff₀ (sq_pos_of_pos hMposR)] at hu
    linarith only [hu]
  have hM2u_hi : M ^ 2 * u < (k1 : ℝ) ^ 2 := by
    have : ((k1 : ℝ) / M) ^ 2 = (k1 : ℝ) ^ 2 / M ^ 2 := by ring
    rw [this, lt_div_iff₀ (sq_pos_of_pos hMposR)] at hu_hi
    linarith only [hu_hi]
  set t_u : ℝ := (M ^ 2 * u - (k0 : ℝ) ^ 2) / ((k1 : ℝ) ^ 2 - (k0 : ℝ) ^ 2)
  have htu0 : 0 ≤ t_u := div_nonneg (by linarith only [hM2u_lo]) hduR_pos.le
  have htu1 : t_u ≤ 1 := (div_le_one hduR_pos).2 (by linarith only [hM2u_hi])
  let interpS (a0 a1 : Int) : ℝ :=
    ((a0 : ℝ) * (k1 : ℝ) ^ 2 - (a1 : ℝ) * (k0 : ℝ) ^ 2
      + ((a1 : ℝ) - (a0 : ℝ)) * (M ^ 2 * u))
    / ((arrScale : ℝ) * ((k1 : ℝ) ^ 2 - (k0 : ℝ) ^ 2))
  have hinterp : ∀ a0 a1 : Int,
      interpS a0 a1 = (1 - t_u) * ((a0 : ℝ) / (arrScale : ℝ))
        + t_u * ((a1 : ℝ) / (arrScale : ℝ)) := by
    intro a0 a1
    simp only [interpS, t_u]; field_simp [hduR_pos.ne']; ring
  obtain ⟨hx2_0, hx1_0, hc_0⟩ := coneAtOK_real hcone0
  obtain ⟨hx2_1, hx1_1, hc_1⟩ := coneAtOK_real hcone1
  obtain ⟨hxi1, hxi2, hconeR⟩ := cone_convex hx1_0 hx2_0 hc_0 hx1_1 hx2_1 hc_1 htu0 htu1
  rw [← hinterp x2a x2b] at hxi2 hconeR
  rw [← hinterp x1a x1b] at hxi1 hconeR
  rw [← hinterp xaa xab] at hconeR
  have hc1_0R : (cv1.getD idx 0 : ℝ) = (p1a : ℝ) / arrScale - tc1 := by exact_mod_cast hcv1_0
  have hc1_1R : (cv1.getD (idx + 1) 0 : ℝ) = (p1b : ℝ) / arrScale - tc1 := by exact_mod_cast hcv1_1
  have hc2_0R : (cv2.getD idx 0 : ℝ) = (p2a : ℝ) / arrScale - tc2 := by exact_mod_cast hcv2_0
  have hc2_1R : (cv2.getD (idx + 1) 0 : ℝ) = (p2b : ℝ) / arrScale - tc2 := by exact_mod_cast hcv2_1
  have hS_A : (arrScale : ℝ) = 68719476736 := by norm_num [arrScale]
  have hS_M : (muScale : ℝ) = 1125899906842624 := by norm_num [muScale]
  have hR_MA : (rMA : ℝ) = 16384 := by norm_num [rMA]
  have hsl1 : (antiSlope1 an : ℝ) = (an.slope1 : ℝ) / (muScale : ℝ) := by
    unfold antiSlope1; push_cast; rfl
  have hsl2 : (antiSlope2 an : ℝ) = (an.slope2 : ℝ) / (muScale : ℝ) := by
    unfold antiSlope2; push_cast; rfl
  set lamP_v := (an.lam0 : ℝ) / (lamScale : ℝ) + (an.lam1 : ℝ) / (lamScale : ℝ) * u
    + (an.lam2 : ℝ) / (lamScale : ℝ) * u ^ 2
    + ((an.l3s + an.l3a + an.l3b : Int) : ℝ) / (lamScale : ℝ) * u ^ 3
  set phi1_v := interpS p1a p1b + ((an.slope1 : ℝ) / (muScale : ℝ)) * u
  set phi2_v := interpS p2a p2b + ((an.slope2 : ℝ) / (muScale : ℝ)) * u
  set du : ℝ := (k1 : ℝ) ^ 2 - (k0 : ℝ) ^ 2
  set c0_1 := (M ^ 2 * (rMA : ℝ)) * ((p1a : ℝ) * (k1 : ℝ) ^ 2 - (p1b : ℝ) * (k0 : ℝ) ^ 2)
  set c1_1 := (M ^ 2 * (rMA : ℝ)) * ((p1b : ℝ) - (p1a : ℝ)) + (an.slope1 : ℝ) * du
  set c0_2 := (M ^ 2 * (rMA : ℝ)) * ((p2a : ℝ) * (k1 : ℝ) ^ 2 - (p2b : ℝ) * (k0 : ℝ) ^ 2)
  set c1_2 := (M ^ 2 * (rMA : ℝ)) * ((p2b : ℝ) - (p2a : ℝ)) + (an.slope2 : ℝ) * du
  set G1_v := (du * (g1 : ℝ) + 2 * c0_1 * (M ^ 2 * u - (k0 : ℝ) ^ 2)
    + c1_1 * ((M ^ 2 * u) ^ 2 - ((k0 : ℝ) ^ 2) ^ 2)) / (2 * M ^ 4 * (muScale : ℝ) * du)
  set G2_v := (du * (g2 : ℝ) + 2 * c0_2 * (M ^ 2 * u - (k0 : ℝ) ^ 2)
    + c1_2 * ((M ^ 2 * u) ^ 2 - ((k0 : ℝ) ^ 2) ^ 2)) / (2 * M ^ 4 * (muScale : ℝ) * du)
  set th2_v := interpS t2a t2b
  set th4_v := interpS t4a t4b
  set th3_v := interpS x1a x1b + phi2_v / 2 - th2_v - th4_v
  set th1_v := interpS x2a x2b + phi1_v + th2_v - th3_v
  have hsub_t : ((k1 : ℝ) / (an.gridDen : ℝ)) ^ 2 - ((k0 : ℝ) / (an.gridDen : ℝ)) ^ 2
      = ((k1 : ℝ) ^ 2 - (k0 : ℝ) ^ 2) / (an.gridDen : ℝ) ^ 2 := by ring
  have hdu_ne_raw : (k1 : ℝ) ^ 2 - (k0 : ℝ) ^ 2 ≠ 0 := hduR_pos.ne'
  have hM_ne_raw : (an.gridDen : ℝ) ≠ 0 := hMposR.ne'
  have hcellPhi1 : cellPhi ((cutAux cv1 (((k0 : ℚ) / (an.gridDen : ℚ)) ^ 2) (cv1.getD idx 0) Phi1 idx
      ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / (an.gridDen : ℚ))).getD
        (pickIdx ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / (an.gridDen : ℚ)) (√u)) ⟨0, 0, 0⟩) u
      + (tc1 : ℝ) + (antiSlope1 an : ℝ) * u = phi1_v := by
    rw [hpick]; simp only [List.map_cons, cutAux, List.getD_cons_zero, cellPhi]
    push_cast; rw [hc1_0R, hc1_1R, hsl1, hsub_t]
    simp only [phi1_v, interpS, M]
    field_simp [hdu_ne_raw, hM_ne_raw]; ring
  have hcellPhi2 : cellPhi ((cutAux cv2 (((k0 : ℚ) / (an.gridDen : ℚ)) ^ 2) (cv2.getD idx 0) Phi2 idx
      ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / (an.gridDen : ℚ))).getD
        (pickIdx ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / (an.gridDen : ℚ)) (√u)) ⟨0, 0, 0⟩) u
      + (tc2 : ℝ) + (antiSlope2 an : ℝ) * u = phi2_v := by
    rw [hpick]; simp only [List.map_cons, cutAux, List.getD_cons_zero, cellPhi]
    push_cast; rw [hc2_0R, hc2_1R, hsl2, hsub_t]
    simp only [phi2_v, interpS, M]
    field_simp [hdu_ne_raw, hM_ne_raw]; ring
  have hcellPrim1 : cellPrim ((cutAux cv1 (((k0 : ℚ) / (an.gridDen : ℚ)) ^ 2) (cv1.getD idx 0) Phi1 idx
      ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / (an.gridDen : ℚ))).getD
        (pickIdx ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / (an.gridDen : ℚ)) (√u)) ⟨0, 0, 0⟩) u
      + (tc1 : ℝ) * u + (antiSlope1 an : ℝ) / 2 * u ^ 2 = G1_v := by
    rw [hpick]; simp only [List.map_cons, cutAux, List.getD_cons_zero, cellPrim]
    push_cast; rw [hc1_0R, hc1_1R, hsub_t]
    simp only [G1_v, c0_1, c1_1, hg1, hsl1, du, hS_A, hS_M, hR_MA, M]
    field_simp [hdu_ne_raw, hM_ne_raw]; ring
  have hcellPrim2 : cellPrim ((cutAux cv2 (((k0 : ℚ) / (an.gridDen : ℚ)) ^ 2) (cv2.getD idx 0) Phi2 idx
      ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / (an.gridDen : ℚ))).getD
        (pickIdx ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / (an.gridDen : ℚ)) (√u)) ⟨0, 0, 0⟩) u
      + (tc2 : ℝ) * u + (antiSlope2 an : ℝ) / 2 * u ^ 2 = G2_v := by
    rw [hpick]; simp only [List.map_cons, cutAux, List.getD_cons_zero, cellPrim]
    push_cast; rw [hc2_0R, hc2_1R, hsub_t]
    simp only [G2_v, c0_2, c1_2, hg2, hsl2, du, hS_A, hS_M, hR_MA, M]
    field_simp [hdu_ne_raw, hM_ne_raw]; ring
  set mAll : Int := an.mu1 * (an.mu2 * an.mu3 * an.mu4 * an.mu5)
  have hmAll_pos : 0 < mAll := mul_pos hm1 (mul_pos (mul_pos (mul_pos hm2 hm3) hm4) hm5)
  have hduI_pos : (0 : Int) < (k1 : Int) * (k1 : Int) - (k0 : Int) * (k0 : Int) := by
    have hklt : (k0 : Int) < (k1 : Int) := by exact_mod_cast hk01
    have hk0 : (0 : Int) ≤ (k0 : Int) := Int.natCast_nonneg k0
    nlinarith only [hklt, hk0]
  have hW_pos : 0 < (an.gridDen : Int) ^ 6 * lamScale
      * (((k1 : Int) * (k1 : Int) - (k0 : Int) * (k0 : Int))
        * ((k1 : Int) * (k1 : Int) - (k0 : Int) * (k0 : Int))) * mAll := by
    have h1 : (0 : Int) < (an.gridDen : Int) := by exact_mod_cast hMpos
    have h2 : (0 : Int) < lamScale := by decide
    positivity
  have hsw := (sweepFiniteCell_sound hMpos hW_pos lps lps' ((k0 : ℚ) / (an.gridDen : ℚ))
    ((k1 : ℚ) / (an.gridDen : ℚ)) hlps hsweep).2 (√u) (by simpa [M] using hr_lo)
    (by simpa [M] using hlt.le)
  have hWcast : (((an.gridDen : Int) ^ 6 * lamScale
      * (((k1 : Int) * (k1 : Int) - (k0 : Int) * (k0 : Int))
        * ((k1 : Int) * (k1 : Int) - (k0 : Int) * (k0 : Int))) * mAll : Int) : ℝ)
      = M ^ 6 * (lamScale : ℝ) * du ^ 2 * (mAll : ℝ) := by
    push_cast; simp only [M, du]; ring
  set Wden6 : ℝ := M ^ 6 * (lamScale : ℝ) * du ^ 2 * (mAll : ℝ)
  have hWden6_pos : 0 < Wden6 := by
    have hSL : (0 : ℝ) < (lamScale : ℝ) := by norm_num [lamScale]
    have hmR : (0 : ℝ) < (mAll : ℝ) := by exact_mod_cast hmAll_pos
    positivity
  have hbridge : evalInt (pieceFvWGen an mAll
      (an.mu2 * an.mu3 * an.mu4 * an.mu5) (an.mu1 * an.mu3 * an.mu4 * an.mu5)
      (an.mu1 * an.mu2 * an.mu4 * an.mu5) (an.mu1 * an.mu2 * an.mu3 * an.mu5)
      (an.mu1 * an.mu2 * an.mu3 * an.mu4) false k0 k1
      p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b g1 g2) (M ^ 2 * u)
      = (M ^ 10 * (lamScale : ℝ) * du ^ 2 * (mAll : ℝ))
        * (u ^ 2 * (lamP_v + G1_v + G2_v - (th1_v + th2_v + 3 * th3_v + 2 * th4_v)
            - (th1_v ^ 2 / (4 * ((an.mu1 : ℝ) / (muScale : ℝ)))
              + th2_v ^ 2 / (4 * ((an.mu2 : ℝ) / (muScale : ℝ)))
              + th3_v ^ 2 / (4 * ((an.mu3 : ℝ) / (muScale : ℝ)))
              + th4_v ^ 2 / (4 * ((an.mu4 : ℝ) / (muScale : ℝ)))))
          - (u * interpS xaa xab + (u * phi1_v - G1_v) + (u * phi2_v - G2_v) / 2
              - ((an.sigmaAt : ℝ) / (muScale : ℝ)) * u ^ 2) ^ 2
            / (4 * ((an.mu5 : ℝ) / (muScale : ℝ)))) :=
    evalInt_pieceFvWGen_eq an false k0 k1
      p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b g1 g2 hMpos hM2 hm1 hm2 hm3 hm4 hm5
      (Or.inr hk01) u
  rcases hu0.eq_or_lt with hu_zero | hu_pos
  · -- `u = 0`: must be `first = true`, so `k0 = 0`, `g1 = g2 = Phi1 = Phi2 = 0`
    have hf_true : first = true := by
      cases first with
      | true => rfl
      | false =>
        have hk0p : (0 : ℝ) < (k0 : ℝ) / M := div_pos (by exact_mod_cast hpos rfl) hMposR
        linarith [sq_pos_of_pos hk0p, hu, hu_zero]
    subst hf_true
    obtain ⟨rfl, rfl, rfl, rfl, rfl⟩ := hfirst rfl
    obtain ⟨h0, h1⟩ := hdiv rfl
    simp only [↓reduceIte] at hsw
    rw [← hu_zero, Real.sqrt_zero, mul_zero, evalInt_inSq, mul_zero,
      zero_pow (by decide : 2 ≠ 0), hWcast] at hsw
    have hzero := evalInt_pieceFvWGen_zero an k1 p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b
      hMpos hM2 hm1 hm2 hm3 hm4 hm5 hk01 h0 h1
    have hdu0 : du = (k1 : ℝ) ^ 2 := by simp [du]
    rw [hzero] at hsw
    have hbd0 : Ψ ((an.sigma : ℝ) * 0) ≤ (an.lam0 : ℝ) / (lamScale : ℝ)
        - (th1_v + th2_v + 3 * th3_v + 2 * th4_v)
        - (th1_v ^ 2 / (4 * ((an.mu1 : ℝ) / (muScale : ℝ)))
          + th2_v ^ 2 / (4 * ((an.mu2 : ℝ) / (muScale : ℝ)))
          + th3_v ^ 2 / (4 * ((an.mu3 : ℝ) / (muScale : ℝ)))
          + th4_v ^ 2 / (4 * ((an.mu4 : ℝ) / (muScale : ℝ)))
          + (interpS xaa xab) ^ 2 / (4 * ((an.mu5 : ℝ) / (muScale : ℝ)))) := by
      have hinterp0 : ∀ a0 a1 : Int, interpS a0 a1 = (a0 : ℝ) / (arrScale : ℝ) := fun a0 a1 ↦ by
        simp only [interpS, ← hu_zero, Nat.cast_zero, zero_pow (by decide : 2 ≠ 0), mul_zero, sub_zero, add_zero]
        have hk1ne : (k1 : ℝ) ^ 2 ≠ 0 := pow_ne_zero 2 (by exact_mod_cast hk01.ne')
        field_simp [hk1ne]
      have hp10 : phi1_v = (p1a : ℝ) / (arrScale : ℝ) := by simp [phi1_v, hinterp0, ← hu_zero]
      have hp20 : phi2_v = (p2a : ℝ) / (arrScale : ℝ) := by simp [phi2_v, hinterp0, ← hu_zero]
      have ht10 : th1_v = (x2a : ℝ) / (arrScale : ℝ) + (p1a : ℝ) / (arrScale : ℝ)
          + (t2a : ℝ) / (arrScale : ℝ) - ((x1a : ℝ) / (arrScale : ℝ) + ((p2a : ℝ) / (arrScale : ℝ)) / 2
            - (t2a : ℝ) / (arrScale : ℝ) - (t4a : ℝ) / (arrScale : ℝ)) := by
        simp [th1_v, th3_v, th2_v, th4_v, hp10, hp20, hinterp0]
      have ht30 : th3_v = (x1a : ℝ) / (arrScale : ℝ) + ((p2a : ℝ) / (arrScale : ℝ)) / 2
          - (t2a : ℝ) / (arrScale : ℝ) - (t4a : ℝ) / (arrScale : ℝ) := by
        simp [th3_v, th2_v, th4_v, hp20, hinterp0]
      rw [ht10, ht30, show th2_v = (t2a : ℝ) / (arrScale : ℝ) from hinterp0 t2a t2b,
        show th4_v = (t4a : ℝ) / (arrScale : ℝ) from hinterp0 t4a t4b, hinterp0 xaa xab, mul_zero]
      have hW0 : M ^ 6 * (lamScale : ℝ) * ((k1 : ℝ) ^ 2) ^ 2 * (mAll : ℝ) = Wden6 := by
        simp only [Wden6, hdu0]
      rw [hW0] at hsw
      exact le_of_mul_le_mul_left hsw hWden6_pos
    have hcs := complete_squares_pointwise
      (mu1 := (an.mu1 : ℝ) / (muScale : ℝ)) (mu2 := (an.mu2 : ℝ) / (muScale : ℝ))
      (mu3 := (an.mu3 : ℝ) / (muScale : ℝ)) (mu4 := (an.mu4 : ℝ) / (muScale : ℝ))
      (mu5 := (an.mu5 : ℝ) / (muScale : ℝ))
      (div_pos (by exact_mod_cast hm1) (by norm_num [muScale]))
      (div_pos (by exact_mod_cast hm2) (by norm_num [muScale]))
      (div_pos (by exact_mod_cast hm3) (by norm_num [muScale]))
      (div_pos (by exact_mod_cast hm4) (by norm_num [muScale]))
      (div_pos (by exact_mod_cast hm5) (by norm_num [muScale]))
      hc1 hc2 hρ hxi2 hxi1 hconeR (lamP := (an.lam0 : ℝ) / (lamScale : ℝ))
      (G1 := 0) (G2 := 0) (phi1 := phi1_v) (phi2 := phi2_v)
      (Y1 := 0) (Y2 := 0) (th2 := th2_v) (th4 := th4_v)
      (sigma := (an.sigmaAt : ℝ) / (muScale : ℝ)) (u := 0)
    have hG10 : G1_v = 0 := by simp [G1_v, ← hu_zero]
    have hG20 : G2_v = 0 := by simp [G2_v, ← hu_zero]
    have hlam0 : lamP_v = (an.lam0 : ℝ) / (lamScale : ℝ) := by simp [lamP_v, ← hu_zero]
    dsimp only
    rw [hcellPhi1, hcellPhi2, hcellPrim1, hcellPrim2, hG10, hG20, ← hu_zero, Real.sqrt_zero]
    simp only [↓reduceIte, mul_zero, zero_div, add_zero, zero_pow (by decide : 2 ≠ 0),
      zero_pow (by decide : 3 ≠ 0), sub_zero] at hcs ⊢
    rw [mul_zero] at hbd0
    exact hbd0.trans (by simpa only [th1_v, th3_v] using hcs)
  · -- `u > 0`
    set Y1_v := phi1_v - G1_v / u
    set Y2_v := phi2_v - G2_v / u
    set th5_v := interpS xaa xab + Y1_v + Y2_v / 2 - ((an.sigmaAt : ℝ) / (muScale : ℝ)) * u
    have hvth5 : u * interpS xaa xab + (u * phi1_v - G1_v) + (u * phi2_v - G2_v) / 2
        - ((an.sigmaAt : ℝ) / (muScale : ℝ)) * u ^ 2 = u * th5_v := by
      simp only [th5_v, Y1_v, Y2_v]; field_simp [hu_pos.ne']
    have hbd : Ψ ((an.sigma : ℝ) * √u) ≤ lamP_v + G1_v + G2_v
        - (th1_v + th2_v + 3 * th3_v + 2 * th4_v)
        - (th1_v ^ 2 / (4 * ((an.mu1 : ℝ) / (muScale : ℝ)))
          + th2_v ^ 2 / (4 * ((an.mu2 : ℝ) / (muScale : ℝ)))
          + th3_v ^ 2 / (4 * ((an.mu3 : ℝ) / (muScale : ℝ)))
          + th4_v ^ 2 / (4 * ((an.mu4 : ℝ) / (muScale : ℝ)))
          + th5_v ^ 2 / (4 * ((an.mu5 : ℝ) / (muScale : ℝ)))) := by
      have hsq : (u * interpS xaa xab + (u * phi1_v - G1_v) + (u * phi2_v - G2_v) / 2
          - ((an.sigmaAt : ℝ) / (muScale : ℝ)) * u ^ 2) ^ 2 = u ^ 2 * th5_v ^ 2 := by
        rw [hvth5]; ring
      cases first with
      | true =>
        obtain ⟨h0, h1⟩ := hdiv rfl
        simp only [↓reduceIte] at hsw
        rw [evalInt_inSq, show (M * √u) ^ 2 = M ^ 2 * u by rw [mul_pow, Real.sq_sqrt hu_pos.le],
          hWcast] at hsw
        have hdrop := evalInt_drop2 _ h0 h1 (M ^ 2 * u)
        have hM4u2_pos : 0 < (M ^ 2 * u) ^ 2 := by positivity
        have hsw_mul : (M ^ 2 * u) ^ 2 * (Wden6 * Ψ ((an.sigma : ℝ) * √u))
            ≤ (M ^ 2 * u) ^ 2 * evalInt _ (M ^ 2 * u) :=
          mul_le_mul_of_nonneg_left hsw hM4u2_pos.le
        rw [← hdrop, hbridge, hsq] at hsw_mul
        set Wden10 : ℝ := M ^ 10 * (lamScale : ℝ) * du ^ 2 * (mAll : ℝ)
        have hW10_pos : 0 < Wden10 := by
          have hSL : (0 : ℝ) < (lamScale : ℝ) := by norm_num [lamScale]
          have hmR : (0 : ℝ) < (mAll : ℝ) := by exact_mod_cast hmAll_pos
          positivity
        have hWmul' : (M ^ 2 * u) ^ 2 * (Wden6 * Ψ ((an.sigma : ℝ) * √u))
            = Wden10 * u ^ 2 * Ψ ((an.sigma : ℝ) * √u) := by simp only [Wden6, Wden10]; ring
        rw [hWmul'] at hsw_mul
        exact factor_u2_bracket (sub_nonneg.2 hsw_mul) (mul_pos hW10_pos (sq_pos_of_pos hu_pos))
      | false =>
        simp only [Bool.false_eq_true, ↓reduceIte] at hsw
        rw [evalInt_inSq, show (M * √u) ^ 2 = M ^ 2 * u by rw [mul_pow, Real.sq_sqrt hu_pos.le],
          hWcast, hbridge, hsq] at hsw
        set Wden10 : ℝ := M ^ 10 * (lamScale : ℝ) * du ^ 2 * (mAll : ℝ)
        have hW10_pos : 0 < Wden10 := by
          have hSL : (0 : ℝ) < (lamScale : ℝ) := by norm_num [lamScale]
          have hmR : (0 : ℝ) < (mAll : ℝ) := by exact_mod_cast hmAll_pos
          positivity
        have hWmul' : Wden6 * (M * √u) ^ 4 * Ψ ((an.sigma : ℝ) * √u)
            = Wden10 * u ^ 2 * Ψ ((an.sigma : ℝ) * √u) := by
          rw [mul_pow, show (√u) ^ 4 = ((√u) ^ 2) ^ 2 by ring, Real.sq_sqrt hu_pos.le]
          simp only [Wden6, Wden10]; ring
        rw [hWmul'] at hsw
        exact factor_u2_bracket (sub_nonneg.2 hsw) (mul_pos hW10_pos (sq_pos_of_pos hu_pos))
    have hcs := complete_squares_pointwise
      (mu1 := (an.mu1 : ℝ) / (muScale : ℝ)) (mu2 := (an.mu2 : ℝ) / (muScale : ℝ))
      (mu3 := (an.mu3 : ℝ) / (muScale : ℝ)) (mu4 := (an.mu4 : ℝ) / (muScale : ℝ))
      (mu5 := (an.mu5 : ℝ) / (muScale : ℝ))
      (div_pos (by exact_mod_cast hm1) (by norm_num [muScale]))
      (div_pos (by exact_mod_cast hm2) (by norm_num [muScale]))
      (div_pos (by exact_mod_cast hm3) (by norm_num [muScale]))
      (div_pos (by exact_mod_cast hm4) (by norm_num [muScale]))
      (div_pos (by exact_mod_cast hm5) (by norm_num [muScale]))
      hc1 hc2 hρ hxi2 hxi1 hconeR (lamP := lamP_v)
      (G1 := G1_v) (G2 := G2_v) (phi1 := phi1_v) (phi2 := phi2_v)
      (Y1 := Y1_v) (Y2 := Y2_v) (th2 := th2_v) (th4 := th4_v)
      (sigma := (an.sigmaAt : ℝ) / (muScale : ℝ)) (u := u)
    dsimp only
    have hif : u ≠ 0 := hu_pos.ne'
    simp only [hif, ↓reduceIte]
    have hY1_eq : cellPhi ((cutAux cv1 (((k0 : ℚ) / (an.gridDen : ℚ)) ^ 2) (cv1.getD idx 0) Phi1 idx
          ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / (an.gridDen : ℚ))).getD
            (pickIdx ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / (an.gridDen : ℚ)) (√u)) ⟨0, 0, 0⟩) u
        - cellPrim ((cutAux cv1 (((k0 : ℚ) / (an.gridDen : ℚ)) ^ 2) (cv1.getD idx 0) Phi1 idx
          ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / (an.gridDen : ℚ))).getD
            (pickIdx ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / (an.gridDen : ℚ)) (√u)) ⟨0, 0, 0⟩) u / u
        + (antiSlope1 an : ℝ) / 2 * u = Y1_v := by
      simp only [Y1_v]
      rw [← hcellPhi1, ← hcellPrim1]
      generalize cellPhi _ u = a1
      generalize cellPrim _ u = b1
      field_simp [hu_pos.ne']; ring
    have hY2_eq : cellPhi ((cutAux cv2 (((k0 : ℚ) / (an.gridDen : ℚ)) ^ 2) (cv2.getD idx 0) Phi2 idx
          ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / (an.gridDen : ℚ))).getD
            (pickIdx ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / (an.gridDen : ℚ)) (√u)) ⟨0, 0, 0⟩) u
        - cellPrim ((cutAux cv2 (((k0 : ℚ) / (an.gridDen : ℚ)) ^ 2) (cv2.getD idx 0) Phi2 idx
          ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / (an.gridDen : ℚ))).getD
            (pickIdx ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / (an.gridDen : ℚ)) (√u)) ⟨0, 0, 0⟩) u / u
        + (antiSlope2 an : ℝ) / 2 * u = Y2_v := by
      simp only [Y2_v]
      rw [← hcellPhi2, ← hcellPrim2]
      generalize cellPhi _ u = a2
      generalize cellPrim _ u = b2
      field_simp [hu_pos.ne']; ring
    rw [hcellPhi1, hcellPhi2, hcellPrim1, hcellPrim2, hY1_eq, hY2_eq]
    exact hbd.trans hcs

private lemma getLastD_cons_cons {α : Type*} (a b : α) (l : List α) (d : α) :
    (a :: b :: l).getLastD d = (b :: l).getLastD d := rfl

private lemma getLastD_eq_getLast {α : Type*} :
    ∀ (l : List α) (d : α) (h : l ≠ []), l.getLastD d = l.getLast h
  | [], _, h => absurd rfl h
  | [_], _, _ => rfl
  | _ :: b :: l, d, _ => getLastD_eq_getLast (b :: l) d (List.cons_ne_nil _ _)

private lemma checkAntiPiecesAux_sound (an : AntiNode) (Ψ : ℝ → ℝ)
    (hMpos : 0 < an.gridDen) (hM2 : an.gridDen % 2 = 0)
    (hm1 : 0 < an.mu1) (hm2 : 0 < an.mu2) (hm3 : 0 < an.mu3) (hm4 : 0 < an.mu4) (hm5 : 0 < an.mu5)
    (cv1 cv2 : List ℚ) (tc1 tc2 : ℚ) :
    ∀ (ks : List ℕ) (first : Bool) (g1 g2 : Int) (Phi1 Phi2 : ℚ) (idx : ℕ)
      (p1s p2s x2s x1s xas t2s t4s : List Int) (lps : List LinPiece),
      (first = true → ks.headD 1 = 0 ∧ g1 = 0 ∧ g2 = 0 ∧ Phi1 = 0 ∧ Phi2 = 0) →
      (first = false → 0 < ks.headD 0) →
      (∀ k, k < ks.length - 1 → cv1.getD (idx + k) 0 = (p1s.getD k 0 : ℚ) / (arrScale : ℚ) - tc1) →
      (∀ k, k < ks.length - 1 → cv2.getD (idx + k) 0 = (p2s.getD k 0 : ℚ) / (arrScale : ℚ) - tc2) →
      cv1.length ≤ idx + (ks.length - 1) →
      cv2.length ≤ idx + (ks.length - 1) →
      (p1s.getLastD 0 : ℚ) / (arrScale : ℚ) = tc1 →
      (p2s.getLastD 0 : ℚ) / (arrScale : ℚ) = tc2 →
      ((g1 : ℝ) = 2 * (an.gridDen : ℝ) ^ 4 * (muScale : ℝ)
        * ((Phi1 : ℝ) + (tc1 : ℝ) * ((ks.headD 0 : ℝ) / (an.gridDen : ℝ)) ^ 2
          + (antiSlope1 an : ℝ) / 2 * (((ks.headD 0 : ℝ) / (an.gridDen : ℝ)) ^ 2) ^ 2)) →
      ((g2 : ℝ) = 2 * (an.gridDen : ℝ) ^ 4 * (muScale : ℝ)
        * ((Phi2 : ℝ) + (tc2 : ℝ) * ((ks.headD 0 : ℝ) / (an.gridDen : ℝ)) ^ 2
          + (antiSlope2 an : ℝ) / 2 * (((ks.headD 0 : ℝ) / (an.gridDen : ℝ)) ^ 2) ^ 2)) →
      LinPiecesValid Ψ an.sigma lps →
      checkAntiPiecesAux an (an.mu1 * (an.mu2 * an.mu3 * an.mu4 * an.mu5))
        (an.mu2 * an.mu3 * an.mu4 * an.mu5) (an.mu1 * an.mu3 * an.mu4 * an.mu5)
        (an.mu1 * an.mu2 * an.mu4 * an.mu5) (an.mu1 * an.mu2 * an.mu3 * an.mu5)
        (an.mu1 * an.mu2 * an.mu3 * an.mu4) first g1 g2
        ks p1s p2s x2s x1s xas t2s t4s lps = true →
      let vs := ks.tail.map fun (k : ℕ) ↦ (k : ℚ) / (an.gridDen : ℚ)
      let t0 : ℚ := ((ks.headD 0 : ℚ) / (an.gridDen : ℚ)) ^ 2
      let cells1 := cutAux cv1 t0 (cv1.getD idx 0) Phi1 idx vs
      let cells2 := cutAux cv2 t0 (cv2.getD idx 0) Phi2 idx vs
      meshOK ((ks.headD 0 : ℚ) / (an.gridDen : ℚ)) vs = true ∧
      ∀ (u c1 c2 ρ : ℝ), ((ks.headD 0 : ℝ) / (an.gridDen : ℝ)) ^ 2 ≤ u →
        0 ≤ c1 → 0 ≤ c2 → ρ ^ 2 ≤ c1 * c2 →
        let cell1 := cells1.getD (pickIdx vs (√u)) ⟨0, 0, 0⟩
        let cell2 := cells2.getD (pickIdx vs (√u)) ⟨0, 0, 0⟩
        let phi1 := cellPhi cell1 u + (tc1 : ℝ) + (antiSlope1 an : ℝ) * u
        let phi2 := cellPhi cell2 u + (tc2 : ℝ) + (antiSlope2 an : ℝ) * u
        let G1 := cellPrim cell1 u + (tc1 : ℝ) * u + (antiSlope1 an : ℝ) / 2 * u ^ 2
        let G2 := cellPrim cell2 u + (tc2 : ℝ) * u + (antiSlope2 an : ℝ) / 2 * u ^ 2
        let Y1 := (if u = 0 then 0 else cellPhi cell1 u - cellPrim cell1 u / u)
          + (antiSlope1 an : ℝ) / 2 * u
        let Y2 := (if u = 0 then 0 else cellPhi cell2 u - cellPrim cell2 u / u)
          + (antiSlope2 an : ℝ) / 2 * u
        let sL : ℝ := (lamScale : ℝ)
        let sM : ℝ := (muScale : ℝ)
        Ψ ((an.sigma : ℝ) * √u) ≤ (an.lam0 : ℝ) / sL + (an.lam1 : ℝ) / sL * u
            + (an.lam2 : ℝ) / sL * u ^ 2
            + ((an.l3s + an.l3a + an.l3b : Int) : ℝ) / sL * u ^ 3
            + (G1 - c2 * phi1 - ρ * Y1)
            + (G2 - (1 / 2) * c1 * phi2 - (1 / 2) * ρ * Y2)
            + ((an.mu1 : ℝ) / sM) * (c2 - 1) ^ 2 + ((an.mu2 : ℝ) / sM) * (c1 - c2 - 1) ^ 2
            + ((an.mu3 : ℝ) / sM) * (c1 + c2 - 3) ^ 2 + ((an.mu4 : ℝ) / sM) * (c1 - 2) ^ 2
            + ((an.mu5 : ℝ) / sM) * ρ ^ 2 + ((an.sigmaAt : ℝ) / sM) * u * ρ := by
  intro ks
  induction ks with
  | nil =>
    intro first g1 g2 Phi1 Phi2 idx p1s p2s x2s x1s xas t2s t4s lps
      _ _ _ _ _ _ _ _ _ _ _ hok
    simp [checkAntiPiecesAux] at hok
  | cons k0_init ks' ih =>
    intro first g1 g2 Phi1 Phi2 idx p1s p2s x2s x1s xas t2s t4s lps
      hfirst hpos hcv1 hcv2 hl1 hl2 htc1 htc2 hg1 hg2 hlps hok
    generalize hks_eq : (k0_init :: ks') = ks at hfirst hpos hcv1 hcv2 hl1 hl2 hg1 hg2 hok ⊢
    unfold checkAntiPiecesAux at hok
    split at hok
    · -- Tail cell `[kK]`
      next kK p1 p2 x2 x1 xa t2 t4 =>
      simp only [Bool.and_eq_true, Bool.not_eq_true'] at hok
      obtain ⟨⟨hf, hconeOK⟩, hray⟩ := hok
      have hkKpos : 0 < kK := by simpa using hpos hf
      simp only [List.tail_cons, List.map_nil, List.headD_cons, meshOK, true_and]
      intro u c1 c2 ρ hu hc1 hc2 hρ
      have hray' : sweepTailCell an.gridDen
          ((an.gridDen : Int) ^ 6 * lamScale * (an.mu1 * (an.mu2 * an.mu3 * an.mu4 * an.mu5)))
          (pInSq (pieceFvWGen an (an.mu1 * (an.mu2 * an.mu3 * an.mu4 * an.mu5))
            (an.mu2 * an.mu3 * an.mu4 * an.mu5) (an.mu1 * an.mu3 * an.mu4 * an.mu5)
            (an.mu1 * an.mu2 * an.mu4 * an.mu5) (an.mu1 * an.mu2 * an.mu3 * an.mu5)
            (an.mu1 * an.mu2 * an.mu3 * an.mu4) true kK kK
            p1 p1 p2 p2 x2 x2 x1 x1 xa xa t2 t2 t4 t4 g1 g2))
          ((kK : ℚ) / (an.gridDen : ℚ)) lps = true := by
        simpa [pow_succ, mul_assoc] using hray
      exact checkAntiPiecesAux_tail_sound an Ψ hMpos hM2 hm1 hm2 hm3 hm4 hm5 cv1 cv2 tc1 tc2
        g1 g2 Phi1 Phi2 idx kK p1 p2 x2 x1 xa t2 t4 lps hkKpos
        (by simpa using htc1) (by simpa using htc2) (by simpa using hg1) (by simpa using hg2)
        hconeOK hlps hray' u c1 c2 ρ hu hc1 hc2 hρ
    · -- Segment cell `k0 :: k1 :: ks`
      next k0 k1 ks p1a p1b p1s p2a p2b p2s x2a x2b x2s x1a x1b x1s xaa xab xas
        t2a t2b t2s t4a t4b t4s =>
      have hks'_eq : ks' = k1 :: ks := (List.cons.inj hks_eq).2
      rw [hks'_eq] at ih
      dsimp only at hok
      split at hok
      swap
      · simp at hok
      rename_i hcond
      simp only [Bool.and_eq_true, decide_eq_true_eq, Bool.or_eq_true, Bool.not_eq_true',
        beq_iff_eq] at hcond
      obtain ⟨⟨hk01, hcone0⟩, hdiv0⟩ := hcond
      split at hok
      · simp at hok
      rename_i lps' hsw_eq
      · have hcone1 := checkAntiPiecesAux_head_cone hok
        have hMposQ : (0 : ℚ) < (an.gridDen : ℚ) := by exact_mod_cast hMpos
        have hk01Q : (k0 : ℚ) / (an.gridDen : ℚ) < (k1 : ℚ) / (an.gridDen : ℚ) :=
          div_lt_div_of_pos_right (by exact_mod_cast hk01) hMposQ
        have hcv1_0 : cv1.getD idx 0 = (p1a : ℚ) / (arrScale : ℚ) - tc1 := by simpa using hcv1 0 (by simp)
        have hcv2_0 : cv2.getD idx 0 = (p2a : ℚ) / (arrScale : ℚ) - tc2 := by simpa using hcv2 0 (by simp)
        have hcv1_1 : cv1.getD (idx + 1) 0 = (p1b : ℚ) / (arrScale : ℚ) - tc1 := by
          cases ks with
          | nil =>
            have hlen1 : cv1.length ≤ idx + 1 := by simpa using hl1
            rw [List.getD_eq_default _ _ hlen1]
            have htc : (p1b : ℚ) / (arrScale : ℚ) = tc1 := by
              cases p1s with
              | nil => simpa using htc1
              | cons _ _ => simp [checkAntiPiecesAux] at hok
            linarith only [htc]
          | cons _ _ => simpa using hcv1 1 (by simp)
        have hcv2_1 : cv2.getD (idx + 1) 0 = (p2b : ℚ) / (arrScale : ℚ) - tc2 := by
          cases ks with
          | nil =>
            have hlen2 : cv2.length ≤ idx + 1 := by simpa using hl2
            rw [List.getD_eq_default _ _ hlen2]
            have htc : (p2b : ℚ) / (arrScale : ℚ) = tc2 := by
              cases p2s with
              | nil => simpa using htc2
              | cons _ _ => simp [checkAntiPiecesAux] at hok
            linarith only [htc]
          | cons _ _ => simpa using hcv2 1 (by simp)
        have hW_eq_int : ((an.gridDen : Int) * (an.gridDen : Int))
              * ((an.gridDen : Int) * (an.gridDen : Int))
              * ((an.gridDen : Int) * (an.gridDen : Int))
              * lamScale * ((k1 : Int) * (k1 : Int) - (k0 : Int) * (k0 : Int))
              * ((k1 : Int) * (k1 : Int) - (k0 : Int) * (k0 : Int))
              * (an.mu1 * (an.mu2 * an.mu3 * an.mu4 * an.mu5))
            = (an.gridDen : Int) ^ 6 * lamScale
              * (((k1 : Int) * (k1 : Int) - (k0 : Int) * (k0 : Int))
                * ((k1 : Int) * (k1 : Int) - (k0 : Int) * (k0 : Int)))
              * (an.mu1 * (an.mu2 * an.mu3 * an.mu4 * an.mu5)) := by ring
        rw [hW_eq_int] at hsw_eq
        have hW_pos : 0 < (an.gridDen : Int) ^ 6 * lamScale
            * (((k1 : Int) * (k1 : Int) - (k0 : Int) * (k0 : Int))
              * ((k1 : Int) * (k1 : Int) - (k0 : Int) * (k0 : Int)))
            * (an.mu1 * (an.mu2 * an.mu3 * an.mu4 * an.mu5)) := by
          have h1 : (0 : Int) < (an.gridDen : Int) := by exact_mod_cast hMpos
          have h2 : (0 : Int) < lamScale := by decide
          have hmAll_pos : 0 < an.mu1 * (an.mu2 * an.mu3 * an.mu4 * an.mu5) :=
            mul_pos hm1 (mul_pos (mul_pos (mul_pos hm2 hm3) hm4) hm5)
          have hdu_pos : (0 : Int) < (k1 : Int) * (k1 : Int) - (k0 : Int) * (k0 : Int) := by
            have hklt : (k0 : Int) < (k1 : Int) := by exact_mod_cast hk01
            have hk0 : (0 : Int) ≤ (k0 : Int) := Int.natCast_nonneg k0
            nlinarith only [hklt, hk0]
          positivity
        have hlps' : LinPiecesValid Ψ an.sigma lps' :=
          (sweepFiniteCell_sound hMpos hW_pos lps lps' _ _ hlps hsw_eq).1
        set t0Q : ℚ := ((k0 : ℚ) / (an.gridDen : ℚ)) ^ 2
        set t1Q : ℚ := ((k1 : ℚ) / (an.gridDen : ℚ)) ^ 2
        set Phi1' : ℚ := Phi1 + (cv1.getD idx 0 + cv1.getD (idx + 1) 0) / 2 * (t1Q - t0Q)
        set Phi2' : ℚ := Phi2 + (cv2.getD idx 0 + cv2.getD (idx + 1) 0) / 2 * (t1Q - t0Q)
        set U0I : Int := (k0 : Int) * (k0 : Int)
        set U1I : Int := (k1 : Int) * (k1 : Int)
        set duI : Int := U1I - U0I
        set g1' : Int := g1 + (an.gridDen : Int) * (an.gridDen : Int) * rMA * (p1a + p1b) * duI
          + an.slope1 * (U1I * U1I - U0I * U0I)
        set g2' : Int := g2 + (an.gridDen : Int) * (an.gridDen : Int) * rMA * (p2a + p2b) * duI
          + an.slope2 * (U1I * U1I - U0I * U0I)
        have hS_A : (arrScale : ℝ) = 68719476736 := by norm_num [arrScale]
        have hS_M : (muScale : ℝ) = 1125899906842624 := by norm_num [muScale]
        have hR_MA : (rMA : ℝ) = 16384 := by norm_num [rMA]
        have hg1' : (g1' : ℝ) = 2 * (an.gridDen : ℝ) ^ 4 * (muScale : ℝ)
            * ((Phi1' : ℝ) + (tc1 : ℝ) * ((k1 : ℝ) / (an.gridDen : ℝ)) ^ 2
              + (antiSlope1 an : ℝ) / 2 * (((k1 : ℝ) / (an.gridDen : ℝ)) ^ 2) ^ 2) := by
          have hg1_0 : (g1 : ℝ) = 2 * (an.gridDen : ℝ) ^ 4 * (muScale : ℝ)
              * ((Phi1 : ℝ) + (tc1 : ℝ) * ((k0 : ℝ) / (an.gridDen : ℝ)) ^ 2
                + (antiSlope1 an : ℝ) / 2 * (((k0 : ℝ) / (an.gridDen : ℝ)) ^ 2) ^ 2) := by
            simpa using hg1
          have hsl1 : (antiSlope1 an : ℝ) = (an.slope1 : ℝ) / (muScale : ℝ) := by
            unfold antiSlope1; push_cast; rfl
          have hc0 : (cv1.getD idx 0 : ℝ) = (p1a : ℝ) / (arrScale : ℝ) - (tc1 : ℝ) := by exact_mod_cast hcv1_0
          have hc1' : (cv1.getD (idx + 1) 0 : ℝ) = (p1b : ℝ) / (arrScale : ℝ) - (tc1 : ℝ) := by exact_mod_cast hcv1_1
          have hMne : (an.gridDen : ℝ) ≠ 0 := by exact_mod_cast hMpos.ne'
          simp only [g1', Phi1', t1Q, t0Q, U1I, U0I, duI]
          push_cast; rw [hg1_0, hc0, hc1', hsl1, hS_A, hS_M, hR_MA]
          field_simp [hMne]; ring
        have hg2' : (g2' : ℝ) = 2 * (an.gridDen : ℝ) ^ 4 * (muScale : ℝ)
            * ((Phi2' : ℝ) + (tc2 : ℝ) * ((k1 : ℝ) / (an.gridDen : ℝ)) ^ 2
              + (antiSlope2 an : ℝ) / 2 * (((k1 : ℝ) / (an.gridDen : ℝ)) ^ 2) ^ 2) := by
          have hg2_0 : (g2 : ℝ) = 2 * (an.gridDen : ℝ) ^ 4 * (muScale : ℝ)
              * ((Phi2 : ℝ) + (tc2 : ℝ) * ((k0 : ℝ) / (an.gridDen : ℝ)) ^ 2
                + (antiSlope2 an : ℝ) / 2 * (((k0 : ℝ) / (an.gridDen : ℝ)) ^ 2) ^ 2) := by
            simpa using hg2
          have hsl2 : (antiSlope2 an : ℝ) = (an.slope2 : ℝ) / (muScale : ℝ) := by
            unfold antiSlope2; push_cast; rfl
          have hc0 : (cv2.getD idx 0 : ℝ) = (p2a : ℝ) / (arrScale : ℝ) - (tc2 : ℝ) := by exact_mod_cast hcv2_0
          have hc1' : (cv2.getD (idx + 1) 0 : ℝ) = (p2b : ℝ) / (arrScale : ℝ) - (tc2 : ℝ) := by exact_mod_cast hcv2_1
          have hMne : (an.gridDen : ℝ) ≠ 0 := by exact_mod_cast hMpos.ne'
          simp only [g2', Phi2', t1Q, t0Q, U1I, U0I, duI]
          push_cast; rw [hg2_0, hc0, hc1', hsl2, hS_A, hS_M, hR_MA]
          field_simp [hMne]; ring
        obtain ⟨hmesh_rec, hpt_rec⟩ := ih false g1' g2' Phi1' Phi2' (idx + 1)
          (p1b :: p1s) (p2b :: p2s) (x2b :: x2s) (x1b :: x1s) (xab :: xas)
          (t2b :: t2s) (t4b :: t4s) lps'
          (fun h ↦ by cases h)
          (fun _ ↦ by simpa using Nat.zero_le k0 |>.trans_lt hk01)
          (fun k hk ↦ by
            have hk' : k + 1 < (k0 :: k1 :: ks).length - 1 := by simp at hk ⊢; omega
            simpa [Nat.add_assoc, Nat.add_comm 1 k] using hcv1 (k + 1) hk')
          (fun k hk ↦ by
            have hk' : k + 1 < (k0 :: k1 :: ks).length - 1 := by simp at hk ⊢; omega
            simpa [Nat.add_assoc, Nat.add_comm 1 k] using hcv2 (k + 1) hk')
          (by simp at hl1 ⊢; omega)
          (by simp at hl2 ⊢; omega)
          (by simpa [getLastD_cons_cons] using htc1)
          (by simpa [getLastD_cons_cons] using htc2)
          (by simpa using hg1')
          (by simpa using hg2')
          hlps' hok
        refine ⟨?_, fun u c1 c2 ρ hu hc1 hc2 hρ ↦ ?_⟩
        · simp only [List.tail_cons, List.map_cons, List.headD_cons, meshOK, Bool.and_eq_true,
            decide_eq_true_eq]
          exact ⟨hk01Q, by simpa using hmesh_rec⟩
        · by_cases hlt : √u < (k1 : ℝ) / (an.gridDen : ℝ)
          · exact checkAntiPiecesAux_seg_sound an Ψ hMpos hM2 hm1 hm2 hm3 hm4 hm5 cv1 cv2 tc1 tc2
              first g1 g2 Phi1 Phi2 idx k0 k1 ks
              p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b lps lps' hk01
              (fun hf ↦ by simpa using hfirst hf) (fun hf ↦ by simpa using hpos hf)
              hcv1_0 hcv2_0 hcv1_1 hcv2_1 (by simpa using hg1) (by simpa using hg2)
              hcone0 hcone1
              (fun hf ↦ by simp [hf] at hdiv0; exact hdiv0)
              hlps hsw_eq u c1 c2 ρ (by simpa using hu) hlt hc1 hc2 hρ
          · push Not at hlt
            have hu_ge : ((k1 : ℝ) / (an.gridDen : ℝ)) ^ 2 ≤ u := by
              have h0 : (0 : ℝ) ≤ (k1 : ℝ) / (an.gridDen : ℝ) := by positivity
              have hu0 : 0 ≤ u := le_trans (sq_nonneg _) (by simpa using hu)
              exact (Real.le_sqrt h0 hu0).1 hlt
            have hpick_gt : pickIdx (((k1 : ℚ) / (an.gridDen : ℚ)) :: ks.map fun (k : ℕ) ↦ (k : ℚ) / (an.gridDen : ℚ)) (√u)
                = pickIdx (ks.map fun (k : ℕ) ↦ (k : ℚ) / (an.gridDen : ℚ)) (√u) + 1 := by
              simp only [pickIdx]
              have hnotlt : ¬ √u < (((k1 : ℚ) / (an.gridDen : ℚ) : ℚ) : ℝ) := by
                push_cast; linarith
              simp only [hnotlt, ↓reduceIte]
            have hstep := hpt_rec u c1 c2 ρ (by simpa using hu_ge) hc1 hc2 hρ
            simpa only [List.tail_cons, List.map_cons, List.headD_cons, hpick_gt, cutAux,
              List.getD_cons_succ, Phi1', Phi2', t0Q, t1Q] using hstep
    · simp at hok

private lemma checkAntiPiecesAux_lengths {an : AntiNode} {mAll m1 m2 m3 m4 m5 : Int} :
    ∀ (ks : List ℕ) (first : Bool) (g1 g2 : Int)
      (p1s p2s x2s x1s xas t2s t4s : List Int) (lps : List LinPiece),
      checkAntiPiecesAux an mAll m1 m2 m3 m4 m5 first g1 g2
        ks p1s p2s x2s x1s xas t2s t4s lps = true →
      p1s.length = ks.length ∧ p2s.length = ks.length := by
  intro ks
  induction ks with
  | nil => intro _ _ _ _ _ _ _ _ _ _ _ h; simp [checkAntiPiecesAux] at h
  | cons k0 ks' ih =>
    intro first g1 g2 p1s p2s x2s x1s xas t2s t4s lps h
    generalize hks_eq : (k0 :: ks') = ks at h
    unfold checkAntiPiecesAux at h
    split at h
    · exact ⟨rfl, rfl⟩
    · next k0' k1' ks'' p1a p1b p1s' p2a p2b p2s' x2a x2b x2s' x1a x1b x1s' xaa xab xas'
        t2a t2b t2s' t4a t4b t4s' =>
      have hks'_eq : ks' = k1' :: ks'' := (List.cons.inj hks_eq).2
      rw [hks'_eq] at ih
      dsimp only at h
      split at h
      swap
      · simp at h
      split at h
      · simp at h
      rename_i _ lps' _
      obtain ⟨h1, h2⟩ := ih false _ _ (p1b :: p1s') (p2b :: p2s') (x2b :: x2s')
        (x1b :: x1s') (xab :: xas') (t2b :: t2s') (t4b :: t4s') lps' h
      simp only [List.length_cons] at h1 h2 ⊢
      exact ⟨by omega, by omega⟩
    · simp at h

/-- **Pointwise soundness of `checkAntiNode`:** if `checkAntiNode nodes smax an = true`, then
`meshOK 0 (antiVs an) = true` and `Ψ(σ √u) ≤ antiMaj an u c1 c2 ρ` for all `u ≥ 0` and
`c1, c2 ≥ 0, ρ² ≤ c1 c2`. -/
theorem checkAntiNode_sound {Ψ : ℝ → ℝ} {nodes : List (ℚ × ℚ)} {smax : ℚ}
    (hΨ : CapsHold Ψ nodes smax) {an : AntiNode}
    (hok : checkAntiNode nodes smax an = true) :
    meshOK 0 (antiVs an) = true ∧
    ∀ u c1 c2 ρ : ℝ, 0 ≤ u → 0 ≤ c1 → 0 ≤ c2 → ρ ^ 2 ≤ c1 * c2 →
      Ψ ((an.sigma : ℝ) * √u) ≤ antiMaj an u c1 c2 ρ := by
  unfold checkAntiNode at hok
  cases hk : an.knots with
  | nil => rw [hk] at hok; simp at hok
  | cons k0 ks =>
    rw [hk] at hok
    cases k0 with
    | succ _ => simp at hok
    | zero =>
      simp only [Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at hok
      obtain ⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨hMpos, hM2⟩, hσpos⟩, hnodesOK⟩, hm1⟩, hm2⟩, hm3⟩, hm4⟩, hm5⟩,
        _⟩, _⟩, _⟩, _⟩, haux⟩ := hok
      have hst : nodesStrictOK nodes = true := by
        cases nodes with
        | nil => simp [nodesOK] at hnodesOK
        | cons m rest =>
          cases m with
          | mk x y =>
            by_cases hx : x = 0
            · subst hx; exact hnodesOK
            · simp [nodesOK, hx] at hnodesOK
      have hnn : ∀ m ∈ nodes, 0 ≤ m.1 := by
        cases nodes with
        | nil => simp [nodesOK] at hnodesOK
        | cons m rest =>
          cases m with
          | mk x y =>
            by_cases hx : x = 0
            · subst hx
              exact nodesStrictOK_nonneg ((0, y) :: rest) 0 le_rfl hst
                (fun _ h ↦ by cases h; exact le_rfl)
            · simp [nodesOK, hx] at hnodesOK
      have hlps : LinPiecesValid Ψ an.sigma (mkLinPieces an.sigma smax nodes) :=
        mkLinPieces_valid hσpos nodes hst hnn hΨ
      obtain ⟨hp1_len, hp2_len⟩ := checkAntiPiecesAux_lengths (0 :: ks) true 0 0
        an.phi1 an.phi2 an.xi2 an.xi1 an.xia an.th2 an.th4 _ haux
      have hne : (0 :: ks) ≠ [] := List.cons_ne_nil _ _
      set vs := (0 :: ks).tail.map fun (k : ℕ) ↦ (k : ℚ) / (an.gridDen : ℚ)
      set v1 := rowVals an.phi1
      set v2 := rowVals an.phi2
      set tc1 := tailConst vs v1
      set tc2 := tailConst vs v2
      set cv1 := (shiftVals vs v1).take vs.length
      set cv2 := (shiftVals vs v2).take vs.length
      have htc1 : (an.phi1.getLastD 0 : ℚ) / (arrScale : ℚ) = tc1 := by
        have h := tailConst_antiVals_eq (M := an.gridDen) hp1_len hne
        have hp1_ne : an.phi1 ≠ [] := by intro he; rw [he] at hp1_len; simp at hp1_len
        rw [getLastD_eq_getLast _ _ hp1_ne]; exact h.symm
      have htc2 : (an.phi2.getLastD 0 : ℚ) / (arrScale : ℚ) = tc2 := by
        have h := tailConst_antiVals_eq (M := an.gridDen) hp2_len hne
        have hp2_ne : an.phi2 ≠ [] := by intro he; rw [he] at hp2_len; simp at hp2_len
        rw [getLastD_eq_getLast _ _ hp2_ne]; exact h.symm
      have hcv1 : ∀ k, k < (0 :: ks).length - 1 →
          cv1.getD (0 + k) 0 = (an.phi1.getD k 0 : ℚ) / (arrScale : ℚ) - tc1 := by
        intro k hk
        simp only [Nat.zero_add, List.length_cons, Nat.add_sub_cancel] at hk ⊢
        have hlt1 : k < cv1.length := by
          simp only [cv1, List.length_take, shiftVals, List.length_map, v1, rowVals, vs,
            List.tail_cons, hp1_len, List.length_cons]
          omega
        rw [List.getD_eq_getElem _ _ hlt1]
        simp only [cv1, List.getElem_take, shiftVals, v1, rowVals, List.getElem_map]
        rw [List.getD_eq_getElem _ _ (by rw [hp1_len]; simp; omega)]
        rfl
      have hcv2 : ∀ k, k < (0 :: ks).length - 1 →
          cv2.getD (0 + k) 0 = (an.phi2.getD k 0 : ℚ) / (arrScale : ℚ) - tc2 := by
        intro k hk
        simp only [Nat.zero_add, List.length_cons, Nat.add_sub_cancel] at hk ⊢
        have hlt2 : k < cv2.length := by
          simp only [cv2, List.length_take, shiftVals, List.length_map, v2, rowVals, vs,
            List.tail_cons, hp2_len, List.length_cons]
          omega
        rw [List.getD_eq_getElem _ _ hlt2]
        simp only [cv2, List.getElem_take, shiftVals, v2, rowVals, List.getElem_map]
        rw [List.getD_eq_getElem _ _ (by rw [hp2_len]; simp; omega)]
        rfl
      have hl1 : cv1.length ≤ 0 + ((0 :: ks).length - 1) := by simp [cv1, vs]
      have hl2 : cv2.length ≤ 0 + ((0 :: ks).length - 1) := by simp [cv2, vs]
      have hres := checkAntiPiecesAux_sound an Ψ hMpos hM2 hm1 hm2 hm3 hm4 hm5 cv1 cv2 tc1 tc2
        (0 :: ks) true 0 0 0 0 0 an.phi1 an.phi2 an.xi2 an.xi1 an.xia an.th2 an.th4 _
        (fun _ ↦ by simp) (fun h ↦ by cases h)
        hcv1 hcv2 hl1 hl2 htc1 htc2 (by simp) (by simp) hlps haux
      have hvs_eq : antiVs an = vs := by simp [antiVs, vs, hk]
      have hvs_tail : (0 :: ks).tail.map (fun (k : ℕ) ↦ (k : ℚ) / (an.gridDen : ℚ)) = vs := rfl
      refine ⟨?_, fun u c1 c2 ρ hu hc1 hc2 hρ ↦ ?_⟩
      · rw [hvs_eq]
        simpa only [List.headD_cons, Nat.cast_zero, zero_div, hvs_tail] using hres.1
      · have hpt := hres.2 u c1 c2 ρ (by simpa using hu) hc1 hc2 hρ
        refine hpt.trans_eq ?_
        unfold antiMaj plPhi plPrim plY cutTest cutPrim cutY cellAt cutCells
        rw [hvs_eq]
        have hsq : √u ^ 2 = u := Real.sq_sqrt hu
        simp only [hsq, List.headD_cons, Nat.cast_zero, zero_div, ne_eq, OfNat.ofNat_ne_zero,
          not_false_eq_true, zero_pow, cellPhi, cellPrim]
        rfl

/-! ### Section 4: Expectation and endpoint soundness (`AntiNode`, `QuadNode`, `moment`) -/

private lemma checkSumEndpoint_sound {d : ℕ} {J : Fin d → Fin d → ℝ} {a b : MvPolynomial (Fin d) ℝ}
    (hc : Circular J a b) (an : AntiNodeSummary)
    (hl3s : 0 ≤ an.l3s) (hl3a : 0 ≤ an.l3a) (hl3b : 0 ≤ an.l3b)
    {s : ℝ} (hs : 0 < s)
    (hs_eq : s = 32 * gramN (gramT J a b) + 8 * gramH (gramT J a b)
      + 32 * gramB (gramT J a b) + 96 * gramY (gramT J a b))
    (se : ℚ) (par? : Option EndPar) (val : ℚ)
    (hse0 : 0 ≤ se) (hok : checkSumEndpoint an se par? val = true) :
    let t := gramT J a b
    let pn := gramN t / s
    let ph := gramH t / s
    let pb := gramB t / s
    let py := gramY t / s
    let pz := gramZ t / s
    let s0p := jointS0 t / s
    let h0p := jointH0 t / s
    let Ba := 198 * h0p + 300 * √(s0p * h0p)
    let Bb := (11781 / 32) * h0p + 135 * √(s0p * h0p)
    let sL : ℝ := (lamScale : ℝ)
    let l0 : ℝ := (an.lam0 : ℝ) / sL
    let l1 : ℝ := (an.lam1 : ℝ) / sL
    let l2 : ℝ := (an.lam2 : ℝ) / sL
    let l3s : ℝ := (an.l3s : ℝ) / sL
    let l3a : ℝ := (an.l3a : ℝ) / sL
    let l3b : ℝ := (an.l3b : ℝ) / sL
    let A := l2 + 9 * (l3s + l3a + l3b) + evalLin5 (sumDLin an) pn ph pb py pz
    let B := l3s * (radiusC6 : ℝ) + l3a * Ba + l3b * Bb
    (l0 + l1 + 2 * l2 + 6 * (l3s + l3a + l3b)) + A * (se : ℝ) + B * ((se : ℝ) * √(se : ℝ)) ≤ (val : ℝ) := by
  intro t pn ph pb py pz s0p h0p Ba Bb sL l0 l1 l2 l3s l3a l3b A B
  unfold checkSumEndpoint at hok
  by_cases hseZ : se = 0
  · subst hseZ
    simp only [beq_self_eq_true, ↓reduceIte, decide_eq_true_eq] at hok
    have hR : (((an.lam0 : ℚ) / (lamScale : ℚ) + (an.lam1 : ℚ) / (lamScale : ℚ)
        + 2 * ((an.lam2 : ℚ) / (lamScale : ℚ))
        + 6 * ((an.l3s : ℚ) / (lamScale : ℚ) + (an.l3a : ℚ) / (lamScale : ℚ)
          + (an.l3b : ℚ) / (lamScale : ℚ)) : ℚ) : ℝ) ≤ (val : ℝ) := by exact_mod_cast hok
    simp only [Rat.cast_zero, zero_mul, mul_zero, add_zero]
    simpa only [l0, l1, l2, l3s, l3a, l3b, sL, Rat.cast_add, Rat.cast_mul, Rat.cast_div,
      Rat.cast_intCast, Rat.cast_ofNat] using hR
  · have hse_pos : 0 < se := lt_of_le_of_ne hse0 (Ne.symm hseZ)
    have hbeq : (se == 0) = false := beq_false_of_ne hseZ
    rw [hbeq] at hok
    simp only [Bool.false_eq_true, ↓reduceIte, hse_pos, decide_true] at hok
    cases par? with
    | none => simp at hok
    | some pd =>
      simp only [Bool.and_eq_true, decide_eq_true_eq] at hok
      obtain ⟨⟨⟨⟨⟨halA, halB⟩, hsb0⟩, hsb2⟩, hcuts⟩, hbd⟩ := hok
      have hseR_pos : (0 : ℝ) < (se : ℝ) := by exact_mod_cast hse_pos
      have hsb0R : (0 : ℝ) < (pd.sqrtUb : ℝ) := by exact_mod_cast hsb0
      have hsb2R : (se : ℝ) ≤ (pd.sqrtUb : ℝ) ^ 2 := by
        have : (se : ℝ) ≤ (pd.sqrtUb : ℝ) * (pd.sqrtUb : ℝ) := by exact_mod_cast hsb2
        linarith only [this]
      have hsqrt_le : √(se : ℝ) ≤ (pd.sqrtUb : ℝ) :=
        (Real.sqrt_le_iff).2 ⟨hsb0R.le, hsb2R⟩
      have hl3s_nn : 0 ≤ l3s := div_nonneg (by exact_mod_cast hl3s) (by norm_num [sL, lamScale])
      have hl3a_nn : 0 ≤ l3a := div_nonneg (by exact_mod_cast hl3a) (by norm_num [sL, lamScale])
      have hl3b_nn : 0 ≤ l3b := div_nonneg (by exact_mod_cast hl3b) (by norm_num [sL, lamScale])
      have hs0p_nn : 0 ≤ s0p := div_nonneg hc.jointS0_nonneg hs.le
      have hh0p_nn : 0 ≤ h0p := div_nonneg hc.jointH0_nonneg hs.le
      have hs0p_eq : s0p = evalLin5 s0Form pn ph pb py pz := by
        simp only [s0p, evalLin5, s0Form, pn, ph, pb, py, pz, jointS0]
        push_cast; field_simp [hs.ne']; ring
      have hh0p_eq : h0p = evalLin5 h0Form pn ph pb py pz := by
        simp only [h0p, evalLin5, h0Form, pn, ph, pb, py, pz, jointH0]
        push_cast; field_simp [hs.ne']; ring
      have hBa_le : Ba ≤ (150 * (pd.alphaA : ℝ)) * s0p + (198 + 150 / (pd.alphaA : ℝ)) * h0p := by
        have ham := two_sqrt_mul_le hs0p_nn hh0p_nn (by exact_mod_cast halA : (0 : ℝ) < (pd.alphaA : ℝ))
        have h1 : 150 * (h0p / (pd.alphaA : ℝ)) = 150 / (pd.alphaA : ℝ) * h0p := by ring
        simp only [Ba]; nlinarith only [ham, h1]
      have hBb_le : Bb ≤ ((135 / 2) * (pd.alphaB : ℝ)) * s0p
          + (11781 / 32 + 135 / (2 * (pd.alphaB : ℝ))) * h0p := by
        have ham := two_sqrt_mul_le hs0p_nn hh0p_nn (by exact_mod_cast halB : (0 : ℝ) < (pd.alphaB : ℝ))
        simp only [Bb]
        have h1 : 135 * √(s0p * h0p) = (135 / 2) * (2 * √(s0p * h0p)) := by ring
        have h2 : (135 / 2) * (h0p / (pd.alphaB : ℝ)) = 135 / (2 * (pd.alphaB : ℝ)) * h0p := by ring
        nlinarith only [ham, h1, h2]
      have hDJ_eq : evalLin5 (sumDJ an pd.alphaA pd.alphaB) pn ph pb py pz
          = l3a * ((150 * (pd.alphaA : ℝ)) * s0p + (198 + 150 / (pd.alphaA : ℝ)) * h0p)
            + l3b * (((135 / 2) * (pd.alphaB : ℝ)) * s0p
              + (11781 / 32 + 135 / (2 * (pd.alphaB : ℝ))) * h0p) := by
        simp only [sumDJ, evalLin5_add, evalLin5_smul, ← hs0p_eq, ← hh0p_eq]
        push_cast
        have h1 : (an.l3a : ℝ) / (lamScale : ℝ) = l3a := rfl
        have h2 : (an.l3b : ℝ) / (lamScale : ℝ) = l3b := rfl
        rw [h1, h2]
      have hBa_nn : 0 ≤ Ba :=
        add_nonneg (mul_nonneg (by norm_num) hh0p_nn) (mul_nonneg (by norm_num) (Real.sqrt_nonneg _))
      have hBb_nn : 0 ≤ Bb :=
        add_nonneg (mul_nonneg (by norm_num) hh0p_nn) (mul_nonneg (by norm_num) (Real.sqrt_nonneg _))
      have hDJ_ge : l3a * Ba + l3b * Bb ≤ evalLin5 (sumDJ an pd.alphaA pd.alphaB) pn ph pb py pz := by
        rw [hDJ_eq]
        exact add_le_add (mul_le_mul_of_nonneg_left hBa_le hl3a_nn)
          (mul_le_mul_of_nonneg_left hBb_le hl3b_nn)
      have hDJ_nn : 0 ≤ evalLin5 (sumDJ an pd.alphaA pd.alphaB) pn ph pb py pz :=
        (add_nonneg (mul_nonneg hl3a_nn hBa_nn) (mul_nonneg hl3b_nn hBb_nn)).trans hDJ_ge
      set obj := Lin5.add (sumDLin an) (Lin5.smul pd.sqrtUb (sumDJ an pd.alphaA pd.alphaB))
      set resid0 := Lin5.sub obj (Lin5.smul pd.eta sForm)
      set resid := pd.cuts.foldl
        (fun acc c ↦ Lin5.add acc (Lin5.smul c.weight (cutLin5 c.kind c.theta))) resid0
      have hsForm_eq : evalLin5 sForm pn ph pb py pz = 1 := by
        simp only [evalLin5, sForm, pn, ph, pb, py, pz]; push_cast
        field_simp [hs.ne']
        linarith only [hs_eq]
      have hstep1 : evalLin5 obj pn ph pb py pz - (pd.eta : ℝ) ≤ evalLin5 resid pn ph pb py pz := by
        have hfold := foldl_cuts_eval hc pn ph pb py pz hs rfl rfl rfl rfl rfl pd.cuts resid0 hcuts
        have hr0 : evalLin5 resid0 pn ph pb py pz = evalLin5 obj pn ph pb py pz - (pd.eta : ℝ) := by
          simp only [resid0, evalLin5_sub, evalLin5_smul, hsForm_eq, mul_one]
        linarith only [hfold, hr0]
      have hpn0 : 0 ≤ pn := div_nonneg (gramN_nonneg t) hs.le
      have hph0 : 0 ≤ ph := div_nonneg (gramH_nonneg t) hs.le
      have hpb0 : 0 ≤ pb := div_nonneg (gramB_nonneg t) hs.le
      have hpy0 : 0 ≤ py := div_nonneg (gramY_nonneg t) hs.le
      have hpz0 : 0 ≤ pz := div_nonneg ((gramY_nonneg t).trans (gramT_symm J a b)) hs.le
      have hsum1 : 32 * pn + 8 * ph + 32 * pb + 96 * py = 1 := by
        simp only [pn, ph, pb, py]
        field_simp [hs.ne']
        linarith only [hs_eq]
      have hpn_le : pn ≤ 1 / 32 := by linarith only [hsum1, hph0, hpb0, hpy0]
      have hph_le : ph ≤ 1 / 8 := by linarith only [hsum1, hpn0, hpb0, hpy0]
      have hpb_le : pb ≤ 1 / 32 := by linarith only [hsum1, hpn0, hph0, hpy0]
      have hpy_le : py ≤ 1 / 96 := by linarith only [hsum1, hpn0, hph0, hpb0]
      have hpz_le : pz ≤ 3 / 64 := by
        have hz2 : pz ^ 2 ≤ pn * ph := by
          simp only [pn, ph, pz]; rw [div_pow, div_mul_div_comm, ← sq]
          exact div_le_div_of_nonneg_right (gramZ_sq_le t) (sq_nonneg s)
        have hprod : 32 * pn * (8 * ph) ≤ (1 / 2 : ℝ) ^ 2 := by
          have : 32 * pn + 8 * ph ≤ 1 := by linarith only [hsum1, hpb0, hpy0]
          nlinarith [sq_nonneg (32 * pn - 8 * ph)]
        have hz2' : pz ^ 2 ≤ (3 / 64 : ℝ) ^ 2 := by nlinarith only [hz2, hprod]
        nlinarith only [hz2', hpz0]
      have hpp : ∀ (q : ℚ) (x u : ℝ), 0 ≤ x → x ≤ u → (q : ℝ) * x ≤ (posPartQ q : ℝ) * u := by
        intro q x u hx0 hxu
        unfold posPartQ
        split_ifs with hq
        · have hqR : (0 : ℝ) ≤ (q : ℝ) := by exact_mod_cast hq
          exact mul_le_mul_of_nonneg_left hxu hqR
        · push Not at hq
          have hqR : (q : ℝ) ≤ 0 := by exact_mod_cast hq.le
          have : (q : ℝ) * x ≤ 0 := mul_nonpos_of_nonpos_of_nonneg hqR hx0
          simp only [Rat.cast_zero, zero_mul]; exact this
      set Lq : ℚ := pd.eta + posPartQ resid.cn * (1 / 32) + posPartQ resid.ch * (1 / 8)
        + posPartQ resid.cb * (1 / 32) + posPartQ resid.cy * (1 / 96)
        + posPartQ resid.cz * (3 / 64)
      have hobj_le_L : evalLin5 obj pn ph pb py pz ≤ (Lq : ℝ) := by
        have h1 := hpp resid.cn pn (1 / 32) hpn0 hpn_le
        have h2 := hpp resid.ch ph (1 / 8) hph0 hph_le
        have h3 := hpp resid.cb pb (1 / 32) hpb0 hpb_le
        have h4 := hpp resid.cy py (1 / 96) hpy0 hpy_le
        have h5 := hpp resid.cz pz (3 / 64) hpz0 hpz_le
        have hev : evalLin5 resid pn ph pb py pz
            = (resid.cn : ℝ) * pn + (resid.ch : ℝ) * ph + (resid.cb : ℝ) * pb
              + (resid.cy : ℝ) * py + (resid.cz : ℝ) * pz := rfl
        have hLR : (Lq : ℝ) = (pd.eta : ℝ) + (posPartQ resid.cn : ℝ) * (1 / 32)
            + (posPartQ resid.ch : ℝ) * (1 / 8) + (posPartQ resid.cb : ℝ) * (1 / 32)
            + (posPartQ resid.cy : ℝ) * (1 / 96) + (posPartQ resid.cz : ℝ) * (3 / 64) := by
          simp only [Lq]; push_cast; ring
        linarith only [hstep1, hev, hLR, h1, h2, h3, h4, h5]
      have hbdR : l0 + l1 + l2 * (2 + (se : ℝ))
          + l3s * (6 + 9 * (se : ℝ) + (radiusC6 : ℝ) * (se : ℝ) * (pd.sqrtUb : ℝ))
          + (l3a + l3b) * (6 + 9 * (se : ℝ)) + (se : ℝ) * (Lq : ℝ) ≤ (val : ℝ) := by
        have hR : (((an.lam0 : ℚ) / (lamScale : ℚ) + (an.lam1 : ℚ) / (lamScale : ℚ)
            + ((an.lam2 : ℚ) / (lamScale : ℚ)) * (2 + se)
            + ((an.l3s : ℚ) / (lamScale : ℚ)) * (6 + 9 * se + radiusC6 * se * pd.sqrtUb)
            + ((an.l3a : ℚ) / (lamScale : ℚ) + (an.l3b : ℚ) / (lamScale : ℚ)) * (6 + 9 * se)
            + se * Lq : ℚ) : ℝ) ≤ (val : ℝ) := by exact_mod_cast hbd
        simpa only [l0, l1, l2, l3s, l3a, l3b, sL, Rat.cast_add, Rat.cast_mul, Rat.cast_div,
          Rat.cast_intCast, Rat.cast_ofNat] using hR
      have hC6_nn : 0 ≤ (radiusC6 : ℝ) := by norm_num [radiusC6]
      have hstep1' : l3s * (radiusC6 : ℝ) * ((se : ℝ) * √(se : ℝ))
          ≤ l3s * (radiusC6 : ℝ) * ((se : ℝ) * (pd.sqrtUb : ℝ)) := by
        have h1 : (se : ℝ) * √(se : ℝ) ≤ (se : ℝ) * (pd.sqrtUb : ℝ) :=
          mul_le_mul_of_nonneg_left hsqrt_le hseR_pos.le
        exact mul_le_mul_of_nonneg_left h1 (mul_nonneg hl3s_nn hC6_nn)
      have hobj_se : evalLin5 (sumDLin an) pn ph pb py pz
          + √(se : ℝ) * (l3a * Ba + l3b * Bb) ≤ (Lq : ℝ) := by
        have h1 : √(se : ℝ) * (l3a * Ba + l3b * Bb)
            ≤ √(se : ℝ) * evalLin5 (sumDJ an pd.alphaA pd.alphaB) pn ph pb py pz :=
          mul_le_mul_of_nonneg_left hDJ_ge (Real.sqrt_nonneg _)
        have h2 : √(se : ℝ) * evalLin5 (sumDJ an pd.alphaA pd.alphaB) pn ph pb py pz
            ≤ (pd.sqrtUb : ℝ) * evalLin5 (sumDJ an pd.alphaA pd.alphaB) pn ph pb py pz :=
          mul_le_mul_of_nonneg_right hsqrt_le hDJ_nn
        have h3 : evalLin5 obj pn ph pb py pz
            = evalLin5 (sumDLin an) pn ph pb py pz
              + (pd.sqrtUb : ℝ) * evalLin5 (sumDJ an pd.alphaA pd.alphaB) pn ph pb py pz := by
          simp only [obj, evalLin5_add, evalLin5_smul]
        linarith only [h1, h2, h3, hobj_le_L]
      have hobj_mul := mul_le_mul_of_nonneg_left hobj_se hseR_pos.le
      have hbd_alg : (l0 + l1 + 2 * l2 + 6 * (l3s + l3a + l3b))
            + A * (se : ℝ) + B * ((se : ℝ) * √(se : ℝ))
          = l0 + l1 + l2 * (2 + (se : ℝ)) + l3s * (6 + 9 * (se : ℝ))
            + (l3a + l3b) * (6 + 9 * (se : ℝ))
            + l3s * (radiusC6 : ℝ) * ((se : ℝ) * √(se : ℝ))
            + (se : ℝ) * (evalLin5 (sumDLin an) pn ph pb py pz
              + √(se : ℝ) * (l3a * Ba + l3b * Bb)) := by
        simp only [A, B]; ring
      have hlin_alg : l0 + l1 + l2 * (2 + (se : ℝ))
            + l3s * (6 + 9 * (se : ℝ) + (radiusC6 : ℝ) * (se : ℝ) * (pd.sqrtUb : ℝ))
            + (l3a + l3b) * (6 + 9 * (se : ℝ)) + (se : ℝ) * (Lq : ℝ)
          = l0 + l1 + l2 * (2 + (se : ℝ)) + l3s * (6 + 9 * (se : ℝ))
            + (l3a + l3b) * (6 + 9 * (se : ℝ))
            + l3s * (radiusC6 : ℝ) * ((se : ℝ) * (pd.sqrtUb : ℝ))
            + (se : ℝ) * (Lq : ℝ) := by ring
      linarith only [hstep1', hobj_mul, hbd_alg, hlin_alg, hbdR]

private lemma circular_s_eq {d : ℕ} {J : Fin d → Fin d → ℝ} {a b : MvPolynomial (Fin d) ℝ}
    (ha : Chaos3 a) (haa : ∫ x, eval x a ^ 2 ∂(stdGaussian d) = 1 / 2) (hc : Circular J a b) :
    ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) - 2
      = 32 * gramN (gramT J a b) + 8 * gramH (gramT J a b)
        + 32 * gramB (gramT J a b) + 96 * gramY (gramT J a b) := by
  have hE := gaussE_isGaussianExpectation d
  have haa' : gaussE d (a * a) = 1 / 2 := by
    rw [gaussE_apply, ← haa]
    exact integral_congr_ae (Filter.Eventually.of_forall fun x ↦ by simp only [map_mul]; ring)
  have h4 := hc.fourth_moment_contractions hE ha
  rw [haa'] at h4
  have heq : gaussE d (radU a b ^ 2) = ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) := by
    rw [gaussE_apply]; simp only [map_pow]
  linarith

/-- **Expectation soundness of a verified `AntiNode` on an `s`-interval `[sLo, sHi]`:**
if `checkAntiNode nodes smax an = true` and `checkSumEndpoint an.summary` passes at both `sLo`
and `sHi` against `val`, then `E[Ψ(an.sigma * √U)] ≤ val` whenever `s = E U² − 2 ∈ [sLo, sHi]`. -/
theorem antiNode_integral_le {d : ℕ} (a b : MvPolynomial (Fin d) ℝ) (ha : Chaos3 a)
    (haa : ∫ x, eval x a ^ 2 ∂(stdGaussian d) = 1 / 2) {J : Fin d → Fin d → ℝ}
    (hc : Circular J a b) {Ψ : ℝ → ℝ} {nodes : List (ℚ × ℚ)} {smax : ℚ}
    (hΨ : CapsHold Ψ nodes smax) (an : AntiNode)
    (hok : checkAntiNode nodes smax an = true)
    (sLo sHi val : ℚ) (hsLo0 : 0 ≤ sLo) (hsLoHi : sLo < sHi)
    (parLo : Option EndPar) (parHi : EndPar)
    (hEndLo : checkSumEndpoint an.summary sLo parLo val = true)
    (hEndHi : checkSumEndpoint an.summary sHi (some parHi) val = true)
    (hlo : (sLo : ℝ) ≤ ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) - 2)
    (hhi : ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) - 2 ≤ (sHi : ℝ))
    (hintΨ : Integrable (fun x ↦ Ψ ((an.sigma : ℝ) * √(eval x (radU a b)))) (stdGaussian d)) :
    ∫ x, Ψ ((an.sigma : ℝ) * √(eval x (radU a b))) ∂(stdGaussian d) ≤ (val : ℝ) := by
  obtain ⟨hmesh, hpt⟩ := checkAntiNode_sound hΨ hok
  have hsigns : 0 < an.mu5 ∧ 0 ≤ an.l3s ∧ 0 ≤ an.l3a ∧ 0 ≤ an.l3b := by
    unfold checkAntiNode at hok
    cases hks : an.knots with
    | nil => rw [hks] at hok; simp at hok
    | cons k0 ks =>
      rw [hks] at hok
      cases k0 with
      | succ _ => simp at hok
      | zero =>
        simp only [Bool.and_eq_true, decide_eq_true_eq] at hok
        exact ⟨hok.1.1.1.1.1.2, hok.1.1.1.1.2, hok.1.1.1.2, hok.1.1.2⟩
  obtain ⟨hm5_pos, hl3s, hl3a, hl3b⟩ := hsigns
  have hE := gaussE_isGaussianExpectation d
  have hb : Chaos3 b := hc.chaos3_right ha
  have hbb := hc.gaussian_sq_eq haa
  have hab := hc.gaussian_mul
  have toE : ∀ P Q : MvPolynomial (Fin d) ℝ,
      ∫ x, eval x P * eval x Q ∂(stdGaussian d) = gaussE d (P * Q) := fun P Q ↦ by
    rw [gaussE_apply]; simp only [map_mul]
  have haa' : gaussE d (a * a) = 1 / 2 := by rw [← toE, ← haa]; simp only [sq]
  have hbb' : gaussE d (b * b) = 1 / 2 := by rw [← toE, ← hbb]; simp only [sq]
  have hab' : gaussE d (a * b) = 0 := by rw [← toE, hab]
  set s := ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) - 2
  set t := gramT J a b
  have hs_gaussE : s = gaussE d (radU a b ^ 2) - 2 := by
    simp only [s, gaussE_apply, map_pow]
  have hs_eq : s = 32 * gramN t + 8 * gramH t + 32 * gramB t + 96 * gramY t :=
    circular_s_eq ha haa hc
  have hs_nonneg : 0 ≤ s := by
    rw [hs_eq]
    have := gramN_nonneg t; have := gramH_nonneg t
    have := gramB_nonneg t; have := gramY_nonneg t
    linarith
  have hU1_int : ∫ x, eval x (radU a b) ∂(stdGaussian d) = 1 := by
    have e : ∀ x, eval x (radU a b) = eval x a ^ 2 + eval x b ^ 2 := fun x ↦ by
      simp only [radU, map_add, map_mul, sq]
    simp only [e]
    rw [integral_add (eval_pow_integrable' a 2) (eval_pow_integrable' b 2), haa, hbb]; norm_num
  set vs := antiVs an
  set v1 := rowVals an.phi1
  set v2 := rowVals an.phi2
  set sl1 := antiSlope1 an
  set sl2 := antiSlope2 an
  set sL : ℝ := (lamScale : ℝ)
  set sM : ℝ := (muScale : ℝ)
  set l0 : ℝ := (an.lam0 : ℝ) / sL
  set l1 : ℝ := (an.lam1 : ℝ) / sL
  set l2 : ℝ := (an.lam2 : ℝ) / sL
  set l3s : ℝ := (an.l3s : ℝ) / sL
  set l3a : ℝ := (an.l3a : ℝ) / sL
  set l3b : ℝ := (an.l3b : ℝ) / sL
  set l3 : ℝ := ((an.l3s + an.l3a + an.l3b : Int) : ℝ) / sL
  set m1 : ℝ := (an.mu1 : ℝ) / sM
  set m2 : ℝ := (an.mu2 : ℝ) / sM
  set m3 : ℝ := (an.mu3 : ℝ) / sM
  set m4 : ℝ := (an.mu4 : ℝ) / sM
  set m5 : ℝ := (an.mu5 : ℝ) / sM
  set sig : ℝ := (an.sigmaAt : ℝ) / sM
  have hl3_eq : l3 = l3s + l3a + l3b := by simp only [l3, l3s, l3a, l3b]; push_cast; ring
  have hl3s_nn : 0 ≤ l3s := div_nonneg (by exact_mod_cast hl3s) (by norm_num [sL, lamScale])
  have hl3a_nn : 0 ≤ l3a := div_nonneg (by exact_mod_cast hl3a) (by norm_num [sL, lamScale])
  have hl3b_nn : 0 ≤ l3b := div_nonneg (by exact_mod_cast hl3b) (by norm_num [sL, lamScale])
  have hm5_nn : 0 ≤ m5 := div_nonneg (by exact_mod_cast hm5_pos.le) (by norm_num [sM, muScale])
  have i_poly : Integrable (fun x ↦ l0 + l1 * eval x (radU a b) + l2 * eval x (radU a b) ^ 2
      + l3 * eval x (radU a b) ^ 3) (stdGaussian d) :=
    (((integrable_const l0).add ((integrable_eval _).const_mul l1)).add
      ((eval_pow_integrable' _ 2).const_mul l2)).add ((eval_pow_integrable' _ 3).const_mul l3)
  have i_st1 : Integrable (fun x ↦ plPrim vs v1 sl1 (eval x (radU a b))
      - eval x (radC2 J a b) * plPhi vs v1 sl1 (eval x (radU a b))
      - radRho a b x * plY vs v1 sl1 (eval x (radU a b))) (stdGaussian d) :=
    ((integrable_plPrim a b vs v1 sl1 hmesh).sub (integrable_mul_plPhi (radC2 J a b) a b vs v1 sl1)).sub
      (integrable_radRho_mul_plY a b vs v1 sl1 hmesh)
  have i_st2 : Integrable (fun x ↦ plPrim vs v2 sl2 (eval x (radU a b))
      - (1 / 2 : ℝ) * eval x (radC1 J a b) * plPhi vs v2 sl2 (eval x (radU a b))
      - (1 / 2 : ℝ) * radRho a b x * plY vs v2 sl2 (eval x (radU a b))) (stdGaussian d) :=
    ((integrable_plPrim a b vs v2 sl2 hmesh).sub
      (((integrable_mul_plPhi (radC1 J a b) a b vs v2 sl2).const_mul (1 / 2)).congr
        (Filter.Eventually.of_forall fun x ↦ by ring))).sub
      (((integrable_radRho_mul_plY a b vs v2 sl2 hmesh).const_mul (1 / 2)).congr
        (Filter.Eventually.of_forall fun x ↦ by ring))
  have i_v1 : Integrable (fun x ↦ m1 * (eval x (radC2 J a b) - 1) ^ 2) (stdGaussian d) :=
    ((eval_pow_integrable' (radC2 J a b - 1) 2).congr
      (Filter.Eventually.of_forall fun x ↦ by simp)).const_mul m1
  have i_v2 : Integrable (fun x ↦ m2 * (eval x (radD J a b) - 1) ^ 2) (stdGaussian d) :=
    ((eval_pow_integrable' (radD J a b - 1) 2).congr
      (Filter.Eventually.of_forall fun x ↦ by simp)).const_mul m2
  have i_v3 : Integrable (fun x ↦ m3 * (eval x (radS a b) - 3) ^ 2) (stdGaussian d) :=
    ((eval_pow_integrable' (radS a b - 3) 2).congr
      (Filter.Eventually.of_forall fun x ↦ by simp)).const_mul m3
  have i_v4 : Integrable (fun x ↦ m4 * (eval x (radC1 J a b) - 2) ^ 2) (stdGaussian d) :=
    ((eval_pow_integrable' (radC1 J a b - 2) 2).congr
      (Filter.Eventually.of_forall fun x ↦ by simp)).const_mul m4
  have i_v5 : Integrable (fun x ↦ m5 * radRho a b x ^ 2) (stdGaussian d) :=
    (memLp_radRho a b).integrable_sq.const_mul m5
  have i_sig : Integrable (fun x ↦ sig * (eval x (radU a b) * radRho a b x)) (stdGaussian d) := by
    refine (((integrable_eval (radN a b)).const_mul (sig / 2)).congr
      (Filter.Eventually.of_forall fun x ↦ ?_))
    dsimp only; linear_combination -sig * radRho_mul_radU a b x
  have hmaj_eq : ∀ x, antiMaj an (eval x (radU a b)) (eval x (radC1 J a b))
        (eval x (radC2 J a b)) (radRho a b x)
      = (l0 + l1 * eval x (radU a b) + l2 * eval x (radU a b) ^ 2
          + l3 * eval x (radU a b) ^ 3)
        + (plPrim vs v1 sl1 (eval x (radU a b))
            - eval x (radC2 J a b) * plPhi vs v1 sl1 (eval x (radU a b))
            - radRho a b x * plY vs v1 sl1 (eval x (radU a b)))
        + (plPrim vs v2 sl2 (eval x (radU a b))
            - (1 / 2 : ℝ) * eval x (radC1 J a b) * plPhi vs v2 sl2 (eval x (radU a b))
            - (1 / 2 : ℝ) * radRho a b x * plY vs v2 sl2 (eval x (radU a b)))
        + m1 * (eval x (radC2 J a b) - 1) ^ 2
        + m2 * (eval x (radD J a b) - 1) ^ 2
        + m3 * (eval x (radS a b) - 3) ^ 2
        + m4 * (eval x (radC1 J a b) - 2) ^ 2
        + m5 * radRho a b x ^ 2
        + sig * (eval x (radU a b) * radRho a b x) := fun x ↦ by
    have hadd := congrArg (eval x) (radC1_add_radC2 hc.isCplx a b)
    have hsub := congrArg (eval x) (radC1_sub_radC2 hc.isCplx a b)
    simp only [map_add, map_sub] at hadd hsub
    unfold antiMaj; rw [← hadd, ← hsub]; ring
  have i_maj : Integrable (fun x ↦ antiMaj an (eval x (radU a b)) (eval x (radC1 J a b))
      (eval x (radC2 J a b)) (radRho a b x)) (stdGaussian d) :=
    (((((((i_poly.add i_st1).add i_st2).add i_v1).add i_v2).add i_v3).add i_v4).add
      i_v5).add i_sig |>.congr (Filter.Eventually.of_forall fun x ↦ (hmaj_eq x).symm)
  have hint_le : ∫ x, Ψ ((an.sigma : ℝ) * √(eval x (radU a b))) ∂(stdGaussian d)
      ≤ ∫ x, antiMaj an (eval x (radU a b)) (eval x (radC1 J a b))
          (eval x (radC2 J a b)) (radRho a b x) ∂(stdGaussian d) :=
    integral_mono hintΨ i_maj fun x ↦
      hpt _ _ _ _ (eval_radU_nonneg a b x) (eval_radC1_nonneg J a b x)
        (eval_radC2_nonneg J a b x) (radRho_sq_le_radC1_mul_radC2 hc.isCplx a b x)
  have hst1_0 := antiStein_I a b ha haa hc vs v1 sl1 hmesh
  have hst2_0 := antiStein_II a b ha haa hc vs v2 sl2 hmesh
  have hv1 := hc.gaussian_var_radC2 ha haa
  have hv2 := hc.gaussian_var_radD ha haa
  have hv3 := hc.gaussian_var_radS ha haa
  have hv4 := hc.gaussian_var_radC1 ha haa
  have hv5 := hc.gaussian_sq_radRho_le ha haa
  have hvr := hc.gaussian_mul_radU_radRho ha haa
  have hpoly_int : ∫ x, (l0 + l1 * eval x (radU a b) + l2 * eval x (radU a b) ^ 2
        + l3 * eval x (radU a b) ^ 3) ∂(stdGaussian d)
      = l0 + l1 + l2 * (2 + s) + l3 * gaussE d (radU a b ^ 3) := by
    have ip0 : Integrable (fun _ : Fin d → ℝ ↦ l0) (stdGaussian d) := integrable_const l0
    have ip1 : Integrable (fun x ↦ l1 * eval x (radU a b)) (stdGaussian d) :=
      (integrable_eval _).const_mul l1
    have ip2 : Integrable (fun x ↦ l2 * eval x (radU a b) ^ 2) (stdGaussian d) :=
      (eval_pow_integrable' _ 2).const_mul l2
    have ip3 : Integrable (fun x ↦ l3 * eval x (radU a b) ^ 3) (stdGaussian d) :=
      (eval_pow_integrable' _ 3).const_mul l3
    rw [integral_add (integrable_add_fn (integrable_add_fn ip0 ip1) ip2) ip3,
      integral_add (integrable_add_fn ip0 ip1) ip2, integral_add ip0 ip1,
      integral_const, integral_const_mul, integral_const_mul, integral_const_mul,
      Measure.real_def, measure_univ, ENNReal.toReal_one, one_smul, hU1_int,
      show ∫ x, eval x (radU a b) ^ 3 ∂(stdGaussian d) = gaussE d (radU a b ^ 3) by
        rw [gaussE_apply]; simp only [map_pow]]
    simp only [s]; ring
  have hmaj_int : ∫ x, antiMaj an (eval x (radU a b)) (eval x (radC1 J a b))
        (eval x (radC2 J a b)) (radRho a b x) ∂(stdGaussian d)
      ≤ l0 + l1 + l2 * (2 + s) + l3 * gaussE d (radU a b ^ 3)
        + evalLin5 (sumDLin an.summary) (gramN t) (gramH t) (gramB t) (gramY t) (gramZ t) := by
    rw [integral_congr_ae (Filter.Eventually.of_forall hmaj_eq)]
    have ia1 := integrable_add_fn i_poly i_st1
    have ia2 := integrable_add_fn ia1 i_st2
    have ia3 := integrable_add_fn ia2 i_v1
    have ia4 := integrable_add_fn ia3 i_v2
    have ia5 := integrable_add_fn ia4 i_v3
    have ia6 := integrable_add_fn ia5 i_v4
    have ia7 := integrable_add_fn ia6 i_v5
    rw [integral_add ia7 i_sig, integral_add ia6 i_v5, integral_add ia5 i_v4,
      integral_add ia4 i_v3, integral_add ia3 i_v2, integral_add ia2 i_v1,
      integral_add ia1 i_st2, integral_add i_poly i_st1,
      hpoly_int, hst1_0, hst2_0, integral_const_mul, integral_const_mul, integral_const_mul,
      integral_const_mul, integral_const_mul, integral_const_mul, hv1, hv2, hv3, hv4, hvr]
    have hDlin : evalLin5 (sumDLin an.summary) (gramN t) (gramH t) (gramB t) (gramY t) (gramZ t)
        = m1 * (16 * gramN t + 4 * gramH t)
          + m2 * (16 * gramN t + 20 * gramH t + 16 * gramB t)
          + m3 * (80 * gramN t + 20 * gramH t + 16 * gramB t + 96 * gramY t + 32 * gramZ t)
          + m4 * (32 * gramN t + 16 * gramH t + 16 * gramB t + 48 * gramY t + 16 * gramZ t)
          + m5 * (32 * gramB t + 24 * gramY t)
          + sig * (32 * gramB t + 48 * gramY t) := by
      simp only [evalLin5, sumDLin, AntiNode.summary, m1, m2, m3, m4, m5, sig, sM]; push_cast; ring
    rw [hDlin]
    linarith only [mul_le_mul_of_nonneg_left hv5 hm5_nn]
  have hT := hc.tensorFacts hE ha
  have h6s : gaussE d (radU a b ^ 3) ≤ 6 + 9 * s + (radiusC6 : ℝ) * (s * √s) := by
    have h := hc.gaussian_sixth ha haa hT
    have e3 : ∫ x, eval x (radU a b) ^ 3 ∂(stdGaussian d) = gaussE d (radU a b ^ 3) := by
      rw [gaussE_apply]; simp only [map_pow]
    have eC6 : LowerAnalytic.C6 = (radiusC6 : ℝ) := by norm_num [LowerAnalytic.C6, Lower.C6, radiusC6]
    rw [e3, eC6, rpow_three_halves hs_nonneg] at h
    have hms : 9 * ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) - 12 = 6 + 9 * s := by simp only [s]; ring
    rw [hms] at h; exact h
  have h6a := joint_sixth_inf ha haa' hc false
  have h6b := joint_sixth_inf ha haa' hc true
  simp only [Bool.false_eq_true, ↓reduceIte, ← hs_gaussE] at h6a h6b
  rcases hs_nonneg.eq_or_lt with hs0 | hs_pos
  · have hsLo_zero : sLo = 0 := by
      have : sLo ≤ 0 := by exact_mod_cast (by linarith only [hlo, hs0] : (sLo : ℝ) ≤ 0)
      exact le_antisymm this hsLo0
    have hnn := gramN_nonneg t; have hhn := gramH_nonneg t
    have hbn := gramB_nonneg t; have hyn := gramY_nonneg t
    have hn0 : gramN t = 0 := by linarith only [hs0, hs_eq, hnn, hhn, hbn, hyn]
    have hh0 : gramH t = 0 := by linarith only [hs0, hs_eq, hnn, hhn, hbn, hyn]
    have hb0 : gramB t = 0 := by linarith only [hs0, hs_eq, hnn, hhn, hbn, hyn]
    have hy0 : gramY t = 0 := by linarith only [hs0, hs_eq, hnn, hhn, hbn, hyn]
    have hz0 : gramZ t = 0 := by
      have hsq := gramZ_sq_le t; rw [hn0, hh0, mul_zero] at hsq
      exact sq_eq_zero_iff.1 (le_antisymm hsq (sq_nonneg _))
    have hDlin0 : evalLin5 (sumDLin an.summary) (gramN t) (gramH t) (gramB t) (gramY t) (gramZ t) = 0 := by
      simp [evalLin5, hn0, hh0, hb0, hy0, hz0]
    have hU3_le : gaussE d (radU a b ^ 3) ≤ 6 := by
      rw [← hs0, Real.sqrt_zero, mul_zero, mul_zero, mul_zero, add_zero, add_zero] at h6s; exact h6s
    rw [hsLo_zero] at hEndLo
    unfold checkSumEndpoint at hEndLo
    simp only [beq_self_eq_true, ↓reduceIte, decide_eq_true_eq] at hEndLo
    have hle : l0 + l1 + 2 * l2 + 6 * l3 ≤ (val : ℝ) := by
      have hR : (((an.lam0 : ℚ) / (lamScale : ℚ) + (an.lam1 : ℚ) / (lamScale : ℚ)
          + 2 * ((an.lam2 : ℚ) / (lamScale : ℚ))
          + 6 * ((an.l3s : ℚ) / (lamScale : ℚ) + (an.l3a : ℚ) / (lamScale : ℚ)
            + (an.l3b : ℚ) / (lamScale : ℚ)) : ℚ) : ℝ) ≤ (val : ℝ) := by exact_mod_cast hEndLo
      rw [hl3_eq]
      simpa only [l0, l1, l2, l3s, l3a, l3b, sL, Rat.cast_add, Rat.cast_mul, Rat.cast_div,
        Rat.cast_intCast, Rat.cast_ofNat] using hR
    have hl3_nn : 0 ≤ l3 := by rw [hl3_eq]; linarith only [hl3s_nn, hl3a_nn, hl3b_nn]
    rw [← hs0, add_zero, hDlin0, add_zero] at hmaj_int
    linarith only [hint_le, hmaj_int, mul_le_mul_of_nonneg_left hU3_le hl3_nn, hle]
  · set pn := gramN t / s; set ph := gramH t / s; set pb := gramB t / s
    set py := gramY t / s; set pz := gramZ t / s
    set s0p := jointS0 t / s; set h0p := jointH0 t / s
    set Ba := 198 * h0p + 300 * √(s0p * h0p)
    set Bb := (11781 / 32) * h0p + 135 * √(s0p * h0p)
    have hDlin_scale : evalLin5 (sumDLin an.summary) (gramN t) (gramH t) (gramB t) (gramY t) (gramZ t)
        = evalLin5 (sumDLin an.summary) pn ph pb py pz * s := by
      simp only [evalLin5, pn, ph, pb, py, pz]; field_simp [hs_pos.ne']
    have h6a_s : gaussE d (radU a b ^ 3) ≤ 6 + 9 * s + Ba * (s * √s) := by
      refine h6a.trans_eq ?_
      have hs0_nn : 0 ≤ jointS0 t := hc.jointS0_nonneg
      have hh0_nn : 0 ≤ jointH0 t := hc.jointH0_nonneg
      have hsq : √(jointS0 t * jointH0 t) = s * √(s0p * h0p) := by
        simp only [s0p, h0p]
        rw [div_mul_div_comm, Real.sqrt_div (mul_nonneg hs0_nn hh0_nn),
          show s * s = s ^ 2 by ring, Real.sqrt_sq hs_pos.le]
        field_simp [hs_pos.ne']
      have hh0_eq : jointH0 t = s * h0p := by simp only [h0p]; field_simp [hs_pos.ne']
      rw [hsq, hh0_eq]; simp only [Ba]; ring
    have h6b_s : gaussE d (radU a b ^ 3) ≤ 6 + 9 * s + Bb * (s * √s) := by
      refine h6b.trans_eq ?_
      have hs0_nn : 0 ≤ jointS0 t := hc.jointS0_nonneg
      have hh0_nn : 0 ≤ jointH0 t := hc.jointH0_nonneg
      have hsq : √(jointS0 t * jointH0 t) = s * √(s0p * h0p) := by
        simp only [s0p, h0p]
        rw [div_mul_div_comm, Real.sqrt_div (mul_nonneg hs0_nn hh0_nn),
          show s * s = s ^ 2 by ring, Real.sqrt_sq hs_pos.le]
        field_simp [hs_pos.ne']
      have hh0_eq : jointH0 t = s * h0p := by simp only [h0p]; field_simp [hs_pos.ne']
      rw [hsq, hh0_eq]; simp only [Bb]; ring
    set Acoef := l2 + 9 * (l3s + l3a + l3b) + evalLin5 (sumDLin an.summary) pn ph pb py pz
    set Bcoef := l3s * (radiusC6 : ℝ) + l3a * Ba + l3b * Bb
    have hBcoef_nn : 0 ≤ Bcoef := by
      have hC6 : 0 ≤ (radiusC6 : ℝ) := by norm_num [radiusC6]
      have hh0p : 0 ≤ h0p := div_nonneg hc.jointH0_nonneg hs_pos.le
      have hBa : 0 ≤ Ba :=
        add_nonneg (mul_nonneg (by norm_num) hh0p) (mul_nonneg (by norm_num) (Real.sqrt_nonneg _))
      have hBb : 0 ≤ Bb :=
        add_nonneg (mul_nonneg (by norm_num) hh0p) (mul_nonneg (by norm_num) (Real.sqrt_nonneg _))
      exact add_nonneg (add_nonneg (mul_nonneg hl3s_nn hC6) (mul_nonneg hl3a_nn hBa))
        (mul_nonneg hl3b_nn hBb)
    have hcubic : ∫ x, Ψ ((an.sigma : ℝ) * √(eval x (radU a b))) ∂(stdGaussian d)
        ≤ (l0 + l1 + 2 * l2 + 6 * (l3s + l3a + l3b)) + (Acoef * √s ^ 2 + Bcoef * √s ^ 3) := by
      have h1 : √s ^ 2 = s := Real.sq_sqrt hs_pos.le
      have h2 : √s ^ 3 = s * √s := by rw [show √s ^ 3 = √s ^ 2 * √s by ring, h1]
      rw [h1, h2]
      rw [hl3_eq, hDlin_scale] at hmaj_int
      have hm1' := mul_le_mul_of_nonneg_left h6s hl3s_nn
      have hm2' := mul_le_mul_of_nonneg_left h6a_s hl3a_nn
      have hm3' := mul_le_mul_of_nonneg_left h6b_s hl3b_nn
      have halg : l0 + l1 + l2 * (2 + s)
            + (l3s * (6 + 9 * s + (radiusC6 : ℝ) * (s * √s))
              + l3a * (6 + 9 * s + Ba * (s * √s))
              + l3b * (6 + 9 * s + Bb * (s * √s)))
            + evalLin5 (sumDLin an.summary) pn ph pb py pz * s
          = (l0 + l1 + 2 * l2 + 6 * (l3s + l3a + l3b))
            + (Acoef * s + Bcoef * (s * √s)) := by simp only [Acoef, Bcoef]; ring
      have hsplit : (l3s + l3a + l3b) * gaussE d (radU a b ^ 3)
          = l3s * gaussE d (radU a b ^ 3) + l3a * gaussE d (radU a b ^ 3)
            + l3b * gaussE d (radU a b ^ 3) := by ring
      linarith only [hint_le, hmaj_int, hm1', hm2', hm3', halg, hsplit]
    have hsLo0R : (0 : ℝ) ≤ (sLo : ℝ) := by exact_mod_cast hsLo0
    have hsHi0R : (0 : ℝ) ≤ (sHi : ℝ) := by
      have : (sLo : ℝ) < (sHi : ℝ) := by exact_mod_cast hsLoHi
      linarith only [hsLo0R, this]
    have hEnd := cubic_endpoint_le Acoef Bcoef (√s) (√(sLo : ℝ)) (√(sHi : ℝ))
      hBcoef_nn (Real.sqrt_nonneg _) (Real.sqrt_le_sqrt hlo) (Real.sqrt_le_sqrt hhi)
    have hElo := checkSumEndpoint_sound hc an.summary hl3s hl3a hl3b hs_pos hs_eq sLo parLo val hsLo0 hEndLo
    have hEhi := checkSumEndpoint_sound hc an.summary hl3s hl3a hl3b hs_pos hs_eq sHi (some parHi) val
      (le_of_lt (lt_of_le_of_lt hsLo0 hsLoHi)) hEndHi
    change (l0 + l1 + 2 * l2 + 6 * (l3s + l3a + l3b))
        + Acoef * (sLo : ℝ) + Bcoef * ((sLo : ℝ) * √(sLo : ℝ)) ≤ (val : ℝ) at hElo
    change (l0 + l1 + 2 * l2 + 6 * (l3s + l3a + l3b))
        + Acoef * (sHi : ℝ) + Bcoef * ((sHi : ℝ) * √(sHi : ℝ)) ≤ (val : ℝ) at hEhi
    have hsqLo : √(sLo : ℝ) ^ 2 = (sLo : ℝ) := Real.sq_sqrt hsLo0R
    have hcuLo : √(sLo : ℝ) ^ 3 = (sLo : ℝ) * √(sLo : ℝ) := by
      rw [show √(sLo : ℝ) ^ 3 = √(sLo : ℝ) ^ 2 * √(sLo : ℝ) by ring, hsqLo]
    have hsqHi : √(sHi : ℝ) ^ 2 = (sHi : ℝ) := Real.sq_sqrt hsHi0R
    have hcuHi : √(sHi : ℝ) ^ 3 = (sHi : ℝ) * √(sHi : ℝ) := by
      rw [show √(sHi : ℝ) ^ 3 = √(sHi : ℝ) ^ 2 * √(sHi : ℝ) by ring, hsqHi]
    rw [hsqLo, hcuLo, hsqHi, hcuHi] at hEnd
    have hmax : max (Acoef * (sLo : ℝ) + Bcoef * ((sLo : ℝ) * √(sLo : ℝ)))
        (Acoef * (sHi : ℝ) + Bcoef * ((sHi : ℝ) * √(sHi : ℝ)))
        ≤ (val : ℝ) - (l0 + l1 + 2 * l2 + 6 * (l3s + l3a + l3b)) :=
      max_le (by linarith only [hElo]) (by linarith only [hEhi])
    linarith only [hcubic, hEnd, hmax]

/-! ### Polynomial majorant soundness (for `.quad` and `.moment` nodes) -/

private lemma ratListDen_pos : ∀ (p : List ℚ), 0 < ratListDen p
  | [] => by simp [ratListDen]
  | q :: rest => Nat.lcm_pos q.den_pos (ratListDen_pos rest)

private lemma ratListDen_dvd : ∀ (p : List ℚ) (q : ℚ), q ∈ p → q.den ∣ ratListDen p
  | [], _, hm => by cases hm
  | a :: rest, q, hm => by
    rcases List.mem_cons.1 hm with rfl | hmr
    · exact Nat.dvd_lcm_left _ _
    · exact dvd_trans (ratListDen_dvd rest q hmr) (Nat.dvd_lcm_right _ _)

private lemma evalInt_ratList_eq (coeffs : List ℚ) (r : ℝ) :
    evalInt (coeffs.map fun q ↦ (q * (ratListDen coeffs : ℚ)).num) r
      = (ratListDen coeffs : ℝ) * evalL (coeffs.map ((↑) : ℚ → ℝ)) r := by
  set D := ratListDen coeffs
  suffices ∀ (p : List ℚ), (∀ q ∈ p, q.den ∣ D) →
      evalInt (p.map fun q ↦ (q * (D : ℚ)).num) r = (D : ℝ) * evalL (p.map ((↑) : ℚ → ℝ)) r from
    this coeffs (fun q hq ↦ ratListDen_dvd coeffs q hq)
  intro p hp
  induction p with
  | nil => simp [evalL]
  | cons a rest ih =>
    simp only [List.map_cons, evalInt_cons, evalL]
    rw [ih (fun q hq ↦ hp q (List.mem_cons_of_mem _ hq)),
      rat_mul_lcm_cast a D (hp a (List.mem_cons_self ..))]
    ring

private lemma checkPolyMajAux_sound {Ψ : ℝ → ℝ} {σ : ℚ} {d Dp : ℕ} {Pint : List Int}
    (hDp : 0 < Dp) :
    ∀ (lps : List LinPiece), LinPiecesValid Ψ σ lps →
      checkPolyMajAux d Dp Pint lps = true →
      ∀ lp ∈ lps, ∀ r : ℝ, (lp.lo : ℝ) ≤ r → (∀ hi, lp.hi? = some hi → r ≤ (hi : ℝ)) →
        (Dp : ℝ) * Ψ ((σ : ℝ) * r) ≤ evalInt Pint r
  | [], _, _, _, hlp, _, _, _ => by cases hlp
  | lp :: rest, hval, hok, lp', hlp', r, hlo, hhi => by
    simp only [checkPolyMajAux, Bool.and_eq_true] at hok
    rcases List.mem_cons.1 hlp' with rfl | hrest
    · set qDen : ℕ := Nat.lcm lp'.alpha.den lp'.beta.den
      have hqPos : 0 < qDen := Nat.lcm_pos lp'.alpha.den_pos lp'.beta.den_pos
      have hqR : (0 : ℝ) < (qDen : ℝ) := by exact_mod_cast hqPos
      have hpAl : (((lp'.alpha * (qDen : ℚ)).num : Int) : ℝ) = (lp'.alpha : ℝ) * (qDen : ℝ) :=
        rat_mul_lcm_cast lp'.alpha qDen (Nat.dvd_lcm_left _ _)
      have hpBe : (((lp'.beta * (qDen : ℚ)).num : Int) : ℝ) = (lp'.beta : ℝ) * (qDen : ℝ) :=
        rat_mul_lcm_cast lp'.beta qDen (Nat.dvd_lcm_right _ _)
      have hpoly : 0 ≤ evalInt (pSub (pScale (qDen : Int) Pint)
          [(lp'.alpha * (qDen : ℚ)).num * (Dp : Int), (lp'.beta * (qDen : ℚ)).num * (Dp : Int)]) r := by
        cases hh : lp'.hi? with
        | none =>
          rw [hh] at hok; exact rayRatOK_sound hok.1 hlo
        | some hi =>
          rw [hh] at hok; exact segRatOK_sound hok.1 hlo (hhi hi hh)
      simp only [evalInt_sub, evalInt_scale, evalInt_cons, evalInt_nil, mul_zero, add_zero,
        Int.cast_mul, Int.cast_natCast, hpAl, hpBe] at hpoly
      have hΨle := hval lp' (List.mem_cons_self ..) r hlo hhi
      have hDpnn : (0 : ℝ) ≤ (Dp : ℝ) := by exact_mod_cast hDp.le
      have hdiff : 0 ≤ (qDen : ℝ) * (evalInt Pint r - (Dp : ℝ) * ((lp'.alpha : ℝ) + (lp'.beta : ℝ) * r)) := by
        linarith only [hpoly]
      have hge := nonneg_of_mul_nonneg_right hdiff hqR
      nlinarith only [hge, hΨle, hDpnn]
    · exact checkPolyMajAux_sound hDp rest (fun x hx ↦ hval x (List.mem_cons_of_mem _ hx)) hok.2
        lp' hrest r hlo hhi

private lemma mkLinPieces_cover {σ smax : ℚ} (hσ : 0 < σ) :
    ∀ (nodes : List (ℚ × ℚ)), nodesStrictOK nodes = true →
      ∀ r : ℝ, ((nodes.headD (0, 0)).1 / σ : ℚ) ≤ r →
        ∃ lp ∈ mkLinPieces σ smax nodes, (lp.lo : ℝ) ≤ r ∧ ∀ hi, lp.hi? = some hi → r ≤ (hi : ℝ)
  | [], hst, _, _ => by simp [nodesStrictOK] at hst
  | [(x, y)], _, r, hr => by
    refine ⟨⟨x / σ, none, y - smax * x, smax * σ⟩, by simp [mkLinPieces], by simpa using hr,
      fun _ h ↦ by cases h⟩
  | (x0, y0) :: (x1, y1) :: rest, hst, r, hr => by
    simp only [nodesStrictOK, Bool.and_eq_true, decide_eq_true_eq] at hst
    by_cases hle : r ≤ ((x1 / σ : ℚ) : ℝ)
    · refine ⟨⟨x0 / σ, some (x1 / σ), y0 - (y1 - y0) / (x1 - x0) * x0,
          (y1 - y0) / (x1 - x0) * σ⟩, by simp [mkLinPieces], by simpa using hr,
        fun hi h ↦ by cases h; exact hle⟩
    · obtain ⟨lp, hlp, hlo, hhi⟩ := mkLinPieces_cover hσ ((x1, y1) :: rest) hst.2 r
        (le_of_lt (not_le.1 hle))
      exact ⟨lp, by simp only [mkLinPieces, List.mem_cons]; exact Or.inr hlp, hlo, hhi⟩

theorem checkPolyMajorant_sound {Ψ : ℝ → ℝ} {nodes : List (ℚ × ℚ)} {smax σ : ℚ}
    {coeffs : List ℚ} (hΨ : CapsHold Ψ nodes smax)
    (hok : checkPolyMajorant σ nodes smax coeffs = true) {r : ℝ} (hr : 0 ≤ r) :
    Ψ ((σ : ℝ) * r) ≤ evalL (coeffs.map ((↑) : ℚ → ℝ)) r := by
  simp only [checkPolyMajorant, Bool.and_eq_true, decide_eq_true_eq] at hok
  obtain ⟨⟨hσ, hnodesOK⟩, haux⟩ := hok
  have hst : nodesStrictOK nodes = true := by
    cases nodes with
    | nil => simp [nodesOK] at hnodesOK
    | cons m rest =>
      cases m with
      | mk x y =>
        by_cases hx : x = 0
        · subst hx; exact hnodesOK
        · simp [nodesOK, hx] at hnodesOK
  have hnn : ∀ m ∈ nodes, 0 ≤ m.1 := by
    cases nodes with
    | nil => simp [nodesOK] at hnodesOK
    | cons m rest =>
      cases m with
      | mk x y =>
        by_cases hx : x = 0
        · subst hx
          exact nodesStrictOK_nonneg ((0, y) :: rest) 0 le_rfl hst
            (fun _ h ↦ by cases h; exact le_rfl)
        · simp [nodesOK, hx] at hnodesOK
  have hhd0 : (nodes.headD (0, 0)).1 = 0 := by
    cases nodes with
    | nil => simp [nodesOK] at hnodesOK
    | cons m rest =>
      cases m with
      | mk x y =>
        by_cases hx : x = 0
        · subst hx; simp
        · simp [nodesOK, hx] at hnodesOK
  have hlps : LinPiecesValid Ψ σ (mkLinPieces σ smax nodes) :=
    mkLinPieces_valid hσ nodes hst hnn hΨ
  obtain ⟨lp, hlp, hlo, hhi⟩ := mkLinPieces_cover hσ nodes hst r (by rw [hhd0]; simpa using hr)
  have hDp_pos : 0 < ratListDen coeffs := ratListDen_pos coeffs
  have hDpR : (0 : ℝ) < (ratListDen coeffs : ℝ) := by exact_mod_cast hDp_pos
  have hge := checkPolyMajAux_sound hDp_pos _ hlps haux lp hlp r hlo hhi
  rw [evalInt_ratList_eq] at hge
  exact le_of_mul_le_mul_left hge hDpR

/-! ### Section 5: Row assembly (`CircularRowBound`) -/

/-- A law-layer bound for a circular cubic `q = a + i b` (`|q|² = radU a b`) up to
`σ ≤ r.delta * (93 / 100)`. -/
def CircularRowBound (r : Row) (cap : ℚ) : Prop :=
  ∀ {d : ℕ} (a b : MvPolynomial (Fin d) ℝ), Chaos3 a →
    (∫ x, eval x a ^ 2 ∂(stdGaussian d) = 1 / 2) →
    ∀ {J : Fin d → Fin d → ℝ}, Circular J a b →
    ∀ (Ψ : ℝ → ℝ) (σ : ℝ),
    CapsHold Ψ r.nodeList r.smax → 0 ≤ σ → σ ≤ (r.delta : ℝ) * (93 / 100 : ℝ) →
    (∀ σ' : ℝ, 0 ≤ σ' → Integrable (fun x ↦ Ψ (σ' * √(eval x (radU a b)))) (stdGaussian d)) →
    ∫ x, Ψ (σ * √(eval x (radU a b))) ∂(stdGaussian d) - (r.kappa : ℝ) * σ ^ 2 ≤ (cap : ℝ)

private lemma chordMaxQ_eq (v0 v1 D s0 s1 : ℚ) :
    chordMaxQ v0 v1 D s0 s1 = chordMax v0 v1 D s0 s1 := rfl

/-- The affine expectation chord before taking the maximum over the residual scale. -/
theorem integral_le_scale_chord {d : ℕ} {Ψ : ℝ → ℝ} (hconv : ConvexOn ℝ (Set.Ici 0) Ψ)
    (U : (Fin d → ℝ) → ℝ) {s0 s1 v0 v1 : ℚ}
    (hs0 : 0 ≤ s0) (hlt : s0 < s1)
    (hI0 : Integrable (fun x ↦ Ψ ((s0 : ℝ) * √(U x))) (stdGaussian d) →
      ∫ x, Ψ ((s0 : ℝ) * √(U x)) ∂(stdGaussian d) ≤ (v0 : ℝ))
    (hI1 : Integrable (fun x ↦ Ψ ((s1 : ℝ) * √(U x))) (stdGaussian d) →
      ∫ x, Ψ ((s1 : ℝ) * √(U x)) ∂(stdGaussian d) ≤ (v1 : ℝ))
    (hint0 : Integrable (fun x ↦ Ψ ((s0 : ℝ) * √(U x))) (stdGaussian d))
    (hint1 : Integrable (fun x ↦ Ψ ((s1 : ℝ) * √(U x))) (stdGaussian d))
    {σ : ℝ} (h1 : (s0 : ℝ) ≤ σ) (h2 : σ ≤ (s1 : ℝ))
    (hintσ : Integrable (fun x ↦ Ψ (σ * √(U x))) (stdGaussian d)) :
    ∫ x, Ψ (σ * √(U x)) ∂(stdGaussian d) ≤
      ((s1 : ℝ)-σ)/(s1-s0)*v0 + (σ-s0)/(s1-s0)*v1 := by
  have hd : (0 : ℝ) < (s1 : ℝ) - (s0 : ℝ) := sub_pos.2 (by exact_mod_cast hlt)
  set w0 : ℝ := ((s1 : ℝ) - σ) / ((s1 : ℝ) - (s0 : ℝ))
  set w1 : ℝ := (σ - (s0 : ℝ)) / ((s1 : ℝ) - (s0 : ℝ))
  have hw0 : 0 ≤ w0 := div_nonneg (sub_nonneg.2 h2) hd.le
  have hw1 : 0 ≤ w1 := div_nonneg (sub_nonneg.2 h1) hd.le
  have hwsum : w0 + w1 = 1 := by simp only [w0, w1]; field_simp [hd.ne']; ring
  have hpt : ∀ x, Ψ (σ * √(U x)) ≤ w0 * Ψ ((s0 : ℝ) * √(U x)) + w1 * Ψ ((s1 : ℝ) * √(U x)) := fun x ↦ by
    have h0 : 0 ≤ (s0 : ℝ) * √(U x) := mul_nonneg (by exact_mod_cast hs0) (Real.sqrt_nonneg _)
    have h1' : 0 ≤ (s1 : ℝ) * √(U x) := mul_nonneg (by exact_mod_cast (hs0.trans hlt.le)) (Real.sqrt_nonneg _)
    have hcv := hconv.2 (Set.mem_Ici.2 h0) (Set.mem_Ici.2 h1') hw0 hw1 hwsum
    simp only [smul_eq_mul] at hcv
    have harg : w0 * ((s0 : ℝ) * √(U x)) + w1 * ((s1 : ℝ) * √(U x)) = σ * √(U x) := by
      simp only [w0, w1]; field_simp [hd.ne']; ring
    rwa [harg] at hcv
  have hint_rhs : Integrable (fun x ↦ w0 * Ψ ((s0 : ℝ) * √(U x)) + w1 * Ψ ((s1 : ℝ) * √(U x)))
      (stdGaussian d) := (hint0.const_mul w0).add (hint1.const_mul w1)
  have hmono := integral_mono hintσ hint_rhs hpt
  rw [integral_add (hint0.const_mul w0) (hint1.const_mul w1), integral_const_mul, integral_const_mul] at hmono
  have hv0 := mul_le_mul_of_nonneg_left (hI0 hint0) hw0
  have hv1 := mul_le_mul_of_nonneg_left (hI1 hint1) hw1
  exact hmono.trans (add_le_add hv0 hv1)

private lemma integral_convex_chord {d : ℕ} {Ψ : ℝ → ℝ} (hconv : ConvexOn ℝ (Set.Ici 0) Ψ)
    (U : (Fin d → ℝ) → ℝ) (_hU : ∀ x, 0 ≤ U x) {s0 s1 v0 v1 kap cap : ℚ}
    (hs0 : 0 ≤ s0) (hlt : s0 < s1)
    (hI0 : Integrable (fun x ↦ Ψ ((s0 : ℝ) * √(U x))) (stdGaussian d) →
      ∫ x, Ψ ((s0 : ℝ) * √(U x)) ∂(stdGaussian d) ≤ (v0 : ℝ))
    (hI1 : Integrable (fun x ↦ Ψ ((s1 : ℝ) * √(U x))) (stdGaussian d) →
      ∫ x, Ψ ((s1 : ℝ) * √(U x)) ∂(stdGaussian d) ≤ (v1 : ℝ))
    (hint0 : Integrable (fun x ↦ Ψ ((s0 : ℝ) * √(U x))) (stdGaussian d))
    (hint1 : Integrable (fun x ↦ Ψ ((s1 : ℝ) * √(U x))) (stdGaussian d))
    (hch : chordMaxQ v0 v1 kap s0 s1 ≤ cap)
    {σ : ℝ} (h1 : (s0 : ℝ) ≤ σ) (h2 : σ ≤ (s1 : ℝ))
    (hintσ : Integrable (fun x ↦ Ψ (σ * √(U x))) (stdGaussian d)) :
    ∫ x, Ψ (σ * √(U x)) ∂(stdGaussian d) - (kap : ℝ) * σ ^ 2 ≤ (cap : ℝ) := by
  have h := integral_le_scale_chord hconv U hs0 hlt hI0 hI1 hint0 hint1 h1 h2 hintσ
  have hcm := chord_le_chordMax v0 v1 kap s0 s1 hlt σ h1 h2
  have hcapR : ((chordMax v0 v1 kap s0 s1 : ℚ) : ℝ) ≤ (cap : ℝ) := by
    rw [← chordMaxQ_eq]; exact_mod_cast hch
  linarith only [h, hcm, hcapR]

private lemma sigmaNode_integral_le {d : ℕ} (a b : MvPolynomial (Fin d) ℝ) (ha : Chaos3 a)
    (haa : ∫ x, eval x a ^ 2 ∂(stdGaussian d) = 1 / 2) {J : Fin d → Fin d → ℝ}
    (hc : Circular J a b) {Ψ : ℝ → ℝ} {nodes : List (ℚ × ℚ)} {smax : ℚ}
    (hΨ : CapsHold Ψ nodes smax) (hnodes : nodesOK nodes = true)
    (quadBank : List QuadNode) (hquad : quadBank.all (checkQuadNode nodes smax) = true)
    (bank : List AntiNode) (hbank : bank.all (checkAntiNode nodes smax) = true)
    (sLo sHi : ℚ) (hsLo0 : 0 ≤ sLo) (hsLoHi : sLo < sHi)
    (hlo : (sLo : ℝ) ≤ ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) - 2)
    (hhi : ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) - 2 ≤ (sHi : ℝ))
    (sn : RowSigmaNode)
    (hok : checkSigmaNode nodes smax sLo sHi quadBank (bank.map AntiNode.summary) sn = true)
    (hint : Integrable (fun x ↦ Ψ ((sn.sigma : ℝ) * √(eval x (radU a b)))) (stdGaussian d)) :
    ∫ x, Ψ ((sn.sigma : ℝ) * √(eval x (radU a b))) ∂(stdGaussian d)
      ≤ (sn.val (nodes.headD (0, 0)).2 sLo sHi : ℝ) := by
  have hb : Chaos3 b := hc.chaos3_right ha
  have hbb := hc.gaussian_sq_eq haa
  have hU1 : ∫ x, eval x (radU a b) ∂(stdGaussian d) = 1 := by
    have e : ∀ x, eval x (radU a b) = eval x a ^ 2 + eval x b ^ 2 := fun x ↦ by
      simp only [radU, map_add, map_mul, sq]
    simp only [e]
    rw [integral_add (eval_pow_integrable' a 2) (eval_pow_integrable' b 2), haa, hbb]; norm_num
  have hrad93 : ∫ x, √(eval x (radU a b)) ∂(stdGaussian d) ≤ (93 / 100 : ℝ) :=
    first_moment_le_93 a b ha haa hc
  have i_sqrt : Integrable (fun x ↦ √(eval x (radU a b))) (stdGaussian d) := by
    refine ((integrable_const (1 : ℝ)).add (integrable_eval (radU a b))).mono'
      (Real.continuous_sqrt.comp_aestronglyMeasurable (integrable_eval (radU a b)).aestronglyMeasurable)
      (Filter.Eventually.of_forall fun x ↦ ?_)
    show ‖√(eval x (radU a b))‖ ≤ 1 + eval x (radU a b)
    have hnn := eval_radU_nonneg a b x
    rw [Real.norm_eq_abs, abs_of_nonneg (Real.sqrt_nonneg _), Real.sqrt_le_left (by linarith)]
    nlinarith
  cases sn with
  | zero =>
    simp only [RowSigmaNode.sigma, RowSigmaNode.val, Rat.cast_zero, zero_mul]
    rw [integral_const, Measure.real_def, measure_univ, ENNReal.toReal_one, one_smul]
    cases nodes with
    | nil => simp [nodesOK] at hnodes
    | cons m rest =>
      cases m with
      | mk x y =>
        by_cases hx : x = 0
        · subst hx; simpa using hΨ.caps (0, y) (List.mem_cons_self ..)
        · simp [nodesOK, hx] at hnodes
  | quad idx σ val =>
    simp only [checkSigmaNode] at hok
    cases hget : quadBank[idx]? with
    | none => rw [hget] at hok; simp at hok
    | some q =>
      rw [hget] at hok
      simp only [Bool.and_eq_true, beq_iff_eq, decide_eq_true_eq] at hok
      obtain ⟨hσeq, hvalle⟩ := hok
      have hqmem : q ∈ quadBank := List.mem_of_getElem? hget
      have hqok := List.all_eq_true.1 hquad q hqmem
      simp only [checkQuadNode, Bool.and_eq_true, decide_eq_true_eq] at hqok
      have hpt : ∀ x, Ψ ((σ : ℝ) * √(eval x (radU a b)))
          ≤ (q.a0 : ℝ) + (q.a1 : ℝ) * √(eval x (radU a b)) + (q.a2 : ℝ) * eval x (radU a b) := fun x ↦ by
        have hmaj := checkPolyMajorant_sound hΨ hqok.2 (Real.sqrt_nonneg (eval x (radU a b)))
        rw [hσeq] at hmaj
        refine hmaj.trans_eq ?_
        simp only [List.map_cons, List.map_nil, evalL, mul_zero, add_zero]
        have hsq : √(eval x (radU a b)) * √(eval x (radU a b)) = eval x (radU a b) :=
          Real.mul_self_sqrt (eval_radU_nonneg a b x)
        calc (q.a0 : ℝ) + √(eval x (radU a b)) * ((q.a1 : ℝ) + √(eval x (radU a b)) * (q.a2 : ℝ))
            = (q.a0 : ℝ) + (q.a1 : ℝ) * √(eval x (radU a b))
              + (q.a2 : ℝ) * (√(eval x (radU a b)) * √(eval x (radU a b))) := by ring
          _ = _ := by rw [hsq]
      have h1 : Integrable (fun _ : Fin d → ℝ ↦ (q.a0 : ℝ)) (stdGaussian d) := integrable_const _
      have h2 : Integrable (fun x ↦ (q.a1 : ℝ) * √(eval x (radU a b))) (stdGaussian d) := i_sqrt.const_mul _
      have h3 : Integrable (fun x ↦ (q.a2 : ℝ) * eval x (radU a b)) (stdGaussian d) :=
        (integrable_eval (radU a b)).const_mul _
      have h12 : Integrable (fun x ↦ (q.a0 : ℝ) + (q.a1 : ℝ) * √(eval x (radU a b))) (stdGaussian d) := h1.add h2
      have irhs : Integrable (fun x ↦ (q.a0 : ℝ) + (q.a1 : ℝ) * √(eval x (radU a b))
          + (q.a2 : ℝ) * eval x (radU a b)) (stdGaussian d) := h12.add h3
      have hmono := integral_mono hint irhs hpt
      rw [integral_add h12 h3, integral_add h1 h2, integral_const, integral_const_mul,
        integral_const_mul, Measure.real_def, measure_univ, ENNReal.toReal_one, one_smul, hU1] at hmono
      have ha1 : (0 : ℝ) ≤ (q.a1 : ℝ) := by exact_mod_cast hqok.1
      have hqval : (q.val : ℝ) ≤ (val : ℝ) := by exact_mod_cast hvalle
      simp only [QuadNode.val, Rat.cast_add, Rat.cast_mul, Rat.cast_div, Rat.cast_ofNat] at hqval
      simp only [RowSigmaNode.val]
      nlinarith only [hmono, hrad93, ha1, hqval]
  | moment σ a0 a1 a2 a4 a6 sbLo sbHi =>
    simp only [checkSigmaNode, Bool.and_eq_true, decide_eq_true_eq] at hok
    obtain ⟨⟨⟨⟨⟨⟨ha1, ha6⟩, hsbLo0⟩, hsbLo2⟩, hsbHi0⟩, hsbHi2⟩, hmajOK⟩ := hok
    have hpt : ∀ x, Ψ ((σ : ℝ) * √(eval x (radU a b)))
        ≤ (a0 : ℝ) + (a1 : ℝ) * √(eval x (radU a b)) + (a2 : ℝ) * eval x (radU a b)
          + (a4 : ℝ) * eval x (radU a b) ^ 2 + (a6 : ℝ) * eval x (radU a b) ^ 3 := fun x ↦ by
      have hmaj := checkPolyMajorant_sound hΨ hmajOK (Real.sqrt_nonneg (eval x (radU a b)))
      refine hmaj.trans_eq ?_
      simp only [List.map_cons, List.map_nil, evalL, Rat.cast_zero, zero_add, mul_zero, add_zero]
      have hsq : √(eval x (radU a b)) ^ 2 = eval x (radU a b) := Real.sq_sqrt (eval_radU_nonneg a b x)
      have hr2 : √(eval x (radU a b)) * √(eval x (radU a b)) = eval x (radU a b) :=
        Real.mul_self_sqrt (eval_radU_nonneg a b x)
      calc (a0 : ℝ) + √(eval x (radU a b)) * ((a1 : ℝ) + √(eval x (radU a b)) * ((a2 : ℝ)
            + √(eval x (radU a b)) * (√(eval x (radU a b)) * ((a4 : ℝ)
              + √(eval x (radU a b)) * (√(eval x (radU a b)) * (a6 : ℝ))))))
          = (a0 : ℝ) + (a1 : ℝ) * √(eval x (radU a b)) + (a2 : ℝ) * (√(eval x (radU a b)) ^ 2)
            + (a4 : ℝ) * (√(eval x (radU a b)) ^ 2) ^ 2 + (a6 : ℝ) * (√(eval x (radU a b)) ^ 2) ^ 3 := by ring
        _ = _ := by rw [hsq]
    have h1 : Integrable (fun _ : Fin d → ℝ ↦ (a0 : ℝ)) (stdGaussian d) := integrable_const _
    have h2 : Integrable (fun x ↦ (a1 : ℝ) * √(eval x (radU a b))) (stdGaussian d) := i_sqrt.const_mul _
    have h3 : Integrable (fun x ↦ (a2 : ℝ) * eval x (radU a b)) (stdGaussian d) :=
      (integrable_eval (radU a b)).const_mul _
    have h4 : Integrable (fun x ↦ (a4 : ℝ) * eval x (radU a b) ^ 2) (stdGaussian d) :=
      (eval_pow_integrable' (radU a b) 2).const_mul _
    have h5 : Integrable (fun x ↦ (a6 : ℝ) * eval x (radU a b) ^ 3) (stdGaussian d) :=
      (eval_pow_integrable' (radU a b) 3).const_mul _
    have h12 : Integrable (fun x ↦ (a0 : ℝ) + (a1 : ℝ) * √(eval x (radU a b))) (stdGaussian d) := h1.add h2
    have h123 : Integrable (fun x ↦ (a0 : ℝ) + (a1 : ℝ) * √(eval x (radU a b))
        + (a2 : ℝ) * eval x (radU a b)) (stdGaussian d) := h12.add h3
    have h1234 : Integrable (fun x ↦ (a0 : ℝ) + (a1 : ℝ) * √(eval x (radU a b))
        + (a2 : ℝ) * eval x (radU a b) + (a4 : ℝ) * eval x (radU a b) ^ 2) (stdGaussian d) := h123.add h4
    have irhs : Integrable (fun x ↦ (a0 : ℝ) + (a1 : ℝ) * √(eval x (radU a b))
        + (a2 : ℝ) * eval x (radU a b) + (a4 : ℝ) * eval x (radU a b) ^ 2
        + (a6 : ℝ) * eval x (radU a b) ^ 3) (stdGaussian d) := h1234.add h5
    have hmono := integral_mono hint irhs hpt
    simp only [RowSigmaNode.sigma] at hmono ⊢
    rw [integral_add h1234 h5, integral_add h123 h4, integral_add h12 h3, integral_add h1 h2,
      integral_const, integral_const_mul, integral_const_mul, integral_const_mul, integral_const_mul,
      Measure.real_def, measure_univ, ENNReal.toReal_one, one_smul, hU1] at hmono
    set s := ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) - 2
    have hs_nonneg : 0 ≤ s := by
      have hs_eq : s = 32 * gramN (gramT J a b) + 8 * gramH (gramT J a b)
          + 32 * gramB (gramT J a b) + 96 * gramY (gramT J a b) := circular_s_eq ha haa hc
      rw [hs_eq]
      have := gramN_nonneg (gramT J a b); have := gramH_nonneg (gramT J a b)
      have := gramB_nonneg (gramT J a b); have := gramY_nonneg (gramT J a b); linarith
    have h6s : ∫ x, eval x (radU a b) ^ 3 ∂(stdGaussian d) ≤ 6 + 9 * s + (radiusC6 : ℝ) * (s * √s) := by
      have hT := hc.tensorFacts (gaussE_isGaussianExpectation d) ha
      have h := hc.gaussian_sixth ha haa hT
      have eC6 : LowerAnalytic.C6 = (radiusC6 : ℝ) := by norm_num [LowerAnalytic.C6, Lower.C6, radiusC6]
      rw [eC6, rpow_three_halves hs_nonneg] at h
      have hms : 9 * ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) - 12 = 6 + 9 * s := by simp only [s]; ring
      rw [hms] at h; exact h
    have ha1R : (0 : ℝ) ≤ (a1 : ℝ) := by exact_mod_cast ha1
    have ha6R : (0 : ℝ) ≤ (a6 : ℝ) := by exact_mod_cast ha6
    have hC6_nn : (0 : ℝ) ≤ (radiusC6 : ℝ) := by norm_num [radiusC6]
    have hs_eq2 : ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) = 2 + s := by simp only [s]; ring
    rw [hs_eq2] at hmono
    have hcub : ∫ x, Ψ ((σ : ℝ) * √(eval x (radU a b))) ∂(stdGaussian d)
        ≤ ((a0 : ℝ) + (a1 : ℝ) * (93 / 100) + (a2 : ℝ) + 2 * (a4 : ℝ) + 6 * (a6 : ℝ))
          + (((a4 : ℝ) + 9 * (a6 : ℝ)) * √s ^ 2 + ((a6 : ℝ) * (radiusC6 : ℝ)) * √s ^ 3) := by
      have hsq : √s ^ 2 = s := Real.sq_sqrt hs_nonneg
      have hcu : √s ^ 3 = s * √s := by rw [show √s ^ 3 = √s ^ 2 * √s by ring, hsq]
      rw [hsq, hcu]
      nlinarith only [hmono, hrad93, ha1R, h6s, ha6R]
    have hsLo0R : (0 : ℝ) ≤ (sLo : ℝ) := by exact_mod_cast hsLo0
    have hsHi0R : (0 : ℝ) ≤ (sHi : ℝ) := by
      have : (sLo : ℝ) < (sHi : ℝ) := by exact_mod_cast hsLoHi
      linarith
    have hEnd := cubic_endpoint_le ((a4 : ℝ) + 9 * (a6 : ℝ)) ((a6 : ℝ) * (radiusC6 : ℝ))
      (√s) (√(sLo : ℝ)) (√(sHi : ℝ)) (mul_nonneg ha6R hC6_nn) (Real.sqrt_nonneg _)
      (Real.sqrt_le_sqrt hlo) (Real.sqrt_le_sqrt hhi)
    have hsqLo : √(sLo : ℝ) ^ 2 = (sLo : ℝ) := Real.sq_sqrt hsLo0R
    have hcuLo : √(sLo : ℝ) ^ 3 = (sLo : ℝ) * √(sLo : ℝ) := by
      rw [show √(sLo : ℝ) ^ 3 = √(sLo : ℝ) ^ 2 * √(sLo : ℝ) by ring, hsqLo]
    have hsqHi : √(sHi : ℝ) ^ 2 = (sHi : ℝ) := Real.sq_sqrt hsHi0R
    have hcuHi : √(sHi : ℝ) ^ 3 = (sHi : ℝ) * √(sHi : ℝ) := by
      rw [show √(sHi : ℝ) ^ 3 = √(sHi : ℝ) ^ 2 * √(sHi : ℝ) by ring, hsqHi]
    rw [hsqLo, hcuLo, hsqHi, hcuHi] at hEnd
    have hsbLo_ge : √(sLo : ℝ) ≤ (sbLo : ℝ) :=
      Real.sqrt_le_iff.2 ⟨by exact_mod_cast hsbLo0, by
        have : (sLo : ℝ) ≤ (sbLo : ℝ) * (sbLo : ℝ) := by exact_mod_cast hsbLo2
        linarith⟩
    have hsbHi_ge : √(sHi : ℝ) ≤ (sbHi : ℝ) :=
      Real.sqrt_le_iff.2 ⟨by exact_mod_cast hsbHi0, by
        have : (sHi : ℝ) ≤ (sbHi : ℝ) * (sbHi : ℝ) := by exact_mod_cast hsbHi2
        linarith⟩
    have hBnn : 0 ≤ (a6 : ℝ) * (radiusC6 : ℝ) := mul_nonneg ha6R hC6_nn
    simp only [RowSigmaNode.val, Rat.cast_max, Rat.cast_add, Rat.cast_mul, Rat.cast_div, Rat.cast_ofNat]
    rcases le_max_iff.1 hEnd with hL | hR
    · refine le_max_of_le_left ?_
      have := mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left hsbLo_ge hsLo0R) hBnn
      linarith only [hcub, hL, this]
    · refine le_max_of_le_right ?_
      have := mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left hsbHi_ge hsHi0R) hBnn
      linarith only [hcub, hR, this]
  | anti idx σ val parLo parHi =>
    simp only [checkSigmaNode] at hok
    cases hget : (bank.map AntiNode.summary)[idx]? with
    | none => rw [hget] at hok; simp at hok
    | some anSum =>
      rw [hget] at hok
      simp only [Bool.and_eq_true, beq_iff_eq] at hok
      obtain ⟨⟨hσeq, hEndLo⟩, hEndHi⟩ := hok
      rw [List.getElem?_map] at hget
      cases hgetB : bank[idx]? with
      | none => rw [hgetB] at hget; simp at hget
      | some an =>
        rw [hgetB] at hget
        simp only [Option.map_some, Option.some.injEq] at hget
        subst hget
        have hanOK := List.all_eq_true.1 hbank an (List.mem_of_getElem? hgetB)
        have hσeq' : an.sigma = σ := hσeq
        simp only [RowSigmaNode.sigma] at hint
        rw [← hσeq'] at hint
        simp only [RowSigmaNode.sigma, RowSigmaNode.val]
        rw [← hσeq']
        exact antiNode_integral_le a b ha haa hc hΨ an hanOK sLo sHi val hsLo0 hsLoHi parLo parHi
          hEndLo hEndHi hlo hhi hint

private lemma checkSigmaChain_sound {d : ℕ} {Ψ : ℝ → ℝ} (hconv : ConvexOn ℝ (Set.Ici 0) Ψ)
    (U : (Fin d → ℝ) → ℝ) (hU : ∀ x, 0 ≤ U x) (c0 sLo sHi kap cap stop : ℚ)
    (hInt : ∀ σ' : ℝ, 0 ≤ σ' → Integrable (fun x ↦ Ψ (σ' * √(U x))) (stdGaussian d)) :
    ∀ (snodes : List RowSigmaNode) (a0 : RowSigmaNode),
      0 ≤ a0.sigma →
      checkSigmaChain c0 sLo sHi kap cap stop (a0 :: snodes) = true →
      (∀ sn ∈ a0 :: snodes, 0 ≤ sn.sigma →
        ∫ x, Ψ ((sn.sigma : ℝ) * √(U x)) ∂(stdGaussian d) ≤ (sn.val c0 sLo sHi : ℝ)) →
      ∀ σ : ℝ, (a0.sigma : ℝ) ≤ σ → σ ≤ (stop : ℝ) →
        snodes ≠ [] →
        ∫ x, Ψ (σ * √(U x)) ∂(stdGaussian d) - (kap : ℝ) * σ ^ 2 ≤ (cap : ℝ)
  | [], _, _, _, _, _, _, _, hne => absurd rfl hne
  | b :: rest, a0, ha0, hch, hvals, σ, hlo, hhi, _ => by
    simp only [checkSigmaChain, Bool.and_eq_true, decide_eq_true_eq] at hch
    obtain ⟨⟨hlt, hchord⟩, hrest⟩ := hch
    have hb0 : 0 ≤ b.sigma := ha0.trans hlt.le
    by_cases hσb : σ ≤ (b.sigma : ℝ)
    · have ha0R : (0 : ℝ) ≤ (a0.sigma : ℝ) := by exact_mod_cast ha0
      have hb0R : (0 : ℝ) ≤ (b.sigma : ℝ) := by exact_mod_cast hb0
      exact integral_convex_chord hconv U hU ha0 hlt
        (fun _ ↦ hvals a0 (List.mem_cons_self ..) ha0)
        (fun _ ↦ hvals b (List.mem_cons_of_mem _ (List.mem_cons_self ..)) hb0)
        (hInt _ ha0R) (hInt _ hb0R) hchord hlo hσb (hInt _ (ha0R.trans hlo))
    · push Not at hσb
      cases rest with
      | nil =>
        simp only [checkSigmaChain, decide_eq_true_eq] at hrest
        have hstop : (stop : ℝ) ≤ (b.sigma : ℝ) := by exact_mod_cast hrest
        linarith only [hσb, hhi, hstop]
      | cons c rest' =>
        exact checkSigmaChain_sound hconv U hU c0 sLo sHi kap cap stop hInt (c :: rest') b hb0
          hrest (fun sn hsn ↦ hvals sn (List.mem_cons_of_mem _ hsn)) σ hσb.le hhi
          (List.cons_ne_nil _ _)

private lemma checkAntiSCell_sound {d : ℕ} (a b : MvPolynomial (Fin d) ℝ) (ha : Chaos3 a)
    (haa : ∫ x, eval x a ^ 2 ∂(stdGaussian d) = 1 / 2) {J : Fin d → Fin d → ℝ}
    (hc : Circular J a b) {Ψ : ℝ → ℝ} {nodes : List (ℚ × ℚ)} {smax kap cap stop : ℚ}
    (hΨ : CapsHold Ψ nodes smax) (hnodes : nodesOK nodes = true) (hstop : 0 < stop)
    (quadBank : List QuadNode) (hquad : quadBank.all (checkQuadNode nodes smax) = true)
    (bank : List AntiNode) (hbank : bank.all (checkAntiNode nodes smax) = true)
    (c : AntiSCell)
    (hcOK : checkAntiSCell nodes smax kap cap stop quadBank (bank.map AntiNode.summary) c = true)
    (hlo : (c.sLo : ℝ) ≤ ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) - 2)
    (hhi : ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) - 2 ≤ (c.sHi : ℝ))
    {σ : ℝ} (hσ0 : 0 ≤ σ) (hσ1 : σ ≤ (stop : ℝ))
    (hInt : ∀ σ' : ℝ, 0 ≤ σ' → Integrable (fun x ↦ Ψ (σ' * √(eval x (radU a b)))) (stdGaussian d)) :
    ∫ x, Ψ (σ * √(eval x (radU a b))) ∂(stdGaussian d) - (kap : ℝ) * σ ^ 2 ≤ (cap : ℝ) := by
  unfold checkAntiSCell at hcOK
  cases hsn : c.snodes with
  | nil => rw [hsn] at hcOK; simp at hcOK
  | cons a0 rest =>
    rw [hsn] at hcOK
    cases a0 with
    | zero =>
      simp only [Bool.and_eq_true, decide_eq_true_eq, List.all_eq_true] at hcOK
      obtain ⟨⟨hsLo0, hsLoHi⟩, ⟨hchain, hnodesAll⟩⟩ := hcOK
      refine checkSigmaChain_sound hΨ.convex (fun x ↦ eval x (radU a b)) (eval_radU_nonneg a b)
        (nodes.headD (0, 0)).2 c.sLo c.sHi kap cap stop hInt rest .zero le_rfl hchain
        (fun sn hmem hsn0 ↦ ?_) σ (by simpa [RowSigmaNode.sigma] using hσ0) hσ1 (fun hnil ↦ ?_)
      · exact sigmaNode_integral_le a b ha haa hc hΨ hnodes quadBank hquad bank hbank
          c.sLo c.sHi hsLo0 hsLoHi hlo hhi sn (hnodesAll sn hmem) (hInt _ (by exact_mod_cast hsn0))
      · subst hnil
        simp only [checkSigmaChain, decide_eq_true_eq] at hchain
        simp only [RowSigmaNode.sigma] at hchain
        linarith only [hstop, hchain]
    | quad _ _ _ => simp at hcOK
    | moment _ _ _ _ _ _ _ _ => simp at hcOK
    | anti _ _ _ _ _ => simp at hcOK

private lemma checkSCellChain_sound :
    ∀ (cells : List AntiSCell) (prev stop : ℚ),
      checkSCellChain prev stop cells = true →
      ∀ s : ℝ, (prev : ℝ) ≤ s → s ≤ (stop : ℝ) →
        ∃ c ∈ cells, (c.sLo : ℝ) ≤ s ∧ s ≤ (c.sHi : ℝ)
  | [], _, _, h, _, _, _ => by simp [checkSCellChain] at h
  | [c], prev, stop, h, s, hlo, hhi => by
    simp only [checkSCellChain, Bool.and_eq_true, beq_iff_eq, decide_eq_true_eq] at h
    refine ⟨c, List.mem_cons_self .., ?_, ?_⟩
    · rw [h.1]; exact hlo
    · exact hhi.trans (by exact_mod_cast h.2)
  | c1 :: c2 :: rest, prev, stop, h, s, hlo, hhi => by
    simp only [checkSCellChain, Bool.and_eq_true, beq_iff_eq] at h
    by_cases hs : s ≤ (c1.sHi : ℝ)
    · exact ⟨c1, List.mem_cons_self .., h.1 ▸ hlo, hs⟩
    · push Not at hs
      obtain ⟨c, hc, h1, h2⟩ := checkSCellChain_sound (c2 :: rest) c1.sHi stop h.2 s hs.le hhi
      exact ⟨c, List.mem_cons_of_mem _ hc, h1, h2⟩


/-- Bracket a scale by two consecutive certified knots, retaining both endpoints. -/
theorem checkSigmaChain_bracket (c0 sLo sHi kap cap stop : ℚ) {σ : ℝ}
    (hstop : σ ≤ (stop : ℝ)) :
    ∀ (tail : List RowSigmaNode) (n : RowSigmaNode), 0 ≤ n.sigma →
      (n.sigma : ℝ) ≤ σ → tail ≠ [] →
      checkSigmaChain c0 sLo sHi kap cap stop (n :: tail) = true →
      ∃ p ∈ (n :: tail).zip tail,
        0 ≤ p.1.sigma ∧ p.1.sigma < p.2.sigma ∧ (p.1.sigma : ℝ) ≤ σ ∧ σ ≤ (p.2.sigma : ℝ)
  | [], _, _, _, hne, _ => (hne rfl).elim
  | m :: rest, n, hn, hlo, _, hch => by
    simp only [checkSigmaChain, Bool.and_eq_true, decide_eq_true_eq] at hch
    obtain ⟨⟨hlt, _⟩, ht⟩ := hch
    by_cases hmid : σ ≤ (m.sigma : ℝ)
    · exact ⟨(n,m), List.mem_cons_self .., hn, hlt, hlo, hmid⟩
    · cases rest with
      | nil =>
        simp only [checkSigmaChain, decide_eq_true_eq] at ht
        exact (hmid (hstop.trans (by exact_mod_cast ht))).elim
      | cons k ks =>
        obtain ⟨p, hp, good⟩ := checkSigmaChain_bracket c0 sLo sHi kap cap stop hstop
          (k :: ks) m (hn.trans hlt.le) (le_of_not_ge hmid) (List.cons_ne_nil _ _) ht
        exact ⟨p, List.mem_cons_of_mem _ hp, good⟩

/-- The actual fourth-excess cell and consecutive scale nodes selected by the checked bank. -/
theorem checkAntiCells_bracket {nodes : List (ℚ × ℚ)} {smax kap cap stop : ℚ}
    {qb : List QuadNode} {bank : List AntiNodeSummary} {cells : List AntiSCell}
    (hc : checkAntiCells nodes smax kap cap stop qb bank cells = true)
    {s σ : ℝ} (hs₀ : 0 ≤ s) (hs₁ : s ≤ 42) (hσ₀ : 0 ≤ σ) (hσ₁ : σ ≤ (stop : ℝ))
    (hstop : 0 < stop) :
    ∃ c ∈ cells, (c.sLo : ℝ) ≤ s ∧ s ≤ c.sHi ∧ ∃ p ∈ c.snodes.zip c.snodes.tail,
      0 ≤ p.1.sigma ∧ p.1.sigma < p.2.sigma ∧ (p.1.sigma : ℝ) ≤ σ ∧ σ ≤ (p.2.sigma : ℝ) := by
  simp only [checkAntiCells, Bool.and_eq_true, List.all_eq_true] at hc
  obtain ⟨⟨_, hchain⟩, hcells⟩ := hc
  obtain ⟨c, hmem, hlo, hhi⟩ := checkSCellChain_sound cells 0 42 hchain s
    (by simpa using hs₀) (by simpa using hs₁)
  refine ⟨c, hmem, hlo, hhi, ?_⟩
  have hcheck := hcells c hmem
  unfold checkAntiSCell at hcheck
  cases he : c.snodes with
  | nil => simp [he] at hcheck
  | cons first tail =>
    rw [he] at hcheck
    cases first with
    | zero =>
      simp only [Bool.and_eq_true] at hcheck
      have hch := hcheck.2.1
      have hne : tail ≠ [] := by
        intro hnil
        subst tail
        change decide (stop ≤ 0) = true at hch
        exact (not_le_of_gt hstop) (of_decide_eq_true hch)
      exact checkSigmaChain_bracket _ _ _ _ _ _ hσ₁ tail .zero le_rfl
        (by simpa [RowSigmaNode.sigma] using hσ₀) hne hch
    | quad | moment | anti => simp at hcheck


/-- The checked expectation of each stored scale knot at the actual fourth excess of the
circular cubic. This retains the shape and scale arguments for use with a second row. -/
def CircularCellNodeBounds (r : Row) (c0 : ℚ) (cells : List AntiSCell) : Prop :=
  ∀ {d : ℕ} (a b : MvPolynomial (Fin d) ℝ), Chaos3 a →
    (∫ x, eval x a ^ 2 ∂(stdGaussian d) = 1 / 2) →
    ∀ {J : Fin d → Fin d → ℝ}, Circular J a b →
    ∀ (Ψ : ℝ → ℝ), CapsHold Ψ r.nodeList r.smax →
    ∀ c ∈ cells, (c.sLo : ℝ) ≤ ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) - 2 →
      ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) - 2 ≤ (c.sHi : ℝ) →
    ∀ sn ∈ c.snodes,
      Integrable (fun x ↦ Ψ ((sn.sigma : ℝ) * √(eval x (radU a b)))) (stdGaussian d) →
      ∫ x, Ψ ((sn.sigma : ℝ) * √(eval x (radU a b))) ∂(stdGaussian d) ≤
        (sn.val c0 c.sLo c.sHi : ℝ)

/-- Interpolate any two certified knots in one admissible fourth-excess cell, keeping
the given cubic and residual scale in the conclusion. -/
theorem CircularCellNodeBounds.chord {r : Row} {c0 : ℚ} {cells : List AntiSCell}
    (h : CircularCellNodeBounds r c0 cells)
    {d : ℕ} {a b : MvPolynomial (Fin d) ℝ} (ha : Chaos3 a)
    (haa : ∫ x, eval x a ^ 2 ∂(stdGaussian d) = 1/2) {J : Fin d → Fin d → ℝ}
    (hc : Circular J a b) {Ψ : ℝ → ℝ} (hΨ : CapsHold Ψ r.nodeList r.smax)
    {c : AntiSCell} (hm : c ∈ cells)
    (hl : (c.sLo : ℝ) ≤ ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) - 2)
    (hh : ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) - 2 ≤ (c.sHi : ℝ))
    {p q : RowSigmaNode} (hp : p ∈ c.snodes) (hq : q ∈ c.snodes)
    (h₀ : 0 ≤ p.sigma) (hlt : p.sigma < q.sigma) {σ : ℝ}
    (hσ₀ : (p.sigma : ℝ) ≤ σ) (hσ₁ : σ ≤ (q.sigma : ℝ))
    (hInt : ∀ z : ℝ, 0 ≤ z →
      Integrable (fun x ↦ Ψ (z * √(eval x (radU a b)))) (stdGaussian d)) :
    ∫ x, Ψ (σ * √(eval x (radU a b))) ∂(stdGaussian d) ≤
      ((q.sigma : ℝ)-σ)/(q.sigma-p.sigma) * p.val c0 c.sLo c.sHi +
        (σ-p.sigma)/(q.sigma-p.sigma) * q.val c0 c.sLo c.sHi := by
  have h₀R : (0 : ℝ) ≤ p.sigma := by exact_mod_cast h₀
  have h₁R : (0 : ℝ) ≤ q.sigma := by exact_mod_cast h₀.trans hlt.le
  exact integral_le_scale_chord hΨ.convex _ h₀ hlt
    (h a b ha haa hc Ψ hΨ c hm hl hh p hp) (h a b ha haa hc Ψ hΨ c hm hl hh q hq)
    (hInt _ h₀R) (hInt _ h₁R) hσ₀ hσ₁ (hInt _ (h₀R.trans hσ₀))

/-- Extract the individual knot bounds from the same certified cells and bank used for
the uniform row cap. Both conclusions are valid for the same potential and cubic. -/
theorem checkAntiCells_node_bounds (r : Row) (subNodes : List (ℚ × ℚ)) (cap stop : ℚ)
    (quadBank : List QuadNode) (bank : List AntiNode) (cells : List AntiSCell)
    (hsub : isSublistQ subNodes r.nodeList = true)
    (hbank : bank.all (checkAntiNode subNodes r.smax) = true)
    (hcells : checkAntiCells subNodes r.smax r.kappa cap stop quadBank
      (bank.map AntiNode.summary) cells = true) :
    CircularCellNodeBounds r (subNodes.headD (0,0)).2 cells := by
  intro d a b ha haa J hc Ψ hΨ c hmem hlo hhi sn hsn hint
  simp only [checkAntiCells, Bool.and_eq_true, List.all_eq_true] at hcells
  obtain ⟨⟨⟨hnodes, hquad⟩, _⟩, hall⟩ := hcells
  have hcheck := hall c hmem
  unfold checkAntiSCell at hcheck
  simp only [Bool.and_eq_true, decide_eq_true_eq] at hcheck
  obtain ⟨⟨hlo0, hlt⟩, htail⟩ := hcheck
  have each : ∀ n ∈ c.snodes,
      checkSigmaNode subNodes r.smax c.sLo c.sHi quadBank (bank.map AntiNode.summary) n = true := by
    cases he : c.snodes with
    | nil => simp
    | cons first rest =>
      rw [he] at htail
      cases first with
      | zero => exact List.all_eq_true.mp (Bool.and_eq_true_iff.mp htail).2
      | quad | moment | anti => simp at htail
  exact sigmaNode_integral_le a b ha haa hc (capsHold_of_isSublistQ hΨ hsub) hnodes
    quadBank (List.all_eq_true.mpr hquad) bank hbank c.sLo c.sHi hlo0 hlt hlo hhi sn (each sn hsn) hint

/-- The fourth excess of a normalized circular cubic lies in the domain of both Stein banks. -/
theorem circular_fourth_excess_mem {d : ℕ} {a b : MvPolynomial (Fin d) ℝ}
    (ha : Chaos3 a) (haa : ∫ x, eval x a ^ 2 ∂(stdGaussian d) = 1/2)
    {J : Fin d → Fin d → ℝ} (hc : Circular J a b) :
    let s := ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) - 2
    0 ≤ s ∧ s ≤ 42 := by
  have hE := gaussE_isGaussianExpectation d
  have haa' : gaussE d (a * a) = 1 / 2 := by
    rw [gaussE_apply, ← haa]
    exact integral_congr_ae (Filter.Eventually.of_forall fun x ↦ by simp only [map_mul]; ring)
  set s : ℝ := ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) - 2
  have hs0 : 0 ≤ s := by
    have h4 := hc.fourth_moment_contractions hE ha
    rw [haa'] at h4
    have heq : gaussE d (radU a b ^ 2) = ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) := by
      rw [gaussE_apply]; simp only [map_pow]
    have := gramN_nonneg (gramT J a b)
    have := gramH_nonneg (gramT J a b)
    have := gramB_nonneg (gramT J a b)
    have := gramY_nonneg (gramT J a b)
    linarith
  have hs42 : s ≤ 42 := by
    have hcap := hc.gaussian_fourth_moment_le_44 a b ha haa
    linarith
  exact ⟨hs0, hs42⟩

/-- **Main soundness theorem for tightened antiholomorphic Stein row certificates**:
given a thinned node sublist `subNodes ⊆ r.nodeList`, a pre-verified `AntiNode` bank, a verified
`quadBank`, and a verified `s`-cell cover `cells` of `s ∈ [0, 42]` and `σ ∈ [0, stop]` with
`r.delta * (93/100) ≤ stop`, the row satisfies `CircularRowBound r cap`. -/
theorem checkAntiCells_sound (r : Row) (subNodes : List (ℚ × ℚ)) (cap stop : ℚ)
    (quadBank : List QuadNode) (bank : List AntiNode) (cells : List AntiSCell)
    (hsub : isSublistQ subNodes r.nodeList = true)
    (hstop_pos : 0 < stop)
    (hstop : r.delta * (93 / 100) ≤ stop)
    (hbank : bank.all (checkAntiNode subNodes r.smax) = true)
    (hcells : checkAntiCells subNodes r.smax r.kappa cap stop quadBank
      (bank.map AntiNode.summary) cells = true) :
    CircularRowBound r cap := by
  simp only [checkAntiCells, Bool.and_eq_true, List.all_eq_true] at hcells
  obtain ⟨⟨⟨hnodesOK, hquadOK⟩, hchain⟩, hcellsOK⟩ := hcells
  intro d a b ha haa J hc Ψ σ hΨ hσ0 hσ1 hInt
  have hΨsub : CapsHold Ψ subNodes r.smax := capsHold_of_isSublistQ hΨ hsub
  let s := ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) - 2
  obtain ⟨hs0, hs42⟩ := circular_fourth_excess_mem ha haa hc
  change 0 ≤ s at hs0
  change s ≤ 42 at hs42
  obtain ⟨c, hcMem, hsLo, hsHi⟩ := checkSCellChain_sound cells 0 42 hchain s
    (by simpa using hs0) (by simpa using hs42)
  have hσstop : σ ≤ (stop : ℝ) := by
    have hR : ((r.delta * (93 / 100) : ℚ) : ℝ) ≤ (stop : ℝ) := by exact_mod_cast hstop
    push_cast at hR
    linarith only [hσ1, hR]
  exact checkAntiSCell_sound a b ha haa hc hΨsub hnodesOK hstop_pos quadBank
    (List.all_eq_true.2 hquadOK) bank hbank c (hcellsOK c hcMem) hsLo hsHi hσ0 hσstop hInt

end

end Grothe.LowerAnalytic
