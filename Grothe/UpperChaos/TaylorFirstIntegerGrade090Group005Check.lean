import Grothe.UpperChaos.TaylorFirstIntegerGrade090Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade090Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade090Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade090Part02560 = 53755597944863674005331148094356495915368430277888463365985056365018023083293349788777908300700811614056611840 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade090Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade090Part02624 = 44896934569031813787403748302792969760449276741187996561798094802156322478921785388614708663998198321820729344 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade090Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade090Part02688 = 69788333296811379962986848329209810315085751600122718027474188479998995260500990261469478115956013515407360 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade090Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade090Part02752 = 37334581256902079433750937444831623602912351736528926562673418113435592942291858464115481725540527558373670912 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade090Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade090Part02816 = 31036427676978057199413221030741944911370910594472298470154606365167610951376729387347828406937730295508500480 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade090Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade090Part02880 = 5350877226555115949435157518894336775573363240656174160601771508290792201625095655308972511153409877608497152 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade090Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade090Part02944 = 20308288094776897237088114092236326355884988631749580339480322703013557560028663216838758050687231616480182272 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade090Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade090Part03008 = 21182895949194340748908054775050476588546371044829776908930159889048396906426802321198818591985362208670351360 := by decide +kernel

theorem group_length : firstCenterIntegerGrade090Group005.size = 512 := by
  simp only [firstCenterIntegerGrade090Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade090Group005 = 213935391051598789741293368107233383720420778018913339087650903934610295119224785212463945729119227506033950720 := by
  simp only [firstCenterIntegerGrade090Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade090Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
