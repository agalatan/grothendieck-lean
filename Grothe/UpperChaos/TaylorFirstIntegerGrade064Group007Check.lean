import Grothe.UpperChaos.TaylorFirstIntegerGrade064Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade064Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade064Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade064Part03584 = 236475118836110907623688105713232729138929715719070875525970531617113615996141553899013632397029816202690560 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade064Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade064Part03648 = 149496923759179621658609087824262410053452315822057293159231312174724122779440247020067689995775664055123968 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade064Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade064Part03712 = 75688974751911749739462738390032687344178438906790435361333441470590476386487571011835076378000836349919232 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade064Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade064Part03776 = 75901580979182257727168621724788011538986433991716934935840062273701665923462234057037354614418672296394752 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade064Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade064Part03840 = 64216226917220470052213747025917877109835345670501476984008098072204600505843691962276410863755417943539712 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade064Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade064Part03904 = 50138192226249034579976965794831448574516715463314747149441180220214576509706610270839437387910105412927488 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade064Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade064Part03968 = 80260794427282134177165374927853726519614375426923693480964585131479606116581787857864906470845074655674368 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade064Part04032.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade064Part04032 = 70815933288775546713153670371443384398619891933826924971502607494729674594063944544913099032373813869281280 := by decide +kernel

theorem group_length : firstCenterIntegerGrade064Group007.size = 512 := by
  simp only [firstCenterIntegerGrade064Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade064Group007 = 802993745185911722271438311772362274678133232934202381568291818454758338811727640623847607140109400785551360 := by
  simp only [firstCenterIntegerGrade064Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade064Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade064Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade064Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
