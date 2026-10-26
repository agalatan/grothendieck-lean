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

theorem one_eq_c0 :
    (1 : Rat) = c0 := by
  decide +kernel

theorem coefficientStep0 :
    c0 * (((2*0+1)^2 : Nat) : Rat) / ((4*(0+1)*(0+2) : Nat) : Rat) = c1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 2: reached coefficientStep0"
  out.flush

theorem coefficientStep4 :
    c4 * (((2*4+1)^2 : Nat) : Rat) / ((4*(4+1)*(4+2) : Nat) : Rat) = c5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 6: reached coefficientStep4"
  out.flush

theorem coefficientStep8 :
    c8 * (((2*8+1)^2 : Nat) : Rat) / ((4*(8+1)*(8+2) : Nat) : Rat) = c9 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 10: reached coefficientStep8"
  out.flush

theorem coefficientStep13 :
    c13 * (((2*13+1)^2 : Nat) : Rat) / ((4*(13+1)*(13+2) : Nat) : Rat) = c14 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 15: reached coefficientStep13"
  out.flush

theorem coefficientStep20 :
    c20 * (((2*20+1)^2 : Nat) : Rat) / ((4*(20+1)*(20+2) : Nat) : Rat) = c21 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 22: reached coefficientStep20"
  out.flush

theorem coefficientStep28 :
    c28 * (((2*28+1)^2 : Nat) : Rat) / ((4*(28+1)*(28+2) : Nat) : Rat) = c29 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 30: reached coefficientStep28"
  out.flush

theorem coefficientStep36 :
    c36 * (((2*36+1)^2 : Nat) : Rat) / ((4*(36+1)*(36+2) : Nat) : Rat) = c37 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 38: reached coefficientStep36"
  out.flush

theorem coefficientStep46 :
    c46 * (((2*46+1)^2 : Nat) : Rat) / ((4*(46+1)*(46+2) : Nat) : Rat) = c47 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 48: reached coefficientStep46"
  out.flush

theorem coefficientStep59 :
    c59 * (((2*59+1)^2 : Nat) : Rat) / ((4*(59+1)*(59+2) : Nat) : Rat) = c60 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 61: reached coefficientStep59"
  out.flush

theorem differenceStep1_69 :
    d0_69 - d0_70 = d1_69 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 73: reached difference_order_1"
  out.flush

theorem coefficient_literal_ok :
    c64 ≤ 1/10000 ∧ d6_64 ≤ 37/10000000000000 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 79: reached coefficient_literal_ok"
  out.flush

theorem correctionStep4_conv_blockStep10 :
    convWithTail correctionStep4_conv_block10 correction5 correctionStep4_conv_result11 = correctionStep4_conv_result10 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep10"
  out.flush

theorem correctionStep3_conv_blockStep0 :
    convWithTail correctionStep3_conv_block0 correction4 correctionStep3_conv_result1 = correctionStep3_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep0"
  out.flush

theorem correctionStep2_conv_blockStep2 :
    convWithTail correctionStep2_conv_block2 correction3 correctionStep2_conv_result3 = correctionStep2_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep2"
  out.flush

theorem correctionStep1_conv_blockStep4 :
    convWithTail correctionStep1_conv_block4 correction2 correctionStep1_conv_result5 = correctionStep1_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep4"
  out.flush

theorem correctionStep0_conv_blockStep6 :
    convWithTail correctionStep0_conv_block6 correction1 correctionStep0_conv_result7 = correctionStep0_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep6"
  out.flush

theorem tail_step_conv_blockStep3 :
    convWithTail tail_step_conv_block3 correction0 tail_step_conv_result4 = tail_step_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached tail_step_conv_blockStep3"
  out.flush

theorem headStep63_conv_input :
    ratioA = headStep63_conv_suffix0 := by
  decide +kernel

theorem headStep60_conv_blockStep5 :
    convWithTail headStep60_conv_block5 head61 headStep60_conv_result6 = headStep60_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep60_conv_blockStep5"
  out.flush

theorem headStep58_conv_blockStep1 :
    convWithTail headStep58_conv_block1 head59 headStep58_conv_result2 = headStep58_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep58_conv_blockStep1"
  out.flush

theorem headStep55_conv_blockStep3 :
    convWithTail headStep55_conv_block3 head56 headStep55_conv_result4 = headStep55_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep55_conv_blockStep3"
  out.flush

theorem headStep52_conv_blockStep5 :
    convWithTail headStep52_conv_block5 head53 headStep52_conv_result6 = headStep52_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep52_conv_blockStep5"
  out.flush

theorem headStep50_conv_blockStep1 :
    convWithTail headStep50_conv_block1 head51 headStep50_conv_result2 = headStep50_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep50_conv_blockStep1"
  out.flush

