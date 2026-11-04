import Grothe.UpperChaos.Q0GaussSelected
import Grothe.UpperChaos.Q0GaussBracketInterior
import Grothe.UpperChaos.Q0LegendreRootWeightRule09
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Selected original roots with LeanCert formula-weight bounds.
Gauss-rule identity and the integration remainder are separate.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0GaussSelectedRule09

open Grothe.UpperChaos.Q0LegendreInteger
open Grothe.UpperChaos.Q0LegendreRuleBase
open Grothe.UpperChaos.Q0GaussSelected
open LeanCert.Core

noncomputable def root : Fin 9 → ℝ := Classical.choose Grothe.UpperChaos.Q0LegendreRule09.all_unique

theorem root_spec (i : Fin 9) :
    root i ∈ Set.Icc (((Grothe.UpperChaos.Q0LegendreRule09.bracketAt i).1 : ℝ) / denominator)
      (((Grothe.UpperChaos.Q0LegendreRule09.bracketAt i).2 : ℝ) / denominator) ∧
      (realPair (root i) 8).2 = 0 := by
  exact (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule09.all_unique).1 i

def lower : Fin 9 → ℚ := ![Grothe.UpperChaos.Q0LegendreWeightRule09.r00Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule09.r01Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule09.r02Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule09.r03Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule09.r04Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule09.r05Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule09.r06Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule09.r07Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule09.r08Interval.lo.toRat]
def upper : Fin 9 → ℚ := ![Grothe.UpperChaos.Q0LegendreWeightRule09.r00Upper, Grothe.UpperChaos.Q0LegendreWeightRule09.r01Upper, Grothe.UpperChaos.Q0LegendreWeightRule09.r02Upper, Grothe.UpperChaos.Q0LegendreWeightRule09.r03Upper, Grothe.UpperChaos.Q0LegendreWeightRule09.r04Upper, Grothe.UpperChaos.Q0LegendreWeightRule09.r05Upper, Grothe.UpperChaos.Q0LegendreWeightRule09.r06Upper, Grothe.UpperChaos.Q0LegendreWeightRule09.r07Upper, Grothe.UpperChaos.Q0LegendreWeightRule09.r08Upper]

theorem specr00 :
    root (0 : Fin 9) ∈ Set.Icc (((-4417173601096426025414860202694367607109121720996474099860925252202559028870613990954237342365311712681665460983464189763662275041889597363950027151663526047337284870992193323696145482310386308 : ℤ) : ℝ) / denominator)
      (((-4417173601096426025414860202694367607109121720996474099860925252202559028870613990954237342365311712681665460983464189763662275041889597363950027151663526047337284870992193323696145482310386305 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (0 : Fin 9)) 8).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule09.bracketAt, Grothe.UpperChaos.Q0LegendreRule09.brackets] using root_spec (0 : Fin 9)

theorem interiorr00 : |root (0 : Fin 9)| < 1 := by
  exact interior_of_integer_bracket (-4417173601096426025414860202694367607109121720996474099860925252202559028870613990954237342365311712681665460983464189763662275041889597363950027151663526047337284870992193323696145482310386308) (-4417173601096426025414860202694367607109121720996474099860925252202559028870613990954237342365311712681665460983464189763662275041889597363950027151663526047337284870992193323696145482310386305) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr00.1

