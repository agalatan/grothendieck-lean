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

theorem coefficientStep9 :
    c9 * (((2*9+1)^2 : Nat) : Rat) / ((4*(9+1)*(9+2) : Nat) : Rat) = c10 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 11: reached coefficientStep9"
  out.flush

theorem coefficientStep20 :
    c20 * (((2*20+1)^2 : Nat) : Rat) / ((4*(20+1)*(20+2) : Nat) : Rat) = c21 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 22: reached coefficientStep20"
  out.flush

theorem coefficientStep36 :
    c36 * (((2*36+1)^2 : Nat) : Rat) / ((4*(36+1)*(36+2) : Nat) : Rat) = c37 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 38: reached coefficientStep36"
  out.flush

theorem coefficientStep52 :
    c52 * (((2*52+1)^2 : Nat) : Rat) / ((4*(52+1)*(52+2) : Nat) : Rat) = c53 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 54: reached coefficientStep52"
  out.flush

theorem coefficientStep68 :
    c68 * (((2*68+1)^2 : Nat) : Rat) / ((4*(68+1)*(68+2) : Nat) : Rat) = c69 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 70: reached coefficientStep68"
  out.flush

theorem differenceStep2_68 :
    d1_68 - d1_69 = d2_68 := by
  decide +kernel

theorem differenceStep5_66 :
    d4_66 - d4_67 = d5_66 := by
  decide +kernel

theorem correctionStep6_conv_blockStep8 :
    convWithTail correctionStep6_conv_block8 correction7 correctionStep6_conv_result9 = correctionStep6_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep6_conv_blockStep8"
  out.flush

theorem correctionStep5_conv_blockStep14 :
    convWithTail correctionStep5_conv_block14 correction6 correctionStep5_conv_result15 = correctionStep5_conv_result14 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep14"
  out.flush

theorem correctionStep4_conv_blockStep21 :
    convWithTail correctionStep4_conv_block21 correction5 correctionStep4_conv_result22 = correctionStep4_conv_result21 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep21"
  out.flush

theorem correctionStep4_conv_blockStep19 :
    convWithTail correctionStep4_conv_block19 correction5 correctionStep4_conv_result20 = correctionStep4_conv_result19 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep19"
  out.flush

theorem correctionStep4_conv_blockStep3 :
    convWithTail correctionStep4_conv_block3 correction5 correctionStep4_conv_result4 = correctionStep4_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep3"
  out.flush

theorem correctionStep3_conv_blockStep8 :
    convWithTail correctionStep3_conv_block8 correction4 correctionStep3_conv_result9 = correctionStep3_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep8"
  out.flush

theorem correctionStep3_conv_input :
    ratioY = correctionStep3_conv_suffix0 := by
  decide +kernel

theorem correctionStep2_conv_blockStep13 :
    convWithTail correctionStep2_conv_block13 correction3 correctionStep2_conv_result14 = correctionStep2_conv_result13 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep13"
  out.flush

theorem correctionStep1_conv_blockStep18 :
    convWithTail correctionStep1_conv_block18 correction2 correctionStep1_conv_result19 = correctionStep1_conv_result18 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep18"
  out.flush

theorem correctionStep1_conv_blockStep2 :
    convWithTail correctionStep1_conv_block2 correction2 correctionStep1_conv_result3 = correctionStep1_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep2"
  out.flush

theorem correctionStep0_conv_blockStep7 :
    convWithTail correctionStep0_conv_block7 correction1 correctionStep0_conv_result8 = correctionStep0_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep7"
  out.flush

theorem tail_step_conv_blockStep4 :
    convWithTail tail_step_conv_block4 correction0 tail_step_conv_result5 = tail_step_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached tail_step_conv_blockStep4"
  out.flush

theorem headStep61_conv_blockStep8 :
    convWithTail headStep61_conv_block8 head62 headStep61_conv_result9 = headStep61_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep61_conv_blockStep8"
  out.flush

theorem headStep61_conv_blockStep4 :
    convWithTail headStep61_conv_block4 head62 headStep61_conv_result5 = headStep61_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep61_conv_blockStep4"
  out.flush

theorem headStep61_conv_input :
    ratioA = headStep61_conv_suffix0 := by
  decide +kernel

