import Grothe.UpperChaos.TaylorSecondIntegerGrade045Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade045Group001Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade045Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade045Part00512 = 29291955681821652163485349304697119798210314481689383014572614399374092514268333313203951852949248886844686336 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade045Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade045Part00576 = 16778530942767073102704546375781719616176840762904849751161534282070849128345741211535001134048522945265926144 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade045Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade045Part00640 = 29269505881270688551314994113143798659633813816905996714781499184027561133306062295758713037978512186503331840 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade045Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade045Part00704 = 13202006723253790736885362062452426625418778420215916734839557233074622933700971058051463951808784755261964288 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade045Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade045Part00768 = 8460606799851178283526473140948260303054404795139785402454208560908078144037767156047524565807220163312877568 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade045Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade045Part00832 = 11634059340666141432218498961367293643779798846184552209920669396359689842408905951723727208440663992384356352 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade045Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade045Part00896 = 6162383340919571032923280836510904017780941448792093787026222926141531342048308593116367077397290887862550528 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade045Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade045Part00960 = 6601507999769141475065192476636069920374536337980845290326309575884637523443160070898044656877899031651549184 := by decide +kernel

theorem group_length : secondCenterIntegerGrade045Group001.size = 512 := by
  simp only [secondCenterIntegerGrade045Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade045Group001 = 121400556710319236778123697271537592584429428909813422905082615557841062561559249650334793485308142849087242240 := by
  simp only [secondCenterIntegerGrade045Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade045Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade045Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade045Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
