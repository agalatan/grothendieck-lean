import Grothe.UpperChaos.Q0GaussSelected
import Grothe.UpperChaos.Q0GaussBracketInterior
import Grothe.UpperChaos.Q0LegendreRootWeightRule05
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Selected original roots with LeanCert formula-weight bounds.
Gauss-rule identity and the integration remainder are separate.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0GaussSelectedRule05

open Grothe.UpperChaos.Q0LegendreInteger
open Grothe.UpperChaos.Q0LegendreRuleBase
open Grothe.UpperChaos.Q0GaussSelected
open LeanCert.Core

noncomputable def root : Fin 5 → ℝ := Classical.choose Grothe.UpperChaos.Q0LegendreRule05.all_unique

theorem root_spec (i : Fin 5) :
    root i ∈ Set.Icc (((Grothe.UpperChaos.Q0LegendreRule05.bracketAt i).1 : ℝ) / denominator)
      (((Grothe.UpperChaos.Q0LegendreRule05.bracketAt i).2 : ℝ) / denominator) ∧
      (realPair (root i) 4).2 = 0 := by
  exact (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule05.all_unique).1 i

def lower : Fin 5 → ℚ := ![Grothe.UpperChaos.Q0LegendreWeightRule05.r00Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule05.r01Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule05.r02Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule05.r03Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule05.r04Interval.lo.toRat]
def upper : Fin 5 → ℚ := ![Grothe.UpperChaos.Q0LegendreWeightRule05.r00Upper, Grothe.UpperChaos.Q0LegendreWeightRule05.r01Upper, Grothe.UpperChaos.Q0LegendreWeightRule05.r02Upper, Grothe.UpperChaos.Q0LegendreWeightRule05.r03Upper, Grothe.UpperChaos.Q0LegendreWeightRule05.r04Upper]

theorem specr00 :
    root (0 : Fin 5) ∈ Set.Icc (((-4134391735981183858827318575265272044681180628614912538597972569055146521949434520253722173674579363444163048923577093618301014985570745096004477753894127100749223961200297576008573825457763810 : ℤ) : ℝ) / denominator)
      (((-4134391735981183858827318575265272044681180628614912538597972569055146521949434520253722173674579363444163048923577093618301014985570745096004477753894127100749223961200297576008573825457763807 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (0 : Fin 5)) 4).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule05.bracketAt, Grothe.UpperChaos.Q0LegendreRule05.brackets] using root_spec (0 : Fin 5)

theorem interiorr00 : |root (0 : Fin 5)| < 1 := by
  exact interior_of_integer_bracket (-4134391735981183858827318575265272044681180628614912538597972569055146521949434520253722173674579363444163048923577093618301014985570745096004477753894127100749223961200297576008573825457763810) (-4134391735981183858827318575265272044681180628614912538597972569055146521949434520253722173674579363444163048923577093618301014985570745096004477753894127100749223961200297576008573825457763807) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr00.1

