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

theorem coefficientStep1 :
    c1 * (((2*1+1)^2 : Nat) : Rat) / ((4*(1+1)*(1+2) : Nat) : Rat) = c2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 3: reached coefficientStep1"
  out.flush

theorem coefficientStep6 :
    c6 * (((2*6+1)^2 : Nat) : Rat) / ((4*(6+1)*(6+2) : Nat) : Rat) = c7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 8: reached coefficientStep6"
  out.flush

theorem coefficientStep16 :
    c16 * (((2*16+1)^2 : Nat) : Rat) / ((4*(16+1)*(16+2) : Nat) : Rat) = c17 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 18: reached coefficientStep16"
  out.flush

theorem coefficientStep32 :
    c32 * (((2*32+1)^2 : Nat) : Rat) / ((4*(32+1)*(32+2) : Nat) : Rat) = c33 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 34: reached coefficientStep32"
  out.flush

theorem coefficientStep48 :
    c48 * (((2*48+1)^2 : Nat) : Rat) / ((4*(48+1)*(48+2) : Nat) : Rat) = c49 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 50: reached coefficientStep48"
  out.flush

theorem coefficientStep64 :
    c64 * (((2*64+1)^2 : Nat) : Rat) / ((4*(64+1)*(64+2) : Nat) : Rat) = c65 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 66: reached coefficientStep64"
  out.flush

theorem differenceStep2_64 :
    d1_64 - d1_65 = d2_64 := by
  decide +kernel

theorem differenceStep4_67 :
    d3_67 - d3_68 = d4_67 := by
  decide +kernel

theorem ratioY_step_conv_blockStep5 :
    convWithTail ratioY_step_conv_block5 ratioA ratioY_step_conv_result6 = ratioY_step_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached ratioY_step_conv_blockStep5"
  out.flush

theorem correctionStep7 :
    (addL [ofRatI d7_64] (convI ratioY correction8)).take 172 = correction7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 88: reached correctionStep7"
  out.flush

theorem correctionStep6_conv_blockStep19 :
    convWithTail correctionStep6_conv_block19 correction7 correctionStep6_conv_result20 = correctionStep6_conv_result19 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep6_conv_blockStep19"
  out.flush

theorem correctionStep6_conv_blockStep4 :
    convWithTail correctionStep6_conv_block4 correction7 correctionStep6_conv_result5 = correctionStep6_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep6_conv_blockStep4"
  out.flush

theorem correctionStep5_conv_blockStep6 :
    convWithTail correctionStep5_conv_block6 correction6 correctionStep5_conv_result7 = correctionStep5_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep6"
  out.flush

theorem correctionStep4_conv_blockStep11 :
    convWithTail correctionStep4_conv_block11 correction5 correctionStep4_conv_result12 = correctionStep4_conv_result11 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep11"
  out.flush

theorem correctionStep3_conv_blockStep16 :
    convWithTail correctionStep3_conv_block16 correction4 correctionStep3_conv_result17 = correctionStep3_conv_result16 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep16"
  out.flush

theorem correctionStep3_conv_blockStep0 :
    convWithTail correctionStep3_conv_block0 correction4 correctionStep3_conv_result1 = correctionStep3_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep0"
  out.flush

theorem correctionStep2_conv_blockStep5 :
    convWithTail correctionStep2_conv_block5 correction3 correctionStep2_conv_result6 = correctionStep2_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep5"
  out.flush

theorem correctionStep1_conv_blockStep10 :
    convWithTail correctionStep1_conv_block10 correction2 correctionStep1_conv_result11 = correctionStep1_conv_result10 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep10"
  out.flush

theorem correctionStep0_conv_blockStep15 :
    convWithTail correctionStep0_conv_block15 correction1 correctionStep0_conv_result16 = correctionStep0_conv_result15 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep15"
  out.flush

theorem tail_step_conv_blockStep12 :
    convWithTail tail_step_conv_block12 correction0 tail_step_conv_result13 = tail_step_conv_result12 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached tail_step_conv_blockStep12"
  out.flush

theorem headStep63_conv_blockStep1 :
    convWithTail headStep63_conv_block1 head64 headStep63_conv_result2 = headStep63_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep63_conv_blockStep1"
  out.flush

