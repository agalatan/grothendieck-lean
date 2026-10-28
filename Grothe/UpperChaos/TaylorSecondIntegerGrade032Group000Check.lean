import Grothe.UpperChaos.TaylorSecondIntegerGrade032Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade032Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade032Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade032Part00000 = 2703838393566494402085840678396513004414760083701541735970789186513471862530605905964054612432704037591044849664 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade032Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade032Part00064 = 3009086096469820945894683388402181344203623178407902209995570389920185258200594653729695316868855453940755464192 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade032Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade032Part00128 = 1292760590398470123816824113978725772224675938139108789821730743314185672285931068382035586318142556219176386560 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade032Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade032Part00192 = 664988755601912651343618353294571947910721853805045639285822751105903134321627028526253601947980543070941741056 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade032Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade032Part00256 = 308393778080885919595379311303104789741005612605105727176915239593308837882610609332755313750847214637897744384 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade032Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade032Part00320 = 261756467369439692323051380523821011709030525087189828398588089823386445754126149297672886759078221693264592896 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade032Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade032Part00384 = 151252571032957989081467254322462417963233054202273099159547871965513410641912756417562775520491539665388568576 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade032Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade032Part00448 = 147659019259621949784995544613711512783652990891310789057814512529062804708557223039921416378395559142516326400 := by decide +kernel

theorem group_length : secondCenterIntegerGrade032Group000.size = 512 := by
  simp only [secondCenterIntegerGrade032Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade032Group000 = 8539735671779603673925860024835091800950703236839477818866778784765017426325965394689951509976495125960985673728 := by
  simp only [secondCenterIntegerGrade032Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade032Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade032Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade032Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
