import Grothe.UpperChaos.TaylorFirstIntegerGrade079Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade079Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade079Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade079Part01536 = 474112570708185848616159688487762789413729542673885065195175884736984532115501263579057840874395250587590459392 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade079Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade079Part01600 = 437830304413246137621602913167835928994333352397760434444632458117530376918871705764326019872515540655519301632 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade079Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade079Part01664 = 375160233424570100509990909645767297705571046612438785936519795289137767744896318202796485859725950780067282944 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade079Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade079Part01728 = 315637847575243644786445967690231561893408240015757197470673854448494195511665001620783178870752980999535067136 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade079Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade079Part01792 = 1214362188310215139801975766442941020367138324438536617963824083760639466018117738450670223282544764868624384 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade079Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade079Part01856 = 261150607078958376682270747307609598465017101249497919607589731232941723494225054289140318687850192752508665856 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade079Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade079Part01920 = 216290124603347169861370853293388359770101274409187177920472994623398510936860143446816557055799546587199307776 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade079Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade079Part01984 = 177656769892719647392675011064636046469418130616839978137367663797837659444621090691980970103750642133362540544 := by decide +kernel

theorem group_length : firstCenterIntegerGrade079Group003.size = 512 := by
  simp only [firstCenterIntegerGrade079Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade079Group003 = 2259052819884581140610318066423674523731945826299805095330396206330085405632658695333352041548072649260651249664 := by
  simp only [firstCenterIntegerGrade079Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade079Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade079Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade079Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
