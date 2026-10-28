import Grothe.UpperChaos.TaylorFirstIntegerGrade049Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade049Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade049Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade049Part00512 = 71479254403561280421414377103410066932963261805104679236128390594465961406619628538276648078278039980382697291776 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade049Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade049Part00576 = 41654276332714334221267900955926850948526922992609443768658147234419967698114344729701618219816317361965928284160 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade049Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade049Part00640 = 26258228416387805287309989138690772209063356630895052423217310215765398980295683526624908227825222067105487126528 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade049Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade049Part00704 = 25246069218546401570701972639478758644084602437461784951829088099674922896149795474089817075070309501820307767296 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade049Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade049Part00768 = 6673264811724330713184409447101293362788881072900725995535156537303603809155822475569987066769916316320282968064 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade049Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade049Part00832 = 4680202492797391137959922282880854965208902413353005085736331861688649455295745318040547688124105849897878552576 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade049Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade049Part00896 = 3643346271527620196343603582096057163616532586660169949466038548621845140604411139149563880678028942421159575552 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade049Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade049Part00960 = 5220793792253779918134880370609354414703600081955703414951684131912330838306926463643553544386942573261965230080 := by decide +kernel

theorem group_length : firstCenterIntegerGrade049Group001.size = 512 := by
  simp only [firstCenterIntegerGrade049Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade049Group001 = 184855435739512943466317055520194008640956060020940564825522147223852680224542357665096643780948882593175706796032 := by
  simp only [firstCenterIntegerGrade049Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade049Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade049Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade049Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
