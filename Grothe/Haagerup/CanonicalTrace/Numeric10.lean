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

theorem coefficientStep64 :
    c64 * (((2*64+1)^2 : Nat) : Rat) / ((4*(64+1)*(64+2) : Nat) : Rat) = c65 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 66: reached coefficientStep64"
  out.flush

theorem differenceStep2_68 :
    d1_68 - d1_69 = d2_68 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 74: reached difference_order_2"
  out.flush

theorem correctionStep4_conv_blockStep16 :
    convWithTail correctionStep4_conv_block16 correction5 correctionStep4_conv_result17 = correctionStep4_conv_result16 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep16"
  out.flush

theorem correctionStep4_conv_blockStep1 :
    convWithTail correctionStep4_conv_block1 correction5 correctionStep4_conv_result2 = correctionStep4_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep1"
  out.flush

theorem correctionStep3_conv_blockStep12 :
    convWithTail correctionStep3_conv_block12 correction4 correctionStep3_conv_result13 = correctionStep3_conv_result12 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep12"
  out.flush

theorem correctionStep3_conv_input :
    ratioY = correctionStep3_conv_suffix0 := by
  decide +kernel

theorem correctionStep2_conv_blockStep14 :
    convWithTail correctionStep2_conv_block14 correction3 correctionStep2_conv_result15 = correctionStep2_conv_result14 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep14"
  out.flush

theorem correctionStep1_conv_blockStep16 :
    convWithTail correctionStep1_conv_block16 correction2 correctionStep1_conv_result17 = correctionStep1_conv_result16 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep16"
  out.flush

theorem correctionStep1_conv_blockStep0 :
    convWithTail correctionStep1_conv_block0 correction2 correctionStep1_conv_result1 = correctionStep1_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep0"
  out.flush

theorem correctionStep0_conv_blockStep2 :
    convWithTail correctionStep0_conv_block2 correction1 correctionStep0_conv_result3 = correctionStep0_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep2"
  out.flush

theorem headStep62_conv_blockStep5 :
    convWithTail headStep62_conv_block5 head63 headStep62_conv_result6 = headStep62_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep62_conv_blockStep5"
  out.flush

theorem headStep60_conv_blockStep1 :
    convWithTail headStep60_conv_block1 head61 headStep60_conv_result2 = headStep60_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep60_conv_blockStep1"
  out.flush

theorem headStep58_conv_input :
    ratioA = headStep58_conv_suffix0 := by
  decide +kernel

theorem headStep57_conv_blockStep3 :
    convWithTail headStep57_conv_block3 head58 headStep57_conv_result4 = headStep57_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep57_conv_blockStep3"
  out.flush

theorem headStep54_conv_blockStep5 :
    convWithTail headStep54_conv_block5 head55 headStep54_conv_result6 = headStep54_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep54_conv_blockStep5"
  out.flush

theorem headStep52_conv_blockStep1 :
    convWithTail headStep52_conv_block1 head53 headStep52_conv_result2 = headStep52_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep52_conv_blockStep1"
  out.flush

theorem headStep49_conv_blockStep3 :
    convWithTail headStep49_conv_block3 head50 headStep49_conv_result4 = headStep49_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep49_conv_blockStep3"
  out.flush

theorem headStep46_conv_blockStep5 :
    convWithTail headStep46_conv_block5 head47 headStep46_conv_result6 = headStep46_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep46_conv_blockStep5"
  out.flush

theorem headStep44_conv_blockStep1 :
    convWithTail headStep44_conv_block1 head45 headStep44_conv_result2 = headStep44_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep44_conv_blockStep1"
  out.flush

theorem headStep42_conv_input :
    ratioA = headStep42_conv_suffix0 := by
  decide +kernel

theorem headStep41_conv_blockStep3 :
    convWithTail headStep41_conv_block3 head42 headStep41_conv_result4 = headStep41_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep41_conv_blockStep3"
  out.flush

