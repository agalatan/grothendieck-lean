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

theorem coefficientStep65 :
    c65 * (((2*65+1)^2 : Nat) : Rat) / ((4*(65+1)*(65+2) : Nat) : Rat) = c66 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 67: reached coefficientStep65"
  out.flush

theorem differenceStep3_64 :
    d2_64 - d2_65 = d3_64 := by
  decide +kernel

theorem correctionStep4_conv_blockStep15 :
    convWithTail correctionStep4_conv_block15 correction5 correctionStep4_conv_result16 = correctionStep4_conv_result15 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep15"
  out.flush

theorem correctionStep4_conv_blockStep0 :
    convWithTail correctionStep4_conv_block0 correction5 correctionStep4_conv_result1 = correctionStep4_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep0"
  out.flush

theorem correctionStep3_conv_blockStep11 :
    convWithTail correctionStep3_conv_block11 correction4 correctionStep3_conv_result12 = correctionStep3_conv_result11 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep11"
  out.flush

theorem correctionStep2_conv_blockStep13 :
    convWithTail correctionStep2_conv_block13 correction3 correctionStep2_conv_result14 = correctionStep2_conv_result13 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep13"
  out.flush

theorem correctionStep2_conv_input :
    ratioY = correctionStep2_conv_suffix0 := by
  decide +kernel

theorem correctionStep1_conv_blockStep15 :
    convWithTail correctionStep1_conv_block15 correction2 correctionStep1_conv_result16 = correctionStep1_conv_result15 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep15"
  out.flush

theorem correctionStep0_conv_blockStep17 :
    convWithTail correctionStep0_conv_block17 correction1 correctionStep0_conv_result18 = correctionStep0_conv_result17 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep17"
  out.flush

theorem correctionStep0_conv_blockStep1 :
    convWithTail correctionStep0_conv_block1 correction1 correctionStep0_conv_result2 = correctionStep0_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep1"
  out.flush

theorem headStep62_conv_blockStep4 :
    convWithTail headStep62_conv_block4 head63 headStep62_conv_result5 = headStep62_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep62_conv_blockStep4"
  out.flush

theorem headStep60_conv_blockStep0 :
    convWithTail headStep60_conv_block0 head61 headStep60_conv_result1 = headStep60_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep60_conv_blockStep0"
  out.flush

theorem headStep57_conv_blockStep2 :
    convWithTail headStep57_conv_block2 head58 headStep57_conv_result3 = headStep57_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep57_conv_blockStep2"
  out.flush

theorem headStep57_conv_input :
    ratioA = headStep57_conv_suffix0 := by
  decide +kernel

theorem headStep54_conv_blockStep4 :
    convWithTail headStep54_conv_block4 head55 headStep54_conv_result5 = headStep54_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep54_conv_blockStep4"
  out.flush

theorem headStep52_conv_blockStep0 :
    convWithTail headStep52_conv_block0 head53 headStep52_conv_result1 = headStep52_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep52_conv_blockStep0"
  out.flush

theorem headStep49_conv_blockStep2 :
    convWithTail headStep49_conv_block2 head50 headStep49_conv_result3 = headStep49_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep49_conv_blockStep2"
  out.flush

theorem headStep46_conv_blockStep4 :
    convWithTail headStep46_conv_block4 head47 headStep46_conv_result5 = headStep46_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep46_conv_blockStep4"
  out.flush

theorem headStep44_conv_blockStep0 :
    convWithTail headStep44_conv_block0 head45 headStep44_conv_result1 = headStep44_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep44_conv_blockStep0"
  out.flush

theorem headStep41_conv_blockStep2 :
    convWithTail headStep41_conv_block2 head42 headStep41_conv_result3 = headStep41_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep41_conv_blockStep2"
  out.flush

theorem headStep41_conv_input :
    ratioA = headStep41_conv_suffix0 := by
  decide +kernel

