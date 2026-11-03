import Grothe.UpperChaos.Q0BasePairRoot2Leaf0100Check000

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Leaf0100
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem inverseHorner8_mul_checked :
    mulOK inverseTail9.output inverseCertificate.argument inverseproduct8 (276729582911229207020320739141 / 730750818665451459101842416358141509827966271488) = true := by
  decide +kernel

theorem inverseHorner8_add_checked :
    addOK inverseproduct8 (((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 8 (constant 0)) inverseresult8 0 = true := by
  decide +kernel

theorem inverseHorner8_checked :
    inverseTail8.check inverseCertificate.argument [((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 8 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 9 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 10 (constant 0)] = true := by
  exact Trace.check_cons inverseCertificate.argument (((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 8 (constant 0))
    [((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 9 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 10 (constant 0)]
    inverseproduct8 inverseresult8 (276729582911229207020320739141 / 730750818665451459101842416358141509827966271488) 0 inverseTail9
    inverseHorner9_checked inverseHorner8_mul_checked inverseHorner8_add_checked

theorem inverseHorner7_mul_checked :
    mulOK inverseTail8.output inverseCertificate.argument inverseproduct7 (537792141261432960196901788803 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem inverseHorner7_add_checked :
    addOK inverseproduct7 (((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 7 (constant 0)) inverseresult7 0 = true := by
  decide +kernel

theorem inverseHorner7_checked :
    inverseTail7.check inverseCertificate.argument [((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 7 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 8 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 9 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 10 (constant 0)] = true := by
  exact Trace.check_cons inverseCertificate.argument (((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 7 (constant 0))
    [((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 8 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 9 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 10 (constant 0)]
    inverseproduct7 inverseresult7 (537792141261432960196901788803 / 1461501637330902918203684832716283019655932542976) 0 inverseTail8
    inverseHorner8_checked inverseHorner7_mul_checked inverseHorner7_add_checked

end Grothe.UpperChaos.Q0BasePairRoot2Leaf0100
