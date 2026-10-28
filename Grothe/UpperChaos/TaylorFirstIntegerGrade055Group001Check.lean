import Grothe.UpperChaos.TaylorFirstIntegerGrade055Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade055Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade055Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade055Part00512 = 49485132777362648276340775445121073142920485823573685787439606306748050919073725972126438993999654761444635836416 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade055Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade055Part00576 = 25195011861057669989515707400885415869265440026413765110386558566215542101317693337858006328032835725122768732160 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade055Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade055Part00640 = 20195305751994447622144247613094517438206500982354561323631830672299106843410857418030991151733100469831199621120 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade055Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade055Part00704 = 18064643423206553228206662585396031523789843992466805870657964965588672052847659949726714044979470922386549768192 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade055Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade055Part00768 = 15969163238381242964678070663503796593668775589122969979862364892643951114763736428996040593853101273678618820608 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade055Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade055Part00832 = 13459638287343653263316073888833699897490674810053512576164925668293843763446207535350951809630853703217006510080 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade055Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade055Part00896 = 10732513910804538926756592401907254460004212525302873182204219743352608646716424917767341164606228655045141856256 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade055Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade055Part00960 = 9562840213354448021683196448754634747251297231305277760043593585490900037879768861647320423513819859408849469440 := by decide +kernel

theorem group_length : firstCenterIntegerGrade055Group001.size = 512 := by
  simp only [firstCenterIntegerGrade055Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade055Group001 = 162664249463505202292641326447496423672597230980593451590391064400632675479456074421503804510349065370134770614272 := by
  simp only [firstCenterIntegerGrade055Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade055Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade055Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade055Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
