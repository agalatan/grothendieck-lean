import Grothe.LowerAnalytic.WeightedSchurRows

set_option warningAsError true

/-!
# Tight scalar envelope with the weighted shared gate

The central row weight is the clipped affine minimizer of the uncorrected 08/09 profile.
On each segment the actual saving dominates the chord through its two endpoint savings.
After subtracting the chord the profile is quadratic in the segment parameter, including
the variance term from the two retained squares.

Agent-ID: codex-a7c4
-/

namespace Grothe.Lower.WeightedTight

open LowerAnalytic
structure Segment where
  base : EnvCell
  leftWeight : ℚ
  rightWeight : ℚ
  active : Bool
  massPoint : ℚ

/-- When the uncorrected quadratic in the row weight has curvature, its clipped
minimizer is affine between its crossings of zero and one. -/
private def affineSegments (a b : EnvRow) (c : EnvCell) (active : Bool) : List Segment :=
  let mid := (c.lo+c.hi)/2
  let k := 2 / ε * (a.beta-b.beta)^2
  if k = 0 then [⟨c,c.θ,c.θ,active,mid⟩] else
    let off := (k+a.C-b.C)/(2*k)
    let slope := (b.ell-a.ell)/k
    let weight := fun t ↦ max 0 (min 1 (off+slope*t))
    let t0 := -off/slope
    let t1 := (1-off)/slope
    let inner := if slope = 0 then [] else
      [min t0 t1, max t0 t1].filter fun t ↦ c.lo < t ∧ t < c.hi
    let cuts := [c.lo] ++ inner ++ [c.hi]
    cuts.zipWith (fun l h ↦ ⟨{c with lo := l, hi := h},weight l,weight h,active,mid⟩) cuts.tail

/-- The mass tangent stays at the midpoint of the parent cell after subdivision. -/
def segments (varyOuter : Bool) (c : EnvCell) : List Segment :=
  let mid := (c.lo+c.hi)/2
  if (c.i = 8 ∨ c.i = 9) ∧ (c.j = 8 ∨ c.j = 9) then
    affineSegments TightShared.row8 TightShared.row9 c true
  else if varyOuter then
    match envRowAtPure envRowsTight massS mid c.i, envRowAtPure envRowsTight massS mid c.j with
    | some a, some b => affineSegments a b c false
    | _, _ => []
  else [⟨c,c.θ,c.θ,false,mid⟩]

private def value (a b : EnvRow) (t w d : ℚ) : ℚ :=
  t^2 - 2*((1-w)*a.ell + w*b.ell)*t +
    ((1-w)*a.C + w*b.C - (2/ε)*w*(1-w)*(a.beta-b.beta)^2) - d

/-- The endpoint and midpoint values determine the quadratic in the unit segment parameter. -/
private def segmentCap (a b : EnvRow) (l h w z dl dh : ℚ) : ℚ :=
  let q0 := value a b l w dl
  let q1 := value a b h z dh
  let qm := value a b ((l+h)/2) ((w+z)/2) ((dl+dh)/2)
  let q2 := 2*(q1+q0-2*qm)
  quadMax q0 (q1-q0-q2) q2 0 1

def segmentOK (cap : ℚ) (discountQ : ℚ → ℚ) (s : Segment) : Bool := decide
    (s.base.lo < s.base.hi ∧ 0 ≤ s.leftWeight ∧ s.leftWeight ≤ 1 ∧
      0 ≤ s.rightWeight ∧ s.rightWeight ≤ 1) &&
  if s.active then decide (segmentCap TightShared.row8 TightShared.row9 s.base.lo s.base.hi
    s.leftWeight s.rightWeight (discountQ s.leftWeight) (discountQ s.rightWeight) ≤ cap) else
    let m := s.massPoint
    match envRowAtPure envRowsTight massS m s.base.i, envRowAtPure envRowsTight massS m s.base.j with
    | some a, some b => decide (segmentCap a b s.base.lo s.base.hi s.leftWeight s.rightWeight 0 0 ≤ cap)
    | _, _ => false

