import Grothe.Lower.Cert.SparseEnvelope
import Grothe.Lower.WeightedTightEnvelope
import Grothe.LowerAnalytic.SparseOuterRows
import Grothe.LowerAnalytic.SparseSteinWeights

set_option warningAsError true

/-!
# Amplitude cover for the two pairs of coupled rows

The mass tangent stays at the midpoint of its parent cell. Rows 06/07 and
08/09 each use their own physical deductions at the two endpoint weights.
The central interval keeps its quadratic curvature gain, and the ordinary
scalar rows 13 and 14 interpolate through their crossover.

Agent-ID: codex-a7c4
-/

namespace Grothe.Lower.SparseEnvelope

open WeightedTight (Segment)
open LowerAnalytic

private def value (a b : EnvRow) (t w d : ℚ) : ℚ :=
  t^2 - 2*((1-w)*a.ell + w*b.ell)*t +
    ((1-w)*a.C + w*b.C - (2/ε)*w*(1-w)*(a.beta-b.beta)^2) - d

/-- The endpoint and midpoint values determine the quadratic in the unit segment parameter. -/
def segmentCap (a b : EnvRow) (l h w z dl dh bonus : ℚ) : ℚ :=
  let q0 := value a b l w dl
  let q1 := value a b h z dh
  let qm := value a b ((l+h)/2) ((w+z)/2) ((dl+dh)/2+bonus/4)
  let q2 := 2*(q1+q0-2*qm)
  quadMax q0 (q1-q0-q2) q2 0 1

private theorem segment_majorant (a b : EnvRow) (l h w z dl dh bonus : ℚ) (x : ℝ)
    (hx0 : 0 ≤ x) (hx1 : x ≤ 1) :
    let t := (1-x)*(l : ℝ)+x*(h : ℝ)
    let θ := (1-x)*(w : ℝ)+x*(z : ℝ)
    t^2 - 2*((1-θ)*a.ell+θ*b.ell)*t +
      ((1-θ)*a.C+θ*b.C-(2/(ε : ℝ))*θ*(1-θ)*(a.beta-b.beta : ℝ)^2) -
      ((1-x)*(dl : ℝ)+x*(dh : ℝ)+(bonus:ℝ)*x*(1-x)) ≤ (segmentCap a b l h w z dl dh bonus : ℝ) := by
  let q0 := value a b l w dl
  let q1 := value a b h z dh
  let qm := value a b ((l+h)/2) ((w+z)/2) ((dl+dh)/2+bonus/4)
  let q2 := 2*(q1+q0-2*qm)
  apply le_trans (le_of_eq ?_) (quadVal_le_quadMax q0 (q1-q0-q2) q2 0 1 x
    (by simpa using hx0) (by simpa using hx1))
  dsimp only [q0,q1,q2,qm,value]
  push_cast
  ring

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
variable {V t : ℝ} {Qh v : E}

/-- Both valid rows and a lower bound on their weighted deduction imply the cell cap. -/
theorem segment_bound {cap : ℚ} (a b : EnvRow) (l h w z dl dh bonus : ℚ) (x : ℝ)
    (hx0 : 0 ≤ x) (hx1 : x ≤ 1) (hv : ‖v‖^2 = 2) (ht : t = (1-x)*(l : ℝ)+x*(h : ℝ))
    (hcap : segmentCap a b l h w z dl dh bonus ≤ cap)
    (d₁ d₂ : ℝ)
    (ha : RowHolds ε a.ell a.beta ((a.C : ℝ)-d₁) V t Qh v)
    (hb : RowHolds ε b.ell b.beta ((b.C : ℝ)-d₂) V t Qh v)
    (hθ0 : 0 ≤ (1-x)*(w : ℝ)+x*(z : ℝ)) (hθ1 : (1-x)*(w : ℝ)+x*(z : ℝ) ≤ 1)
    (hsave : let θ := (1-x)*(w : ℝ)+x*(z : ℝ)
      (1-x)*(dl : ℝ)+x*(dh : ℝ)+(bonus:ℝ)*x*(1-x) ≤ (1-θ)*d₁+θ*d₂) : V ≤ (cap : ℝ) := by
  let θ := (1-x)*(w : ℝ)+x*(z : ℝ)
  have he : (0 : ℝ) < ε := by norm_num [ε]
  have mix := (RowHolds.mix he hv ha hb θ hθ0 hθ1).le he.le
  have bound := segment_majorant a b l h w z dl dh bonus x hx0 hx1
  change ((1-x)*(l : ℝ)+x*(h : ℝ))^2 - 2*((1-θ)*a.ell+θ*b.ell)*((1-x)*l+x*h) +
    ((1-θ)*a.C+θ*b.C-(2/(ε : ℝ))*θ*(1-θ)*(a.beta-b.beta : ℝ)^2) - _ ≤ _ at bound
  rw [← ht] at bound
  change _ ≤ (1-θ)*d₁+θ*d₂ at hsave
  apply le_trans _ ((Rat.cast_le (K := ℝ)).mpr hcap)
  linarith only [mix, bound, hsave]

