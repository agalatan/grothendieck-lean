import Grothe.UpperChaos.TaylorSecondIntegerGrade035Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade035Group001Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade035Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade035Part00512 = 67974983104228202336155966614641085471504083747352642324349773205947767150610255418550696026914374516754874368 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade035Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade035Part00576 = 85052556327114571060502664280608338965095107131632610237335539450589569613091676083462098238819553652334657536 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade035Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade035Part00640 = 39382083906110653743773598188803531966414792143283803769216226967586499157595240356240899578339380617879224320 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade035Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade035Part00704 = 31965384468144310636360038083964672352758124894810132911078351413407314417199863458824679209804818501943164928 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade035Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade035Part00768 = 18898480583098278487497283496975483859625953403480719555950830948054337288489120305099180502210736485482627072 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade035Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade035Part00832 = 13482622237769146134994502020859072919730145378468667181130021841085758910711566832022797489690709776444424192 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade035Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade035Part00896 = 9821314069165104420017183445582397116165243786229503069724244816741991122708713589483482931507127113683566592 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade035Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade035Part00960 = 5281211003684495801570677460125083460571146665466003669863991384452846536763304367826831902823259530917314560 := by decide +kernel

theorem group_length : secondCenterIntegerGrade035Group001.size = 512 := by
  simp only [secondCenterIntegerGrade035Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade035Group001 = 271858635699314762620871913591559666111864597150724082718648980027866084197169740411510665880109960195439853568 := by
  simp only [secondCenterIntegerGrade035Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade035Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade035Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade035Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