private theorem segment_majorant (a b : EnvRow) (l h w z dl dh : ℚ) (x : ℝ)
    (hx0 : 0 ≤ x) (hx1 : x ≤ 1) :
    let t := (1-x)*(l : ℝ)+x*(h : ℝ)
    let θ := (1-x)*(w : ℝ)+x*(z : ℝ)
    t^2 - 2*((1-θ)*a.ell+θ*b.ell)*t +
      ((1-θ)*a.C+θ*b.C-(2/(ε : ℝ))*θ*(1-θ)*(a.beta-b.beta : ℝ)^2) -
      ((1-x)*(dl : ℝ)+x*(dh : ℝ)) ≤ (segmentCap a b l h w z dl dh : ℝ) := by
  let q0 := value a b l w dl
  let q1 := value a b h z dh
  let qm := value a b ((l+h)/2) ((w+z)/2) ((dl+dh)/2)
  let q2 := 2*(q1+q0-2*qm)
  apply le_trans (le_of_eq ?_) (quadVal_le_quadMax q0 (q1-q0-q2) q2 0 1 x
    (by simpa using hx0) (by simpa using hx1))
  dsimp only [q0,q1,q2,qm,value]
  push_cast
  ring

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
variable {V t : ℝ} {Qh v : E}

/-- Both valid rows and a lower bound on their weighted deduction imply the cell cap. -/
private theorem segment_bound {cap : ℚ} (a b : EnvRow) (l h w z dl dh : ℚ) (x : ℝ)
    (hx0 : 0 ≤ x) (hx1 : x ≤ 1) (hv : ‖v‖^2 = 2) (ht : t = (1-x)*(l : ℝ)+x*(h : ℝ))
    (hcap : segmentCap a b l h w z dl dh ≤ cap)
    (d₁ d₂ : ℝ)
    (ha : RowHolds ε a.ell a.beta ((a.C : ℝ)-d₁) V t Qh v)
    (hb : RowHolds ε b.ell b.beta ((b.C : ℝ)-d₂) V t Qh v)
    (hθ0 : 0 ≤ (1-x)*(w : ℝ)+x*(z : ℝ)) (hθ1 : (1-x)*(w : ℝ)+x*(z : ℝ) ≤ 1)
    (hsave : let θ := (1-x)*(w : ℝ)+x*(z : ℝ)
      (1-x)*(dl : ℝ)+x*(dh : ℝ) ≤ (1-θ)*d₁+θ*d₂) : V ≤ (cap : ℝ) := by
  let θ := (1-x)*(w : ℝ)+x*(z : ℝ)
  have he : (0 : ℝ) < ε := by norm_num [ε]
  have mix := (RowHolds.mix he hv ha hb θ hθ0 hθ1).le he.le
  have bound := segment_majorant a b l h w z dl dh x hx0 hx1
  change ((1-x)*(l : ℝ)+x*(h : ℝ))^2 - 2*((1-θ)*a.ell+θ*b.ell)*((1-x)*l+x*h) +
    ((1-θ)*a.C+θ*b.C-(2/(ε : ℝ))*θ*(1-θ)*(a.beta-b.beta : ℝ)^2) - _ ≤ _ at bound
  rw [← ht] at bound
  change _ ≤ (1-θ)*d₁+θ*d₂ at hsave
  apply le_trans _ ((Rat.cast_le (K := ℝ)).mpr hcap)
  linarith only [mix, bound, hsave]

