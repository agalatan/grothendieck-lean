import Grothe.Lower.MassPotential

/-!
# Spectral majorants for the explicit mass potential

For a witness at scale `τ`, set `a = (4/3) ε τ`. The potential at radius `v` is
`(av)² / c` up to `v = c/a` and `2av - c` afterwards. On each spectral mesh interval
we subtract the applicable polynomial from the witness majorant, clear the spectral
denominator, and certify nonnegativity. Only the interval containing the breakpoint splits.
-/

open MeasureTheory

namespace Grothe.Lower

private def clearedDiff (k : ℕ) (p cut : List ℚ) : List ℚ :=
  addLq (shiftUp (shOf k) p) (negL cut)

private theorem clearedDiff_eval (k : ℕ) (p cut : List ℚ) (v : ℝ) :
    evalL ((clearedDiff k p cut).map ((↑) : ℚ → ℝ)) v =
      v ^ shOf k * evalL (p.map ((↑) : ℚ → ℝ)) v - evalL (cut.map ((↑) : ℚ → ℝ)) v := by
  simp [clearedDiff, evalL_addLq, evalL_shiftUp, evalL_negL, sub_eq_add_neg]

private def massInterval (turn : ℚ) (q l : List ℚ) (lo hi : ℚ) : Bool :=
  if hi ≤ turn then posOn q 9 lo hi
  else if turn ≤ lo then posOn l 9 lo hi
  else posOn q 9 lo turn && posOn l 9 turn hi

