import Grothe.UpperChaos.TaylorFirstIntegerGrade060Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade060Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade060Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade060Part01536 = 956877067340857324750363381188599183470132524617401576997763640306235789022386818551977327097405157660694675456 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade060Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade060Part01600 = 713988264490445891802743741490582967048152209152847006245554003907342370606774380111429503019476976320710180864 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade060Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade060Part01664 = 537208503116358420343891460902814249415171695863301596668567477305924424569634744193084830288793157289182756864 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade060Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade060Part01728 = 410666959625942733519643606596333353327034177535766182273298490957464519579050852316773428861846065398463594496 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade060Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade060Part01792 = 318456831185622681657767374687574593546415212417183835244851565194542987317225247248704120924242441447281786880 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade060Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade060Part01856 = 260210777212798160607864068960659523324628617941629459646028002019309792268690356680868845891849385537580302336 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade060Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade060Part01920 = 229239948749393692062913258016653107966459473737114036681053402663912113557812116486685657866811133703024017408 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade060Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade060Part01984 = 193487054459698910544405243074153165480534616065667145147283770835667051554627240730263460806266816059999780864 := by decide +kernel

theorem group_length : firstCenterIntegerGrade060Group003.size = 512 := by
  simp only [firstCenterIntegerGrade060Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade060Group003 = 3620135406181117815289592134917370143578528527330910838904400353190399048476201756319787174756691133416937095168 := by
  simp only [firstCenterIntegerGrade060Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade060Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade060Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade060Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
