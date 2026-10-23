import Grothe.UpperChaos.PhiDense
import Grothe.UpperChaos.PhiCoverData
import Grothe.UpperChaos.Rounder
import Mathlib.Analysis.Complex.ExponentialBounds

/-!
# The phase cover: `φ² ≤ 3` everywhere

`g(U, V, W) = (UV − W²) e^{−(21/10)(U+V)} S(U, V, W)²` is the square of the phase
`φ = D e^{−ε(U+V)} S` (`D² = UV − W²`, `ε = 21/20`).

* `leaf_sound`: a passing leaf of the checker bounds `g ≤ 3` on its box;
* `walk_sound`: the bisection tree covers the root box `[0, 64]² × [−32, 32]`;
* `far_sound`: for `U + V ≥ 60` the crude bound `Σ|c| s^{i+j}(s/2)^k` and the decay of
  `s^n e^{−21 s/20}` (`pow_mul_exp_le`) give `g ≤ 3`;
* `phi_cover_check` (one `native_decide`, ~1.5 min) and `phiT_sq_le_three : ∀ u, phiT u ^ 2 ≤ 3`.
-/

open GrotheKernel Finset

namespace Grothe.UpperChaos

noncomputable section

/-- `(UV − W²) e^{−(21/10)(U+V)} S²`. -/
def gphi (ts : List ((ℕ × ℕ × ℕ) × ℚ)) (U V W : ℝ) : ℝ :=
  (U * V - W ^ 2) * Real.exp (-(21 / 10) * (U + V)) * Ssum ts U V W ^ 2

/-! ### The exponential -/

lemma exp_neg_one_le : Real.exp (-1) ≤ (qn : ℝ) / qd := by
  have h := Real.exp_one_gt_d9
  rw [Real.exp_neg, qn, qd]
  rw [inv_le_comm₀ (Real.exp_pos 1) (by norm_num)]
  push_cast
  rw [inv_div]
  linarith [show (2718281828 : ℝ) / 1000000000 ≤ 2.7182818283 by norm_num]

/-- `e^{−x} ≤ (qn/qd)^n · den/(1+f)` with `21 s/den = n + f`. -/
lemma exp_leaf_le {s : ℤ} (hs : 0 ≤ s) {y : ℝ} (hy : (s : ℝ) ≤ (2 : ℝ) ^ SC * y) :
    let den : ℤ := 10 * (2 : ℤ) ^ SC
    let n : ℕ := (21 * s / den).toNat
    Real.exp (-(21 / 10) * y)
      ≤ ((qn : ℝ) / qd) ^ n * ((den : ℝ) / ((den + 21 * s - den * n : ℤ) : ℝ)) := by
  intro den n
  have hden : (0 : ℤ) < den := by simp [den]
  have hq0 : 0 ≤ 21 * s / den := Int.ediv_nonneg (by omega) hden.le
  have hn : ((n : ℕ) : ℤ) = 21 * s / den := Int.toNat_of_nonneg hq0
  have h1 : den * n ≤ 21 * s := by rw [hn]; exact Int.mul_ediv_self_le hden.ne'
  have h2 : 21 * s < den * n + den := by
    rw [hn]; have := Int.lt_ediv_add_one_mul_self (21 * s) hden; linarith
  have hdenR : (0 : ℝ) < den := by exact_mod_cast hden
  set f : ℝ := ((21 * s - den * n : ℤ) : ℝ) / den with hf
  have hf0 : 0 ≤ f := div_nonneg (by exact_mod_cast (by omega : (0 : ℤ) ≤ 21 * s - den * n)) hdenR.le
  have hx : (n : ℝ) + f ≤ (21 / 10) * y := by
    rw [hf, add_div' _ _ _ hdenR.ne', div_le_iff₀ hdenR]
    have : ((den : ℤ) : ℝ) = 10 * (2 : ℝ) ^ SC := by simp [den]
    rw [this]
    push_cast
    nlinarith
  have hexp : Real.exp (-(21 / 10) * y) ≤ Real.exp (-1) ^ n * Real.exp (-f) := by
    rw [← Real.exp_nat_mul, ← Real.exp_add]
    exact Real.exp_le_exp.2 (by linarith)
  have hf1 : Real.exp (-f) ≤ (den : ℝ) / ((den + 21 * s - den * n : ℤ) : ℝ) := by
    have hpos : (0 : ℝ) < ((den + 21 * s - den * n : ℤ) : ℝ) := by exact_mod_cast (by omega)
    have h3 : ((den + 21 * s - den * n : ℤ) : ℝ) / den = 1 + f := by
      rw [hf]; push_cast; field_simp; ring
    rw [Real.exp_neg, inv_le_comm₀ (Real.exp_pos _) (div_pos hdenR hpos), inv_div, h3]
    linarith [Real.add_one_le_exp f]
  calc Real.exp (-(21 / 10) * y) ≤ Real.exp (-1) ^ n * Real.exp (-f) := hexp
    _ ≤ ((qn : ℝ) / qd) ^ n * ((den : ℝ) / ((den + 21 * s - den * n : ℤ) : ℝ)) :=
        mul_le_mul (pow_le_pow_left₀ (Real.exp_pos _).le exp_neg_one_le n) hf1
          (Real.exp_pos _).le (by positivity)

