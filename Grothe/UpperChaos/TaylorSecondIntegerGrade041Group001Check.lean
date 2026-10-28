import Grothe.UpperChaos.TaylorSecondIntegerGrade041Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade041Group001Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade041Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade041Part00512 = 30666480497612777591128700148916832328091388741276636344651273218207820132104662589192546368183545111831904256 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade041Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade041Part00576 = 38902139624972588307018699374006267890753242433364186370265450285689263101363100786920457433133464689441767424 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade041Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade041Part00640 = 18882143560858582955001583036418775272558192618062015460920368576229706061814935875602453153179937657854099456 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade041Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade041Part00704 = 14420072469099775280127291802173536438089268875416852846035430140357103363813689477324757739127279071686295552 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade041Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade041Part00768 = 14474149174238396555800772792147876468766222393789565167185280503372736727621589741163646723715373112255053824 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade041Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade041Part00832 = 13263896397141521446760695148814732235966470142627077580048168889087088161768369178267691895641025086090117120 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade041Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade041Part00896 = 6976135528584025545563605593108224099197886524199939730230242451336209914254324570208924965995286610332090368 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade041Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade041Part00960 = 6395147388250359128392588090632049285624002030108308773792685346652833262491522070437250144903737769925279744 := by decide +kernel

theorem group_length : secondCenterIntegerGrade041Group001.size = 512 := by
  simp only [secondCenterIntegerGrade041Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade041Group001 = 143980164640758026809793935986218294019046673758844582273128899410932760725232194289117728423879649109416607744 := by
  simp only [secondCenterIntegerGrade041Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade041Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade041Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade041Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