theorem headStep59_conv_blockStep8 :
    convWithTail headStep59_conv_block8 head60 headStep59_conv_result9 = headStep59_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep59_conv_blockStep8"
  out.flush

theorem headStep59_conv_blockStep4 :
    convWithTail headStep59_conv_block4 head60 headStep59_conv_result5 = headStep59_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep59_conv_blockStep4"
  out.flush

theorem headStep57_conv_blockStep4 :
    convWithTail headStep57_conv_block4 head58 headStep57_conv_result5 = headStep57_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep57_conv_blockStep4"
  out.flush

theorem headStep55_conv_blockStep4 :
    convWithTail headStep55_conv_block4 head56 headStep55_conv_result5 = headStep55_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep55_conv_blockStep4"
  out.flush

theorem headStep53_conv_blockStep4 :
    convWithTail headStep53_conv_block4 head54 headStep53_conv_result5 = headStep53_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep53_conv_blockStep4"
  out.flush

theorem headStep51_conv_blockStep4 :
    convWithTail headStep51_conv_block4 head52 headStep51_conv_result5 = headStep51_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep51_conv_blockStep4"
  out.flush

theorem headStep49_conv_blockStep4 :
    convWithTail headStep49_conv_block4 head50 headStep49_conv_result5 = headStep49_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep49_conv_blockStep4"
  out.flush

theorem headStep47_conv_blockStep4 :
    convWithTail headStep47_conv_block4 head48 headStep47_conv_result5 = headStep47_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep47_conv_blockStep4"
  out.flush

theorem headStep45_conv_blockStep4 :
    convWithTail headStep45_conv_block4 head46 headStep45_conv_result5 = headStep45_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep45_conv_blockStep4"
  out.flush

theorem headStep45_conv_input :
    ratioA = headStep45_conv_suffix0 := by
  decide +kernel

theorem headStep43_conv_blockStep8 :
    convWithTail headStep43_conv_block8 head44 headStep43_conv_result9 = headStep43_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep43_conv_blockStep8"
  out.flush

theorem headStep43_conv_blockStep4 :
    convWithTail headStep43_conv_block4 head44 headStep43_conv_result5 = headStep43_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep43_conv_blockStep4"
  out.flush

theorem headStep41_conv_blockStep4 :
    convWithTail headStep41_conv_block4 head42 headStep41_conv_result5 = headStep41_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep41_conv_blockStep4"
  out.flush

theorem headStep39_conv_blockStep4 :
    convWithTail headStep39_conv_block4 head40 headStep39_conv_result5 = headStep39_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep39_conv_blockStep4"
  out.flush

theorem headStep37_conv_blockStep4 :
    convWithTail headStep37_conv_block4 head38 headStep37_conv_result5 = headStep37_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep37_conv_blockStep4"
  out.flush

theorem headStep35_conv_blockStep4 :
    convWithTail headStep35_conv_block4 head36 headStep35_conv_result5 = headStep35_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep35_conv_blockStep4"
  out.flush

theorem headStep33_conv_blockStep4 :
    convWithTail headStep33_conv_block4 head34 headStep33_conv_result5 = headStep33_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep33_conv_blockStep4"
  out.flush

theorem headStep31_conv_blockStep4 :
    convWithTail headStep31_conv_block4 head32 headStep31_conv_result5 = headStep31_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep31_conv_blockStep4"
  out.flush

theorem headStep29_conv_blockStep4 :
    convWithTail headStep29_conv_block4 head30 headStep29_conv_result5 = headStep29_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep29_conv_blockStep4"
  out.flush

theorem headStep29_conv_input :
    ratioA = headStep29_conv_suffix0 := by
  decide +kernel

theorem headStep27_conv_blockStep8 :
    convWithTail headStep27_conv_block8 head28 headStep27_conv_result9 = headStep27_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep27_conv_blockStep8"
  out.flush

theorem headStep27_conv_blockStep4 :
    convWithTail headStep27_conv_block4 head28 headStep27_conv_result5 = headStep27_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep27_conv_blockStep4"
  out.flush

theorem headStep25_conv_blockStep4 :
    convWithTail headStep25_conv_block4 head26 headStep25_conv_result5 = headStep25_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep25_conv_blockStep4"
  out.flush

