import Grothe.Lower.Law
import Mathlib.Data.List.GetD

/-!
# Dilating a plain Stein cut

A plain cut tested at `d * √U` can be tested on the normalized law at `√U` by
dividing its radius mesh by `d` and changing its last two coefficients. The
original cut exceeds the transformed cut by an explicit constant of either sign.
This lets a checked node bound a row potential at other positive rational scales.
-/

namespace Grothe.Lower

/-- Difference between the old and transformed cuts at squared radius ratio `k`. -/
noncomputable def cutDilationOffset (k β α : ℝ) : ℝ :=
  β ^ 2 - (β + (k - 1) * α) ^ 2 + 2 * α ^ 2 * (k ^ 2 - 1) / 3

private theorem cellG_dilate (A B e β α k u : ℝ) (hk : k ≠ 0) :
    cellG A B e β α (k * u) =
      cellG A (k * B) (e / k) (β + (k - 1) * α) (k * α) u + cutDilationOffset k β α := by
  by_cases hu : u = 0
  · subst u
    simp [cellG, cutDilationOffset]
    field_simp
    ring
  · simp only [cellG, ite_eq_right hu, ite_eq_right (mul_ne_zero hk hu), cutDilationOffset]
    field_simp
    ring

private def dilateCell (k : ℚ) (c : CutCell) : CutCell := ⟨c.A, k * c.B, c.e0 / k⟩

