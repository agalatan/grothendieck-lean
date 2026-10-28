import Grothe.UpperChaos.TaylorFirstIntegerGrade082Group008Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade082Group008Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade082Part04096.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade082Part04096 = 270437755075152582526251976968122462045990190106625117554807372998037453895096678506486002515431635223052288 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade082Part04160.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade082Part04160 = 183946925806095077798483033602380324412545441340357334991930487292096685416811290995572107243323071202852864 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade082Part04224.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade082Part04224 = 103945006161630712172196246212692737941006003030455999644359623053901010566324529939800794461341082468745216 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade082Part04288.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade082Part04288 = 15599975839530519456557440289623267082045008515446247004752111746835858723371292899405125891718706123243520 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade082Part04352.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade082Part04352 = 78167435066059503222719363485748023926325082630320841967434777324193889731201946891517832112484276353630208 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade082Part04416.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade082Part04416 = 63933953519687898010065008056551038945437648788787376807204435184500683915505292639966481844824777332621312 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade082Part04480.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade082Part04480 = 64631501181615940898575584350356687229169393076701778084604065113407124174644417007688555379480716552175616 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade082Part04544.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade082Part04544 = 3478345188827615482256269187112363361231001727154748518012785215283754087043730144071281055503577369280512 := by decide +kernel

theorem group_length : firstCenterIntegerGrade082Group008.size = 512 := by
  simp only [firstCenterIntegerGrade082Group008, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade082Group008 = 784140897838599849567104922152586904943749769215849444573105657928256460509999179024508180504107842625601536 := by
  simp only [firstCenterIntegerGrade082Group008, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade082Group008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade082Group008Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade082Group008Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
