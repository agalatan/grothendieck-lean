import Grothe.UpperChaos.TaylorFirstIntegerGrade079Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade079Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade079Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade079Part02560 = 42702424890309573312037496279416255396232621854175731699921935964397625841292720035767755464970823944810528768 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade079Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade079Part02624 = 34755686305581295469082269748536097427997878841065717991529419300918229514539514731093105499572736053374615552 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade079Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade079Part02688 = 2826396590002474201310608085463414005280509795988805185528036862331782207460858079304384431936594507240308736 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade079Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade079Part02752 = 25519986833094149141175899529388893044522393528551038738731408621655867838313020740598709213747123616196067328 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade079Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade079Part02816 = 23069328693023214552489202215780355917807785335355456483202485569920861496657540750581078117971697333451096064 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade079Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade079Part02880 = 18600461630778624480797387440256879198672779740726648428867906055477319283567553165202625669858651864228167680 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade079Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade079Part02944 = 14730738168695383212179818908330975496910222267774885669735088452474739110436156727340146663316277993700065280 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade079Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade079Part03008 = 21330140424562024070681493055838051962952911531093733886879200168724544063482567367175289197743707493761024 := by decide +kernel

theorem group_length : firstCenterIntegerGrade079Group005.size = 512 := by
  simp only [firstCenterIntegerGrade079Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade079Group005 = 162226353251909276393143363700228708539387144275169377931403160027345149836330846797254980350571649020494610432 := by
  simp only [firstCenterIntegerGrade079Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade079Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade079Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade079Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
