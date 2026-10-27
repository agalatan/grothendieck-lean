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

theorem coefficientStep26 :
    c26 * (((2*26+1)^2 : Nat) : Rat) / ((4*(26+1)*(26+2) : Nat) : Rat) = c27 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 28: reached coefficientStep26"
  out.flush

theorem coefficientStep42 :
    c42 * (((2*42+1)^2 : Nat) : Rat) / ((4*(42+1)*(42+2) : Nat) : Rat) = c43 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 44: reached coefficientStep42"
  out.flush

theorem coefficientStep58 :
    c58 * (((2*58+1)^2 : Nat) : Rat) / ((4*(58+1)*(58+2) : Nat) : Rat) = c59 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 60: reached coefficientStep58"
  out.flush

theorem differenceStep1_64 :
    d0_64 - d0_65 = d1_64 := by
  decide +kernel

theorem differenceStep2_70 :
    d1_70 - d1_71 = d2_70 := by
  decide +kernel

theorem differenceStep4_69 :
    d3_69 - d3_70 = d4_69 := by
  decide +kernel

theorem differenceStep7_67 :
    d6_67 - d6_68 = d7_67 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 83: reached difference_order_7"
  out.flush

theorem ratioY_step_conv_blockStep6 :
    convWithTail ratioY_step_conv_block6 ratioA ratioY_step_conv_result7 = ratioY_step_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached ratioY_step_conv_blockStep6"
  out.flush

theorem correctionStep8_conv_blockStep18 :
    convWithTail correctionStep8_conv_block18 correction9 correctionStep8_conv_result19 = correctionStep8_conv_result18 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep8_conv_blockStep18"
  out.flush

theorem correctionStep8_conv_blockStep12 :
    convWithTail correctionStep8_conv_block12 correction9 correctionStep8_conv_result13 = correctionStep8_conv_result12 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep8_conv_blockStep12"
  out.flush

theorem correctionStep7_conv_blockStep5 :
    convWithTail correctionStep7_conv_block5 correction8 correctionStep7_conv_result6 = correctionStep7_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep7_conv_blockStep5"
  out.flush

theorem correctionStep6_conv_blockStep10 :
    convWithTail correctionStep6_conv_block10 correction7 correctionStep6_conv_result11 = correctionStep6_conv_result10 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep6_conv_blockStep10"
  out.flush

theorem correctionStep5_conv_blockStep15 :
    convWithTail correctionStep5_conv_block15 correction6 correctionStep5_conv_result16 = correctionStep5_conv_result15 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep15"
  out.flush

theorem correctionStep5_conv_input :
    ratioY = correctionStep5_conv_suffix0 := by
  decide +kernel

theorem correctionStep4_conv_blockStep20 :
    convWithTail correctionStep4_conv_block20 correction5 correctionStep4_conv_result21 = correctionStep4_conv_result20 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep20"
  out.flush

theorem correctionStep4_conv_blockStep4 :
    convWithTail correctionStep4_conv_block4 correction5 correctionStep4_conv_result5 = correctionStep4_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep4"
  out.flush

theorem correctionStep3_conv_blockStep9 :
    convWithTail correctionStep3_conv_block9 correction4 correctionStep3_conv_result10 = correctionStep3_conv_result9 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep9"
  out.flush

theorem correctionStep2_conv_blockStep14 :
    convWithTail correctionStep2_conv_block14 correction3 correctionStep2_conv_result15 = correctionStep2_conv_result14 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep14"
  out.flush

theorem correctionStep1_conv_blockStep19 :
    convWithTail correctionStep1_conv_block19 correction2 correctionStep1_conv_result20 = correctionStep1_conv_result19 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep19"
  out.flush

theorem correctionStep1_conv_blockStep3 :
    convWithTail correctionStep1_conv_block3 correction2 correctionStep1_conv_result4 = correctionStep1_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep3"
  out.flush

theorem correctionStep0_conv_blockStep8 :
    convWithTail correctionStep0_conv_block8 correction1 correctionStep0_conv_result9 = correctionStep0_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep8"
  out.flush

theorem tail_step_conv_blockStep5 :
    convWithTail tail_step_conv_block5 correction0 tail_step_conv_result6 = tail_step_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached tail_step_conv_blockStep5"
  out.flush

theorem headStep63_conv_input :
    ratioA = headStep63_conv_suffix0 := by
  decide +kernel

