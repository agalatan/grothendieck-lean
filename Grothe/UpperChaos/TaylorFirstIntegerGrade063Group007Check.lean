import Grothe.UpperChaos.TaylorFirstIntegerGrade063Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade063Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade063Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade063Part03584 = 113430416507520445945024763475444873660124993250198839272220408175136039483912379992450534198187667365036032 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade063Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade063Part03648 = 104463557930896290448627877261633816207471569127773415659813474104870296603427921258752841755879263608766464 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade063Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade063Part03712 = 86625421532937518201359711285466678652136013705706873829747528755967198510361651873964681559185917692870656 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade063Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade063Part03776 = 65336917757361686686236715347796458586549265045291175056738963874548439132293697419240609363509164155863040 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade063Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade063Part03840 = 98348895097600158528350091747541950931337943283559340646062052273089852627613185022857061851374058796482560 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade063Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade063Part03904 = 83979871263597246685277295334387257269696892397711900835684006359781896184134489642885439344530108480225280 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade063Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade063Part03968 = 52239437933716560690864242402335455220587884712219237595971279892455761864562287445896823456693683237158912 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade063Part04032.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade063Part04032 = 29652054760568795767488267134590952703503662900301751290739522756839827529068814606806807638911297358135296 := by decide +kernel

theorem group_length : firstCenterIntegerGrade063Group007.size = 512 := by
  simp only [firstCenterIntegerGrade063Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade063Group007 = 634076572784198702953228963989197443231408224422762534186977236192689311935374427262854799168271160694538240 := by
  simp only [firstCenterIntegerGrade063Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade063Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade063Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade063Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
