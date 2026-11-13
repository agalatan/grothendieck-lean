import Grothe.UpperQuad.TailBound
import Grothe.UpperChaos.Q0GaussAddressScan

/-!
# The panels tile the covered radial set (part (Q) of `hQuad`)

`segOK ps a b`: the panels `ps` are consecutive (`lo` of each is the `hi` of the previous),
nondegenerate,
and run from `a` to `b`.  The committed partition is four such segments, separated by the three root
gaps of `Tail.tailSet` (`segments_ok`, kernel-checked), so the covered set
`tailSetᶜ ∩ (0, ∞) = (0, g₁] ∪ [g₁', g₂] ∪ [g₂', g₃] ∪ [g₃', 100]` is the union of the panels
(`setIntegral_covered_eq_sum`).

Agent-ID: claude-b9ee. Refs #303.
-/

namespace Grothe.UpperQuad.QuadRem

open MeasureTheory Set Grothe.UpperChaos Grothe.UpperChaos.Q0GaussAddress

/-- A consecutive chain of nondegenerate panels from `a` to `b`. -/
def segOK : List Panel → ℚ → ℚ → Bool
  | [], a, b => decide (a = b)
  | p :: ps, a, b => decide (p.lo = a) && decide (p.lo < p.hi) && segOK ps p.hi b