theorem headStep61_conv_blockStep5 :
    convWithTail headStep61_conv_block5 head62 headStep61_conv_result6 = headStep61_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep61_conv_blockStep5"
  out.flush

theorem headStep59_conv_blockStep5 :
    convWithTail headStep59_conv_block5 head60 headStep59_conv_result6 = headStep59_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep59_conv_blockStep5"
  out.flush

theorem headStep57_conv_blockStep5 :
    convWithTail headStep57_conv_block5 head58 headStep57_conv_result6 = headStep57_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep57_conv_blockStep5"
  out.flush

theorem headStep55_conv_blockStep5 :
    convWithTail headStep55_conv_block5 head56 headStep55_conv_result6 = headStep55_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep55_conv_blockStep5"
  out.flush

theorem headStep53_conv_blockStep5 :
    convWithTail headStep53_conv_block5 head54 headStep53_conv_result6 = headStep53_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep53_conv_blockStep5"
  out.flush

theorem headStep51_conv_blockStep5 :
    convWithTail headStep51_conv_block5 head52 headStep51_conv_result6 = headStep51_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep51_conv_blockStep5"
  out.flush

theorem headStep49_conv_blockStep5 :
    convWithTail headStep49_conv_block5 head50 headStep49_conv_result6 = headStep49_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep49_conv_blockStep5"
  out.flush

theorem headStep47_conv_blockStep5 :
    convWithTail headStep47_conv_block5 head48 headStep47_conv_result6 = headStep47_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep47_conv_blockStep5"
  out.flush

theorem headStep47_conv_input :
    ratioA = headStep47_conv_suffix0 := by
  decide +kernel

theorem headStep45_conv_blockStep5 :
    convWithTail headStep45_conv_block5 head46 headStep45_conv_result6 = headStep45_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep45_conv_blockStep5"
  out.flush

theorem headStep43_conv_blockStep5 :
    convWithTail headStep43_conv_block5 head44 headStep43_conv_result6 = headStep43_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep43_conv_blockStep5"
  out.flush

theorem headStep42_conv_blockStep8 :
    convWithTail headStep42_conv_block8 head43 headStep42_conv_result9 = headStep42_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep42_conv_blockStep8"
  out.flush

theorem headStep41_conv_blockStep5 :
    convWithTail headStep41_conv_block5 head42 headStep41_conv_result6 = headStep41_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep41_conv_blockStep5"
  out.flush

theorem headStep39_conv_blockStep5 :
    convWithTail headStep39_conv_block5 head40 headStep39_conv_result6 = headStep39_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep39_conv_blockStep5"
  out.flush

theorem headStep37_conv_blockStep5 :
    convWithTail headStep37_conv_block5 head38 headStep37_conv_result6 = headStep37_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep37_conv_blockStep5"
  out.flush

theorem headStep35_conv_blockStep5 :
    convWithTail headStep35_conv_block5 head36 headStep35_conv_result6 = headStep35_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep35_conv_blockStep5"
  out.flush

theorem headStep33_conv_blockStep5 :
    convWithTail headStep33_conv_block5 head34 headStep33_conv_result6 = headStep33_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep33_conv_blockStep5"
  out.flush

theorem headStep31_conv_blockStep5 :
    convWithTail headStep31_conv_block5 head32 headStep31_conv_result6 = headStep31_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep31_conv_blockStep5"
  out.flush

theorem headStep31_conv_input :
    ratioA = headStep31_conv_suffix0 := by
  decide +kernel

theorem headStep29_conv_blockStep5 :
    convWithTail headStep29_conv_block5 head30 headStep29_conv_result6 = headStep29_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep29_conv_blockStep5"
  out.flush

theorem headStep27_conv_blockStep5 :
    convWithTail headStep27_conv_block5 head28 headStep27_conv_result6 = headStep27_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep27_conv_blockStep5"
  out.flush

theorem headStep26_conv_blockStep8 :
    convWithTail headStep26_conv_block8 head27 headStep26_conv_result9 = headStep26_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep26_conv_blockStep8"
  out.flush

theorem headStep25_conv_blockStep5 :
    convWithTail headStep25_conv_block5 head26 headStep25_conv_result6 = headStep25_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep25_conv_blockStep5"
  out.flush

theorem headStep23_conv_blockStep5 :
    convWithTail headStep23_conv_block5 head24 headStep23_conv_result6 = headStep23_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep23_conv_blockStep5"
  out.flush

