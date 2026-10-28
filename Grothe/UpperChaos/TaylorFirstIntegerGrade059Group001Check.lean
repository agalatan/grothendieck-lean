import Grothe.UpperChaos.TaylorFirstIntegerGrade059Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade059Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade059Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade059Part00512 = 33361526947117280700496052487554628548952029728857983016704454165239588180364481595901532336505033281919508283392 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade059Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade059Part00576 = 21498436232464287007647698456794938501220922713164203272416279605997286358172285763165699480685612763468552732672 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade059Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade059Part00640 = 14682254063752856893290010703050215762206844498127268268591858499397581675297823346638030828503685656080277307392 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade059Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade059Part00704 = 11594259121365605186635121320673985101006971271274051184315645729688422067374555511006653125674165863178999693312 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade059Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade059Part00768 = 10568112890246470303128848724899198087086759191433392423885200852604906468489939118358355310804952032211164463104 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade059Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade059Part00832 = 10248744350439842867747984212394306039543324995482641536213066646438098362606547642534663180780114523288806359040 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade059Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade059Part00896 = 9829049373542315395882556139512743705055435291304540296203491913635296802335779081670084253216964136463996289024 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade059Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade059Part00960 = 9031139100140136046463559853832124118447622912385064038087685384191298916624133415209515297080872956811775311872 := by decide +kernel

theorem group_length : firstCenterIntegerGrade059Group001.size = 512 := by
  simp only [firstCenterIntegerGrade059Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade059Group001 = 120813522079068794401291831898712139863519910602029144036417682797192478831265545474484533813251401213423080439808 := by
  simp only [firstCenterIntegerGrade059Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade059Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade059Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade059Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
