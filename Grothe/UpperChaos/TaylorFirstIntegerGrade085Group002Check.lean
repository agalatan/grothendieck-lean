import Grothe.UpperChaos.TaylorFirstIntegerGrade085Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade085Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade085Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade085Part01024 = 969837467238661119119580575553997744467439666404010706200577547938221992405483208717885172073694837740381667328 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade085Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade085Part01088 = 734074042285390714587720058165449715798477252131489211747420248338757783967968045964051162965744134030073266176 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade085Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade085Part01152 = 239672600786985781724982792137438450323803835858879531819539775647043960673179168146362800684299177230197587968 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade085Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade085Part01216 = 330435207502881617196242353564260635783945492555743610718942742384916624473884477228254245528517663831483219968 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade085Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade085Part01280 = 467824910243679178434900250812551875189324889982772569508627629724714566857814640470711507707427639863722115072 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade085Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade085Part01344 = 410562066744645738233674418777897004388080607522748507569163806908410894733957867413344331536493503593429598208 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade085Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade085Part01408 = 22341194721314796879888399881354759381047979491246652698790087594254491491263800177093519823858715680615432192 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade085Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade085Part01472 = 353901620808379712400517987064594627173347050720049732523253111476519474005719056443895772515062860263297384448 := by decide +kernel

theorem group_length : firstCenterIntegerGrade085Group002.size = 512 := by
  simp only [firstCenterIntegerGrade085Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade085Group002 = 3528649110331938658577506835957544812505466774666940522786314950012839788609270264561598512835098532233200271360 := by
  simp only [firstCenterIntegerGrade085Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade085Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
