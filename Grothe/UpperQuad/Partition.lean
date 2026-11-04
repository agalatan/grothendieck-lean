import Grothe.UpperQuad.NodeSound
import Grothe.UpperQuad.Data.Cutoffs
import Grothe.UpperChaos.Q0GaussAddressScan
import Grothe.UpperChaos.Q0LegendreRule64

/-!
# The committed partition as node specs (the data binding of layer (A))

The kernel's `NodeSpec`s of the whole partition are **defined** from master's data, not copied:
the panels `Q0GaussAddressScan.sourcePanels` (`Q0GaussAddress.Panel`: `lo hi : ℚ`, `order`,
`offset`), the root brackets `Q0LegendreRuleNN.brackets` (`[lo, hi] / 2^640`) of each panel's rule,
and the committed cutoffs (`PartitionData.cutoffs`, the only new data).  The node of a spec is the
root of its bracket, chosen classically (`rootOf`); the kernel's flag `bracketOK` (part of
`nodeValid`, decided by the native fact) gives its existence by the intermediate value theorem
(`root_of_bracketOK`), so every node the fact accepts has a genuine Gauss–Legendre node and weight
(`panelNode`/`panelWeight` of master at that root).  The identification of `rootOf` with the root
selected by `Q0GaussSelectedChoice` is master's uniqueness (`all_unique`), used by the analytic
layer that supplies `hQuad`.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad

open GrotheQuad Grothe.UpperChaos Grothe.UpperChaos.Q0LegendreInteger

/-- The brackets of the `n`-point rule, `1 ≤ n ≤ 64` (`[]` otherwise). -/
def ruleBrackets : ℕ → List (ℤ × ℤ)
  | 1 => Q0LegendreRule01.brackets
  | 2 => Q0LegendreRule02.brackets
  | 3 => Q0LegendreRule03.brackets
  | 4 => Q0LegendreRule04.brackets
  | 5 => Q0LegendreRule05.brackets
  | 6 => Q0LegendreRule06.brackets
  | 7 => Q0LegendreRule07.brackets
  | 8 => Q0LegendreRule08.brackets
  | 9 => Q0LegendreRule09.brackets
  | 10 => Q0LegendreRule10.brackets
  | 11 => Q0LegendreRule11.brackets
  | 12 => Q0LegendreRule12.brackets
  | 13 => Q0LegendreRule13.brackets
  | 14 => Q0LegendreRule14.brackets
  | 15 => Q0LegendreRule15.brackets
  | 16 => Q0LegendreRule16.brackets
  | 17 => Q0LegendreRule17.brackets
  | 18 => Q0LegendreRule18.brackets
  | 19 => Q0LegendreRule19.brackets
  | 20 => Q0LegendreRule20.brackets
  | 21 => Q0LegendreRule21.brackets
  | 22 => Q0LegendreRule22.brackets
  | 23 => Q0LegendreRule23.brackets
  | 24 => Q0LegendreRule24.brackets
  | 25 => Q0LegendreRule25.brackets
  | 26 => Q0LegendreRule26.brackets
  | 27 => Q0LegendreRule27.brackets
  | 28 => Q0LegendreRule28.brackets
  | 29 => Q0LegendreRule29.brackets
  | 30 => Q0LegendreRule30.brackets
  | 31 => Q0LegendreRule31.brackets
  | 32 => Q0LegendreRule32.brackets
  | 33 => Q0LegendreRule33.brackets
  | 34 => Q0LegendreRule34.brackets
  | 35 => Q0LegendreRule35.brackets
  | 36 => Q0LegendreRule36.brackets
  | 37 => Q0LegendreRule37.brackets
  | 38 => Q0LegendreRule38.brackets
  | 39 => Q0LegendreRule39.brackets
  | 40 => Q0LegendreRule40.brackets
  | 41 => Q0LegendreRule41.brackets
  | 42 => Q0LegendreRule42.brackets
  | 43 => Q0LegendreRule43.brackets
  | 44 => Q0LegendreRule44.brackets
  | 45 => Q0LegendreRule45.brackets
  | 46 => Q0LegendreRule46.brackets
  | 47 => Q0LegendreRule47.brackets
  | 48 => Q0LegendreRule48.brackets
  | 49 => Q0LegendreRule49.brackets
  | 50 => Q0LegendreRule50.brackets
  | 51 => Q0LegendreRule51.brackets
  | 52 => Q0LegendreRule52.brackets
  | 53 => Q0LegendreRule53.brackets
  | 54 => Q0LegendreRule54.brackets
  | 55 => Q0LegendreRule55.brackets
  | 56 => Q0LegendreRule56.brackets
  | 57 => Q0LegendreRule57.brackets
  | 58 => Q0LegendreRule58.brackets
  | 59 => Q0LegendreRule59.brackets
  | 60 => Q0LegendreRule60.brackets
  | 61 => Q0LegendreRule61.brackets
  | 62 => Q0LegendreRule62.brackets
  | 63 => Q0LegendreRule63.brackets
  | 64 => Q0LegendreRule64.brackets
  | _ => []

