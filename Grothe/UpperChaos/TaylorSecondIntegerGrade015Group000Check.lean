import Grothe.UpperChaos.TaylorSecondIntegerGrade015Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade015Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade015Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade015Part00000 = 58989288056971534931866215845403864527300092672088883379390407704217480957194009622565091067491974170183802552320 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade015Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade015Part00064 = 1906593520521227358052337315284499033352916290814451893153500954232665164135502369733682845457774091391371051008 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade015Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade015Part00128 = 1008980660024528415380077617826969432769689279676651817996075807853969352578463082278508025462846768570303512576 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade015Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade015Part00192 = 400653072226459207613730850030003316872472508330920769289597911866862727203478904964811111086987499591815921664 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade015Part00256.size = 16 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade015Part00256 = 31668284137918254893136512734598390785404887710747655449480067206695416505755857292915645500706102544108093440 := by decide +kernel

theorem group_length : secondCenterIntegerGrade015Group000.size = 272 := by
  simp only [secondCenterIntegerGrade015Group000, Array.size_append, len0, len1, len2, len3, len4]

theorem group_energy : energy secondCenterIntegerGrade015Group000 = 62337183593881668167805498141279934701080575638621655515279062445377673617617209836835008695000288632281401131008 := by
  simp only [secondCenterIntegerGrade015Group000, energy_append, sum0, sum1, sum2, sum3, sum4]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade015Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade015Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade015Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
