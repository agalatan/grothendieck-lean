import Grothe.UpperQuad.Partition
import Grothe.UpperChaos.Q0GaussProductionMass

/-!
# The roots of the partition are master's selected roots

`Partition.rootOf nd` is a classical choice of a root of `P_order` in the bracket of the spec.  Master
selects, for every rule `n ≤ 64`, the root of each bracket by `Q0LegendreRuleNN.all_unique`
(existence and **uniqueness** of the root in each bracket, `Q0GaussSelectedRuleNN.root`,
`Q0GaussSelectedChoice.selectedFor`), and the production node of a source address
`a : Address = Σ p, Fin (sourcePanels.get p).order` is `Q0GaussProductionMass.sourceNode a =
panelNode p.lo p.hi (sourceRoot a)`.  Here the two are identified: the spec of the address `a`
(`addressSpec`, the `a.2`-th spec of `panelSpecs` of the panel `a.1`) has `rootOf (addressSpec a) =
sourceRoot a` (`rootOf_addressSpec`; the uniqueness clause, with existence supplied by master, so no
kernel flag is needed), hence `specNode … (rootOf …) = sourceNode a` and `specWeight … = sourceWeight a`,
and every sum over `partitionSpecs` is a sum over `Address` (`sum_partitionSpecs`).  The Gauss sums of
the bridge are rewritten in these terms in `Grothe/UpperQuad/QuadDecomp.lean`.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad

open GrotheQuad Grothe.UpperChaos Grothe.UpperChaos.Q0LegendreInteger
  Grothe.UpperChaos.Q0GaussAddressScan Grothe.UpperChaos.Q0GaussOrdinalEquiv
  Grothe.UpperChaos.Q0GaussProductionMass

/-! ### The brackets and the selected roots of a rule -/

/-- The bracket list of every rule has the rule's order as its length. -/
theorem ruleBrackets_length (n : ℕ) (hn : 1 ≤ n ∧ n ≤ 64) : (ruleBrackets n).length = n := by
  obtain ⟨hlo, hhi⟩ := hn
  interval_cases n
  · exact Grothe.UpperChaos.Q0LegendreRule01.count
  · exact Grothe.UpperChaos.Q0LegendreRule02.count
  · exact Grothe.UpperChaos.Q0LegendreRule03.count
  · exact Grothe.UpperChaos.Q0LegendreRule04.count
  · exact Grothe.UpperChaos.Q0LegendreRule05.count
  · exact Grothe.UpperChaos.Q0LegendreRule06.count
  · exact Grothe.UpperChaos.Q0LegendreRule07.count
  · exact Grothe.UpperChaos.Q0LegendreRule08.count
  · exact Grothe.UpperChaos.Q0LegendreRule09.count
  · exact Grothe.UpperChaos.Q0LegendreRule10.count
  · exact Grothe.UpperChaos.Q0LegendreRule11.count
  · exact Grothe.UpperChaos.Q0LegendreRule12.count
  · exact Grothe.UpperChaos.Q0LegendreRule13.count
  · exact Grothe.UpperChaos.Q0LegendreRule14.count
  · exact Grothe.UpperChaos.Q0LegendreRule15.count
  · exact Grothe.UpperChaos.Q0LegendreRule16.count
  · exact Grothe.UpperChaos.Q0LegendreRule17.count
  · exact Grothe.UpperChaos.Q0LegendreRule18.count
  · exact Grothe.UpperChaos.Q0LegendreRule19.count
  · exact Grothe.UpperChaos.Q0LegendreRule20.count
  · exact Grothe.UpperChaos.Q0LegendreRule21.count
  · exact Grothe.UpperChaos.Q0LegendreRule22.count
  · exact Grothe.UpperChaos.Q0LegendreRule23.count
  · exact Grothe.UpperChaos.Q0LegendreRule24.count
  · exact Grothe.UpperChaos.Q0LegendreRule25.count
  · exact Grothe.UpperChaos.Q0LegendreRule26.count
  · exact Grothe.UpperChaos.Q0LegendreRule27.count
  · exact Grothe.UpperChaos.Q0LegendreRule28.count
  · exact Grothe.UpperChaos.Q0LegendreRule29.count
  · exact Grothe.UpperChaos.Q0LegendreRule30.count
  · exact Grothe.UpperChaos.Q0LegendreRule31.count
  · exact Grothe.UpperChaos.Q0LegendreRule32.count
  · exact Grothe.UpperChaos.Q0LegendreRule33.count
  · exact Grothe.UpperChaos.Q0LegendreRule34.count
  · exact Grothe.UpperChaos.Q0LegendreRule35.count
  · exact Grothe.UpperChaos.Q0LegendreRule36.count
  · exact Grothe.UpperChaos.Q0LegendreRule37.count
  · exact Grothe.UpperChaos.Q0LegendreRule38.count
  · exact Grothe.UpperChaos.Q0LegendreRule39.count
  · exact Grothe.UpperChaos.Q0LegendreRule40.count
  · exact Grothe.UpperChaos.Q0LegendreRule41.count
  · exact Grothe.UpperChaos.Q0LegendreRule42.count
  · exact Grothe.UpperChaos.Q0LegendreRule43.count
  · exact Grothe.UpperChaos.Q0LegendreRule44.count
  · exact Grothe.UpperChaos.Q0LegendreRule45.count
  · exact Grothe.UpperChaos.Q0LegendreRule46.count
  · exact Grothe.UpperChaos.Q0LegendreRule47.count
  · exact Grothe.UpperChaos.Q0LegendreRule48.count
  · exact Grothe.UpperChaos.Q0LegendreRule49.count
  · exact Grothe.UpperChaos.Q0LegendreRule50.count
  · exact Grothe.UpperChaos.Q0LegendreRule51.count
  · exact Grothe.UpperChaos.Q0LegendreRule52.count
  · exact Grothe.UpperChaos.Q0LegendreRule53.count
  · exact Grothe.UpperChaos.Q0LegendreRule54.count
  · exact Grothe.UpperChaos.Q0LegendreRule55.count
  · exact Grothe.UpperChaos.Q0LegendreRule56.count
  · exact Grothe.UpperChaos.Q0LegendreRule57.count
  · exact Grothe.UpperChaos.Q0LegendreRule58.count
  · exact Grothe.UpperChaos.Q0LegendreRule59.count
  · exact Grothe.UpperChaos.Q0LegendreRule60.count
  · exact Grothe.UpperChaos.Q0LegendreRule61.count
  · exact Grothe.UpperChaos.Q0LegendreRule62.count
  · exact Grothe.UpperChaos.Q0LegendreRule63.count
  · exact Grothe.UpperChaos.Q0LegendreRule64.count

