import Grothe.UpperChaos.Q0BasePairRoot6Leaf0110Check004

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot6Leaf0110
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem inverseHorner0_mul_checked :
    mulOK inverseTail1.output inverseCertificate.argument inverseproduct0 (587625796326374933041963827 / 365375409332725729550921208179070754913983135744) = true := by
  decide +kernel

theorem inverseHorner0_add_checked :
    addOK inverseproduct0 (((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 0 (constant 0)) inverseresult0 0 = true := by
  decide +kernel

theorem inverseHorner0_checked :
    inverseTail0.check inverseCertificate.argument [((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 0 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 1 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 2 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 3 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 4 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 5 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 6 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 7 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 8 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 9 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 10 (constant 0)] = true := by
  exact Trace.check_cons inverseCertificate.argument (((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 0 (constant 0))
    [((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 1 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 2 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 3 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 4 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 5 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 6 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 7 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 8 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 9 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 10 (constant 0)]
    inverseproduct0 inverseresult0 (587625796326374933041963827 / 365375409332725729550921208179070754913983135744) 0 inverseTail1
    inverseHorner1_checked inverseHorner0_mul_checked inverseHorner0_add_checked

theorem inverseField0_checked :
    intervalSubset (IntervalRat.mul
      (IntervalRat.sub (range denominatorModel) (IntervalRat.singleton inverseCertificate.center))
      (IntervalRat.singleton (1 / inverseCertificate.center)))
      (PointwiseGeometricEnclosure.errorInterval inverseCertificate.radius inverseCertificate.radius_nonneg) = true := by
  decide +kernel

theorem inverseField1_checked :
    scaleOK (1 / inverseCertificate.center) denominatorModel inverseCertificate.scaled inverseCertificate.scaledBudget = true := by
  decide +kernel

end Grothe.UpperChaos.Q0BasePairRoot6Leaf0110
