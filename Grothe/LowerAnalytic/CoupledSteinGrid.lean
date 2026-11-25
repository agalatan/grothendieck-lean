import Grothe.LowerAnalytic.CoupledSteinCheck
import Mathlib.Tactic.Eval
import Mathlib.Data.Rat.Floor

set_option warningAsError true

/-! # Outward-rounded integer checker for a pair of continuous quadratic row profiles

The grid arithmetic bounds both endpoints and the interior extremum on every closed
overlap. Projection of a row to the grid raises its affine coefficients on nonnegative
scales. Both the curvature and the allowable budget are rounded down.

Agent-ID: codex-a7c4
-/

namespace Grothe.LowerAnalytic.CoupledStein

open Grothe.Lower

namespace Grid

/-- Twenty decimal digits for the outward approximations of the row data and coefficients. -/
def scale : ℤ := 10^20

theorem scale_pos : (0 : ℚ) < scale := by norm_num [scale]

structure Rect where
  shapeLo : ℤ
  shapeHi : ℤ
  lo : ℤ
  hi : ℤ
  a : ℤ
  b : ℤ
  deriving DecidableEq, Repr, Lean.ToExpr

def rect (c : Chord) : Rect :=
  ⟨⌊scale*c.shapeLo⌋, ⌈scale*c.shapeHi⌉, ⌊scale*c.sigmaLo⌋, ⌈scale*c.sigmaHi⌉,
    ⌈scale*c.intercept⌉, ⌈scale*c.slope⌉⟩

structure Price where
  den : ℤ
  w8 : ℤ
  w9 : ℤ
  curvature : ℤ
  budget : ℤ
  deriving DecidableEq, Repr, Lean.ToExpr

def price (w k bound : ℚ) : Price :=
  ⟨w.den, w.den-w.num, w.num, w.den*⌊scale*k⌋, w.den*⌊scale*bound⌋⟩

/-- Minimum of a convex quadratic on the continuous interval in integer-scaled coordinates. -/
def quadratic (c b k l h : ℤ) : Bool :=
  decide (0 < k) &&
  if b ≤ 2*k*l then decide (0 ≤ c-b*l+k*l^2)
  else if 2*k*h ≤ b then decide (0 ≤ c-b*h+k*h^2)
  else decide (b^2 ≤ 4*k*c)

