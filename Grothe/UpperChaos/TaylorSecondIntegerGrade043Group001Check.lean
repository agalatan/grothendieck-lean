import Grothe.UpperChaos.TaylorSecondIntegerGrade043Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade043Group001Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade043Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade043Part00512 = 35556984940246578693380302076429888147669192062448210957745618970421827005223720403403493825625129174916136960 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade043Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade043Part00576 = 33328735968268663308759061397082056054697951743852185675582920319351372994435298366050981114748565622569828352 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade043Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade043Part00640 = 14086577371880481246847991601532396182563413250180556469512578731128880590651684833195033781930231947514085376 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade043Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade043Part00704 = 22539618617430624397579443881663315913636251990791794650134580911945218074997890735822523247221570929470472192 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade043Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade043Part00768 = 10676141085571010829635524342250307070388074770065276530912819186560795769053331560956719821123656542685495296 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade043Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade043Part00832 = 9782703646191878197052985579290232877959528666966752970743328308392997152996205099315393283647349785024790528 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade043Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade043Part00896 = 5450496055018709112198259462662759584346764039058057574642842939408212237535854282296950656253239903347802112 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade043Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade043Part00960 = 6032734779002355759456217984960163132339083673236665293852046409965247023542913684794825899270802177330774016 := by decide +kernel

theorem group_length : secondCenterIntegerGrade043Group001.size = 512 := by
  simp only [secondCenterIntegerGrade043Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade043Group001 = 137453992463610301544909786325871118963600260196599500123126735777174550848436898965835921629820546082859384832 := by
  simp only [secondCenterIntegerGrade043Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade043Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade043Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade043Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
