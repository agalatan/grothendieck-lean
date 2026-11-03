import Grothe.UpperChaos.Q0BasePairRoot6Leaf1001Check004

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot6Leaf1001
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem inverseHorner0_mul_checked :
    mulOK inverseTail1.output inverseCertificate.argument inverseproduct0 (231893620618817246422611263 / 91343852333181432387730302044767688728495783936) = true := by
  decide +kernel

theorem inverseHorner0_add_checked :
    addOK inverseproduct0 (constant (1 / 1)) inverseresult0 (0 / 1) = true := by
  decide +kernel

theorem inverseHorner0_checked :
    inverseTail0.check inverseCertificate.argument [constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons inverseCertificate.argument (constant (1 / 1))
    [constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1)]
    inverseproduct0 inverseresult0 (231893620618817246422611263 / 91343852333181432387730302044767688728495783936) (0 / 1) inverseTail1
    inverseHorner1_checked inverseHorner0_mul_checked inverseHorner0_add_checked

theorem inverseField0_checked :
    intervalSubset (IntervalRat.mul
      (IntervalRat.sub (range denominatorModel) (IntervalRat.singleton inverseCertificate.center))
      (IntervalRat.singleton (1 / inverseCertificate.center)))
      (errorInterval inverseCertificate.radius inverseCertificate.radius_nonneg) = true := by
  decide +kernel

theorem inverseField1_checked :
    scaleOK (1 / inverseCertificate.center) denominatorModel inverseCertificate.scaled inverseCertificate.scaledBudget = true := by
  decide +kernel

end Grothe.UpperChaos.Q0BasePairRoot6Leaf1001