theorem quadratic_sound {c b k l h : ℤ} (hc : quadratic c b k l h)
    {x : ℚ} (hl : l ≤ x) (hh : x ≤ h) : 0 ≤ (c : ℚ) - b*x+k*x^2 := by
  simp only [quadratic, Bool.and_eq_true, decide_eq_true_eq] at hc
  obtain ⟨hk,hs⟩ := hc
  have hk' : (0 : ℚ) < k := by exact_mod_cast hk
  split_ifs at hs with hleft hright
  · have he : (0 : ℚ) ≤ (c : ℚ)-b*l+k*l^2 := by exact_mod_cast of_decide_eq_true hs
    have hb : (b : ℚ) ≤ 2*k*l := by exact_mod_cast hleft
    nlinarith [mul_nonneg (sub_nonneg.mpr hl) (sub_nonneg.mpr hb),
      mul_nonneg hk'.le (sq_nonneg (x-l))]
  · have he : (0 : ℚ) ≤ (c : ℚ)-b*h+k*h^2 := by exact_mod_cast of_decide_eq_true hs
    have hb : 2*(k : ℚ)*h ≤ b := by exact_mod_cast hright
    nlinarith [mul_nonneg (sub_nonneg.mpr hh) (sub_nonneg.mpr hb),
      mul_nonneg hk'.le (sq_nonneg (x-h))]
  · have hv : (b : ℚ)^2 ≤ 4*k*c := by exact_mod_cast of_decide_eq_true hs
    by_contra! hn
    nlinarith [mul_neg_of_pos_of_neg hk' hn, sq_nonneg (2*(k : ℚ)*x-b)]

def meets (l r : Rect) (stop : ℤ) : Bool :=
  decide (max l.shapeLo r.shapeLo ≤ min l.shapeHi r.shapeHi ∧
    max l.lo r.lo ≤ min stop (min l.hi r.hi))

def checks (l r : Rect) (stop : ℤ) (p : Price) : Bool :=
  let a := (p.budget-p.w8*l.a-p.w9*r.a)*scale^2
  let b := (p.w8*l.b+p.w9*r.b)*scale
  decide (0 ≤ max l.lo r.lo) &&
    quadratic a b p.curvature (max l.lo r.lo) (min stop (min l.hi r.hi))

private theorem den_w (w : ℚ) : (w.den : ℚ) * w = w.num := by
  rw [mul_comm]
  exact (eq_div_iff (by exact_mod_cast w.den_ne_zero)).mp (Rat.num_div_den w).symm

/-- Directed rounding raises both affine lines on nonnegative scale, lowers the
curvature and budget, and enlarges the closed interval. -/
theorem checks_sound (l r : Chord) (w k bound s : ℚ) (h0 : 0 ≤ w) (h1 : w ≤ 1)
    {x : ℚ} (hxl : max l.sigmaLo r.sigmaLo ≤ x) (hxh : x ≤ min s (min l.sigmaHi r.sigmaHi))
    (ok : checks (rect l) (rect r) ⌈scale*s⌉ (price w k bound)) :
    (1-w)*l.intercept+w*r.intercept+((1-w)*l.slope+w*r.slope)*x-k*x^2 ≤ bound := by
  let S : ℚ := scale
  let N : ℚ := w.den
  have hS : 0 < S := scale_pos
  have hN : 0 < N := by dsimp [N]; exact_mod_cast w.den_pos
  have hnum : (w.num : ℚ) = N*w := (den_w w).symm
  simp only [checks, Bool.and_eq_true, decide_eq_true_eq] at ok
  obtain ⟨hp,hq⟩ := ok
  have hl : (max (rect l).lo (rect r).lo : ℤ) ≤ S*x := by
    rw [Int.cast_max]
    exact max_le ((Int.floor_le _).trans (mul_le_mul_of_nonneg_left (le_max_left _ _ |>.trans hxl) hS.le))
      ((Int.floor_le _).trans (mul_le_mul_of_nonneg_left (le_max_right _ _ |>.trans hxl) hS.le))
  have hh : S*x ≤ (min ⌈scale*s⌉ (min (rect l).hi (rect r).hi) : ℤ) := by
    push_cast
    exact le_min ((mul_le_mul_of_nonneg_left (hxh.trans (min_le_left _ _)) hS.le).trans (Int.le_ceil _))
      (le_min ((mul_le_mul_of_nonneg_left (hxh.trans ((min_le_right _ _).trans (min_le_left _ _))) hS.le).trans (Int.le_ceil _))
      ((mul_le_mul_of_nonneg_left (hxh.trans ((min_le_right _ _).trans (min_le_right _ _))) hS.le).trans (Int.le_ceil _)))
  have hx : 0 ≤ x := by
    have hr : 0 ≤ max (rect l).lo (rect r).lo := hp
    have h : (0 : ℚ) ≤ S*x := le_trans (by exact_mod_cast hr) hl
    exact nonneg_of_mul_nonneg_right h hS
  have h := quadratic_sound hq hl hh
  simp only [price, Int.cast_mul, Int.cast_sub, Int.cast_add, Int.cast_pow] at h
  change 0 ≤ (N*(⌊S*bound⌋ : ℤ) - ((w.den : ℚ)-w.num)*(rect l).a - (w.num : ℚ)*(rect r).a)*S^2 -
    ((((w.den : ℚ)-w.num)*(rect l).b+(w.num : ℚ)*(rect r).b)*S)*(S*x) +
      (N*(⌊S*k⌋ : ℤ))*(S*x)^2 at h
  change _ = (w.den : ℚ)*w at hnum
  rw [hnum] at h
  have hwa : 0 ≤ N*(1-w) := mul_nonneg hN.le (sub_nonneg.mpr h1)
  have hwb : 0 ≤ N*w := mul_nonneg hN.le h0
  have hp' : 0 ≤ N*⌊S*bound⌋ - N*(1-w)*(rect l).a - N*w*(rect r).a
      -(N*(1-w)*(rect l).b+N*w*(rect r).b)*x + N*⌊S*k⌋*x^2 := by
    apply nonneg_of_mul_nonneg_left (b := S^2) _ (sq_pos_of_pos hS)
    convert h using 1
    dsimp [N]
    ring
  have hA : N*(1-w)*(S*l.intercept)+N*w*(S*r.intercept) ≤
      N*(1-w)*(rect l).a+N*w*(rect r).a :=
    add_le_add (mul_le_mul_of_nonneg_left (Int.le_ceil _) hwa)
      (mul_le_mul_of_nonneg_left (Int.le_ceil _) hwb)
  have hB := mul_le_mul_of_nonneg_right (add_le_add
    (mul_le_mul_of_nonneg_left (Int.le_ceil (S*l.slope)) hwa)
    (mul_le_mul_of_nonneg_left (Int.le_ceil (S*r.slope)) hwb)) hx
  have hC := mul_le_mul_of_nonneg_left (Int.floor_le (S*bound)) hN.le
  have hK := mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_left (Int.floor_le (S*k)) hN.le) (sq_nonneg x)
  change _ ≤ (N*(1-w)*(rect l).b+N*w*(rect r).b)*x at hB
  apply le_of_mul_le_mul_left (a := N*S) _ (mul_pos hN hS)
  linarith only [hp',hA,hB,hC,hK]

private theorem floor_le_ceil {a b : ℚ} (hab : a ≤ b) : ⌊scale*a⌋ ≤ ⌈scale*b⌉ :=
  (Int.floor_mono (mul_le_mul_of_nonneg_left hab scale_pos.le)).trans (Int.floor_le_ceil _)

theorem meets_true {l r : Chord} {s : ℚ}
    (hs : max l.shapeLo r.shapeLo ≤ min l.shapeHi r.shapeHi)
    (hx : max l.sigmaLo r.sigmaLo ≤ min s (min l.sigmaHi r.sigmaHi)) :
    meets (rect l) (rect r) ⌈scale*s⌉ := by
  simp only [meets,rect,decide_eq_true_eq, max_le_iff, le_min_iff] at hs hx ⊢
  repeat' apply And.intro
  all_goals
    apply floor_le_ceil
    tauto

private theorem quadMax_le {a b k lo hi B : ℚ} (hab : lo ≤ hi)
    (h : ∀ x, lo ≤ x → x ≤ hi → a+b*x-k*x^2 ≤ B) :
    quadMax a b (-k) lo hi ≤ B := by
  have hf (x : ℚ) (hl : lo ≤ x) (hh : x ≤ hi) : quadVal a b (-k) x ≤ B := by
    simpa [quadVal, sub_eq_add_neg] using h x hl hh
  have he := max_le (hf lo le_rfl hab) (hf hi hab le_rfl)
  simp only [quadMax]
  split_ifs with _ hv
  · exact max_le he (hf _ hv.1 hv.2)
  · exact he
  · exact he

theorem worst_le {left right : List Chord} {s w k bound : ℚ}
    (h0 : 0 ≤ w) (h1 : w ≤ 1) (hb : 0 ≤ bound)
    (ok : ∀ l ∈ left.map rect, ∀ r ∈ right.map rect, meets l r ⌈scale*s⌉ →
      checks l r ⌈scale*s⌉ (price w k bound)) :
    worst (overlay s left right) w k ≤ bound := by
  let xs := (overlay s left right).map (pieceMax w k)
  change xs.max?.getD 0 ≤ bound
  cases hm : xs.max? with
  | none => exact hb
  | some val =>
    obtain ⟨p,hp,rfl⟩ := List.mem_map.mp (List.max?_mem hm)
    obtain ⟨l,hl,r,hr,hshape,hσ,rfl⟩ := overlay_member hp
    apply quadMax_le hσ
    exact fun x hxl hxh ↦ checks_sound l r w k bound s h0 h1 hxl hxh
      (ok _ (List.mem_map_of_mem hl) _ (List.mem_map_of_mem hr) (meets_true hshape hσ))
structure Group where
  shapeLo : ℤ
  shapeHi : ℤ
  rectangles : List Rect
  deriving DecidableEq, Repr, Lean.ToExpr, Inhabited

def group (c0 : ℚ) (c : AntiSCell) : Group :=
  ⟨⌊scale*c.sLo⌋,⌈scale*c.sHi⌉,(rowChords c0 [c]).map rect⟩

theorem member_group {c0 : ℚ} {cells : List AntiSCell} {l : Rect}
    (hl : l ∈ (rowChords c0 cells).map rect) :
    ∃ g ∈ cells.map (group c0), l ∈ g.rectangles ∧ l.shapeLo = g.shapeLo ∧
      l.shapeHi = g.shapeHi := by
  obtain ⟨a,ha,rfl⟩ := List.mem_map.mp hl
  obtain ⟨c,hc,hn⟩ := List.mem_flatMap.mp ha
  obtain ⟨⟨u,v⟩,huv,rfl⟩ := List.mem_map.mp hn
  exact ⟨_,List.mem_map_of_mem hc,List.mem_map_of_mem
    (fromNodes_mem c0 (by simp : c ∈ [c]) huv),rfl,rfl⟩

def groupCheck (stop : ℤ) (prices : List Price) (left right : Group) : Bool :=
  !decide (max left.shapeLo right.shapeLo ≤ min left.shapeHi right.shapeHi) ||
  left.rectangles.all fun l ↦ right.rectangles.all fun r ↦
    !decide (max l.lo r.lo ≤ min stop (min l.hi r.hi)) || prices.all (checks l r stop)

theorem groupCheck_sound {s : ℤ} {L R : Group} {ps : List Price}
    (h : groupCheck s ps L R) {l r : Rect} (hl : l ∈ L.rectangles) (hr : r ∈ R.rectangles)
    (hl0 : l.shapeLo = L.shapeLo) (hl1 : l.shapeHi = L.shapeHi)
    (hr0 : r.shapeLo = R.shapeLo) (hr1 : r.shapeHi = R.shapeHi)
    (hm : meets l r s) {p : Price} (hp : p ∈ ps) : checks l r s p := by
  simp only [meets, decide_eq_true_eq] at hm
  have he := hm.1
  rw [hl0,hl1,hr0,hr1] at he
  simp only [groupCheck, he, decide_true, Bool.not_true, Bool.false_or, List.all_eq_true] at h
  have ht := h l hl r hr
  simp only [hm.2, decide_true, Bool.not_true, Bool.false_or,List.all_eq_true] at ht
  exact ht p hp

end Grid
end Grothe.LowerAnalytic.CoupledStein
