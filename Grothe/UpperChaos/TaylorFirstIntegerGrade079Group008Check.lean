import Grothe.UpperChaos.TaylorFirstIntegerGrade079Group008Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade079Group008Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade079Part04096.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade079Part04096 = 109079770381548344793871128789891145775315182751528705136936894541840090935359937505091600484960786372886528 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade079Part04160.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade079Part04160 = 112056795611225841488565797879004430409190011232119261189950742835878971152414110172374416257896728915607552 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade079Part04224.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade079Part04224 = 19608202146105793237111206222020918392582828534474205996520343304061963213702250930723252227274793847619584 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade079Part04288.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade079Part04288 = 94828590453773569094170993061687753027927519551335127520146269352949860922689146251548148782075058484936704 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade079Part04352.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade079Part04352 = 101435763152546691041486209231075976769134653504400843579212403823871214059551567509991256725625598283612160 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade079Part04416.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade079Part04416 = 86276244674061378192614492893913449585625473664876949910080762164783263152494786792325631803015023875325952 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade079Part04480.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade079Part04480 = 71782071918241874248675423583504041338843769536767600323011912259336059865441349628316992665314069674196992 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade079Part04544.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade079Part04544 = 5604451126947963213984363354258138726210308120529200574779312758237816598111679089156534640249018624507904 := by decide +kernel

theorem group_length : firstCenterIntegerGrade079Group008.size = 512 := by
  simp only [firstCenterIntegerGrade079Group008, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade079Group008 = 600671889464451455310479615015355854024829746896031894230638641040959239899764827879527833586411078078693376 := by
  simp only [firstCenterIntegerGrade079Group008, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade079Group008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade079Group008Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade079Group008Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
