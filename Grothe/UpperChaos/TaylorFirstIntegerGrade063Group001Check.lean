import Grothe.UpperChaos.TaylorFirstIntegerGrade063Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade063Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade063Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade063Part00512 = 30185210966281989600300711332465823578316406793530275491174275889207188949431552893811724502749896327639162945536 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade063Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade063Part00576 = 21069790703398895648726120093403861631366540520930319925539646309130206179576680969246004011175098727031558373376 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade063Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade063Part00640 = 13998718074295871220384949526964075890639415489169770060861640863238342993010491647803206944851925134085546049536 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade063Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade063Part00704 = 9228686746652825018502480764545089320079349069749580413075302762319428210793735053899886476810216272370562236416 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade063Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade063Part00768 = 6683487114315243657001664686289066221500742436306236310512471512482514137608075961966512892503680296090846887936 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade063Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade063Part00832 = 5680691577683037520205383787146160488920658254561628414259653335821265721005480595916192771440061234144117522432 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade063Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade063Part00896 = 5408797273259740978885893157878007462403226814076919448270657925319354978868034587353584232799291864463372713984 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade063Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade063Part00960 = 5300823070422696068905993234229666582355693274414893262186462940271886613312273780007849984296110406998199107584 := by decide +kernel

theorem group_length : firstCenterIntegerGrade063Group001.size = 512 := by
  simp only [firstCenterIntegerGrade063Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade063Group001 = 97556205526310299712913196582921751175582032652739623325880111537790187783606325490004961816626280262823365836800 := by
  simp only [firstCenterIntegerGrade063Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade063Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade063Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade063Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
