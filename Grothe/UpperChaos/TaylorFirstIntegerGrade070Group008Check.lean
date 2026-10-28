import Grothe.UpperChaos.TaylorFirstIntegerGrade070Group008Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade070Group008Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade070Part04096.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade070Part04096 = 95351313206391383702433618632787426908004442879603897737225871951931282253251053114770755886729624578686976 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade070Part04160.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade070Part04160 = 71877698268041077503206602226179353206436546886975689925345067974477179172295361360540292208284121870368768 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade070Part04224.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade070Part04224 = 52182373975297485449172917752492389311325999761996327645953373390998988415219147198381756182402222436384768 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade070Part04288.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade070Part04288 = 40716168318483203266985644521550190084578292081716060960474308141000571516120211506446526654492657724686336 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade070Part04352.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade070Part04352 = 45563030844795651882220042900299958198928276011025620768492182210777765321477531975972034659877580655558656 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade070Part04416.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade070Part04416 = 34992430019586055494253979148328427357825043258352116688007369932424048294599164422834651644380000555106304 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade070Part04480.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade070Part04480 = 23087702429821724085197371238064276362728145639738278221268671487604150246418906805274591789996044189696000 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade070Part04544.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade070Part04544 = 21779164124492746001187204076530914087579482040538168701451665536244040081586323246432009993579959559389184 := by decide +kernel

theorem group_length : firstCenterIntegerGrade070Group008.size = 512 := by
  simp only [firstCenterIntegerGrade070Group008, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade070Group008 = 385549881186909327384657380496232935517406228559946160648218510625458025300967699630652619019742211569876992 := by
  simp only [firstCenterIntegerGrade070Group008, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade070Group008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade070Group008Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade070Group008Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
