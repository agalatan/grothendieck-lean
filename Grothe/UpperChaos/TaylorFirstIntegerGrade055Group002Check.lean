import Grothe.UpperChaos.TaylorFirstIntegerGrade055Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade055Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade055Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade055Part01024 = 8418449219758902900406866049629416815209125498293361387325837130674321831342951582082088463500808353777308401664 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade055Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade055Part01088 = 2851703245595651971957331985033318465993213462842560831590127229603713834759556323197466978771712124948056113152 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade055Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade055Part01152 = 1831413004019360956649289286543759024423387288480548937801902802090261514598627951045568212111530557491791265792 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade055Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade055Part01216 = 1213046804538855119941866040987933936458650901618412319726479379514732577145252366770907131186762954196838776832 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade055Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade055Part01280 = 825002068860833916039277532271017484498891624195544341556418346747627663702562992656906450275012704958064623616 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade055Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade055Part01344 = 596016081066487761747275504733910483867508831716289215015256290708851393383711232802409209433614548531247316992 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade055Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade055Part01408 = 469012710835189306679582412471354868470483006620095490365918934874387954286726356191465668378485228063699238912 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade055Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade055Part01472 = 439847313156916410709058943986433448015756789474275482264631786862689671841585875004463868069025343057915019264 := by decide +kernel

theorem group_length : firstCenterIntegerGrade055Group002.size = 512 := by
  simp only [firstCenterIntegerGrade055Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade055Group002 = 16644490447832198344130547755657144526937017403241088005646571901076586441060974679751275981726951815024920756224 := by
  simp only [firstCenterIntegerGrade055Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade055Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade055Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade055Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
