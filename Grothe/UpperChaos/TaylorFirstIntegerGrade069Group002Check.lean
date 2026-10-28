import Grothe.UpperChaos.TaylorFirstIntegerGrade069Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade069Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade069Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade069Part01024 = 2015759433066350031358507640985390982033125198949886586082141531286384054431540546281766182476185927148195807232 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade069Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade069Part01088 = 1957781636068936098781217606121574294529031598682516898765062942516930980110215968111853610525087111949165002752 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade069Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade069Part01152 = 1854585066178757105666798661780023929755118083814411987163755288075021513610208305309190274532376077129348022272 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade069Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade069Part01216 = 998347690717704535344182324728744323182136967304170633895609264052743010197493215832918293296815455476941586432 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade069Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade069Part01280 = 732175371828333874373297911520123410132894937174885962635657687512373999159905851088792827828449335363151855616 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade069Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade069Part01344 = 1476372291628652320368270598121998816130364854251137244441123430309581720738606697556205834423139808818036211712 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade069Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade069Part01408 = 1293784812271097342271627909914560422594628036753411090933863536002714392760137753608731126221543152640719847424 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade069Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade069Part01472 = 1085454557369090076827934135407399430333437201254140817654277963233815483934695389847819238687870478089659088896 := by decide +kernel

theorem group_length : firstCenterIntegerGrade069Group002.size = 512 := by
  simp only [firstCenterIntegerGrade069Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade069Group002 = 11414260859128921384991836788579815608690736878184561221571491642989565154942803727637277387991467346615217422336 := by
  simp only [firstCenterIntegerGrade069Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade069Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade069Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade069Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
