import Grothe.UpperChaos.TaylorFirstIntegerGrade074Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade074Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade074Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade074Part03072 = 5195370440705203047715441674832363043857062430424910951449369386990505175578767779526744887737168702524620800 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade074Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade074Part03136 = 3620304512079989567635978897422403881583195689360138936022989317360844263929193551229980205454037477404704768 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade074Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade074Part03200 = 57437363493890957861596747172350167013085464037204496982548639837765121036349351418588617905067609173262336 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade074Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade074Part03264 = 2435286780838203036726470602235886855930905546438461924902269716892996026639594896760536802458992378879410176 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade074Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade074Part03328 = 1659806411586495839414390414690271426262009754116826575941611352052379942776468716134142764821865626469400576 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade074Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade074Part03392 = 1068364509910825087117049506783517466070430313507612075381259045599939707674392554185313447793687021674823680 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade074Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade074Part03456 = 689881449990265401551657121872810128976752840923761406507306936089199466263202159353551985381250860205473792 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade074Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade074Part03520 = 480919824522805315371563290062847743806041163944820064282798669264306271338293443574583981896557714969985024 := by decide +kernel

theorem group_length : firstCenterIntegerGrade074Group006.size = 512 := by
  simp only [firstCenterIntegerGrade074Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade074Group006 = 15207371293127678253394148255072450713499483202753736431470153064087935975236262452183442693448627391301681152 := by
  simp only [firstCenterIntegerGrade074Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade074Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade074Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade074Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
