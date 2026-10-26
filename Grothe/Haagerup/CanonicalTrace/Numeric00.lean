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

theorem coefficientStep56 :
    c56 * (((2*56+1)^2 : Nat) : Rat) / ((4*(56+1)*(56+2) : Nat) : Rat) = c57 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 58: reached coefficientStep56"
  out.flush

theorem differenceStep1_66 :
    d0_66 - d0_67 = d1_66 := by
  decide +kernel

theorem differenceStep5_64 :
    d4_64 - d4_65 = d5_64 := by
  decide +kernel

theorem ratioY_step :
    (convI rI ratioA).map negI = ratioY := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 83: reached ratioY_step"
  out.flush

theorem correctionStep4_conv_blockStep4 :
    convWithTail correctionStep4_conv_block4 correction5 correctionStep4_conv_result5 = correctionStep4_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep4"
  out.flush

theorem correctionStep3_conv_blockStep4 :
    convWithTail correctionStep3_conv_block4 correction4 correctionStep3_conv_result5 = correctionStep3_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep4"
  out.flush

theorem correctionStep2_conv_blockStep6 :
    convWithTail correctionStep2_conv_block6 correction3 correctionStep2_conv_result7 = correctionStep2_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep6"
  out.flush

theorem correctionStep1_conv_blockStep18 :
    convWithTail correctionStep1_conv_block18 correction2 correctionStep1_conv_result19 = correctionStep1_conv_result18 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep18"
  out.flush

theorem correctionStep1_conv_blockStep8 :
    convWithTail correctionStep1_conv_block8 correction2 correctionStep1_conv_result9 = correctionStep1_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep8"
  out.flush

theorem correctionStep0_conv_blockStep10 :
    convWithTail correctionStep0_conv_block10 correction1 correctionStep0_conv_result11 = correctionStep0_conv_result10 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep10"
  out.flush

theorem tail_step_conv_blockStep7 :
    convWithTail tail_step_conv_block7 correction0 tail_step_conv_result8 = tail_step_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached tail_step_conv_blockStep7"
  out.flush

theorem headStep63_conv_blockStep2 :
    convWithTail headStep63_conv_block2 head64 headStep63_conv_result3 = headStep63_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep63_conv_blockStep2"
  out.flush

theorem headStep61_conv_blockStep3 :
    convWithTail headStep61_conv_block3 head62 headStep61_conv_result4 = headStep61_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep61_conv_blockStep3"
  out.flush

theorem headStep58_conv_blockStep5 :
    convWithTail headStep58_conv_block5 head59 headStep58_conv_result6 = headStep58_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep58_conv_blockStep5"
  out.flush

theorem headStep56_conv_blockStep1 :
    convWithTail headStep56_conv_block1 head57 headStep56_conv_result2 = headStep56_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep56_conv_blockStep1"
  out.flush

theorem headStep53_conv_blockStep3 :
    convWithTail headStep53_conv_block3 head54 headStep53_conv_result4 = headStep53_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep53_conv_blockStep3"
  out.flush

theorem headStep50_conv_blockStep5 :
    convWithTail headStep50_conv_block5 head51 headStep50_conv_result6 = headStep50_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep50_conv_blockStep5"
  out.flush

theorem headStep50_conv_input :
    ratioA = headStep50_conv_suffix0 := by
  decide +kernel

theorem headStep48_conv_blockStep1 :
    convWithTail headStep48_conv_block1 head49 headStep48_conv_result2 = headStep48_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep48_conv_blockStep1"
  out.flush

theorem headStep45_conv_blockStep3 :
    convWithTail headStep45_conv_block3 head46 headStep45_conv_result4 = headStep45_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep45_conv_blockStep3"
  out.flush

theorem headStep42_conv_blockStep5 :
    convWithTail headStep42_conv_block5 head43 headStep42_conv_result6 = headStep42_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep42_conv_blockStep5"
  out.flush

theorem headStep40_conv_blockStep1 :
    convWithTail headStep40_conv_block1 head41 headStep40_conv_result2 = headStep40_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep40_conv_blockStep1"
  out.flush

theorem headStep37_conv_blockStep3 :
    convWithTail headStep37_conv_block3 head38 headStep37_conv_result4 = headStep37_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep37_conv_blockStep3"
  out.flush

theorem headStep34_conv_blockStep5 :
    convWithTail headStep34_conv_block5 head35 headStep34_conv_result6 = headStep34_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep34_conv_blockStep5"
  out.flush

theorem headStep34_conv_input :
    ratioA = headStep34_conv_suffix0 := by
  decide +kernel

theorem headStep32_conv_blockStep1 :
    convWithTail headStep32_conv_block1 head33 headStep32_conv_result2 = headStep32_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep32_conv_blockStep1"
  out.flush

theorem headStep29_conv_blockStep3 :
    convWithTail headStep29_conv_block3 head30 headStep29_conv_result4 = headStep29_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep29_conv_blockStep3"
  out.flush

theorem headStep26_conv_blockStep5 :
    convWithTail headStep26_conv_block5 head27 headStep26_conv_result6 = headStep26_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep26_conv_blockStep5"
  out.flush

theorem headStep24_conv_blockStep1 :
    convWithTail headStep24_conv_block1 head25 headStep24_conv_result2 = headStep24_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep24_conv_blockStep1"
  out.flush

theorem headStep21_conv_blockStep3 :
    convWithTail headStep21_conv_block3 head22 headStep21_conv_result4 = headStep21_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep21_conv_blockStep3"
  out.flush

theorem headStep18_conv_blockStep5 :
    convWithTail headStep18_conv_block5 head19 headStep18_conv_result6 = headStep18_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep18_conv_blockStep5"
  out.flush

theorem headStep18_conv_input :
    ratioA = headStep18_conv_suffix0 := by
  decide +kernel

theorem headStep16_conv_blockStep1 :
    convWithTail headStep16_conv_block1 head17 headStep16_conv_result2 = headStep16_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep16_conv_blockStep1"
  out.flush

theorem headStep13_conv_blockStep3 :
    convWithTail headStep13_conv_block3 head14 headStep13_conv_result4 = headStep13_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep13_conv_blockStep3"
  out.flush

theorem headStep10_conv_blockStep5 :
    convWithTail headStep10_conv_block5 head11 headStep10_conv_result6 = headStep10_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep10_conv_blockStep5"
  out.flush

theorem headStep8_conv_blockStep1 :
    convWithTail headStep8_conv_block1 head9 headStep8_conv_result2 = headStep8_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep8_conv_blockStep1"
  out.flush

theorem headStep5_conv_blockStep3 :
    convWithTail headStep5_conv_block3 head6 headStep5_conv_result4 = headStep5_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep5_conv_blockStep3"
  out.flush

theorem headStep2_conv_blockStep5 :
    convWithTail headStep2_conv_block5 head3 headStep2_conv_result6 = headStep2_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep2_conv_blockStep5"
  out.flush

theorem headStep2_conv_input :
    ratioA = headStep2_conv_suffix0 := by
  decide +kernel

theorem headStep0_conv_blockStep1 :
    convWithTail headStep0_conv_block1 head1 headStep0_conv_result2 = headStep0_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep0_conv_blockStep1"
  out.flush

theorem powerStep14_conv_blockStep1 :
    convWithTail powerStep14_conv_block1 power13 powerStep14_conv_result2 = powerStep14_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep14_conv_blockStep1"
  out.flush

theorem inverseD_step :
    addL [ofRatI 1] (ratioA.map negI) = inverseD := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 177: reached inverseD_step"
  out.flush

end Grothe.HaagerupCanonical.Trace
