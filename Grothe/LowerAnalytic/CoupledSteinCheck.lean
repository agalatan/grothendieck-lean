import Grothe.Lower.Basic
import Grothe.LowerAnalytic.AntiSteinRowCheck

set_option warningAsError true

/-!
# Rational overlay of two Stein law profiles

Each row supplies an affine expectation bound on a closed shape and scale rectangle.
Overlapping rectangles use the same fourth excess and scale. The weighted expectation
minus the weighted curvature and gate cost is a quadratic in that scale. Single-point
intersections are included, so the two rows can independently select their bracketing knots.

Agent-ID: codex-a7c4
-/

namespace Grothe.LowerAnalytic.CoupledStein

open Grothe.Lower

structure Chord where
  shapeLo : ℚ
  shapeHi : ℚ
  sigmaLo : ℚ
  sigmaHi : ℚ
  intercept : ℚ
  slope : ℚ
  deriving DecidableEq, Repr

def Chord.eval (c : Chord) (σ : ℝ) : ℝ := (c.intercept : ℝ) + (c.slope : ℝ) * σ

def Chord.Covers (c : Chord) (s σ : ℝ) : Prop :=
  (c.shapeLo : ℝ) ≤ s ∧ s ≤ c.shapeHi ∧ (c.sigmaLo : ℝ) ≤ σ ∧ σ ≤ c.sigmaHi

/-- Compress adjacent checked nodes to their affine expectation line. -/
def fromNodes (c0 : ℚ) (c : AntiSCell) (left right : RowSigmaNode) : Chord :=
  let vl := left.val c0 c.sLo c.sHi
  let vr := right.val c0 c.sLo c.sHi
  let slope := (vr - vl) / (right.sigma - left.sigma)
  ⟨c.sLo, c.sHi, left.sigma, right.sigma, vl - slope*left.sigma, slope⟩

def rowChords (c0 : ℚ) (cells : List AntiSCell) : List Chord :=
  cells.flatMap fun c ↦ (c.snodes.zip c.snodes.tail).map fun p ↦ fromNodes c0 c p.1 p.2

theorem fromNodes_mem (c0 : ℚ) {cells : List AntiSCell} {c : AntiSCell} (hc : c ∈ cells)
    {l r : RowSigmaNode} (hp : (l,r) ∈ c.snodes.zip c.snodes.tail) :
    fromNodes c0 c l r ∈ rowChords c0 cells :=
  List.mem_flatMap.mpr ⟨c,hc,List.mem_map.mpr ⟨(l,r),hp,rfl⟩⟩

theorem fromNodes_eval (c0 : ℚ) (c : AntiSCell) (l r : RowSigmaNode) (hlr : l.sigma < r.sigma)
    (σ : ℝ) :
    (fromNodes c0 c l r).eval σ =
      ((r.sigma : ℝ)-σ)/(r.sigma-l.sigma)*(l.val c0 c.sLo c.sHi : ℝ) +
      (σ-l.sigma)/(r.sigma-l.sigma)*(r.val c0 c.sLo c.sHi : ℝ) := by
  have hden : (r.sigma : ℝ) - l.sigma ≠ 0 := (sub_pos.mpr (Rat.cast_lt.mpr hlr)).ne'
  unfold Chord.eval fromNodes
  push_cast
  field_simp [hden]
  ring

/-- Only the common scale interval and the two affine lines remain after intersecting shapes. -/
structure Piece where
  lo : ℚ
  hi : ℚ
  a8 : ℚ
  b8 : ℚ
  a9 : ℚ
  b9 : ℚ
  deriving DecidableEq, Repr

private def piece (stop : ℚ) (l r : Chord) : Piece :=
  ⟨max l.sigmaLo r.sigmaLo, min stop (min l.sigmaHi r.sigmaHi),
    l.intercept, l.slope, r.intercept, r.slope⟩

private def intersection (stop : ℚ) (l r : Chord) : Option Piece :=
  let p := piece stop l r
  if max l.shapeLo r.shapeLo ≤ min l.shapeHi r.shapeHi ∧ p.lo ≤ p.hi then some p else none

def overlay (stop : ℚ) (left right : List Chord) : List Piece :=
  left.flatMap fun l ↦ right.filterMap (intersection stop l)

