import Grothe.UpperChaos.TaylorFirstIntegerGrade054Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade054Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade054Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade054Part02048 = 44262535241512563482680772425011822474972968879161085256067294764805207717496700440274110992354034590714691584 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade054Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade054Part02112 = 37435713727893062604558836702902647232291476192269172346457499133251336623992249925406956402118028724573044736 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade054Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade054Part02176 = 48180857678209536710191734636548618480599743552588969628888582564329410675989158392144180636839718162630967296 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade054Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade054Part02240 = 16230046201525304230443157048770132058977065055879353180344887963484424392728173024370806287647790704678141952 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade054Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade054Part02304 = 7292840695256499634891936964064950678438527813035038266123887127100849916654817947703016880323599831656300544 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade054Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade054Part02368 = 5075768456160118211177543868892929888999383970777662905569842303168141364476254894759272378296405246267621376 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade054Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade054Part02432 = 4288567609041770472742020353682957789663739803019210874663989377406930728454051613619387762760055888063496192 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade054Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade054Part02496 = 5073894776301960134700246335300538896420333959716838992064069301813644042128196236168414964648155984726851584 := by decide +kernel

theorem group_length : firstCenterIntegerGrade054Group004.size = 512 := by
  simp only [firstCenterIntegerGrade054Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade054Group004 = 167840224385900815481386248335174597500363239226447331450180052535359945461919602474446146304987789133311115264 := by
  simp only [firstCenterIntegerGrade054Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade054Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade054Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade054Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