theorem headStep38_conv_blockStep4 :
    convWithTail headStep38_conv_block4 head39 headStep38_conv_result5 = headStep38_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep38_conv_blockStep4"
  out.flush

theorem headStep36_conv_blockStep0 :
    convWithTail headStep36_conv_block0 head37 headStep36_conv_result1 = headStep36_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep36_conv_blockStep0"
  out.flush

theorem headStep33_conv_blockStep2 :
    convWithTail headStep33_conv_block2 head34 headStep33_conv_result3 = headStep33_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep33_conv_blockStep2"
  out.flush

theorem headStep30_conv_blockStep4 :
    convWithTail headStep30_conv_block4 head31 headStep30_conv_result5 = headStep30_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep30_conv_blockStep4"
  out.flush

theorem headStep28_conv_blockStep0 :
    convWithTail headStep28_conv_block0 head29 headStep28_conv_result1 = headStep28_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep28_conv_blockStep0"
  out.flush

theorem headStep25_conv_blockStep2 :
    convWithTail headStep25_conv_block2 head26 headStep25_conv_result3 = headStep25_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep25_conv_blockStep2"
  out.flush

theorem headStep25_conv_input :
    ratioA = headStep25_conv_suffix0 := by
  decide +kernel

theorem headStep22_conv_blockStep4 :
    convWithTail headStep22_conv_block4 head23 headStep22_conv_result5 = headStep22_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep22_conv_blockStep4"
  out.flush

theorem headStep20_conv_blockStep0 :
    convWithTail headStep20_conv_block0 head21 headStep20_conv_result1 = headStep20_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep20_conv_blockStep0"
  out.flush

theorem headStep17_conv_blockStep2 :
    convWithTail headStep17_conv_block2 head18 headStep17_conv_result3 = headStep17_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep17_conv_blockStep2"
  out.flush

theorem headStep14_conv_blockStep4 :
    convWithTail headStep14_conv_block4 head15 headStep14_conv_result5 = headStep14_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep14_conv_blockStep4"
  out.flush

theorem headStep12_conv_blockStep0 :
    convWithTail headStep12_conv_block0 head13 headStep12_conv_result1 = headStep12_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep12_conv_blockStep0"
  out.flush

theorem headStep9_conv_blockStep2 :
    convWithTail headStep9_conv_block2 head10 headStep9_conv_result3 = headStep9_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep9_conv_blockStep2"
  out.flush

theorem headStep9_conv_input :
    ratioA = headStep9_conv_suffix0 := by
  decide +kernel

theorem headStep6_conv_blockStep4 :
    convWithTail headStep6_conv_block4 head7 headStep6_conv_result5 = headStep6_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep6_conv_blockStep4"
  out.flush

theorem headStep4_conv_blockStep0 :
    convWithTail headStep4_conv_block0 head5 headStep4_conv_result1 = headStep4_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep4_conv_blockStep0"
  out.flush

theorem headStep1_conv_blockStep2 :
    convWithTail headStep1_conv_block2 head2 headStep1_conv_result3 = headStep1_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep1_conv_blockStep2"
  out.flush

theorem powerStep12_conv_blockStep1 :
    convWithTail powerStep12_conv_block1 power11 powerStep12_conv_result2 = powerStep12_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep12_conv_blockStep1"
  out.flush

theorem powerStep13_conv_input :
    pI = powerStep13_conv_suffix0 := by
  decide +kernel

theorem powerStep17_conv_blockStep0 :
    convWithTail powerStep17_conv_block0 power16 powerStep17_conv_result1 = powerStep17_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep17_conv_blockStep0"
  out.flush

theorem seed_product_step_conv_blockStep7 :
    convWithTail seed_product_step_conv_block7 power17 seed_product_step_conv_result8 = seed_product_step_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached seed_product_step_conv_blockStep7"
  out.flush

end Grothe.HaagerupCanonical.Trace
