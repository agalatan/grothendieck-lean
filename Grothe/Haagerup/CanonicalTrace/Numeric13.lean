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

theorem differenceStep1_70 :
    d0_70 - d0_71 = d1_70 := by
  decide +kernel

theorem differenceStep3_67 :
    d2_67 - d2_68 = d3_67 := by
  decide +kernel

theorem differenceStep5_68 :
    d4_68 - d4_69 = d5_68 := by
  decide +kernel

theorem differenceStep10_64 :
    d9_64 - d9_65 = d10_64 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 86: reached difference_order_10"
  out.flush

theorem correctionStep8_conv_blockStep20 :
    convWithTail correctionStep8_conv_block20 correction9 correctionStep8_conv_result21 = correctionStep8_conv_result20 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep8_conv_blockStep20"
  out.flush

theorem correctionStep8_conv_blockStep14 :
    convWithTail correctionStep8_conv_block14 correction9 correctionStep8_conv_result15 = correctionStep8_conv_result14 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep8_conv_blockStep14"
  out.flush

theorem correctionStep7_conv_blockStep7 :
    convWithTail correctionStep7_conv_block7 correction8 correctionStep7_conv_result8 = correctionStep7_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep7_conv_blockStep7"
  out.flush

theorem correctionStep6_conv_blockStep12 :
    convWithTail correctionStep6_conv_block12 correction7 correctionStep6_conv_result13 = correctionStep6_conv_result12 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep6_conv_blockStep12"
  out.flush

theorem correctionStep5_conv_blockStep17 :
    convWithTail correctionStep5_conv_block17 correction6 correctionStep5_conv_result18 = correctionStep5_conv_result17 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep17"
  out.flush

theorem correctionStep5_conv_blockStep1 :
    convWithTail correctionStep5_conv_block1 correction6 correctionStep5_conv_result2 = correctionStep5_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep1"
  out.flush

theorem correctionStep4_conv_blockStep6 :
    convWithTail correctionStep4_conv_block6 correction5 correctionStep4_conv_result7 = correctionStep4_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep6"
  out.flush

theorem correctionStep3_conv_blockStep11 :
    convWithTail correctionStep3_conv_block11 correction4 correctionStep3_conv_result12 = correctionStep3_conv_result11 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep11"
  out.flush

theorem correctionStep2_conv_blockStep16 :
    convWithTail correctionStep2_conv_block16 correction3 correctionStep2_conv_result17 = correctionStep2_conv_result16 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep16"
  out.flush

theorem correctionStep2_conv_blockStep0 :
    convWithTail correctionStep2_conv_block0 correction3 correctionStep2_conv_result1 = correctionStep2_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep0"
  out.flush

theorem correctionStep1_conv_blockStep21 :
    convWithTail correctionStep1_conv_block21 correction2 correctionStep1_conv_result22 = correctionStep1_conv_result21 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep21"
  out.flush

theorem correctionStep1_conv_blockStep5 :
    convWithTail correctionStep1_conv_block5 correction2 correctionStep1_conv_result6 = correctionStep1_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep5"
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

theorem tail_step_conv_input :
    rI = tail_step_conv_suffix0 := by
  decide +kernel

theorem headStep61_conv_blockStep7 :
    convWithTail headStep61_conv_block7 head62 headStep61_conv_result8 = headStep61_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep61_conv_blockStep7"
  out.flush

theorem headStep59_conv_blockStep7 :
    convWithTail headStep59_conv_block7 head60 headStep59_conv_result8 = headStep59_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep59_conv_blockStep7"
  out.flush

theorem headStep57_conv_blockStep7 :
    convWithTail headStep57_conv_block7 head58 headStep57_conv_result8 = headStep57_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep57_conv_blockStep7"
  out.flush

theorem headStep57_conv_input :
    ratioA = headStep57_conv_suffix0 := by
  decide +kernel

