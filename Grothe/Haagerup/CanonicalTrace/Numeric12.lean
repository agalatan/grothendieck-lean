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

theorem coefficientStep19 :
    c19 * (((2*19+1)^2 : Nat) : Rat) / ((4*(19+1)*(19+2) : Nat) : Rat) = c20 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 21: reached coefficientStep19"
  out.flush

theorem coefficientStep27 :
    c27 * (((2*27+1)^2 : Nat) : Rat) / ((4*(27+1)*(27+2) : Nat) : Rat) = c28 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 29: reached coefficientStep27"
  out.flush

theorem coefficientStep35 :
    c35 * (((2*35+1)^2 : Nat) : Rat) / ((4*(35+1)*(35+2) : Nat) : Rat) = c36 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 37: reached coefficientStep35"
  out.flush

theorem coefficientStep44 :
    c44 * (((2*44+1)^2 : Nat) : Rat) / ((4*(44+1)*(44+2) : Nat) : Rat) = c45 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 46: reached coefficientStep44"
  out.flush

theorem coefficientStep54 :
    c54 * (((2*54+1)^2 : Nat) : Rat) / ((4*(54+1)*(54+2) : Nat) : Rat) = c55 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 56: reached coefficientStep54"
  out.flush

theorem differenceStep1_64 :
    d0_64 - d0_65 = d1_64 := by
  decide +kernel

theorem differenceStep4_65 :
    d3_65 - d3_66 = d4_65 := by
  decide +kernel

theorem correctionStep4_conv_blockStep11 :
    convWithTail correctionStep4_conv_block11 correction5 correctionStep4_conv_result12 = correctionStep4_conv_result11 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep11"
  out.flush

theorem correctionStep3_conv_blockStep14 :
    convWithTail correctionStep3_conv_block14 correction4 correctionStep3_conv_result15 = correctionStep3_conv_result14 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep14"
  out.flush

theorem correctionStep2_conv_blockStep16 :
    convWithTail correctionStep2_conv_block16 correction3 correctionStep2_conv_result17 = correctionStep2_conv_result16 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep16"
  out.flush

theorem correctionStep2_conv_blockStep0 :
    convWithTail correctionStep2_conv_block0 correction3 correctionStep2_conv_result1 = correctionStep2_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep0"
  out.flush

theorem correctionStep1_conv_blockStep2 :
    convWithTail correctionStep1_conv_block2 correction2 correctionStep1_conv_result3 = correctionStep1_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep2"
  out.flush

theorem correctionStep0_conv_blockStep4 :
    convWithTail correctionStep0_conv_block4 correction1 correctionStep0_conv_result5 = correctionStep0_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep4"
  out.flush

theorem tail_step_conv_blockStep1 :
    convWithTail tail_step_conv_block1 correction0 tail_step_conv_result2 = tail_step_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached tail_step_conv_blockStep1"
  out.flush

theorem headStep63_conv_blockStep4 :
    convWithTail headStep63_conv_block4 head64 headStep63_conv_result5 = headStep63_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep63_conv_blockStep4"
  out.flush

theorem headStep60_conv_blockStep3 :
    convWithTail headStep60_conv_block3 head61 headStep60_conv_result4 = headStep60_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep60_conv_blockStep3"
  out.flush

theorem headStep57_conv_blockStep5 :
    convWithTail headStep57_conv_block5 head58 headStep57_conv_result6 = headStep57_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep57_conv_blockStep5"
  out.flush

theorem headStep55_conv_blockStep1 :
    convWithTail headStep55_conv_block1 head56 headStep55_conv_result2 = headStep55_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep55_conv_blockStep1"
  out.flush

theorem headStep52_conv_blockStep3 :
    convWithTail headStep52_conv_block3 head53 headStep52_conv_result4 = headStep52_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep52_conv_blockStep3"
  out.flush

theorem headStep52_conv_input :
    ratioA = headStep52_conv_suffix0 := by
  decide +kernel

theorem headStep49_conv_blockStep5 :
    convWithTail headStep49_conv_block5 head50 headStep49_conv_result6 = headStep49_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep49_conv_blockStep5"
  out.flush

theorem headStep47_conv_blockStep1 :
    convWithTail headStep47_conv_block1 head48 headStep47_conv_result2 = headStep47_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep47_conv_blockStep1"
  out.flush

