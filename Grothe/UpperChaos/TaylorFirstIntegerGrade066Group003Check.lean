import Grothe.UpperChaos.TaylorFirstIntegerGrade066Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade066Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade066Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade066Part01536 = 1061522940035314785887201576099783372206527455513595392029152062427386847426539517336675516787888821141267021824 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade066Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade066Part01600 = 840952267019102866184132148203325837648527910980882640795030113032671469872337693152683372902523287309834518528 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade066Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade066Part01664 = 659575268322513947931647172853248957028952561201160958533489083420818800950314004496780466105060205735077478400 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade066Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade066Part01728 = 513793509650084470627626203059985886417536273719719914227171045597432411699923821770284127012574453168791879680 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade066Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade066Part01792 = 399083634922276071910340116102358931428325474855825276305009176699818660094459755041274657589665430034752471040 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade066Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade066Part01856 = 310291001997535213897565966353604924152932869052571129210316954011752111376222456888545814073687579067657748480 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade066Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade066Part01920 = 242062976489467729158603028864696641545177674842372742937741221639750662508245819101712455049518389230569521152 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade066Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade066Part01984 = 189434101389377568019521595570170440715608027980055727290422332976162579186703014578536588444983722590546690048 := by decide +kernel

theorem group_length : firstCenterIntegerGrade066Group003.size = 512 := by
  simp only [firstCenterIntegerGrade066Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade066Group003 = 4216715699825672653616637807107174991143588248146183781328331989805793543114746082366492997965901888278497329152 := by
  simp only [firstCenterIntegerGrade066Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade066Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade066Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade066Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
