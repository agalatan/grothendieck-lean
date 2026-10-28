import Grothe.UpperChaos.TaylorFirstIntegerGrade053Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade053Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade053Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade053Part01024 = 2082875114426087135671667662063854506172539875098044057654881947620041164311305331260000596749489738553260769280 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade053Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade053Part01088 = 1284993054684720119300877695857315202876205750932535726784436919232814349388381953323671576710100267956636221440 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade053Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade053Part01152 = 1112512801829170148358776815266892645395257005972860981790339382438260391813547174968584260043826023034299351040 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade053Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade053Part01216 = 374963809846193692352118149297496431210986356192056245310201225617222411983474335556859713211940236592989339648 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade053Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade053Part01280 = 347885419986650049195554991335419456755185084275618695940180427272531768994029888049994341631228653859690774528 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade053Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade053Part01344 = 358636193314798230431503672752265353294329068145754016761869648588508849036069441906014036071478024582180372480 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade053Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade053Part01408 = 378696382994814411934118863715367685699806608513080178883918050420286252543270438587412402804064638854592724992 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade053Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade053Part01472 = 455652024186556721588907571821568755565270914060375389651961994315926418577788507664509781857218257133351469056 := by decide +kernel

theorem group_length : firstCenterIntegerGrade053Group002.size = 512 := by
  simp only [firstCenterIntegerGrade053Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade053Group002 = 6396214801268990508833525422110180036969580663190325292777789595505591606647867071317046709079345840567001022464 := by
  simp only [firstCenterIntegerGrade053Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade053Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade053Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade053Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