/-- The slope of the affine test scales by `d²`; its primitive scales by `1 / d²`. -/
private theorem cutAux_dilate (vs cv : List ℚ) (d : ℚ) (hd : d ≠ 0) (t c F : ℚ) (i : ℕ) :
    cutAux cv (t / d ^ 2) c (F / d ^ 2) i (vs.map (· / d)) =
      (cutAux cv t c F i vs).map (dilateCell (d ^ 2)) := by
  induction vs generalizing t c F i with
  | nil => simp [cutAux, dilateCell]
  | cons w rest ih =>
    have hs : (w / d) ^ 2 = w ^ 2 / d ^ 2 := div_pow _ _ _
    have hb (x : ℚ) : x / (w ^ 2 / d ^ 2 - t / d ^ 2) = d ^ 2 * (x / (w ^ 2 - t)) := by
      rw [← sub_div, div_div_eq_mul_div]
      ring
    have ha (x : ℚ) : c - d ^ 2 * x * (t / d ^ 2) = c - x * t := by field_simp
    have hf (c' : ℚ) : F / d ^ 2 + (c + c') / 2 * (w ^ 2 / d ^ 2 - t / d ^ 2) =
        (F + (c + c') / 2 * (w ^ 2 - t)) / d ^ 2 := by ring
    have he (a b : ℚ) : F / d ^ 2 - a * (t / d ^ 2) - d ^ 2 * b / 2 * (t / d ^ 2) ^ 2 =
        (F - a * t - b / 2 * t ^ 2) / d ^ 2 := by field_simp
    simp only [List.map_cons, cutAux, hb, ha, he, hf, hs, ih, dilateCell]

private theorem pickIdx_dilate (vs : List ℚ) (d : ℚ) (hd : 0 < d) (v : ℝ) :
    pickIdx (vs.map (· / d)) v = pickIdx vs (d * v) := by
  have hd' : (0 : ℝ) < d := by exact_mod_cast hd
  induction vs with
  | nil => rfl
  | cons w vs ih =>
    simp only [List.map_cons, pickIdx, Rat.cast_div, lt_div_iff₀ hd', ih, mul_comm v (d : ℝ)]

/-- Dilating the radius of a cut preserves its knot values and changes its two scalar parameters. -/
theorem cutG_dilate (vs cv : List ℚ) (hc : cv.length = vs.length)
    (d β α : ℚ) (hd : 0 < d) (v : ℝ) :
    cutG vs (cv ++ [β, α]) (d * v) =
      cutG (vs.map (· / d)) (cv ++ [β + (d ^ 2 - 1) * α, d ^ 2 * α]) v +
        cutDilationOffset ((d : ℝ) ^ 2) β α := by
  have hne := ne_of_gt hd
  let cs := cutAux cv 0 (cv.getD 0 0) 0 0 vs
  have hc1 : cutCells vs (cv ++ [β, α]) = cs := by simp [cutCells, cs, ← hc]
  have hc2 : cutCells (vs.map (· / d)) (cv ++ [β + (d ^ 2 - 1) * α, d ^ 2 * α]) =
      cs.map (dilateCell (d ^ 2)) := by
    simp only [cutCells, List.length_map, ← hc, List.take_left]
    simpa [cs] using cutAux_dilate vs cv d hne 0 (cv.getD 0 0) 0 0
  have hzero : dilateCell (d ^ 2) ⟨0, 0, 0⟩ = ⟨0, 0, 0⟩ := by simp [dilateCell]
  have hg (i : ℕ) : (cs.map (dilateCell (d ^ 2))).getD i ⟨0, 0, 0⟩ =
      dilateCell (d ^ 2) (cs.getD i ⟨0, 0, 0⟩) := by
    calc
      _ = (cs.map (dilateCell (d ^ 2))).getD i (dilateCell (d ^ 2) ⟨0, 0, 0⟩) :=
        congrArg (fun k => (cs.map (dilateCell (d ^ 2))).getD i k) hzero.symm
      _ = _ := List.getD_map cs ⟨0, 0, 0⟩ _
  simp only [cutG, pickIdx_dilate _ _ hd, hc1, hc2, hg, dilateCell, List.length_map, ← hc]
  simp
  let c := cs.getD (pickIdx vs ((d : ℝ) * v)) ⟨0, 0, 0⟩
  have h := cellG_dilate c.A c.B c.e0 β α ((d : ℝ) ^ 2) (v ^ 2)
    (pow_ne_zero _ (Rat.cast_ne_zero.mpr hne))
  simpa [c, mul_pow] using h

private theorem meshOK_dilate (vs : List ℚ) (d : ℚ) (hd : 0 < d) (a : ℚ) :
    meshOK (a / d) (vs.map (· / d)) = meshOK a vs := by
  induction vs generalizing a with
  | nil => rfl
  | cons v vs ih => simp [meshOK, div_lt_div_iff_of_pos_right hd, ih]

open MeasureTheory

/-- A law satisfying the normalized Stein cuts also prices cuts at every positive rational multiple
of the radius. The offset is a lower bound for the expected value of the dilated cut. -/
theorem SteinCut.integral_cutG_dilate {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ] {U : Ω → ℝ} (cuts : SteinCut μ U)
    (vs cv : List ℚ) (hc : cv.length = vs.length) (hm : meshOK 0 vs = true)
    (d β α : ℚ) (hd : 0 < d) :
    Integrable (fun ω => cutG vs (cv ++ [β, α]) (d * √(U ω))) μ ∧
      cutDilationOffset ((d : ℝ) ^ 2) β α ≤ ∫ ω, cutG vs (cv ++ [β, α]) (d * √(U ω)) ∂μ := by
  have hm' : meshOK 0 (vs.map (· / d)) = true := by
    simpa using (meshOK_dilate vs d hd 0).trans hm
  let g := fun ω => cutG (vs.map (· / d)) (cv ++ [β + (d ^ 2 - 1) * α, d ^ 2 * α]) (√(U ω))
  let cost := cutDilationOffset ((d : ℝ) ^ 2) β α
  obtain ⟨hi, hp⟩ := cuts.cut (vs.map (· / d)) (cv ++ [β + (d ^ 2 - 1) * α, d ^ 2 * α]) hm'
  have eq : (fun ω => cutG vs (cv ++ [β, α]) (d * √(U ω))) = fun ω => g ω + cost :=
    funext fun ω => cutG_dilate vs cv hc d β α hd _
  rw [eq]
  refine ⟨hi.add (integrable_const cost), ?_⟩
  rw [integral_add hi (integrable_const cost), integral_const, probReal_univ, one_smul]
  exact le_add_of_nonneg_left hp

end Grothe.Lower
