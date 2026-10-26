import Grothe.Haagerup.CanonicalTrace.Shared
import Lean.Elab.Command

/-!
Agent-ID: codex-aa04. Literal checkpoints for the canonical Haagerup bound.
Independent kernel arithmetic; no other numerical module is imported.
Regenerate with tools/gen_haagerup_canonical_check.py.

Each arithmetic step is proved from literal inputs and assembled through
the defining recurrences. Progress identifiers are stable across parallel modules.
-/

set_option Elab.async false
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace Grothe.HaagerupCanonical.Trace

open GrotheKernel

theorem coefficientStep55 :
    c55 * (((2*55+1)^2 : Nat) : Rat) / ((4*(55+1)*(55+2) : Nat) : Rat) = c56 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 57: reached coefficientStep55"
  out.flush

theorem differenceStep1_65 :
    d0_65 - d0_66 = d1_65 := by
  decide +kernel

theorem differenceStep4_66 :
    d3_66 - d3_67 = d4_66 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 76: reached difference_order_4"
  out.flush

theorem correctionStep4_conv_blockStep14 :
    convWithTail correctionStep4_conv_block14 correction5 correctionStep4_conv_result15 = correctionStep4_conv_result14 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep14"
  out.flush

theorem correctionStep3_conv_blockStep17 :
    convWithTail correctionStep3_conv_block17 correction4 correctionStep3_conv_result18 = correctionStep3_conv_result17 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep17"
  out.flush

theorem correctionStep3_conv_blockStep2 :
    convWithTail correctionStep3_conv_block2 correction4 correctionStep3_conv_result3 = correctionStep3_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep2"
  out.flush

theorem correctionStep2_conv_blockStep4 :
    convWithTail correctionStep2_conv_block4 correction3 correctionStep2_conv_result5 = correctionStep2_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep4"
  out.flush

theorem correctionStep1_conv_blockStep6 :
    convWithTail correctionStep1_conv_block6 correction2 correctionStep1_conv_result7 = correctionStep1_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep6"
  out.flush

theorem correctionStep0_conv_blockStep8 :
    convWithTail correctionStep0_conv_block8 correction1 correctionStep0_conv_result9 = correctionStep0_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep8"
  out.flush

theorem tail_step_conv_blockStep5 :
    convWithTail tail_step_conv_block5 correction0 tail_step_conv_result6 = tail_step_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached tail_step_conv_blockStep5"
  out.flush

theorem headStep63_conv_blockStep3 :
    convWithTail headStep63_conv_block3 head64 headStep63_conv_result4 = headStep63_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep63_conv_blockStep3"
  out.flush

theorem headStep61_conv_blockStep1 :
    convWithTail headStep61_conv_block1 head62 headStep61_conv_result2 = headStep61_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep61_conv_blockStep1"
  out.flush

theorem headStep58_conv_blockStep3 :
    convWithTail headStep58_conv_block3 head59 headStep58_conv_result4 = headStep58_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep58_conv_blockStep3"
  out.flush

theorem headStep55_conv_blockStep5 :
    convWithTail headStep55_conv_block5 head56 headStep55_conv_result6 = headStep55_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep55_conv_blockStep5"
  out.flush

theorem headStep53_conv_blockStep1 :
    convWithTail headStep53_conv_block1 head54 headStep53_conv_result2 = headStep53_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep53_conv_blockStep1"
  out.flush

theorem headStep51_conv_input :
    ratioA = headStep51_conv_suffix0 := by
  decide +kernel

theorem headStep50_conv_blockStep3 :
    convWithTail headStep50_conv_block3 head51 headStep50_conv_result4 = headStep50_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep50_conv_blockStep3"
  out.flush

theorem headStep47_conv_blockStep5 :
    convWithTail headStep47_conv_block5 head48 headStep47_conv_result6 = headStep47_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep47_conv_blockStep5"
  out.flush

theorem headStep45_conv_blockStep1 :
    convWithTail headStep45_conv_block1 head46 headStep45_conv_result2 = headStep45_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep45_conv_blockStep1"
  out.flush

theorem headStep42_conv_blockStep3 :
    convWithTail headStep42_conv_block3 head43 headStep42_conv_result4 = headStep42_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep42_conv_blockStep3"
  out.flush