lemma segOK_integral {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    (f : ℝ → E) : ∀ (ps : List Panel) (a b : ℚ), segOK ps a b = true →
      (∀ p ∈ ps, IntervalIntegrable f volume (p.lo : ℝ) p.hi) →
      (a : ℝ) ≤ b ∧ IntervalIntegrable f volume (a : ℝ) b ∧
        (ps.map fun p => ∫ s in (p.lo : ℝ)..p.hi, f s).sum = ∫ s in (a : ℝ)..b, f s := by
  intro ps
  induction ps with
  | nil =>
    intro a b h _
    simp only [segOK, decide_eq_true_eq] at h
    subst h
    simp
  | cons p ps ih =>
    intro a b h hint
    simp only [segOK, Bool.and_eq_true, decide_eq_true_eq] at h
    obtain ⟨⟨hlo, hlt⟩, hrest⟩ := h
    obtain ⟨hle, hint', hsum⟩ := ih p.hi b hrest (fun q hq => hint q (List.mem_cons_of_mem _ hq))
    have hp := hint p (List.mem_cons_self ..)
    rw [hlo] at hp hlt
    have hlt' : (a : ℝ) < p.hi := by exact_mod_cast hlt
    refine ⟨by linarith, hp.trans hint', ?_⟩
    rw [List.map_cons, List.sum_cons, hsum, hlo,
      intervalIntegral.integral_add_adjacent_intervals hp hint']

/-- The four segments of the partition. -/
def seg1 : List Panel := Q0GaussAddressScan.sourcePanels.take 211
def seg2 : List Panel := (Q0GaussAddressScan.sourcePanels.drop 211).take 410
def seg3 : List Panel := (Q0GaussAddressScan.sourcePanels.drop 621).take 405
def seg4 : List Panel := Q0GaussAddressScan.sourcePanels.drop 1026

theorem seg1_ok : segOK seg1 0 Tail.gap1lo = true := by decide +kernel
theorem seg2_ok : segOK seg2 Tail.gap1hi Tail.gap2lo = true := by decide +kernel
theorem seg3_ok : segOK seg3 Tail.gap2hi Tail.gap3lo = true := by decide +kernel
theorem seg4_ok : segOK seg4 Tail.gap3hi 100 = true := by decide +kernel

lemma sourcePanels_eq_segs :
    Q0GaussAddressScan.sourcePanels = seg1 ++ seg2 ++ seg3 ++ seg4 := by
  set L := Q0GaussAddressScan.sourcePanels
  have h1 := List.take_append_drop 211 L
  have h2 := List.take_append_drop 410 (L.drop 211)
  have h3 := List.take_append_drop 405 (L.drop 621)
  rw [List.drop_drop] at h2 h3
  simp only [Nat.reduceAdd] at h2 h3
  unfold seg1 seg2 seg3 seg4
  rw [List.append_assoc, List.append_assoc, h3, h2, h1]

theorem panels_lo_nonneg_check :
    (Q0GaussAddressScan.sourcePanels.all fun p => decide (0 ≤ p.lo)) = true := by decide +kernel

lemma panel_lo_nonneg (p : Fin Q0GaussAddressScan.sourcePanels.length) :
    (0 : ℝ) ≤ (Q0GaussAddressScan.sourcePanels.get p).lo := by
  have h := List.all_eq_true.mp panels_lo_nonneg_check _ (List.get_mem _ p)
  exact_mod_cast of_decide_eq_true h

/-- The covered radial set as four intervals. -/
lemma covered_eq : Tail.tailSetᶜ ∩ Ioi 0 =
    Ioc 0 (Tail.gap1lo : ℝ) ∪ Icc (Tail.gap1hi : ℝ) Tail.gap2lo ∪
      Icc (Tail.gap2hi : ℝ) Tail.gap3lo ∪
      Icc (Tail.gap3hi : ℝ) 100 := by
  have o1 : (0 : ℝ) < Tail.gap1lo := by norm_num [Tail.gap1lo]
  have o2 : (Tail.gap1lo : ℝ) < Tail.gap1hi := by norm_num [Tail.gap1lo, Tail.gap1hi]
  have o3 : (Tail.gap1hi : ℝ) < Tail.gap2lo := by norm_num [Tail.gap1hi, Tail.gap2lo]
  have o4 : (Tail.gap2lo : ℝ) < Tail.gap2hi := by norm_num [Tail.gap2lo, Tail.gap2hi]
  have o5 : (Tail.gap2hi : ℝ) < Tail.gap3lo := by norm_num [Tail.gap2hi, Tail.gap3lo]
  have o6 : (Tail.gap3lo : ℝ) < Tail.gap3hi := by norm_num [Tail.gap3lo, Tail.gap3hi]
  have o7 : (Tail.gap3hi : ℝ) < 100 := by norm_num [Tail.gap3hi]
  ext s
  simp only [Tail.tailSet, mem_inter_iff, mem_compl_iff, mem_union, mem_Ioi, mem_Ioo, mem_Ioc,
    mem_Icc, not_or, not_and, not_lt]
  constructor
  · rintro ⟨⟨⟨⟨h100, h1⟩, h2⟩, h3⟩, h0⟩
    by_cases a1 : s ≤ Tail.gap1lo
    · exact Or.inl (Or.inl (Or.inl ⟨h0, a1⟩))
    · have b1 := h1 (by linarith)
      by_cases a2 : s ≤ Tail.gap2lo
      · exact Or.inl (Or.inl (Or.inr ⟨b1, a2⟩))
      · have b2 := h2 (by linarith)
        by_cases a3 : s ≤ Tail.gap3lo
        · exact Or.inl (Or.inr ⟨b2, a3⟩)
        · exact Or.inr ⟨h3 (by linarith), h100⟩
  · rintro (((⟨h0, h1⟩ | ⟨h0, h1⟩) | ⟨h0, h1⟩) | ⟨h0, h1⟩) <;>
      refine ⟨⟨⟨⟨by linarith, fun h => by linarith⟩, fun h => by linarith⟩, fun h => by linarith⟩,
        by linarith⟩

/-- **The covered integral is the sum over the panels.** -/
theorem setIntegral_covered_eq (f : ℝ → ℂ)
    (hint : ∀ p ∈ Q0GaussAddressScan.sourcePanels, IntervalIntegrable f volume (p.lo : ℝ) p.hi) :
    ∫ s in Tail.tailSetᶜ ∩ Ioi 0, f s =
      (Q0GaussAddressScan.sourcePanels.map fun p => ∫ s in (p.lo : ℝ)..p.hi, f s).sum := by
  have hs := sourcePanels_eq_segs
  obtain ⟨l1, i1, s1⟩ := segOK_integral f seg1 0 Tail.gap1lo seg1_ok fun p hp =>
    hint p (by rw [hs]; simp [hp])
  obtain ⟨l2, i2, s2⟩ := segOK_integral f seg2 Tail.gap1hi Tail.gap2lo seg2_ok fun p hp =>
    hint p (by rw [hs]; simp [hp])
  obtain ⟨l3, i3, s3⟩ := segOK_integral f seg3 Tail.gap2hi Tail.gap3lo seg3_ok fun p hp =>
    hint p (by rw [hs]; simp [hp])
  obtain ⟨l4, i4, s4⟩ := segOK_integral f seg4 Tail.gap3hi 100 seg4_ok fun p hp =>
    hint p (by rw [hs]; simp [hp])
  push_cast at l1 i1 s1 l4 i4 s4
  have o2 : (Tail.gap1lo : ℝ) < Tail.gap1hi := by norm_num [Tail.gap1lo, Tail.gap1hi]
  have o4 : (Tail.gap2lo : ℝ) < Tail.gap2hi := by norm_num [Tail.gap2lo, Tail.gap2hi]
  have o6 : (Tail.gap3lo : ℝ) < Tail.gap3hi := by norm_num [Tail.gap3lo, Tail.gap3hi]
  have I1 : IntegrableOn f (Ioc 0 (Tail.gap1lo : ℝ)) :=
    (intervalIntegrable_iff_integrableOn_Ioc_of_le l1).mp i1
  have I2 : IntegrableOn f (Icc (Tail.gap1hi : ℝ) Tail.gap2lo) :=
    (intervalIntegrable_iff_integrableOn_Icc_of_le l2).mp i2
  have I3 : IntegrableOn f (Icc (Tail.gap2hi : ℝ) Tail.gap3lo) :=
    (intervalIntegrable_iff_integrableOn_Icc_of_le l3).mp i3
  have I4 : IntegrableOn f (Icc (Tail.gap3hi : ℝ) 100) :=
    (intervalIntegrable_iff_integrableOn_Icc_of_le l4).mp i4
  have d1 : Disjoint (Ioc 0 (Tail.gap1lo : ℝ)) (Icc (Tail.gap1hi : ℝ) Tail.gap2lo) :=
    Set.disjoint_left.mpr fun _ h1 h2 => by linarith [h1.2, h2.1]
  have d2 : Disjoint (Ioc 0 (Tail.gap1lo : ℝ) ∪ Icc (Tail.gap1hi : ℝ) Tail.gap2lo)
      (Icc (Tail.gap2hi : ℝ) Tail.gap3lo) :=
    Set.disjoint_left.mpr fun _ h1 h2 => by rcases h1 with h1 | h1 <;> linarith [h1.2, h2.1]
  have d3 : Disjoint (Ioc 0 (Tail.gap1lo : ℝ) ∪ Icc (Tail.gap1hi : ℝ) Tail.gap2lo ∪
      Icc (Tail.gap2hi : ℝ) Tail.gap3lo) (Icc (Tail.gap3hi : ℝ) 100) :=
    Set.disjoint_left.mpr fun _ h1 h2 => by
      rcases h1 with (h1 | h1) | h1 <;> linarith [h1.2, h2.1]
  rw [covered_eq, setIntegral_union d3 measurableSet_Icc ((I1.union I2).union I3) I4,
    setIntegral_union d2 measurableSet_Icc (I1.union I2) I3,
    setIntegral_union d1 measurableSet_Icc I1 I2,
    integral_Icc_eq_integral_Ioc, integral_Icc_eq_integral_Ioc, integral_Icc_eq_integral_Ioc,
    ← intervalIntegral.integral_of_le l1, ← intervalIntegral.integral_of_le l2,
    ← intervalIntegral.integral_of_le l3, ← intervalIntegral.integral_of_le l4,
    ← s1, ← s2, ← s3, ← s4, hs]
  simp only [List.map_append, List.sum_append]

end Grothe.UpperQuad.QuadRem
