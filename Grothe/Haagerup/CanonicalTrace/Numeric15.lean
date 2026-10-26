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

theorem coefficientStep42 :
    c42 * (((2*42+1)^2 : Nat) : Rat) / ((4*(42+1)*(42+2) : Nat) : Rat) = c43 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 44: reached coefficientStep42"
  out.flush

theorem coefficientStep52 :
    c52 * (((2*52+1)^2 : Nat) : Rat) / ((4*(52+1)*(52+2) : Nat) : Rat) = c53 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 54: reached coefficientStep52"
  out.flush

theorem coefficientStep68 :
    c68 * (((2*68+1)^2 : Nat) : Rat) / ((4*(68+1)*(68+2) : Nat) : Rat) = c69 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 70: reached coefficientStep68"
  out.flush

theorem differenceStep3_67 :
    d2_67 - d2_68 = d3_67 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 75: reached difference_order_3"
  out.flush

theorem correctionStep4_conv_blockStep18 :
    convWithTail correctionStep4_conv_block18 correction5 correctionStep4_conv_result19 = correctionStep4_conv_result18 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep18"
  out.flush

theorem correctionStep4_conv_blockStep13 :
    convWithTail correctionStep4_conv_block13 correction5 correctionStep4_conv_result14 = correctionStep4_conv_result13 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep13"
  out.flush

theorem correctionStep3_conv_blockStep16 :
    convWithTail correctionStep3_conv_block16 correction4 correctionStep3_conv_result17 = correctionStep3_conv_result16 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep16"
  out.flush

theorem correctionStep3_conv_blockStep1 :
    convWithTail correctionStep3_conv_block1 correction4 correctionStep3_conv_result2 = correctionStep3_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep1"
  out.flush

theorem correctionStep2_conv_blockStep3 :
    convWithTail correctionStep2_conv_block3 correction3 correctionStep2_conv_result4 = correctionStep2_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep3"
  out.flush

theorem correctionStep1_conv_blockStep5 :
    convWithTail correctionStep1_conv_block5 correction2 correctionStep1_conv_result6 = correctionStep1_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep5"
  out.flush

theorem correctionStep0_conv_blockStep7 :
    convWithTail correctionStep0_conv_block7 correction1 correctionStep0_conv_result8 = correctionStep0_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep7"
  out.flush

theorem tail_step_conv_blockStep4 :
    convWithTail tail_step_conv_block4 correction0 tail_step_conv_result5 = tail_step_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached tail_step_conv_blockStep4"
  out.flush

theorem tail_step_conv_input :
    rI = tail_step_conv_suffix0 := by
  decide +kernel

theorem headStep61_conv_blockStep0 :
    convWithTail headStep61_conv_block0 head62 headStep61_conv_result1 = headStep61_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep61_conv_blockStep0"
  out.flush

theorem headStep58_conv_blockStep2 :
    convWithTail headStep58_conv_block2 head59 headStep58_conv_result3 = headStep58_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep58_conv_blockStep2"
  out.flush

theorem headStep55_conv_blockStep4 :
    convWithTail headStep55_conv_block4 head56 headStep55_conv_result5 = headStep55_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep55_conv_blockStep4"
  out.flush

theorem headStep54_conv_input :
    ratioA = headStep54_conv_suffix0 := by
  decide +kernel

theorem headStep53_conv_blockStep0 :
    convWithTail headStep53_conv_block0 head54 headStep53_conv_result1 = headStep53_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep53_conv_blockStep0"
  out.flush

theorem headStep50_conv_blockStep2 :
    convWithTail headStep50_conv_block2 head51 headStep50_conv_result3 = headStep50_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep50_conv_blockStep2"
  out.flush

theorem headStep47_conv_blockStep4 :
    convWithTail headStep47_conv_block4 head48 headStep47_conv_result5 = headStep47_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep47_conv_blockStep4"
  out.flush

theorem headStep45_conv_blockStep0 :
    convWithTail headStep45_conv_block0 head46 headStep45_conv_result1 = headStep45_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep45_conv_blockStep0"
  out.flush

