import Grothe.UpperChaos.TaylorFirstIntegerGrade074Group008Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade074Group008Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade074Part04096.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade074Part04096 = 153543237678256185276696749102061694983007869538285131418167059408177239184472767083947762136811393981087744 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade074Part04160.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade074Part04160 = 133340455042817024673327637984700874996067124841552351106284996045367831148642131566258299624193334985097216 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade074Part04224.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade074Part04224 = 106486073210635158683166378463368466513726581579030074770455179906197943567391470690042410884061378373484544 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade074Part04288.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade074Part04288 = 82038549685138371266076616271864373278728620081303097792663454351376435112791260153520732340656347111489536 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade074Part04352.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade074Part04352 = 57972867954269025817896055067524535019976183703851785348422924622311678380187146672686489403223087526182912 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade074Part04416.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade074Part04416 = 18463800878760939205540525059966098105222596350527869909717841119706820403256889440347821313588924082290688 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade074Part04480.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade074Part04480 = 36173823045431446540612699231582250221190504210684001591533748911499352443550875532875286155907347295240192 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade074Part04544.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade074Part04544 = 36682008841010441209243770430293235222710231218790165068334130887524387645761300743728707188545762417967104 := by decide +kernel

theorem group_length : firstCenterIntegerGrade074Group008.size = 512 := by
  simp only [firstCenterIntegerGrade074Group008, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade074Group008 = 624700816336318592672560431611361528340629711524024477005579335252161687886053841883407509046987575772839936 := by
  simp only [firstCenterIntegerGrade074Group008, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade074Group008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade074Group008Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade074Group008Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
