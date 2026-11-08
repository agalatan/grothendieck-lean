import Grothe.UpperQuad.TwistEllipseCertificateSound
import Mathlib.Algebra.BigOperators.Fin

/-!
# Complete coverage and totals for the twisted ellipse certificates

Every accepted shard refers to the same power and certificate array. An explicit cover of all
source indices yields the actual per-panel acceptance facts; the checked array length identifies
its rational total with the real sum over those same panels. Out-of-range default entries cannot
contribute to the certified sum.

Agent-ID: codex-1a87. Refs #334, #343.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.TwistEllCheck

open Grothe.UpperChaos.Q0GaussAddressScan

/-- An accepted shard supplies its bounds, the full array length, and every indexed predicate. -/
theorem shardOK_spec {g : Power} {first stop : ℕ} {cs : Array Certificate}
    (h : shardOK g first stop cs = true) :
    first ≤ stop ∧ stop ≤ sourcePanels.length ∧ cs.size = sourcePanels.length ∧
      ∀ k, first ≤ k → k < stop →
        certificateOK g (sourcePanels[k]!) (cs[k]!) = true := by
  simp only [shardOK, Bool.and_eq_true, decide_eq_true_eq, List.size_toArray,
    List.all_eq_true] at h
  obtain ⟨⟨⟨hfirst, hstop⟩, hsize⟩, hall⟩ := h
  refine ⟨hfirst, hstop, hsize, ?_⟩
  intro k hk0 hk1
  have hoff : k - first < stop - first := by omega
  have hcheck := hall (k - first) (List.mem_range.mpr hoff)
  rw [show first + (k - first) = k by omega] at hcheck
  simpa only [List.getElem!_toArray] using hcheck

/-- Accepted shards covering all source indices give acceptance for every actual source panel.
The power and certificate array are fixed across the entire cover. -/
theorem certificates_of_shards (g : Power) (cs : Array Certificate)
    (shards : Finset (ℕ × ℕ))
    (hshards : ∀ r ∈ shards, shardOK g r.1 r.2 cs = true)
    (hcover : ∀ k, k < sourcePanels.length →
      ∃ r ∈ shards, r.1 ≤ k ∧ k < r.2) :
    ∀ p : Fin sourcePanels.length,
      certificateOK g (sourcePanels.get p) (cs[p.val]!) = true := by
  intro p
  obtain ⟨r, hr, hfirst, hstop⟩ := hcover p.val p.isLt
  have h := (shardOK_spec (hshards r hr)).2.2.2 p.val hfirst hstop
  simpa only [getElem!_pos sourcePanels p.val p.isLt, List.get_eq_getElem] using h

/-- The executable rational total is the sum over exactly the array's valid indices. -/
theorem totalCap_eq_sum (cs : Array Certificate) :
    totalCap cs = ∑ k : Fin cs.size, (cs[k.val]!).errorCap := by
  unfold totalCap
  rw [← Fin.sum_univ_fun_getElem]
  apply Finset.sum_congr rfl
  intro k _
  rw [getElem!_pos cs k.val k.isLt]
  rfl

/-- An exact length check identifies the array sum with the production panel sum. -/
theorem sum_errorCap_eq_totalCap (cs : Array Certificate)
    (hsize : cs.size = sourcePanels.length) :
    (∑ p : Fin sourcePanels.length, (cs[p.val]!).errorCap) = totalCap cs := by
  rw [← hsize]
  exact (totalCap_eq_sum cs).symm

/-- The accepted rational total bounds the real sum over all production panels. -/
theorem sum_errorCap_le_of_totalOK {cs : Array Certificate} {budget : ℚ}
    (h : totalOK cs budget = true) :
    (∑ p : Fin sourcePanels.length, ((cs[p.val]!).errorCap : ℝ)) ≤ (budget : ℝ) := by
  obtain ⟨hsize, hsum⟩ := totalOK_spec h
  have hq : (∑ p : Fin sourcePanels.length, (cs[p.val]!).errorCap) ≤ budget := by
    rw [sum_errorCap_eq_totalCap cs hsize]
    exact hsum
  exact_mod_cast hq

/-- Full shard coverage and total acceptance supply nonnegative caps for every panel and
their summed real budget, with no missing or default certificate entry. -/
theorem errorCaps_of_shards_and_total (g : Power) (cs : Array Certificate)
    (shards : Finset (ℕ × ℕ))
    (hshards : ∀ r ∈ shards, shardOK g r.1 r.2 cs = true)
    (hcover : ∀ k, k < sourcePanels.length →
      ∃ r ∈ shards, r.1 ≤ k ∧ k < r.2)
    {budget : ℚ} (htotal : totalOK cs budget = true) :
    cs.size = sourcePanels.length ∧
      (∀ p : Fin sourcePanels.length,
        certificateOK g (sourcePanels.get p) (cs[p.val]!) = true ∧
          0 ≤ ((cs[p.val]!).errorCap : ℝ)) ∧
      (∑ p : Fin sourcePanels.length, ((cs[p.val]!).errorCap : ℝ)) ≤ (budget : ℝ) := by
  refine ⟨(totalOK_spec htotal).1, ?_, sum_errorCap_le_of_totalOK htotal⟩
  intro p
  have hc := certificates_of_shards g cs shards hshards hcover p
  refine ⟨hc, ?_⟩
  exact_mod_cast (certificateOK_spec hc).1

end Grothe.UpperQuad.TwistEllCheck
