import Grothe.LowerAnalytic.CoupledSteinData
import Grothe.LowerAnalytic.RowGaussian
import Grothe.LowerAnalytic.WeightedSchurRows
import Grothe.LowerAnalytic.AntiRows.Row08
import Grothe.LowerAnalytic.AntiRows.Row09

set_option warningAsError true

/-!
# Simultaneous Stein-law deductions for the two active rows

The actual circular cubic determines one fourth excess and one scale. Each of the two
certified banks provides a chord there. Their weighted law deductions and the weighted
Gaussian gate then hold on the same realization.

Agent-ID: codex-a7c4
-/

open MeasureTheory MvPolynomial Grothe.Lower
open Grothe.Lower.SharedGate (surplus)
open Grothe.Lower.SharedGate.WeightedSchur (pairGain pairGainQ pairGain_rat pairGain_chord
  pair_surplus real_reserve)

namespace Grothe.LowerAnalytic.CoupledStein

private theorem certified_chord {r : Row} {c0 : ℚ} {cells : List AntiSCell}
    (h : CircularCellNodeBounds r c0 cells)
    {nodes : List (ℚ × ℚ)} {smax kap cap hi : ℚ} {qb : List QuadNode} {bank : List AntiNodeSummary}
    (hok : checkAntiCells nodes smax kap cap hi qb bank cells = true)
    {d : ℕ} {a b : MvPolynomial (Fin d) ℝ} (ha : Chaos3 a)
    (haa : ∫ y, eval y a ^ 2 ∂(stdGaussian d) = 1/2) {J : Fin d → Fin d → ℝ}
    (hc : Circular J a b) {Ψ : ℝ → ℝ} (hΨ : CapsHold Ψ r.nodeList r.smax)
    {σ : ℝ} (hσ₀ : 0 ≤ σ) (hσ₁ : σ ≤ (hi : ℝ)) (hstop : 0 < hi)
    (hInt : ∀ z : ℝ, 0 ≤ z →
      Integrable (fun y ↦ Ψ (z * √(eval y (radU a b)))) (stdGaussian d)) :
    ∃ c ∈ rowChords c0 cells, c.Covers (∫ y, eval y (radU a b)^2 ∂(stdGaussian d)-2) σ ∧
      ∫ y, Ψ (σ * √(eval y (radU a b))) ∂(stdGaussian d) ≤ c.eval σ := by
  obtain ⟨hs₀,hs₁⟩ := circular_fourth_excess_mem ha haa hc
  obtain ⟨c,hm,hl,hh,⟨p,q⟩,hp,h₀,hlt,hlo,hhi⟩ :=
    checkAntiCells_bracket hok hs₀ hs₁ hσ₀ hσ₁ hstop
  obtain ⟨hpm,hqm⟩ := List.of_mem_zip hp
  refine ⟨fromNodes c0 c p q, fromNodes_mem _ hm hp, ⟨hl,hh,hlo,hhi⟩, ?_⟩
  rw [fromNodes_eval _ _ _ _ hlt]
  exact h.chord ha haa hc hΨ hm hl hh hpm (List.mem_of_mem_tail hqm) h₀ hlt hlo hhi hInt

