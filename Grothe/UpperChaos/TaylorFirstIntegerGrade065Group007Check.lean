import Grothe.UpperChaos.TaylorFirstIntegerGrade065Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade065Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade065Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade065Part03584 = 295771474576480643965537394529960101944208961048608155593565881504756322817283128920611170253828869893128192 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade065Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade065Part03648 = 196567955934075171851313837701218482130444932739104047849801991972733635426386324607576333361593689571328000 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade065Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade065Part03712 = 163453641447277496414411042453405908666006993627409425322165823688843943685974144015032346814735726030094336 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade065Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade065Part03776 = 104091264038481095123228319613688921045786725488780773350441169414309780472025422209024226568927870260871168 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade065Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade065Part03840 = 53234557624036329780484871066399061096896611630873359842642397532732668698647318012853557955246865388666880 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade065Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade065Part03904 = 57783761318830587237144882726104007564930871459672119199941046840408822733697717227005050960149586227757056 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade065Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade065Part03968 = 49896810722625162922635051109944900065444927170496274142801345031885139043663664612924286326247653115953152 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade065Part04032.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade065Part04032 = 40338630079170463572495819756514914941128798941806961097455751615287281402102285647882257594125996854870016 := by decide +kernel

theorem group_length : firstCenterIntegerGrade065Group007.size = 512 := by
  simp only [firstCenterIntegerGrade065Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade065Group007 = 961138095740976950867251218957236297454848822106751116398815407600957594279780005252909229834856257342668800 := by
  simp only [firstCenterIntegerGrade065Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade065Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade065Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade065Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
