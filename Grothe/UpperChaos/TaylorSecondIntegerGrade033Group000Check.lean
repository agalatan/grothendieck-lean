import Grothe.UpperChaos.TaylorSecondIntegerGrade033Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade033Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade033Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade033Part00000 = 2759067580043242759031828264464696850739008945163261396909654764984347818830305848175042434380939622309458608128 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade033Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade033Part00064 = 1448581489186764957119473715431071752850219562075110589226893024658196783217013833826509797176047900966659293184 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade033Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade033Part00128 = 649412499680486652133212229613749343299507155321245400083999311263228176758486406224744153496997645058983329792 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade033Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade033Part00192 = 516715594174659230194185679947154752316175724915392177358293155214470778998766138246689829032875299360091406336 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade033Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade033Part00256 = 315739021794640231401257321238540048694251063098244456378384124077808661336978685689938200663359665672328052736 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade033Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade033Part00320 = 152824298568387940069987390232498082927891812208462107236657322117847518887973818916187829451030677787252883456 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade033Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade033Part00384 = 222879860971613511988516342108793193362411040547661776235929795485710057024252291379983837648772349262783578112 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade033Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade033Part00448 = 101065109437850683402963901740383546232910793267074456275846862628239324981565099759089942536191483896060182528 := by decide +kernel

theorem group_length : secondCenterIntegerGrade033Group000.size = 512 := by
  simp only [secondCenterIntegerGrade033Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade033Group000 = 6166285453857645965341424844776887570422376096596452359705658360429849120035342122218186024386214644313617334272 := by
  simp only [secondCenterIntegerGrade033Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade033Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade033Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade033Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
