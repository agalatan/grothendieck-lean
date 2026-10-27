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

theorem coefficientStep13 :
    c13 * (((2*13+1)^2 : Nat) : Rat) / ((4*(13+1)*(13+2) : Nat) : Rat) = c14 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 15: reached coefficientStep13"
  out.flush

theorem coefficientStep28 :
    c28 * (((2*28+1)^2 : Nat) : Rat) / ((4*(28+1)*(28+2) : Nat) : Rat) = c29 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 30: reached coefficientStep28"
  out.flush

theorem coefficientStep44 :
    c44 * (((2*44+1)^2 : Nat) : Rat) / ((4*(44+1)*(44+2) : Nat) : Rat) = c45 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 46: reached coefficientStep44"
  out.flush

theorem coefficientStep60 :
    c60 * (((2*60+1)^2 : Nat) : Rat) / ((4*(60+1)*(60+2) : Nat) : Rat) = c61 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 62: reached coefficientStep60"
  out.flush

theorem differenceStep1_68 :
    d0_68 - d0_69 = d1_68 := by
  decide +kernel

theorem differenceStep3_69 :
    d2_69 - d2_70 = d3_69 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 77: reached difference_order_3"
  out.flush

theorem coefficient_literal_ok :
    c64 ≤ 1/10000 ∧ d8_64 ≤ 51/1000000000000000 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 83: reached coefficient_literal_ok"
  out.flush

theorem ratioY_step_conv_blockStep8 :
    convWithTail ratioY_step_conv_block8 ratioA ratioY_step_conv_result9 = ratioY_step_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached ratioY_step_conv_blockStep8"
  out.flush

theorem correctionStep6_conv_blockStep21 :
    convWithTail correctionStep6_conv_block21 correction7 correctionStep6_conv_result22 = correctionStep6_conv_result21 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep6_conv_blockStep21"
  out.flush

theorem correctionStep6_conv_blockStep14 :
    convWithTail correctionStep6_conv_block14 correction7 correctionStep6_conv_result15 = correctionStep6_conv_result14 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep6_conv_blockStep14"
  out.flush

theorem correctionStep5_conv_blockStep20 :
    convWithTail correctionStep5_conv_block20 correction6 correctionStep5_conv_result21 = correctionStep5_conv_result20 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep20"
  out.flush

theorem correctionStep5_conv_blockStep4 :
    convWithTail correctionStep5_conv_block4 correction6 correctionStep5_conv_result5 = correctionStep5_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep4"
  out.flush

theorem correctionStep4_conv_blockStep9 :
    convWithTail correctionStep4_conv_block9 correction5 correctionStep4_conv_result10 = correctionStep4_conv_result9 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep9"
  out.flush

theorem correctionStep3_conv_blockStep14 :
    convWithTail correctionStep3_conv_block14 correction4 correctionStep3_conv_result15 = correctionStep3_conv_result14 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep14"
  out.flush

theorem correctionStep2_conv_blockStep19 :
    convWithTail correctionStep2_conv_block19 correction3 correctionStep2_conv_result20 = correctionStep2_conv_result19 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep19"
  out.flush

theorem correctionStep2_conv_blockStep3 :
    convWithTail correctionStep2_conv_block3 correction3 correctionStep2_conv_result4 = correctionStep2_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep3"
  out.flush

theorem correctionStep1_conv_blockStep8 :
    convWithTail correctionStep1_conv_block8 correction2 correctionStep1_conv_result9 = correctionStep1_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep8"
  out.flush

theorem correctionStep0_conv_blockStep13 :
    convWithTail correctionStep0_conv_block13 correction1 correctionStep0_conv_result14 = correctionStep0_conv_result13 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep13"
  out.flush

theorem tail_step_conv_blockStep10 :
    convWithTail tail_step_conv_block10 correction0 tail_step_conv_result11 = tail_step_conv_result10 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached tail_step_conv_blockStep10"
  out.flush

theorem headStep63_conv_blockStep5 :
    convWithTail headStep63_conv_block5 head64 headStep63_conv_result6 = headStep63_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep63_conv_blockStep5"
  out.flush

