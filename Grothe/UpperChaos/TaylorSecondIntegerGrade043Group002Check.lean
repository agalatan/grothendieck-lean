import Grothe.UpperChaos.TaylorSecondIntegerGrade043Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade043Group002Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade043Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade043Part01024 = 4730854564702091108629860881357903337009080265528321731518267863690287549336121558846054388301391828176863232 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade043Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade043Part01088 = 2613349035879245857156699797398154781389220018513896882015859223684519981004861358875690156072751390049435648 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade043Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade043Part01152 = 2535798897884103703157734606232154278886491351298062805562750847623923346809988812885691697133792212199407616 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade043Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade043Part01216 = 1721718179944219883264528522965946918167514835127391503425250351910621917870252664754417717786725049247465472 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade043Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade043Part01280 = 1696344251559209064101177845831369050498526401886720403138197675221651953271489018964175143845781922830614528 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade043Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade043Part01344 = 1098514712609567057655926086528891443952928208312050340640433662128234641897942899456326158126676839984267264 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade043Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade043Part01408 = 859241673563234941379628185998213843180492283352472392671022974003987230192600359035841244931237350633111552 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade043Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade043Part01472 = 1018105581305603863595078498623989618321078495128825248969182980061685479851708893124525143343810438435438592 := by decide +kernel

theorem group_length : secondCenterIntegerGrade043Group002.size = 512 := by
  simp only [secondCenterIntegerGrade043Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade043Group002 = 16273926897447275478940634424936623271405331859147741307940965578324912100234965565942721649542167031556603904 := by
  simp only [secondCenterIntegerGrade043Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade043Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade043Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade043Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
