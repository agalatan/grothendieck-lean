import Grothe.UpperChaos.TaylorFirstIntegerGrade045Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade045Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade045Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade045Part01536 = 116367367394626714404282617020430064831486598987440304182147108997809611002804646216343972724460806102111485952 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade045Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade045Part01600 = 35070427469105812732171027402408227694248140747464879769980528130905870960156197119593096934251266147136569344 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade045Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade045Part01664 = 23292110238551166103786712246328820588150278286184088982095284112029145738420858192066572958267089525594390528 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade045Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade045Part01728 = 45500073111817808720996446835293989290594091475429260632424232277729489117996830398313568369216816648124628992 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade045Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade045Part01792 = 15072918778311828512935129691129727560947746213140995730320737889370512008191748349965545517670069593836617728 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade045Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade045Part01856 = 7473137335910646060372501378574727786299971790947086976842914156887626251313614184714759260878937061054218240 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade045Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade045Part01920 = 10615288597212768846497115197945063548195255758160768105311893408656032514846652932033549262153923548543975424 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade045Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade045Part01984 = 6373052490126346048042750394964007406422818952427849502040660026004592149082070458875141404498621661400006656 := by decide +kernel

theorem group_length : firstCenterIntegerGrade045Group003.size = 512 := by
  simp only [firstCenterIntegerGrade045Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade045Group003 = 259764375415663091429084300167074628706344902211195233881163358999392879742812617851906206431397530287801892864 := by
  simp only [firstCenterIntegerGrade045Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade045Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade045Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade045Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
