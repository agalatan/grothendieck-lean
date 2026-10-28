import Grothe.UpperChaos.TaylorFirstIntegerGrade089Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade089Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade089Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade089Part03584 = 5393468481082892245832677750624206029173586519522435083624968198840090079046884989466591227429838030333018112 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade089Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade089Part03648 = 2680345399246768552803949959429182062768900379023738559749823231736371580803878856663685564693507223846912 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade089Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade089Part03712 = 4147821773167684709871610933589333781425986294542203510098069510201831423483286304124075163204428577208532992 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade089Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade089Part03776 = 3135374652805092260281307490917477011356031867417667208141188120190936468870038635263168724490515068538060800 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade089Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade089Part03840 = 6270760890445286267939979139331910895953010436443326917871895734899208582354703497088254980920486433652736 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade089Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade089Part03904 = 2331228708497744309419809409665520388854006309285888327290560011743648461150714988634459291027700477314727936 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade089Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade089Part03968 = 1719636035657205215415842995004605613322185582034828171148055234791586286574937163295578485659311799867015168 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade089Part04032.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade089Part04032 = 502016573232894741711893563078908045152738957771079868172388053163569910424238417663272442953174580444790784 := by decide +kernel

theorem group_length : firstCenterIntegerGrade089Group007.size = 512 := by
  simp only [firstCenterIntegerGrade089Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade089Group007 = 17238497330733205537353886071978811962243257441389569233952850847898298209713259080800897275310582527363645440 := by
  simp only [firstCenterIntegerGrade089Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade089Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