theorem lowerr00 : (Grothe.UpperChaos.Q0LegendreWeightRule05.r00Interval.lo.toRat : ℝ) ≤ root (0 : Fin 5) := by
  have hle : ((-4134391735981183858827318575265272044681180628614912538597972569055146521949434520253722173674579363444163048923577093618301014985570745096004477753894127100749223961200297576008573825457763810 : ℤ) : ℚ) / denominator ≤ ((-4134391735981183858827318575265272044681180628614912538597972569055146521949434520253722173674579363444163048923577093618301014985570745096004477753894127100749223961200297576008573825457763807 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule05.r00Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg] using Grothe.UpperChaos.Q0LegendreWeightRule05.r00Input.le
  have hmem := mem_rational_interval_of_integer_bracket (-4134391735981183858827318575265272044681180628614912538597972569055146521949434520253722173674579363444163048923577093618301014985570745096004477753894127100749223961200297576008573825457763810) (-4134391735981183858827318575265272044681180628614912538597972569055146521949434520253722173674579363444163048923577093618301014985570745096004477753894127100749223961200297576008573825457763807) denominator hle specr00.1
  have hinput : root (0 : Fin 5) ∈ Grothe.UpperChaos.Q0LegendreWeightRule05.r00Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule05.r00Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr00 : weight 4 (root (0 : Fin 5)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule05.r00Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule05.boundr00 specr00.1

theorem specr01 :
    root (1 : Fin 5) ∈ Set.Icc (((-2456734251769170127206955861032500662757256261894272275586743671077469994827132333368147102979571652432649280897783698335977596289997911422765125201008479021867234832315652040344039416819478597 : ℤ) : ℝ) / denominator)
      (((-2456734251769170127206955861032500662757256261894272275586743671077469994827132333368147102979571652432649280897783698335977596289997911422765125201008479021867234832315652040344039416819478594 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (1 : Fin 5)) 4).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule05.bracketAt, Grothe.UpperChaos.Q0LegendreRule05.brackets] using root_spec (1 : Fin 5)

theorem interiorr01 : |root (1 : Fin 5)| < 1 := by
  exact interior_of_integer_bracket (-2456734251769170127206955861032500662757256261894272275586743671077469994827132333368147102979571652432649280897783698335977596289997911422765125201008479021867234832315652040344039416819478597) (-2456734251769170127206955861032500662757256261894272275586743671077469994827132333368147102979571652432649280897783698335977596289997911422765125201008479021867234832315652040344039416819478594) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr01.1

theorem lowerr01 : (Grothe.UpperChaos.Q0LegendreWeightRule05.r01Interval.lo.toRat : ℝ) ≤ root (1 : Fin 5) := by
  have hle : ((-2456734251769170127206955861032500662757256261894272275586743671077469994827132333368147102979571652432649280897783698335977596289997911422765125201008479021867234832315652040344039416819478597 : ℤ) : ℚ) / denominator ≤ ((-2456734251769170127206955861032500662757256261894272275586743671077469994827132333368147102979571652432649280897783698335977596289997911422765125201008479021867234832315652040344039416819478594 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule05.r01Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg] using Grothe.UpperChaos.Q0LegendreWeightRule05.r01Input.le
  have hmem := mem_rational_interval_of_integer_bracket (-2456734251769170127206955861032500662757256261894272275586743671077469994827132333368147102979571652432649280897783698335977596289997911422765125201008479021867234832315652040344039416819478597) (-2456734251769170127206955861032500662757256261894272275586743671077469994827132333368147102979571652432649280897783698335977596289997911422765125201008479021867234832315652040344039416819478594) denominator hle specr01.1
  have hinput : root (1 : Fin 5) ∈ Grothe.UpperChaos.Q0LegendreWeightRule05.r01Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule05.r01Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr01 : weight 4 (root (1 : Fin 5)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule05.r01Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule05.boundr01 specr01.1

theorem specr02 :
    root (2 : Fin 5) ∈ Set.Icc (((-1 : ℤ) : ℝ) / denominator)
      (((2 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (2 : Fin 5)) 4).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule05.bracketAt, Grothe.UpperChaos.Q0LegendreRule05.brackets] using root_spec (2 : Fin 5)

theorem interiorr02 : |root (2 : Fin 5)| < 1 := by
  exact interior_of_integer_bracket (-1) (2) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr02.1

theorem lowerr02 : (Grothe.UpperChaos.Q0LegendreWeightRule05.r02Interval.lo.toRat : ℝ) ≤ root (2 : Fin 5) := by
  have hle : ((-1 : ℤ) : ℚ) / denominator ≤ ((2 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule05.r02Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg, Int.cast_one] using Grothe.UpperChaos.Q0LegendreWeightRule05.r02Input.le
  have hmem := mem_rational_interval_of_integer_bracket (-1) (2) denominator hle specr02.1
  have hinput : root (2 : Fin 5) ∈ Grothe.UpperChaos.Q0LegendreWeightRule05.r02Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule05.r02Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg, Int.cast_one] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr02 : weight 4 (root (2 : Fin 5)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule05.r02Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule05.boundr02 specr02.1

theorem specr03 :
    root (3 : Fin 5) ∈ Set.Icc (((2456734251769170127206955861032500662757256261894272275586743671077469994827132333368147102979571652432649280897783698335977596289997911422765125201008479021867234832315652040344039416819478594 : ℤ) : ℝ) / denominator)
      (((2456734251769170127206955861032500662757256261894272275586743671077469994827132333368147102979571652432649280897783698335977596289997911422765125201008479021867234832315652040344039416819478597 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (3 : Fin 5)) 4).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule05.bracketAt, Grothe.UpperChaos.Q0LegendreRule05.brackets] using root_spec (3 : Fin 5)

theorem interiorr03 : |root (3 : Fin 5)| < 1 := by
  exact interior_of_integer_bracket (2456734251769170127206955861032500662757256261894272275586743671077469994827132333368147102979571652432649280897783698335977596289997911422765125201008479021867234832315652040344039416819478594) (2456734251769170127206955861032500662757256261894272275586743671077469994827132333368147102979571652432649280897783698335977596289997911422765125201008479021867234832315652040344039416819478597) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr03.1

theorem lowerr03 : (Grothe.UpperChaos.Q0LegendreWeightRule05.r03Interval.lo.toRat : ℝ) ≤ root (3 : Fin 5) := by
  have hle : ((2456734251769170127206955861032500662757256261894272275586743671077469994827132333368147102979571652432649280897783698335977596289997911422765125201008479021867234832315652040344039416819478594 : ℤ) : ℚ) / denominator ≤ ((2456734251769170127206955861032500662757256261894272275586743671077469994827132333368147102979571652432649280897783698335977596289997911422765125201008479021867234832315652040344039416819478597 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule05.r03Input, denominator, Int.cast_pow, Int.cast_ofNat] using Grothe.UpperChaos.Q0LegendreWeightRule05.r03Input.le
  have hmem := mem_rational_interval_of_integer_bracket (2456734251769170127206955861032500662757256261894272275586743671077469994827132333368147102979571652432649280897783698335977596289997911422765125201008479021867234832315652040344039416819478594) (2456734251769170127206955861032500662757256261894272275586743671077469994827132333368147102979571652432649280897783698335977596289997911422765125201008479021867234832315652040344039416819478597) denominator hle specr03.1
  have hinput : root (3 : Fin 5) ∈ Grothe.UpperChaos.Q0LegendreWeightRule05.r03Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule05.r03Input, denominator, Int.cast_pow, Int.cast_ofNat] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr03 : weight 4 (root (3 : Fin 5)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule05.r03Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule05.boundr03 specr03.1

theorem specr04 :
    root (4 : Fin 5) ∈ Set.Icc (((4134391735981183858827318575265272044681180628614912538597972569055146521949434520253722173674579363444163048923577093618301014985570745096004477753894127100749223961200297576008573825457763807 : ℤ) : ℝ) / denominator)
      (((4134391735981183858827318575265272044681180628614912538597972569055146521949434520253722173674579363444163048923577093618301014985570745096004477753894127100749223961200297576008573825457763810 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (4 : Fin 5)) 4).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule05.bracketAt, Grothe.UpperChaos.Q0LegendreRule05.brackets] using root_spec (4 : Fin 5)

theorem interiorr04 : |root (4 : Fin 5)| < 1 := by
  exact interior_of_integer_bracket (4134391735981183858827318575265272044681180628614912538597972569055146521949434520253722173674579363444163048923577093618301014985570745096004477753894127100749223961200297576008573825457763807) (4134391735981183858827318575265272044681180628614912538597972569055146521949434520253722173674579363444163048923577093618301014985570745096004477753894127100749223961200297576008573825457763810) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr04.1

theorem lowerr04 : (Grothe.UpperChaos.Q0LegendreWeightRule05.r04Interval.lo.toRat : ℝ) ≤ root (4 : Fin 5) := by
  have hle : ((4134391735981183858827318575265272044681180628614912538597972569055146521949434520253722173674579363444163048923577093618301014985570745096004477753894127100749223961200297576008573825457763807 : ℤ) : ℚ) / denominator ≤ ((4134391735981183858827318575265272044681180628614912538597972569055146521949434520253722173674579363444163048923577093618301014985570745096004477753894127100749223961200297576008573825457763810 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule05.r04Input, denominator, Int.cast_pow, Int.cast_ofNat] using Grothe.UpperChaos.Q0LegendreWeightRule05.r04Input.le
  have hmem := mem_rational_interval_of_integer_bracket (4134391735981183858827318575265272044681180628614912538597972569055146521949434520253722173674579363444163048923577093618301014985570745096004477753894127100749223961200297576008573825457763807) (4134391735981183858827318575265272044681180628614912538597972569055146521949434520253722173674579363444163048923577093618301014985570745096004477753894127100749223961200297576008573825457763810) denominator hle specr04.1
  have hinput : root (4 : Fin 5) ∈ Grothe.UpperChaos.Q0LegendreWeightRule05.r04Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule05.r04Input, denominator, Int.cast_pow, Int.cast_ofNat] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr04 : weight 4 (root (4 : Fin 5)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule05.r04Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule05.boundr04 specr04.1

noncomputable def selected : SelectedRule 5 where
  root := root
  lower := lower
  upper := upper
  interior := by
    intro i
    fin_cases i
    · exact interiorr00
    · exact interiorr01
    · exact interiorr02
    · exact interiorr03
    · exact interiorr04
  isRoot := by
    intro i
    exact (root_spec i).2
  lower_le := by
    intro i
    fin_cases i
    · simpa [lower] using lowerr00
    · simpa [lower] using lowerr01
    · simpa [lower] using lowerr02
    · simpa [lower] using lowerr03
    · simpa [lower] using lowerr04
  weight_le := by
    intro i
    fin_cases i
    · simpa [upper] using weightr00
    · simpa [upper] using weightr01
    · simpa [upper] using weightr02
    · simpa [upper] using weightr03
    · simpa [upper] using weightr04
  injective := by
    apply injective_of_ordered_integer_brackets 5 Grothe.UpperChaos.Q0LegendreRule05.brackets
      Grothe.UpperChaos.Q0LegendreRule05.count denominator denominator_pos Grothe.UpperChaos.Q0LegendreRule05.ordered root
    intro i
    simpa only [Grothe.UpperChaos.Q0LegendreRule05.bracketAt] using (root_spec i).1

def indexedContext : Array (ℚ × ℚ) := #[(Grothe.UpperChaos.Q0LegendreWeightRule05.r00Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule05.r00Upper), (Grothe.UpperChaos.Q0LegendreWeightRule05.r01Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule05.r01Upper), (Grothe.UpperChaos.Q0LegendreWeightRule05.r02Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule05.r02Upper), (Grothe.UpperChaos.Q0LegendreWeightRule05.r03Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule05.r03Upper), (Grothe.UpperChaos.Q0LegendreWeightRule05.r04Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule05.r04Upper)]

theorem context_lookup (i : Fin 5) :
    indexedContext[i.val]? = some (selected.lower i, selected.upper i) := by
  fin_cases i <;> rfl

end Grothe.UpperChaos.Q0GaussSelectedRule05

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let targets : Array Name := #[``Grothe.UpperChaos.Q0GaussSelectedRule05.root_spec, ``Grothe.UpperChaos.Q0GaussSelectedRule05.selected, ``Grothe.UpperChaos.Q0GaussSelectedRule05.context_lookup]
  for target in targets do
    let dependencies ← Lean.collectAxioms target
    logInfo m!"Selected rule audit {target}: {dependencies}"
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