/-- Split the binding central interval along its affine weight path.
The mass tangent and both endpoint weights are inherited from its parent. -/
private def refineCentral (s : Segment) : List Segment :=
  if s.base.lo = 3429/4096 ∧ s.base.hi = 8577/10240 then
    let t := (s.base.lo+s.base.hi)/2
    let w := (s.leftWeight+s.rightWeight)/2
    [{s with base := {s.base with hi := t}, rightWeight := w},
     {s with base := {s.base with lo := t}, leftWeight := w}]
  else [s]

private def segments (c : EnvCell) : List Segment :=
  if (c.i = 6 ∨ c.i = 7) ∧ (c.j = 6 ∨ c.j = 7) then
    WeightedTight.affineSegments row06.env row07.env {c with i := 6, j := 7} true
  else if (c.i = 8 ∨ c.i = 9) ∧ (c.j = 8 ∨ c.j = 9) then
    (WeightedTight.affineSegments TightShared.row8 TightShared.row9 {c with i := 8, j := 9} true).flatMap refineCentral
  else if c.i = 13 ∧ c.j = 13 then WeightedTight.segments true {c with j := 14}
  else WeightedTight.segments true c

private def cells := envCellsTight.flatMap segments

private def valid (s : Segment) : Bool :=
  if !s.active then WeightedTight.segmentOK Midpoint.cap SparseStein.price s
  else if s.base.i = 6 then
    decide (s.base.lo < s.base.hi) &&
    SparseOuter.priceOK s.leftWeight && SparseOuter.priceOK s.rightWeight &&
    decide (WeightedTight.segmentCap row06.env row07.env s.base.lo s.base.hi
      s.leftWeight s.rightWeight (SparseOuter.price s.leftWeight) (SparseOuter.price s.rightWeight) ≤ Midpoint.cap)
  else decide (segmentCap TightShared.row8 TightShared.row9 s.base.lo s.base.hi s.leftWeight s.rightWeight
    (SparseStein.price s.leftWeight) (SparseStein.price s.rightWeight)
    (SparseStein.bonus s.leftWeight s.rightWeight) ≤ Midpoint.cap) &&
    decide (s.leftWeight ∈ SparseStein.prices.map Prod.fst ∧
      s.rightWeight ∈ SparseStein.prices.map Prod.fst)

private theorem checks :
    chainTo (fun s : Segment ↦ s.base.lo) (fun s ↦ s.base.hi) 0 (9/10) cells = true ∧
    cells.all valid = true ∧ cells.all (fun s ↦ decide (s.base.lo < s.base.hi ∧
      0 ≤ s.leftWeight ∧ s.leftWeight ≤ 1 ∧ 0 ≤ s.rightWeight ∧ s.rightWeight ≤ 1)) = true := by
  decide +kernel

