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

theorem coefficientStep35 :
    c35 * (((2*35+1)^2 : Nat) : Rat) / ((4*(35+1)*(35+2) : Nat) : Rat) = c36 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 37: reached coefficientStep35"
  out.flush

theorem coefficientStep51 :
    c51 * (((2*51+1)^2 : Nat) : Rat) / ((4*(51+1)*(51+2) : Nat) : Rat) = c52 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 53: reached coefficientStep51"
  out.flush

theorem coefficientStep67 :
    c67 * (((2*67+1)^2 : Nat) : Rat) / ((4*(67+1)*(67+2) : Nat) : Rat) = c68 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 69: reached coefficientStep67"
  out.flush

theorem differenceStep2_67 :
    d1_67 - d1_68 = d2_67 := by
  decide +kernel

theorem differenceStep5_65 :
    d4_65 - d4_66 = d5_65 := by
  decide +kernel

theorem ratioY_step_conv_blockStep9 :
    convWithTail ratioY_step_conv_block9 ratioA ratioY_step_conv_result10 = ratioY_step_conv_result9 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached ratioY_step_conv_blockStep9"
  out.flush

theorem correctionStep6_conv_blockStep6 :
    convWithTail correctionStep6_conv_block6 correction7 correctionStep6_conv_result7 = correctionStep6_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep6_conv_blockStep6"
  out.flush

theorem correctionStep5_conv_blockStep9 :
    convWithTail correctionStep5_conv_block9 correction6 correctionStep5_conv_result10 = correctionStep5_conv_result9 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep9"
  out.flush

theorem correctionStep4_conv_blockStep14 :
    convWithTail correctionStep4_conv_block14 correction5 correctionStep4_conv_result15 = correctionStep4_conv_result14 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep14"
  out.flush

theorem correctionStep4_conv_input :
    ratioY = correctionStep4_conv_suffix0 := by
  decide +kernel

theorem correctionStep3_conv_blockStep19 :
    convWithTail correctionStep3_conv_block19 correction4 correctionStep3_conv_result20 = correctionStep3_conv_result19 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep19"
  out.flush

theorem correctionStep3_conv_blockStep3 :
    convWithTail correctionStep3_conv_block3 correction4 correctionStep3_conv_result4 = correctionStep3_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep3"
  out.flush

theorem correctionStep2_conv_blockStep8 :
    convWithTail correctionStep2_conv_block8 correction3 correctionStep2_conv_result9 = correctionStep2_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep8"
  out.flush

theorem correctionStep1_conv_blockStep13 :
    convWithTail correctionStep1_conv_block13 correction2 correctionStep1_conv_result14 = correctionStep1_conv_result13 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep13"
  out.flush

theorem correctionStep0_conv_blockStep18 :
    convWithTail correctionStep0_conv_block18 correction1 correctionStep0_conv_result19 = correctionStep0_conv_result18 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep18"
  out.flush

theorem correctionStep0_conv_blockStep2 :
    convWithTail correctionStep0_conv_block2 correction1 correctionStep0_conv_result3 = correctionStep0_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep2"
  out.flush

theorem headStep62_conv_blockStep7 :
    convWithTail headStep62_conv_block7 head63 headStep62_conv_result8 = headStep62_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep62_conv_blockStep7"
  out.flush

theorem headStep62_conv_input :
    ratioA = headStep62_conv_suffix0 := by
  decide +kernel

theorem headStep60_conv_blockStep7 :
    convWithTail headStep60_conv_block7 head61 headStep60_conv_result8 = headStep60_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep60_conv_blockStep7"
  out.flush

theorem headStep58_conv_blockStep7 :
    convWithTail headStep58_conv_block7 head59 headStep58_conv_result8 = headStep58_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep58_conv_blockStep7"
  out.flush

theorem headStep56_conv_blockStep7 :
    convWithTail headStep56_conv_block7 head57 headStep56_conv_result8 = headStep56_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep56_conv_blockStep7"
  out.flush

theorem headStep55_conv_blockStep8 :
    convWithTail headStep55_conv_block8 head56 headStep55_conv_result9 = headStep55_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep55_conv_blockStep8"
  out.flush