theorem headStep55_conv_blockStep7 :
    convWithTail headStep55_conv_block7 head56 headStep55_conv_result8 = headStep55_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep55_conv_blockStep7"
  out.flush

theorem headStep53_conv_blockStep7 :
    convWithTail headStep53_conv_block7 head54 headStep53_conv_result8 = headStep53_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep53_conv_blockStep7"
  out.flush

theorem headStep51_conv_blockStep7 :
    convWithTail headStep51_conv_block7 head52 headStep51_conv_result8 = headStep51_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep51_conv_blockStep7"
  out.flush

theorem headStep49_conv_blockStep7 :
    convWithTail headStep49_conv_block7 head50 headStep49_conv_result8 = headStep49_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep49_conv_blockStep7"
  out.flush

theorem headStep48_conv_blockStep8 :
    convWithTail headStep48_conv_block8 head49 headStep48_conv_result9 = headStep48_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep48_conv_blockStep8"
  out.flush

theorem headStep47_conv_blockStep7 :
    convWithTail headStep47_conv_block7 head48 headStep47_conv_result8 = headStep47_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep47_conv_blockStep7"
  out.flush

theorem headStep45_conv_blockStep7 :
    convWithTail headStep45_conv_block7 head46 headStep45_conv_result8 = headStep45_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep45_conv_blockStep7"
  out.flush

theorem headStep43_conv_blockStep7 :
    convWithTail headStep43_conv_block7 head44 headStep43_conv_result8 = headStep43_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep43_conv_blockStep7"
  out.flush

theorem headStep41_conv_blockStep7 :
    convWithTail headStep41_conv_block7 head42 headStep41_conv_result8 = headStep41_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep41_conv_blockStep7"
  out.flush

theorem headStep41_conv_input :
    ratioA = headStep41_conv_suffix0 := by
  decide +kernel

theorem headStep39_conv_blockStep7 :
    convWithTail headStep39_conv_block7 head40 headStep39_conv_result8 = headStep39_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep39_conv_blockStep7"
  out.flush

theorem headStep37_conv_blockStep7 :
    convWithTail headStep37_conv_block7 head38 headStep37_conv_result8 = headStep37_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep37_conv_blockStep7"
  out.flush

theorem headStep35_conv_blockStep7 :
    convWithTail headStep35_conv_block7 head36 headStep35_conv_result8 = headStep35_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep35_conv_blockStep7"
  out.flush

theorem headStep33_conv_blockStep7 :
    convWithTail headStep33_conv_block7 head34 headStep33_conv_result8 = headStep33_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep33_conv_blockStep7"
  out.flush

theorem headStep32_conv_blockStep8 :
    convWithTail headStep32_conv_block8 head33 headStep32_conv_result9 = headStep32_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep32_conv_blockStep8"
  out.flush

theorem headStep31_conv_blockStep7 :
    convWithTail headStep31_conv_block7 head32 headStep31_conv_result8 = headStep31_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep31_conv_blockStep7"
  out.flush

theorem headStep29_conv_blockStep7 :
    convWithTail headStep29_conv_block7 head30 headStep29_conv_result8 = headStep29_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep29_conv_blockStep7"
  out.flush

theorem headStep27_conv_blockStep7 :
    convWithTail headStep27_conv_block7 head28 headStep27_conv_result8 = headStep27_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep27_conv_blockStep7"
  out.flush

theorem headStep25_conv_blockStep7 :
    convWithTail headStep25_conv_block7 head26 headStep25_conv_result8 = headStep25_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep25_conv_blockStep7"
  out.flush

theorem headStep25_conv_input :
    ratioA = headStep25_conv_suffix0 := by
  decide +kernel

theorem headStep23_conv_blockStep7 :
    convWithTail headStep23_conv_block7 head24 headStep23_conv_result8 = headStep23_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep23_conv_blockStep7"
  out.flush