/-! ### Leaves -/

/-- The point `(U, V, W)` lies in the (scaled) box. -/
def InBox (b : Box) (U V W : ℝ) : Prop :=
  (b.Ul : ℝ) ≤ (2 : ℝ) ^ SC * U ∧ (2 : ℝ) ^ SC * U ≤ b.Uh ∧
  (b.Vl : ℝ) ≤ (2 : ℝ) ^ SC * V ∧ (2 : ℝ) ^ SC * V ≤ b.Vh ∧
  (b.Wl : ℝ) ≤ (2 : ℝ) ^ SC * W ∧ (2 : ℝ) ^ SC * W ≤ b.Wh

lemma commonDen_pos (ts : List ((ℕ × ℕ × ℕ) × ℚ)) : 0 < commonDen ts := by
  unfold commonDen
  suffices h : ∀ (l : List ((ℕ × ℕ × ℕ) × ℚ)) (a : ℕ), 0 < a →
      0 < l.foldl (fun l t => Nat.lcm l t.2.den) a from h ts 1 one_pos
  intro l
  induction l with
  | nil => intro a ha; exact ha
  | cons t l ih => intro a ha; exact ih _ (Nat.lcm_pos ha t.2.den_pos)

/-- `|S U − m| ≤ r` from the box and centring. -/
lemma abs_sub_centre {lo hi : ℤ} {x : ℝ} (hlo : (lo : ℝ) ≤ x) (hhi : x ≤ hi)
    (hc : hi - (lo + hi) / 2 = (lo + hi) / 2 - lo) :
    |x - ((lo + hi) / 2 : ℤ)| ≤ (((lo + hi) / 2 - lo).toNat : ℝ) := by
  have hle : lo ≤ hi := by exact_mod_cast hlo.trans hhi
  have hnn : 0 ≤ (lo + hi) / 2 - lo := by omega
  rw [show ((((lo + hi) / 2 - lo).toNat : ℕ) : ℝ) = (((lo + hi) / 2 - lo : ℤ) : ℝ) by
    rw [← Int.cast_natCast, Int.toNat_of_nonneg hnn]]
  rw [abs_le]
  have h1 : ((hi - (lo + hi) / 2 : ℤ) : ℝ) = (((lo + hi) / 2 - lo : ℤ) : ℝ) := by
    exact_mod_cast hc
  push_cast at h1 ⊢
  constructor <;> linarith

lemma w2lo_le {b : Box} {w : ℝ} (hl : (b.Wl : ℝ) ≤ w) (hh : w ≤ b.Wh) :
    ((w2lo b : ℤ) : ℝ) ≤ w ^ 2 := by
  unfold w2lo
  split_ifs with h
  · simp; positivity
  · push_cast
    rcases not_and_or.1 h with h1 | h1
    · have : (0 : ℝ) < b.Wl := by exact_mod_cast (by omega : (0 : ℤ) < b.Wl)
      exact (min_le_left _ _).trans (by nlinarith)
    · have : (b.Wh : ℝ) < 0 := by exact_mod_cast (by omega : b.Wh < 0)
      exact (min_le_right _ _).trans (by nlinarith)

