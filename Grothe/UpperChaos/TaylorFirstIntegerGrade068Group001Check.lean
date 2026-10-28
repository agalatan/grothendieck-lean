import Grothe.UpperChaos.TaylorFirstIntegerGrade068Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade068Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade068Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade068Part00512 = 14160690596601749365002085954254102036871067873943825317648511469255174497869554617933976303372647824308270268416 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade068Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade068Part00576 = 10135072261362808003812799894008074398885265048620120855006924055966310346505900916795583195096505898174232133632 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade068Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade068Part00640 = 6029976719902468441559595860845891210401511929387927523141951707717106878458498666878829033280970108019817840640 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade068Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade068Part00704 = 3302416405383710583683181771403323130713130283399199035745610995090291699332941160442359822204376167866313998336 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade068Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade068Part00768 = 3611600533085782129348331117201128338863936606098352569452777314489265612846789626023305001264991859394985590784 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade068Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade068Part00832 = 2407150226887883314705465977294737558564272023154021469369877643379831788476382407456606780316820891270796804096 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade068Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade068Part00896 = 2697642198775303613045993774472431324528679304911970795039773936086201855862245641767999354464977715959387127808 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade068Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade068Part00960 = 2417135195179994220280233559496077934680015103227560293164904333060142311913622498746136152277130948371409797120 := by decide +kernel

theorem group_length : firstCenterIntegerGrade068Group001.size = 512 := by
  simp only [firstCenterIntegerGrade068Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade068Group001 = 44761684137179699671437687908975765933507878172742977858570331455044324991265935536044795642278421413365213560832 := by
  simp only [firstCenterIntegerGrade068Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade068Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade068Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade068Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