/-- Recover the two actual chords and both closed overlap conditions from an overlay member. -/
theorem overlay_member {stop : ℚ} {left right : List Chord} {p : Piece}
    (hp : p ∈ overlay stop left right) :
    ∃ l ∈ left, ∃ r ∈ right,
      max l.shapeLo r.shapeLo ≤ min l.shapeHi r.shapeHi ∧
      max l.sigmaLo r.sigmaLo ≤ min stop (min l.sigmaHi r.sigmaHi) ∧
      p = ⟨max l.sigmaLo r.sigmaLo, min stop (min l.sigmaHi r.sigmaHi),
        l.intercept,l.slope,r.intercept,r.slope⟩ := by
  obtain ⟨l,hl,hrs⟩ := List.mem_flatMap.mp hp
  obtain ⟨r,hr,he⟩ := List.mem_filterMap.mp hrs
  simp only [intersection, Option.ite_none_right_eq_some, Option.some.injEq] at he
  exact ⟨l,hl,r,hr,he.1.1,he.1.2,he.2.symm⟩

private theorem piece_mem {stop : ℚ} {left right : List Chord} {l r : Chord}
    (hl : l ∈ left) (hr : r ∈ right) {s σ : ℝ}
    (hlc : l.Covers s σ) (hrc : r.Covers s σ) (hstop : σ ≤ stop) :
    piece stop l r ∈ overlay stop left right := by
  obtain ⟨sl₀,sl₁,xl₀,xl₁⟩ := hlc
  obtain ⟨sr₀,sr₁,xr₀,xr₁⟩ := hrc
  have hs : max (l.shapeLo : ℝ) r.shapeLo ≤ min (l.shapeHi : ℝ) r.shapeHi :=
    (max_le sl₀ sr₀).trans (le_min sl₁ sr₁)
  have hσ : max (l.sigmaLo : ℝ) r.sigmaLo ≤ min (stop : ℝ) (min (l.sigmaHi : ℝ) r.sigmaHi) :=
    (max_le xl₀ xr₀).trans (le_min hstop (le_min xl₁ xr₁))
  have hs' : max l.shapeLo r.shapeLo ≤ min l.shapeHi r.shapeHi := by exact_mod_cast hs
  have hσ' : (piece stop l r).lo ≤ (piece stop l r).hi := by
    dsimp [piece]
    exact_mod_cast hσ
  exact List.mem_flatMap.mpr ⟨l,hl,List.mem_filterMap.mpr
    ⟨r,hr,by simp [intersection,hs',hσ']⟩⟩

/-- Exact extremum, including an interior vertex whenever it belongs to this closed piece. -/
def pieceMax (w curvature : ℚ) (p : Piece) : ℚ :=
  quadMax ((1-w)*p.a8+w*p.a9) ((1-w)*p.b8+w*p.b9) (-curvature) p.lo p.hi

def worst (pieces : List Piece) (w curvature : ℚ) : ℚ :=
  ((pieces.map (pieceMax w curvature)).max?).getD 0

def curvature (w k8 k9 delta gain : ℚ) : ℚ := (1-w)*k8+w*k9+gain/delta^2

def discount (pieces : List Piece) (w k8 k9 cap8 cap9 delta gain : ℚ) : ℚ :=
  (1-w)*cap8+w*cap9 - worst pieces w (curvature w k8 k9 delta gain)

private theorem pieceMax_le_worst {pieces : List Piece} {p : Piece} (hp : p ∈ pieces)
    (w k : ℚ) : pieceMax w k p ≤ worst pieces w k := by
  let vals := pieces.map (pieceMax w k)
  have hm : pieceMax w k p ∈ vals := List.mem_map.mpr ⟨p,hp,rfl⟩
  have hne : vals ≠ [] := List.ne_nil_of_mem hm
  change _ ≤ vals.max?.getD 0
  rw [List.max?_eq_some_max hne]
  exact List.le_max_of_mem hm

