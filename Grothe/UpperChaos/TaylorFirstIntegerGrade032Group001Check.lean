import Grothe.UpperChaos.TaylorFirstIntegerGrade032Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade032Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade032Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade032Part00512 = 7587375111688585030183836173405006890909608836090026409547912644804901762424829685979910178907566808811339513856 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade032Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade032Part00576 = 3686167301011662208688549176289533024944374062363367354371964046596638430636723289389722862678349112268596183040 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade032Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade032Part00640 = 1894272905406296972710604597606712647622584102295194652987493799370783789467062277327421845202148502191017558016 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade032Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade032Part00704 = 1270078335118102357235284733332213519718367276445953349901598397758287447706997953594297386841315586058252976128 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade032Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade032Part00768 = 922380098579951988066056476608016758675994905627777736254522249623967303958531061191293419205487035195150303232 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade032Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade032Part00832 = 522031121317678355623795011429501188846000041229631346901944861803547719782991442790210707516610777619458162688 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade032Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade032Part00896 = 382607554535350550962269735846834532233923041329622592222301646375944449806873670334039278929235592863648055296 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade032Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade032Part00960 = 233585732530673509020450107360358112076802070966801312196895184634723368312344561440472389339467723829216804864 := by decide +kernel

theorem group_length : firstCenterIntegerGrade032Group001.size = 512 := by
  simp only [firstCenterIntegerGrade032Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade032Group001 = 16498498160188300972490846011878176675027654336348374754384632830968794272096353942047368068620181138836679557120 := by
  simp only [firstCenterIntegerGrade032Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade032Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade032Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade032Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
