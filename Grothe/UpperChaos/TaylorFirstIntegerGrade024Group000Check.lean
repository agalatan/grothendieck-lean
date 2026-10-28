import Grothe.UpperChaos.TaylorFirstIntegerGrade024Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade024Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade024Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade024Part00000 = 2776851679287062103712542734326797324554330681201435245827890672849899535436114065508071073540966247498471868203008 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade024Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade024Part00064 = 915683197289186491484212015904788765700799823036438644235391772989864340452157619611976062194055306376295523287040 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade024Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade024Part00128 = 701492064387875148515545051947983466510277460276791716338585353307208339048623409196989497447698355030951811088384 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade024Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade024Part00192 = 135938762711612201215889146012958788745747261668965842743590342315531794673831047844494400718437170920150332866560 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade024Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade024Part00256 = 15147185691728170367512467221668524147735837408289405182850154861211132869901611981814116946208735472310466641920 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade024Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade024Part00320 = 8226264626851215349054626963016936473307793893373894946645604579100658357195855424790742314204588603067064123392 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade024Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade024Part00384 = 4284915850386099649182892984444992012192800575283650384291405169594295085193811658284231691719484161152641925120 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade024Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade024Part00448 = 1847356414173440995413666771412230088557618522419863623480021129423681301103327317372998340515571937501310353408 := by decide +kernel

theorem group_length : firstCenterIntegerGrade024Group000.size = 512 := by
  simp only [firstCenterIntegerGrade024Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade024Group000 = 4559471426258874871289352602133071028232949276582998263282725327201833777224120748543793123193805459999901018488832 := by
  simp only [firstCenterIntegerGrade024Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade024Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade024Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade024Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