theorem headStep38_conv_blockStep5 :
    convWithTail headStep38_conv_block5 head39 headStep38_conv_result6 = headStep38_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep38_conv_blockStep5"
  out.flush

theorem headStep36_conv_blockStep1 :
    convWithTail headStep36_conv_block1 head37 headStep36_conv_result2 = headStep36_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep36_conv_blockStep1"
  out.flush

theorem headStep33_conv_blockStep3 :
    convWithTail headStep33_conv_block3 head34 headStep33_conv_result4 = headStep33_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep33_conv_blockStep3"
  out.flush

theorem headStep30_conv_blockStep5 :
    convWithTail headStep30_conv_block5 head31 headStep30_conv_result6 = headStep30_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep30_conv_blockStep5"
  out.flush

theorem headStep28_conv_blockStep1 :
    convWithTail headStep28_conv_block1 head29 headStep28_conv_result2 = headStep28_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep28_conv_blockStep1"
  out.flush

theorem headStep26_conv_input :
    ratioA = headStep26_conv_suffix0 := by
  decide +kernel

theorem headStep25_conv_blockStep3 :
    convWithTail headStep25_conv_block3 head26 headStep25_conv_result4 = headStep25_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep25_conv_blockStep3"
  out.flush

theorem headStep22_conv_blockStep5 :
    convWithTail headStep22_conv_block5 head23 headStep22_conv_result6 = headStep22_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep22_conv_blockStep5"
  out.flush

theorem headStep20_conv_blockStep1 :
    convWithTail headStep20_conv_block1 head21 headStep20_conv_result2 = headStep20_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep20_conv_blockStep1"
  out.flush

theorem headStep17_conv_blockStep3 :
    convWithTail headStep17_conv_block3 head18 headStep17_conv_result4 = headStep17_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep17_conv_blockStep3"
  out.flush

theorem headStep14_conv_blockStep5 :
    convWithTail headStep14_conv_block5 head15 headStep14_conv_result6 = headStep14_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep14_conv_blockStep5"
  out.flush

theorem headStep12_conv_blockStep1 :
    convWithTail headStep12_conv_block1 head13 headStep12_conv_result2 = headStep12_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep12_conv_blockStep1"
  out.flush

theorem headStep10_conv_input :
    ratioA = headStep10_conv_suffix0 := by
  decide +kernel

theorem headStep9_conv_blockStep3 :
    convWithTail headStep9_conv_block3 head10 headStep9_conv_result4 = headStep9_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep9_conv_blockStep3"
  out.flush

theorem headStep6_conv_blockStep5 :
    convWithTail headStep6_conv_block5 head7 headStep6_conv_result6 = headStep6_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep6_conv_blockStep5"
  out.flush

theorem headStep4_conv_blockStep1 :
    convWithTail headStep4_conv_block1 head5 headStep4_conv_result2 = headStep4_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep4_conv_blockStep1"
  out.flush

theorem headStep1_conv_blockStep3 :
    convWithTail headStep1_conv_block3 head2 headStep1_conv_result4 = headStep1_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep1_conv_blockStep3"
  out.flush

theorem powerStep12_conv_blockStep2 :
    convWithTail powerStep12_conv_block2 power11 powerStep12_conv_result3 = powerStep12_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep12_conv_blockStep2"
  out.flush

theorem powerStep12_conv_input :
    pI = powerStep12_conv_suffix0 := by
  decide +kernel

theorem powerStep17_conv_blockStep1 :
    convWithTail powerStep17_conv_block1 power16 powerStep17_conv_result2 = powerStep17_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep17_conv_blockStep1"
  out.flush

theorem seed_product_step_conv_blockStep8 :
    convWithTail seed_product_step_conv_block8 power17 seed_product_step_conv_result9 = seed_product_step_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached seed_product_step_conv_blockStep8"
  out.flush

end Grothe.HaagerupCanonical.Trace
