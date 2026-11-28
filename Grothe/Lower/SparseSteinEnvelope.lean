import Grothe.Lower.Cert.SparseEnvelope
import Grothe.Lower.WeightedTightEnvelope
import Grothe.LowerAnalytic.SparseOuterRows
import Grothe.LowerAnalytic.SparseSteinWeights
import Mathlib.Analysis.Real.Pi.Bounds

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

private def value (a b : EnvRow) (t w d tilt : ℚ) : ℚ :=
  t^2 - 2*((1-w)*a.ell + w*b.ell)*t +
    ((1-w)*a.C + w*b.C - (2/ε)*w*(1-w)*(a.beta-b.beta)^2) - d + tilt*t^2

/-- The endpoint and midpoint values determine the quadratic in the unit segment parameter. -/
def segmentCap (a b : EnvRow) (l h w z dl dh bonus : ℚ) (tilt : ℚ := 0) : ℚ :=
  let q0 := value a b l w dl tilt
  let q1 := value a b h z dh tilt
  let qm := value a b ((l+h)/2) ((w+z)/2) ((dl+dh)/2+bonus/4) tilt
  let q2 := 2*(q1+q0-2*qm)
  quadMax q0 (q1-q0-q2) q2 0 1

private theorem segment_majorant (a b : EnvRow) (l h w z dl dh bonus tilt : ℚ) (x : ℝ)
    (hx0 : 0 ≤ x) (hx1 : x ≤ 1) :
    let t := (1-x)*(l : ℝ)+x*(h : ℝ)
    let θ := (1-x)*(w : ℝ)+x*(z : ℝ)
    t^2 - 2*((1-θ)*a.ell+θ*b.ell)*t +
      ((1-θ)*a.C+θ*b.C-(2/(ε : ℝ))*θ*(1-θ)*(a.beta-b.beta : ℝ)^2) -
      ((1-x)*(dl : ℝ)+x*(dh : ℝ)+(bonus:ℝ)*x*(1-x)) + (tilt:ℝ)*t^2 ≤ (segmentCap a b l h w z dl dh bonus tilt : ℝ) := by
  let q0 := value a b l w dl tilt
  let q1 := value a b h z dh tilt
  let qm := value a b ((l+h)/2) ((w+z)/2) ((dl+dh)/2+bonus/4) tilt
  let q2 := 2*(q1+q0-2*qm)
  apply le_trans (le_of_eq ?_) (quadVal_le_quadMax q0 (q1-q0-q2) q2 0 1 x
    (by simpa using hx0) (by simpa using hx1))
  dsimp only [q0,q1,q2,qm,value]
  push_cast
  ring

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
variable {V t : ℝ} {Qh v : E}

/-- Both valid rows and a lower bound on their weighted deduction imply the cell cap. -/
theorem tilted_segment_bound {cap tilt : ℚ} (a b : EnvRow) (l h w z dl dh bonus : ℚ) (x : ℝ)
    (hx0 : 0 ≤ x) (hx1 : x ≤ 1) (hv : ‖v‖^2 = 2) (ht : t = (1-x)*(l : ℝ)+x*(h : ℝ))
    (hcap : segmentCap a b l h w z dl dh bonus tilt ≤ cap)
    (d₁ d₂ : ℝ)
    (ha : RowHolds ε a.ell a.beta ((a.C : ℝ)-d₁) V t Qh v)
    (hb : RowHolds ε b.ell b.beta ((b.C : ℝ)-d₂) V t Qh v)
    (hθ0 : 0 ≤ (1-x)*(w : ℝ)+x*(z : ℝ)) (hθ1 : (1-x)*(w : ℝ)+x*(z : ℝ) ≤ 1)
    (hsave : let θ := (1-x)*(w : ℝ)+x*(z : ℝ)
      (1-x)*(dl : ℝ)+x*(dh : ℝ)+(bonus:ℝ)*x*(1-x) ≤ (1-θ)*d₁+θ*d₂) : V+(tilt:ℝ)*t^2 ≤ (cap : ℝ) := by
  let θ := (1-x)*(w : ℝ)+x*(z : ℝ)
  have he : (0 : ℝ) < ε := by norm_num [ε]
  have mix := (RowHolds.mix he hv ha hb θ hθ0 hθ1).le he.le
  have bound := segment_majorant a b l h w z dl dh bonus tilt x hx0 hx1
  change ((1-x)*(l : ℝ)+x*(h : ℝ))^2 - 2*((1-θ)*a.ell+θ*b.ell)*((1-x)*l+x*h) +
    ((1-θ)*a.C+θ*b.C-(2/(ε : ℝ))*θ*(1-θ)*(a.beta-b.beta : ℝ)^2) - _ + (tilt:ℝ)*((1-x)*(l:ℝ)+x*(h:ℝ))^2 ≤ _ at bound
  rw [← ht] at bound
  change _ ≤ (1-θ)*d₁+θ*d₂ at hsave
  apply le_trans _ ((Rat.cast_le (K := ℝ)).mpr hcap)
  linarith only [mix, bound, hsave]

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
  simpa using tilted_segment_bound (tilt := 0) a b l h w z dl dh bonus x
    hx0 hx1 hv ht hcap d₁ d₂ ha hb hθ0 hθ1 hsave