theorem headStep42_conv_blockStep2 :
    convWithTail headStep42_conv_block2 head43 headStep42_conv_result3 = headStep42_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep42_conv_blockStep2"
  out.flush

theorem headStep39_conv_blockStep4 :
    convWithTail headStep39_conv_block4 head40 headStep39_conv_result5 = headStep39_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep39_conv_blockStep4"
  out.flush

theorem headStep38_conv_input :
    ratioA = headStep38_conv_suffix0 := by
  decide +kernel

theorem headStep37_conv_blockStep0 :
    convWithTail headStep37_conv_block0 head38 headStep37_conv_result1 = headStep37_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep37_conv_blockStep0"
  out.flush

theorem headStep34_conv_blockStep2 :
    convWithTail headStep34_conv_block2 head35 headStep34_conv_result3 = headStep34_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep34_conv_blockStep2"
  out.flush

theorem headStep31_conv_blockStep4 :
    convWithTail headStep31_conv_block4 head32 headStep31_conv_result5 = headStep31_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep31_conv_blockStep4"
  out.flush

theorem headStep29_conv_blockStep0 :
    convWithTail headStep29_conv_block0 head30 headStep29_conv_result1 = headStep29_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep29_conv_blockStep0"
  out.flush

theorem headStep26_conv_blockStep2 :
    convWithTail headStep26_conv_block2 head27 headStep26_conv_result3 = headStep26_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep26_conv_blockStep2"
  out.flush

theorem headStep23_conv_blockStep4 :
    convWithTail headStep23_conv_block4 head24 headStep23_conv_result5 = headStep23_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep23_conv_blockStep4"
  out.flush

theorem headStep22_conv_input :
    ratioA = headStep22_conv_suffix0 := by
  decide +kernel

theorem headStep21_conv_blockStep0 :
    convWithTail headStep21_conv_block0 head22 headStep21_conv_result1 = headStep21_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep21_conv_blockStep0"
  out.flush

theorem headStep18_conv_blockStep2 :
    convWithTail headStep18_conv_block2 head19 headStep18_conv_result3 = headStep18_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep18_conv_blockStep2"
  out.flush

theorem headStep15_conv_blockStep4 :
    convWithTail headStep15_conv_block4 head16 headStep15_conv_result5 = headStep15_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep15_conv_blockStep4"
  out.flush

theorem headStep13_conv_blockStep0 :
    convWithTail headStep13_conv_block0 head14 headStep13_conv_result1 = headStep13_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep13_conv_blockStep0"
  out.flush

theorem headStep10_conv_blockStep2 :
    convWithTail headStep10_conv_block2 head11 headStep10_conv_result3 = headStep10_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep10_conv_blockStep2"
  out.flush

theorem headStep7_conv_blockStep4 :
    convWithTail headStep7_conv_block4 head8 headStep7_conv_result5 = headStep7_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep7_conv_blockStep4"
  out.flush

theorem headStep6_conv_input :
    ratioA = headStep6_conv_suffix0 := by
  decide +kernel

theorem headStep5_conv_blockStep0 :
    convWithTail headStep5_conv_block0 head6 headStep5_conv_result1 = headStep5_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep5_conv_blockStep0"
  out.flush

theorem headStep2_conv_blockStep2 :
    convWithTail headStep2_conv_block2 head3 headStep2_conv_result3 = headStep2_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep2_conv_blockStep2"
  out.flush

theorem final_step_conv_blockStep1 :
    convWithTail final_step_conv_block1 head0 final_step_conv_result2 = final_step_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached final_step_conv_blockStep1"
  out.flush

theorem powerStep16_conv_blockStep0 :
    convWithTail powerStep16_conv_block0 power15 powerStep16_conv_result1 = powerStep16_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep16_conv_blockStep0"
  out.flush

theorem powerStep16_conv_input :
    pI = powerStep16_conv_suffix0 := by
  decide +kernel

theorem seed_product_step_conv_blockStep3 :
    convWithTail seed_product_step_conv_block3 power17 seed_product_step_conv_result4 = seed_product_step_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached seed_product_step_conv_blockStep3"
  out.flush

end Grothe.HaagerupCanonical.Trace
