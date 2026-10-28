import Grothe.UpperChaos.TaylorSecondIntegerGrade036Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade036Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade036Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade036Part00000 = 1805896473407375301483817736179568752597112602560510178237802522925906930151778306709819878221237106976078430208 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade036Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade036Part00064 = 2382188694229328421561583082672456322177807321585914358286942103030416406498476228236706689811492331051684986880 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade036Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade036Part00128 = 1026917945885745391906297303100056120082544288771793027601982217843071451973025919877652675362444783414658727936 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade036Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade036Part00192 = 371191700225504037919709769314793661320650922455719485808374194974021376209639201475518296167005597870971682816 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade036Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade036Part00256 = 358617226860351569714951684613094233508350787412094779561875317181707262062303962179955099799517571713282867200 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade036Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade036Part00320 = 180018538153967868626660053628396415839314754143130442446835405237179494676673345510299012628921940394465296384 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade036Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade036Part00384 = 107889839060517623425012288337086264388229455820442359724619962914619047839541345709860007006699641957743853568 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade036Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade036Part00448 = 86229634450272754210610550255951269952950968555197257448054405019830924294529390934451768215585973460485013504 := by decide +kernel

theorem group_length : secondCenterIntegerGrade036Group000.size = 512 := by
  simp only [secondCenterIntegerGrade036Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade036Group000 = 6318950052273062968848642468101403039866961101304801889116486129126752893705967700634263427212904946839370858496 := by
  simp only [secondCenterIntegerGrade036Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade036Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade036Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade036Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
