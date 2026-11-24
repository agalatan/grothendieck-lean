import Grothe.Lower.MassPotential
import Grothe.Lower.MassWitnessData

/-!
# Chords of the mass potential

Each cell in the fourth-moment parameter lists the indices of its spectral witnesses, in
increasing order of scale. The potential vanishes at zero. Between consecutive witnesses,
convexity bounds its expectation by a chord, whose maximum after the quadratic price is exact.
-/

open MeasureTheory

namespace Grothe.Lower

/-- Consecutive chords, starting at `p`, certify the mass bound up to the last required scale. -/
private def massChordsOK (lo hi : ℚ) (p : SpNode) : List SWit → Bool
  | [] => false
  | w :: ws => spChordOK [] massRow.kappa massRow.cap lo hi p (.wit w) &&
      (decide (massRow.delta * ρ ≤ w.tau) || massChordsOK lo hi (.wit w) ws)

/-- Exact checks of the fourth-moment cover and the scale chords of each cell. -/
def massCoverOK (pool : List SWit) (cells : List (ℚ × ℚ × List ℕ)) : Bool :=
  chainTo Prod.fst (fun c => c.2.1) 0 xMax cells && cells.all fun (lo, hi, ids) =>
    decide (0 ≤ lo) && ids.all (fun i => decide (i < pool.length)) &&
      massChordsOK lo hi .zero (ids.filterMap fun i => pool[i]?)

private theorem massChords_sound {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    {U : Ω → ℝ} {lo hi : ℚ} {σ : ℝ} (hσ : σ ≤ (massRow.delta * ρ : ℚ)) (ws : List SWit)
    (hws : ∀ w ∈ ws, TB μ U massPot w.tau ((SpNode.wit w).val [] lo hi : ℚ))
    (p : SpNode) (hp : 0 ≤ p.sigma) (hpσ : (p.sigma : ℝ) ≤ σ)
    (hT : TB μ U massPot p.sigma (p.val [] lo hi : ℚ))
    (hok : massChordsOK lo hi p ws = true) : Goal μ U massPot massRow.kappa massRow.cap σ := by
  induction ws generalizing p with
  | nil => cases hok
  | cons w ws ih =>
    simp only [massChordsOK, spChordOK, Bool.and_eq_true, Bool.or_eq_true,
      decide_eq_true_eq] at hok
    obtain ⟨⟨hlt, hcap⟩, hrest⟩ := hok
    have hw := hws w (List.mem_cons_self ..)
    by_cases h : σ ≤ (w.tau : ℝ)
    · have hconv : ConvexOn ℝ (Set.Ici 0) massPot :=
        phiMass_convexOn_mul epsR_pos massC_pos (by norm_num)
      exact chord_goal μ hconv _ _ _ _ _ _ hp hlt hT hw hcap σ hpσ h
    · rcases hrest with hend | hmore
      · exact (h (hσ.trans (by exact_mod_cast hend))).elim
      · exact ih (fun v hv => hws v (List.mem_cons_of_mem _ hv)) (.wit w)
          (hp.trans hlt.le) (le_of_not_ge h) hw hmore

/-- Global bound from the witness bounds and the rational chord cover. -/
theorem massCover_sound {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ]
    {U : Ω → ℝ} {x : ℝ} (hM : Moments μ U x) (pool : List SWit)
    (hw : ∀ w ∈ pool, 0 ≤ w.y.a6 ∧ TB μ U massPot w.tau (w.y.J 0 1 x))
    (cells : List (ℚ × ℚ × List ℕ)) (hc : massCoverOK pool cells = true) {σ : ℝ}
    (h0 : 0 ≤ σ) (h1 : σ ≤ (massRow.delta * ρ : ℚ)) :
    Goal μ U massPot massRow.kappa massRow.cap σ := by
  simp only [massCoverOK, Bool.and_eq_true, List.all_eq_true, decide_eq_true_eq] at hc
  obtain ⟨hchain, hcells⟩ := hc
  obtain ⟨⟨lo, hi, ids⟩, hcell, hlo, hhi⟩ :=
    chainTo_sound Prod.fst (fun c => c.2.1) cells 0 xMax hchain x (by exact_mod_cast hM.x0) hM.x1
  obtain ⟨⟨hx0, -⟩, hok⟩ := hcells _ hcell
  apply massChords_sound μ h1 _ _ .zero (by decide) (by simpa [SpNode.sigma] using h0) _ hok
  · intro w hmem
    obtain ⟨i, _, hiw⟩ := List.mem_filterMap.mp hmem
    obtain ⟨h6, hT⟩ := hw w (List.mem_iff_getElem?.mpr ⟨i, hiw⟩)
    apply hT.mono
    simpa [SpNode.val, MPoly.Jq_cast]
      using w.y.J_endpoint 0 1 x lo hi h6 hx0 hlo hhi
  · simpa [SpNode.sigma, SpNode.val] using
      (TB.zero (μ := μ) (U := U) (Φ := massPot) 0 (by
        simp [massPot, phiMass, epsR_pos.le, massC_pos.le, div_nonneg]))

/-- The exact mass cell cover and its chord maxima pass the kernel check. -/
theorem massCover_checked : massCoverOK massWitnesses massCells = true := by
  decide +kernel

end Grothe.Lower