/-- The interpolated endpoint discounts apply to the two actual rows simultaneously. -/
theorem actual_deductions {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {V t : ℝ} {Qh v : E} (hred : CircularSharedReduction rowData V t Qh v)
    (w z : ℚ) (hw₀ : 0 ≤ w) (hw₁ : w ≤ 1) (hz₀ : 0 ≤ z) (hz₁ : z ≤ 1)
    {x : ℝ} (hx₀ : 0 ≤ x) (hx₁ : x ≤ 1) :
    let θ := (1-x)*(w : ℝ)+x*(z : ℝ)
    ∃ d8 d9 : ℝ, (1-x)*(rowDiscount w : ℝ)+x*(rowDiscount z : ℝ) ≤ (1-θ)*d8+θ*d9 ∧
      RowHolds ε TightShared.row8.ell TightShared.row8.beta ((TightShared.row8.C : ℝ)-d8) V t Qh v ∧
      RowHolds ε TightShared.row9.ell TightShared.row9.beta ((TightShared.row9.C : ℝ)-d9) V t Qh v := by
  dsimp only
  obtain ⟨d,J,A,B,X1,X2,X3,τ,ex,hA,haa,hc,hM,_,hτ₀,hτ₁,_,hX,hshared⟩ := hred
  obtain ⟨P8,h8,hi8⟩ := hshared row08 (List.mem_of_getElem? (i := 7) (by rfl))
  obtain ⟨P9,h9,hi9⟩ := hshared row09 (List.mem_of_getElem? (i := 8) (by rfl))
  let σ : ℝ := row08.delta*τ
  have hd : (0 : ℝ) < row08.delta := Rat.cast_pos.mpr row08_delta_pos
  have hδ : row09.delta = row08.delta := by rfl
  have hσ₀ : 0 ≤ σ := mul_nonneg hd.le hτ₀
  have hσstop : σ ≤ (stop : ℝ) := by
    simpa [σ,stop] using mul_le_mul_of_nonneg_left hτ₁ hd.le
  have hσ₁ : σ ≤ ((mkRat 3 4 : ℚ) : ℝ) :=
    hσstop.trans (Rat.cast_le.mpr (show stop ≤ mkRat 3 4 by decide +kernel))
  have hh : 0 < mkRat 3 4 := by decide +kernel
  obtain ⟨l,hl,hlc,hlaw⟩ := certified_chord circularCellNodes_row08 row08Cells_ok
    hA haa hc h8.1 hσ₀ hσ₁ hh (fun u hu ↦ (hi8 u hu).sub (integrable_const _))
  obtain ⟨r,hr,hrc,rlaw⟩ := certified_chord circularCellNodes_row09 row09Cells_ok
    hA haa hc h9.1 hσ₀ hσ₁ hh (fun u hu ↦ (hi9 u hu).sub (integrable_const _))
  let θ := (1-x)*(w : ℝ)+x*(z : ℝ)
  have hw : (w : ℝ) ≤ 1 := by exact_mod_cast hw₁
  have hz : (z : ℝ) ≤ 1 := by exact_mod_cast hz₁
  have hx := sub_nonneg.mpr hx₁
  have hθ₀ : 0 ≤ θ := add_nonneg (mul_nonneg hx (Rat.cast_nonneg.mpr hw₀))
    (mul_nonneg hx₀ (Rat.cast_nonneg.mpr hz₀))
  have hθ₁ : θ ≤ 1 := by
    simpa [θ] using add_le_add (mul_le_mul_of_nonneg_left hw hx) (mul_le_mul_of_nonneg_left hz hx₀)
  have hgain := pairGain_chord (Rat.cast_nonneg.mpr hw₀) hw (Rat.cast_nonneg.mpr hz₀) hz hx₀ hx₁
  rw [pairGain_rat,pairGain_rat] at hgain
  have hded := discount_chord_le hl hr hlc hrc hσstop hlaw rlaw w z row08.kappa row09.kappa
    cap08Tight cap09Tight row08.delta _ _ hw₀ hw₁ hz₀ hz₁ hx₀ hx₁ hgain
  let F := fun P : ℝ → ℝ ↦ ∫ y, (P (σ*√(eval y (radU A B)))-capPad) ∂(stdGaussian d)
  let a8 := (cap08Tight : ℝ)+row08.kappa*σ^2-F P8
  let a9 := (cap09Tight : ℝ)+row09.kappa*σ^2-F P9
  let s8 := surplus row08 (stdGaussian d) X1 X2 X3 τ
  let s9 := surplus row09 (stdGaussian d) X1 X2 X3 τ
  change (1-x)*(rowDiscount w : ℝ)+x*(rowDiscount z : ℝ) ≤
    (1-θ)*a8+θ*a9+pairGain θ/(row08.delta : ℝ)^2*σ^2 at hded
  have hscale : pairGain θ/(row08.delta : ℝ)^2*σ^2 = pairGain θ*τ^2 := by
    dsimp [σ]
    field_simp [hd.ne']
  rw [hscale] at hded
  have hg := pair_surplus θ hθ₀ hθ₁ hM hX h8.2.2.1 h9.2.2.1
  change pairGain θ*τ^2 ≤ (1-θ)*s8+θ*s9 at hg
  refine ⟨a8+s8,a9+s9, ?_, ?_, ?_⟩
  · change _ ≤ (1-θ)*(a8+s8)+θ*(a9+s9)
    linarith only [hded,hg]
  · apply real_reserve row08 cap08Tight a8 h8
    dsimp only [a8,F,σ]
    linarith
  · apply real_reserve row09 cap09Tight a9 h9
    rw [hδ]
    dsimp only [a9,F,σ]
    linarith

end Grothe.LowerAnalytic.CoupledStein