theorem headStep62_conv_blockStep2 :
    convWithTail headStep62_conv_block2 head63 headStep62_conv_result3 = headStep62_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep62_conv_blockStep2"
  out.flush

theorem headStep60_conv_blockStep2 :
    convWithTail headStep60_conv_block2 head61 headStep60_conv_result3 = headStep60_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep60_conv_blockStep2"
  out.flush

theorem headStep58_conv_blockStep2 :
    convWithTail headStep58_conv_block2 head59 headStep58_conv_result3 = headStep58_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep58_conv_blockStep2"
  out.flush

theorem headStep56_conv_blockStep2 :
    convWithTail headStep56_conv_block2 head57 headStep56_conv_result3 = headStep56_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep56_conv_blockStep2"
  out.flush

theorem headStep54_conv_blockStep8 :
    convWithTail headStep54_conv_block8 head55 headStep54_conv_result9 = headStep54_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep54_conv_blockStep8"
  out.flush

theorem headStep54_conv_blockStep2 :
    convWithTail headStep54_conv_block2 head55 headStep54_conv_result3 = headStep54_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep54_conv_blockStep2"
  out.flush

theorem headStep53_conv_input :
    ratioA = headStep53_conv_suffix0 := by
  decide +kernel

theorem headStep52_conv_blockStep2 :
    convWithTail headStep52_conv_block2 head53 headStep52_conv_result3 = headStep52_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep52_conv_blockStep2"
  out.flush

theorem headStep50_conv_blockStep2 :
    convWithTail headStep50_conv_block2 head51 headStep50_conv_result3 = headStep50_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep50_conv_blockStep2"
  out.flush

theorem headStep48_conv_blockStep2 :
    convWithTail headStep48_conv_block2 head49 headStep48_conv_result3 = headStep48_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep48_conv_blockStep2"
  out.flush

theorem headStep46_conv_blockStep2 :
    convWithTail headStep46_conv_block2 head47 headStep46_conv_result3 = headStep46_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep46_conv_blockStep2"
  out.flush

theorem headStep44_conv_blockStep2 :
    convWithTail headStep44_conv_block2 head45 headStep44_conv_result3 = headStep44_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep44_conv_blockStep2"
  out.flush

theorem headStep42_conv_blockStep2 :
    convWithTail headStep42_conv_block2 head43 headStep42_conv_result3 = headStep42_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep42_conv_blockStep2"
  out.flush

theorem headStep40_conv_blockStep2 :
    convWithTail headStep40_conv_block2 head41 headStep40_conv_result3 = headStep40_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep40_conv_blockStep2"
  out.flush

theorem headStep38_conv_blockStep8 :
    convWithTail headStep38_conv_block8 head39 headStep38_conv_result9 = headStep38_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep38_conv_blockStep8"
  out.flush

theorem headStep38_conv_blockStep2 :
    convWithTail headStep38_conv_block2 head39 headStep38_conv_result3 = headStep38_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep38_conv_blockStep2"
  out.flush

theorem headStep37_conv_input :
    ratioA = headStep37_conv_suffix0 := by
  decide +kernel

theorem headStep36_conv_blockStep2 :
    convWithTail headStep36_conv_block2 head37 headStep36_conv_result3 = headStep36_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep36_conv_blockStep2"
  out.flush

theorem headStep34_conv_blockStep2 :
    convWithTail headStep34_conv_block2 head35 headStep34_conv_result3 = headStep34_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep34_conv_blockStep2"
  out.flush

theorem headStep32_conv_blockStep2 :
    convWithTail headStep32_conv_block2 head33 headStep32_conv_result3 = headStep32_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep32_conv_blockStep2"
  out.flush

theorem headStep30_conv_blockStep2 :
    convWithTail headStep30_conv_block2 head31 headStep30_conv_result3 = headStep30_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep30_conv_blockStep2"
  out.flush

theorem headStep28_conv_blockStep2 :
    convWithTail headStep28_conv_block2 head29 headStep28_conv_result3 = headStep28_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep28_conv_blockStep2"
  out.flush

theorem headStep26_conv_blockStep2 :
    convWithTail headStep26_conv_block2 head27 headStep26_conv_result3 = headStep26_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep26_conv_blockStep2"
  out.flush