theorem headStep62_conv_blockStep4 :
    convWithTail headStep62_conv_block4 head63 headStep62_conv_result5 = headStep62_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep62_conv_blockStep4"
  out.flush

theorem headStep60_conv_blockStep4 :
    convWithTail headStep60_conv_block4 head61 headStep60_conv_result5 = headStep60_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep60_conv_blockStep4"
  out.flush

theorem headStep58_conv_blockStep4 :
    convWithTail headStep58_conv_block4 head59 headStep58_conv_result5 = headStep58_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep58_conv_blockStep4"
  out.flush

theorem headStep56_conv_blockStep4 :
    convWithTail headStep56_conv_block4 head57 headStep56_conv_result5 = headStep56_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep56_conv_blockStep4"
  out.flush

theorem headStep54_conv_blockStep4 :
    convWithTail headStep54_conv_block4 head55 headStep54_conv_result5 = headStep54_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep54_conv_blockStep4"
  out.flush

theorem headStep52_conv_blockStep8 :
    convWithTail headStep52_conv_block8 head53 headStep52_conv_result9 = headStep52_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep52_conv_blockStep8"
  out.flush

theorem headStep52_conv_blockStep4 :
    convWithTail headStep52_conv_block4 head53 headStep52_conv_result5 = headStep52_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep52_conv_blockStep4"
  out.flush

theorem headStep50_conv_blockStep4 :
    convWithTail headStep50_conv_block4 head51 headStep50_conv_result5 = headStep50_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep50_conv_blockStep4"
  out.flush

theorem headStep49_conv_input :
    ratioA = headStep49_conv_suffix0 := by
  decide +kernel

theorem headStep48_conv_blockStep4 :
    convWithTail headStep48_conv_block4 head49 headStep48_conv_result5 = headStep48_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep48_conv_blockStep4"
  out.flush

theorem headStep46_conv_blockStep4 :
    convWithTail headStep46_conv_block4 head47 headStep46_conv_result5 = headStep46_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep46_conv_blockStep4"
  out.flush

theorem headStep44_conv_blockStep4 :
    convWithTail headStep44_conv_block4 head45 headStep44_conv_result5 = headStep44_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep44_conv_blockStep4"
  out.flush

theorem headStep42_conv_blockStep4 :
    convWithTail headStep42_conv_block4 head43 headStep42_conv_result5 = headStep42_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep42_conv_blockStep4"
  out.flush

theorem headStep40_conv_blockStep4 :
    convWithTail headStep40_conv_block4 head41 headStep40_conv_result5 = headStep40_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep40_conv_blockStep4"
  out.flush

theorem headStep38_conv_blockStep4 :
    convWithTail headStep38_conv_block4 head39 headStep38_conv_result5 = headStep38_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep38_conv_blockStep4"
  out.flush

theorem headStep36_conv_blockStep8 :
    convWithTail headStep36_conv_block8 head37 headStep36_conv_result9 = headStep36_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep36_conv_blockStep8"
  out.flush

theorem headStep36_conv_blockStep4 :
    convWithTail headStep36_conv_block4 head37 headStep36_conv_result5 = headStep36_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep36_conv_blockStep4"
  out.flush

theorem headStep34_conv_blockStep4 :
    convWithTail headStep34_conv_block4 head35 headStep34_conv_result5 = headStep34_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep34_conv_blockStep4"
  out.flush

theorem headStep33_conv_input :
    ratioA = headStep33_conv_suffix0 := by
  decide +kernel

theorem headStep32_conv_blockStep4 :
    convWithTail headStep32_conv_block4 head33 headStep32_conv_result5 = headStep32_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep32_conv_blockStep4"
  out.flush

theorem headStep30_conv_blockStep4 :
    convWithTail headStep30_conv_block4 head31 headStep30_conv_result5 = headStep30_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep30_conv_blockStep4"
  out.flush

theorem headStep28_conv_blockStep4 :
    convWithTail headStep28_conv_block4 head29 headStep28_conv_result5 = headStep28_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep28_conv_blockStep4"
  out.flush

theorem headStep26_conv_blockStep4 :
    convWithTail headStep26_conv_block4 head27 headStep26_conv_result5 = headStep26_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep26_conv_blockStep4"
  out.flush

