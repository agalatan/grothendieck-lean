import Grothe.UpperChaos.TaylorSecondIntegerGrade030Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade030Group001Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade030Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade030Part00512 = 116185178634976055568221264709971670738653468757412854529782487652634068027459788874442904684045627943997669376 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade030Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade030Part00576 = 68503801318316564773200419880631478558076674492864876907461994972486156827243449991429733104711226176315588608 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade030Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade030Part00640 = 35394174354452464997550137783146214469952713731320839062529195310864118438480591528175230444890645832113586176 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade030Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade030Part00704 = 24106316882130505118678017162190146167793275379898494039729476006156123741724619987442769069481918793772957696 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade030Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade030Part00768 = 18677431754949291781352404987483208028540048200152677807346430876769993602375918651113651225374500666438844416 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade030Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade030Part00832 = 15023309695861206806594653044572161640444771678864113770058525542745902971995564230149642174217630742178955264 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade030Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade030Part00896 = 12126842728594075723951781945752689893814932073543373229790904793271946983083855364490226080413878937295257600 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade030Part00960.size = 32 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade030Part00960 = 5295622078468314732200523544694726375921663667644551000402865535218712781624478699608956393172606872916590592 := by decide +kernel

theorem group_length : secondCenterIntegerGrade030Group001.size = 480 := by
  simp only [secondCenterIntegerGrade030Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade030Group001 = 295312677447748479501749203058442295873197547981701780347101880690147023373988267326853113176308035965029449728 := by
  simp only [secondCenterIntegerGrade030Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade030Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade030Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade030Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
