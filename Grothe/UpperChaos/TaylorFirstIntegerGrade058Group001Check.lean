import Grothe.UpperChaos.TaylorFirstIntegerGrade058Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade058Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade058Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade058Part00512 = 35779495933195896763477952279522771154152123471939496231711267208390409504325992307070810243202253913424234807296 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade058Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade058Part00576 = 23362881036791342993382658120005770579766237298525205276102388861668837515851472772606228442086411368711222984704 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade058Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade058Part00640 = 16403860319098736139087725373022169877663006922496282784129242249941684093118059712351078288837637021208986779648 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade058Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade058Part00704 = 13349511781817645808719020151320569972132426718670913050232683291654978791036637509285769645058759260882633490432 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade058Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade058Part00768 = 12484961878070944677861498218960746272361003980069119556291175045260668425958633574155283422628752475201235582976 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade058Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade058Part00832 = 12212839842714971560865393600556254692476018936188525975884426946965231789475880405133058396719940149195147575296 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade058Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade058Part00896 = 13852675122973887611850572272547362859212185434126123513598254413541494845324811063820234190266809585911218569216 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade058Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade058Part00960 = 14749371596380723332415465006319099052301175684044636218989523423260919562801032547120198061228724222654718935040 := by decide +kernel

theorem group_length : firstCenterIntegerGrade058Group001.size = 512 := by
  simp only [firstCenterIntegerGrade058Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade058Group001 = 142195597511044148887660285022254744460064178446060302606938961440684224527892519891542660690029287997189398724608 := by
  simp only [firstCenterIntegerGrade058Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade058Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade058Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade058Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
