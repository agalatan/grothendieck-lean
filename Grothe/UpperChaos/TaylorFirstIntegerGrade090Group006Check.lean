import Grothe.UpperChaos.TaylorFirstIntegerGrade090Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade090Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade090Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade090Part03072 = 17514288997758985500689047738156073878633797217028077061706924853313591005039586475039237023341537905470341120 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade090Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade090Part03136 = 5790807950636154333244659255896897791724405074967909129443635424338700145800448581907791577194691953688576 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade090Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade090Part03200 = 14547138781949116881193508036867222462692676671849892917813712996564965014580631287972092058769846417619943424 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade090Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade090Part03264 = 12115431473432619992010204584443208283060464386437189124107670144340838362277746395945013767925137292975407104 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade090Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade090Part03328 = 5328603779740811361453166570480347689374978115020305995647585698191597969391840811241405393403514768588800 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade090Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade090Part03392 = 10072183490056083092307373982475495526175640753229312300203747099706161546625746846391013131442206143196168192 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade090Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade090Part03456 = 8309436209288238308688994405846581587613480700795869850606773417324322107120540742944838699638369261616889856 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade090Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade090Part03520 = 65038825967809860425153885608716941731411334212179403829711144107462179945171499537433880755930742585819136 := by decide +kernel

theorem group_length : firstCenterIntegerGrade090Group006.size = 512 := by
  simp only [firstCenterIntegerGrade090Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade090Group006 = 62634637190183230601008980459223675925388570446742508873393630876479870513704615537222777758843625970186846208 := by
  simp only [firstCenterIntegerGrade090Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade090Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
