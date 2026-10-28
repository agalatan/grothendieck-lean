import Grothe.UpperChaos.TaylorFirstIntegerGrade083Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade083Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade083Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade083Part00000 = 2948131708816705755563672994562932243678836080519893483184042216367612630305543323766687706525832132509380378624 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade083Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade083Part00064 = 2821540030505345327304760946837000899005078651736973289468384642495925598753995794970168898019516659012504387584 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade083Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade083Part00128 = 2870804245868148473002125786332599349154018466167453794586617335367010262556675250107987967071908790132279345152 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade083Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade083Part00192 = 790830666673653411427525629984251424535654917866737738696659357042042605748162630067462486199148827546593787904 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade083Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade083Part00256 = 2266994047193671189677184816755398716007598559586216544784983988532284266825761842371367516699903586295118561280 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade083Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade083Part00320 = 3142289865860683903635050380875657768516311664332940925836141942336556311395315177735832779022514000613072699392 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade083Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade083Part00384 = 3080058272182346738756431641891991939298833834407336617106415693284204130900264382284400636882902447789810122752 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade083Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade083Part00448 = 2326808614954256779321060945605561361038972198942119622155962305526427660723493962693146553351627256141818363904 := by decide +kernel

theorem group_length : firstCenterIntegerGrade083Group000.size = 512 := by
  simp only [firstCenterIntegerGrade083Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade083Group000 = 20247457452054811578687813142845393701235304373559672015819207480952063467209212363997054543773353700040577646592 := by
  simp only [firstCenterIntegerGrade083Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade083Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade083Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade083Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
