import Grothe.UpperChaos.TaylorFirstIntegerGrade077Group008Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade077Group008Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade077Part04096.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade077Part04096 = 140170573173637437492977458562851954946209072736720126533355180147118486430521982463711629200001955532898304 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade077Part04160.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade077Part04160 = 117732479192742616843337698398399888607500266040691132150863711574406930819627764621805736049228696210374656 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade077Part04224.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade077Part04224 = 100868414635686578169620950756247153056085386861694173798186311920512721048385126550354599350777508775591936 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade077Part04288.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade077Part04288 = 89237847548944790755871991146173307640646202673543491693565981146922366721255209537858298586835894889611264 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade077Part04352.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade077Part04352 = 8759843285373548429080611504341163089479295525314098063159476505757152472017229547004267439664257843593216 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade077Part04416.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade077Part04416 = 81723684187768344299264840681517396985997823554414641675453339864057932598818797478349328900589236627963904 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade077Part04480.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade077Part04480 = 75959054010856076232085476857120313845988430284655106602703006513100387890538050505257793787262366757421056 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade077Part04544.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade077Part04544 = 59669559424784759712807485838039795598244493303710994551114502231097824548164362497654197332913784908414976 := by decide +kernel

theorem group_length : firstCenterIntegerGrade077Group008.size = 512 := by
  simp only [firstCenterIntegerGrade077Group008, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade077Group008 = 674121455459794151935046513744690973770150970980743765068401509902973802529328523201995850647273701545869312 := by
  simp only [firstCenterIntegerGrade077Group008, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade077Group008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade077Group008Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade077Group008Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
