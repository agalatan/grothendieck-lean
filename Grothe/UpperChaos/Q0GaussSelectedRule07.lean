import Grothe.UpperChaos.Q0GaussSelected
import Grothe.UpperChaos.Q0GaussBracketInterior
import Grothe.UpperChaos.Q0LegendreRootWeightRule07
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Selected original roots with LeanCert formula-weight bounds.
Gauss-rule identity and the integration remainder are separate.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0GaussSelectedRule07

open Grothe.UpperChaos.Q0LegendreInteger
open Grothe.UpperChaos.Q0LegendreRuleBase
open Grothe.UpperChaos.Q0GaussSelected
open LeanCert.Core

noncomputable def root : Fin 7 → ℝ := Classical.choose Grothe.UpperChaos.Q0LegendreRule07.all_unique

theorem root_spec (i : Fin 7) :
    root i ∈ Set.Icc (((Grothe.UpperChaos.Q0LegendreRule07.bracketAt i).1 : ℝ) / denominator)
      (((Grothe.UpperChaos.Q0LegendreRule07.bracketAt i).2 : ℝ) / denominator) ∧
      (realPair (root i) 6).2 = 0 := by
  exact (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule07.all_unique).1 i

def lower : Fin 7 → ℚ := ![Grothe.UpperChaos.Q0LegendreWeightRule07.r00Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule07.r01Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule07.r02Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule07.r03Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule07.r04Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule07.r05Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule07.r06Interval.lo.toRat]
def upper : Fin 7 → ℚ := ![Grothe.UpperChaos.Q0LegendreWeightRule07.r00Upper, Grothe.UpperChaos.Q0LegendreWeightRule07.r01Upper, Grothe.UpperChaos.Q0LegendreWeightRule07.r02Upper, Grothe.UpperChaos.Q0LegendreWeightRule07.r03Upper, Grothe.UpperChaos.Q0LegendreWeightRule07.r04Upper, Grothe.UpperChaos.Q0LegendreWeightRule07.r05Upper, Grothe.UpperChaos.Q0LegendreWeightRule07.r06Upper]

theorem specr00 :
    root (0 : Fin 7) ∈ Set.Icc (((-4330248489779207523155447069774902339026551653750479623237372589574712989547254872805770099637624062264679895976289278415131050267895332664256521378705769724009888899214104942740507471571704573 : ℤ) : ℝ) / denominator)
      (((-4330248489779207523155447069774902339026551653750479623237372589574712989547254872805770099637624062264679895976289278415131050267895332664256521378705769724009888899214104942740507471571704570 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (0 : Fin 7)) 6).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule07.bracketAt, Grothe.UpperChaos.Q0LegendreRule07.brackets] using root_spec (0 : Fin 7)

theorem interiorr00 : |root (0 : Fin 7)| < 1 := by
  exact interior_of_integer_bracket (-4330248489779207523155447069774902339026551653750479623237372589574712989547254872805770099637624062264679895976289278415131050267895332664256521378705769724009888899214104942740507471571704573) (-4330248489779207523155447069774902339026551653750479623237372589574712989547254872805770099637624062264679895976289278415131050267895332664256521378705769724009888899214104942740507471571704570) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr00.1