/-- Insert an interior amplitude on the segment's affine path. The inherited
mass point is the one used to prove the parent row. -/
def splitAtAmplitude (t : ℚ) (s : Segment) : List Segment :=
  if s.base.lo < t ∧ t < s.base.hi then
    let x := (t - s.base.lo) / (s.base.hi - s.base.lo)
    let w := (1 - x) * s.leftWeight + x * s.rightWeight
    [{s with base := {s.base with hi := t}, rightWeight := w},
     {s with base := {s.base with lo := t}, leftWeight := w}]
  else [s]

/-- The first and last refinements are midpoints of the two binding central
pieces. The four additional ordinates resolve the maximum inside cell 23. -/
private def refineCentral (s : Segment) : List Segment :=
  let midpoint := (s.base.lo + s.base.hi) / 2
  if s.base.lo = 3429/4096 ∧ s.base.hi = 8577/10240 then
    let knots : List ℚ := [midpoint, 837431408/10^9, 837436036/10^9,
      837437149/10^9, 837447529/10^9]
    knots.foldl (fun pieces t ↦ pieces.flatMap (splitAtAmplitude t)) [s]
  else if s.base.lo = 4293/5120 ∧ s.leftWeight < s.rightWeight then
    splitAtAmplitude midpoint s
  else [s]

def segments (c : EnvCell) : List Segment :=
  if (c.i = 6 ∨ c.i = 7) ∧ (c.j = 6 ∨ c.j = 7) then
    WeightedTight.affineSegments row06.env row07.env {c with i := 6, j := 7} true
  else if (c.i = 8 ∨ c.i = 9) ∧ (c.j = 8 ∨ c.j = 9) then
    (WeightedTight.affineSegments TightShared.row8 TightShared.row9 {c with i := 8, j := 9} true).flatMap refineCentral
  else if c.i = 13 ∧ c.j = 13 then WeightedTight.segments true {c with j := 14}
  else WeightedTight.segments true c

/-- Refine two central segments and cut the final scalar crossover at the high-arm switch. -/
private def cells :=
  ([((8577/10240+17163/20480)/2),83835/100000,886151109950/10^12] : List ℚ).foldl
    (fun xs t ↦ xs.flatMap (splitAtAmplitude t)) (envCellsTight.flatMap segments)

/-- Rational upper bound for the mean radius of a proper standard complex Gaussian. -/
def meanUpper : ℚ := 886227/1000000

/-- A physical scale test on a whole amplitude cell, including its lower endpoint. -/
def ScaleChecked (l : ℚ) (band : SparseStein.ScaleBand) : Prop :=
  band = .whole ∨ 0 ≤ band.stop ∧
    2*(2129/2166)*meanUpper*((2167/2166)*meanUpper-l)*row08.delta^2 ≤ band.stop^2

instance (l : ℚ) (band : SparseStein.ScaleBand) : Decidable (ScaleChecked l band) := by
  unfold ScaleChecked
  infer_instance

