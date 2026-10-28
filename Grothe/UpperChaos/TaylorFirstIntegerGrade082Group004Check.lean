import Grothe.UpperChaos.TaylorFirstIntegerGrade082Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade082Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade082Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade082Part02048 = 145199067782331851424694315646741189065148930227567003218370426979395539567424490813742643659931605748259225600 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade082Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade082Part02112 = 185111495298505321909762272358429585180722526902059615222323998834902277415142169513998264505208547112386560 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade082Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade082Part02176 = 118711554552098009590431059352710035117781356835449485970726331022177131802526535509723578481093846354456739840 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade082Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade082Part02240 = 97258145202916756179457660895363215810770567825672168819325010490639163425444812221011333434039315058753798144 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade082Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade082Part02304 = 79724721409097788693690218466834125219953408718923183078564073729833229172018653990024715277850280574993825792 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade082Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade082Part02368 = 455732145975479138037844153739688364587140685827200674617453032803087829336751409780629391104884030744559616 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade082Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade082Part02432 = 65117419392498983746296583007872871645622892024846693545271367882799658285765720684037210523201672484011114496 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade082Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade082Part02496 = 54061998029264109747232480636655782738354933416201914046428166163578658297515439051125965726847115536088694784 := by decide +kernel

theorem group_length : firstCenterIntegerGrade082Group004.size = 512 := by
  simp only [firstCenterIntegerGrade082Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade082Group004 = 560713750009481483841749924432275337547399952261389708968525153300061370657447545848960074758573928334420344832 := by
  simp only [firstCenterIntegerGrade082Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade082Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade082Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade082Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
