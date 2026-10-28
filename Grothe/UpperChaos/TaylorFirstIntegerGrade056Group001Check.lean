import Grothe.UpperChaos.TaylorFirstIntegerGrade056Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade056Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade056Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade056Part00512 = 52569367996866651240530822802785603352635768750574694825828001945755597140544628398171928993151498367619525771264 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade056Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade056Part00576 = 26025188525871537583529192510294574361537059227890434374899611427152353357491695221364632130499319962861865795584 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade056Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade056Part00640 = 28096140145237852659284265157718922604599974391318136378827436301421367094428397358411087851027233054583177609216 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade056Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade056Part00704 = 16161752255866964988934037686911832034791243134782011240832854275148570719643658374869407081604732579710943363072 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade056Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade056Part00768 = 14813272284512977717689782460224971723777416089805572813350963908404462875142102624471676411923743422362108821504 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade056Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade056Part00832 = 13090951465014646606147537804680974314670555452273024637966061981072688467112222333508080901557070878592536150016 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade056Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade056Part00896 = 10956910243319653574537480872704984653567347384897757091988116493562752419256500356092426249727109700748188844032 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade056Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade056Part00960 = 8704108821682727619902329680278137841769401171742164897601914256956496514339273606490225829199559248769181548544 := by decide +kernel

theorem group_length : firstCenterIntegerGrade056Group001.size = 512 := by
  simp only [firstCenterIntegerGrade056Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade056Group001 = 170417691738373011990555448975600000887348765603283796261294960589474288587958478273379465448690267215247527903232 := by
  simp only [firstCenterIntegerGrade056Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade056Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade056Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade056Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
