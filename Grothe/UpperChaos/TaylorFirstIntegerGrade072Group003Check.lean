import Grothe.UpperChaos.TaylorFirstIntegerGrade072Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade072Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade072Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade072Part01536 = 746038032320518431153553311034420964213297262310704543193596318646709196673268996998332529952856884055797399552 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade072Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade072Part01600 = 622387457997576546861484668218515817595283604532963542867394430765797976955007013465033093219261080477049552896 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade072Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade072Part01664 = 511099885474426632824807009289641742806004457518538315365575799522449629785158026575333742755240415055191212032 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade072Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade072Part01728 = 414622525252446320765408794177472555756814825994347743964866532305835223793439780831431170364458847574037626880 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade072Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade072Part01792 = 333501267484346992481229383537397000745769407519561567669821052314646424509625368988012814418165852901820334080 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade072Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade072Part01856 = 3294815657346152913034325263972481729763034582071083570712051825930836890088108055819007362854754125877346304 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade072Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade072Part01920 = 264504035588224739863169214417936130285110779074950418090672371104572046451333092944017996281181764901117362176 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade072Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade072Part01984 = 214514795655538719881860761142732314477676819617210847249153224780375612925371856691929101749977453737940090880 := by decide +kernel

theorem group_length : firstCenterIntegerGrade072Group003.size = 512 := by
  simp only [firstCenterIntegerGrade072Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade072Group003 = 3109962815430424536744547467082089007609720191150348061971791781266316947983292244549909456103997052828830924800 := by
  simp only [firstCenterIntegerGrade072Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade072Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade072Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade072Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
