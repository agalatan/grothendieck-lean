import Grothe.UpperQuad.QuadEllipsePanelSound

/-!
# Soundness of the ellipse checker, part 4: sums of panels and the shard check

`shardOK_sound`: an accepted shard `[i₀, i₀ + len)` gives, for every panel of the shard, a bound
`Ev k` with `PanelGood`, and `Σ_k Ev k < budget`.

Agent-ID: claude-b9ee. Refs #303.
-/

namespace Grothe.UpperQuad.EllCheck

open GrotheQuad Grothe.UpperQuad Grothe.UpperQuad.QuadRem

/-- The fold of `errSum` from any accumulator. -/
lemma errSum_fold_sound (hc : chatOK = true) :
    ∀ (pps : List (Grothe.UpperChaos.Q0GaussAddress.Panel × Plan)) (acc s : Ival) (A : ℝ),
      mem A acc →
      pps.foldl (fun acc pp =>
        match acc, panelErr gList pp.1 pp.2 with
        | some a, some b => some (addI P a b)
        | _, _ => none) (some acc) = some s →
      ∃ f : ℕ → ℝ, (∀ k, k < pps.length → PanelGood (pps.getD k default).1 (f k)) ∧
        mem (A + ∑ k ∈ Finset.range pps.length, f k) s := by
  intro pps
  induction pps with
  | nil =>
    intro acc s A hA h
    simp only [List.foldl_nil, Option.some.injEq] at h
    subst h
    exact ⟨fun _ => 0, fun k hk => absurd hk (by simp), by simpa using hA⟩
  | cons pp rest ih =>
    intro acc s A hA h
    rw [List.foldl_cons] at h
    cases he : panelErr gList pp.1 pp.2 with
    | none =>
      rw [he] at h
      -- the accumulator stays `none`
      have : ∀ l : List (Grothe.UpperChaos.Q0GaussAddress.Panel × Plan),
          l.foldl (fun acc pp =>
            match acc, panelErr gList pp.1 pp.2 with
            | some a, some b => some (addI P a b)
            | _, _ => none) none = none := by
        intro l; induction l with
        | nil => rfl
        | cons _ _ ih' => exact ih'
      simp only at h
      rw [this] at h; simp at h
    | some E =>
      rw [he] at h
      simp only at h
      obtain ⟨Ev, hEv, hgood⟩ := panelErr_sound hc pp.1 pp.2 he
      obtain ⟨f, hf, hs⟩ := ih (addI P acc E) s (A + Ev) (mem_addI P hA hEv) h
      refine ⟨fun k => if k = 0 then Ev else f (k - 1), fun k hk => ?_, ?_⟩
      · cases k with
        | zero => simpa using hgood
        | succ k =>
          simp only [Nat.succ_ne_zero, ite_false, Nat.add_sub_cancel]
          simpa using hf k (by simp at hk; omega)
      · rw [List.length_cons, Finset.sum_range_succ']
        simp only [ite_true, Nat.succ_ne_zero, ite_false, Nat.add_sub_cancel]
        convert hs using 1
        ring

/-- **An accepted shard.** -/
theorem shardOK_sound {plans : List Plan} {i₀ len : ℕ} {budget : ℚ}
    (h : shardOK plans i₀ len budget = true) :
    ∃ f : ℕ → ℝ, (∀ k, k < len →
      PanelGood (Grothe.UpperChaos.Q0GaussAddressScan.sourcePanels.getD (i₀ + k) default)
        (f k)) ∧ ∑ k ∈ Finset.range len, f k < budget := by
  unfold shardOK at h
  simp only [Bool.and_eq_true, beq_iff_eq] at h
  obtain ⟨⟨hc, hlen⟩, h⟩ := h
  set pps := ((Grothe.UpperChaos.Q0GaussAddressScan.sourcePanels.drop i₀).take len).zip
    ((plans.drop i₀).take len) with hpps
  cases hs : errSum gList pps with
  | none => rw [hs] at h; simp at h
  | some s =>
    rw [hs] at h
    simp only at h
    obtain ⟨f, hf, hsum⟩ := errSum_fold_sound hc pps zeroI s 0 ((mem_zeroI_iff 0).2 rfl) hs
    refine ⟨f, fun k hk => ?_, ?_⟩
    · have hk' : k < pps.length := hlen ▸ hk
      convert hf k hk' using 2
      have hl1 :
          k < ((Grothe.UpperChaos.Q0GaussAddressScan.sourcePanels.drop i₀).take len).length := by
        have := hk'; rw [hpps, List.length_zip] at this; omega
      have hl0 : i₀ + k < Grothe.UpperChaos.Q0GaussAddressScan.sourcePanels.length := by
        simp only [List.length_take, List.length_drop] at hl1; omega
      rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hl0, Option.getD_some,
        List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hk', Option.getD_some]
      simp only [hpps, List.getElem_zip, List.getElem_take, List.getElem_drop]
    · have hb := pos_of_isPos h (mem_subI P (mem_qI budget) hsum)
      rw [zero_add, ← hlen] at *
      linarith

end Grothe.UpperQuad.EllCheck
