import Grothe.UpperChaos.TaylorFirstIntegerGrade090Group011Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade090Group011Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade090Part05632.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade090Part05632 = 3070950430864134943468841721842351476732874256898528710709653844500817564110079847907927184354729508470784 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade090Part05696.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade090Part05696 = 18286896781301488359088392646340200334627610328843593258949255851885415066620585348612833166240489184165888 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade090Part05760.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade090Part05760 = 17767488973671167190772155336154588451646539349085662153617608005775731021965511315184693391412354393047040 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade090Part05824.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade090Part05824 = 7134082230225941711170588764749149140624814357802435838489906271563995292277263661104612958256746570186752 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade090Part05888.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade090Part05888 = 8603363708767620692269876148930607894374249006182392143532349789821039729810425876272429564799174666354688 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade090Part05952.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade090Part05952 = 14185433821306211376894055081348631160875831451061622103393218198559690823973120124031908494952934609518592 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade090Part06016.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade090Part06016 = 11473698034645579793578700795981589611080835502916066832296647377988647024629192245094735993678695801815040 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade090Part06080.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade090Part06080 = 1706837912263796240709359886172283885620581976574237890329426705912079384354741583346338876540618597728256 := by decide +kernel

theorem group_length : firstCenterIntegerGrade090Group011.size = 512 := by
  simp only [firstCenterIntegerGrade090Group011, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade090Group011 = 82228751893045940307951970381519401955583336229364538931318066046007415907740920001555479630235743331287040 := by
  simp only [firstCenterIntegerGrade090Group011, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade090Group011Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group011Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group011Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