theorem headStep23_conv_blockStep4 :
    convWithTail headStep23_conv_block4 head24 headStep23_conv_result5 = headStep23_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep23_conv_blockStep4"
  out.flush

theorem headStep21_conv_blockStep4 :
    convWithTail headStep21_conv_block4 head22 headStep21_conv_result5 = headStep21_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep21_conv_blockStep4"
  out.flush

theorem headStep19_conv_blockStep4 :
    convWithTail headStep19_conv_block4 head20 headStep19_conv_result5 = headStep19_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep19_conv_blockStep4"
  out.flush

theorem headStep17_conv_blockStep4 :
    convWithTail headStep17_conv_block4 head18 headStep17_conv_result5 = headStep17_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep17_conv_blockStep4"
  out.flush

theorem headStep15_conv_blockStep4 :
    convWithTail headStep15_conv_block4 head16 headStep15_conv_result5 = headStep15_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep15_conv_blockStep4"
  out.flush

theorem headStep13_conv_blockStep4 :
    convWithTail headStep13_conv_block4 head14 headStep13_conv_result5 = headStep13_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep13_conv_blockStep4"
  out.flush

theorem headStep13_conv_input :
    ratioA = headStep13_conv_suffix0 := by
  decide +kernel

theorem headStep11_conv_blockStep8 :
    convWithTail headStep11_conv_block8 head12 headStep11_conv_result9 = headStep11_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep11_conv_blockStep8"
  out.flush

theorem headStep11_conv_blockStep4 :
    convWithTail headStep11_conv_block4 head12 headStep11_conv_result5 = headStep11_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep11_conv_blockStep4"
  out.flush

theorem headStep9_conv_blockStep4 :
    convWithTail headStep9_conv_block4 head10 headStep9_conv_result5 = headStep9_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep9_conv_blockStep4"
  out.flush

theorem headStep7_conv_blockStep4 :
    convWithTail headStep7_conv_block4 head8 headStep7_conv_result5 = headStep7_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep7_conv_blockStep4"
  out.flush

theorem headStep5_conv_blockStep4 :
    convWithTail headStep5_conv_block4 head6 headStep5_conv_result5 = headStep5_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep5_conv_blockStep4"
  out.flush

theorem headStep3_conv_blockStep4 :
    convWithTail headStep3_conv_block4 head4 headStep3_conv_result5 = headStep3_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep3_conv_blockStep4"
  out.flush

theorem headStep1_conv_blockStep4 :
    convWithTail headStep1_conv_block4 head2 headStep1_conv_result5 = headStep1_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep1_conv_blockStep4"
  out.flush

theorem final_step_conv_blockStep0 :
    convWithTail final_step_conv_block0 head0 final_step_conv_result1 = final_step_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached final_step_conv_blockStep0"
  out.flush

theorem powerEq0 :
    polyPowI pI 0 = power0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 163: reached powerEq0"
  out.flush

theorem powerStep11_conv_blockStep1 :
    convWithTail powerStep11_conv_block1 power10 powerStep11_conv_result2 = powerStep11_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep11_conv_blockStep1"
  out.flush

theorem powerStep13_conv_blockStep4 :
    convWithTail powerStep13_conv_block4 power12 powerStep13_conv_result5 = powerStep13_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep13_conv_blockStep4"
  out.flush

theorem powerStep15_conv_blockStep0 :
    convWithTail powerStep15_conv_block0 power14 powerStep15_conv_result1 = powerStep15_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep15_conv_blockStep0"
  out.flush

theorem seed_product_step_conv_blockStep6 :
    convWithTail seed_product_step_conv_block6 power17 seed_product_step_conv_result7 = seed_product_step_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached seed_product_step_conv_blockStep6"
  out.flush

theorem inverseD_step :
    addL [ofRatI 1] (ratioA.map negI) = inverseD := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 183: reached inverseD_step"
  out.flush

theorem inverseProduct_step_conv_blockStep12 :
    convWithTail inverseProduct_step_conv_block12 inverseD inverseProduct_step_conv_result13 = inverseProduct_step_conv_result12 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached inverseProduct_step_conv_blockStep12"
  out.flush

end Grothe.HaagerupCanonical.Trace