theorem headStep39_conv_blockStep5 :
    convWithTail headStep39_conv_block5 head40 headStep39_conv_result6 = headStep39_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep39_conv_blockStep5"
  out.flush

theorem headStep37_conv_blockStep1 :
    convWithTail headStep37_conv_block1 head38 headStep37_conv_result2 = headStep37_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep37_conv_blockStep1"
  out.flush

theorem headStep35_conv_input :
    ratioA = headStep35_conv_suffix0 := by
  decide +kernel

theorem headStep34_conv_blockStep3 :
    convWithTail headStep34_conv_block3 head35 headStep34_conv_result4 = headStep34_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep34_conv_blockStep3"
  out.flush

theorem headStep31_conv_blockStep5 :
    convWithTail headStep31_conv_block5 head32 headStep31_conv_result6 = headStep31_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep31_conv_blockStep5"
  out.flush

theorem headStep29_conv_blockStep1 :
    convWithTail headStep29_conv_block1 head30 headStep29_conv_result2 = headStep29_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep29_conv_blockStep1"
  out.flush

theorem headStep26_conv_blockStep3 :
    convWithTail headStep26_conv_block3 head27 headStep26_conv_result4 = headStep26_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep26_conv_blockStep3"
  out.flush

theorem headStep23_conv_blockStep5 :
    convWithTail headStep23_conv_block5 head24 headStep23_conv_result6 = headStep23_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep23_conv_blockStep5"
  out.flush

theorem headStep21_conv_blockStep1 :
    convWithTail headStep21_conv_block1 head22 headStep21_conv_result2 = headStep21_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep21_conv_blockStep1"
  out.flush

theorem headStep19_conv_input :
    ratioA = headStep19_conv_suffix0 := by
  decide +kernel

theorem headStep18_conv_blockStep3 :
    convWithTail headStep18_conv_block3 head19 headStep18_conv_result4 = headStep18_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep18_conv_blockStep3"
  out.flush

theorem headStep15_conv_blockStep5 :
    convWithTail headStep15_conv_block5 head16 headStep15_conv_result6 = headStep15_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep15_conv_blockStep5"
  out.flush

theorem headStep13_conv_blockStep1 :
    convWithTail headStep13_conv_block1 head14 headStep13_conv_result2 = headStep13_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep13_conv_blockStep1"
  out.flush

theorem headStep10_conv_blockStep3 :
    convWithTail headStep10_conv_block3 head11 headStep10_conv_result4 = headStep10_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep10_conv_blockStep3"
  out.flush

theorem headStep7_conv_blockStep5 :
    convWithTail headStep7_conv_block5 head8 headStep7_conv_result6 = headStep7_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep7_conv_blockStep5"
  out.flush

theorem headStep5_conv_blockStep1 :
    convWithTail headStep5_conv_block1 head6 headStep5_conv_result2 = headStep5_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep5_conv_blockStep1"
  out.flush

theorem headStep3_conv_input :
    ratioA = headStep3_conv_suffix0 := by
  decide +kernel

theorem headStep2_conv_blockStep3 :
    convWithTail headStep2_conv_block3 head3 headStep2_conv_result4 = headStep2_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep2_conv_blockStep3"
  out.flush

theorem final_step_conv_blockStep2 :
    convWithTail final_step_conv_block2 head0 final_step_conv_result3 = final_step_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached final_step_conv_blockStep2"
  out.flush

theorem powerStep3 :
    convI pI power2 = power3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 160: reached powerStep3"
  out.flush

theorem powerStep16_conv_blockStep1 :
    convWithTail powerStep16_conv_block1 power15 powerStep16_conv_result2 = powerStep16_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep16_conv_blockStep1"
  out.flush

theorem seed_product_step_conv_blockStep4 :
    convWithTail seed_product_step_conv_block4 power17 seed_product_step_conv_result5 = seed_product_step_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached seed_product_step_conv_blockStep4"
  out.flush

theorem seed_literal_ok :
    decide (absSum seedI ≤ ofRatLo seedCapQ) = true := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 176: reached seed_literal_ok"
  out.flush

end Grothe.HaagerupCanonical.Trace
