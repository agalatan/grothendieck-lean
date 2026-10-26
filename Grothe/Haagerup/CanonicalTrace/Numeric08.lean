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

theorem coefficientStep2 :
    c2 * (((2*2+1)^2 : Nat) : Rat) / ((4*(2+1)*(2+2) : Nat) : Rat) = c3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 4: reached coefficientStep2"
  out.flush

theorem coefficientStep7 :
    c7 * (((2*7+1)^2 : Nat) : Rat) / ((4*(7+1)*(7+2) : Nat) : Rat) = c8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 9: reached coefficientStep7"
  out.flush

theorem coefficientStep17 :
    c17 * (((2*17+1)^2 : Nat) : Rat) / ((4*(17+1)*(17+2) : Nat) : Rat) = c18 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 19: reached coefficientStep17"
  out.flush

theorem coefficientStep33 :
    c33 * (((2*33+1)^2 : Nat) : Rat) / ((4*(33+1)*(33+2) : Nat) : Rat) = c34 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 35: reached coefficientStep33"
  out.flush

theorem coefficientStep49 :
    c49 * (((2*49+1)^2 : Nat) : Rat) / ((4*(49+1)*(49+2) : Nat) : Rat) = c50 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 51: reached coefficientStep49"
  out.flush

theorem coefficientStep65 :
    c65 * (((2*65+1)^2 : Nat) : Rat) / ((4*(65+1)*(65+2) : Nat) : Rat) = c66 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 67: reached coefficientStep65"
  out.flush

theorem differenceStep2_65 :
    d1_65 - d1_66 = d2_65 := by
  decide +kernel

theorem differenceStep4_68 :
    d3_68 - d3_69 = d4_68 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 78: reached difference_order_4"
  out.flush

theorem ratioY_step_conv_blockStep4 :
    convWithTail ratioY_step_conv_block4 ratioA ratioY_step_conv_result5 = ratioY_step_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached ratioY_step_conv_blockStep4"
  out.flush

theorem correctionStep6_conv_blockStep18 :
    convWithTail correctionStep6_conv_block18 correction7 correctionStep6_conv_result19 = correctionStep6_conv_result18 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep6_conv_blockStep18"
  out.flush

theorem correctionStep6_conv_blockStep3 :
    convWithTail correctionStep6_conv_block3 correction7 correctionStep6_conv_result4 = correctionStep6_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep6_conv_blockStep3"
  out.flush

theorem correctionStep6_conv_input :
    ratioY = correctionStep6_conv_suffix0 := by
  decide +kernel

theorem correctionStep5_conv_blockStep13 :
    convWithTail correctionStep5_conv_block13 correction6 correctionStep5_conv_result14 = correctionStep5_conv_result13 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep13"
  out.flush

theorem correctionStep4_conv_blockStep18 :
    convWithTail correctionStep4_conv_block18 correction5 correctionStep4_conv_result19 = correctionStep4_conv_result18 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep18"
  out.flush

theorem correctionStep4_conv_blockStep2 :
    convWithTail correctionStep4_conv_block2 correction5 correctionStep4_conv_result3 = correctionStep4_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep2"
  out.flush

theorem correctionStep3_conv_blockStep7 :
    convWithTail correctionStep3_conv_block7 correction4 correctionStep3_conv_result8 = correctionStep3_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep7"
  out.flush

theorem correctionStep2_conv_blockStep12 :
    convWithTail correctionStep2_conv_block12 correction3 correctionStep2_conv_result13 = correctionStep2_conv_result12 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep12"
  out.flush

theorem correctionStep1_conv_blockStep17 :
    convWithTail correctionStep1_conv_block17 correction2 correctionStep1_conv_result18 = correctionStep1_conv_result17 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep17"
  out.flush

theorem correctionStep1_conv_blockStep1 :
    convWithTail correctionStep1_conv_block1 correction2 correctionStep1_conv_result2 = correctionStep1_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep1"
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

theorem headStep63_conv_blockStep0 :
    convWithTail headStep63_conv_block0 head64 headStep63_conv_result1 = headStep63_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep63_conv_blockStep0"
  out.flush

