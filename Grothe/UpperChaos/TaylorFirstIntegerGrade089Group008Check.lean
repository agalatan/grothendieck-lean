import Grothe.UpperChaos.TaylorFirstIntegerGrade089Group008Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade089Group008Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade089Part04096.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade089Part04096 = 754197635536284969903749455854768725742591151566826974916025896658489836990980748629302301104270381764575232 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade089Part04160.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade089Part04160 = 914309390722951098686690024098238784513514259689916764410484191248902649367594892516807525895600812096225280 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade089Part04224.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade089Part04224 = 662162654463533312907716886282375249707687174247077656221747744918950643908935194149874100901829995367759872 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade089Part04288.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade089Part04288 = 1530404940958074647223128669281883057909025631754506554787655441930275214920562949844324849859030278995968 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade089Part04352.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade089Part04352 = 472243626467174311058297813945241700285988579017223832627536217650654572614887172450259108209451486926602240 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade089Part04416.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade089Part04416 = 325299622524506051444199436739758370445927733310951829965576129771052367066812086325679580428380162423259136 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade089Part04480.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade089Part04480 = 7557097892510478427289610846837453932260974327063018626967265647395728677429896488865052675579280051142656 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade089Part04544.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade089Part04544 = 205976888859478589677295410609460195138958732733324769448103581270818260627695505097257416814202147580149760 := by decide +kernel

theorem group_length : firstCenterIntegerGrade089Group008.size = 512 := by
  simp only [firstCenterIntegerGrade089Group008, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade089Group008 = 3343277321407396886752461767045962362824837630524139352771228682608194334469256058607889410879173296488710144 := by
  simp only [firstCenterIntegerGrade089Group008, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade089Group008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group008Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group008Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
