import Grothe.UpperChaos.TaylorFirstIntegerGrade086Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade086Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade086Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade086Part01024 = 924561190005194539147851539124011451633226464729112718587333090827842785787048100608563608740534491767814225920 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade086Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade086Part01088 = 689242015591915813307344418099207927154767611961300316334334639833449944071066911057403044577433041347203301376 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade086Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade086Part01152 = 8340210257785145939189638025140998525205578140245383727271140035861203873667507385999250357796814192136683520 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade086Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade086Part01216 = 540180279231648856956322008563755306000629104978704822043485459934992332510690191850588884920921175754457219072 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade086Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade086Part01280 = 441424388332134985975128805761419339318247424197606010892053688143104329778400162188262150456291739071269568512 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade086Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade086Part01344 = 103116350795021729610325760221825122317414058993907141003284389630193586243056698910472070877962270297135513600 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade086Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade086Part01408 = 281771183243129015271025584894273443590497037611700329583947610562397823543664498943209595887710484859111604224 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade086Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade086Part01472 = 351363109785514486640781141890055408891752467381931407654682911157686548777917871573887623139583277576056995840 := by decide +kernel

theorem group_length : firstCenterIntegerGrade086Group002.size = 512 := by
  simp only [firstCenterIntegerGrade086Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade086Group002 = 3339998727242344572847968896579688997431739747994508129826392930125528554585511942518386228958233294865185112064 := by
  simp only [firstCenterIntegerGrade086Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade086Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
