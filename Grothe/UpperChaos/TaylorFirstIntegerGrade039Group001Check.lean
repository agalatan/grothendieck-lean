import Grothe.UpperChaos.TaylorFirstIntegerGrade039Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade039Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade039Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade039Part00512 = 22574437510163515760322126102708320497042233480256601225828177482590541725884454365731007666798074067861718958080 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade039Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade039Part00576 = 5489753744164704859238700643920030767559927199579020404599534642758290921396760062242413604644014184361858433024 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade039Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade039Part00640 = 7293139766431051081465672127628529386094743706821742283201136234267930205491586781348411934763856925946806272000 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade039Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade039Part00704 = 2287427800081336442955774523372157380230762066879499830939762839119509342727629917083311964187205692389085675520 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade039Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade039Part00768 = 2469696577319489528229337620883706688244022949727301165545878074919471383920881202087230795903535441685218590720 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade039Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade039Part00832 = 711164033966446073276776121131683267514708068709910635364668547169345731561978065951763669622349350756780343296 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade039Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade039Part00896 = 389604217339747574711211668744977735545586437107134555679510728982830432773241689184543340804416387231497846784 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade039Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade039Part00960 = 283029606047267385224561657219585591820425099622667719598357670836189496352735088543872377396143027615243960320 := by decide +kernel

theorem group_length : firstCenterIntegerGrade039Group001.size = 512 := by
  simp only [firstCenterIntegerGrade039Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade039Group001 = 41498253255513558705424160465608991314052409008703877820757026220644109240109267172172555354119595077848210079744 := by
  simp only [firstCenterIntegerGrade039Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade039Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade039Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade039Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
