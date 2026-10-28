import Grothe.UpperChaos.TaylorFirstIntegerGrade082Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade082Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade082Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade082Part00512 = 13997570313526106783707571439761322750104588825218225487398941156228042341639984353213207537290074016614187008 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade082Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade082Part00576 = 2958242474086022679326396582248753628378098651899191496202592390071320810073253824711543966345271635019862900736 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade082Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade082Part00640 = 2691240734126115538722853618812894663565925023429894351053963394007866858079794878447416970816698139042750922752 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade082Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade082Part00704 = 2347727321692425943228552492303390974623838737893793705159153989319916903215788532687158337026006061220943101952 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade082Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade082Part00768 = 236047291527382883841028252551068124283033489554907292448455097251326455590800094839231725462173543326067720192 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade082Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade082Part00832 = 1685602797179425646409756621689078891041910704843488025001651097199275778859044527526328195577579406474610737152 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade082Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade082Part00896 = 1506048165789591763177252637377115848194626006212056050049467965181434280429532123442899451291729526410941825024 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade082Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade082Part00960 = 1150935216571353655713493429159695045041163250073743731141417077259001932590209915282430337979470097244661743616 := by decide +kernel

theorem group_length : firstCenterIntegerGrade082Group001.size = 512 := by
  simp only [firstCenterIntegerGrade082Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade082Group001 = 12589841571285844217203041205581758497878700452732292876544099951446371061180063881290222192036218482756453138432 := by
  simp only [firstCenterIntegerGrade082Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade082Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade082Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade082Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
