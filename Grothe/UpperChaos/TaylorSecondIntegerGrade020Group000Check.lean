import Grothe.UpperChaos.TaylorSecondIntegerGrade020Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade020Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade020Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade020Part00000 = 13070558824435038167801223014795146173743313550319212080295632232400250624264988017393761697077230300069936234496 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade020Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade020Part00064 = 3039837001477116292667535825034537841456405907491588546931475580957858532725713216570879344538309778839944822784 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade020Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade020Part00128 = 1261155170555233344184080621247612756780824920152168762614246254454651421223290444690946313385685597807502688256 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade020Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade020Part00192 = 856869800593528808604438770742696137550059412698931215147931269558845538648564886749826066752873243212087558144 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade020Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade020Part00256 = 391489438022604559181983681262768558895909341773299758324389148313852080375045430936891413999157478981059477504 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade020Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade020Part00320 = 257582602598352395027931896341698532112061169960004129123862528820263033498931421794416558655095242742436986880 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade020Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade020Part00384 = 172453458218869582193053316579907270342495599074784838923815276184451124054585317040873542944845195068762488832 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade020Part00448.size = 14 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade020Part00448 = 16445386898508993157621458144585632050336073209177592685890078832289115445724275117158973028246197766302203904 := by decide +kernel

theorem group_length : secondCenterIntegerGrade020Group000.size = 462 := by
  simp only [secondCenterIntegerGrade020Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade020Group000 = 19066391682799252142817868584148952902931405974679166924047242369522461470236843010294753910381443034488032460800 := by
  simp only [secondCenterIntegerGrade020Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade020Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade020Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade020Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