private theorem massInterval_sound {turn lo hi : ℚ} {q l : List ℚ} {v : ℝ} {P : Prop}
    (hlt : lo < hi) (hlo : (lo : ℝ) ≤ v) (hhi : v ≤ hi)
    (hq : v ≤ turn → 0 ≤ evalL (q.map ((↑) : ℚ → ℝ)) v → P)
    (hl : (turn : ℝ) ≤ v → 0 ≤ evalL (l.map ((↑) : ℚ → ℝ)) v → P)
    (hok : massInterval turn q l lo hi = true) : P := by
  unfold massInterval at hok
  split at hok
  · rename_i h
    exact hq (hhi.trans (by exact_mod_cast h)) (posOn_sound _ _ _ _ hlt hok _ hlo hhi)
  split at hok
  · rename_i h
    exact hl ((Rat.cast_le.mpr h).trans hlo) (posOn_sound _ _ _ _ hlt hok _ hlo hhi)
  rename_i hh hl'
  simp only [Bool.and_eq_true] at hok
  obtain ⟨h₁, h₂⟩ := hok
  rcases le_total v (turn : ℝ) with hv | hv
  · exact hq hv (posOn_sound _ _ _ _ (lt_of_not_ge hl') h₁ _ hlo hv)
  · exact hl hv (posOn_sound _ _ _ _ (lt_of_not_ge hh) h₂ _ hv hhi)

private def massSweep (turn : ℚ) (q l : List ℚ) :
    ℚ → ℕ → List ℚ → List (List ℚ) → Bool
  | lo, k, [], [cut] => decide (turn ≤ lo) && tailOn (clearedDiff k l cut) 16 lo
  | lo, k, hi :: vs, cut :: cuts =>
    decide (lo < hi) &&
      massInterval turn (clearedDiff k q cut) (clearedDiff k l cut) lo hi &&
      massSweep turn q l hi (k + 1) vs cuts
  | _, _, _, _ => false

private theorem massSweep_sound (turn : ℚ) (q l : List ℚ) (F : ℝ → ℝ)
    (hq : ∀ v : ℝ, v ≤ turn → evalL (q.map ((↑) : ℚ → ℝ)) v = F v)
    (hl : ∀ v : ℝ, (turn : ℝ) ≤ v → evalL (l.map ((↑) : ℚ → ℝ)) v = F v)
    (vs : List ℚ) (lo : ℚ) (k : ℕ) (cuts : List (List ℚ))
    (hok : massSweep turn q l lo k vs cuts = true) (v : ℝ) (hv : (lo : ℝ) ≤ v) :
    0 ≤ v ^ shOf (k + pickIdx vs v) * F v -
      evalL ((cuts.getD (pickIdx vs v) []).map ((↑) : ℚ → ℝ)) v := by
  induction vs generalizing lo k cuts with
  | nil =>
    rcases cuts with _ | ⟨cut, _ | ⟨_, _⟩⟩ <;> simp [massSweep] at hok
    obtain ⟨hb, ht⟩ := hok
    have h := tailOn_sound _ 16 lo ht v hv
    rw [clearedDiff_eval, hl v ((Rat.cast_le.mpr hb).trans hv)] at h
    simpa [pickIdx] using h
  | cons hi vs ih =>
    cases cuts with
    | nil => simp [massSweep] at hok
    | cons cut cuts =>
      simp only [massSweep, Bool.and_eq_true, decide_eq_true_eq] at hok
      obtain ⟨⟨hlt, hcell⟩, hrest⟩ := hok
      by_cases hb : v < (hi : ℝ)
      · simp only [pickIdx, ↓reduceIte, hb, Nat.add_zero, List.getD_cons_zero]
        apply massInterval_sound hlt hv hb.le _ _ hcell
        · intro hqv h
          rwa [clearedDiff_eval, hq v hqv] at h
        · intro hlv h
          rwa [clearedDiff_eval, hl v hlv] at h
      · have h := ih hi (k + 1) cuts hrest (le_of_not_gt hb)
        simp only [pickIdx, hb, ↓reduceIte, List.getD_cons_succ]
        simpa only [Nat.add_right_comm k 1 (pickIdx vs v), Nat.add_assoc] using h

private def massSlope (w : SWit) : ℚ := ε * (4 / 3) * w.tau

private theorem massPot_forms (w : SWit) (ht : 0 < w.tau) (v : ℝ) :
    (v ≤ ((massC / massSlope w : ℚ) : ℝ) →
      massPot (w.tau * v) = ((massSlope w ^ 2 / massC : ℚ) : ℝ) * v ^ 2) ∧
    (((massC / massSlope w : ℚ) : ℝ) ≤ v →
      massPot (w.tau * v) = 2 * (massSlope w : ℝ) * v - massC) := by
  have ht' : 0 < (w.tau : ℝ) := by exact_mod_cast ht
  have he := epsR_pos
  have hc := massC_pos
  have ha : 0 < (massSlope w : ℝ) := by
    unfold massSlope; push_cast; positivity
  have e : (ε : ℝ) * ((4 / 3) * ((w.tau : ℝ) * v)) = (massSlope w : ℝ) * v := by
    unfold massSlope; push_cast; ring
  rw [Rat.cast_div]
  constructor
  · intro hv
    have hm : (4 / 3) * ((w.tau : ℝ) * v) ≤ (massC : ℝ) / ε := by
      apply (le_div_iff₀ he).mpr
      linarith [e, (le_div_iff₀ ha).mp hv]
    simp only [massPot, phiMass, ↓reduceIte, hm, Rat.cast_div, Rat.cast_pow]
    rw [← mul_pow, e]; ring
  · intro hv
    have hm : (massC : ℝ) ≤ (massSlope w : ℝ) * v := by
      linarith [(div_le_iff₀ ha).mp hv]
    unfold massPot phiMass
    split_ifs with h
    · have hEq : (ε : ℝ) * ((4 / 3) * ((w.tau : ℝ) * v)) = massC := by
        linarith [(le_div_iff₀ he).mp h]
      rw [← mul_pow, hEq]
      have hEq' : (massSlope w : ℝ) * v = massC := e.symm.trans hEq
      field_simp
      nlinarith [congrArg (fun z : ℝ ↦ z * (massC : ℝ)) hEq']
    · linarith [e]

/-- Check a spectral majorant against both branches of the mass potential. -/
def massWitOK (vs : List ℚ) (w : SWit) : Bool :=
  decide (0 < w.tau ∧ 0 < w.lam ∧ 0 < w.mu ∧ 0 ≤ w.nu ∧ 0 ≤ w.y.a1 ∧ 0 ≤ w.y.a6) &&
    massSweep (massC / massSlope w)
      (addLq w.y.list [0, 0, -(massSlope w ^ 2 / massC)])
      (addLq w.y.list [massC, -(2 * massSlope w)]) 0 0 vs
      (specPolys vs w.z w.lam w.mu w.t w.be w.nu)

theorem massWitOK_nonneg (vs : List ℚ) (w : SWit) (hw : massWitOK vs w = true) :
    0 < w.tau ∧ 0 ≤ w.y.a6 := by
  simp only [massWitOK, Bool.and_eq_true, decide_eq_true_eq] at hw
  exact ⟨hw.1.1, hw.1.2.2.2.2.2⟩

/-- Integrate the checked polynomial majorant using the spectral Stein inequality. -/
theorem massWit_tb {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ]
    {U : Ω → ℝ} {x : ℝ} (hM : Moments μ U x) (hS : SteinCut μ U) (vs : List ℚ)
    (hvs : meshOK 0 vs = true) (w : SWit) (hw : massWitOK vs w = true) :
    TB μ U massPot w.tau (w.y.J 0 1 x) := by
  simp only [massWitOK, Bool.and_eq_true, decide_eq_true_eq] at hw
  obtain ⟨⟨ht, hlam, hmu, hnu, h1, h6⟩, hs⟩ := hw
  apply TB.specNode hM hS vs w.z w.lam w.mu w.t w.be w.nu hvs hlam hmu hnu w.y h1 h6
  intro v hv
  have hk : pickIdx vs v = 0 ∨ 0 < v := by
    rcases hv.eq_or_lt with he | hpos
    · subst v
      cases vs with
      | nil => exact Or.inl rfl
      | cons a vs =>
        simp only [meshOK, Bool.and_eq_true, decide_eq_true_eq] at hvs
        have ha := hvs.1
        exact Or.inl (by simp [pickIdx, (Rat.cast_pos.mpr ha)])
    · exact Or.inr hpos
  have hp := massSweep_sound _ _ _
    (fun s : ℝ ↦ evalL (w.y.list.map ((↑) : ℚ → ℝ)) s - massPot (w.tau * s))
    (fun s h ↦ by rw [(massPot_forms w ht s).1 h, evalL_addLq]; simp [evalL]; ring)
    (fun s h ↦ by rw [(massPot_forms w ht s).2 h, evalL_addLq]; simp [evalL]; ring)
    vs 0 0 _ hs v (by simpa using hv)
  simp only [Nat.zero_add, specPolys_getD] at hp
  rw [← specG_cell vs w.z w.lam w.mu w.t w.be w.nu v hk, ← mul_sub] at hp
  have hpos : 0 < v ^ shOf (pickIdx vs v) := by
    rcases hk with hz | hpos
    · simp [hz, shOf]
    · positivity
  linarith [nonneg_of_mul_nonneg_right hp hpos]

end Grothe.Lower
