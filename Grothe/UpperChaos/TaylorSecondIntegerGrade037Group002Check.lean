import Grothe.UpperChaos.TaylorSecondIntegerGrade037Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade037Group002Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade037Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade037Part01024 = 4643402806409445332170715019335327588390125098885525061920428364414646975884881779573557464250067451283243008 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade037Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade037Part01088 = 2897947509649947249333064268665408987870714394953817327587561043935530504077103626707384532637871661452886016 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade037Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade037Part01152 = 3473275390198415720355250352159403711506573824934009940759915430009681974887896315601538251238293094526877696 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade037Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade037Part01216 = 2084787975215610424478871529566055854403420151552139284693921039810773582216607005492957425620427396928765952 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade037Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade037Part01280 = 1311361770441349051607772830087286555837423742127362464941518661537094611784695629462358143063196276927496192 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade037Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade037Part01344 = 1480531230159072721203720417645007586882404795093901626466694252478487382077278199001762937404390954372169728 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade037Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade037Part01408 = 1316686952774981889115296818385935273854896402588261839129771082243356129495959761010435993541678426620952576 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade037Part01472.size = 10 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade037Part01472 = 161035323513709758963536264583265446815938916309005424429546412903175996067294266658396068796831189698609152 := by decide +kernel

theorem group_length : secondCenterIntegerGrade037Group002.size = 458 := by
  simp only [secondCenterIntegerGrade037Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade037Group002 = 17369028958362532147228227500427691005561497326444022969929356287332747156491716583508390816552756451811000320 := by
  simp only [secondCenterIntegerGrade037Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade037Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade037Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade037Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