theorem headStep24_conv_blockStep4 :
    convWithTail headStep24_conv_block4 head25 headStep24_conv_result5 = headStep24_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep24_conv_blockStep4"
  out.flush

theorem headStep22_conv_blockStep4 :
    convWithTail headStep22_conv_block4 head23 headStep22_conv_result5 = headStep22_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep22_conv_blockStep4"
  out.flush

theorem headStep20_conv_blockStep8 :
    convWithTail headStep20_conv_block8 head21 headStep20_conv_result9 = headStep20_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep20_conv_blockStep8"
  out.flush

theorem headStep20_conv_blockStep4 :
    convWithTail headStep20_conv_block4 head21 headStep20_conv_result5 = headStep20_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep20_conv_blockStep4"
  out.flush

theorem headStep18_conv_blockStep4 :
    convWithTail headStep18_conv_block4 head19 headStep18_conv_result5 = headStep18_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep18_conv_blockStep4"
  out.flush

theorem headStep17_conv_input :
    ratioA = headStep17_conv_suffix0 := by
  decide +kernel

theorem headStep16_conv_blockStep4 :
    convWithTail headStep16_conv_block4 head17 headStep16_conv_result5 = headStep16_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep16_conv_blockStep4"
  out.flush

theorem headStep14_conv_blockStep4 :
    convWithTail headStep14_conv_block4 head15 headStep14_conv_result5 = headStep14_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep14_conv_blockStep4"
  out.flush

theorem headStep12_conv_blockStep4 :
    convWithTail headStep12_conv_block4 head13 headStep12_conv_result5 = headStep12_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep12_conv_blockStep4"
  out.flush

theorem headStep10_conv_blockStep4 :
    convWithTail headStep10_conv_block4 head11 headStep10_conv_result5 = headStep10_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep10_conv_blockStep4"
  out.flush

theorem headStep8_conv_blockStep4 :
    convWithTail headStep8_conv_block4 head9 headStep8_conv_result5 = headStep8_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep8_conv_blockStep4"
  out.flush

theorem headStep6_conv_blockStep4 :
    convWithTail headStep6_conv_block4 head7 headStep6_conv_result5 = headStep6_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep6_conv_blockStep4"
  out.flush

theorem headStep4_conv_blockStep8 :
    convWithTail headStep4_conv_block8 head5 headStep4_conv_result9 = headStep4_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep4_conv_blockStep8"
  out.flush

theorem headStep4_conv_blockStep4 :
    convWithTail headStep4_conv_block4 head5 headStep4_conv_result5 = headStep4_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep4_conv_blockStep4"
  out.flush

theorem headStep2_conv_blockStep4 :
    convWithTail headStep2_conv_block4 head3 headStep2_conv_result5 = headStep2_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep2_conv_blockStep4"
  out.flush

theorem headStep1_conv_input :
    ratioA = headStep1_conv_suffix0 := by
  decide +kernel

theorem headStep0_conv_blockStep4 :
    convWithTail headStep0_conv_block4 head1 headStep0_conv_result5 = headStep0_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep0_conv_blockStep4"
  out.flush

theorem powerStep8_conv_blockStep0 :
    convWithTail powerStep8_conv_block0 power7 powerStep8_conv_result1 = powerStep8_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep8_conv_blockStep0"
  out.flush

theorem powerStep12_conv_blockStep0 :
    convWithTail powerStep12_conv_block0 power11 powerStep12_conv_result1 = powerStep12_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep12_conv_blockStep0"
  out.flush

theorem powerStep15_conv_blockStep3 :
    convWithTail powerStep15_conv_block3 power14 powerStep15_conv_result4 = powerStep15_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep15_conv_blockStep3"
  out.flush

theorem powerStep16_conv_input :
    pI = powerStep16_conv_suffix0 := by
  decide +kernel

theorem seed_product_step_conv_blockStep9 :
    convWithTail seed_product_step_conv_block9 power17 seed_product_step_conv_result10 = seed_product_step_conv_result9 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached seed_product_step_conv_blockStep9"
  out.flush

theorem inverseProduct_step_conv_blockStep2 :
    convWithTail inverseProduct_step_conv_block2 inverseD inverseProduct_step_conv_result3 = inverseProduct_step_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached inverseProduct_step_conv_blockStep2"
  out.flush

end Grothe.HaagerupCanonical.Trace
