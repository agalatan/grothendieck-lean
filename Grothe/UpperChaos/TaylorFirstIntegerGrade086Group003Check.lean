import Grothe.UpperChaos.TaylorFirstIntegerGrade086Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade086Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade086Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade086Part01536 = 323953730820149318481358600861726126091225131018218689182656676324979006366995125236252544974133923610544308224 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade086Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade086Part01600 = 3210253788077886963491432219340971810240768697255008156567186691735536486980050898312054990298833890960211968 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade086Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade086Part01664 = 290709945839816267517099431883906021807859696823024378951205747376033210590260885129207803307610131335724662784 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade086Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade086Part01728 = 260363542931721852156832091974483045171853793103449590850608929818073226892775810701467952426248970935159750656 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade086Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade086Part01792 = 225071633188392041900971660863142954743654398533133408377552367731851101149146337686996091978826325551619244032 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade086Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade086Part01856 = 918524238333057497588040246040903375693241446346643547077976422996036721657364612941998853111199249924620288 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade086Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade086Part01920 = 193078419859630514504223227006688075696541994605518461004852800940140828732845383059502771169574603943806238720 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade086Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade086Part01984 = 163543326415204102165774302220973866277172786167193370504945107164155583049702682327250641964496106403154362368 := by decide +kernel

theorem group_length : firstCenterIntegerGrade086Group003.size = 512 := by
  simp only [firstCenterIntegerGrade086Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade086Group003 = 1460849377081325041187338787276301964974241810394139550575466792469964529990363639651931859664300094920893399040 := by
  simp only [firstCenterIntegerGrade086Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade086Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