/-- The existence and uniqueness clauses of a rule's `all_unique`, in the `getD` form of `panelSpecs`. -/
theorem rule_root_spec {k : ℕ} (brackets : List (ℤ × ℤ)) (hcount : brackets.length = k + 1)
    (root : Fin (k + 1) → ℝ)
    (hspec : ∀ i : Fin (k + 1),
      root i ∈ Set.Icc
          ((((brackets.get ⟨i.val, by simpa only [hcount] using i.isLt⟩).1 : ℤ) : ℝ) /
            Q0LegendreRuleBase.denominator)
          ((((brackets.get ⟨i.val, by simpa only [hcount] using i.isLt⟩).2 : ℤ) : ℝ) /
            Q0LegendreRuleBase.denominator) ∧
        (realPair (root i) k).2 = 0)
    (huniq : ∀ i x, x ∈ Set.Icc
          ((((brackets.get ⟨i.val, by simpa only [hcount] using i.isLt⟩).1 : ℤ) : ℝ) /
            Q0LegendreRuleBase.denominator)
          ((((brackets.get ⟨i.val, by simpa only [hcount] using i.isLt⟩).2 : ℤ) : ℝ) /
            Q0LegendreRuleBase.denominator) →
        (realPair x k).2 = 0 → x = root i)
    (i : Fin (k + 1)) :
    root i ∈ Set.Icc (((brackets.getD i.val (0, 0)).1 : ℝ) / Q0LegendreRuleBase.denominator)
        (((brackets.getD i.val (0, 0)).2 : ℝ) / Q0LegendreRuleBase.denominator) ∧
      (realPair (root i) k).2 = 0 ∧
      ∀ y, y ∈ Set.Icc (((brackets.getD i.val (0, 0)).1 : ℝ) / Q0LegendreRuleBase.denominator)
          (((brackets.getD i.val (0, 0)).2 : ℝ) / Q0LegendreRuleBase.denominator) →
        (realPair y k).2 = 0 → y = root i := by
  have hi : i.val < brackets.length := by simpa only [hcount] using i.isLt
  have hget : brackets.getD i.val (0, 0) = brackets.get ⟨i.val, hi⟩ := by
    rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hi, Option.getD_some, List.get_eq_getElem]
  rw [hget]
  exact ⟨(hspec i).1, (hspec i).2, huniq i⟩

