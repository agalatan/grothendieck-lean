import Grothe.UpperChaos.TaylorFirstIntegerGrade070Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade070Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade070Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade070Part02048 = 167429875652004289919140372439039103044477274069004757978133196494836907570672952585158780920424397360481697792 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade070Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade070Part02112 = 132597829384111129573073195837842088653641951690910018806543213252312664893798484508837280933274550435762405376 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade070Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade070Part02176 = 104907792321989474446411728958609259239650359525186295667680230432531379561263547813450067311615486233227034624 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade070Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade070Part02240 = 21832153449756001116517823855547872770224218495291599394354881238157718620590220675249926735656607053151993856 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade070Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade070Part02304 = 61139030001207930662722476839584411360778499251505099256241049633876921694488443928053065493709395560834793472 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade070Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade070Part02368 = 65433671004419015012343893578918785577632046334968342474174629729704958683269024059479702111556083160679710720 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade070Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade070Part02432 = 51325894120043567768850392911638170247145144429330014688913354700169907195057611607604575467807857114301333504 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade070Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade070Part02496 = 39767797151386005040859937389073005754651732430239415476670772176866324291387470147256268914415238767829843968 := by decide +kernel

theorem group_length : firstCenterIntegerGrade070Group004.size = 512 := by
  simp only [firstCenterIntegerGrade070Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade070Group004 = 644434043084917413539919821810252696648201226226435543742711327658456782510527755325089667888459615686268813312 := by
  simp only [firstCenterIntegerGrade070Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade070Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade070Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade070Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
