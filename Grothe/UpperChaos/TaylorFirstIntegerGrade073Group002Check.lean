import Grothe.UpperChaos.TaylorFirstIntegerGrade073Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade073Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade073Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade073Part01024 = 1347666589603797026314193901338347403040017308823768068328945505222730690705838812696051326534949525642505355264 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade073Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade073Part01088 = 1234788976147838619693548830799225758211565477592644819492553542679860525672763923399446697161758772397770539008 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade073Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade073Part01152 = 1170700130210425292071123679121753073195961228372034879887234563622071889346897466991629096863274598588257140736 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade073Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade073Part01216 = 1029584388345838123520013490927289538215411918448561023930802207373417197955457007342799660753892610982111346688 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade073Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade073Part01280 = 83520620477628445274765828462831330191596465969939083313716626405092866980108317794600207174505154687593873408 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade073Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade073Part01344 = 995952926962312996343995913076793183541431365232554120655345507927632880846569427248168965077287628192977256448 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade073Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade073Part01408 = 896875391200669205689814406153044782900579760517072606304633206659436918653873457928043252943978795876629872640 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade073Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade073Part01472 = 779204657531454642923236024105929939830481280584294511130167139378776236513582404302722966401573802605543424000 := by decide +kernel

theorem group_length : firstCenterIntegerGrade073Group002.size = 512 := by
  simp only [firstCenterIntegerGrade073Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade073Group002 = 7538293680479964351830692073985215009127044805540869113043398299269019206675090817703462172911220888973388808192 := by
  simp only [firstCenterIntegerGrade073Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade073Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade073Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade073Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
