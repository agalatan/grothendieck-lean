import Grothe.UpperChaos.TaylorFirstIntegerGrade060Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade060Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade060Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade060Part01024 = 7112921371653179424237568117846926583406913338142506455394370314371444587594429412691000286663595704282628751360 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade060Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade060Part01088 = 6066824321326068512544600312730372206185304816546007022342276211807934375064065015869401270083586152206232977408 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade060Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade060Part01152 = 4975209716922366400643224278992754993201942081145802966180280500250126749677199768832798319653641523432655945728 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade060Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade060Part01216 = 3946223551072265970674259244804374741191095182670892621073427080756245195754092893239909029001628114604299124736 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade060Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade060Part01280 = 3047737615083807350691201497475279607575205558036671565066748147656464348808771979034745399599653686241054949376 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade060Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade060Part01344 = 2309044609133793865506353397973709228628624001499048746020088860202835550020784643746097994393893931698746294272 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade060Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade060Part01408 = 1728730873744798394949363872218733727656096419103981799304278098387684201269693775712731194268269485353559130112 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade060Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade060Part01472 = 1286804869981475343065710444989411701916012325624374299994111394181756865108408341352236139375842440720733437952 := by decide +kernel

theorem group_length : firstCenterIntegerGrade060Group002.size = 512 := by
  simp only [firstCenterIntegerGrade060Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade060Group002 = 30473496928917755262312281167031562789761193722769285475375580607614491873297445830478919633040111038539910610944 := by
  simp only [firstCenterIntegerGrade060Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade060Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade060Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade060Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
