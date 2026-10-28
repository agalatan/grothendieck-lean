import Grothe.UpperChaos.TaylorFirstIntegerGrade068Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade068Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade068Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade068Part02560 = 24634823634096603787299557612111756051216666979137275421639800134666875921064115904388777070070856143559720960 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade068Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade068Part02624 = 17721381266945830662611822948377527795601549687406604156939562673271284531306897796280544828120639780736204800 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade068Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade068Part02688 = 12566415960470420794770962705395882540379770582664093389743335736522501958171307467621548276347746096412360704 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade068Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade068Part02752 = 8768512201641213361344610566166687538038490560442787304446426193295650607708801836844459983366804240517300224 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade068Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade068Part02816 = 6024765174093827792859452514400729672093588081282848391421475746057702705623153328538669884603204961090666496 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade068Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade068Part02880 = 3848022272007674195514591330077447029511143563688279704385306331687221498103897309333258855459148921260998656 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade068Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade068Part02944 = 998896804842311567434691632528050058952851917127368605141377640364894906406144635642096731132496151821942784 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade068Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade068Part03008 = 2042957399829330286098618769442254259675565874292058670511084642507116175707850562135327472732252377154846720 := by decide +kernel

theorem group_length : firstCenterIntegerGrade068Group005.size = 512 := by
  simp only [firstCenterIntegerGrade068Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade068Group005 = 76605774713927212447934308078500334945469627246041315644228369098373248304092168840784683101833148672554041344 := by
  simp only [firstCenterIntegerGrade068Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade068Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade068Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade068Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
