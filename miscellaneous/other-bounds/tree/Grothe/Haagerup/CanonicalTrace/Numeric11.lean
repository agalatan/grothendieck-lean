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

theorem coefficientStep5 :
    c5 * (((2*5+1)^2 : Nat) : Rat) / ((4*(5+1)*(5+2) : Nat) : Rat) = c6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 7: reached coefficientStep5"
  out.flush

theorem coefficientStep14 :
    c14 * (((2*14+1)^2 : Nat) : Rat) / ((4*(14+1)*(14+2) : Nat) : Rat) = c15 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 16: reached coefficientStep14"
  out.flush

theorem coefficientStep27 :
    c27 * (((2*27+1)^2 : Nat) : Rat) / ((4*(27+1)*(27+2) : Nat) : Rat) = c28 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 29: reached coefficientStep27"
  out.flush

theorem coefficientStep43 :
    c43 * (((2*43+1)^2 : Nat) : Rat) / ((4*(43+1)*(43+2) : Nat) : Rat) = c44 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 45: reached coefficientStep43"
  out.flush

theorem coefficientStep59 :
    c59 * (((2*59+1)^2 : Nat) : Rat) / ((4*(59+1)*(59+2) : Nat) : Rat) = c60 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 61: reached coefficientStep59"
  out.flush

theorem differenceStep1_65 :
    d0_65 - d0_66 = d1_65 := by
  decide +kernel

theorem differenceStep2_71 :
    d1_71 - d1_72 = d2_71 := by
  decide +kernel

theorem differenceStep4_70 :
    d3_70 - d3_71 = d4_70 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 80: reached difference_order_4"
  out.flush

theorem differenceStep8_64 :
    d7_64 - d7_65 = d8_64 := by
  decide +kernel

theorem ratioA_step :
    zeroI :: convI pI pI = ratioA := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 91: reached ratioA_step"
  out.flush

theorem correctionStep8_conv_blockStep11 :
    convWithTail correctionStep8_conv_block11 correction9 correctionStep8_conv_result12 = correctionStep8_conv_result11 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep8_conv_blockStep11"
  out.flush

theorem correctionStep7_conv_blockStep8 :
    convWithTail correctionStep7_conv_block8 correction8 correctionStep7_conv_result9 = correctionStep7_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep7_conv_blockStep8"
  out.flush

theorem correctionStep6_conv_blockStep13 :
    convWithTail correctionStep6_conv_block13 correction7 correctionStep6_conv_result14 = correctionStep6_conv_result13 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep6_conv_blockStep13"
  out.flush

theorem correctionStep5_conv_blockStep18 :
    convWithTail correctionStep5_conv_block18 correction6 correctionStep5_conv_result19 = correctionStep5_conv_result18 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep18"
  out.flush

theorem correctionStep5_conv_blockStep2 :
    convWithTail correctionStep5_conv_block2 correction6 correctionStep5_conv_result3 = correctionStep5_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep2"
  out.flush

theorem correctionStep4_conv_blockStep7 :
    convWithTail correctionStep4_conv_block7 correction5 correctionStep4_conv_result8 = correctionStep4_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep7"
  out.flush

theorem correctionStep4_conv_input :
    ratioY = correctionStep4_conv_suffix0 := by
  decide +kernel

theorem correctionStep3_conv_blockStep21 :
    convWithTail correctionStep3_conv_block21 correction4 correctionStep3_conv_result22 = correctionStep3_conv_result21 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep21"
  out.flush

theorem correctionStep3_conv_blockStep12 :
    convWithTail correctionStep3_conv_block12 correction4 correctionStep3_conv_result13 = correctionStep3_conv_result12 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep12"
  out.flush

theorem correctionStep2_conv_blockStep17 :
    convWithTail correctionStep2_conv_block17 correction3 correctionStep2_conv_result18 = correctionStep2_conv_result17 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep17"
  out.flush

theorem correctionStep2_conv_blockStep1 :
    convWithTail correctionStep2_conv_block1 correction3 correctionStep2_conv_result2 = correctionStep2_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep1"
  out.flush

theorem correctionStep1_conv_blockStep6 :
    convWithTail correctionStep1_conv_block6 correction2 correctionStep1_conv_result7 = correctionStep1_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep6"
  out.flush

theorem correctionStep0_conv_blockStep11 :
    convWithTail correctionStep0_conv_block11 correction1 correctionStep0_conv_result12 = correctionStep0_conv_result11 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep11"
  out.flush