theorem headStep44_conv_blockStep3 :
    convWithTail headStep44_conv_block3 head45 headStep44_conv_result4 = headStep44_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep44_conv_blockStep3"
  out.flush

theorem headStep41_conv_blockStep5 :
    convWithTail headStep41_conv_block5 head42 headStep41_conv_result6 = headStep41_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep41_conv_blockStep5"
  out.flush

theorem headStep39_conv_blockStep1 :
    convWithTail headStep39_conv_block1 head40 headStep39_conv_result2 = headStep39_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep39_conv_blockStep1"
  out.flush

theorem headStep36_conv_blockStep3 :
    convWithTail headStep36_conv_block3 head37 headStep36_conv_result4 = headStep36_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep36_conv_blockStep3"
  out.flush

theorem headStep36_conv_input :
    ratioA = headStep36_conv_suffix0 := by
  decide +kernel

theorem headStep33_conv_blockStep5 :
    convWithTail headStep33_conv_block5 head34 headStep33_conv_result6 = headStep33_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep33_conv_blockStep5"
  out.flush

theorem headStep31_conv_blockStep1 :
    convWithTail headStep31_conv_block1 head32 headStep31_conv_result2 = headStep31_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep31_conv_blockStep1"
  out.flush

theorem headStep28_conv_blockStep3 :
    convWithTail headStep28_conv_block3 head29 headStep28_conv_result4 = headStep28_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep28_conv_blockStep3"
  out.flush

theorem headStep25_conv_blockStep5 :
    convWithTail headStep25_conv_block5 head26 headStep25_conv_result6 = headStep25_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep25_conv_blockStep5"
  out.flush

theorem headStep23_conv_blockStep1 :
    convWithTail headStep23_conv_block1 head24 headStep23_conv_result2 = headStep23_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep23_conv_blockStep1"
  out.flush

theorem headStep20_conv_blockStep3 :
    convWithTail headStep20_conv_block3 head21 headStep20_conv_result4 = headStep20_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep20_conv_blockStep3"
  out.flush

theorem headStep20_conv_input :
    ratioA = headStep20_conv_suffix0 := by
  decide +kernel

theorem headStep17_conv_blockStep5 :
    convWithTail headStep17_conv_block5 head18 headStep17_conv_result6 = headStep17_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep17_conv_blockStep5"
  out.flush

theorem headStep15_conv_blockStep1 :
    convWithTail headStep15_conv_block1 head16 headStep15_conv_result2 = headStep15_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep15_conv_blockStep1"
  out.flush

theorem headStep12_conv_blockStep3 :
    convWithTail headStep12_conv_block3 head13 headStep12_conv_result4 = headStep12_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep12_conv_blockStep3"
  out.flush

theorem headStep9_conv_blockStep5 :
    convWithTail headStep9_conv_block5 head10 headStep9_conv_result6 = headStep9_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep9_conv_blockStep5"
  out.flush

theorem headStep7_conv_blockStep1 :
    convWithTail headStep7_conv_block1 head8 headStep7_conv_result2 = headStep7_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep7_conv_blockStep1"
  out.flush

theorem headStep4_conv_blockStep3 :
    convWithTail headStep4_conv_block3 head5 headStep4_conv_result4 = headStep4_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep4_conv_blockStep3"
  out.flush

theorem headStep4_conv_input :
    ratioA = headStep4_conv_suffix0 := by
  decide +kernel

theorem headStep1_conv_blockStep5 :
    convWithTail headStep1_conv_block5 head2 headStep1_conv_result6 = headStep1_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep1_conv_blockStep5"
  out.flush

theorem powerStep2 :
    convI pI power1 = power2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 159: reached powerStep2"
  out.flush

theorem powerStep6 :
    convI pI power5 = power6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 163: reached powerStep6"
  out.flush

theorem powerStep13_conv_blockStep1 :
    convWithTail powerStep13_conv_block1 power12 powerStep13_conv_result2 = powerStep13_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep13_conv_blockStep1"
  out.flush

theorem seed_product_step_conv_blockStep6 :
    convWithTail seed_product_step_conv_block6 power17 seed_product_step_conv_result7 = seed_product_step_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached seed_product_step_conv_blockStep6"
  out.flush

theorem seed_product_step_conv_input :
    rI = seed_product_step_conv_suffix0 := by
  decide +kernel

end Grothe.HaagerupCanonical.Trace
