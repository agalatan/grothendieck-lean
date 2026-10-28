import Grothe.UpperChaos.TaylorFirstIntegerGrade085Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade085Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade085Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade085Part02560 = 45713936742746796054532768887609300821698330553222937714844348529424317184542562218028948740241794341040816128 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade085Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade085Part02624 = 19195727375199324812788350839227425980790357838173834697688899743064109386054340402354635323692278284812288 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade085Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade085Part02688 = 37702215401670828915154094953336420746814151738494599741633655391928716380028234875452620991664958931870941184 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade085Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade085Part02752 = 31297174606978597982102751784734453418343167925760910591517638933918244455748714535431783102275635324355870720 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade085Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade085Part02816 = 26041687016658596058781129355351651301736006853028770420502187576205160512961475234507002027388812638738710528 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade085Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade085Part02880 = 5780341278394159758455276529655355595503308871223619715613699763795122092533205917474956625806103834263552 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade085Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade085Part02944 = 21633055937759751000186806549211502389424830104718186236250324837470488906028111760121104337057609678848000000 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade085Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade085Part03008 = 17841254544535744432536222658612127601668328707360935961627638406837052272060141809135745983709112625696604160 := by decide +kernel

theorem group_length : firstCenterIntegerGrade085Group005.size = 512 := by
  simp only [firstCenterIntegerGrade085Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade085Group005 = 180254300319003907927865017816224339061261109549295738120789096275290838942847827978997034774287421922670018560 := by
  simp only [firstCenterIntegerGrade085Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade085Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