theorem headStep21_conv_blockStep7 :
    convWithTail headStep21_conv_block7 head22 headStep21_conv_result8 = headStep21_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep21_conv_blockStep7"
  out.flush

theorem headStep19_conv_blockStep7 :
    convWithTail headStep19_conv_block7 head20 headStep19_conv_result8 = headStep19_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep19_conv_blockStep7"
  out.flush

theorem headStep17_conv_blockStep7 :
    convWithTail headStep17_conv_block7 head18 headStep17_conv_result8 = headStep17_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep17_conv_blockStep7"
  out.flush

theorem headStep16_conv_blockStep8 :
    convWithTail headStep16_conv_block8 head17 headStep16_conv_result9 = headStep16_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep16_conv_blockStep8"
  out.flush

theorem headStep15_conv_blockStep7 :
    convWithTail headStep15_conv_block7 head16 headStep15_conv_result8 = headStep15_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep15_conv_blockStep7"
  out.flush

theorem headStep13_conv_blockStep7 :
    convWithTail headStep13_conv_block7 head14 headStep13_conv_result8 = headStep13_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep13_conv_blockStep7"
  out.flush

theorem headStep11_conv_blockStep7 :
    convWithTail headStep11_conv_block7 head12 headStep11_conv_result8 = headStep11_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep11_conv_blockStep7"
  out.flush

theorem headStep9_conv_blockStep7 :
    convWithTail headStep9_conv_block7 head10 headStep9_conv_result8 = headStep9_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep9_conv_blockStep7"
  out.flush

theorem headStep9_conv_input :
    ratioA = headStep9_conv_suffix0 := by
  decide +kernel

theorem headStep7_conv_blockStep7 :
    convWithTail headStep7_conv_block7 head8 headStep7_conv_result8 = headStep7_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep7_conv_blockStep7"
  out.flush

theorem headStep5_conv_blockStep7 :
    convWithTail headStep5_conv_block7 head6 headStep5_conv_result8 = headStep5_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep5_conv_blockStep7"
  out.flush

theorem headStep3_conv_blockStep7 :
    convWithTail headStep3_conv_block7 head4 headStep3_conv_result8 = headStep3_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep3_conv_blockStep7"
  out.flush

theorem headStep1_conv_blockStep7 :
    convWithTail headStep1_conv_block7 head2 headStep1_conv_result8 = headStep1_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep1_conv_blockStep7"
  out.flush

theorem headStep0_conv_blockStep8 :
    convWithTail headStep0_conv_block8 head1 headStep0_conv_result9 = headStep0_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep0_conv_blockStep8"
  out.flush

theorem final_step_conv_blockStep3 :
    convWithTail final_step_conv_block3 head0 final_step_conv_result4 = final_step_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached final_step_conv_blockStep3"
  out.flush

theorem powerStep5 :
    convI pI power4 = power5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 175: reached powerStep5"
  out.flush

theorem powerStep6_conv_blockStep2 :
    convWithTail powerStep6_conv_block2 power5 powerStep6_conv_result3 = powerStep6_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep6_conv_blockStep2"
  out.flush

theorem powerStep8_conv_input :
    pI = powerStep8_conv_suffix0 := by
  decide +kernel

theorem powerStep11_conv_blockStep0 :
    convWithTail powerStep11_conv_block0 power10 powerStep11_conv_result1 = powerStep11_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep11_conv_blockStep0"
  out.flush

theorem powerStep16_conv_blockStep3 :
    convWithTail powerStep16_conv_block3 power15 powerStep16_conv_result4 = powerStep16_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep16_conv_blockStep3"
  out.flush

theorem inverseProduct_step_conv_blockStep7 :
    convWithTail inverseProduct_step_conv_block7 inverseD inverseProduct_step_conv_result8 = inverseProduct_step_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached inverseProduct_step_conv_blockStep7"
  out.flush

end Grothe.HaagerupCanonical.Trace
