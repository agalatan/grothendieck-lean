import Grothe.UpperChaos.TaylorSecondIntegerGrade044Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade044Group002Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade044Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade044Part01024 = 3550073275579900467820991747904918654261408762504289972335077697314477198969239888840251794465987737124077568 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade044Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade044Part01088 = 4107678923008956401890953273605539869855270993411135567616413288883201628878331335458480312748069538676867072 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade044Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade044Part01152 = 2182336089939850379285593697416234933551969886553700064553653388172643437319395393906779573976758383808610304 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade044Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade044Part01216 = 1705604449846616232778045462017757496915157600261154568921472970806980549454602513520852892809397622364176384 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade044Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade044Part01280 = 1388677274261617208033313513495196235037275399501097854027949159176696946575731955602671729143563546718633984 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade044Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade044Part01344 = 1005068378337692082345863341354104024697521140071570232105900028716275829013429942717445201445894797586857984 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade044Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade044Part01408 = 1281680048475646190569988785374171941186154007380431013628999981622785950467637432933209995378321468967354368 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade044Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade044Part01472 = 659090142061488728103799867839108117287826122851868994805917726784176933411493366343338615467032094988828672 := by decide +kernel

theorem group_length : secondCenterIntegerGrade044Group002.size = 512 := by
  simp only [secondCenterIntegerGrade044Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade044Group002 = 15880208581511767690828549689007031272792583912535248267995384241477238474089861829323030115435025190235406336 := by
  simp only [secondCenterIntegerGrade044Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade044Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade044Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade044Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
