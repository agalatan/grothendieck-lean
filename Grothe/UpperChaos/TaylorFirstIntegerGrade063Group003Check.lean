import Grothe.UpperChaos.TaylorFirstIntegerGrade063Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade063Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade063Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade063Part01536 = 1132979137138236552975429456296531972147127584372720145990410162359426523984260217464669829639874610599236206592 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade063Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade063Part01600 = 866232274575119434995035645833799351395041703030941458375958955735920597182583267730596614884004370760096284672 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade063Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade063Part01664 = 661767880991799808796155056383966781108386611177841074705376820970665100899795894106621650512516145224532099072 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade063Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade063Part01728 = 506660631356398536201309995652067731057941920354837056691069165515693947192095001099025260498413606224965664768 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade063Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade063Part01792 = 389143177580856024185242732832602276081067388121323242109454835225302276362427363085157597176825540410894974976 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade063Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade063Part01856 = 299786850183186442029575389342117678987784610049807961661868254773374848004160346379784769042094544950854156288 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade063Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade063Part01920 = 231487122563565585258668596127694853780564825232029062522991941014050432045611490807723573338505228617271738368 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade063Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade063Part01984 = 178903026866173833999840854214395109228598963469922493027138047713412542762167753716688841142455151819009032192 := by decide +kernel

theorem group_length : firstCenterIntegerGrade063Group003.size = 512 := by
  simp only [firstCenterIntegerGrade063Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade063Group003 = 4266960101255336218441257726683175753786513605809422495084268183307846268433101334390268136234689198606860156928 := by
  simp only [firstCenterIntegerGrade063Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade063Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade063Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade063Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
