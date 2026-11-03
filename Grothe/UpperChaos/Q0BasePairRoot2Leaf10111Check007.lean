import Grothe.UpperChaos.Q0BasePairRoot2Leaf10111Check006

/-! Generated bounded arithmetic block (3 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Leaf10111
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem inverseField7_checked :
    roundOK inverseCertificate.geometric.coefficients
      (IntervalRat.add inverseCertificate.geometric.remainder (errorInterval inverseCertificate.error inverseCertificate.error_nonneg))
      inverseCertificate.output 0 = true := by
  decide +kernel

theorem inverse_checked :
    RectangleReciprocalCertificate.Verified denominatorModel inverseCertificate := by
  exact ⟨inverseField0_checked, inverseField1_checked, inverseField2_checked, inverseField3_checked, inverseField4_checked, inverseField5_checked, inverseField6_checked, inverseField7_checked⟩

theorem dampingHorner11_checked :
    dampingTail11.check dampingCertificate.delta [] = true := by
  rfl

theorem dampingHorner10_mul_checked :
    mulOK dampingTail11.output dampingCertificate.delta dampingproduct10 (0 / 1) = true := by
  decide +kernel

theorem dampingHorner10_add_checked :
    addOK dampingproduct10 (((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 10 (constant 0)) dampingresult10 0 = true := by
  decide +kernel

theorem dampingHorner10_checked :
    dampingTail10.check dampingCertificate.delta [((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 10 (constant 0)] = true := by
  exact Trace.check_cons dampingCertificate.delta (((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 10 (constant 0))
    []
    dampingproduct10 dampingresult10 (0 / 1) 0 dampingTail11
    dampingHorner11_checked dampingHorner10_mul_checked dampingHorner10_add_checked

end Grothe.UpperChaos.Q0BasePairRoot2Leaf10111
