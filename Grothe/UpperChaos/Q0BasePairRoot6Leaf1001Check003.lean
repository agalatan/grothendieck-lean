import Grothe.UpperChaos.Q0BasePairRoot6Leaf1001Check002

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot6Leaf1001
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem inverseHorner4_mul_checked :
    mulOK inverseTail5.output inverseCertificate.argument inverseproduct4 (115946810309408623210620653 / 45671926166590716193865151022383844364247891968) = true := by
  decide +kernel

theorem inverseHorner4_add_checked :
    addOK inverseproduct4 (((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 4 (constant 0)) inverseresult4 0 = true := by
  decide +kernel

theorem inverseHorner4_checked :
    inverseTail4.check inverseCertificate.argument [((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 4 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 5 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 6 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 7 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 8 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 9 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 10 (constant 0)] = true := by
  exact Trace.check_cons inverseCertificate.argument (((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 4 (constant 0))
    [((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 5 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 6 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 7 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 8 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 9 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 10 (constant 0)]
    inverseproduct4 inverseresult4 (115946810309408623210620653 / 45671926166590716193865151022383844364247891968) 0 inverseTail5
    inverseHorner5_checked inverseHorner4_mul_checked inverseHorner4_add_checked

theorem inverseHorner3_mul_checked :
    mulOK inverseTail4.output inverseCertificate.argument inverseproduct3 (231893620618817246422611263 / 91343852333181432387730302044767688728495783936) = true := by
  decide +kernel

theorem inverseHorner3_add_checked :
    addOK inverseproduct3 (((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 3 (constant 0)) inverseresult3 0 = true := by
  decide +kernel

theorem inverseHorner3_checked :
    inverseTail3.check inverseCertificate.argument [((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 3 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 4 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 5 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 6 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 7 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 8 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 9 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 10 (constant 0)] = true := by
  exact Trace.check_cons inverseCertificate.argument (((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 3 (constant 0))
    [((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 4 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 5 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 6 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 7 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 8 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 9 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 10 (constant 0)]
    inverseproduct3 inverseresult3 (231893620618817246422611263 / 91343852333181432387730302044767688728495783936) 0 inverseTail4
    inverseHorner4_checked inverseHorner3_mul_checked inverseHorner3_add_checked

end Grothe.UpperChaos.Q0BasePairRoot6Leaf1001
