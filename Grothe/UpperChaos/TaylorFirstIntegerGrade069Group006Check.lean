import Grothe.UpperChaos.TaylorFirstIntegerGrade069Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade069Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade069Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade069Part03072 = 1818311947387405507412080371118767467252212865582052565246251218443763665205602290928893918655940295636549632 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade069Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade069Part03136 = 1197149724579967086794661339726164054297425252182223117194240654950798904014072080816554710761639548419047424 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade069Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade069Part03200 = 230378367911731403375653180074594375525969041281697139133729825249263400959395484726378408251551830211821568 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade069Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade069Part03264 = 565630281655827742948109830313828540580411927029198883607592616219687577528104431994118593933084140056346624 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade069Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade069Part03328 = 539171545718561318173026741288680385785255008651549082915850763172067845309361457074168357918987746491236352 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade069Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade069Part03392 = 482295431405562905086395398706292524309353374850051020177369939060899624714779674381771848940733077148139520 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade069Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade069Part03456 = 486778377219518324811246994514630627796365680137554430378637120318152818917315989219885778755368022637019136 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade069Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade069Part03520 = 458252482444816403944377476931971806663591963063948062112551738777255813263025412681642378903134339730505728 := by decide +kernel

theorem group_length : firstCenterIntegerGrade069Group006.size = 512 := by
  simp only [firstCenterIntegerGrade069Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade069Group006 = 5777968158323390692545551332674929782210585112778274300766223876191889649911656821823413996120439000330665984 := by
  simp only [firstCenterIntegerGrade069Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade069Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade069Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade069Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
