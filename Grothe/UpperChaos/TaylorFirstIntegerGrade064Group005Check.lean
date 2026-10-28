import Grothe.UpperChaos.TaylorFirstIntegerGrade064Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade064Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade064Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade064Part02560 = 14734181375678155624595661437928018092761342035656779653377921390311750049895769565609690543565206381576323072 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade064Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade064Part02624 = 10109179479218348116849614541780867770987819066597912374168137655659875280683002588422708310607743064268079104 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade064Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade064Part02688 = 6865743328842626612063583617058449469767075658975475777790318600683300680250204352120491578948612232224702464 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade064Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade064Part02752 = 4649013959632813956250577567932717704029250903790101830028659202768790347952982752634080785309418422269902848 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade064Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade064Part02816 = 3282188223546662518126736285059649318260844914743316437030129703580542561530866460290800324531483539895484416 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade064Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade064Part02880 = 2529906405991711084265109064483506839114015621562924687697025406739582667960304558225264356093215657133342720 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade064Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade064Part02944 = 2074424021843894398471867029137883518023317874338773246973904069756981800739642069213250779672962835909967872 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade064Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade064Part03008 = 1701333048031422689476211877377036593265482875392025545794315862986101827345452502595779809702968534868426752 := by decide +kernel

theorem group_length : firstCenterIntegerGrade064Group005.size = 512 := by
  simp only [firstCenterIntegerGrade064Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade064Group005 = 45945969842785635000099361420758129306209148951057309552860411892486925216358224849112066488431610668146229248 := by
  simp only [firstCenterIntegerGrade064Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade064Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade064Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade064Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
