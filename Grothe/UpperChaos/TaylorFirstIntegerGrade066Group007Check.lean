import Grothe.UpperChaos.TaylorFirstIntegerGrade066Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade066Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade066Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade066Part03584 = 402524447252709922415609875762871265845371838445848451461577259110510371708716658384128003465583753118613504 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade066Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade066Part03648 = 291542745738571535655249620658516045396503564868127693111321738297213319056127860458143296021777115993079808 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade066Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade066Part03712 = 200978340730025349910921519485634197063982030457337989657560985023588861253820925569974923294556048356016128 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade066Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade066Part03776 = 133111860031464963410868581390219029015094895894602862803687421330398689154673200975171783879779535955165184 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade066Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade066Part03840 = 116022062770278284474866691174022866187851631153693641573839656148797996108325043947860179170139568666050560 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade066Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade066Part03904 = 75645405038486728471856601480847236515409825304707597162429822806436210301364865916525185658458333012557824 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade066Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade066Part03968 = 40063158100565197154842102594174115933338674692398471169767970966767232996863452027345520227861946253180928 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade066Part04032.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade066Part04032 = 46099862622643647885895745023801550111960327854210877937483292798102493889754064806298048956540060927262720 := by decide +kernel

theorem group_length : firstCenterIntegerGrade066Group007.size = 512 := by
  simp only [firstCenterIntegerGrade066Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade066Group007 = 1305987882284745629380110737570086306069512788670927584877668146481815174469646072085446940674696362281926656 := by
  simp only [firstCenterIntegerGrade066Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade066Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade066Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade066Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
