import Grothe.UpperChaos.TaylorFirstIntegerGrade047Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade047Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade047Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade047Part00512 = 72164126864925707391794805400409935679025970405640918905036163764156800285598424183872022810730079671559330463744 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade047Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade047Part00576 = 74902942161468042342886948027743611843635721291835321146428748265282783844531506253880169951992746077013674033152 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade047Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade047Part00640 = 22323668973242356273575785513779492777469829442147131332746324607432167973546850667316242148615632952606804934656 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade047Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade047Part00704 = 17308873722769830961339732486920529099420972183317287985752433012455257746069658264528407948480793782980492394496 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade047Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade047Part00768 = 20353832063906634742696914553317682223164571270645937354747017188172330401466264564505170654674438680447648006144 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade047Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade047Part00832 = 13704974136131846473942628325364859152896179135551707057796793349402365513175238269820614449814951379707958919168 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade047Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade047Part00896 = 6497588561408109257309223570637355414863074000579115507410769221476574174090282835284848629793414406933439315968 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade047Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade047Part00960 = 5020667890299159114173610336710637995381834175494946885873200456793008360756874765712239303846144587387604303872 := by decide +kernel

theorem group_length : firstCenterIntegerGrade047Group001.size = 512 := by
  simp only [firstCenterIntegerGrade047Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade047Group001 = 232276674374151686557719648214884104185858151905212366175791449865171288299235099804919715897948201538636952371200 := by
  simp only [firstCenterIntegerGrade047Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade047Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade047Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade047Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
