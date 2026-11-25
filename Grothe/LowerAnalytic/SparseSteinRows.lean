import Grothe.LowerAnalytic.SparseSteinCover
import Grothe.LowerAnalytic.SparseSteinPrices
import Grothe.LowerAnalytic.SparseWitness08
import Grothe.LowerAnalytic.SparseWitness09
import Grothe.LowerAnalytic.RowGaussian
import Grothe.LowerAnalytic.WeightedSchurRows
import Grothe.LowerAnalytic.AntiRows.Row08
import Grothe.LowerAnalytic.AntiRows.Row09

set_option warningAsError true

/-! # Actual row deductions at the nine sparse common-law prices -/

open MeasureTheory MvPolynomial Grothe.Lower
open Grothe.Lower.SharedGate (surplus)
open Grothe.Lower.SharedGate.WeightedSchur (pairGain pairGainQ pairGain_rat pairGain_chord
  pair_surplus real_reserve)

namespace Grothe.LowerAnalytic.SparseStein
open CoupledStein (stop discount_chord_le)

private theorem extras_of_plans {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω}
    [IsProbabilityMeasure μ] {U : Ω → ℝ} {x : ℝ} {P : ℝ → ℝ} {caps : List (ℚ × ℚ)} {smax : ℚ}
    {ks : List Extra} (ps : List Plan) (ht : ps.map Plan.target = ks)
    (checks : ∀ p ∈ ps, p.witness.Checked sparseMesh caps smax)
    (priced : ps.all (fun p => p.priced sparseMesh))
    (hM : Moments μ U x) (hC : SteinCut μ U) (hr : ∫ y, √(U y) ∂μ ≤ 93/100)
    (hcap : CapsHold P caps smax) : ExtrasHold ks μ U (x^2) P := by
  intro e he hl hh hi
  rw [← ht] at he
  obtain ⟨p,hp,rfl⟩ := List.mem_map.mp he
  exact p.sound sparseMesh_ok hcap (checks p hp) (List.all_eq_true.mp priced p hp) hM hC hr hl hh hi

/-- The interpolated endpoint discounts apply to the two actual rows simultaneously. -/
theorem actual_deductions {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {V t : ℝ} {Qh v : E} (hred : CircularSharedReduction rowData V t Qh v)
    (w z : ℚ) (hwmem : w ∈ prices.map Prod.fst) (hzmem : z ∈ prices.map Prod.fst)
    (hw₀ : 0 ≤ w) (hw₁ : w ≤ 1) (hz₀ : 0 ≤ z) (hz₁ : z ≤ 1)
    {x : ℝ} (hx₀ : 0 ≤ x) (hx₁ : x ≤ 1) :
    let θ := (1-x)*(w : ℝ)+x*(z : ℝ)
    ∃ d8 d9 : ℝ, (1-x)*(price w : ℝ)+x*(price z : ℝ) ≤ (1-θ)*d8+θ*d9 ∧
      RowHolds ε TightShared.row8.ell TightShared.row8.beta ((TightShared.row8.C : ℝ)-d8) V t Qh v ∧
      RowHolds ε TightShared.row9.ell TightShared.row9.beta ((TightShared.row9.C : ℝ)-d9) V t Qh v := by
  dsimp only
  obtain ⟨d,J,A,B,X1,X2,X3,τ,ex,hA,haa,hc,hM,hGI,hτ₀,hτ₁,_,hX,hshared⟩ := hred
  obtain ⟨P8,h8,hi8⟩ := hshared row08 (List.mem_of_getElem? (i := 7) (by rfl))
  obtain ⟨P9,h9,hi9⟩ := hshared row09 (List.mem_of_getElem? (i := 8) (by rfl))
  let σ : ℝ := row08.delta*τ
  have hd : (0 : ℝ) < row08.delta := Rat.cast_pos.mpr row08_delta_pos
  have hδ : row09.delta = row08.delta := by rfl
  have hσ₀ : 0 ≤ σ := mul_nonneg hd.le hτ₀
  have hσstop : σ ≤ (stop : ℝ) := by
    simpa [σ,stop] using mul_le_mul_of_nonneg_left hτ₁ hd.le
  let s := ∫ y, eval y (radU A B)^2 ∂(stdGaussian d) - 2
  have hse : s = ex^2 := by dsimp [s]; rw [hM.m2]; ring
  obtain ⟨hs₀,hs₁⟩ := circular_fourth_excess_mem hA haa hc
  obtain ⟨sl,hsl,hlo,hhi⟩ := slice_exists hs₀ hs₁
  have cut := steinCut_of_inputs _ hM hGI
  have radius := first_moment_le_93 A B hA haa hc
  have hp8 := h8.1
  have hp9 := h9.1
  rw [row08FullNodes_eq, show row08.smax = row08Smax by decide +kernel] at hp8
  rw [row09FullNodes_eq, show row09.smax = row09Smax by decide +kernel] at hp9
  have extra8 := extras_of_plans plans08 planTargets08 planChecks08 planPrices08 hM cut radius hp8
  have extra9 := extras_of_plans plans09 planTargets09 planChecks09 planPrices09 hM cut radius hp9
  rw [← hse] at extra8 extra9
  obtain ⟨⟨l,hl,hlc,hlaw⟩,⟨r,hr,hrc,rlaw⟩⟩ :=
    paired_chords sl hsl hA haa hc h8.1 h9.1 circularCellNodes_row08 circularCellNodes_row09
      extra8 extra9 hlo hhi hσ₀ hσstop (fun u hu ↦ (hi8 u hu).sub (integrable_const _))
      (fun u hu ↦ (hi9 u hu).sub (integrable_const _))
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
  have joint := discount_chord_le hl hr hlc hrc hσstop hlaw rlaw w z row08.kappa row09.kappa
    cap08Tight cap09Tight row08.delta _ _ hw₀ hw₁ hz₀ hz₁ hx₀ hx₁ hgain
  have hwprice : (price w : ℝ) ≤ _ := Rat.cast_le.mpr (price_le sl hsl w hwmem)
  have hzprice : (price z : ℝ) ≤ _ := Rat.cast_le.mpr (price_le sl hsl z hzmem)
  have hded := (add_le_add (mul_le_mul_of_nonneg_left hwprice hx)
    (mul_le_mul_of_nonneg_left hzprice hx₀)).trans joint
  let F := fun P : ℝ → ℝ ↦ ∫ y, (P (σ*√(eval y (radU A B)))-capPad) ∂(stdGaussian d)
  let a8 := (cap08Tight : ℝ)+row08.kappa*σ^2-F P8
  let a9 := (cap09Tight : ℝ)+row09.kappa*σ^2-F P9
  let s8 := surplus row08 (stdGaussian d) X1 X2 X3 τ
  let s9 := surplus row09 (stdGaussian d) X1 X2 X3 τ
  change (1-x)*(price w : ℝ)+x*(price z : ℝ) ≤
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

end Grothe.LowerAnalytic.SparseStein