theorem lowerr00 : (Grothe.UpperChaos.Q0LegendreWeightRule09.r00Interval.lo.toRat : ℝ) ≤ root (0 : Fin 9) := by
  have hle : ((-4417173601096426025414860202694367607109121720996474099860925252202559028870613990954237342365311712681665460983464189763662275041889597363950027151663526047337284870992193323696145482310386308 : ℤ) : ℚ) / denominator ≤ ((-4417173601096426025414860202694367607109121720996474099860925252202559028870613990954237342365311712681665460983464189763662275041889597363950027151663526047337284870992193323696145482310386305 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule09.r00Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg] using Grothe.UpperChaos.Q0LegendreWeightRule09.r00Input.le
  have hmem := mem_rational_interval_of_integer_bracket (-4417173601096426025414860202694367607109121720996474099860925252202559028870613990954237342365311712681665460983464189763662275041889597363950027151663526047337284870992193323696145482310386308) (-4417173601096426025414860202694367607109121720996474099860925252202559028870613990954237342365311712681665460983464189763662275041889597363950027151663526047337284870992193323696145482310386305) denominator hle specr00.1
  have hinput : root (0 : Fin 9) ∈ Grothe.UpperChaos.Q0LegendreWeightRule09.r00Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule09.r00Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr00 : weight 8 (root (0 : Fin 9)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule09.r00Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule09.boundr00 specr00.1

theorem specr01 :
    root (1 : Fin 9) ∈ Set.Icc (((-3814342281662703991491692487769808966713193520136107988015016445344653253824728621590674219386020133621531769615922666881178794834866768763535245246937631338571361020147353935179773589916603132 : ℤ) : ℝ) / denominator)
      (((-3814342281662703991491692487769808966713193520136107988015016445344653253824728621590674219386020133621531769615922666881178794834866768763535245246937631338571361020147353935179773589916603129 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (1 : Fin 9)) 8).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule09.bracketAt, Grothe.UpperChaos.Q0LegendreRule09.brackets] using root_spec (1 : Fin 9)

theorem interiorr01 : |root (1 : Fin 9)| < 1 := by
  exact interior_of_integer_bracket (-3814342281662703991491692487769808966713193520136107988015016445344653253824728621590674219386020133621531769615922666881178794834866768763535245246937631338571361020147353935179773589916603132) (-3814342281662703991491692487769808966713193520136107988015016445344653253824728621590674219386020133621531769615922666881178794834866768763535245246937631338571361020147353935179773589916603129) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr01.1

theorem lowerr01 : (Grothe.UpperChaos.Q0LegendreWeightRule09.r01Interval.lo.toRat : ℝ) ≤ root (1 : Fin 9) := by
  have hle : ((-3814342281662703991491692487769808966713193520136107988015016445344653253824728621590674219386020133621531769615922666881178794834866768763535245246937631338571361020147353935179773589916603132 : ℤ) : ℚ) / denominator ≤ ((-3814342281662703991491692487769808966713193520136107988015016445344653253824728621590674219386020133621531769615922666881178794834866768763535245246937631338571361020147353935179773589916603129 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule09.r01Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg] using Grothe.UpperChaos.Q0LegendreWeightRule09.r01Input.le
  have hmem := mem_rational_interval_of_integer_bracket (-3814342281662703991491692487769808966713193520136107988015016445344653253824728621590674219386020133621531769615922666881178794834866768763535245246937631338571361020147353935179773589916603132) (-3814342281662703991491692487769808966713193520136107988015016445344653253824728621590674219386020133621531769615922666881178794834866768763535245246937631338571361020147353935179773589916603129) denominator hle specr01.1
  have hinput : root (1 : Fin 9) ∈ Grothe.UpperChaos.Q0LegendreWeightRule09.r01Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule09.r01Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr01 : weight 8 (root (1 : Fin 9)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule09.r01Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule09.boundr01 specr01.1

theorem specr02 :
    root (2 : Fin 9) ∈ Set.Icc (((-2798470738242292401238782189219793954736010597603168974072114160695063581076645371103205831762547976140561377918844992470165550481664482957029219271206988834735503670839577350391294897993313545 : ℤ) : ℝ) / denominator)
      (((-2798470738242292401238782189219793954736010597603168974072114160695063581076645371103205831762547976140561377918844992470165550481664482957029219271206988834735503670839577350391294897993313542 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (2 : Fin 9)) 8).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule09.bracketAt, Grothe.UpperChaos.Q0LegendreRule09.brackets] using root_spec (2 : Fin 9)

theorem interiorr02 : |root (2 : Fin 9)| < 1 := by
  exact interior_of_integer_bracket (-2798470738242292401238782189219793954736010597603168974072114160695063581076645371103205831762547976140561377918844992470165550481664482957029219271206988834735503670839577350391294897993313545) (-2798470738242292401238782189219793954736010597603168974072114160695063581076645371103205831762547976140561377918844992470165550481664482957029219271206988834735503670839577350391294897993313542) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr02.1

theorem lowerr02 : (Grothe.UpperChaos.Q0LegendreWeightRule09.r02Interval.lo.toRat : ℝ) ≤ root (2 : Fin 9) := by
  have hle : ((-2798470738242292401238782189219793954736010597603168974072114160695063581076645371103205831762547976140561377918844992470165550481664482957029219271206988834735503670839577350391294897993313545 : ℤ) : ℚ) / denominator ≤ ((-2798470738242292401238782189219793954736010597603168974072114160695063581076645371103205831762547976140561377918844992470165550481664482957029219271206988834735503670839577350391294897993313542 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule09.r02Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg] using Grothe.UpperChaos.Q0LegendreWeightRule09.r02Input.le
  have hmem := mem_rational_interval_of_integer_bracket (-2798470738242292401238782189219793954736010597603168974072114160695063581076645371103205831762547976140561377918844992470165550481664482957029219271206988834735503670839577350391294897993313545) (-2798470738242292401238782189219793954736010597603168974072114160695063581076645371103205831762547976140561377918844992470165550481664482957029219271206988834735503670839577350391294897993313542) denominator hle specr02.1
  have hinput : root (2 : Fin 9) ∈ Grothe.UpperChaos.Q0LegendreWeightRule09.r02Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule09.r02Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr02 : weight 8 (root (2 : Fin 9)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule09.r02Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule09.boundr02 specr02.1

theorem specr03 :
    root (3 : Fin 9) ∈ Set.Icc (((-1479386989340585180022577883078415995395610493170638353818106165432603161161765959376574773721587151783371673323838552117926500055534269018179585078719119013345576851334552162911101186408625861 : ℤ) : ℝ) / denominator)
      (((-1479386989340585180022577883078415995395610493170638353818106165432603161161765959376574773721587151783371673323838552117926500055534269018179585078719119013345576851334552162911101186408625858 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (3 : Fin 9)) 8).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule09.bracketAt, Grothe.UpperChaos.Q0LegendreRule09.brackets] using root_spec (3 : Fin 9)

theorem interiorr03 : |root (3 : Fin 9)| < 1 := by
  exact interior_of_integer_bracket (-1479386989340585180022577883078415995395610493170638353818106165432603161161765959376574773721587151783371673323838552117926500055534269018179585078719119013345576851334552162911101186408625861) (-1479386989340585180022577883078415995395610493170638353818106165432603161161765959376574773721587151783371673323838552117926500055534269018179585078719119013345576851334552162911101186408625858) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr03.1

theorem lowerr03 : (Grothe.UpperChaos.Q0LegendreWeightRule09.r03Interval.lo.toRat : ℝ) ≤ root (3 : Fin 9) := by
  have hle : ((-1479386989340585180022577883078415995395610493170638353818106165432603161161765959376574773721587151783371673323838552117926500055534269018179585078719119013345576851334552162911101186408625861 : ℤ) : ℚ) / denominator ≤ ((-1479386989340585180022577883078415995395610493170638353818106165432603161161765959376574773721587151783371673323838552117926500055534269018179585078719119013345576851334552162911101186408625858 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule09.r03Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg] using Grothe.UpperChaos.Q0LegendreWeightRule09.r03Input.le
  have hmem := mem_rational_interval_of_integer_bracket (-1479386989340585180022577883078415995395610493170638353818106165432603161161765959376574773721587151783371673323838552117926500055534269018179585078719119013345576851334552162911101186408625861) (-1479386989340585180022577883078415995395610493170638353818106165432603161161765959376574773721587151783371673323838552117926500055534269018179585078719119013345576851334552162911101186408625858) denominator hle specr03.1
  have hinput : root (3 : Fin 9) ∈ Grothe.UpperChaos.Q0LegendreWeightRule09.r03Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule09.r03Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr03 : weight 8 (root (3 : Fin 9)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule09.r03Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule09.boundr03 specr03.1

theorem specr04 :
    root (4 : Fin 9) ∈ Set.Icc (((-1 : ℤ) : ℝ) / denominator)
      (((2 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (4 : Fin 9)) 8).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule09.bracketAt, Grothe.UpperChaos.Q0LegendreRule09.brackets] using root_spec (4 : Fin 9)

theorem interiorr04 : |root (4 : Fin 9)| < 1 := by
  exact interior_of_integer_bracket (-1) (2) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr04.1

theorem lowerr04 : (Grothe.UpperChaos.Q0LegendreWeightRule09.r04Interval.lo.toRat : ℝ) ≤ root (4 : Fin 9) := by
  have hle : ((-1 : ℤ) : ℚ) / denominator ≤ ((2 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule09.r04Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg, Int.cast_one] using Grothe.UpperChaos.Q0LegendreWeightRule09.r04Input.le
  have hmem := mem_rational_interval_of_integer_bracket (-1) (2) denominator hle specr04.1
  have hinput : root (4 : Fin 9) ∈ Grothe.UpperChaos.Q0LegendreWeightRule09.r04Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule09.r04Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg, Int.cast_one] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr04 : weight 8 (root (4 : Fin 9)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule09.r04Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule09.boundr04 specr04.1

theorem specr05 :
    root (5 : Fin 9) ∈ Set.Icc (((1479386989340585180022577883078415995395610493170638353818106165432603161161765959376574773721587151783371673323838552117926500055534269018179585078719119013345576851334552162911101186408625858 : ℤ) : ℝ) / denominator)
      (((1479386989340585180022577883078415995395610493170638353818106165432603161161765959376574773721587151783371673323838552117926500055534269018179585078719119013345576851334552162911101186408625861 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (5 : Fin 9)) 8).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule09.bracketAt, Grothe.UpperChaos.Q0LegendreRule09.brackets] using root_spec (5 : Fin 9)

theorem interiorr05 : |root (5 : Fin 9)| < 1 := by
  exact interior_of_integer_bracket (1479386989340585180022577883078415995395610493170638353818106165432603161161765959376574773721587151783371673323838552117926500055534269018179585078719119013345576851334552162911101186408625858) (1479386989340585180022577883078415995395610493170638353818106165432603161161765959376574773721587151783371673323838552117926500055534269018179585078719119013345576851334552162911101186408625861) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr05.1

theorem lowerr05 : (Grothe.UpperChaos.Q0LegendreWeightRule09.r05Interval.lo.toRat : ℝ) ≤ root (5 : Fin 9) := by
  have hle : ((1479386989340585180022577883078415995395610493170638353818106165432603161161765959376574773721587151783371673323838552117926500055534269018179585078719119013345576851334552162911101186408625858 : ℤ) : ℚ) / denominator ≤ ((1479386989340585180022577883078415995395610493170638353818106165432603161161765959376574773721587151783371673323838552117926500055534269018179585078719119013345576851334552162911101186408625861 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule09.r05Input, denominator, Int.cast_pow, Int.cast_ofNat] using Grothe.UpperChaos.Q0LegendreWeightRule09.r05Input.le
  have hmem := mem_rational_interval_of_integer_bracket (1479386989340585180022577883078415995395610493170638353818106165432603161161765959376574773721587151783371673323838552117926500055534269018179585078719119013345576851334552162911101186408625858) (1479386989340585180022577883078415995395610493170638353818106165432603161161765959376574773721587151783371673323838552117926500055534269018179585078719119013345576851334552162911101186408625861) denominator hle specr05.1
  have hinput : root (5 : Fin 9) ∈ Grothe.UpperChaos.Q0LegendreWeightRule09.r05Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule09.r05Input, denominator, Int.cast_pow, Int.cast_ofNat] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr05 : weight 8 (root (5 : Fin 9)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule09.r05Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule09.boundr05 specr05.1

theorem specr06 :
    root (6 : Fin 9) ∈ Set.Icc (((2798470738242292401238782189219793954736010597603168974072114160695063581076645371103205831762547976140561377918844992470165550481664482957029219271206988834735503670839577350391294897993313542 : ℤ) : ℝ) / denominator)
      (((2798470738242292401238782189219793954736010597603168974072114160695063581076645371103205831762547976140561377918844992470165550481664482957029219271206988834735503670839577350391294897993313545 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (6 : Fin 9)) 8).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule09.bracketAt, Grothe.UpperChaos.Q0LegendreRule09.brackets] using root_spec (6 : Fin 9)

theorem interiorr06 : |root (6 : Fin 9)| < 1 := by
  exact interior_of_integer_bracket (2798470738242292401238782189219793954736010597603168974072114160695063581076645371103205831762547976140561377918844992470165550481664482957029219271206988834735503670839577350391294897993313542) (2798470738242292401238782189219793954736010597603168974072114160695063581076645371103205831762547976140561377918844992470165550481664482957029219271206988834735503670839577350391294897993313545) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr06.1

theorem lowerr06 : (Grothe.UpperChaos.Q0LegendreWeightRule09.r06Interval.lo.toRat : ℝ) ≤ root (6 : Fin 9) := by
  have hle : ((2798470738242292401238782189219793954736010597603168974072114160695063581076645371103205831762547976140561377918844992470165550481664482957029219271206988834735503670839577350391294897993313542 : ℤ) : ℚ) / denominator ≤ ((2798470738242292401238782189219793954736010597603168974072114160695063581076645371103205831762547976140561377918844992470165550481664482957029219271206988834735503670839577350391294897993313545 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule09.r06Input, denominator, Int.cast_pow, Int.cast_ofNat] using Grothe.UpperChaos.Q0LegendreWeightRule09.r06Input.le
  have hmem := mem_rational_interval_of_integer_bracket (2798470738242292401238782189219793954736010597603168974072114160695063581076645371103205831762547976140561377918844992470165550481664482957029219271206988834735503670839577350391294897993313542) (2798470738242292401238782189219793954736010597603168974072114160695063581076645371103205831762547976140561377918844992470165550481664482957029219271206988834735503670839577350391294897993313545) denominator hle specr06.1
  have hinput : root (6 : Fin 9) ∈ Grothe.UpperChaos.Q0LegendreWeightRule09.r06Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule09.r06Input, denominator, Int.cast_pow, Int.cast_ofNat] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr06 : weight 8 (root (6 : Fin 9)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule09.r06Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule09.boundr06 specr06.1

theorem specr07 :
    root (7 : Fin 9) ∈ Set.Icc (((3814342281662703991491692487769808966713193520136107988015016445344653253824728621590674219386020133621531769615922666881178794834866768763535245246937631338571361020147353935179773589916603129 : ℤ) : ℝ) / denominator)
      (((3814342281662703991491692487769808966713193520136107988015016445344653253824728621590674219386020133621531769615922666881178794834866768763535245246937631338571361020147353935179773589916603132 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (7 : Fin 9)) 8).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule09.bracketAt, Grothe.UpperChaos.Q0LegendreRule09.brackets] using root_spec (7 : Fin 9)

theorem interiorr07 : |root (7 : Fin 9)| < 1 := by
  exact interior_of_integer_bracket (3814342281662703991491692487769808966713193520136107988015016445344653253824728621590674219386020133621531769615922666881178794834866768763535245246937631338571361020147353935179773589916603129) (3814342281662703991491692487769808966713193520136107988015016445344653253824728621590674219386020133621531769615922666881178794834866768763535245246937631338571361020147353935179773589916603132) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr07.1

theorem lowerr07 : (Grothe.UpperChaos.Q0LegendreWeightRule09.r07Interval.lo.toRat : ℝ) ≤ root (7 : Fin 9) := by
  have hle : ((3814342281662703991491692487769808966713193520136107988015016445344653253824728621590674219386020133621531769615922666881178794834866768763535245246937631338571361020147353935179773589916603129 : ℤ) : ℚ) / denominator ≤ ((3814342281662703991491692487769808966713193520136107988015016445344653253824728621590674219386020133621531769615922666881178794834866768763535245246937631338571361020147353935179773589916603132 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule09.r07Input, denominator, Int.cast_pow, Int.cast_ofNat] using Grothe.UpperChaos.Q0LegendreWeightRule09.r07Input.le
  have hmem := mem_rational_interval_of_integer_bracket (3814342281662703991491692487769808966713193520136107988015016445344653253824728621590674219386020133621531769615922666881178794834866768763535245246937631338571361020147353935179773589916603129) (3814342281662703991491692487769808966713193520136107988015016445344653253824728621590674219386020133621531769615922666881178794834866768763535245246937631338571361020147353935179773589916603132) denominator hle specr07.1
  have hinput : root (7 : Fin 9) ∈ Grothe.UpperChaos.Q0LegendreWeightRule09.r07Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule09.r07Input, denominator, Int.cast_pow, Int.cast_ofNat] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr07 : weight 8 (root (7 : Fin 9)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule09.r07Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule09.boundr07 specr07.1

theorem specr08 :
    root (8 : Fin 9) ∈ Set.Icc (((4417173601096426025414860202694367607109121720996474099860925252202559028870613990954237342365311712681665460983464189763662275041889597363950027151663526047337284870992193323696145482310386305 : ℤ) : ℝ) / denominator)
      (((4417173601096426025414860202694367607109121720996474099860925252202559028870613990954237342365311712681665460983464189763662275041889597363950027151663526047337284870992193323696145482310386308 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (8 : Fin 9)) 8).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule09.bracketAt, Grothe.UpperChaos.Q0LegendreRule09.brackets] using root_spec (8 : Fin 9)

theorem interiorr08 : |root (8 : Fin 9)| < 1 := by
  exact interior_of_integer_bracket (4417173601096426025414860202694367607109121720996474099860925252202559028870613990954237342365311712681665460983464189763662275041889597363950027151663526047337284870992193323696145482310386305) (4417173601096426025414860202694367607109121720996474099860925252202559028870613990954237342365311712681665460983464189763662275041889597363950027151663526047337284870992193323696145482310386308) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr08.1

theorem lowerr08 : (Grothe.UpperChaos.Q0LegendreWeightRule09.r08Interval.lo.toRat : ℝ) ≤ root (8 : Fin 9) := by
  have hle : ((4417173601096426025414860202694367607109121720996474099860925252202559028870613990954237342365311712681665460983464189763662275041889597363950027151663526047337284870992193323696145482310386305 : ℤ) : ℚ) / denominator ≤ ((4417173601096426025414860202694367607109121720996474099860925252202559028870613990954237342365311712681665460983464189763662275041889597363950027151663526047337284870992193323696145482310386308 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule09.r08Input, denominator, Int.cast_pow, Int.cast_ofNat] using Grothe.UpperChaos.Q0LegendreWeightRule09.r08Input.le
  have hmem := mem_rational_interval_of_integer_bracket (4417173601096426025414860202694367607109121720996474099860925252202559028870613990954237342365311712681665460983464189763662275041889597363950027151663526047337284870992193323696145482310386305) (4417173601096426025414860202694367607109121720996474099860925252202559028870613990954237342365311712681665460983464189763662275041889597363950027151663526047337284870992193323696145482310386308) denominator hle specr08.1
  have hinput : root (8 : Fin 9) ∈ Grothe.UpperChaos.Q0LegendreWeightRule09.r08Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule09.r08Input, denominator, Int.cast_pow, Int.cast_ofNat] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr08 : weight 8 (root (8 : Fin 9)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule09.r08Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule09.boundr08 specr08.1

noncomputable def selected : SelectedRule 9 where
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
    · exact interiorr07
    · exact interiorr08
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
    · simpa [lower] using lowerr07
    · simpa [lower] using lowerr08
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
    · simpa [upper] using weightr07
    · simpa [upper] using weightr08
  injective := by
    apply injective_of_ordered_integer_brackets 9 Grothe.UpperChaos.Q0LegendreRule09.brackets
      Grothe.UpperChaos.Q0LegendreRule09.count denominator denominator_pos Grothe.UpperChaos.Q0LegendreRule09.ordered root
    intro i
    simpa only [Grothe.UpperChaos.Q0LegendreRule09.bracketAt] using (root_spec i).1

def indexedContext : Array (ℚ × ℚ) := #[(Grothe.UpperChaos.Q0LegendreWeightRule09.r00Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule09.r00Upper), (Grothe.UpperChaos.Q0LegendreWeightRule09.r01Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule09.r01Upper), (Grothe.UpperChaos.Q0LegendreWeightRule09.r02Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule09.r02Upper), (Grothe.UpperChaos.Q0LegendreWeightRule09.r03Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule09.r03Upper), (Grothe.UpperChaos.Q0LegendreWeightRule09.r04Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule09.r04Upper), (Grothe.UpperChaos.Q0LegendreWeightRule09.r05Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule09.r05Upper), (Grothe.UpperChaos.Q0LegendreWeightRule09.r06Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule09.r06Upper), (Grothe.UpperChaos.Q0LegendreWeightRule09.r07Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule09.r07Upper), (Grothe.UpperChaos.Q0LegendreWeightRule09.r08Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule09.r08Upper)]

theorem context_lookup (i : Fin 9) :
    indexedContext[i.val]? = some (selected.lower i, selected.upper i) := by
  fin_cases i <;> rfl

end Grothe.UpperChaos.Q0GaussSelectedRule09

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let targets : Array Name := #[``Grothe.UpperChaos.Q0GaussSelectedRule09.root_spec, ``Grothe.UpperChaos.Q0GaussSelectedRule09.selected, ``Grothe.UpperChaos.Q0GaussSelectedRule09.context_lookup]
  for target in targets do
    let dependencies ← Lean.collectAxioms target
    logInfo m!"Selected rule audit {target}: {dependencies}"
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
