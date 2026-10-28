import Grothe.UpperChaos.TaylorFirstIntegerGrade089Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade089Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade089Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade089Part02560 = 3890430316415531593264701699921120175661481689655406845333350185336998968742584314516250667786375270498304 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade089Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade089Part02624 = 47005369528381788058888773730309156485883439671587849769680555444818201447108524454690424987880438327653957632 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade089Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade089Part02688 = 38944430669042169270431266009742572355583341985585442765606492632660475202898128003782482717773912538586546176 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade089Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade089Part02752 = 115417207750703724259093619928754834030836584184806182562605730648634968836835236544270344882188290577399808 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade089Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade089Part02816 = 32026702421477914412296845292736953276430043169425330386622783075052836025579064537160679917667937519742746624 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade089Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade089Part02880 = 26480901316529523494683079263494516907875418009668495841678735417298753231482342108694158785645315891916701696 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade089Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade089Part02944 = 21835650033475975858859175947227686872135281634069677021575853461816191258287025834633025081417065789158064128 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade089Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade089Part03008 = 18824460576249508028274451993245721867943370130075269851322745127610738579178564097434804105470082698706944 := by decide +kernel

theorem group_length : firstCenterIntegerGrade089Group005.size = 512 := by
  simp only [firstCenterIntegerGrade089Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade089Group005 = 166431186067550739859039773017132807573981965906341332644423681857608039871739841323916992890040114815604621312 := by
  simp only [firstCenterIntegerGrade089Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade089Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