/-- A pair of interval bounds on actual expectations gives the exact saved intercept. -/
theorem discount_le {stop : ℚ} {left right : List Chord} {l r : Chord}
    (hl : l ∈ left) (hr : r ∈ right) {s σ v8 v9 : ℝ} (hlc : l.Covers s σ)
    (hrc : r.Covers s σ) (hstop : σ ≤ stop)
    (h8 : v8 ≤ l.eval σ) (h9 : v9 ≤ r.eval σ)
    (w k8 k9 cap8 cap9 delta gain : ℚ) (hw₀ : 0 ≤ w) (hw₁ : w ≤ 1) :
    (discount (overlay stop left right) w k8 k9 cap8 cap9 delta gain : ℝ) ≤
      (1-(w : ℝ))*((cap8 : ℝ)+(k8 : ℝ)*σ^2-v8) +
      (w : ℝ)*((cap9 : ℝ)+(k9 : ℝ)*σ^2-v9) + (gain : ℝ)/(delta : ℝ)^2*σ^2 := by
  let p := piece stop l r
  have hp : p ∈ overlay stop left right := piece_mem hl hr hlc hrc hstop
  have hσ₀ : (p.lo : ℝ) ≤ σ := by
    simpa [p,piece] using max_le hlc.2.2.1 hrc.2.2.1
  have hσ₁ : σ ≤ (p.hi : ℝ) := by
    simpa [p,piece] using le_min hstop (le_min hlc.2.2.2 hrc.2.2.2)
  let k := curvature w k8 k9 delta gain
  have hq := quadVal_le_quadMax ((1-w)*p.a8+w*p.a9) ((1-w)*p.b8+w*p.b9) (-k) p.lo p.hi σ hσ₀ hσ₁
  have hworst : (pieceMax w k p : ℝ) ≤ worst (overlay stop left right) w k :=
    Rat.cast_le.mpr (pieceMax_le_worst hp w k)
  change _ ≤ (pieceMax w k p : ℝ) at hq
  have htop := hq.trans hworst
  have hw₁R : (w : ℝ) ≤ 1 := by exact_mod_cast hw₁
  have h₈ := mul_le_mul_of_nonneg_left h8 (sub_nonneg.mpr hw₁R)
  have h₉ := mul_le_mul_of_nonneg_left h9 (Rat.cast_nonneg.mpr hw₀)
  change (((1-w)*cap8+w*cap9-worst (overlay stop left right) w k : ℚ) : ℝ) ≤ _
  push_cast at htop ⊢
  simp only [p,piece,Chord.eval] at htop h₈ h₉
  have hk : (k : ℝ) = (1-(w : ℝ))*k8+(w : ℝ)*k9+(gain : ℝ)/(delta : ℝ)^2 := by
    simp [k,curvature]
  rw [hk] at htop
  linarith only [htop,h₈,h₉]

/-- Interpolate two rational endpoint discounts at fixed actual shape, scale and row values.
The caller may use a sharper real gate gain at the intermediate weight via its concavity. -/
theorem discount_chord_le {stop : ℚ} {left right : List Chord} {l r : Chord}
    (hl : l ∈ left) (hr : r ∈ right) {s σ v8 v9 : ℝ} (hlc : l.Covers s σ)
    (hrc : r.Covers s σ) (hstop : σ ≤ stop)
    (h8 : v8 ≤ l.eval σ) (h9 : v9 ≤ r.eval σ)
    (w z k8 k9 cap8 cap9 delta gainW gainZ : ℚ)
    (hw₀ : 0 ≤ w) (hw₁ : w ≤ 1) (hz₀ : 0 ≤ z) (hz₁ : z ≤ 1)
    {x G : ℝ} (hx₀ : 0 ≤ x) (hx₁ : x ≤ 1)
    (hg : (1-x)*(gainW : ℝ)+x*(gainZ : ℝ) ≤ G) :
    let θ := (1-x)*(w : ℝ)+x*(z : ℝ)
    let ps := overlay stop left right
    (1-x)*(discount ps w k8 k9 cap8 cap9 delta gainW : ℝ) +
      x*(discount ps z k8 k9 cap8 cap9 delta gainZ : ℝ) ≤
      (1-θ)*((cap8 : ℝ)+(k8 : ℝ)*σ^2-v8) + θ*((cap9 : ℝ)+(k9 : ℝ)*σ^2-v9) +
        G/(delta : ℝ)^2*σ^2 := by
  have hw := discount_le hl hr hlc hrc hstop h8 h9 w k8 k9 cap8 cap9 delta gainW hw₀ hw₁
  have hz := discount_le hl hr hlc hrc hstop h8 h9 z k8 k9 cap8 cap9 delta gainZ hz₀ hz₁
  have hlower := add_le_add (mul_le_mul_of_nonneg_left hw (sub_nonneg.mpr hx₁))
    (mul_le_mul_of_nonneg_left hz hx₀)
  have hgain := mul_le_mul_of_nonneg_right hg (div_nonneg (sq_nonneg σ) (sq_nonneg (delta : ℝ)))
  dsimp only
  simp only [div_eq_mul_inv] at hlower hgain ⊢
  linarith only [hlower, hgain]

end Grothe.LowerAnalytic.CoupledStein
