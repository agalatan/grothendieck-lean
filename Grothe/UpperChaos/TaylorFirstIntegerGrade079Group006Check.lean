import Grothe.UpperChaos.TaylorFirstIntegerGrade079Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade079Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade079Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade079Part03072 = 11374337324011553636210706918827321918246461397255102920159972110628707922428664082371477155693105987545202688 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade079Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade079Part03136 = 8601603556647052559226435385096404319261479021606488002264512157185459875806453633788376020059766271481217024 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade079Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade079Part03200 = 6371446739597468095694796096814920197530090250867965900109488443039892624395275963709444321086921069803077632 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade079Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade079Part03264 = 4648904476703640474864411929753165299238036813140302056141670881597028352347261800327766817368730397352919040 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade079Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade079Part03328 = 8805236732647490959328178384859864241846175872454544847765287941814205815994793909815263431137052569108480 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade079Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade079Part03392 = 3348227565211934519187850473825583924262198116312837117208286891871700439508634500564197743324624668573302784 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade079Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade079Part03456 = 2379063838497169907981632254962414251860392703440939808750923115247912048822940189653179017461113587020857344 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade079Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade079Part03520 = 1672600135327333298185232233582139580158144498547250246684765720401498909870090851255185268270074818352644096 := by decide +kernel

theorem group_length : firstCenterIntegerGrade079Group006.size = 512 := by
  simp only [firstCenterIntegerGrade079Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade079Group006 = 38404988872728799982310393471246809354798648977043340596167384607914014378995315815579441606695473852698329088 := by
  simp only [firstCenterIntegerGrade079Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade079Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade079Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade079Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
