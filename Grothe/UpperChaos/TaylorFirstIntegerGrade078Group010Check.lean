import Grothe.UpperChaos.TaylorFirstIntegerGrade078Group010Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade078Group010Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade078Part05120.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade078Part05120 = 9827666488013687093954458815848775068609933930634262663767230470330359059707223036363039626082714250117120 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade078Part05184.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade078Part05184 = 21899677566926700685688102502405262481713887877136622064302806134117086003646409378423499142645776612589568 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade078Part05248.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade078Part05248 = 20580809080112981324037203909445694393018748797682251391915511633793392823146062138313126110920996208771072 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade078Part05312.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade078Part05312 = 20980747402545029432373307645877097776943052636734581948543291616115831234719428756124538772418503353827328 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade078Part05376.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade078Part05376 = 11437807192324152197431801438865597439189745761836381131818629909050804450870982517192113586743224251187200 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade078Part05440.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade078Part05440 = 10697777047773060020686206567192220982487553738682742758836277723467610739177361756530432931613005752303616 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade078Part05504.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade078Part05504 = 22966916333155954893588126680382723514567135555494116495300204528972276520819461602718372731994940869967872 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade078Part05568.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade078Part05568 = 18846456671919592434222669120596348198104161802788880168489496236517427431901144675930920936424643259006976 := by decide +kernel

theorem group_length : firstCenterIntegerGrade078Group010.size = 512 := by
  simp only [firstCenterIntegerGrade078Group010, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade078Group010 = 137237857782771158081981876680613719854634220100989838622973448252364788263988073861596043838843804557770752 := by
  simp only [firstCenterIntegerGrade078Group010, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade078Group010Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade078Group010Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade078Group010Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
