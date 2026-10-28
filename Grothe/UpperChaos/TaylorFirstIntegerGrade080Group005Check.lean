import Grothe.UpperChaos.TaylorFirstIntegerGrade080Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade080Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade080Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade080Part02560 = 9147573539173052594122879359543882731964940707041519156750885829143359856643038631922430154657364708383784960 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade080Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade080Part02624 = 31352884654942889852828714824585010612682958545544934062483012241615854902438842791146465655167237110900981760 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade080Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade080Part02688 = 32946811040008232520945672149144666659745135564401846285273684056755290018315309259508852094164492609556316160 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade080Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade080Part02752 = 26825204306360483543750495290495318693051030242507362177666879922427546097150397058662838666262972857285869568 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade080Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade080Part02816 = 21828396411490092210013684943356558551786989477572106445273201150489825554732162847372997224165558325405024256 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade080Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade080Part02880 = 20529522500306586991504619758289558768980697964055902871925189911579018172526550628126739825712957321379840 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade080Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade080Part02944 = 17654544516346807235699692320926501931289188647686870814031867632945744388983773560013265217718111512767234048 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade080Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade080Part03008 = 14124860282086205244200333340773087815910866572067095177341703565750707360694373188744240447873476279954046976 := by decide +kernel

theorem group_length : firstCenterIntegerGrade080Group005.size = 512 := by
  simp only [firstCenterIntegerGrade080Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade080Group005 = 153900804272908069788552976848583316555200090454785790021693159589039907197130423887999216199834926361574637568 := by
  simp only [firstCenterIntegerGrade080Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade080Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade080Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade080Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
