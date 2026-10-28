import Grothe.UpperChaos.TaylorFirstIntegerGrade064Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade064Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade064Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade064Part00512 = 25762633866825803896437401058703646346898275527230664182675728159500224249923834623937862632901280451671695032320 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade064Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade064Part00576 = 18095319467241774068710542594719955418585814908782577449114041942850246876480385398289495381518258759655973978112 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade064Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade064Part00640 = 12199193579276771055760042485661647345981891287914507188945045826363245159164880908687970691194076383010946547712 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade064Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade064Part00704 = 8102489409909810704489386300431549787611064658739292730090253638961726518063962540155154758714927919195890909184 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade064Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade064Part00768 = 5804850007737572984085836883042851235573266368211928675492969838786478582612840790919271093790601225687449731072 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade064Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade064Part00832 = 4851930180382693892314038606616121172190334719259139329478362761673297216214455930204703000407572067277265174528 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade064Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade064Part00896 = 4583255949992747973387354217190399361634588343183550767977612819096321401011511258839164690408912026517903507456 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade064Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade064Part00960 = 4494089322866387150126503823325935830786141801163721005706160798935042341805260311089875325567172837691361329152 := by decide +kernel

theorem group_length : firstCenterIntegerGrade064Group001.size = 512 := by
  simp only [firstCenterIntegerGrade064Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade064Group001 = 83893761784233561725311105969692106499261377614485381329480175786166582345277131762123497574502801670708486209536 := by
  simp only [firstCenterIntegerGrade064Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade064Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade064Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade064Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
