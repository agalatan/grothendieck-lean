import Grothe.UpperChaos.TaylorFirstIntegerGrade084Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade084Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade084Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade084Part01024 = 563171365581694584020893332801371888460327860790219323464706656970920551892661806200042123860415393562573668352 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade084Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade084Part01088 = 775428060059818972516014580964711173412154558665526086351498847909624122407301228058047414486566196476559491072 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade084Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade084Part01152 = 602062532546146322396198347290214102462546440320949643586073629823472966358304422168759874553948412871257882624 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade084Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade084Part01216 = 98766060532643895396301868275985952881968262094306127333111977003777301562714783508646662117464476285025648640 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade084Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade084Part01280 = 397373266300438096590266773468599305725611120829317732435720222005210925877434094530002103668880998395889582080 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade084Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade084Part01344 = 438435949801276501059303884638520771097601166329663212515439842864145484494431591877088330389832173191430144000 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade084Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade084Part01408 = 402830961418205246149871866422835161889457856368688656771833142821446775876313250463139102567868281957518409728 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade084Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade084Part01472 = 7479876409806486155066724478133132839841319718241540832156847839938069209333827979953781018298579940521541632 := by decide +kernel

theorem group_length : firstCenterIntegerGrade084Group002.size = 512 := by
  simp only [firstCenterIntegerGrade084Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade084Group002 = 3285548072650030104283917378340371488769508585116912323290541167238536197678495004785679392663274512680776368128 := by
  simp only [firstCenterIntegerGrade084Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade084Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