-- The 64 dependent cases share one elaboration budget (as master's `selected_context`).
set_option maxHeartbeats 4000000 in
/-- **Master's selected root of the `i`-th bracket of the `n`-point rule is the unique root of `P_n`
in that bracket** (`Q0LegendreRuleNN.all_unique`, `Q0GaussSelectedChoice.selectedFor`). -/
theorem selected_root_spec (n : ℕ) (hn : 1 ≤ n ∧ n ≤ 64) (i : Fin n) :
    (Q0GaussSelectedChoice.selectedFor n hn).root i ∈
        Set.Icc ((((ruleBrackets n).getD i.val (0, 0)).1 : ℝ) / Q0LegendreRuleBase.denominator)
          ((((ruleBrackets n).getD i.val (0, 0)).2 : ℝ) / Q0LegendreRuleBase.denominator) ∧
      (realPair ((Q0GaussSelectedChoice.selectedFor n hn).root i) (n - 1)).2 = 0 ∧
      ∀ y, y ∈ Set.Icc ((((ruleBrackets n).getD i.val (0, 0)).1 : ℝ) / Q0LegendreRuleBase.denominator)
          ((((ruleBrackets n).getD i.val (0, 0)).2 : ℝ) / Q0LegendreRuleBase.denominator) →
        (realPair y (n - 1)).2 = 0 → y = (Q0GaussSelectedChoice.selectedFor n hn).root i := by
  have hlo : 1 ≤ n := hn.1
  have hhi : n ≤ 64 := hn.2
  interval_cases n
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule01.brackets
      Grothe.UpperChaos.Q0LegendreRule01.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule01.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule01.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule02.brackets
      Grothe.UpperChaos.Q0LegendreRule02.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule02.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule02.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule03.brackets
      Grothe.UpperChaos.Q0LegendreRule03.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule03.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule03.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule04.brackets
      Grothe.UpperChaos.Q0LegendreRule04.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule04.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule04.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule05.brackets
      Grothe.UpperChaos.Q0LegendreRule05.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule05.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule05.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule06.brackets
      Grothe.UpperChaos.Q0LegendreRule06.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule06.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule06.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule07.brackets
      Grothe.UpperChaos.Q0LegendreRule07.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule07.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule07.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule08.brackets
      Grothe.UpperChaos.Q0LegendreRule08.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule08.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule08.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule09.brackets
      Grothe.UpperChaos.Q0LegendreRule09.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule09.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule09.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule10.brackets
      Grothe.UpperChaos.Q0LegendreRule10.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule10.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule10.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule11.brackets
      Grothe.UpperChaos.Q0LegendreRule11.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule11.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule11.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule12.brackets
      Grothe.UpperChaos.Q0LegendreRule12.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule12.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule12.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule13.brackets
      Grothe.UpperChaos.Q0LegendreRule13.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule13.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule13.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule14.brackets
      Grothe.UpperChaos.Q0LegendreRule14.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule14.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule14.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule15.brackets
      Grothe.UpperChaos.Q0LegendreRule15.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule15.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule15.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule16.brackets
      Grothe.UpperChaos.Q0LegendreRule16.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule16.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule16.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule17.brackets
      Grothe.UpperChaos.Q0LegendreRule17.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule17.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule17.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule18.brackets
      Grothe.UpperChaos.Q0LegendreRule18.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule18.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule18.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule19.brackets
      Grothe.UpperChaos.Q0LegendreRule19.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule19.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule19.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule20.brackets
      Grothe.UpperChaos.Q0LegendreRule20.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule20.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule20.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule21.brackets
      Grothe.UpperChaos.Q0LegendreRule21.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule21.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule21.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule22.brackets
      Grothe.UpperChaos.Q0LegendreRule22.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule22.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule22.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule23.brackets
      Grothe.UpperChaos.Q0LegendreRule23.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule23.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule23.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule24.brackets
      Grothe.UpperChaos.Q0LegendreRule24.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule24.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule24.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule25.brackets
      Grothe.UpperChaos.Q0LegendreRule25.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule25.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule25.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule26.brackets
      Grothe.UpperChaos.Q0LegendreRule26.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule26.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule26.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule27.brackets
      Grothe.UpperChaos.Q0LegendreRule27.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule27.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule27.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule28.brackets
      Grothe.UpperChaos.Q0LegendreRule28.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule28.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule28.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule29.brackets
      Grothe.UpperChaos.Q0LegendreRule29.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule29.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule29.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule30.brackets
      Grothe.UpperChaos.Q0LegendreRule30.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule30.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule30.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule31.brackets
      Grothe.UpperChaos.Q0LegendreRule31.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule31.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule31.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule32.brackets
      Grothe.UpperChaos.Q0LegendreRule32.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule32.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule32.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule33.brackets
      Grothe.UpperChaos.Q0LegendreRule33.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule33.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule33.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule34.brackets
      Grothe.UpperChaos.Q0LegendreRule34.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule34.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule34.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule35.brackets
      Grothe.UpperChaos.Q0LegendreRule35.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule35.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule35.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule36.brackets
      Grothe.UpperChaos.Q0LegendreRule36.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule36.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule36.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule37.brackets
      Grothe.UpperChaos.Q0LegendreRule37.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule37.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule37.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule38.brackets
      Grothe.UpperChaos.Q0LegendreRule38.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule38.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule38.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule39.brackets
      Grothe.UpperChaos.Q0LegendreRule39.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule39.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule39.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule40.brackets
      Grothe.UpperChaos.Q0LegendreRule40.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule40.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule40.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule41.brackets
      Grothe.UpperChaos.Q0LegendreRule41.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule41.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule41.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule42.brackets
      Grothe.UpperChaos.Q0LegendreRule42.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule42.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule42.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule43.brackets
      Grothe.UpperChaos.Q0LegendreRule43.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule43.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule43.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule44.brackets
      Grothe.UpperChaos.Q0LegendreRule44.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule44.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule44.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule45.brackets
      Grothe.UpperChaos.Q0LegendreRule45.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule45.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule45.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule46.brackets
      Grothe.UpperChaos.Q0LegendreRule46.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule46.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule46.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule47.brackets
      Grothe.UpperChaos.Q0LegendreRule47.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule47.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule47.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule48.brackets
      Grothe.UpperChaos.Q0LegendreRule48.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule48.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule48.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule49.brackets
      Grothe.UpperChaos.Q0LegendreRule49.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule49.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule49.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule50.brackets
      Grothe.UpperChaos.Q0LegendreRule50.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule50.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule50.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule51.brackets
      Grothe.UpperChaos.Q0LegendreRule51.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule51.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule51.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule52.brackets
      Grothe.UpperChaos.Q0LegendreRule52.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule52.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule52.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule53.brackets
      Grothe.UpperChaos.Q0LegendreRule53.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule53.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule53.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule54.brackets
      Grothe.UpperChaos.Q0LegendreRule54.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule54.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule54.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule55.brackets
      Grothe.UpperChaos.Q0LegendreRule55.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule55.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule55.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule56.brackets
      Grothe.UpperChaos.Q0LegendreRule56.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule56.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule56.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule57.brackets
      Grothe.UpperChaos.Q0LegendreRule57.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule57.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule57.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule58.brackets
      Grothe.UpperChaos.Q0LegendreRule58.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule58.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule58.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule59.brackets
      Grothe.UpperChaos.Q0LegendreRule59.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule59.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule59.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule60.brackets
      Grothe.UpperChaos.Q0LegendreRule60.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule60.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule60.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule61.brackets
      Grothe.UpperChaos.Q0LegendreRule61.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule61.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule61.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule62.brackets
      Grothe.UpperChaos.Q0LegendreRule62.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule62.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule62.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule63.brackets
      Grothe.UpperChaos.Q0LegendreRule63.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule63.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule63.all_unique).2 i
  · exact rule_root_spec Grothe.UpperChaos.Q0LegendreRule64.brackets
      Grothe.UpperChaos.Q0LegendreRule64.count _
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule64.all_unique).1
      (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule64.all_unique).2 i

