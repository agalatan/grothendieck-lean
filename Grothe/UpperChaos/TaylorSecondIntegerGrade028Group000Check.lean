import Grothe.UpperChaos.TaylorSecondIntegerGrade028Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade028Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade028Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade028Part00000 = 5760260202576996569629057382634061293545237865495314591702065092929413198033456304929300089757367119704280268800 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade028Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade028Part00064 = 2145497172756268601459220208665016694630617266784965874195733622707496427165385522105583004057260041384553873408 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade028Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade028Part00128 = 1206897793256590892930040443561224777654024727456266398157010812028739107317516176855261639200032771539111772160 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade028Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade028Part00192 = 603077811587702854428162114818580317017899038457869368249641931105830764887944627022954311399155910525426073600 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade028Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade028Part00256 = 424421260960607164140561314397345202560858775675255512700874091613803117962568925431846929664165840348336095232 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade028Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade028Part00320 = 325425774796583531016414108109722592612506926538426903093199532925848295785798834518017711349939151850602233856 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade028Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade028Part00384 = 291687290988544251798207627667536337224344415732065771132582753349880550809324897010010902111201045977793298432 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade028Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade028Part00448 = 148119468201433331222719361594691316720441987365505704420053092121108193127577122316714767802323873011274350592 := by decide +kernel

theorem group_length : secondCenterIntegerGrade028Group000.size = 512 := by
  simp only [secondCenterIntegerGrade028Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade028Group000 = 10905386775124727196624382561448178531965931003505670123651160928782119655089572410189689355341445754341377966080 := by
  simp only [secondCenterIntegerGrade028Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade028Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade028Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade028Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
