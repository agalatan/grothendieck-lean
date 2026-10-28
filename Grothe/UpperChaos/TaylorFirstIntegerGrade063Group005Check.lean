import Grothe.UpperChaos.TaylorFirstIntegerGrade063Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade063Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade063Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade063Part02560 = 10427155946818961595077886315758755179184867097437334137744832731469130976612895557313928395582442754092826624 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade063Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade063Part02624 = 7121672841533982831186399627959725456997501684636767062939048976050934082119066090048980961513324587645927424 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade063Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade063Part02688 = 5006977735918980472165350230453156150834953002686949904890946305239708790098414992690026207238460005616189440 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade063Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade063Part02752 = 3769284411935076640114710889154238256953229720017203067814986863209675130987718906595004494738293693005955072 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade063Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade063Part02816 = 3007895532506653720244246834402268698720495773897471019424197910554852081592411491153852743894557099705761792 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade063Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade063Part02880 = 2419511150007491692833380617498324133457276074891737700485530848072119368104548501585293730794775404253020160 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade063Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade063Part02944 = 1939771085415611075889310623114829251431233645380082802958936894319205787927217874200387554990950299734114304 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade063Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade063Part03008 = 1676964907393698406938830121983081691078591525738070686881316315967119881869273229760332972331403808197312512 := by decide +kernel

theorem group_length : firstCenterIntegerGrade063Group005.size = 512 := by
  simp only [firstCenterIntegerGrade063Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade063Group005 = 35369233611530456434450115260324378818658148524685616383139796844882746099311546643347807061084207652251107328 := by
  simp only [firstCenterIntegerGrade063Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade063Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade063Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade063Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