/-! ### Brackets as intervals, `P_n` as `realPair` -/

/-- Membership in a `2^{-640}` bracket is membership in master's closed interval. -/
lemma mem_bracket_iff (lo hi : ℤ) (y : ℝ) :
    mem y (Bracket.toIval ⟨lo, hi, 640⟩) ↔
      y ∈ Set.Icc ((lo : ℝ) / Q0LegendreRuleBase.denominator)
        ((hi : ℝ) / Q0LegendreRuleBase.denominator) := by
  have h2 : ((Q0LegendreRuleBase.denominator : ℤ) : ℝ) = (2 : ℝ) ^ (640 : ℕ) := by
    unfold Q0LegendreRuleBase.denominator
    rw [Int.cast_pow, Int.cast_ofNat]
  have he : (2 : ℝ) ^ (-((640 : ℕ) : ℤ)) = ((2 : ℝ) ^ (640 : ℕ))⁻¹ := by
    rw [zpow_neg, zpow_natCast]
  unfold mem Bracket.toIval
  rw [Set.mem_Icc, h2, he, div_eq_mul_inv, div_eq_mul_inv]

/-- `P_n x = (realPair x (n − 1)).2` for `n ≥ 1`. -/
lemma legendreP_eq_realPair (y : ℝ) (n : ℕ) (hn : 1 ≤ n) :
    legendreP y n = (realPair y (n - 1)).2 := by
  obtain ⟨k, rfl⟩ := Nat.exists_eq_add_one_of_ne_zero (by omega : n ≠ 0)
  simp [legendreP]

