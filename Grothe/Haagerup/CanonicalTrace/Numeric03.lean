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

theorem one_eq_c0 :
    (1 : Rat) = c0 := by
  decide +kernel

theorem coefficientStep8 :
    c8 * (((2*8+1)^2 : Nat) : Rat) / ((4*(8+1)*(8+2) : Nat) : Rat) = c9 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 10: reached coefficientStep8"
  out.flush

theorem coefficientStep18 :
    c18 * (((2*18+1)^2 : Nat) : Rat) / ((4*(18+1)*(18+2) : Nat) : Rat) = c19 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 20: reached coefficientStep18"
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

theorem differenceStep1_71 :
    d0_71 - d0_72 = d1_71 := by
  decide +kernel

theorem differenceStep3_68 :
    d2_68 - d2_69 = d3_68 := by
  decide +kernel

theorem differenceStep5_69 :
    d4_69 - d4_70 = d5_69 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 81: reached difference_order_5"
  out.flush

theorem weighted_literal_ok :
    (21/20)*(Rat.abs c0 + (5/3)*((Rat.abs c1 + (5/3)*((Rat.abs c2 + (5/3)*((Rat.abs c3 + (5/3)*((Rat.abs c4 + (5/3)*((Rat.abs c5 + (5/3)*((Rat.abs c6 + (5/3)*((Rat.abs c7 + (5/3)*((Rat.abs c8 + (5/3)*((Rat.abs c9 + (5/3)*((Rat.abs c10 + (5/3)*((Rat.abs c11 + (5/3)*((Rat.abs c12 + (5/3)*((Rat.abs c13 + (5/3)*((Rat.abs c14 + (5/3)*((Rat.abs c15 + (5/3)*((Rat.abs c16 + (5/3)*((Rat.abs c17 + (5/3)*((Rat.abs c18 + (5/3)*((Rat.abs c19 + (5/3)*((Rat.abs c20 + (5/3)*((Rat.abs c21 + (5/3)*((Rat.abs c22 + (5/3)*((Rat.abs c23 + (5/3)*((Rat.abs c24 + (5/3)*((Rat.abs c25 + (5/3)*((Rat.abs c26 + (5/3)*((Rat.abs c27 + (5/3)*((Rat.abs c28 + (5/3)*((Rat.abs c29 + (5/3)*((Rat.abs c30 + (5/3)*((Rat.abs c31 + (5/3)*((Rat.abs c32 + (5/3)*((Rat.abs c33 + (5/3)*((Rat.abs c34 + (5/3)*((Rat.abs c35 + (5/3)*((Rat.abs c36 + (5/3)*((Rat.abs c37 + (5/3)*((Rat.abs c38 + (5/3)*((Rat.abs c39 + (5/3)*((Rat.abs c40 + (5/3)*((Rat.abs c41 + (5/3)*((Rat.abs c42 + (5/3)*((Rat.abs c43 + (5/3)*((Rat.abs c44 + (5/3)*((Rat.abs c45 + (5/3)*((Rat.abs c46 + (5/3)*((Rat.abs c47 + (5/3)*((Rat.abs c48 + (5/3)*((Rat.abs c49 + (5/3)*((Rat.abs c50 + (5/3)*((Rat.abs c51 + (5/3)*((Rat.abs c52 + (5/3)*((Rat.abs c53 + (5/3)*((Rat.abs c54 + (5/3)*((Rat.abs c55 + (5/3)*((Rat.abs c56 + (5/3)*((Rat.abs c57 + (5/3)*((Rat.abs c58 + (5/3)*((Rat.abs c59 + (5/3)*((Rat.abs c60 + (5/3)*((Rat.abs c61 + (5/3)*((Rat.abs c62 + (5/3)*((Rat.abs c63 + (5/3)*(0)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) + (9*((21/20)*(5/3)^64))*(Rat.abs d0_64 + (15)*((Rat.abs d1_64 + (15)*((Rat.abs d2_64 + (15)*((Rat.abs d3_64 + (15)*((Rat.abs d4_64 + (15)*((Rat.abs d5_64 + (15)*((Rat.abs d6_64 + (15)*((Rat.abs d7_64 + (15)*((Rat.abs d8_64 + (15)*((Rat.abs d9_64 + (15)*(0)))))))))))))))))))) + 1 ≤ 10^13 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 87: reached weighted_literal_ok"
  out.flush

theorem ratioY_step_conv_blockStep1 :
    convWithTail ratioY_step_conv_block1 ratioA ratioY_step_conv_result2 = ratioY_step_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached ratioY_step_conv_blockStep1"
  out.flush

theorem correctionStep8_conv_blockStep19 :
    convWithTail correctionStep8_conv_block19 correction9 correctionStep8_conv_result20 = correctionStep8_conv_result19 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep8_conv_blockStep19"
  out.flush

theorem correctionStep8_conv_blockStep13 :
    convWithTail correctionStep8_conv_block13 correction9 correctionStep8_conv_result14 = correctionStep8_conv_result13 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep8_conv_blockStep13"
  out.flush

theorem correctionStep7_conv_blockStep6 :
    convWithTail correctionStep7_conv_block6 correction8 correctionStep7_conv_result7 = correctionStep7_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep7_conv_blockStep6"
  out.flush

theorem correctionStep6_conv_blockStep11 :
    convWithTail correctionStep6_conv_block11 correction7 correctionStep6_conv_result12 = correctionStep6_conv_result11 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep6_conv_blockStep11"
  out.flush

theorem correctionStep5_conv_blockStep16 :
    convWithTail correctionStep5_conv_block16 correction6 correctionStep5_conv_result17 = correctionStep5_conv_result16 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep16"
  out.flush

theorem correctionStep5_conv_blockStep0 :
    convWithTail correctionStep5_conv_block0 correction6 correctionStep5_conv_result1 = correctionStep5_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep0"
  out.flush

theorem correctionStep4_conv_blockStep5 :
    convWithTail correctionStep4_conv_block5 correction5 correctionStep4_conv_result6 = correctionStep4_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep5"
  out.flush

theorem correctionStep3_conv_blockStep10 :
    convWithTail correctionStep3_conv_block10 correction4 correctionStep3_conv_result11 = correctionStep3_conv_result10 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep10"
  out.flush

theorem correctionStep2_conv_blockStep15 :
    convWithTail correctionStep2_conv_block15 correction3 correctionStep2_conv_result16 = correctionStep2_conv_result15 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep15"
  out.flush

theorem correctionStep1_conv_blockStep20 :
    convWithTail correctionStep1_conv_block20 correction2 correctionStep1_conv_result21 = correctionStep1_conv_result20 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep20"
  out.flush

theorem correctionStep1_conv_blockStep4 :
    convWithTail correctionStep1_conv_block4 correction2 correctionStep1_conv_result5 = correctionStep1_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep4"
  out.flush

theorem correctionStep0_conv_blockStep9 :
    convWithTail correctionStep0_conv_block9 correction1 correctionStep0_conv_result10 = correctionStep0_conv_result9 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep9"
  out.flush

theorem tail_step_conv_blockStep6 :
    convWithTail tail_step_conv_block6 correction0 tail_step_conv_result7 = tail_step_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached tail_step_conv_blockStep6"
  out.flush

theorem headStep63_conv_blockStep8 :
    convWithTail headStep63_conv_block8 head64 headStep63_conv_result9 = headStep63_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep63_conv_blockStep8"
  out.flush

theorem headStep61_conv_blockStep6 :
    convWithTail headStep61_conv_block6 head62 headStep61_conv_result7 = headStep61_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep61_conv_blockStep6"
  out.flush

theorem headStep59_conv_blockStep6 :
    convWithTail headStep59_conv_block6 head60 headStep59_conv_result7 = headStep59_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep59_conv_blockStep6"
  out.flush

theorem headStep57_conv_blockStep6 :
    convWithTail headStep57_conv_block6 head58 headStep57_conv_result7 = headStep57_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep57_conv_blockStep6"
  out.flush

theorem headStep56_conv_input :
    ratioA = headStep56_conv_suffix0 := by
  decide +kernel

theorem headStep55_conv_blockStep6 :
    convWithTail headStep55_conv_block6 head56 headStep55_conv_result7 = headStep55_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep55_conv_blockStep6"
  out.flush

theorem headStep53_conv_blockStep6 :
    convWithTail headStep53_conv_block6 head54 headStep53_conv_result7 = headStep53_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep53_conv_blockStep6"
  out.flush

theorem headStep51_conv_blockStep6 :
    convWithTail headStep51_conv_block6 head52 headStep51_conv_result7 = headStep51_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep51_conv_blockStep6"
  out.flush

theorem headStep49_conv_blockStep6 :
    convWithTail headStep49_conv_block6 head50 headStep49_conv_result7 = headStep49_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep49_conv_blockStep6"
  out.flush

theorem headStep47_conv_blockStep6 :
    convWithTail headStep47_conv_block6 head48 headStep47_conv_result7 = headStep47_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep47_conv_blockStep6"
  out.flush

theorem headStep45_conv_blockStep6 :
    convWithTail headStep45_conv_block6 head46 headStep45_conv_result7 = headStep45_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep45_conv_blockStep6"
  out.flush

theorem headStep44_conv_blockStep8 :
    convWithTail headStep44_conv_block8 head45 headStep44_conv_result9 = headStep44_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep44_conv_blockStep8"
  out.flush

theorem headStep43_conv_blockStep6 :
    convWithTail headStep43_conv_block6 head44 headStep43_conv_result7 = headStep43_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep43_conv_blockStep6"
  out.flush

theorem headStep41_conv_blockStep6 :
    convWithTail headStep41_conv_block6 head42 headStep41_conv_result7 = headStep41_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep41_conv_blockStep6"
  out.flush

theorem headStep40_conv_input :
    ratioA = headStep40_conv_suffix0 := by
  decide +kernel

theorem headStep39_conv_blockStep6 :
    convWithTail headStep39_conv_block6 head40 headStep39_conv_result7 = headStep39_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep39_conv_blockStep6"
  out.flush

theorem headStep37_conv_blockStep6 :
    convWithTail headStep37_conv_block6 head38 headStep37_conv_result7 = headStep37_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep37_conv_blockStep6"
  out.flush

theorem headStep35_conv_blockStep6 :
    convWithTail headStep35_conv_block6 head36 headStep35_conv_result7 = headStep35_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep35_conv_blockStep6"
  out.flush

theorem headStep33_conv_blockStep6 :
    convWithTail headStep33_conv_block6 head34 headStep33_conv_result7 = headStep33_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep33_conv_blockStep6"
  out.flush

theorem headStep31_conv_blockStep6 :
    convWithTail headStep31_conv_block6 head32 headStep31_conv_result7 = headStep31_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep31_conv_blockStep6"
  out.flush

theorem headStep29_conv_blockStep6 :
    convWithTail headStep29_conv_block6 head30 headStep29_conv_result7 = headStep29_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep29_conv_blockStep6"
  out.flush

theorem headStep28_conv_blockStep8 :
    convWithTail headStep28_conv_block8 head29 headStep28_conv_result9 = headStep28_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep28_conv_blockStep8"
  out.flush

theorem headStep27_conv_blockStep6 :
    convWithTail headStep27_conv_block6 head28 headStep27_conv_result7 = headStep27_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep27_conv_blockStep6"
  out.flush

theorem headStep25_conv_blockStep6 :
    convWithTail headStep25_conv_block6 head26 headStep25_conv_result7 = headStep25_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep25_conv_blockStep6"
  out.flush

theorem headStep24_conv_input :
    ratioA = headStep24_conv_suffix0 := by
  decide +kernel

theorem headStep23_conv_blockStep6 :
    convWithTail headStep23_conv_block6 head24 headStep23_conv_result7 = headStep23_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep23_conv_blockStep6"
  out.flush

theorem headStep21_conv_blockStep6 :
    convWithTail headStep21_conv_block6 head22 headStep21_conv_result7 = headStep21_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep21_conv_blockStep6"
  out.flush

theorem headStep19_conv_blockStep6 :
    convWithTail headStep19_conv_block6 head20 headStep19_conv_result7 = headStep19_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep19_conv_blockStep6"
  out.flush

theorem headStep17_conv_blockStep6 :
    convWithTail headStep17_conv_block6 head18 headStep17_conv_result7 = headStep17_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep17_conv_blockStep6"
  out.flush

theorem headStep15_conv_blockStep6 :
    convWithTail headStep15_conv_block6 head16 headStep15_conv_result7 = headStep15_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep15_conv_blockStep6"
  out.flush

theorem headStep13_conv_blockStep6 :
    convWithTail headStep13_conv_block6 head14 headStep13_conv_result7 = headStep13_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep13_conv_blockStep6"
  out.flush

theorem headStep12_conv_blockStep8 :
    convWithTail headStep12_conv_block8 head13 headStep12_conv_result9 = headStep12_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep12_conv_blockStep8"
  out.flush

theorem headStep11_conv_blockStep6 :
    convWithTail headStep11_conv_block6 head12 headStep11_conv_result7 = headStep11_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep11_conv_blockStep6"
  out.flush

theorem headStep9_conv_blockStep6 :
    convWithTail headStep9_conv_block6 head10 headStep9_conv_result7 = headStep9_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep9_conv_blockStep6"
  out.flush

theorem headStep8_conv_input :
    ratioA = headStep8_conv_suffix0 := by
  decide +kernel

theorem headStep7_conv_blockStep6 :
    convWithTail headStep7_conv_block6 head8 headStep7_conv_result7 = headStep7_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep7_conv_blockStep6"
  out.flush

theorem headStep5_conv_blockStep6 :
    convWithTail headStep5_conv_block6 head6 headStep5_conv_result7 = headStep5_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep5_conv_blockStep6"
  out.flush

theorem headStep3_conv_blockStep6 :
    convWithTail headStep3_conv_block6 head4 headStep3_conv_result7 = headStep3_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep3_conv_blockStep6"
  out.flush

theorem headStep1_conv_blockStep6 :
    convWithTail headStep1_conv_block6 head2 headStep1_conv_result7 = headStep1_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep1_conv_blockStep6"
  out.flush

theorem final_step_conv_blockStep2 :
    convWithTail final_step_conv_block2 head0 final_step_conv_result3 = final_step_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached final_step_conv_blockStep2"
  out.flush

theorem powerStep6_conv_blockStep1 :
    convWithTail powerStep6_conv_block1 power5 powerStep6_conv_result2 = powerStep6_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep6_conv_blockStep1"
  out.flush

theorem powerStep9_conv_input :
    pI = powerStep9_conv_suffix0 := by
  decide +kernel

theorem powerStep10_conv_blockStep4 :
    convWithTail powerStep10_conv_block4 power9 powerStep10_conv_result5 = powerStep10_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep10_conv_blockStep4"
  out.flush

theorem powerStep12_conv_blockStep0 :
    convWithTail powerStep12_conv_block0 power11 powerStep12_conv_result1 = powerStep12_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep12_conv_blockStep0"
  out.flush

theorem powerStep14_conv_blockStep4 :
    convWithTail powerStep14_conv_block4 power13 powerStep14_conv_result5 = powerStep14_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep14_conv_blockStep4"
  out.flush

theorem powerStep15_conv_blockStep3 :
    convWithTail powerStep15_conv_block3 power14 powerStep15_conv_result4 = powerStep15_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep15_conv_blockStep3"
  out.flush

theorem seed_product_step_conv_blockStep9 :
    convWithTail seed_product_step_conv_block9 power17 seed_product_step_conv_result10 = seed_product_step_conv_result9 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached seed_product_step_conv_blockStep9"
  out.flush

end Grothe.HaagerupCanonical.Trace
