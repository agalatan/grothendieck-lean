import Grothe.UpperChaos.TaylorSecondIntegerGrade045Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade045Group003Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade045Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade045Part01536 = 862717012146789561359761165360826112414452783176632935778868001645045813712993776767741977317378746816135168 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade045Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade045Part01600 = 435021864776847225363127796802585867297180220475555584787199091140237609698648934464153735408084015967633408 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade045Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade045Part01664 = 373848716691246246583531435343025334090673021818619828834279693156874029370566277408907106254825854880186368 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade045Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade045Part01728 = 428729890585353663642095202138988135078537064770209347867342213757766116752884208135808392376979723300896768 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade045Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade045Part01792 = 157056821507911362432368979066245164228536198374495377114286118896491966095600915023236712288691374442676224 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade045Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade045Part01856 = 285451865104630382125877593613028781628887792314800929767473272723171504161617597504442305079451358521720832 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade045Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade045Part01920 = 162424467152710038801892139131403124347807054270079829576548521128439208912459713467053676172961302070689792 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade045Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade045Part01984 = 128229795515130564174293203197702667424923923464733472281442381469155710743663099735798349209570112228556800 := by decide +kernel

theorem group_length : secondCenterIntegerGrade045Group003.size = 512 := by
  simp only [secondCenterIntegerGrade045Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade045Group003 = 2833480433480619044482947514653805186510998058665127306007439293917181959448434522507142254107942488228495360 := by
  simp only [secondCenterIntegerGrade045Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade045Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade045Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade045Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