/-! ### The specs of the addresses -/

/-- The spec of a source address: the `a.2`-th node of the panel `a.1` of `sourcePanels`, with the
committed cutoff of its ordinal. -/
def addressSpec (cutoffs : Array ℕ) (a : Address) : NodeSpec :=
  ⟨(sourcePanels.get a.1).lo.num, (sourcePanels.get a.1).lo.den, (sourcePanels.get a.1).hi.num,
    (sourcePanels.get a.1).hi.den, (sourcePanels.get a.1).order,
    ⟨((ruleBrackets (sourcePanels.get a.1).order).getD a.2.val (0, 0)).1,
      ((ruleBrackets (sourcePanels.get a.1).order).getD a.2.val (0, 0)).2, 640⟩,
    min (cutoffs.getD ((sourcePanels.get a.1).offset + a.2.val) 532) 531⟩

/-- `panelSpecs` is the indexed family of the specs of its panel. -/
theorem panelSpecs_eq_ofFn (cutoffs : Array ℕ) (p : Q0GaussAddress.Panel)
    (hlen : (ruleBrackets p.order).length = p.order) :
    panelSpecs cutoffs p = List.ofFn fun i : Fin p.order =>
      (⟨p.lo.num, p.lo.den, p.hi.num, p.hi.den, p.order,
        ⟨((ruleBrackets p.order).getD i.val (0, 0)).1, ((ruleBrackets p.order).getD i.val (0, 0)).2,
          640⟩,
        min (cutoffs.getD (p.offset + i.val) 532) 531⟩ : NodeSpec) := by
  apply List.ext_getElem
  · simp [panelSpecs, hlen]
  · intro i h1 h2
    have hi : i < (ruleBrackets p.order).length := by simpa [panelSpecs] using h1
    simp only [panelSpecs, List.getElem_map, List.getElem_zipIdx, List.getElem_ofFn]
    rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hi, Option.getD_some]
    simp

/-- A list sum as a sum over its indices. -/
lemma sum_map_eq_sum_fin {α M : Type*} [AddCommMonoid M] (l : List α) (G : α → M) :
    (l.map G).sum = ∑ j : Fin l.length, G (l.get j) := by
  conv_lhs => rw [← List.ofFn_getElem (xs := l)]
  rw [List.map_ofFn, List.sum_ofFn]
  rfl

/-- The sum over a `flatMap` is the sum of the sums. -/
lemma sum_map_flatMap {α β M : Type*} [AddCommMonoid M] (l : List α) (g : α → List β) (F : β → M) :
    ((l.flatMap g).map F).sum = (l.map fun p => ((g p).map F).sum).sum := by
  induction l with
  | nil => simp
  | cons a l ih => simp [List.flatMap_cons, List.map_append, List.sum_append, ih]