/-- The node specs of a panel: one per bracket of its rule, in rule order, with the committed cutoff
of the node's ordinal `offset + i` (capped at `531`, the largest stored degree). -/
def panelSpecs (cutoffs : Array ℕ) (p : Q0GaussAddress.Panel) : List NodeSpec :=
  (ruleBrackets p.order).zipIdx.map fun bi =>
    ⟨p.lo.num, p.lo.den, p.hi.num, p.hi.den, p.order, ⟨bi.1.1, bi.1.2, 640⟩,
      min (cutoffs.getD (p.offset + bi.2) 532) 531⟩

/-- The 21,577 node specs of the committed partition. -/
def partitionSpecs : List NodeSpec :=
  Q0GaussAddressScan.sourcePanels.flatMap (panelSpecs PartitionData.cutoffs)

/-- The root of a spec's bracket (classical; a genuine root when `bracketOK` holds). -/
noncomputable def rootOf (nd : NodeSpec) : ℝ :=
  Classical.epsilon fun y => mem y nd.bracket.toIval ∧ legendreP y nd.order = 0

lemma rootOf_spec (P : ℕ) (hP : 1 ≤ P) (nd : NodeSpec) (h : bracketOK P nd.order nd.bracket = true) :
    mem (rootOf nd) nd.bracket.toIval ∧ legendreP (rootOf nd) nd.order = 0 :=
  Classical.epsilon_spec (root_of_bracketOK P nd.order hP h)

/-- A node accepted by `accumulateSpec` has all its flags. -/
lemma accumulateSpec_valid (P : ℕ) (piI : Ival) (pd : ProfileData) (qLo qHi : ℕ) (nd : NodeSpec)
    (acc acc' : Raw) (h : accumulateSpec P piI pd qLo qHi nd acc = some acc') :
    ∃ neg aI, nodeShift P piI pd nd = some (neg, aI) ∧ nodeValid P nd aI = true := by
  unfold accumulateSpec at h
  split at h
  · exact absurd h (by simp)
  · rename_i neg aI hshift
    split_ifs at h with hvalid
    exact ⟨neg, aI, hshift, hvalid⟩

/-- Every node of an accepted list has all its flags. -/
lemma accumulateSpecs_valid (P : ℕ) (piI : Ival) (pd : ProfileData) (qLo qHi : ℕ) :
    ∀ (specs : List NodeSpec) (acc acc' : Raw), accumulateSpecs P piI pd qLo qHi specs acc = some acc' →
      ∀ nd ∈ specs, ∃ neg aI, nodeShift P piI pd nd = some (neg, aI) ∧ nodeValid P nd aI = true := by
  intro specs
  induction specs with
  | nil => intro _ _ _ nd hnd; simp at hnd
  | cons nd rest ih =>
    intro acc acc' h nd' hnd'
    rw [accumulateSpecs_cons, Option.bind_eq_some_iff] at h
    obtain ⟨acc₁, hcase, h⟩ := h
    rcases List.mem_cons.mp hnd' with rfl | hmem
    · exact accumulateSpec_valid P piI pd qLo qHi nd' acc acc₁ hcase
    · exact ih acc₁ acc' h nd' hmem

/-- The roots of an accepted list lie in their brackets (the hypothesis `hx` of the bridge). -/
lemma rootOf_mem_of_accepted (P : ℕ) (hP : 1 ≤ P) (piI : Ival) (pd : ProfileData) (qLo qHi : ℕ)
    (specs : List NodeSpec) (acc' : Raw)
    (h : accumulateSpecs P piI pd qLo qHi specs rawZero = some acc') :
    ∀ nd ∈ specs, mem (rootOf nd) nd.bracket.toIval := by
  intro nd hnd
  obtain ⟨neg, aI, -, hvalid⟩ := accumulateSpecs_valid P piI pd qLo qHi specs rawZero acc' h nd hnd
  obtain ⟨hbr, -⟩ := nodeValid_unpack P nd aI hvalid
  exact (rootOf_spec P hP nd hbr).1

/-- The node of a spec of the panel `p` is master's `panelNode p.lo p.hi` at the root. -/
lemma specNode_eq_panelNode (cutoffs : Array ℕ) (p : Q0GaussAddress.Panel) (nd : NodeSpec)
    (hnd : nd ∈ panelSpecs cutoffs p) (x : ℝ) :
    specNode nd x = panelNode (p.lo : ℝ) (p.hi : ℝ) x := by
  unfold panelSpecs at hnd
  rw [List.mem_map] at hnd
  obtain ⟨bi, -, rfl⟩ := hnd
  unfold specNode
  simp only
  rw [Rat.cast_def, Rat.cast_def]

/-- The weight of a spec of the panel `p` is master's `panelWeight p.lo p.hi (order − 1)` at the root. -/
lemma specWeight_eq_panelWeight (cutoffs : Array ℕ) (p : Q0GaussAddress.Panel) (nd : NodeSpec)
    (hnd : nd ∈ panelSpecs cutoffs p) (x : ℝ) :
    specWeight nd x = panelWeight (p.lo : ℝ) (p.hi : ℝ) (p.order - 1) x := by
  unfold panelSpecs at hnd
  rw [List.mem_map] at hnd
  obtain ⟨bi, -, rfl⟩ := hnd
  unfold specWeight
  simp only
  rw [Rat.cast_def, Rat.cast_def]

end Grothe.UpperQuad
