import Grothe.UpperChaos.TaylorFirstIntegerGrade075Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade075Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade075Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade075Part03584 = 448191346824609819166686556968824079689377358556789197218651054190259358570823371340117316849929879195484160 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade075Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade075Part03648 = 327684522521852538093068306418131652019098224082432343803425050455683843190590005045399505516868061666213888 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade075Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade075Part03712 = 231956265596645996161818596126079456960834618159575487521275600328907278969384731249631224091342958114111488 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade075Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade075Part03776 = 35841460015165875672142964879553484212558855695462425999658267952411481298094689830767623604709824814645248 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade075Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade075Part03840 = 210640353199889181010059670124210652423746187155629211523908806603961671563807797236473734096066260527742976 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade075Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade075Part03904 = 166033865293713150789809530156672637202707962861869094207929612812592312163756163891135280760122824319827968 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade075Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade075Part03968 = 136513581222241811324986179782970450878519239954226348068013010187420210909914845326768541990637007471116288 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade075Part04032.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade075Part04032 = 128787945498819734951515526935222280418635169140975697934876118258460399079337082430525880979290597101666304 := by decide +kernel

theorem group_length : firstCenterIntegerGrade075Group007.size = 512 := by
  simp only [firstCenterIntegerGrade075Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade075Group007 = 1685649340172938107170087331391664693805477615606959806277737520789696555745708686350819107888967413210808320 := by
  simp only [firstCenterIntegerGrade075Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade075Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade075Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade075Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
