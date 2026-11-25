import Grothe.Lower.Cert.WeightedTight
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
open SharedGate.WeightedSchur (discount discountQ discount_rat discount_chord)

private structure Segment where
  base : EnvCell
  leftWeight : ℚ
  rightWeight : ℚ
  active : Bool

private def segments (c : EnvCell) : List Segment :=
  if (c.i = 8 ∨ c.i = 9) ∧ (c.j = 8 ∨ c.j = 9) then
    let a := TightShared.row8
    let b := TightShared.row9
    let k := 2 / ε * (a.beta - b.beta)^2
    let off := (k + a.C - b.C) / (2*k)
    let slope := (b.ell - a.ell) / k
    let weight := fun t ↦ max 0 (min 1 (off + slope*t))
    let cuts := [c.lo] ++ ([-off/slope, (1-off)/slope].filter fun t ↦ c.lo < t ∧ t < c.hi) ++ [c.hi]
    cuts.zipWith (fun l h ↦ ⟨{c with lo := l, hi := h}, weight l, weight h, true⟩) cuts.tail
  else [⟨c,c.θ,c.θ,false⟩]

private def cells := envCellsTight.flatMap segments

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

private def segmentOK (s : Segment) : Bool := decide
    (s.base.lo < s.base.hi ∧ 0 ≤ s.leftWeight ∧ s.leftWeight ≤ 1 ∧
      0 ≤ s.rightWeight ∧ s.rightWeight ≤ 1) &&
  if s.active then decide (segmentCap TightShared.row8 TightShared.row9 s.base.lo s.base.hi
    s.leftWeight s.rightWeight (discountQ s.leftWeight) (discountQ s.rightWeight) ≤ cap) else
    let m := (s.base.lo+s.base.hi)/2
    match envRowAtPure envRowsTight massS m s.base.i, envRowAtPure envRowsTight massS m s.base.j with
    | some a, some b => decide (segmentCap a b s.base.lo s.base.hi s.leftWeight s.rightWeight 0 0 ≤ cap)
    | _, _ => false

private theorem cells_ok :
    chainTo (fun s : Segment ↦ s.base.lo) (fun s ↦ s.base.hi) 0 (9/10) cells = true ∧
    cells.all segmentOK = true := by decide +kernel

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
private theorem segment_bound (a b : EnvRow) (l h w z dl dh : ℚ) (x : ℝ)
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

/-- The unchanged tight rows and the weight-dependent joint deductions bound the full profile. -/
theorem profile_bound (hv : ‖v‖^2 = 2) (ht0 : 0 ≤ t) (ht1 : t ≤ 9/10)
    (hrows : ∀ k m a, envRowAtPure envRowsTight massS m k = some a → RowOf a V t Qh v)
    (hsave : ∀ θ : ℝ, 0 ≤ θ → θ ≤ 1 → ∃ d8 d9 : ℝ, discount θ ≤ (1-θ)*d8+θ*d9 ∧
      RowHolds ε TightShared.row8.ell TightShared.row8.beta ((TightShared.row8.C : ℝ)-d8) V t Qh v ∧
      RowHolds ε TightShared.row9.ell TightShared.row9.beta ((TightShared.row9.C : ℝ)-d9) V t Qh v) :
    V ≤ (cap : ℝ) := by
  obtain ⟨s, hs, hlo, hhi⟩ := chainTo_sound (fun c : Segment ↦ c.base.lo) (fun c ↦ c.base.hi)
    cells 0 (9/10) cells_ok.1 t (by simpa using ht0) (by push_cast; exact ht1)
  have hc := List.all_eq_true.mp cells_ok.2 s hs
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
  · have bound := of_decide_eq_true hc
    obtain ⟨d8,d9,hd,H8,H9⟩ := hsave θ hθ0 hθ1
    apply segment_bound _ _ _ _ _ _ _ _ x hx0 hx1 hv ht bound d8 d9 H8 H9 hθ0 hθ1
    have chord := discount_chord h0w h1w h0z h1z hx0 hx1
    rw [discount_rat, discount_rat] at chord
    exact chord.trans hd
  · cases ha : envRowAtPure envRowsTight massS ((s.base.lo+s.base.hi)/2) s.base.i with
    | none => simp [ha] at hc
    | some a =>
      cases hb : envRowAtPure envRowsTight massS ((s.base.lo+s.base.hi)/2) s.base.j with
      | none => simp [ha,hb] at hc
      | some b =>
        simp only [ha,hb,decide_eq_true_eq] at hc
        apply segment_bound a b _ _ _ _ 0 0 x hx0 hx1 hv ht hc 0 0
          (by simpa only [sub_zero,RowOf] using hrows _ _ _ ha)
          (by simpa only [sub_zero,RowOf] using hrows _ _ _ hb) hθ0 hθ1
        simp
end Grothe.Lower.WeightedTight
