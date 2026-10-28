import Grothe.UpperChaos.TaylorFirstIntegerGrade076Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade076Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade076Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade076Part00000 = 4084193970610869927442621679908047248878418828624158722804392636489003971477529038006696828152326824462229962752 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade076Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade076Part00064 = 5218523921926560032089272876183975021410286213631721719766584538010720887196607701285119501178405191670973857792 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade076Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade076Part00128 = 6872697199115108236197511895586908590143069714149196719557951047140493069750579002727454628199508464470260187136 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade076Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade076Part00192 = 7466132990349586941633810210187656485739434826488006334265515815530848058967700724205261754417057488251977203712 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade076Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade076Part00256 = 7420495704202541767099572528020293681834917460652052774762329860448171050548308495540763924277230687960646549504 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade076Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade076Part00320 = 113930302597440962402159654322026349429539083822669853011769105145522086212375932395638900051020903549031677952 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade076Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade076Part00384 = 7287226051064416214303317488819076388096362648945777095465368572664038791728139949799294448983374621300020477952 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade076Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade076Part00448 = 6719553140589876214739998491204189517188798369182747640472574682870763104715592431215848834966365964719454420992 := by decide +kernel

theorem group_length : firstCenterIntegerGrade076Group000.size = 512 := by
  simp only [firstCenterIntegerGrade076Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade076Group000 = 45182753280456400295908264824232173282720827145496330860106486258299561020596833275176078820225290146384594337792 := by
  simp only [firstCenterIntegerGrade076Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade076Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade076Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade076Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
