import Grothe.UpperChaos.TaylorFirstIntegerGrade037Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade037Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade037Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade037Part00512 = 10816397380227327724297122164611459076419420093946789196257250461852781520608754605969480347525484469251580362752 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade037Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade037Part00576 = 11669849665362497696771205798560291330868173255220076198641839702423412946529095127713842255918590564718583218176 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade037Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade037Part00640 = 5439108719112987286530565689860951112797528472911718860580144715111174281285896040658780199451341953833652715520 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade037Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade037Part00704 = 1602272697107827455476062624404347867156121176977411978118536679025603035850284130756909161104342184806244679680 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade037Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade037Part00768 = 1298788281145147494955775013772508443935197582297411046699837731680275314930360330789621749336300013820215033856 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade037Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade037Part00832 = 443030686932682112628978499729075952040746059165798735990793321892899794723596820756012995988605583276373966848 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade037Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade037Part00896 = 403382071523685544468905352507747120348198367293867551236980470253744321360944077981517352844267481499091075072 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade037Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade037Part00960 = 490488907507357229571503006401939505069309616101163131250492314711490800317847689435187963297807315103905742848 := by decide +kernel

theorem group_length : firstCenterIntegerGrade037Group001.size = 512 := by
  simp only [firstCenterIntegerGrade037Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade037Group001 = 32163318408919512544700118149848320408634694623914236698775875396951382015606778824061352025466739566309646794752 := by
  simp only [firstCenterIntegerGrade037Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade037Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade037Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade037Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
