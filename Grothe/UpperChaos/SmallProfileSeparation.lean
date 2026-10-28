import Grothe.UpperChaos.SmallProfileMesh
import Grothe.UpperChaos.SmallProfileSeparationData

/-!
# Uniform profile separation on the full-auxiliary strips

The existing profile cover excludes zero outside three broad neighborhoods.
Eight additional centered-Horner rows cover the gaps between those
neighborhoods and the concrete selected strips. Together they give a uniform
positive denominator for the reciprocal model on every nonselected strip.

Agent-ID: codex-2ca4
-/

open Set

namespace Grothe.UpperChaos.SmallProfileMesh
open ProfileRootScreen
noncomputable section

def separatedRowCheck (r : Row) : Bool :=
  decide (GrotheKernel.D < 1000 * (evalRow r).lo ∨
    1000 * (evalRow r).hi < -GrotheKernel.D)

set_option maxRecDepth 65536 in
set_option maxHeartbeats 0 in
/-- The kernel checks both complete gap coverage and every separation enclosure. -/
theorem gaps_checked : ∀ i : Fin 6,
    coverCheck (gapLoQ i) (gapHiQ i) (gapRows i) = true ∧
      (gapRows i).all separatedRowCheck = true := by
  decide +kernel

/-- An arbitrary checked row separates the actual normalized profile from zero. -/
theorem profile_separated_of_row (r : Row) (s : ℝ)
    (hc : separatedRowCheck r = true)
    (hlo : (r.lo : ℝ) ≤ s) (hhi : s ≤ (r.hi : ℝ)) :
    (1 / 1000 : ℝ) < |Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof s| := by
  let y : ℝ := Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof s
  have hm : Grothe.Upper.mem y (evalRow r) := by
    simpa only [centered_horner_profile] using row_horner_mem r s hlo hhi
  simp only [separatedRowCheck, decide_eq_true_eq] at hc
  have hD : 0 < (GrotheKernel.D : ℝ) := Grothe.Upper.D_pos
  unfold Grothe.Upper.mem at hm
  change (1 / 1000 : ℝ) < |y|
  rcases hc with hp | hn
  · have hpR : (GrotheKernel.D : ℝ) < 1000 * ((evalRow r).lo : ℝ) := by
      exact_mod_cast hp
    have hy : (1 / 1000 : ℝ) < y := by
      by_contra h
      have ht : (1000 * y - 1) * GrotheKernel.D ≤ 0 :=
        mul_nonpos_of_nonpos_of_nonneg (by linarith) hD.le
      nlinarith [hm.1]
    exact hy.trans_le (le_abs_self y)
  · have hnR : 1000 * ((evalRow r).hi : ℝ) < -(GrotheKernel.D : ℝ) := by
      exact_mod_cast hn
    have hy : y < (-1 / 1000 : ℝ) := by
      by_contra h
      have ht : (1000 * y + 1) * GrotheKernel.D ≥ 0 :=
        mul_nonneg (by linarith) hD.le
      nlinarith [hm.2]
    have hy' : (1 / 1000 : ℝ) < -y := by linarith
    exact hy'.trans_le (neg_le_abs y)

/-- The whole of each complementary gap has the same strict profile bound. -/
theorem profile_on_gap (i : Fin 6) (s : ℝ)
    (hlo : (gapLoQ i : ℝ) ≤ s) (hhi : s ≤ (gapHiQ i : ℝ)) :
    (1 / 1000 : ℝ) < |Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof s| := by
  obtain ⟨r, hr, hrl, hrh⟩ := coverCheck_sound (gapRows i)
    (gapLoQ i) (gapHiQ i) s (gaps_checked i).1 hlo hhi
  exact profile_separated_of_row r s
    ((List.all_eq_true.mp (gaps_checked i).2) r hr) hrl hrh

/-- Separation holds outside the interiors of all three selected strips. -/
theorem profile_separated_of_sides (s : ℝ) (h0 : 0 ≤ s) (h80 : s ≤ 80)
    (hfirst : s ≤ cut 1 ∨ cut 2 ≤ s)
    (hsecond : s ≤ cut 3 ∨ cut 4 ≤ s)
    (hthird : s ≤ cut 5 ∨ cut 6 ≤ s) :
    (1 / 1000 : ℝ) < |Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof s| := by
  by_cases hroot : InRootNeighborhood s
  · rcases hroot with ⟨hlo, hhi⟩ | ⟨hlo, hhi⟩ | ⟨hlo, hhi⟩
    · rcases hfirst with h | h
      · exact profile_on_gap 0 s (by simpa [gapLoQ] using hlo)
          (by simpa [gapHiQ, cut] using h)
      · exact profile_on_gap 1 s (by simpa [gapLoQ, cut] using h)
          (by simpa [gapHiQ] using hhi)
    · rcases hsecond with h | h
      · exact profile_on_gap 2 s (by simpa [gapLoQ] using hlo)
          (by simpa [gapHiQ, cut] using h)
      · exact profile_on_gap 3 s (by simpa [gapLoQ, cut] using h)
          (by simpa [gapHiQ] using hhi)
    · rcases hthird with h | h
      · exact profile_on_gap 4 s (by simpa [gapLoQ] using hlo)
          (by simpa [gapHiQ, cut] using h)
      · exact profile_on_gap 5 s (by simpa [gapLoQ, cut] using h)
          (by simpa [gapHiQ] using hhi)
  · exact profile_outer s h0 h80 hroot

/-- Every complete nonselected strip, including its endpoints, is separated
from the zeros of the actual profile. -/
theorem profile_on_nonselected (k : ℕ) (hk : k < 7) (hsel : ¬ selected k)
    (s : ℝ) (hs : s ∈ Icc (cut k) (cut (k + 1))) :
    (1 / 1000 : ℝ) < |Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof s| := by
  have h0 : 0 ≤ s := by
    have h := (monotone_cut (Nat.zero_le k)).trans hs.1
    simpa only [cut_zero] using h
  have h80 : s ≤ 80 := by
    have h := hs.2.trans (monotone_cut (Nat.succ_le_of_lt hk))
    simpa only [cut_seven] using h
  have hside (m : ℕ) (hm : selected m) : s ≤ cut m ∨ cut (m + 1) ≤ s := by
    by_cases hkm : k < m
    · exact Or.inl (hs.2.trans (monotone_cut (Nat.succ_le_of_lt hkm)))
    · have hne : k ≠ m := by
        intro h
        subst k
        exact hsel hm
      have hmk : m + 1 ≤ k := by omega
      exact Or.inr ((monotone_cut hmk).trans hs.1)
  exact profile_separated_of_sides s h0 h80
    (hside 1 (by decide)) (hside 3 (by decide)) (hside 5 (by decide))

/-- The reciprocal Gaussian denominator has a uniform positive lower bound
on every full-auxiliary strip, independent of how small the reciprocal variable is. -/
theorem reciprocal_denominator_lower (k : ℕ) (hk : k < 7) (hsel : ¬ selected k)
    (s x α : ℝ) (hα : 0 ≤ α) (hs : s ∈ Icc (cut k) (cut (k + 1))) :
    (1 / 10 ^ 6 : ℝ) <
      α * x ^ 2 + (Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof s) ^ 2 := by
  have h := profile_on_nonselected k hk hsel s hs
  have hsq := (sq_lt_sq₀ (by norm_num : (0 : ℝ) ≤ 1 / 1000) (abs_nonneg _)).2 h
  rw [sq_abs] at hsq
  nlinarith [mul_nonneg hα (sq_nonneg x)]

end
end Grothe.UpperChaos.SmallProfileMesh
