import Grothe.UpperChaos.TaylorFirstIntegerGrade076Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade076Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade076Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade076Part01536 = 569581687960564612500208653603432033573118783723914328384297474104181367329919556192291358519200212878215872512 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade076Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade076Part01600 = 484851444031343388159765091529923534427456975600325458078319246765894583215281244606967053588718639069448372224 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade076Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade076Part01664 = 407034241102548208895964508746697008440526277235483678548137937072682554245670500236797691532304354280873132032 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade076Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade076Part01728 = 31266362044685228136057122908247488123576412968718306572803219658991852435528144672318118566784233215335858176 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade076Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade076Part01792 = 307030213125410456942193688297445268417778105211760038411685626949198861447300153682341536193194445688943935488 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade076Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade076Part01856 = 278932740951648496787615843432633500055616832041219433285298337936641930363054927783559582906238478727268794368 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade076Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade076Part01920 = 228394219230917504615143867500714883043239104611351515184007465182866419346269318286414916628010574371553804288 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade076Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade076Part01984 = 185801240663755543699256427152385234501294117052321902172136979681259695557063462634171999088331469770832478208 := by decide +kernel

theorem group_length : firstCenterIntegerGrade076Group003.size = 512 := by
  simp only [firstCenterIntegerGrade076Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade076Group003 = 2492892149110873439736205203171478950582606608445094660636686287351717263940087308094862257022782408002472247296 := by
  simp only [firstCenterIntegerGrade076Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade076Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade076Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade076Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