/-- The physical 06/07 deductions and a certified central pair of deductions close the cover. -/
theorem midpoint_profile_bound {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {V t : ℝ} {Qh v : E} (hv : ‖v‖^2 = 2) (ht₀ : 0 ≤ t) (ht₁ : t ≤ 9/10)
    (hred : CircularSharedReduction rowData V t Qh v)
    (hrows : ∀ k m a, envRowAtPure envRowsTight massS m k = some a → RowOf a V t Qh v)
    (hcentral : ∀ w z : ℚ, w ∈ SparseStein.prices.map Prod.fst →
      z ∈ SparseStein.prices.map Prod.fst → 0 ≤ w → w ≤ 1 → 0 ≤ z → z ≤ 1 →
      ∀ {x : ℝ}, 0 ≤ x → x ≤ 1 →
      let θ := (1-x)*(w : ℝ)+x*(z : ℝ)
      ∃ d8 d9 : ℝ, (1-x)*(SparseStein.price w : ℝ)+x*(SparseStein.price z : ℝ)+
        (SparseStein.bonus w z : ℝ)*x*(1-x) ≤ (1-θ)*d8+θ*d9 ∧
      RowHolds ε TightShared.row8.ell TightShared.row8.beta ((TightShared.row8.C : ℝ)-d8) V t Qh v ∧
      RowHolds ε TightShared.row9.ell TightShared.row9.beta ((TightShared.row9.C : ℝ)-d9) V t Qh v) :
    V ≤ (Midpoint.cap : ℝ) := by
  obtain ⟨s, hs, hlo, hhi⟩ := chainTo_sound (fun c : Segment ↦ c.base.lo) (fun c ↦ c.base.hi)
    cells 0 (9/10) checks.1 t (by simpa using ht₀) (by push_cast; exact ht₁)
  have hc := List.all_eq_true.mp checks.2.1 s hs
  obtain ⟨hspan,hw₀,hw₁,hz₀,hz₁⟩ := of_decide_eq_true (List.all_eq_true.mp checks.2.2 s hs)
  have hspanR : (s.base.lo : ℝ) < s.base.hi := by exact_mod_cast hspan
  have hpos := sub_pos.mpr hspanR
  let x := (t-(s.base.lo : ℝ))/((s.base.hi : ℝ)-s.base.lo)
  have hx₀ : 0 ≤ x := div_nonneg (sub_nonneg.mpr hlo) hpos.le
  have hx₁ : x ≤ 1 := (div_le_one hpos).mpr (by linarith)
  have ht : t = (1-x)*(s.base.lo : ℝ)+x*(s.base.hi : ℝ) := by
    dsimp [x]
    field_simp [hpos.ne']
    ring
  let θ := (1-x)*(s.leftWeight : ℝ)+x*(s.rightWeight : ℝ)
  have hθ₀ : 0 ≤ θ := add_nonneg (mul_nonneg (sub_nonneg.mpr hx₁) (Rat.cast_nonneg.mpr hw₀))
    (mul_nonneg hx₀ (Rat.cast_nonneg.mpr hz₀))
  have hw : (s.leftWeight : ℝ) ≤ 1 := by exact_mod_cast hw₁
  have hz : (s.rightWeight : ℝ) ≤ 1 := by exact_mod_cast hz₁
  have hθ₁ : θ ≤ 1 := by
    simpa [θ] using add_le_add (mul_le_mul_of_nonneg_left hw (sub_nonneg.mpr hx₁))
      (mul_le_mul_of_nonneg_left hz hx₀)
  cases hactive : s.active with
  | true =>
    by_cases outer : s.base.i = 6
    · simp only [valid,hactive,Bool.not_true,Bool.false_eq_true,ite_false,outer,ite_true,
        Bool.and_eq_true,decide_eq_true_eq] at hc
      obtain ⟨⟨⟨_,hpw⟩,hpz⟩,hcap⟩ := hc
      obtain ⟨d6,d7,hdis,h6,h7⟩ := SparseOuter.actual_deductions hred _ _ hpw hpz hx₀ hx₁
      exact WeightedTight.segment_bound _ _ _ _ _ _ _ _ x hx₀ hx₁ hv ht hcap d6 d7 h6 h7 hθ₀ hθ₁ hdis
    · simp only [valid,hactive,Bool.not_true,Bool.false_eq_true,ite_false,outer,
        Bool.and_eq_true,decide_eq_true_eq] at hc
      obtain ⟨hcap,hw',hz'⟩ := hc
      obtain ⟨d8,d9,hdis,h8,h9⟩ := hcentral _ _ hw' hz' hw₀ hw₁ hz₀ hz₁ hx₀ hx₁
      exact segment_bound _ _ _ _ _ _ _ _ _ x hx₀ hx₁ hv ht hcap d8 d9 h8 h9 hθ₀ hθ₁ hdis
  | false =>
    simp only [valid,hactive,Bool.not_false,ite_true,WeightedTight.segmentOK,Bool.false_eq_true,
      ite_false,Bool.and_eq_true,decide_eq_true_eq] at hc
    obtain ⟨_,hc⟩ := hc
    cases ha : envRowAtPure envRowsTight massS s.massPoint s.base.i with
    | none => simp [ha] at hc
    | some a =>
      cases hb : envRowAtPure envRowsTight massS s.massPoint s.base.j with
      | none => simp [ha,hb] at hc
      | some b =>
        simp only [ha,hb,decide_eq_true_eq] at hc
        apply WeightedTight.segment_bound a b _ _ _ _ 0 0 x hx₀ hx₁ hv ht hc 0 0
          (by simpa only [sub_zero,RowOf] using hrows _ _ _ ha)
          (by simpa only [sub_zero,RowOf] using hrows _ _ _ hb) hθ₀ hθ₁
        simp

/-- The original nine-price bound follows by weakening the refined cap. -/
theorem profile_bound {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {V t : ℝ} {Qh v : E} (hv : ‖v‖^2 = 2) (ht₀ : 0 ≤ t) (ht₁ : t ≤ 9/10)
    (hred : CircularSharedReduction rowData V t Qh v)
    (hrows : ∀ k m a, envRowAtPure envRowsTight massS m k = some a → RowOf a V t Qh v)
    (hcentral : ∀ w z : ℚ, w ∈ SparseStein.prices.map Prod.fst →
      z ∈ SparseStein.prices.map Prod.fst → 0 ≤ w → w ≤ 1 → 0 ≤ z → z ≤ 1 →
      ∀ {x : ℝ}, 0 ≤ x → x ≤ 1 →
      let θ := (1-x)*(w : ℝ)+x*(z : ℝ)
      ∃ d8 d9 : ℝ, (1-x)*(SparseStein.price w : ℝ)+x*(SparseStein.price z : ℝ)+
        (SparseStein.bonus w z : ℝ)*x*(1-x) ≤ (1-θ)*d8+θ*d9 ∧
      RowHolds ε TightShared.row8.ell TightShared.row8.beta ((TightShared.row8.C : ℝ)-d8) V t Qh v ∧
      RowHolds ε TightShared.row9.ell TightShared.row9.beta ((TightShared.row9.C : ℝ)-d9) V t Qh v) :
    V ≤ (cap : ℝ) :=
  (midpoint_profile_bound hv ht₀ ht₁ hred hrows hcentral).trans (Rat.cast_le.mpr Midpoint.cap_le)

end Grothe.Lower.SparseEnvelope