theorem tail_step_conv_blockStep8 :
    convWithTail tail_step_conv_block8 correction0 tail_step_conv_result9 = tail_step_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached tail_step_conv_blockStep8"
  out.flush

theorem headStep62_conv_blockStep0 :
    convWithTail headStep62_conv_block0 head63 headStep62_conv_result1 = headStep62_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep62_conv_blockStep0"
  out.flush

theorem headStep62_conv_input :
    ratioA = headStep62_conv_suffix0 := by
  decide +kernel

theorem headStep60_conv_blockStep0 :
    convWithTail headStep60_conv_block0 head61 headStep60_conv_result1 = headStep60_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep60_conv_blockStep0"
  out.flush

theorem headStep58_conv_blockStep0 :
    convWithTail headStep58_conv_block0 head59 headStep58_conv_result1 = headStep58_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep58_conv_blockStep0"
  out.flush

theorem headStep56_conv_blockStep0 :
    convWithTail headStep56_conv_block0 head57 headStep56_conv_result1 = headStep56_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep56_conv_blockStep0"
  out.flush

theorem headStep54_conv_blockStep0 :
    convWithTail headStep54_conv_block0 head55 headStep54_conv_result1 = headStep54_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep54_conv_blockStep0"
  out.flush

theorem headStep52_conv_blockStep0 :
    convWithTail headStep52_conv_block0 head53 headStep52_conv_result1 = headStep52_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep52_conv_blockStep0"
  out.flush

theorem headStep50_conv_blockStep0 :
    convWithTail headStep50_conv_block0 head51 headStep50_conv_result1 = headStep50_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep50_conv_blockStep0"
  out.flush

theorem headStep49_conv_blockStep8 :
    convWithTail headStep49_conv_block8 head50 headStep49_conv_result9 = headStep49_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep49_conv_blockStep8"
  out.flush

theorem headStep48_conv_blockStep0 :
    convWithTail headStep48_conv_block0 head49 headStep48_conv_result1 = headStep48_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep48_conv_blockStep0"
  out.flush

theorem headStep46_conv_blockStep0 :
    convWithTail headStep46_conv_block0 head47 headStep46_conv_result1 = headStep46_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep46_conv_blockStep0"
  out.flush

theorem headStep46_conv_input :
    ratioA = headStep46_conv_suffix0 := by
  decide +kernel

theorem headStep44_conv_blockStep0 :
    convWithTail headStep44_conv_block0 head45 headStep44_conv_result1 = headStep44_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep44_conv_blockStep0"
  out.flush

theorem headStep42_conv_blockStep0 :
    convWithTail headStep42_conv_block0 head43 headStep42_conv_result1 = headStep42_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep42_conv_blockStep0"
  out.flush

theorem headStep40_conv_blockStep0 :
    convWithTail headStep40_conv_block0 head41 headStep40_conv_result1 = headStep40_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep40_conv_blockStep0"
  out.flush

theorem headStep38_conv_blockStep0 :
    convWithTail headStep38_conv_block0 head39 headStep38_conv_result1 = headStep38_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep38_conv_blockStep0"
  out.flush

theorem headStep36_conv_blockStep0 :
    convWithTail headStep36_conv_block0 head37 headStep36_conv_result1 = headStep36_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep36_conv_blockStep0"
  out.flush

theorem headStep34_conv_blockStep0 :
    convWithTail headStep34_conv_block0 head35 headStep34_conv_result1 = headStep34_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep34_conv_blockStep0"
  out.flush

theorem headStep33_conv_blockStep8 :
    convWithTail headStep33_conv_block8 head34 headStep33_conv_result9 = headStep33_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep33_conv_blockStep8"
  out.flush

theorem headStep32_conv_blockStep0 :
    convWithTail headStep32_conv_block0 head33 headStep32_conv_result1 = headStep32_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep32_conv_blockStep0"
  out.flush

theorem headStep30_conv_blockStep0 :
    convWithTail headStep30_conv_block0 head31 headStep30_conv_result1 = headStep30_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep30_conv_blockStep0"
  out.flush

theorem headStep30_conv_input :
    ratioA = headStep30_conv_suffix0 := by
  decide +kernel

theorem headStep28_conv_blockStep0 :
    convWithTail headStep28_conv_block0 head29 headStep28_conv_result1 = headStep28_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep28_conv_blockStep0"
  out.flush

theorem headStep26_conv_blockStep0 :
    convWithTail headStep26_conv_block0 head27 headStep26_conv_result1 = headStep26_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep26_conv_blockStep0"
  out.flush