theorem headStep61_conv_blockStep3 :
    convWithTail headStep61_conv_block3 head62 headStep61_conv_result4 = headStep61_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep61_conv_blockStep3"
  out.flush

theorem headStep59_conv_blockStep3 :
    convWithTail headStep59_conv_block3 head60 headStep59_conv_result4 = headStep59_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep59_conv_blockStep3"
  out.flush

theorem headStep57_conv_blockStep3 :
    convWithTail headStep57_conv_block3 head58 headStep57_conv_result4 = headStep57_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep57_conv_blockStep3"
  out.flush

theorem headStep55_conv_blockStep3 :
    convWithTail headStep55_conv_block3 head56 headStep55_conv_result4 = headStep55_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep55_conv_blockStep3"
  out.flush

theorem headStep53_conv_blockStep3 :
    convWithTail headStep53_conv_block3 head54 headStep53_conv_result4 = headStep53_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep53_conv_blockStep3"
  out.flush

theorem headStep51_conv_blockStep8 :
    convWithTail headStep51_conv_block8 head52 headStep51_conv_result9 = headStep51_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep51_conv_blockStep8"
  out.flush

theorem headStep51_conv_blockStep3 :
    convWithTail headStep51_conv_block3 head52 headStep51_conv_result4 = headStep51_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep51_conv_blockStep3"
  out.flush

theorem headStep49_conv_blockStep3 :
    convWithTail headStep49_conv_block3 head50 headStep49_conv_result4 = headStep49_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep49_conv_blockStep3"
  out.flush

theorem headStep48_conv_input :
    ratioA = headStep48_conv_suffix0 := by
  decide +kernel

theorem headStep47_conv_blockStep3 :
    convWithTail headStep47_conv_block3 head48 headStep47_conv_result4 = headStep47_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep47_conv_blockStep3"
  out.flush

theorem headStep45_conv_blockStep3 :
    convWithTail headStep45_conv_block3 head46 headStep45_conv_result4 = headStep45_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep45_conv_blockStep3"
  out.flush

theorem headStep43_conv_blockStep3 :
    convWithTail headStep43_conv_block3 head44 headStep43_conv_result4 = headStep43_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep43_conv_blockStep3"
  out.flush

theorem headStep41_conv_blockStep3 :
    convWithTail headStep41_conv_block3 head42 headStep41_conv_result4 = headStep41_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep41_conv_blockStep3"
  out.flush

theorem headStep39_conv_blockStep3 :
    convWithTail headStep39_conv_block3 head40 headStep39_conv_result4 = headStep39_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep39_conv_blockStep3"
  out.flush

theorem headStep37_conv_blockStep3 :
    convWithTail headStep37_conv_block3 head38 headStep37_conv_result4 = headStep37_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep37_conv_blockStep3"
  out.flush

theorem headStep35_conv_blockStep8 :
    convWithTail headStep35_conv_block8 head36 headStep35_conv_result9 = headStep35_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep35_conv_blockStep8"
  out.flush

theorem headStep35_conv_blockStep3 :
    convWithTail headStep35_conv_block3 head36 headStep35_conv_result4 = headStep35_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep35_conv_blockStep3"
  out.flush

theorem headStep33_conv_blockStep3 :
    convWithTail headStep33_conv_block3 head34 headStep33_conv_result4 = headStep33_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep33_conv_blockStep3"
  out.flush

theorem headStep32_conv_input :
    ratioA = headStep32_conv_suffix0 := by
  decide +kernel

theorem headStep31_conv_blockStep3 :
    convWithTail headStep31_conv_block3 head32 headStep31_conv_result4 = headStep31_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep31_conv_blockStep3"
  out.flush

theorem headStep29_conv_blockStep3 :
    convWithTail headStep29_conv_block3 head30 headStep29_conv_result4 = headStep29_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep29_conv_blockStep3"
  out.flush

theorem headStep27_conv_blockStep3 :
    convWithTail headStep27_conv_block3 head28 headStep27_conv_result4 = headStep27_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep27_conv_blockStep3"
  out.flush

theorem headStep25_conv_blockStep3 :
    convWithTail headStep25_conv_block3 head26 headStep25_conv_result4 = headStep25_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep25_conv_blockStep3"
  out.flush

