import Grothe.UpperChaos.TaylorSecondIntegerGrade039Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade039Group001Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade039Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade039Part00512 = 58985510572682541116472806653962692605539105846203796798626341291573946799452839912594209144703194573964312576 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade039Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade039Part00576 = 21952456788157317867143247687779548785052440313036154884516086295201142985660764655546618496226645811931381760 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade039Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade039Part00640 = 48069609428976030576784728418324655559188457421645145111448127132309865390515800185053541611153596087984455680 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade039Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade039Part00704 = 17800973033735755238550622973561200609861760163125210597020629108713178083035397194778505687888984181932294144 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade039Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade039Part00768 = 17068296859178742393893859161872633799947929886876480959249389897102008224217727734606942823324896329937715200 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade039Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade039Part00832 = 15001729058659024294785328845732069424784018066753851884169755504240650590712585412754808193110615415215620096 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade039Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade039Part00896 = 8519493912140153259733551564062073838344445315788686486321339249709597578726438965159281538353377873865211904 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade039Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade039Part00960 = 6966535119453373626613011528253099615043210808459940844032354595694102066249708565209532648555380838827556864 := by decide +kernel

theorem group_length : secondCenterIntegerGrade039Group001.size = 512 := by
  simp only [secondCenterIntegerGrade039Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade039Group001 = 194364604772982938373977156833547974237761367821889267565384023074544491718571262625703440143316691113658548224 := by
  simp only [secondCenterIntegerGrade039Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade039Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade039Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade039Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