theorem lowerr00 : (Grothe.UpperChaos.Q0LegendreWeightRule07.r00Interval.lo.toRat : ℝ) ≤ root (0 : Fin 7) := by
  have hle : ((-4330248489779207523155447069774902339026551653750479623237372589574712989547254872805770099637624062264679895976289278415131050267895332664256521378705769724009888899214104942740507471571704573 : ℤ) : ℚ) / denominator ≤ ((-4330248489779207523155447069774902339026551653750479623237372589574712989547254872805770099637624062264679895976289278415131050267895332664256521378705769724009888899214104942740507471571704570 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule07.r00Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg] using Grothe.UpperChaos.Q0LegendreWeightRule07.r00Input.le
  have hmem := mem_rational_interval_of_integer_bracket (-4330248489779207523155447069774902339026551653750479623237372589574712989547254872805770099637624062264679895976289278415131050267895332664256521378705769724009888899214104942740507471571704573) (-4330248489779207523155447069774902339026551653750479623237372589574712989547254872805770099637624062264679895976289278415131050267895332664256521378705769724009888899214104942740507471571704570) denominator hle specr00.1
  have hinput : root (0 : Fin 7) ∈ Grothe.UpperChaos.Q0LegendreWeightRule07.r00Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule07.r00Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr00 : weight 6 (root (0 : Fin 7)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule07.r00Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule07.boundr00 specr00.1

theorem specr01 :
    root (1 : Fin 7) ∈ Set.Icc (((-3383192000412219841192123017338455083600418692193345298202284737230161483102614935041020471380806306971558132988965319519745894325403049180576325507350044313300260775789682775187087283736974797 : ℤ) : ℝ) / denominator)
      (((-3383192000412219841192123017338455083600418692193345298202284737230161483102614935041020471380806306971558132988965319519745894325403049180576325507350044313300260775789682775187087283736974794 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (1 : Fin 7)) 6).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule07.bracketAt, Grothe.UpperChaos.Q0LegendreRule07.brackets] using root_spec (1 : Fin 7)

theorem interiorr01 : |root (1 : Fin 7)| < 1 := by
  exact interior_of_integer_bracket (-3383192000412219841192123017338455083600418692193345298202284737230161483102614935041020471380806306971558132988965319519745894325403049180576325507350044313300260775789682775187087283736974797) (-3383192000412219841192123017338455083600418692193345298202284737230161483102614935041020471380806306971558132988965319519745894325403049180576325507350044313300260775789682775187087283736974794) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr01.1

theorem lowerr01 : (Grothe.UpperChaos.Q0LegendreWeightRule07.r01Interval.lo.toRat : ℝ) ≤ root (1 : Fin 7) := by
  have hle : ((-3383192000412219841192123017338455083600418692193345298202284737230161483102614935041020471380806306971558132988965319519745894325403049180576325507350044313300260775789682775187087283736974797 : ℤ) : ℚ) / denominator ≤ ((-3383192000412219841192123017338455083600418692193345298202284737230161483102614935041020471380806306971558132988965319519745894325403049180576325507350044313300260775789682775187087283736974794 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule07.r01Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg] using Grothe.UpperChaos.Q0LegendreWeightRule07.r01Input.le
  have hmem := mem_rational_interval_of_integer_bracket (-3383192000412219841192123017338455083600418692193345298202284737230161483102614935041020471380806306971558132988965319519745894325403049180576325507350044313300260775789682775187087283736974797) (-3383192000412219841192123017338455083600418692193345298202284737230161483102614935041020471380806306971558132988965319519745894325403049180576325507350044313300260775789682775187087283736974794) denominator hle specr01.1
  have hinput : root (1 : Fin 7) ∈ Grothe.UpperChaos.Q0LegendreWeightRule07.r01Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule07.r01Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr01 : weight 6 (root (1 : Fin 7)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule07.r01Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule07.boundr01 specr01.1

theorem specr02 :
    root (2 : Fin 7) ∈ Set.Icc (((-1851644403109265242731148358002930213509807414967707761968646367954670261461619433558758234708539460795452873611225354068637041960325281802129190453831642319388682957473760180267871656816633915 : ℤ) : ℝ) / denominator)
      (((-1851644403109265242731148358002930213509807414967707761968646367954670261461619433558758234708539460795452873611225354068637041960325281802129190453831642319388682957473760180267871656816633912 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (2 : Fin 7)) 6).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule07.bracketAt, Grothe.UpperChaos.Q0LegendreRule07.brackets] using root_spec (2 : Fin 7)

theorem interiorr02 : |root (2 : Fin 7)| < 1 := by
  exact interior_of_integer_bracket (-1851644403109265242731148358002930213509807414967707761968646367954670261461619433558758234708539460795452873611225354068637041960325281802129190453831642319388682957473760180267871656816633915) (-1851644403109265242731148358002930213509807414967707761968646367954670261461619433558758234708539460795452873611225354068637041960325281802129190453831642319388682957473760180267871656816633912) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr02.1

theorem lowerr02 : (Grothe.UpperChaos.Q0LegendreWeightRule07.r02Interval.lo.toRat : ℝ) ≤ root (2 : Fin 7) := by
  have hle : ((-1851644403109265242731148358002930213509807414967707761968646367954670261461619433558758234708539460795452873611225354068637041960325281802129190453831642319388682957473760180267871656816633915 : ℤ) : ℚ) / denominator ≤ ((-1851644403109265242731148358002930213509807414967707761968646367954670261461619433558758234708539460795452873611225354068637041960325281802129190453831642319388682957473760180267871656816633912 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule07.r02Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg] using Grothe.UpperChaos.Q0LegendreWeightRule07.r02Input.le
  have hmem := mem_rational_interval_of_integer_bracket (-1851644403109265242731148358002930213509807414967707761968646367954670261461619433558758234708539460795452873611225354068637041960325281802129190453831642319388682957473760180267871656816633915) (-1851644403109265242731148358002930213509807414967707761968646367954670261461619433558758234708539460795452873611225354068637041960325281802129190453831642319388682957473760180267871656816633912) denominator hle specr02.1
  have hinput : root (2 : Fin 7) ∈ Grothe.UpperChaos.Q0LegendreWeightRule07.r02Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule07.r02Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr02 : weight 6 (root (2 : Fin 7)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule07.r02Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule07.boundr02 specr02.1

theorem specr03 :
    root (3 : Fin 7) ∈ Set.Icc (((-1 : ℤ) : ℝ) / denominator)
      (((2 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (3 : Fin 7)) 6).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule07.bracketAt, Grothe.UpperChaos.Q0LegendreRule07.brackets] using root_spec (3 : Fin 7)

theorem interiorr03 : |root (3 : Fin 7)| < 1 := by
  exact interior_of_integer_bracket (-1) (2) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr03.1

theorem lowerr03 : (Grothe.UpperChaos.Q0LegendreWeightRule07.r03Interval.lo.toRat : ℝ) ≤ root (3 : Fin 7) := by
  have hle : ((-1 : ℤ) : ℚ) / denominator ≤ ((2 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule07.r03Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg, Int.cast_one] using Grothe.UpperChaos.Q0LegendreWeightRule07.r03Input.le
  have hmem := mem_rational_interval_of_integer_bracket (-1) (2) denominator hle specr03.1
  have hinput : root (3 : Fin 7) ∈ Grothe.UpperChaos.Q0LegendreWeightRule07.r03Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule07.r03Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg, Int.cast_one] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr03 : weight 6 (root (3 : Fin 7)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule07.r03Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule07.boundr03 specr03.1

theorem specr04 :
    root (4 : Fin 7) ∈ Set.Icc (((1851644403109265242731148358002930213509807414967707761968646367954670261461619433558758234708539460795452873611225354068637041960325281802129190453831642319388682957473760180267871656816633912 : ℤ) : ℝ) / denominator)
      (((1851644403109265242731148358002930213509807414967707761968646367954670261461619433558758234708539460795452873611225354068637041960325281802129190453831642319388682957473760180267871656816633915 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (4 : Fin 7)) 6).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule07.bracketAt, Grothe.UpperChaos.Q0LegendreRule07.brackets] using root_spec (4 : Fin 7)

theorem interiorr04 : |root (4 : Fin 7)| < 1 := by
  exact interior_of_integer_bracket (1851644403109265242731148358002930213509807414967707761968646367954670261461619433558758234708539460795452873611225354068637041960325281802129190453831642319388682957473760180267871656816633912) (1851644403109265242731148358002930213509807414967707761968646367954670261461619433558758234708539460795452873611225354068637041960325281802129190453831642319388682957473760180267871656816633915) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr04.1

theorem lowerr04 : (Grothe.UpperChaos.Q0LegendreWeightRule07.r04Interval.lo.toRat : ℝ) ≤ root (4 : Fin 7) := by
  have hle : ((1851644403109265242731148358002930213509807414967707761968646367954670261461619433558758234708539460795452873611225354068637041960325281802129190453831642319388682957473760180267871656816633912 : ℤ) : ℚ) / denominator ≤ ((1851644403109265242731148358002930213509807414967707761968646367954670261461619433558758234708539460795452873611225354068637041960325281802129190453831642319388682957473760180267871656816633915 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule07.r04Input, denominator, Int.cast_pow, Int.cast_ofNat] using Grothe.UpperChaos.Q0LegendreWeightRule07.r04Input.le
  have hmem := mem_rational_interval_of_integer_bracket (1851644403109265242731148358002930213509807414967707761968646367954670261461619433558758234708539460795452873611225354068637041960325281802129190453831642319388682957473760180267871656816633912) (1851644403109265242731148358002930213509807414967707761968646367954670261461619433558758234708539460795452873611225354068637041960325281802129190453831642319388682957473760180267871656816633915) denominator hle specr04.1
  have hinput : root (4 : Fin 7) ∈ Grothe.UpperChaos.Q0LegendreWeightRule07.r04Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule07.r04Input, denominator, Int.cast_pow, Int.cast_ofNat] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr04 : weight 6 (root (4 : Fin 7)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule07.r04Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule07.boundr04 specr04.1

theorem specr05 :
    root (5 : Fin 7) ∈ Set.Icc (((3383192000412219841192123017338455083600418692193345298202284737230161483102614935041020471380806306971558132988965319519745894325403049180576325507350044313300260775789682775187087283736974794 : ℤ) : ℝ) / denominator)
      (((3383192000412219841192123017338455083600418692193345298202284737230161483102614935041020471380806306971558132988965319519745894325403049180576325507350044313300260775789682775187087283736974797 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (5 : Fin 7)) 6).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule07.bracketAt, Grothe.UpperChaos.Q0LegendreRule07.brackets] using root_spec (5 : Fin 7)

theorem interiorr05 : |root (5 : Fin 7)| < 1 := by
  exact interior_of_integer_bracket (3383192000412219841192123017338455083600418692193345298202284737230161483102614935041020471380806306971558132988965319519745894325403049180576325507350044313300260775789682775187087283736974794) (3383192000412219841192123017338455083600418692193345298202284737230161483102614935041020471380806306971558132988965319519745894325403049180576325507350044313300260775789682775187087283736974797) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr05.1

theorem lowerr05 : (Grothe.UpperChaos.Q0LegendreWeightRule07.r05Interval.lo.toRat : ℝ) ≤ root (5 : Fin 7) := by
  have hle : ((3383192000412219841192123017338455083600418692193345298202284737230161483102614935041020471380806306971558132988965319519745894325403049180576325507350044313300260775789682775187087283736974794 : ℤ) : ℚ) / denominator ≤ ((3383192000412219841192123017338455083600418692193345298202284737230161483102614935041020471380806306971558132988965319519745894325403049180576325507350044313300260775789682775187087283736974797 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule07.r05Input, denominator, Int.cast_pow, Int.cast_ofNat] using Grothe.UpperChaos.Q0LegendreWeightRule07.r05Input.le
  have hmem := mem_rational_interval_of_integer_bracket (3383192000412219841192123017338455083600418692193345298202284737230161483102614935041020471380806306971558132988965319519745894325403049180576325507350044313300260775789682775187087283736974794) (3383192000412219841192123017338455083600418692193345298202284737230161483102614935041020471380806306971558132988965319519745894325403049180576325507350044313300260775789682775187087283736974797) denominator hle specr05.1
  have hinput : root (5 : Fin 7) ∈ Grothe.UpperChaos.Q0LegendreWeightRule07.r05Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule07.r05Input, denominator, Int.cast_pow, Int.cast_ofNat] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr05 : weight 6 (root (5 : Fin 7)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule07.r05Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule07.boundr05 specr05.1

theorem specr06 :
    root (6 : Fin 7) ∈ Set.Icc (((4330248489779207523155447069774902339026551653750479623237372589574712989547254872805770099637624062264679895976289278415131050267895332664256521378705769724009888899214104942740507471571704570 : ℤ) : ℝ) / denominator)
      (((4330248489779207523155447069774902339026551653750479623237372589574712989547254872805770099637624062264679895976289278415131050267895332664256521378705769724009888899214104942740507471571704573 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (6 : Fin 7)) 6).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule07.bracketAt, Grothe.UpperChaos.Q0LegendreRule07.brackets] using root_spec (6 : Fin 7)

theorem interiorr06 : |root (6 : Fin 7)| < 1 := by
  exact interior_of_integer_bracket (4330248489779207523155447069774902339026551653750479623237372589574712989547254872805770099637624062264679895976289278415131050267895332664256521378705769724009888899214104942740507471571704570) (4330248489779207523155447069774902339026551653750479623237372589574712989547254872805770099637624062264679895976289278415131050267895332664256521378705769724009888899214104942740507471571704573) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr06.1

theorem lowerr06 : (Grothe.UpperChaos.Q0LegendreWeightRule07.r06Interval.lo.toRat : ℝ) ≤ root (6 : Fin 7) := by
  have hle : ((4330248489779207523155447069774902339026551653750479623237372589574712989547254872805770099637624062264679895976289278415131050267895332664256521378705769724009888899214104942740507471571704570 : ℤ) : ℚ) / denominator ≤ ((4330248489779207523155447069774902339026551653750479623237372589574712989547254872805770099637624062264679895976289278415131050267895332664256521378705769724009888899214104942740507471571704573 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule07.r06Input, denominator, Int.cast_pow, Int.cast_ofNat] using Grothe.UpperChaos.Q0LegendreWeightRule07.r06Input.le
  have hmem := mem_rational_interval_of_integer_bracket (4330248489779207523155447069774902339026551653750479623237372589574712989547254872805770099637624062264679895976289278415131050267895332664256521378705769724009888899214104942740507471571704570) (4330248489779207523155447069774902339026551653750479623237372589574712989547254872805770099637624062264679895976289278415131050267895332664256521378705769724009888899214104942740507471571704573) denominator hle specr06.1
  have hinput : root (6 : Fin 7) ∈ Grothe.UpperChaos.Q0LegendreWeightRule07.r06Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule07.r06Input, denominator, Int.cast_pow, Int.cast_ofNat] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr06 : weight 6 (root (6 : Fin 7)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule07.r06Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule07.boundr06 specr06.1

noncomputable def selected : SelectedRule 7 where
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
    · exact interiorr05
    · exact interiorr06
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
    · simpa [lower] using lowerr05
    · simpa [lower] using lowerr06
  weight_le := by
    intro i
    fin_cases i
    · simpa [upper] using weightr00
    · simpa [upper] using weightr01
    · simpa [upper] using weightr02
    · simpa [upper] using weightr03
    · simpa [upper] using weightr04
    · simpa [upper] using weightr05
    · simpa [upper] using weightr06
  injective := by
    apply injective_of_ordered_integer_brackets 7 Grothe.UpperChaos.Q0LegendreRule07.brackets
      Grothe.UpperChaos.Q0LegendreRule07.count denominator denominator_pos Grothe.UpperChaos.Q0LegendreRule07.ordered root
    intro i
    simpa only [Grothe.UpperChaos.Q0LegendreRule07.bracketAt] using (root_spec i).1

def indexedContext : Array (ℚ × ℚ) := #[(Grothe.UpperChaos.Q0LegendreWeightRule07.r00Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule07.r00Upper), (Grothe.UpperChaos.Q0LegendreWeightRule07.r01Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule07.r01Upper), (Grothe.UpperChaos.Q0LegendreWeightRule07.r02Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule07.r02Upper), (Grothe.UpperChaos.Q0LegendreWeightRule07.r03Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule07.r03Upper), (Grothe.UpperChaos.Q0LegendreWeightRule07.r04Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule07.r04Upper), (Grothe.UpperChaos.Q0LegendreWeightRule07.r05Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule07.r05Upper), (Grothe.UpperChaos.Q0LegendreWeightRule07.r06Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule07.r06Upper)]

theorem context_lookup (i : Fin 7) :
    indexedContext[i.val]? = some (selected.lower i, selected.upper i) := by
  fin_cases i <;> rfl

end Grothe.UpperChaos.Q0GaussSelectedRule07

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let targets : Array Name := #[``Grothe.UpperChaos.Q0GaussSelectedRule07.root_spec, ``Grothe.UpperChaos.Q0GaussSelectedRule07.selected, ``Grothe.UpperChaos.Q0GaussSelectedRule07.context_lookup]
  for target in targets do
    let dependencies ← Lean.collectAxioms target
    logInfo m!"Selected rule audit {target}: {dependencies}"
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
