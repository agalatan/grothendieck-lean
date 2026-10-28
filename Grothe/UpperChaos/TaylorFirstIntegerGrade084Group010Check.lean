import Grothe.UpperChaos.TaylorFirstIntegerGrade084Group010Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade084Group010Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade084Part05120.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade084Part05120 = 34686713538625385867953294056701734378818752191812571061757230524854527166657758269383689740333954103246848 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade084Part05184.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade084Part05184 = 20710796891977455212334243965800505959114216228122593407289938991668740371157787168773913371203065509576704 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade084Part05248.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade084Part05248 = 8664227047885576977720763374249020972167753730071240025528725012344800594841243299910062934222064469409792 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade084Part05312.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade084Part05312 = 23043744004163616082756591243450177743692774392752522587335992829891850685195418433493645193562548042989568 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade084Part05376.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade084Part05376 = 19069268314627614362472716021374314859055668425958810593664924616784325988031795696088733648974769289166848 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade084Part05440.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade084Part05440 = 8501459396002334991398130783085127380593236111672635851953917704570171793436813069916176329591135250939904 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade084Part05504.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade084Part05504 = 8425959539384170734771131386487477981875666303092603001423580513833688542547121766365122698602473936912384 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade084Part05568.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade084Part05568 = 15040692147249872607537880784412666962498188869084873697863756317932251638643099071353628571283157501870080 := by decide +kernel

theorem group_length : firstCenterIntegerGrade084Group010.size = 512 := by
  simp only [firstCenterIntegerGrade084Group010, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade084Group010 = 138142860879916026836944751615561026237816256252567850226818066511880356780511036775284972487773168104112128 := by
  simp only [firstCenterIntegerGrade084Group010, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade084Group010Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group010Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group010Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