theorem headStep54_conv_blockStep7 :
    convWithTail headStep54_conv_block7 head55 headStep54_conv_result8 = headStep54_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep54_conv_blockStep7"
  out.flush

theorem headStep52_conv_blockStep7 :
    convWithTail headStep52_conv_block7 head53 headStep52_conv_result8 = headStep52_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep52_conv_blockStep7"
  out.flush

theorem headStep50_conv_blockStep7 :
    convWithTail headStep50_conv_block7 head51 headStep50_conv_result8 = headStep50_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep50_conv_blockStep7"
  out.flush

theorem headStep48_conv_blockStep7 :
    convWithTail headStep48_conv_block7 head49 headStep48_conv_result8 = headStep48_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep48_conv_blockStep7"
  out.flush

theorem headStep46_conv_blockStep7 :
    convWithTail headStep46_conv_block7 head47 headStep46_conv_result8 = headStep46_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep46_conv_blockStep7"
  out.flush

theorem headStep46_conv_input :
    ratioA = headStep46_conv_suffix0 := by
  decide +kernel

theorem headStep44_conv_blockStep7 :
    convWithTail headStep44_conv_block7 head45 headStep44_conv_result8 = headStep44_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep44_conv_blockStep7"
  out.flush

theorem headStep42_conv_blockStep7 :
    convWithTail headStep42_conv_block7 head43 headStep42_conv_result8 = headStep42_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep42_conv_blockStep7"
  out.flush

theorem headStep40_conv_blockStep7 :
    convWithTail headStep40_conv_block7 head41 headStep40_conv_result8 = headStep40_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep40_conv_blockStep7"
  out.flush

theorem headStep39_conv_blockStep8 :
    convWithTail headStep39_conv_block8 head40 headStep39_conv_result9 = headStep39_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep39_conv_blockStep8"
  out.flush

theorem headStep38_conv_blockStep7 :
    convWithTail headStep38_conv_block7 head39 headStep38_conv_result8 = headStep38_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep38_conv_blockStep7"
  out.flush

theorem headStep36_conv_blockStep7 :
    convWithTail headStep36_conv_block7 head37 headStep36_conv_result8 = headStep36_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep36_conv_blockStep7"
  out.flush

theorem headStep34_conv_blockStep7 :
    convWithTail headStep34_conv_block7 head35 headStep34_conv_result8 = headStep34_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep34_conv_blockStep7"
  out.flush

theorem headStep32_conv_blockStep7 :
    convWithTail headStep32_conv_block7 head33 headStep32_conv_result8 = headStep32_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep32_conv_blockStep7"
  out.flush

theorem headStep30_conv_blockStep7 :
    convWithTail headStep30_conv_block7 head31 headStep30_conv_result8 = headStep30_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep30_conv_blockStep7"
  out.flush

theorem headStep30_conv_input :
    ratioA = headStep30_conv_suffix0 := by
  decide +kernel

theorem headStep28_conv_blockStep7 :
    convWithTail headStep28_conv_block7 head29 headStep28_conv_result8 = headStep28_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep28_conv_blockStep7"
  out.flush

theorem headStep26_conv_blockStep7 :
    convWithTail headStep26_conv_block7 head27 headStep26_conv_result8 = headStep26_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep26_conv_blockStep7"
  out.flush

theorem headStep24_conv_blockStep7 :
    convWithTail headStep24_conv_block7 head25 headStep24_conv_result8 = headStep24_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep24_conv_blockStep7"
  out.flush

theorem headStep23_conv_blockStep8 :
    convWithTail headStep23_conv_block8 head24 headStep23_conv_result9 = headStep23_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep23_conv_blockStep8"
  out.flush

theorem headStep22_conv_blockStep7 :
    convWithTail headStep22_conv_block7 head23 headStep22_conv_result8 = headStep22_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep22_conv_blockStep7"
  out.flush

theorem headStep20_conv_blockStep7 :
    convWithTail headStep20_conv_block7 head21 headStep20_conv_result8 = headStep20_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep20_conv_blockStep7"
  out.flush

