import Grothe.UpperChaos.TaylorFirstIntegerGrade045Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade045Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade045Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade045Part00512 = 98237804981366932828910072497102276324923953513750329030665106863874528842759608831095616460518834927297221361664 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade045Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade045Part00576 = 39997858103963262111397835416220711526871327317852987166094964325801604105071762886448558266153913555689530195968 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade045Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade045Part00640 = 51799608228392394509437021357483532590387816564382898296379630917976762367900390862659888192809722738739293192192 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade045Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade045Part00704 = 32459123659050873663020561313590130008741140883863466571252628648444442783304583241763577481405140018499206250496 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade045Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade045Part00768 = 15944850823939399332576487363073639349574298597777118907262284511899461803349870214602040376630775372073150709760 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade045Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade045Part00832 = 18119376888734200743618158762701460766513450532475653168625946365016147083694532191706882226006846884543153045504 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade045Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade045Part00896 = 4787861919946289831797464578287142241580155514758715163966648593222924885512677789921208154895132574469840699392 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade045Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade045Part00960 = 2856821914908427379273747718403031754026715830175443954869993583919908074395615180456190688861816137493713518592 := by decide +kernel

theorem group_length : firstCenterIntegerGrade045Group001.size = 512 := by
  simp only [firstCenterIntegerGrade045Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade045Group001 = 264203306520301780400031349006861924562618858755036612259117203810155779945989041198653961847282182208805108973568 := by
  simp only [firstCenterIntegerGrade045Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade045Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade045Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade045Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
