import Grothe.UpperChaos.TaylorSecondIntegerGrade024Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade024Group001Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade024Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade024Part00512 = 93503712928713258226485715656160169593285200977693429233196457207485651049893057446178214966722865939110428672 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade024Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade024Part00576 = 85969885975836655000458538527116459298831278777304439439033994486287885013591824598656538511625155891114803200 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade024Part00640.size = 10 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade024Part00640 = 570957888762261495730296137932021510844691940000439861652999120621217751305462217150338862610166126366162944 := by decide +kernel

theorem group_length : secondCenterIntegerGrade024Group001.size = 138 := by
  simp only [secondCenterIntegerGrade024Group001, Array.size_append, len0, len1, len2]

theorem group_energy : energy secondCenterIntegerGrade024Group001 = 180044556793312174722674550321208650402961171694998308533883450814394753814790344261985092340958187956591394816 := by
  simp only [secondCenterIntegerGrade024Group001, energy_append, sum0, sum1, sum2]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade024Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade024Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade024Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
