import Grothe.UpperChaos.Q0BasePairRoot10Leaf1001Check001

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot10Leaf1001
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem inverseHorner6_mul_checked :
    mulOK inverseTail7.output inverseCertificate.argument inverseproduct6 (36570698822612092561112088681 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem inverseHorner6_add_checked :
    addOK inverseproduct6 (((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 6 (constant 0)) inverseresult6 0 = true := by
  decide +kernel

theorem inverseHorner6_checked :
    inverseTail6.check inverseCertificate.argument [((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 6 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 7 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 8 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 9 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 10 (constant 0)] = true := by
  exact Trace.check_cons inverseCertificate.argument (((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 6 (constant 0))
    [((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 7 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 8 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 9 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 10 (constant 0)]
    inverseproduct6 inverseresult6 (36570698822612092561112088681 / 1461501637330902918203684832716283019655932542976) 0 inverseTail7
    inverseHorner7_checked inverseHorner6_mul_checked inverseHorner6_add_checked

theorem inverseHorner5_mul_checked :
    mulOK inverseTail6.output inverseCertificate.argument inverseproduct5 (36574225455432136004370293305 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem inverseHorner5_add_checked :
    addOK inverseproduct5 (((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 5 (constant 0)) inverseresult5 0 = true := by
  decide +kernel

theorem inverseHorner5_checked :
    inverseTail5.check inverseCertificate.argument [((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 5 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 6 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 7 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 8 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 9 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 10 (constant 0)] = true := by
  exact Trace.check_cons inverseCertificate.argument (((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 5 (constant 0))
    [((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 6 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 7 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 8 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 9 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 10 (constant 0)]
    inverseproduct5 inverseresult5 (36574225455432136004370293305 / 1461501637330902918203684832716283019655932542976) 0 inverseTail6
    inverseHorner6_checked inverseHorner5_mul_checked inverseHorner5_add_checked

end Grothe.UpperChaos.Q0BasePairRoot10Leaf1001