theorem scale_le_of_checked {l : ℚ} {t τ : ℝ} {band : SparseStein.ScaleBand}
    (hc : ScaleChecked l band) (hl : (l : ℝ) ≤ t)
    (hτ : 0 ≤ τ) (h93 : τ ≤ 93/100) (hphys : physicalScale t τ) :
    (row08.delta : ℝ)*τ ≤ band.stop := by
  have hd : (0 : ℝ) < row08.delta := Rat.cast_pos.mpr (by decide +kernel)
  rcases hc with rfl | ⟨hstop,hcut⟩
  · simpa [SparseStein.ScaleBand.stop] using mul_le_mul_of_nonneg_left h93 hd.le
  · let μ := Real.sqrt Real.pi / 2
    have hm0 : 0 < μ := by dsimp [μ]; positivity
    have hm : μ ≤ (meanUpper : ℝ) := by
      have hs : Real.sqrt Real.pi ≤ 2*(meanUpper : ℝ) := by
        apply Real.sqrt_le_iff.mpr
        constructor
        · norm_num [meanUpper]
        · norm_num [meanUpper]
          linarith [Real.pi_lt_d6]
      dsimp [μ]
      linarith
    let A : ℝ := 2167/2166
    let C : ℝ := 2129/2166
    have hA : 0 ≤ A := by norm_num [A]
    have hC : 0 < C := by norm_num [C]
    have hp : τ^2 ≤ 2*(μ*C)*(A*μ-t) := by
      have h := hphys.2 (1/19)
      norm_num [PhysicalRice.riceIntercept,PhysicalRice.riceSlope] at h
      dsimp [A,C,μ]
      nlinarith only [h]
    have hmt : 0 ≤ A*μ-t := nonneg_of_mul_nonneg_right ((sq_nonneg τ).trans hp) (by positivity)
    have hprod : 2*(μ*C)*(A*μ-t) ≤ 2*((meanUpper:ℝ)*C)*(A*meanUpper-l) :=
      mul_le_mul (mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_right hm hC.le) (by norm_num))
        (sub_le_sub (mul_le_mul_of_nonneg_left hm hA) hl) hmt
        (mul_nonneg (by norm_num) (mul_nonneg (hm0.le.trans hm) hC.le))
    have hclosed : 2*((meanUpper:ℝ)*C)*(A*meanUpper-l)*(row08.delta:ℝ)^2 ≤ (band.stop:ℝ)^2 := by
      have h := (Rat.cast_le (K := ℝ)).mpr hcut
      push_cast at h
      dsimp [A,C]
      nlinarith only [h]
    have hh := (mul_le_mul_of_nonneg_right (hp.trans hprod) (sq_nonneg (row08.delta : ℝ))).trans hclosed
    have hs : (0 : ℝ) ≤ band.stop := Rat.cast_nonneg.mpr hstop
    apply (sq_le_sq₀ (mul_nonneg hd.le hτ) hs).mp
    simpa only [mul_pow, mul_comm] using hh

def splitAmplitude : ℚ := 886151109950/10^12

def riceBand (l : ℚ) : SparseStein.ScaleBand :=
  if 8559/10240 ≤ l ∧ l < 2151/2560 then
    (SparseStein.ScaleBand.restricted.find? (fun band ↦ decide (ScaleChecked l band))).getD .whole
  else .whole

private def valid (bandAt : ℚ → SparseStein.ScaleBand) (tilt limit : ℚ) (s : Segment) : Bool :=
  if !s.active then
    match envRowAtPure envRowsTight massS s.massPoint s.base.i,
        envRowAtPure envRowsTight massS s.massPoint s.base.j with
    | some a, some b => decide (segmentCap a b s.base.lo s.base.hi s.leftWeight s.rightWeight 0 0 0 tilt ≤ limit)
    | _, _ => false
  else if s.base.i = 6 then
    decide (s.base.lo < s.base.hi) &&
    SparseOuter.priceOK s.leftWeight && SparseOuter.priceOK s.rightWeight &&
    decide (segmentCap row06.env row07.env s.base.lo s.base.hi
      s.leftWeight s.rightWeight (SparseOuter.price s.leftWeight) (SparseOuter.price s.rightWeight) 0 tilt ≤ limit)
  else decide (segmentCap TightShared.row8 TightShared.row9 s.base.lo s.base.hi s.leftWeight s.rightWeight
    ((bandAt s.base.lo).lookup s.leftWeight) ((bandAt s.base.lo).lookup s.rightWeight)
    ((bandAt s.base.lo).curvatureBonus s.leftWeight s.rightWeight) tilt ≤ limit) &&
    decide (ScaleChecked s.base.lo (bandAt s.base.lo)) &&
    decide (s.leftWeight ∈ (bandAt s.base.lo).table.map Prod.fst ∧
      s.rightWeight ∈ (bandAt s.base.lo).table.map Prod.fst)