theorem headStep23_conv_blockStep3 :
    convWithTail headStep23_conv_block3 head24 headStep23_conv_result4 = headStep23_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep23_conv_blockStep3"
  out.flush

theorem headStep21_conv_blockStep3 :
    convWithTail headStep21_conv_block3 head22 headStep21_conv_result4 = headStep21_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep21_conv_blockStep3"
  out.flush

theorem headStep19_conv_blockStep8 :
    convWithTail headStep19_conv_block8 head20 headStep19_conv_result9 = headStep19_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep19_conv_blockStep8"
  out.flush

theorem headStep19_conv_blockStep3 :
    convWithTail headStep19_conv_block3 head20 headStep19_conv_result4 = headStep19_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep19_conv_blockStep3"
  out.flush

theorem headStep17_conv_blockStep3 :
    convWithTail headStep17_conv_block3 head18 headStep17_conv_result4 = headStep17_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep17_conv_blockStep3"
  out.flush

theorem headStep16_conv_input :
    ratioA = headStep16_conv_suffix0 := by
  decide +kernel

theorem headStep15_conv_blockStep3 :
    convWithTail headStep15_conv_block3 head16 headStep15_conv_result4 = headStep15_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep15_conv_blockStep3"
  out.flush

theorem headStep13_conv_blockStep3 :
    convWithTail headStep13_conv_block3 head14 headStep13_conv_result4 = headStep13_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep13_conv_blockStep3"
  out.flush

theorem headStep11_conv_blockStep3 :
    convWithTail headStep11_conv_block3 head12 headStep11_conv_result4 = headStep11_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep11_conv_blockStep3"
  out.flush

theorem headStep9_conv_blockStep3 :
    convWithTail headStep9_conv_block3 head10 headStep9_conv_result4 = headStep9_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep9_conv_blockStep3"
  out.flush

theorem headStep7_conv_blockStep3 :
    convWithTail headStep7_conv_block3 head8 headStep7_conv_result4 = headStep7_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep7_conv_blockStep3"
  out.flush

theorem headStep5_conv_blockStep3 :
    convWithTail headStep5_conv_block3 head6 headStep5_conv_result4 = headStep5_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep5_conv_blockStep3"
  out.flush

theorem headStep3_conv_blockStep8 :
    convWithTail headStep3_conv_block8 head4 headStep3_conv_result9 = headStep3_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep3_conv_blockStep8"
  out.flush

theorem headStep3_conv_blockStep3 :
    convWithTail headStep3_conv_block3 head4 headStep3_conv_result4 = headStep3_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep3_conv_blockStep3"
  out.flush

theorem headStep1_conv_blockStep3 :
    convWithTail headStep1_conv_block3 head2 headStep1_conv_result4 = headStep1_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep1_conv_blockStep3"
  out.flush

theorem headStep0_conv_input :
    ratioA = headStep0_conv_suffix0 := by
  decide +kernel

theorem powerStep9_conv_blockStep3 :
    convWithTail powerStep9_conv_block3 power8 powerStep9_conv_result4 = powerStep9_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep9_conv_blockStep3"
  out.flush

theorem powerStep12_conv_blockStep3 :
    convWithTail powerStep12_conv_block3 power11 powerStep12_conv_result4 = powerStep12_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep12_conv_blockStep3"
  out.flush

theorem powerStep14_conv_blockStep2 :
    convWithTail powerStep14_conv_block2 power13 powerStep14_conv_result3 = powerStep14_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep14_conv_blockStep2"
  out.flush

theorem powerStep17_conv_input :
    pI = powerStep17_conv_suffix0 := by
  decide +kernel

theorem seed_product_step_conv_blockStep4 :
    convWithTail seed_product_step_conv_block4 power17 seed_product_step_conv_result5 = seed_product_step_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached seed_product_step_conv_blockStep4"
  out.flush

theorem inverseProduct_step_conv_blockStep1 :
    convWithTail inverseProduct_step_conv_block1 inverseD inverseProduct_step_conv_result2 = inverseProduct_step_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached inverseProduct_step_conv_blockStep1"
  out.flush

end Grothe.HaagerupCanonical.Trace