theorem headStep24_conv_blockStep0 :
    convWithTail headStep24_conv_block0 head25 headStep24_conv_result1 = headStep24_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep24_conv_blockStep0"
  out.flush

theorem headStep22_conv_blockStep0 :
    convWithTail headStep22_conv_block0 head23 headStep22_conv_result1 = headStep22_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep22_conv_blockStep0"
  out.flush

theorem headStep20_conv_blockStep0 :
    convWithTail headStep20_conv_block0 head21 headStep20_conv_result1 = headStep20_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep20_conv_blockStep0"
  out.flush

theorem headStep18_conv_blockStep0 :
    convWithTail headStep18_conv_block0 head19 headStep18_conv_result1 = headStep18_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep18_conv_blockStep0"
  out.flush

theorem headStep17_conv_blockStep8 :
    convWithTail headStep17_conv_block8 head18 headStep17_conv_result9 = headStep17_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep17_conv_blockStep8"
  out.flush

theorem headStep16_conv_blockStep0 :
    convWithTail headStep16_conv_block0 head17 headStep16_conv_result1 = headStep16_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep16_conv_blockStep0"
  out.flush

theorem headStep14_conv_blockStep0 :
    convWithTail headStep14_conv_block0 head15 headStep14_conv_result1 = headStep14_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep14_conv_blockStep0"
  out.flush

theorem headStep14_conv_input :
    ratioA = headStep14_conv_suffix0 := by
  decide +kernel

theorem headStep12_conv_blockStep0 :
    convWithTail headStep12_conv_block0 head13 headStep12_conv_result1 = headStep12_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep12_conv_blockStep0"
  out.flush

theorem headStep10_conv_blockStep0 :
    convWithTail headStep10_conv_block0 head11 headStep10_conv_result1 = headStep10_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep10_conv_blockStep0"
  out.flush

theorem headStep8_conv_blockStep0 :
    convWithTail headStep8_conv_block0 head9 headStep8_conv_result1 = headStep8_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep8_conv_blockStep0"
  out.flush

theorem headStep6_conv_blockStep0 :
    convWithTail headStep6_conv_block0 head7 headStep6_conv_result1 = headStep6_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep6_conv_blockStep0"
  out.flush

theorem headStep4_conv_blockStep0 :
    convWithTail headStep4_conv_block0 head5 headStep4_conv_result1 = headStep4_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep4_conv_blockStep0"
  out.flush

theorem headStep2_conv_blockStep0 :
    convWithTail headStep2_conv_block0 head3 headStep2_conv_result1 = headStep2_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep2_conv_blockStep0"
  out.flush

theorem headStep1_conv_blockStep8 :
    convWithTail headStep1_conv_block8 head2 headStep1_conv_result9 = headStep1_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep1_conv_blockStep8"
  out.flush

theorem headStep0_conv_blockStep0 :
    convWithTail headStep0_conv_block0 head1 headStep0_conv_result1 = headStep0_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep0_conv_blockStep0"
  out.flush

theorem completed_literal_ok :
    decide (absSum (addL completedI [negI (ofRatI slopeQ)]) ≤ ofRatLo prefixCapQ) = true := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 169: reached completed_literal_ok"
  out.flush

theorem powerStep4 :
    convI pI power3 = power4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 174: reached powerStep4"
  out.flush

theorem powerStep7_conv_blockStep0 :
    convWithTail powerStep7_conv_block0 power6 powerStep7_conv_result1 = powerStep7_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep7_conv_blockStep0"
  out.flush

theorem powerStep13_conv_blockStep1 :
    convWithTail powerStep13_conv_block1 power12 powerStep13_conv_result2 = powerStep13_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep13_conv_blockStep1"
  out.flush

theorem seed_product_step_conv_blockStep1 :
    convWithTail seed_product_step_conv_block1 power17 seed_product_step_conv_result2 = seed_product_step_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached seed_product_step_conv_blockStep1"
  out.flush

theorem seed_literal_ok :
    decide (absSum seedI ≤ ofRatLo seedCapQ) = true := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 189: reached seed_literal_ok"
  out.flush

theorem inverseProduct_step_conv_blockStep9 :
    convWithTail inverseProduct_step_conv_block9 inverseD inverseProduct_step_conv_result10 = inverseProduct_step_conv_result9 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached inverseProduct_step_conv_blockStep9"
  out.flush

end Grothe.HaagerupCanonical.Trace
