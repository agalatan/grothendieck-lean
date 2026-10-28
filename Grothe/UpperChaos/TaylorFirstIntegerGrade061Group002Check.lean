import Grothe.UpperChaos.TaylorFirstIntegerGrade061Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade061Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade061Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade061Part01024 = 6271237086551452944657853666939622811584833078507051900998205913465486903157195793454548052360333047488256671744 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade061Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade061Part01088 = 5439930671349191140077689202095943116040301237360684477035152926264404871037311982422151460771203480341725577216 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade061Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade061Part01152 = 4542379266103364262096521508129086833931963051894842900991065949067957157118260690155177693960172499163842347008 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade061Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade061Part01216 = 3669759065467256874672639613801416274107865111596808026745204705589594690632781375561277745640379018474122379264 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade061Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade061Part01280 = 2884334868925291367279788964276883345416823306404951208903195165698215028438304703015029624187985571932863987712 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade061Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade061Part01344 = 2219738204876552453711534163579083838270904970322297972633244009764264994756719143530833624501446913654442164224 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade061Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade061Part01408 = 1684596997927705499668836883878937442501061342875370271245613135787873704036813404177786958172991322366683381760 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade061Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade061Part01472 = 1269142868752104140450247719590219198370152429146447849024900675282054989977013042087446453855522834989644251136 := by decide +kernel

theorem group_length : firstCenterIntegerGrade061Group002.size = 512 := by
  simp only [firstCenterIntegerGrade061Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade061Group002 = 27981119029952918682615111722291192860223904528108454607576582480919852339154400134404251613450034688411580760064 := by
  simp only [firstCenterIntegerGrade061Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade061Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade061Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade061Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