/-- The real arithmetic of a leaf. -/
lemma leaf_arith {ts : List ((ℕ × ℕ × ℕ) × ℚ)} {U V W S Lr Sn Dm qnn qdn den opf : ℝ}
    (hS : 0 < S) (hL : 0 < Lr) (hDm : 0 ≤ Dm) (hqdn : 0 < qdn) (hopf : 0 < opf) (hden : 0 < den)
    (hqnn : 0 ≤ qnn) (hW2 : W ^ 2 ≤ U * V)
    (hpoly : |Lr * S ^ DEG * Ssum ts U V W| ≤ Sn) (hD : S ^ 2 * (U * V - W ^ 2) ≤ Dm)
    (hE : Real.exp (-(21 / 10) * (U + V)) ≤ qnn / qdn * (den / opf))
    (hmain : Dm * qnn * den * Sn ^ 2 ≤ 3 * S ^ 2 * qdn * opf * (Lr * S ^ DEG) ^ 2) :
    gphi ts U V W ≤ 3 := by
  have hK : (0 : ℝ) < S ^ 2 * (Lr * S ^ DEG) ^ 2 := by positivity
  have hsq : (Lr * S ^ DEG) ^ 2 * Ssum ts U V W ^ 2 ≤ Sn ^ 2 := by
    rw [← mul_pow]; exact sq_le_sq' (abs_le.1 hpoly).1 (abs_le.1 hpoly).2
  have hE0 : 0 ≤ Real.exp (-(21 / 10) * (U + V)) := (Real.exp_pos _).le
  have hUV : 0 ≤ U * V - W ^ 2 := by linarith
  have hSn : 0 ≤ Sn := (abs_nonneg _).trans hpoly
  rw [← mul_le_mul_iff_of_pos_right hK]
  calc gphi ts U V W * (S ^ 2 * (Lr * S ^ DEG) ^ 2)
      = (S ^ 2 * (U * V - W ^ 2)) * Real.exp (-(21 / 10) * (U + V))
          * ((Lr * S ^ DEG) ^ 2 * Ssum ts U V W ^ 2) := by unfold gphi; ring
    _ ≤ Dm * (qnn / qdn * (den / opf)) * Sn ^ 2 :=
        mul_le_mul (mul_le_mul hD hE hE0 hDm) hsq (by positivity) (by positivity)
    _ = (Dm * qnn * den * Sn ^ 2) / (qdn * opf) := by field_simp
    _ ≤ (3 * S ^ 2 * qdn * opf * (Lr * S ^ DEG) ^ 2) / (qdn * opf) :=
        div_le_div_of_nonneg_right hmain (by positivity)
    _ = 3 * (S ^ 2 * (Lr * S ^ DEG) ^ 2) := by field_simp

lemma add_sub_cancel' (m x : ℝ) : m + (x - m) = x := by ring

lemma D_bound {S U V W Uh Vh w2 : ℝ} (hS : 0 < S) (hU : 0 ≤ U) (hV : 0 ≤ V) (hU2 : S * U ≤ Uh)
    (hV2 : S * V ≤ Vh) (h2 : w2 ≤ (S * W) ^ 2) : S ^ 2 * (U * V - W ^ 2) ≤ Uh * Vh - w2 := by
  have h1 : S * U * (S * V) ≤ Uh * Vh :=
    mul_le_mul hU2 hV2 (by positivity) ((by positivity : (0 : ℝ) ≤ S * U).trans hU2)
  nlinarith

