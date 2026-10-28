import Grothe.UpperChaos.TaylorFirstIntegerGrade087Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade087Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade087Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade087Part01024 = 885476834092569277820076869022150520104680885442828164842776288309215155082339549934733050674439861302307323904 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade087Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade087Part01088 = 375311592629039852171865628543232355387026771088222366522232860751219938606684235875821938242532132046952726528 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade087Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade087Part01152 = 291145790838448397713260374057583943812166548409262631160604286758585823468948958988997300418116512914595643392 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade087Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade087Part01216 = 512950730522853957331968226458678745190109468155568110251879587201464926663213564401765521135078005093515132928 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade087Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade087Part01280 = 414732968203587415012469316718075853936899085416911720403820524050611696045579951656440408383824047392472170496 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade087Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade087Part01344 = 2063434145152852641462940445002250056334226125107802058019018781968695764701881066540837868304612205579468800 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade087Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade087Part01408 = 361104345486823909058656090662154125354076688829302456535343274208175461710485064374553672048584857973864529920 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade087Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade087Part01472 = 328267354367487629772171229693282896574014336625618112198962242992674681624676704395028805683239556558803173376 := by decide +kernel

theorem group_length : firstCenterIntegerGrade087Group002.size = 512 := by
  simp only [firstCenterIntegerGrade087Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade087Group002 = 3171053050285963291521930675600160690415308010092821363973638083053916378966629910693881534454119585488090169344 := by
  simp only [firstCenterIntegerGrade087Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade087Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
