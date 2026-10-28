import Grothe.UpperChaos.TaylorFirstIntegerGrade038Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade038Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade038Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade038Part01024 = 413712825483247442605816967059821913360074788893949637716955353619007763297711124829690729934869030969997787136 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade038Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade038Part01088 = 212254359350707049732108044176939478336217189936679580311195476438393440296518643943698915802552608585135685632 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade038Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade038Part01152 = 256866214154578261397108198442012011942125926490746233445681273208113477741593351343753205916061138346731110400 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade038Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade038Part01216 = 128241516034257814184155290496335953405289082090044817405128776757890777526801899804495833789629935947050123264 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade038Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade038Part01280 = 74226093072402013790494163823342150835385418634418179849877038922928718355266726801977818979487649189452578816 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade038Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade038Part01344 = 52290633922832176981627802322503946256927681901790082469987851225608363664749940209956414990484744702118592512 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade038Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade038Part01408 = 29672331615236608463541815477034877510095337562218173483244488273401090526183919109598550746146591731932463104 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade038Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade038Part01472 = 28029218551735122601343464531640453464100502438834453778177191577708851411270105918581577442232565742987902976 := by decide +kernel

theorem group_length : firstCenterIntegerGrade038Group002.size = 512 := by
  simp only [firstCenterIntegerGrade038Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade038Group002 = 1195293192184996489756195746329630785110215927948681158460247450023052482820095711961753047601464265215406243840 := by
  simp only [firstCenterIntegerGrade038Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade038Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade038Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade038Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
