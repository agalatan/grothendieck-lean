import Grothe.UpperChaos.TaylorFirstIntegerGrade088Group011Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade088Group011Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade088Part05632.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade088Part05632 = 19298835929822969841164764563627518709787456052712927174980125844564034970228120690790314595837832192851968 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade088Part05696.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade088Part05696 = 9030237978731636447207924413907335820889281775291967314752368718790376014780294874293216455185658546225152 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade088Part05760.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade088Part05760 = 8103768320312218709334356852336644793953489972956876475497246086415505814886023650498872025207101288611840 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade088Part05824.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade088Part05824 = 15029023046622633837179685730878506445989705037356875883455458305456904313966585843592056489933352193753088 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade088Part05888.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade088Part05888 = 12297365097636216192932046499956145661684847494062378677954501668315006854286292287031694650749472909295616 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade088Part05952.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade088Part05952 = 1376330982682467447336800388639205365037945662224254856650666148794113006893616531418129819359924891680768 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade088Part06016.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade088Part06016 = 10906293553867690329201575443200913792315106095276140606748380142983985364364049142678123406424372538245120 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade088Part06080.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade088Part06080 = 11275690141835632130521341129496833942547075018782322289877510208530027656536713918830955676026749744840704 := by decide +kernel

theorem group_length : firstCenterIntegerGrade088Group011.size = 512 := by
  simp only [firstCenterIntegerGrade088Group011, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade088Group011 = 87317545051511464934878495022043104532204907108663743279916257123849953995941696939133363118724464305504256 := by
  simp only [firstCenterIntegerGrade088Group011, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade088Group011Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group011Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group011Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
