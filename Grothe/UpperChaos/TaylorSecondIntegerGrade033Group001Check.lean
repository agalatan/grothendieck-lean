import Grothe.UpperChaos.TaylorSecondIntegerGrade033Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade033Group001Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade033Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade033Part00512 = 106814380540368455586950965967150563526087478268502397190895787517923614987508212104990048935139881544419639296 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade033Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade033Part00576 = 78187638872771845054043222211819144039026943799108872389662204969150859793115045120106261730635564226923462656 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade033Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade033Part00640 = 50118915889064861201402145079521943374051271727806587196774781656104833300383055879922554923425036627290882048 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade033Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade033Part00704 = 27344399464717449093694515071844675136356124835159034826039376662346689439816966870808283664547462828051660800 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade033Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade033Part00768 = 19040312481058532764601420426947819711584054626289466960593353389754027781490323517966127869238088585204203520 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade033Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade033Part00832 = 9789821460368263679102239358816785465600373540856761036255566319933485995569051259933795662139642046402527232 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade033Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade033Part00896 = 9567982710337479071912113606302721765383136102716790029262894923200821673821109107428014513169259979618648064 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade033Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade033Part00960 = 8003903754157535103028786925391572387928791632669004151370212162042667575601623422294662615252755123493928960 := by decide +kernel

theorem group_length : secondCenterIntegerGrade033Group001.size = 512 := by
  simp only [secondCenterIntegerGrade033Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade033Group001 = 308867355172844421554735408647795225406018174533108913780854177600457000547305387283449749913547690961404952576 := by
  simp only [secondCenterIntegerGrade033Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade033Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade033Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade033Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