theorem headStep18_conv_blockStep7 :
    convWithTail headStep18_conv_block7 head19 headStep18_conv_result8 = headStep18_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep18_conv_blockStep7"
  out.flush

theorem headStep16_conv_blockStep7 :
    convWithTail headStep16_conv_block7 head17 headStep16_conv_result8 = headStep16_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep16_conv_blockStep7"
  out.flush

theorem headStep14_conv_blockStep7 :
    convWithTail headStep14_conv_block7 head15 headStep14_conv_result8 = headStep14_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep14_conv_blockStep7"
  out.flush

theorem headStep14_conv_input :
    ratioA = headStep14_conv_suffix0 := by
  decide +kernel

theorem headStep12_conv_blockStep7 :
    convWithTail headStep12_conv_block7 head13 headStep12_conv_result8 = headStep12_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep12_conv_blockStep7"
  out.flush

theorem headStep10_conv_blockStep7 :
    convWithTail headStep10_conv_block7 head11 headStep10_conv_result8 = headStep10_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep10_conv_blockStep7"
  out.flush

theorem headStep8_conv_blockStep7 :
    convWithTail headStep8_conv_block7 head9 headStep8_conv_result8 = headStep8_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep8_conv_blockStep7"
  out.flush

theorem headStep7_conv_blockStep8 :
    convWithTail headStep7_conv_block8 head8 headStep7_conv_result9 = headStep7_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep7_conv_blockStep8"
  out.flush

theorem headStep6_conv_blockStep7 :
    convWithTail headStep6_conv_block7 head7 headStep6_conv_result8 = headStep6_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep6_conv_blockStep7"
  out.flush

theorem headStep4_conv_blockStep7 :
    convWithTail headStep4_conv_block7 head5 headStep4_conv_result8 = headStep4_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep4_conv_blockStep7"
  out.flush

theorem headStep2_conv_blockStep7 :
    convWithTail headStep2_conv_block7 head3 headStep2_conv_result8 = headStep2_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep2_conv_blockStep7"
  out.flush

theorem headStep0_conv_blockStep7 :
    convWithTail headStep0_conv_block7 head1 headStep0_conv_result8 = headStep0_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep0_conv_blockStep7"
  out.flush

theorem completed_literal_ok :
    decide (absSum (addL completedI [negI (ofRatI slopeQ)]) ≤ ofRatLo prefixCapQ) = true := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 162: reached completed_literal_ok"
  out.flush

theorem powerStep7_conv_blockStep1 :
    convWithTail powerStep7_conv_block1 power6 powerStep7_conv_result2 = powerStep7_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep7_conv_blockStep1"
  out.flush

theorem powerStep8_conv_blockStep4 :
    convWithTail powerStep8_conv_block4 power7 powerStep8_conv_result5 = powerStep8_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep8_conv_blockStep4"
  out.flush

theorem powerStep8_conv_blockStep3 :
    convWithTail powerStep8_conv_block3 power7 powerStep8_conv_result4 = powerStep8_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep8_conv_blockStep3"
  out.flush

theorem powerStep10_conv_blockStep0 :
    convWithTail powerStep10_conv_block0 power9 powerStep10_conv_result1 = powerStep10_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep10_conv_blockStep0"
  out.flush

theorem powerStep17_conv_blockStep3 :
    convWithTail powerStep17_conv_block3 power16 powerStep17_conv_result4 = powerStep17_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep17_conv_blockStep3"
  out.flush

theorem powerStep17_conv_blockStep1 :
    convWithTail powerStep17_conv_block1 power16 powerStep17_conv_result2 = powerStep17_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep17_conv_blockStep1"
  out.flush

theorem seed_literal_ok :
    decide (absSum seedI ≤ ofRatLo seedCapQ) = true := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 182: reached seed_literal_ok"
  out.flush

theorem inverseProduct_step_conv_blockStep7 :
    convWithTail inverseProduct_step_conv_block7 inverseD inverseProduct_step_conv_result8 = inverseProduct_step_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached inverseProduct_step_conv_blockStep7"
  out.flush

end Grothe.HaagerupCanonical.Trace