theorem headStep24_conv_blockStep2 :
    convWithTail headStep24_conv_block2 head25 headStep24_conv_result3 = headStep24_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep24_conv_blockStep2"
  out.flush

theorem headStep22_conv_blockStep8 :
    convWithTail headStep22_conv_block8 head23 headStep22_conv_result9 = headStep22_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep22_conv_blockStep8"
  out.flush

theorem headStep22_conv_blockStep2 :
    convWithTail headStep22_conv_block2 head23 headStep22_conv_result3 = headStep22_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep22_conv_blockStep2"
  out.flush

theorem headStep21_conv_input :
    ratioA = headStep21_conv_suffix0 := by
  decide +kernel

theorem headStep20_conv_blockStep2 :
    convWithTail headStep20_conv_block2 head21 headStep20_conv_result3 = headStep20_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep20_conv_blockStep2"
  out.flush

theorem headStep18_conv_blockStep2 :
    convWithTail headStep18_conv_block2 head19 headStep18_conv_result3 = headStep18_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep18_conv_blockStep2"
  out.flush

theorem headStep16_conv_blockStep2 :
    convWithTail headStep16_conv_block2 head17 headStep16_conv_result3 = headStep16_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep16_conv_blockStep2"
  out.flush

theorem headStep14_conv_blockStep2 :
    convWithTail headStep14_conv_block2 head15 headStep14_conv_result3 = headStep14_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep14_conv_blockStep2"
  out.flush

theorem headStep12_conv_blockStep2 :
    convWithTail headStep12_conv_block2 head13 headStep12_conv_result3 = headStep12_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep12_conv_blockStep2"
  out.flush

theorem headStep10_conv_blockStep2 :
    convWithTail headStep10_conv_block2 head11 headStep10_conv_result3 = headStep10_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep10_conv_blockStep2"
  out.flush

theorem headStep8_conv_blockStep2 :
    convWithTail headStep8_conv_block2 head9 headStep8_conv_result3 = headStep8_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep8_conv_blockStep2"
  out.flush

theorem headStep6_conv_blockStep8 :
    convWithTail headStep6_conv_block8 head7 headStep6_conv_result9 = headStep6_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep6_conv_blockStep8"
  out.flush

theorem headStep6_conv_blockStep2 :
    convWithTail headStep6_conv_block2 head7 headStep6_conv_result3 = headStep6_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep6_conv_blockStep2"
  out.flush

theorem headStep5_conv_input :
    ratioA = headStep5_conv_suffix0 := by
  decide +kernel

theorem headStep4_conv_blockStep2 :
    convWithTail headStep4_conv_block2 head5 headStep4_conv_result3 = headStep4_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep4_conv_blockStep2"
  out.flush

theorem headStep2_conv_blockStep2 :
    convWithTail headStep2_conv_block2 head3 headStep2_conv_result3 = headStep2_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep2_conv_blockStep2"
  out.flush

theorem headStep0_conv_blockStep2 :
    convWithTail headStep0_conv_block2 head1 headStep0_conv_result3 = headStep0_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep0_conv_blockStep2"
  out.flush

theorem powerStep3 :
    convI pI power2 = power3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 166: reached powerStep3"
  out.flush

theorem powerStep6_conv_blockStep3 :
    convWithTail powerStep6_conv_block3 power5 powerStep6_conv_result4 = powerStep6_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep6_conv_blockStep3"
  out.flush

theorem powerStep12_conv_input :
    pI = powerStep12_conv_suffix0 := by
  decide +kernel

theorem powerStep17_conv_blockStep2 :
    convWithTail powerStep17_conv_block2 power16 powerStep17_conv_result3 = powerStep17_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep17_conv_blockStep2"
  out.flush

theorem powerStep17_conv_blockStep0 :
    convWithTail powerStep17_conv_block0 power16 powerStep17_conv_result1 = powerStep17_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep17_conv_blockStep0"
  out.flush

theorem inverseProduct_step_conv_blockStep5 :
    convWithTail inverseProduct_step_conv_block5 inverseD inverseProduct_step_conv_result6 = inverseProduct_step_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached inverseProduct_step_conv_blockStep5"
  out.flush

end Grothe.HaagerupCanonical.Trace