/-- A checked amplitude cover uses any deduction whose chord applies to the actual active rows. -/
theorem profile_bound_of (cells : List Segment) (cap : ℚ) (disc : ℚ → ℚ)
    (hcover : chainTo (fun s : Segment ↦ s.base.lo) (fun s ↦ s.base.hi) 0 (9/10) cells = true ∧
      cells.all (segmentOK cap disc) = true)
    (hv : ‖v‖^2 = 2) (ht0 : 0 ≤ t) (ht1 : t ≤ 9/10)
    (hrows : ∀ k m a, envRowAtPure envRowsTight massS m k = some a → RowOf a V t Qh v)
    (hsave : ∀ s ∈ cells, s.active = true → 0 ≤ s.leftWeight → s.leftWeight ≤ 1 →
      0 ≤ s.rightWeight → s.rightWeight ≤ 1 → ∀ x : ℝ, 0 ≤ x → x ≤ 1 →
      let θ := (1-x)*(s.leftWeight : ℝ)+x*(s.rightWeight : ℝ)
      ∃ d8 d9 : ℝ, (1-x)*(disc s.leftWeight : ℝ)+x*(disc s.rightWeight : ℝ) ≤ (1-θ)*d8+θ*d9 ∧
        RowHolds ε TightShared.row8.ell TightShared.row8.beta ((TightShared.row8.C : ℝ)-d8) V t Qh v ∧
        RowHolds ε TightShared.row9.ell TightShared.row9.beta ((TightShared.row9.C : ℝ)-d9) V t Qh v) :
    V ≤ (cap : ℝ) := by
  obtain ⟨s, hs, hlo, hhi⟩ := chainTo_sound (fun c : Segment ↦ c.base.lo) (fun c ↦ c.base.hi)
    cells 0 (9/10) hcover.1 t (by simpa using ht0) (by push_cast; exact ht1)
  have hc := List.all_eq_true.mp hcover.2 s hs
  obtain ⟨hr,hc⟩ := Bool.and_eq_true_iff.mp hc
  obtain ⟨hspan, hw₀, hw₁, hz₀, hz₁⟩ := of_decide_eq_true hr
  have hspanR : (s.base.lo : ℝ) < s.base.hi := by exact_mod_cast hspan
  have hpos := sub_pos.mpr hspanR
  let x := (t-(s.base.lo : ℝ))/((s.base.hi : ℝ)-s.base.lo)
  have hx0 : 0 ≤ x := div_nonneg (sub_nonneg.mpr hlo) hpos.le
  have hx1 : x ≤ 1 := (div_le_one hpos).mpr (by linarith)
  have ht : t = (1-x)*(s.base.lo : ℝ)+x*(s.base.hi : ℝ) := by
    dsimp [x]
    field_simp [hpos.ne']
    ring
  have h0w : (0 : ℝ) ≤ s.leftWeight := by exact_mod_cast hw₀
  have h1w : (s.leftWeight : ℝ) ≤ 1 := by exact_mod_cast hw₁
  have h0z : (0 : ℝ) ≤ s.rightWeight := by exact_mod_cast hz₀
  have h1z : (s.rightWeight : ℝ) ≤ 1 := by exact_mod_cast hz₁
  let θ := (1-x)*(s.leftWeight : ℝ)+x*(s.rightWeight : ℝ)
  have hθ0 : 0 ≤ θ := add_nonneg (mul_nonneg (sub_nonneg.mpr hx1) h0w) (mul_nonneg hx0 h0z)
  have hθ1 : θ ≤ 1 := by
    have h := add_le_add (mul_le_mul_of_nonneg_left h1w (sub_nonneg.mpr hx1))
      (mul_le_mul_of_nonneg_left h1z hx0)
    simpa [θ] using h
  split at hc
  · rename_i hactive
    have bound := of_decide_eq_true hc
    obtain ⟨d8,d9,hd,H8,H9⟩ := hsave s hs hactive hw₀ hw₁ hz₀ hz₁ x hx0 hx1
    exact segment_bound _ _ _ _ _ _ _ _ x hx0 hx1 hv ht bound d8 d9 H8 H9 hθ0 hθ1 hd
  · cases ha : envRowAtPure envRowsTight massS s.massPoint s.base.i with
    | none => simp [ha] at hc
    | some a =>
      cases hb : envRowAtPure envRowsTight massS s.massPoint s.base.j with
      | none => simp [ha,hb] at hc
      | some b =>
        simp only [ha,hb,decide_eq_true_eq] at hc
        apply segment_bound a b _ _ _ _ 0 0 x hx0 hx1 hv ht hc 0 0
          (by simpa only [sub_zero,RowOf] using hrows _ _ _ ha)
          (by simpa only [sub_zero,RowOf] using hrows _ _ _ hb) hθ0 hθ1
        simp

end Grothe.Lower.WeightedTight
