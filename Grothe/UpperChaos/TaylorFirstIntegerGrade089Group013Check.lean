import Grothe.UpperChaos.TaylorFirstIntegerGrade089Group013Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade089Group013Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade089Part06656.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade089Part06656 = 1306546545760745748957408757882015420883538032797086392147420473783366692221980527370419337999776242204672 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade089Part06720.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade089Part06720 = 10713668299406999680672046636737646933894414776430675344608627994605390369024678189585216474395573525413888 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade089Part06784.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade089Part06784 = 10794080042125433741871261854799561430632307428469572922558885599714008306597888214682360434181288801337344 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade089Part06848.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade089Part06848 = 6002534820959510017472126910563196610083312412384240603235551445628215029112340043903118705996830232018944 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade089Part06912.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade089Part06912 = 5939807433650552975614703937433800816657052866463644243341543022863961835614652395313565920215128105549824 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade089Part06976.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade089Part06976 = 11647155218958189935343097907541554467849528059305719706006804943084488806225616898827902158690102766731264 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade089Part07040.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade089Part07040 = 8409736164228012609958702485713578604710338582892912452052301806012735827091729516491005980807320880283648 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade089Part07104.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade089Part07104 = 4272495501106568063505009907812312006809448810896830606210970873607599371013657382031282413411882737074176 := by decide +kernel

theorem group_length : firstCenterIntegerGrade089Group013.size = 512 := by
  simp only [firstCenterIntegerGrade089Group013, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade089Group013 = 59086024026196012773394358398483666291519940969640682270162106159299766236902543168204871425697903290613760 := by
  simp only [firstCenterIntegerGrade089Group013, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade089Group013Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group013Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group013Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
