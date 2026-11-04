import Grothe.UpperChaos.Q0GaussPhysicalBounds
import Grothe.UpperChaos.Q0NodeMassTerm

/-! Positional projection transfers physical node/weight enclosures to the
mass ledger, without identifying the production Gauss rule. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0GaussMassBridge

abbrev Physical := Grothe.UpperChaos.Q0GaussPhysicalCheck.Row
abbrev Mass := Grothe.UpperChaos.Q0NodeMassCheck.Row

/-- Matched ordered rows give the mass ledger the same actual node and
weight bounds, using the shared original ordinal. -/
theorem enclosures_of_projection (physical : List Physical) (mass : List Mass)
    (hprojection : physical.map (fun r => (r.index, r.panel, r.rule, r.physicalLower, r.physicalUpperWeight)) =
      mass.map (fun r => (r.index, r.panel, r.rule, r.nodeLower, r.weightUpper)))
    (s w : ℕ → ℝ)
    (hphysical : ∀ r ∈ physical,
      (r.physicalLower : ℝ) / 10^9 ≤ s r.index ∧ 0 ≤ w r.index ∧
      w r.index ≤ (r.physicalUpperWeight : ℝ) / 10^12) :
    ∀ r ∈ mass, (r.nodeLower : ℝ) / 10^9 ≤ s r.index ∧ 0 ≤ w r.index ∧
      w r.index ≤ (r.weightUpper : ℝ) / 10^12 := by
  intro r hr
  have hm : (r.index, r.panel, r.rule, r.nodeLower, r.weightUpper) ∈
      mass.map (fun q => (q.index, q.panel, q.rule, q.nodeLower, q.weightUpper)) :=
    List.mem_map.mpr ⟨r, hr, rfl⟩
  rw [← hprojection] at hm
  obtain ⟨p, hp, heq⟩ := List.mem_map.mp hm
  simp only [Prod.mk.injEq] at heq
  obtain ⟨hindex, _, _, hlower, hupper⟩ := heq
  simpa only [hindex, hlower, hupper] using hphysical p hp

/-- Summing the matched rows yields the checked mass-ledger upper sum. -/
theorem sum_bound_of_projection (physical : List Physical) (mass : List Mass)
    (hprojection : physical.map (fun r => (r.index, r.panel, r.rule, r.physicalLower, r.physicalUpperWeight)) =
      mass.map (fun r => (r.index, r.panel, r.rule, r.nodeLower, r.weightUpper)))
    (s w : ℕ → ℝ)
    (hphysical : ∀ r ∈ physical,
      (r.physicalLower : ℝ) / 10^9 ≤ s r.index ∧ 0 ≤ w r.index ∧
      w r.index ≤ (r.physicalUpperWeight : ℝ) / 10^12)
    (hvalid : ∀ r ∈ mass, Grothe.UpperChaos.Q0NodeMassCheck.valid r = true) :
    (mass.map (fun r => w r.index * Real.exp (-(s r.index)))).sum ≤
      ((mass.map Grothe.UpperChaos.Q0NodeMassCheck.Row.termUpper).sum : ℝ) / 10^18 := by
  have h := enclosures_of_projection physical mass hprojection s w hphysical
  exact Grothe.UpperChaos.Q0NodeMassCheck.sum_weighted_nodes_le mass
    (fun r => s r.index) (fun r => w r.index) hvalid
    (fun r hr => (h r hr).1) (fun r hr => (h r hr).2.1) (fun r hr => (h r hr).2.2)

end Grothe.UpperChaos.Q0GaussMassBridge