theorem headStep47_conv_blockStep3 :
    convWithTail headStep47_conv_block3 head48 headStep47_conv_result4 = headStep47_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep47_conv_blockStep3"
  out.flush

theorem headStep47_conv_input :
    ratioA = headStep47_conv_suffix0 := by
  decide +kernel

theorem headStep44_conv_blockStep5 :
    convWithTail headStep44_conv_block5 head45 headStep44_conv_result6 = headStep44_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep44_conv_blockStep5"
  out.flush

theorem headStep42_conv_blockStep1 :
    convWithTail headStep42_conv_block1 head43 headStep42_conv_result2 = headStep42_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep42_conv_blockStep1"
  out.flush

theorem headStep39_conv_blockStep3 :
    convWithTail headStep39_conv_block3 head40 headStep39_conv_result4 = headStep39_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep39_conv_blockStep3"
  out.flush

theorem headStep36_conv_blockStep5 :
    convWithTail headStep36_conv_block5 head37 headStep36_conv_result6 = headStep36_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep36_conv_blockStep5"
  out.flush

theorem headStep34_conv_blockStep1 :
    convWithTail headStep34_conv_block1 head35 headStep34_conv_result2 = headStep34_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep34_conv_blockStep1"
  out.flush

theorem headStep31_conv_blockStep3 :
    convWithTail headStep31_conv_block3 head32 headStep31_conv_result4 = headStep31_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep31_conv_blockStep3"
  out.flush

theorem headStep31_conv_input :
    ratioA = headStep31_conv_suffix0 := by
  decide +kernel

theorem headStep28_conv_blockStep5 :
    convWithTail headStep28_conv_block5 head29 headStep28_conv_result6 = headStep28_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep28_conv_blockStep5"
  out.flush

theorem headStep26_conv_blockStep1 :
    convWithTail headStep26_conv_block1 head27 headStep26_conv_result2 = headStep26_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep26_conv_blockStep1"
  out.flush

theorem headStep23_conv_blockStep3 :
    convWithTail headStep23_conv_block3 head24 headStep23_conv_result4 = headStep23_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep23_conv_blockStep3"
  out.flush

theorem headStep20_conv_blockStep5 :
    convWithTail headStep20_conv_block5 head21 headStep20_conv_result6 = headStep20_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep20_conv_blockStep5"
  out.flush

theorem headStep18_conv_blockStep1 :
    convWithTail headStep18_conv_block1 head19 headStep18_conv_result2 = headStep18_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep18_conv_blockStep1"
  out.flush

theorem headStep15_conv_blockStep3 :
    convWithTail headStep15_conv_block3 head16 headStep15_conv_result4 = headStep15_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep15_conv_blockStep3"
  out.flush

theorem headStep15_conv_input :
    ratioA = headStep15_conv_suffix0 := by
  decide +kernel

theorem headStep12_conv_blockStep5 :
    convWithTail headStep12_conv_block5 head13 headStep12_conv_result6 = headStep12_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep12_conv_blockStep5"
  out.flush

theorem headStep10_conv_blockStep1 :
    convWithTail headStep10_conv_block1 head11 headStep10_conv_result2 = headStep10_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep10_conv_blockStep1"
  out.flush

theorem headStep7_conv_blockStep3 :
    convWithTail headStep7_conv_block3 head8 headStep7_conv_result4 = headStep7_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep7_conv_blockStep3"
  out.flush

theorem headStep4_conv_blockStep5 :
    convWithTail headStep4_conv_block5 head5 headStep4_conv_result6 = headStep4_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep4_conv_blockStep5"
  out.flush

theorem headStep2_conv_blockStep1 :
    convWithTail headStep2_conv_block1 head3 headStep2_conv_result2 = headStep2_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep2_conv_blockStep1"
  out.flush

theorem final_step_conv_blockStep0 :
    convWithTail final_step_conv_block0 head0 final_step_conv_result1 = final_step_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached final_step_conv_blockStep0"
  out.flush

theorem final_step_conv_input :
    pI = final_step_conv_suffix0 := by
  decide +kernel

theorem powerStep5 :
    convI pI power4 = power5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 162: reached powerStep5"
  out.flush

theorem powerStep16_conv_blockStep2 :
    convWithTail powerStep16_conv_block2 power15 powerStep16_conv_result3 = powerStep16_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep16_conv_blockStep2"
  out.flush

theorem seed_product_step_conv_blockStep5 :
    convWithTail seed_product_step_conv_block5 power17 seed_product_step_conv_result6 = seed_product_step_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached seed_product_step_conv_blockStep5"
  out.flush

end Grothe.HaagerupCanonical.Trace
