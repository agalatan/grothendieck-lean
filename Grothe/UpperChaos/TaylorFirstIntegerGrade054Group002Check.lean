import Grothe.UpperChaos.TaylorFirstIntegerGrade054Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade054Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade054Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade054Part01024 = 3111029932765295183059936577559515229776887710675312379340450850856706999933363717140245699879343810758389530624 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade054Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade054Part01088 = 1965602795038358957274383294407407919443372569908017332991687728048846498430080591541439511030978881990384680960 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade054Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade054Part01152 = 1229336512390128934691830937585256548270384713809566808888330079684740165738608795357754964370705164726999973888 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade054Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade054Part01216 = 791428048578219384189251613970553594029061855860849135267518844854636445280331635323395388279508100628040646656 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade054Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade054Part01280 = 604097112806545058139721261184639307992714121371998693086069290911347019799652814653253774754082812649539633152 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade054Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade054Part01344 = 751864561461246584477896363649609926927109805112936085063628405004245802030538077010611284097343585877573500928 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade054Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade054Part01408 = 366867992590804615308235262054392426305572558352204373843993888216802607243452803905960464929808910564500439040 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade054Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade054Part01472 = 360091954634809015584961071690656570821544682620926660475144792508251053206584001751896732968223284887788978176 := by decide +kernel

theorem group_length : firstCenterIntegerGrade054Group002.size = 512 := by
  simp only [firstCenterIntegerGrade054Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade054Group002 = 9180318910265407732726216382102031523566648017711811468956823880085576591662612436684557820309994552083217383424 := by
  simp only [firstCenterIntegerGrade054Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade054Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade054Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade054Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