private theorem checks :
    chainTo (fun s : Segment ↦ s.base.lo) (fun s ↦ s.base.hi) 0 (9/10) cells = true ∧
    cells.all (valid (fun _ ↦ .whole) 0 cap) = true ∧ cells.all (fun s ↦ decide (s.base.lo < s.base.hi ∧
      0 ≤ s.leftWeight ∧ s.leftWeight ≤ 1 ∧ 0 ≤ s.rightWeight ∧ s.rightWeight ≤ 1)) = true := by
  decide +kernel

/-- The two physical central row inequalities with their joint, interpolated price. -/
def CentralDeductions {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (V t : ℝ) (Qh v : E) (band : SparseStein.ScaleBand := .whole) : Prop :=
  ∀ w z : ℚ, w ∈ band.table.map Prod.fst →
      z ∈ band.table.map Prod.fst → 0 ≤ w → w ≤ 1 → 0 ≤ z → z ≤ 1 →
      ∀ {x : ℝ}, 0 ≤ x → x ≤ 1 →
      let θ := (1-x)*(w : ℝ)+x*(z : ℝ)
      ∃ d8 d9 : ℝ, (1-x)*(band.lookup w : ℝ)+x*(band.lookup z : ℝ)+
        (band.curvatureBonus w z : ℝ)*x*(1-x) ≤ (1-θ)*d8+θ*d9 ∧
      RowHolds ε TightShared.row8.ell TightShared.row8.beta ((TightShared.row8.C : ℝ)-d8) V t Qh v ∧
      RowHolds ε TightShared.row9.ell TightShared.row9.beta ((TightShared.row9.C : ℝ)-d9) V t Qh v

private theorem profile_chain (chain : List Segment)
    (hchain : chainTo (fun s : Segment ↦ s.base.lo) (fun s ↦ s.base.hi) 0 (9/10) chain = true)
    (hweights : chain.all (fun s ↦ decide (s.base.lo < s.base.hi ∧
      0 ≤ s.leftWeight ∧ s.leftWeight ≤ 1 ∧ 0 ≤ s.rightWeight ∧ s.rightWeight ≤ 1)) = true)
    (bandAt : ℚ → SparseStein.ScaleBand) {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {V t : ℝ} {Qh v : E} (hv : ‖v‖^2 = 2) (ht₀ : 0 ≤ t) (ht₁ : t ≤ 9/10)
    (hred : CircularSharedReduction rowData V t Qh v)
    (hrows : ∀ k m a, envRowAtPure envRowsTight massS m k = some a → RowOf a V t Qh v)
    (hcentral : ∀ l : ℚ, (l : ℝ) ≤ t → ScaleChecked l (bandAt l) → CentralDeductions V t Qh v (bandAt l)) :
    ∃ s ∈ chain, (s.base.lo : ℝ) ≤ t ∧ ∀ tilt limit : ℚ, valid bandAt tilt limit s = true → V+(tilt:ℝ)*t^2 ≤ (limit:ℝ) := by
  obtain ⟨s, hs, hlo, hhi⟩ := chainTo_sound (fun c : Segment ↦ c.base.lo) (fun c ↦ c.base.hi)
    chain 0 (9/10) hchain t (by simpa using ht₀) (by push_cast; exact ht₁)
  refine ⟨s, hs, hlo, ?_⟩
  intro tilt limit hc
  obtain ⟨hspan,hw₀,hw₁,hz₀,hz₁⟩ := of_decide_eq_true (List.all_eq_true.mp hweights s hs)
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
      exact tilted_segment_bound _ _ _ _ _ _ _ _ 0 x hx₀ hx₁ hv ht hcap d6 d7 h6 h7 hθ₀ hθ₁ (by simpa using hdis)
    · simp only [valid,hactive,Bool.not_true,Bool.false_eq_true,ite_false,outer,
        Bool.and_eq_true,decide_eq_true_eq] at hc
      obtain ⟨⟨hcap,hcut⟩,hw',hz'⟩ := hc
      obtain ⟨d8,d9,hdis,h8,h9⟩ := hcentral s.base.lo hlo hcut _ _ hw' hz' hw₀ hw₁ hz₀ hz₁ hx₀ hx₁
      exact tilted_segment_bound _ _ _ _ _ _ _ _ _ x hx₀ hx₁ hv ht hcap d8 d9 h8 h9 hθ₀ hθ₁ hdis
  | false =>
    simp only [valid,hactive,Bool.not_false,ite_true] at hc
    cases ha : envRowAtPure envRowsTight massS s.massPoint s.base.i with
    | none => simp [ha] at hc
    | some a =>
      cases hb : envRowAtPure envRowsTight massS s.massPoint s.base.j with
      | none => simp [ha,hb] at hc
      | some b =>
        simp only [ha,hb,decide_eq_true_eq] at hc
        apply tilted_segment_bound a b _ _ _ _ 0 0 0 x hx₀ hx₁ hv ht hc 0 0
          (by simpa only [sub_zero,RowOf] using hrows _ _ _ ha)
          (by simpa only [sub_zero,RowOf] using hrows _ _ _ hb) hθ₀ hθ₁
        simp

private theorem profile_cell (bandAt : ℚ → SparseStein.ScaleBand) {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {V t : ℝ} {Qh v : E} (hv : ‖v‖^2 = 2) (ht₀ : 0 ≤ t) (ht₁ : t ≤ 9/10)
    (hred : CircularSharedReduction rowData V t Qh v)
    (hrows : ∀ k m a, envRowAtPure envRowsTight massS m k = some a → RowOf a V t Qh v)
    (hcentral : ∀ l : ℚ, (l : ℝ) ≤ t → ScaleChecked l (bandAt l) → CentralDeductions V t Qh v (bandAt l)) :
    ∃ s ∈ cells, (s.base.lo : ℝ) ≤ t ∧ ∀ tilt limit : ℚ, valid bandAt tilt limit s = true → V+(tilt:ℝ)*t^2 ≤ (limit:ℝ) :=
  profile_chain cells checks.1 checks.2.2 bandAt hv ht₀ ht₁ hred hrows hcentral

/-- The physical 06/07 deductions and a certified central pair of deductions close the cover. -/
theorem profile_bound {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {V t : ℝ} {Qh v : E} (hv : ‖v‖^2 = 2) (ht₀ : 0 ≤ t) (ht₁ : t ≤ 9/10)
    (hred : CircularSharedReduction rowData V t Qh v)
    (hrows : ∀ k m a, envRowAtPure envRowsTight massS m k = some a → RowOf a V t Qh v)
    (hcentral : CentralDeductions V t Qh v) : V ≤ (cap : ℝ) := by
  obtain ⟨s, hs, _, bound⟩ := profile_cell (fun _ ↦ .whole) hv ht₀ ht₁ hred hrows (fun _ _ _ ↦ hcentral)
  simpa using bound 0 cap (List.all_eq_true.mp checks.2.1 s hs)

/-- Price the extra first-chaos term in the same quadratic as each row mixture. -/
def mixedCheck (a b c budget : ℚ) (bandAt : ℚ → SparseStein.ScaleBand := fun _ ↦ .whole) : Bool :=
  cells.all (valid bandAt (b/a) ((budget-c)/a))

/-- The same physical phase pair obeys the sparse rows and pays the additional
amplitude cost, including an interior quadratic maximum on any segment. -/
theorem mixed_profile_bound_band (bandAt : ℚ → SparseStein.ScaleBand) (a b c budget : ℚ) (ha : 0 < a)
    (check : mixedCheck a b c budget bandAt = true) {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {V t : ℝ} {Qh v : E} (hv : ‖v‖^2 = 2) (ht₀ : 0 ≤ t) (ht₁ : t ≤ 9/10)
    (hred : CircularSharedReduction rowData V t Qh v)
    (hrows : ∀ k m a, envRowAtPure envRowsTight massS m k = some a → RowOf a V t Qh v)
    (hcentral : ∀ l : ℚ, (l : ℝ) ≤ t → ScaleChecked l (bandAt l) → CentralDeductions V t Qh v (bandAt l)) :
    (a : ℝ)*V+(b : ℝ)*t^2+(c : ℝ) ≤ (budget : ℝ) := by
  obtain ⟨s, hs, _, bound⟩ := profile_cell bandAt hv ht₀ ht₁ hred hrows hcentral
  have h := bound _ _ (List.all_eq_true.mp check s hs)
  push_cast at h
  have ha' : (0 : ℝ) < a := Rat.cast_pos.mpr ha
  have hv' := (le_div_iff₀ ha').mp h
  have he : (V+(b:ℝ)/a*t^2)*a = (a:ℝ)*V+(b:ℝ)*t^2 := by
    field_simp
  rw [he] at hv'
  linarith

/-- The shared terminal-scale estimate remains available for every original mixed check. -/
theorem mixed_profile_bound (a b c budget : ℚ) (ha : 0 < a)
    (check : mixedCheck a b c budget = true) {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {V t : ℝ} {Qh v : E} (hv : ‖v‖^2 = 2) (ht₀ : 0 ≤ t) (ht₁ : t ≤ 9/10)
    (hred : CircularSharedReduction rowData V t Qh v)
    (hrows : ∀ k m a, envRowAtPure envRowsTight massS m k = some a → RowOf a V t Qh v)
    (hcentral : CentralDeductions V t Qh v) :
    (a : ℝ)*V+(b : ℝ)*t^2+(c : ℝ) ≤ (budget : ℝ) :=
  mixed_profile_bound_band (fun _ ↦ .whole) a b c budget ha check hv ht₀ ht₁ hred hrows (fun _ _ _ ↦ hcentral)

/-- The physical budget below the switch; every remaining segment is priced with its
own admissible scale. The upper closed half is handled by the visible cubic projection. -/
def riceMixedCheck (a b c budget : ℚ) : Bool :=
  cells.all (fun s ↦ decide (splitAmplitude ≤ s.base.lo) || valid riceBand (b/a) ((budget-c)/a) s)

theorem rice_mixed_profile_below (a b c budget : ℚ) (ha : 0 < a)
    (check : riceMixedCheck a b c budget = true) {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {V t : ℝ} {Qh v : E} (hv : ‖v‖^2 = 2) (ht₀ : 0 ≤ t) (ht₁ : t ≤ 9/10) (ht : t < splitAmplitude)
    (hred : CircularSharedReduction rowData V t Qh v)
    (hrows : ∀ k m a, envRowAtPure envRowsTight massS m k = some a → RowOf a V t Qh v)
    (hcentral : ∀ l : ℚ, (l : ℝ) ≤ t → ScaleChecked l (riceBand l) → CentralDeductions V t Qh v (riceBand l)) :
    (a : ℝ)*V+(b : ℝ)*t^2+(c : ℝ) ≤ (budget : ℝ) := by
  obtain ⟨s, hs, hlo, bound⟩ := profile_cell riceBand hv ht₀ ht₁ hred hrows hcentral
  have hl : ¬ splitAmplitude ≤ s.base.lo := by
    intro h
    exact ht.not_ge (((Rat.cast_le (K := ℝ)).2 h).trans hlo)
  have hc := List.all_eq_true.mp check s hs
  simp only [hl,decide_false,Bool.false_or] at hc
  have h := bound _ _ hc
  push_cast at h
  have ha' : (0 : ℝ) < a := Rat.cast_pos.mpr ha
  have hv' := (le_div_iff₀ ha').mp h
  have he : (V+(b:ℝ)/a*t^2)*a = (a:ℝ)*V+(b:ℝ)*t^2 := by
    field_simp
  rw [he] at hv'
  linarith

/-- Row-09 shares at the 16 existing closed central intervals for the signed witness. -/
def signedShares : List (ℚ × ℚ × ℚ) := [
  (855/1024, 2183/10000, 1731/5000),
  (8559/10240, 1061/5000, 1717/5000),
  (1071/1280, 1717/5000, 409/1000),
  (3429/4096, 409/1000, 2209/5000),
  (34299/40960, 2209/5000, 2249/5000),
  (52339463/62500000, 2249/5000, 901/2000),
  (209359009/250000000, 901/2000, 2253/5000),
  (837437149/1000000000, 2253/5000, 2261/5000),
  (837447529/1000000000, 1131/2500, 1187/2500),
  (8577/10240, 4757/10000, 2543/5000),
  (34317/40960, 203/400, 5393/10000),
  (17163/20480, 5273/10000, 5739/10000),
  (16767/20000, 5689/10000, 5879/10000),
  (4293/5120, 5843/10000, 3511/5000),
  (4059539762943421294892413284173771/4837034420756823638085206016000000, 271/400, 1953/2500),
  (2031669766038241228652199472973771/2418517210378411819042603008000000, 1967/2500, 508/625)]

private def signedCells : List Segment := cells.map fun s ↦
  match signedShares.lookup s.base.lo with
  | some (w,z) => {s with leftWeight := w, rightWeight := z}
  | none => s

private theorem signedChain :
    chainTo (fun s : Segment ↦ s.base.lo) (fun s ↦ s.base.hi) 0 (9/10) signedCells = true ∧
    signedCells.all (fun s ↦ decide (s.base.lo < s.base.hi ∧ 0 ≤ s.leftWeight ∧
      s.leftWeight ≤ 1 ∧ 0 ≤ s.rightWeight ∧ s.rightWeight ≤ 1)) = true := by
  decide +kernel

/-- Two amplitude prices with a common positive multiplier of the original payoff.
The upper price can only be selected on a whole segment above the threshold. -/
def riceGuardedCheck (stop cut a b₀ c₀ b₁ c₁ budget : ℚ) : Bool :=
  signedCells.all fun s ↦ decide (stop ≤ s.base.lo) ||
    if cut ≤ s.base.lo then valid riceBand (b₁/a) ((budget-c₁)/a) s
    else valid riceBand (b₀/a) ((budget-c₀)/a) s

private theorem of_tilted_price {a b c budget : ℚ} {V t : ℝ} (ha : 0 < a)
    (h : V+((b/a : ℚ):ℝ)*t^2 ≤ (((budget-c)/a : ℚ):ℝ)) :
    (a:ℝ)*V+(b:ℝ)*t^2+(c:ℝ) ≤ (budget:ℝ) := by
  push_cast at h
  have ha' : (0:ℝ) < a := Rat.cast_pos.mpr ha
  have hv := (le_div_iff₀ ha').mp h
  have he : (V+(b:ℝ)/a*t^2)*a = (a:ℝ)*V+(b:ℝ)*t^2 := by field_simp
  rw [he] at hv
  linarith

/-- Every amplitude below the switch pays the first price, or it lies above the
specified threshold and pays the second. A segment straddling the threshold
uses the first price throughout. -/
theorem rice_guarded_profile_below (stop cut a b₀ c₀ b₁ c₁ budget : ℚ) (ha : 0 < a)
    (check : riceGuardedCheck stop cut a b₀ c₀ b₁ c₁ budget = true)
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {V t : ℝ} {Qh v : E} (hv : ‖v‖^2 = 2) (ht₀ : 0 ≤ t) (ht₁ : t ≤ 9/10)
    (ht : t < (stop:ℝ)) (hred : CircularSharedReduction rowData V t Qh v)
    (hrows : ∀ k m a, envRowAtPure envRowsTight massS m k = some a → RowOf a V t Qh v)
    (hcentral : ∀ l : ℚ, (l : ℝ) ≤ t → ScaleChecked l (riceBand l) →
      CentralDeductions V t Qh v (riceBand l)) :
    (a:ℝ)*V+(b₀:ℝ)*t^2+(c₀:ℝ) ≤ (budget:ℝ) ∨
    ((cut:ℝ) ≤ t ∧ (a:ℝ)*V+(b₁:ℝ)*t^2+(c₁:ℝ) ≤ (budget:ℝ)) := by
  obtain ⟨s,hs,hlo,bound⟩ := profile_chain signedCells signedChain.1 signedChain.2 riceBand hv ht₀ ht₁ hred hrows hcentral
  have hl : ¬ stop ≤ s.base.lo := fun h ↦
    ht.not_ge (((Rat.cast_le (K := ℝ)).2 h).trans hlo)
  have hc := List.all_eq_true.mp check s hs
  simp only [hl,decide_false,Bool.false_or] at hc
  by_cases high : cut ≤ s.base.lo
  · rw [ite_eq_left high] at hc
    exact Or.inr ⟨((Rat.cast_le (K := ℝ)).2 high).trans hlo,
      of_tilted_price ha (bound _ _ hc)⟩
  · rw [ite_eq_right high] at hc
    exact Or.inl (of_tilted_price ha (bound _ _ hc))

end Grothe.Lower.SparseEnvelope