theorem headStep21_conv_blockStep5 :
    convWithTail headStep21_conv_block5 head22 headStep21_conv_result6 = headStep21_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep21_conv_blockStep5"
  out.flush

theorem headStep19_conv_blockStep5 :
    convWithTail headStep19_conv_block5 head20 headStep19_conv_result6 = headStep19_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep19_conv_blockStep5"
  out.flush

theorem headStep17_conv_blockStep5 :
    convWithTail headStep17_conv_block5 head18 headStep17_conv_result6 = headStep17_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep17_conv_blockStep5"
  out.flush

theorem headStep15_conv_blockStep5 :
    convWithTail headStep15_conv_block5 head16 headStep15_conv_result6 = headStep15_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep15_conv_blockStep5"
  out.flush

theorem headStep15_conv_input :
    ratioA = headStep15_conv_suffix0 := by
  decide +kernel

theorem headStep13_conv_blockStep5 :
    convWithTail headStep13_conv_block5 head14 headStep13_conv_result6 = headStep13_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep13_conv_blockStep5"
  out.flush

theorem headStep11_conv_blockStep5 :
    convWithTail headStep11_conv_block5 head12 headStep11_conv_result6 = headStep11_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep11_conv_blockStep5"
  out.flush

theorem headStep10_conv_blockStep8 :
    convWithTail headStep10_conv_block8 head11 headStep10_conv_result9 = headStep10_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep10_conv_blockStep8"
  out.flush

theorem headStep9_conv_blockStep5 :
    convWithTail headStep9_conv_block5 head10 headStep9_conv_result6 = headStep9_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep9_conv_blockStep5"
  out.flush

theorem headStep7_conv_blockStep5 :
    convWithTail headStep7_conv_block5 head8 headStep7_conv_result6 = headStep7_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep7_conv_blockStep5"
  out.flush

theorem headStep5_conv_blockStep5 :
    convWithTail headStep5_conv_block5 head6 headStep5_conv_result6 = headStep5_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep5_conv_blockStep5"
  out.flush

theorem headStep3_conv_blockStep5 :
    convWithTail headStep3_conv_block5 head4 headStep3_conv_result6 = headStep3_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep3_conv_blockStep5"
  out.flush

theorem headStep1_conv_blockStep5 :
    convWithTail headStep1_conv_block5 head2 headStep1_conv_result6 = headStep1_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep1_conv_blockStep5"
  out.flush

theorem final_step_conv_blockStep1 :
    convWithTail final_step_conv_block1 head0 final_step_conv_result2 = final_step_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached final_step_conv_blockStep1"
  out.flush

theorem final_step_conv_input :
    pI = final_step_conv_suffix0 := by
  decide +kernel

theorem powerStep6_conv_blockStep0 :
    convWithTail powerStep6_conv_block0 power5 powerStep6_conv_result1 = powerStep6_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep6_conv_blockStep0"
  out.flush

theorem powerStep8_conv_blockStep4 :
    convWithTail powerStep8_conv_block4 power7 powerStep8_conv_result5 = powerStep8_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep8_conv_blockStep4"
  out.flush

theorem powerStep12_conv_blockStep4 :
    convWithTail powerStep12_conv_block4 power11 powerStep12_conv_result5 = powerStep12_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep12_conv_blockStep4"
  out.flush

theorem powerStep13_conv_blockStep0 :
    convWithTail powerStep13_conv_block0 power12 powerStep13_conv_result1 = powerStep13_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep13_conv_blockStep0"
  out.flush

theorem powerStep14_conv_blockStep3 :
    convWithTail powerStep14_conv_block3 power13 powerStep14_conv_result4 = powerStep14_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep14_conv_blockStep3"
  out.flush

theorem seed_product_step_conv_blockStep5 :
    convWithTail seed_product_step_conv_block5 power17 seed_product_step_conv_result6 = seed_product_step_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached seed_product_step_conv_blockStep5"
  out.flush

theorem seed_product_step_conv_input :
    rI = seed_product_step_conv_suffix0 := by
  decide +kernel

theorem inverseProduct_step_conv_blockStep3 :
    convWithTail inverseProduct_step_conv_block3 inverseD inverseProduct_step_conv_result4 = inverseProduct_step_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached inverseProduct_step_conv_blockStep3"
  out.flush

end Grothe.HaagerupCanonical.Trace