/-- **A sum over the committed partition is a sum over master's source addresses.** -/
theorem sum_partitionSpecs (F : NodeSpec → ℝ) :
    (partitionSpecs.map F).sum = ∑ a : Address, F (addressSpec PartitionData.cutoffs a) := by
  rw [Fintype.sum_sigma]
  unfold partitionSpecs
  rw [sum_map_flatMap, sum_map_eq_sum_fin]
  apply Finset.sum_congr rfl
  intro j _
  have hb := scan_member_order_bounds sourcePanels 0 21577 complete_scan (sourcePanels.get j)
    (List.get_mem sourcePanels j)
  rw [panelSpecs_eq_ofFn _ _ (ruleBrackets_length _ hb), List.map_ofFn, List.sum_ofFn]
  rfl

/-! ### The identification of the roots, nodes and weights -/

/-- Master's selected root lies in the bracket of the spec and is a root of `P_order`. -/
theorem sourceRoot_spec (cutoffs : Array ℕ) (a : Address) :
    mem (sourceRoot a) (addressSpec cutoffs a).bracket.toIval ∧
      legendreP (sourceRoot a) (addressSpec cutoffs a).order = 0 := by
  have hs := selected_root_spec (sourcePanels.get a.1).order (source_order_bounds a) a.2
  exact ⟨(mem_bracket_iff _ _ _).2 hs.1,
    (legendreP_eq_realPair _ _ (source_order_bounds a).1).trans hs.2.1⟩

/-- **The root chosen by the partition is master's selected root** (by the uniqueness of the root in
the bracket; no kernel flag is needed, the existence being master's). -/
theorem rootOf_addressSpec (cutoffs : Array ℕ) (a : Address) :
    rootOf (addressSpec cutoffs a) = sourceRoot a := by
  have hs := selected_root_spec (sourcePanels.get a.1).order (source_order_bounds a) a.2
  have hex : ∃ y, mem y (addressSpec cutoffs a).bracket.toIval ∧
      legendreP y (addressSpec cutoffs a).order = 0 :=
    ⟨sourceRoot a, sourceRoot_spec cutoffs a⟩
  have hroot := Classical.epsilon_spec hex
  exact hs.2.2 _ ((mem_bracket_iff _ _ _).1 hroot.1)
    ((legendreP_eq_realPair _ _ (source_order_bounds a).1).symm.trans hroot.2)

/-- The chosen root lies in its bracket (without the kernel's `bracketOK`). -/
theorem rootOf_addressSpec_mem (cutoffs : Array ℕ) (a : Address) :
    mem (rootOf (addressSpec cutoffs a)) (addressSpec cutoffs a).bracket.toIval := by
  rw [rootOf_addressSpec]
  exact (sourceRoot_spec cutoffs a).1

theorem specNode_addressSpec (cutoffs : Array ℕ) (a : Address) (x : ℝ) :
    specNode (addressSpec cutoffs a) x =
      panelNode ((sourcePanels.get a.1).lo : ℝ) ((sourcePanels.get a.1).hi : ℝ) x := by
  unfold specNode addressSpec
  simp only
  rw [Rat.cast_def, Rat.cast_def]

theorem specWeight_addressSpec (cutoffs : Array ℕ) (a : Address) (x : ℝ) :
    specWeight (addressSpec cutoffs a) x =
      panelWeight ((sourcePanels.get a.1).lo : ℝ) ((sourcePanels.get a.1).hi : ℝ)
        ((sourcePanels.get a.1).order - 1) x := by
  unfold specWeight addressSpec
  simp only
  rw [Rat.cast_def, Rat.cast_def]

/-- **The node of the partition at the chosen root is master's production node.** -/
theorem specNode_rootOf (cutoffs : Array ℕ) (a : Address) :
    specNode (addressSpec cutoffs a) (rootOf (addressSpec cutoffs a)) = sourceNode a := by
  rw [rootOf_addressSpec, specNode_addressSpec]
  rfl

/-- **The weight of the partition at the chosen root is master's production weight.** -/
theorem specWeight_rootOf (cutoffs : Array ℕ) (a : Address) :
    specWeight (addressSpec cutoffs a) (rootOf (addressSpec cutoffs a)) = sourceWeight a := by
  rw [rootOf_addressSpec, specWeight_addressSpec]
  rfl

/-- The committed cutoff of an address (`531` caps the stored degree). -/
def addressCutoff (a : Address) : ℕ :=
  min (PartitionData.cutoffs.getD ((sourcePanels.get a.1).offset + a.2.val) 532) 531

lemma addressSpec_cutoff (a : Address) :
    (addressSpec PartitionData.cutoffs a).cutoff = addressCutoff a := rfl

end Grothe.UpperQuad
