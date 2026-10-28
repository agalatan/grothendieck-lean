import Grothe.UpperChaos.TaylorFirstIntegerGrade080Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade080Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade080Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade080Part01024 = 967957363723787735209667295381756326121067166458522770403718715030414765611392660592323511292488431128601952256 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade080Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade080Part01088 = 585165384301080809164206554052370781087219481100973796954152332957820687289308055552204840820871445072081584128 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade080Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade080Part01152 = 171510300827968078965730822908772081400922092036354979937448480498753363443332316794096468507144497979459633152 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade080Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade080Part01216 = 641369092654503175588501834000531971792873203440150456984141843573564817935617205513942607166553961737951903744 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade080Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade080Part01280 = 589032880826268512410205027806598657396842886436415849884060090036286812607695907977963397770809204735802867712 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade080Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade080Part01344 = 549682140522253009008937042766661486010214915290590570516846772367992505094951830822331774507691462121408692224 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade080Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade080Part01408 = 22395994288392809217112566760290533748064198396171864028798655288039249435746738585398286160938922361229410304 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade080Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade080Part01472 = 484890373975396142390595502086999504550392157983044884824861174682243542584784668005935295402035351949022330880 := by decide +kernel

theorem group_length : firstCenterIntegerGrade080Group002.size = 512 := by
  simp only [firstCenterIntegerGrade080Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade080Group002 = 4012003531119650271954956645763981342107596101142225173534028064435115744002829383844196181628533277085558374400 := by
  simp only [firstCenterIntegerGrade080Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade080Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade080Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade080Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
