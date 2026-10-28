import Grothe.UpperChaos.TaylorFirstIntegerGrade087Group008Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade087Group008Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade087Part04096.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade087Part04096 = 321297361370648799249172866725942245638027830333690405826945444323531638417627286421335230680373876442005504 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade087Part04160.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade087Part04160 = 644567025444401972420705217351269925480290013387405154105742192781043760664241632187940535228387910150520832 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade087Part04224.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade087Part04224 = 437423451857584905969228917904055719734722733692590844112419830304271953467740570637264882835102886277414912 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade087Part04288.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade087Part04288 = 2909713437221536678989560398838370349639711742235085324268644017532095035059700234749686943032013993541632 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade087Part04352.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade087Part04352 = 280893268253963609080720600382173165231850330352033862378523783607415594030191232248639704813917970762825728 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade087Part04416.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade087Part04416 = 176877587797176442636294467794984879058862424422591418788949617196601124826996659515588693757794921889136640 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade087Part04480.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade087Part04480 = 103792425704420358329903015252202326897967612952152603630991967673837612076689701002421100495371334718586880 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade087Part04544.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade087Part04544 = 11594779179826781930181111564188038128846733838343799142238261830776994993570609261698588746059548893118464 := by decide +kernel

theorem group_length : firstCenterIntegerGrade087Group008.size = 512 := by
  simp only [firstCenterIntegerGrade087Group008, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade087Group008 = 1979355613045244406295195757373654670520207390721043173310079741735010773512117391509638423500040463127150592 := by
  simp only [firstCenterIntegerGrade087Group008, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade087Group008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group008Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group008Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
