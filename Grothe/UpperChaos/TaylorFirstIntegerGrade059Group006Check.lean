import Grothe.UpperChaos.TaylorFirstIntegerGrade059Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade059Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade059Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade059Part03072 = 1082846228057721524306477434298405062678781650641408693315279529661260264219217802496277250311309810890440704 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade059Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade059Part03136 = 666815469567511968717853663180940683517324446345906638357340308341636181023111637580053823427386508994150400 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade059Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade059Part03200 = 500374392817534963593403912298320475475981084374803574115691666477623016307221001376032748090316489798713344 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade059Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade059Part03264 = 392759764242131440562130216788206383878893263613149116688320671452930125100086428457342346648619941915262976 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade059Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade059Part03328 = 266782468954269476059491431943677194924398908821460824100515077333747724802497872101565218877971296598097920 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade059Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade059Part03392 = 298046805815192153999829394457454711064654262392645735521804039405512817635772326414158481006408169729032192 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade059Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade059Part03456 = 228031650869689657297294107035846537899418142574877861315480315551361549387616495361417269480818036183138304 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade059Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade059Part03520 = 157173513813762596889824044733298548052060364799413631427097944349880320850350520386507260303222417274175488 := by decide +kernel

theorem group_length : firstCenterIntegerGrade059Group006.size = 512 := by
  simp only [firstCenterIntegerGrade059Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade059Group006 = 3592830294137813781426304204736149597491512123563666074841529552573951999325874084173354398146052671383011328 := by
  simp only [firstCenterIntegerGrade059Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade059Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade059Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade059Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
