import Grothe.UpperChaos.TaylorSecondIntegerGrade023Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade023Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade023Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade023Part00000 = 7926614498271548708742986876794420495855725473033754622494152108428149664967203466669673130067806823673017401344 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade023Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade023Part00064 = 2659640689243881088478152589254709013445462640427247440800278970563122934944167560062903179766643850032065806336 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade023Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade023Part00128 = 883341621065147926884883688095165824008911555246292295037986698538901088858555452718509698269102488250398801920 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade023Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade023Part00192 = 768809489568202475873376839104273572817842929201608952725158441098950258982755032309575983776500446274042986496 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade023Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade023Part00256 = 704664474700521378822294506215280185863687423482817305384207886413237106417001652527513897797020056297198845952 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade023Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade023Part00320 = 295679303303474212882351009460399421021688816701116869608614023704703458678092894602196566021632942238263672832 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade023Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade023Part00384 = 191630698031071746326625548248968531624140358232967277259997355836728224546615654218064417047192991612337651712 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade023Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade023Part00448 = 112846005033583534055351639409773234915339702243165193654732514978418182545436229331130706908561920859293351936 := by decide +kernel

theorem group_length : secondCenterIntegerGrade023Group000.size = 512 := by
  simp only [secondCenterIntegerGrade023Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade023Group000 = 13543226779217431072066022696582990279552798898568969956965127999562210919939827942439567579654461519236618518528 := by
  simp only [secondCenterIntegerGrade023Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade023Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade023Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade023Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
