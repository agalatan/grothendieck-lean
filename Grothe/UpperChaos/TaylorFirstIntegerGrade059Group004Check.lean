import Grothe.UpperChaos.TaylorFirstIntegerGrade059Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade059Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade059Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade059Part02048 = 94103452093292532194716196026609246546096228875660229041554986363287384274242849970328556374659394828515672064 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade059Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade059Part02112 = 69037644702587082229968726260115748873718975556666824541409548886290742617185329663337808795194389448777269248 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade059Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade059Part02176 = 49210595630381011136239869317188052536730573703996750285159874102085657504092222952159150614851794247188742144 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade059Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade059Part02240 = 34486302929958351199096603460506055486218756753830664495694021177721508167894584774215976186340886683662155776 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade059Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade059Part02304 = 24310950851384145211023588178010964997242383879439042162556236329063854867060337239623019525248110109720051712 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade059Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade059Part02368 = 17782091294097076261460265608749216021298325052858904788451358507530280738275422291313227283670914472559509504 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade059Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade059Part02432 = 13950259619129572028939727032263646832012569500581040510314538690082085728446970359127814934179852694799253504 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade059Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade059Part02496 = 13098751122059334424617568817742559110833099811494470340968817676620859590926652342918954251333925903219556352 := by decide +kernel

theorem group_length : firstCenterIntegerGrade059Group004.size = 512 := by
  simp only [firstCenterIntegerGrade059Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade059Group004 = 315980048242889104686062544701185490404150913134527926166109381732682373488124369593024507965479268388442210304 := by
  simp only [firstCenterIntegerGrade059Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade059Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade059Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade059Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