/-- **Soundness of a leaf.** -/
theorem leaf_sound {ts : List ((ℕ × ℕ × ℕ) × ℚ)} (hts : termsOK ts = true) {b : Box}
    (hleaf : leafOK (commonDen ts) (denseA0 ts) b = true) {U V W : ℝ} (hb : InBox b U V W)
    (hW2 : W ^ 2 ≤ U * V) : gphi ts U V W ≤ 3 := by
  obtain ⟨hU1, hU2, hV1, hV2, hW1, hWh⟩ := hb
  simp only [leafOK, Bool.and_eq_true, decide_eq_true_eq, and_assoc] at hleaf
  obtain ⟨hcU, hcV, hcW, hUl, hVl, hs, hopf, hmain⟩ := hleaf
  have hSpos : (0 : ℝ) < (2 : ℝ) ^ SC := by positivity
  -- the polynomial
  have hpoly := abs_e3_le (shiftAll ((b.Ul + b.Uh) / 2) ((b.Vl + b.Vh) / 2) ((b.Wl + b.Wh) / 2)
      (denseA0 ts)) (abs_sub_centre hU1 hU2 hcU) (abs_sub_centre hV1 hV2 hcV)
      (abs_sub_centre hW1 hWh hcW)
  rw [e3_shiftAll] at hpoly
  simp only [add_sub_cancel'] at hpoly
  rw [e3_denseA0 hts, mul_comm DEG SC, pow_mul] at hpoly
  have hUnn : 0 ≤ U := by
    have : (0 : ℝ) ≤ b.Ul := by exact_mod_cast hUl
    nlinarith
  have hVnn : 0 ≤ V := by
    have : (0 : ℝ) ≤ b.Vl := by exact_mod_cast hVl
    nlinarith
  -- `S²(UV − W²) ≤ Dm`
  have hD : ((2 : ℝ) ^ SC) ^ 2 * (U * V - W ^ 2) ≤ ((max 0 (b.Uh * b.Vh - w2lo b) : ℤ) : ℝ) := by
    have h2 := w2lo_le hW1 hWh
    refine le_trans ?_ (Int.cast_le.2 (le_max_right _ _))
    push_cast
    exact D_bound hSpos hUnn hVnn hU2 hV2 h2
  -- the exponential
  have hsU : ((b.Ul + b.Vl : ℤ) : ℝ) ≤ (2 : ℝ) ^ SC * (U + V) := by push_cast; linarith
  have hE := exp_leaf_le hs hsU
  simp only [div_pow] at hE
  generalize (21 * (b.Ul + b.Vl) / (10 * 2 ^ SC)).toNat = n at hopf hmain hE
  generalize (10 * 2 ^ SC + 21 * (b.Ul + b.Vl) - 10 * 2 ^ SC * (n : ℤ) : ℤ) = opf at hopf hmain hE
  generalize absEval3 ((b.Ul + b.Uh) / 2 - b.Ul).toNat ((b.Vl + b.Vh) / 2 - b.Vl).toNat
    ((b.Wl + b.Wh) / 2 - b.Wl).toNat
    (shiftAll ((b.Ul + b.Uh) / 2) ((b.Vl + b.Vh) / 2) ((b.Wl + b.Wh) / 2) (denseA0 ts)) = Sn
    at hmain hpoly
  have hDm0 : (0 : ℤ) ≤ max 0 (b.Uh * b.Vh - w2lo b) := le_max_left _ _
  generalize (max 0 (b.Uh * b.Vh - w2lo b) : ℤ) = Dm at hmain hD hDm0
  have hmainR : (Dm : ℝ) * (qn : ℝ) ^ n * ((10 * 2 ^ SC : ℤ) : ℝ) * (Sn : ℝ) ^ 2
      ≤ 3 * ((2 : ℝ) ^ SC) ^ 2 * (qd : ℝ) ^ n * (opf : ℝ)
        * ((commonDen ts : ℝ) * ((2 : ℝ) ^ SC) ^ DEG) ^ 2 := by
    have := (Int.cast_le (R := ℝ)).2 hmain
    push_cast at this ⊢
    exact this
  refine leaf_arith hSpos (by exact_mod_cast commonDen_pos ts) ?_
    (pow_pos (by norm_num [qd]) _) ?_ ?_ (pow_nonneg (by norm_num [qn]) _) hW2 hpoly hD ?_ hmainR
  · exact_mod_cast hDm0
  · exact_mod_cast hopf
  · positivity
  · simpa [mul_div_assoc] using hE

/-! ### The tree -/

lemma inBox_split {b : Box} {c : Char} (hc : c = 'U' ∨ c = 'V' ∨ c = 'W') {U V W : ℝ}
    (h : InBox b U V W) : InBox (splitBox b c).1 U V W ∨ InBox (splitBox b c).2 U V W := by
  obtain ⟨h1, h2, h3, h4, h5, h6⟩ := h
  rcases hc with rfl | rfl | rfl
  · rcases le_total ((2 : ℝ) ^ SC * U) (((b.Ul + b.Uh) / 2 : ℤ) : ℝ) with hm | hm
    · left; exact ⟨h1, hm, h3, h4, h5, h6⟩
    · right; exact ⟨hm, h2, h3, h4, h5, h6⟩
  · rcases le_total ((2 : ℝ) ^ SC * V) (((b.Vl + b.Vh) / 2 : ℤ) : ℝ) with hm | hm
    · left; exact ⟨h1, h2, h3, hm, h5, h6⟩
    · right; exact ⟨h1, h2, hm, h4, h5, h6⟩
  · rcases le_total ((2 : ℝ) ^ SC * W) (((b.Wl + b.Wh) / 2 : ℤ) : ℝ) with hm | hm
    · left; exact ⟨h1, h2, h3, h4, h5, hm⟩
    · right; exact ⟨h1, h2, h3, h4, hm, h6⟩

/-- **Soundness of the tree walk.** -/
theorem walk_sound {ts : List ((ℕ × ℕ × ℕ) × ℚ)} (hts : termsOK ts = true) :
    ∀ (fuel : ℕ) (cs : List Char) (b : Box) (rest : List Char),
      walk (commonDen ts) (denseA0 ts) fuel cs b = some rest →
      ∀ U V W : ℝ, InBox b U V W → W ^ 2 ≤ U * V → U + V < 60 → gphi ts U V W ≤ 3 := by
  intro fuel
  induction fuel with
  | zero => intro cs b rest h; simp [walk] at h
  | succ fuel ih =>
    intro cs b rest h U V W hb hW2 h60
    cases cs with
    | nil => simp [walk] at h
    | cons c cs =>
      simp only [walk] at h
      by_cases hL : c = 'L'
      · subst hL
        simp only [↓reduceIte] at h
        by_cases hok : leafOK (commonDen ts) (denseA0 ts) b = true
        · exact leaf_sound hts hok hb hW2
        · simp [hok] at h
      by_cases hF : c = 'F'
      · subst hF
        simp only [show ('F' : Char) ≠ 'L' by decide, ↓reduceIte] at h
        by_cases hfl : farLeaf b = true
        · have hfar : 60 * (2 : ℤ) ^ SC ≤ b.Ul + b.Vl := by simpa [farLeaf] using hfl
          obtain ⟨h1, -, h3, -, -, -⟩ := hb
          have : (60 : ℝ) * (2 : ℝ) ^ SC ≤ (2 : ℝ) ^ SC * U + (2 : ℝ) ^ SC * V := by
            have := (Int.cast_le (R := ℝ)).2 hfar; push_cast at this; linarith
          have hS : (0 : ℝ) < (2 : ℝ) ^ SC := by positivity
          nlinarith
        · simp [hfl] at h
      by_cases hX : c = 'X'
      · subst hX
        simp only [show ('X' : Char) ≠ 'L' by decide, show ('X' : Char) ≠ 'F' by decide,
          ↓reduceIte] at h
        by_cases hel : emptyLeaf b = true
        · have he : 0 ≤ b.Ul ∧ 0 ≤ b.Vl ∧ b.Uh * b.Vh < w2lo b := by simpa [emptyLeaf, and_assoc] using hel
          obtain ⟨h1, h2, h3, h4, h5, h6⟩ := hb
          have hS : (0 : ℝ) < (2 : ℝ) ^ SC := by positivity
          have hU : 0 ≤ U := by
            have : (0 : ℝ) ≤ b.Ul := by exact_mod_cast he.1
            nlinarith
          have hV : 0 ≤ V := by
            have : (0 : ℝ) ≤ b.Vl := by exact_mod_cast he.2.1
            nlinarith
          have hlt : (b.Uh : ℝ) * b.Vh < w2lo b := by exact_mod_cast he.2.2
          have hw := w2lo_le h5 h6
          have hUV := D_bound hS hU hV h2 h4 hw
          nlinarith
        · simp [hel] at h
      by_cases hS : c = 'U' ∨ c = 'V' ∨ c = 'W'
      swap
      · simp [hL, hF, hX, hS] at h
      simp only [hL, hF, hX, hS, ↓reduceIte] at h
      · cases h1 : walk (commonDen ts) (denseA0 ts) fuel cs (splitBox b c).1 with
        | none => simp [h1] at h
        | some rest' =>
          simp only [h1] at h
          rcases inBox_split hS hb with hb' | hb'
          · exact ih cs _ rest' h1 U V W hb' hW2 h60
          · exact ih rest' _ rest h U V W hb' hW2 h60

/-! ### The far field -/

/-- `s^n e^{−21 s/20} ≤ 60^n e^{−63}` for `n ≤ 63 ≤ (21/20) s`. -/
lemma pow_mul_exp_le {n : ℕ} (hn : n ≤ 63) {s : ℝ} (hs : 60 ≤ s) :
    s ^ n * Real.exp (-(21 / 20) * s) ≤ 60 ^ n * Real.exp (-63) := by
  have h1 : s / 60 ≤ Real.exp (s / 60 - 1) := by linarith [Real.add_one_le_exp (s / 60 - 1)]
  have h0 : 0 ≤ s / 60 := by positivity
  have h2 : (s / 60) ^ n ≤ Real.exp ((21 / 20) * (s - 60)) := by
    calc (s / 60) ^ n ≤ Real.exp (s / 60 - 1) ^ n := pow_le_pow_left₀ h0 h1 n
      _ = Real.exp (n * (s / 60 - 1)) := by rw [← Real.exp_nat_mul]
      _ ≤ Real.exp ((21 / 20) * (s - 60)) := by
          apply Real.exp_le_exp.2
          have : (n : ℝ) ≤ 63 := by exact_mod_cast hn
          have : 0 ≤ s / 60 - 1 := by linarith
          nlinarith
  have e : s ^ n = 60 ^ n * (s / 60) ^ n := by rw [div_pow]; field_simp
  rw [e, mul_assoc]
  refine mul_le_mul_of_nonneg_left ?_ (by positivity)
  calc (s / 60) ^ n * Real.exp (-(21 / 20) * s)
      ≤ Real.exp ((21 / 20) * (s - 60)) * Real.exp (-(21 / 20) * s) :=
        mul_le_mul_of_nonneg_right h2 (Real.exp_pos _).le
    _ = Real.exp (-63) := by rw [← Real.exp_add]; congr 1; ring

lemma abs_list_sum_le {β : Type} (l : List β) (f : β → ℝ) :
    |(l.map f).sum| ≤ (l.map fun t => |f t|).sum := by
  induction l with
  | nil => simp
  | cons t l ih => simp only [List.map_cons, List.sum_cons]; exact (abs_add_le _ _).trans (by linarith)

lemma list_sum_le {β : Type} (l : List β) (f g : β → ℝ) (h : ∀ t ∈ l, f t ≤ g t) :
    (l.map f).sum ≤ (l.map g).sum := by
  induction l with
  | nil => simp
  | cons t l ih =>
    simp only [List.map_cons, List.sum_cons]
    exact add_le_add (h t (by simp)) (ih fun t ht => h t (by simp [ht]))

lemma foldl_add_rat {β : Type} (g : β → ℚ) (l : List β) (a : ℚ) :
    l.foldl (fun s t => s + g t) a = a + (l.map g).sum := by
  induction l generalizing a with
  | nil => simp
  | cons t l ih => simp [ih]; ring

lemma exp_63_ge : ((qd : ℝ) / qn) ^ 63 ≤ Real.exp 63 := by
  have h := Real.exp_one_gt_d9
  have h1 : (qd : ℝ) / qn ≤ Real.exp 1 := by
    rw [qd, qn]; push_cast; linarith [show (2718281828 : ℝ) / 1000000000 ≤ 2.7182818283 by norm_num]
  calc ((qd : ℝ) / qn) ^ 63 ≤ Real.exp 1 ^ 63 :=
        pow_le_pow_left₀ (by rw [qd, qn]; positivity) h1 63
    _ = Real.exp 63 := by rw [← Real.exp_nat_mul]; norm_num

/-- **The far field**: `g ≤ 3` for `U + V ≥ 60`. -/
theorem far_sound {ts : List ((ℕ × ℕ × ℕ) × ℚ)} (hts : termsOK ts = true)
    (hfar : farOK ts = true) {U V W : ℝ} (hU : 0 ≤ U) (hV : 0 ≤ V) (hW2 : W ^ 2 ≤ U * V)
    (h60 : 60 ≤ U + V) : gphi ts U V W ≤ 3 := by
  set s := U + V with hs_def
  have hs0 : 0 ≤ s := by linarith
  have hUs : U ≤ s := by linarith
  have hVs : V ≤ s := by linarith
  have hUV4 : U * V ≤ (s / 2) ^ 2 := by nlinarith [sq_nonneg (U - V)]
  have hWs : |W| ≤ s / 2 := by
    rw [abs_le]; constructor <;> nlinarith [sq_nonneg (W + s / 2), sq_nonneg (W - s / 2)]
  have hdeg : ∀ t ∈ ts, t.1.1 + t.1.2.1 + t.1.2.2 ≤ DEG := fun t ht => by
    have := List.all_eq_true.1 hts t ht
    simp at this; exact this.1
  -- the sum of the crude terms
  set X : ℝ := (ts.map fun t => |(t.2 : ℝ)| / 2 ^ (t.1.2.2 + 1)
      * (s ^ (t.1.1 + t.1.2.1 + t.1.2.2 + 1) * Real.exp (-(21 / 20) * s))).sum with hX
  have hX0 : 0 ≤ X := by
    rw [hX]
    exact List.sum_nonneg (fun x hx => by
      obtain ⟨t, -, rfl⟩ := List.mem_map.1 hx
      positivity)
  -- `|S| · (s/2) e^{−21s/20} ≤ X`
  have hS : |Ssum ts U V W| * (s / 2 * Real.exp (-(21 / 20) * s)) ≤ X := by
    have h1 := abs_list_sum_le ts fun t => (t.2 : ℝ) * U ^ t.1.1 * V ^ t.1.2.1 * W ^ t.1.2.2
    have h2 : (ts.map fun t => |(t.2 : ℝ) * U ^ t.1.1 * V ^ t.1.2.1 * W ^ t.1.2.2|).sum
        ≤ (ts.map fun t => |(t.2 : ℝ)| * s ^ t.1.1 * s ^ t.1.2.1 * (s / 2) ^ t.1.2.2).sum := by
      refine list_sum_le _ _ _ fun t _ => ?_
      rw [abs_mul, abs_mul, abs_mul, abs_pow, abs_pow, abs_pow, abs_of_nonneg hU, abs_of_nonneg hV]
      gcongr
    have hE : 0 ≤ s / 2 * Real.exp (-(21 / 20) * s) := by positivity
    calc |Ssum ts U V W| * (s / 2 * Real.exp (-(21 / 20) * s))
        ≤ (ts.map fun t => |(t.2 : ℝ)| * s ^ t.1.1 * s ^ t.1.2.1 * (s / 2) ^ t.1.2.2).sum
            * (s / 2 * Real.exp (-(21 / 20) * s)) :=
          mul_le_mul_of_nonneg_right (h1.trans h2) hE
      _ = X := by
          rw [hX, list_sum_mul]
          congr 1
          refine List.map_congr_left fun t _ => ?_
          rw [div_pow, pow_add, pow_add, pow_succ]
          field_simp
          ring
  -- `X ≤ e^{−63} · tot ≤ 17/10`
  have hXle : X ≤ 17 / 10 := by
    have h1 : X ≤ (ts.map fun t => |(t.2 : ℝ)| / 2 ^ (t.1.2.2 + 1)
        * (60 ^ (t.1.1 + t.1.2.1 + t.1.2.2 + 1) * Real.exp (-63))).sum := by
      refine list_sum_le _ _ _ fun t ht => ?_
      refine mul_le_mul_of_nonneg_left (pow_mul_exp_le ?_ h60) (by positivity)
      have := hdeg t ht; simp only [DEG] at this; omega
    have hfar' := hfar
    simp only [farOK, decide_eq_true_eq] at hfar'
    rw [foldl_add_rat (fun t : (ℕ × ℕ × ℕ) × ℚ => (if t.2 < 0 then -t.2 else t.2) / (2 : ℚ) ^ (t.1.2.2 + 1)
      * (60 : ℚ) ^ (t.1.1 + t.1.2.1 + t.1.2.2 + 1)), zero_add] at hfar'
    have hc := (Rat.cast_le (K := ℝ)).2 hfar'
    push_cast at hc
    rw [List.map_map] at hc
    have habs : ∀ q : ℚ, ((if q < 0 then -q else q : ℚ) : ℝ) = |(q : ℝ)| := fun q => by
      split_ifs with h
      · rw [abs_of_neg (by exact_mod_cast h)]; push_cast; ring
      · rw [abs_of_nonneg (by exact_mod_cast not_lt.1 h)]
    have e1 : (ts.map fun t => |(t.2 : ℝ)| / 2 ^ (t.1.2.2 + 1)
        * (60 ^ (t.1.1 + t.1.2.1 + t.1.2.2 + 1) * Real.exp (-63))).sum
        = (ts.map ((fun r : ℚ => (r : ℝ)) ∘ fun t => (if t.2 < 0 then -t.2 else t.2)
            / (2 : ℚ) ^ (t.1.2.2 + 1) * (60 : ℚ) ^ (t.1.1 + t.1.2.1 + t.1.2.2 + 1))).sum
          * Real.exp (-63) := by
      rw [list_sum_mul]
      congr 1
      refine List.map_congr_left fun t _ => ?_
      simp only [Function.comp]
      push_cast
      rw [habs]; ring
    rw [e1] at h1
    have hq : (0 : ℝ) < (qn : ℝ) ^ 63 := by rw [qn]; positivity
    have h63 := exp_63_ge
    have hexp : Real.exp (-63) * Real.exp 63 = 1 := by rw [← Real.exp_add]; norm_num
    set T := (ts.map ((fun r : ℚ => (r : ℝ)) ∘ fun t => (if t.2 < 0 then -t.2 else t.2)
            / (2 : ℚ) ^ (t.1.2.2 + 1) * (60 : ℚ) ^ (t.1.1 + t.1.2.1 + t.1.2.2 + 1))).sum
    have hT : T ≤ 17 / 10 * ((qd : ℝ) / qn) ^ 63 := by
      rw [div_pow, mul_div_assoc', le_div_iff₀ hq]; exact hc
    calc X ≤ T * Real.exp (-63) := h1
      _ ≤ 17 / 10 * Real.exp 63 * Real.exp (-63) := by
          refine mul_le_mul_of_nonneg_right (hT.trans ?_) (Real.exp_pos _).le
          exact mul_le_mul_of_nonneg_left h63 (by norm_num)
      _ = 17 / 10 := by rw [mul_assoc, mul_comm (Real.exp 63), hexp, mul_one]
  -- conclude
  have hUVW : U * V - W ^ 2 ≤ (s / 2) ^ 2 := by nlinarith [sq_nonneg W]
  have hUVW0 : 0 ≤ U * V - W ^ 2 := by linarith
  have he : Real.exp (-(21 / 10) * (U + V)) = Real.exp (-(21 / 20) * s) ^ 2 := by
    rw [← Real.exp_nat_mul]; congr 1; rw [hs_def]; push_cast; ring
  unfold gphi
  rw [he]
  have hA : (U * V - W ^ 2) * Real.exp (-(21 / 20) * s) ^ 2 * Ssum ts U V W ^ 2
      ≤ (|Ssum ts U V W| * (s / 2 * Real.exp (-(21 / 20) * s))) ^ 2 := by
    rw [mul_pow, mul_pow, sq_abs]
    have : 0 ≤ Real.exp (-(21 / 20) * s) ^ 2 * Ssum ts U V W ^ 2 := by positivity
    nlinarith
  have hB : (|Ssum ts U V W| * (s / 2 * Real.exp (-(21 / 20) * s))) ^ 2 ≤ (17 / 10) ^ 2 :=
    pow_le_pow_left₀ (by positivity) (hS.trans hXle) 2
  linarith [show ((17 : ℝ) / 10) ^ 2 ≤ 3 by norm_num]

end

end Grothe.UpperChaos
