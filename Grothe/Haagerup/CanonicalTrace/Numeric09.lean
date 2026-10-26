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

theorem coefficientStep6 :
    c6 * (((2*6+1)^2 : Nat) : Rat) / ((4*(6+1)*(6+2) : Nat) : Rat) = c7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 8: reached coefficientStep6"
  out.flush

theorem coefficientStep10 :
    c10 * (((2*10+1)^2 : Nat) : Rat) / ((4*(10+1)*(10+2) : Nat) : Rat) = c11 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 12: reached coefficientStep10"
  out.flush

theorem coefficientStep15 :
    c15 * (((2*15+1)^2 : Nat) : Rat) / ((4*(15+1)*(15+2) : Nat) : Rat) = c16 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 17: reached coefficientStep15"
  out.flush

theorem coefficientStep23 :
    c23 * (((2*23+1)^2 : Nat) : Rat) / ((4*(23+1)*(23+2) : Nat) : Rat) = c24 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 25: reached coefficientStep23"
  out.flush

theorem coefficientStep31 :
    c31 * (((2*31+1)^2 : Nat) : Rat) / ((4*(31+1)*(31+2) : Nat) : Rat) = c32 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 33: reached coefficientStep31"
  out.flush

theorem coefficientStep39 :
    c39 * (((2*39+1)^2 : Nat) : Rat) / ((4*(39+1)*(39+2) : Nat) : Rat) = c40 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 41: reached coefficientStep39"
  out.flush

theorem coefficientStep49 :
    c49 * (((2*49+1)^2 : Nat) : Rat) / ((4*(49+1)*(49+2) : Nat) : Rat) = c50 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 51: reached coefficientStep49"
  out.flush

theorem coefficientStep63 :
    c63 * (((2*63+1)^2 : Nat) : Rat) / ((4*(63+1)*(63+2) : Nat) : Rat) = c64 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 65: reached coefficientStep63"
  out.flush

theorem differenceStep2_67 :
    d1_67 - d1_68 = d2_67 := by
  decide +kernel

theorem correctionStep4_conv_blockStep8 :
    convWithTail correctionStep4_conv_block8 correction5 correctionStep4_conv_result9 = correctionStep4_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep8"
  out.flush

theorem correctionStep4_conv_input :
    ratioY = correctionStep4_conv_suffix0 := by
  decide +kernel

theorem correctionStep3_conv_blockStep13 :
    convWithTail correctionStep3_conv_block13 correction4 correctionStep3_conv_result14 = correctionStep3_conv_result13 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep13"
  out.flush

theorem correctionStep2_conv_blockStep15 :
    convWithTail correctionStep2_conv_block15 correction3 correctionStep2_conv_result16 = correctionStep2_conv_result15 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep15"
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

theorem correctionStep0_conv_blockStep3 :
    convWithTail correctionStep0_conv_block3 correction1 correctionStep0_conv_result4 = correctionStep0_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep3"
  out.flush

theorem tail_step_conv_blockStep0 :
    convWithTail tail_step_conv_block0 correction0 tail_step_conv_result1 = tail_step_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached tail_step_conv_blockStep0"
  out.flush

theorem headStep60_conv_blockStep2 :
    convWithTail headStep60_conv_block2 head61 headStep60_conv_result3 = headStep60_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep60_conv_blockStep2"
  out.flush

theorem headStep59_conv_input :
    ratioA = headStep59_conv_suffix0 := by
  decide +kernel

theorem headStep57_conv_blockStep4 :
    convWithTail headStep57_conv_block4 head58 headStep57_conv_result5 = headStep57_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep57_conv_blockStep4"
  out.flush

theorem headStep55_conv_blockStep0 :
    convWithTail headStep55_conv_block0 head56 headStep55_conv_result1 = headStep55_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep55_conv_blockStep0"
  out.flush

theorem headStep52_conv_blockStep2 :
    convWithTail headStep52_conv_block2 head53 headStep52_conv_result3 = headStep52_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep52_conv_blockStep2"
  out.flush

theorem headStep49_conv_blockStep4 :
    convWithTail headStep49_conv_block4 head50 headStep49_conv_result5 = headStep49_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep49_conv_blockStep4"
  out.flush

theorem headStep47_conv_blockStep0 :
    convWithTail headStep47_conv_block0 head48 headStep47_conv_result1 = headStep47_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep47_conv_blockStep0"
  out.flush

theorem headStep44_conv_blockStep2 :
    convWithTail headStep44_conv_block2 head45 headStep44_conv_result3 = headStep44_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep44_conv_blockStep2"
  out.flush

theorem headStep43_conv_input :
    ratioA = headStep43_conv_suffix0 := by
  decide +kernel

theorem headStep41_conv_blockStep4 :
    convWithTail headStep41_conv_block4 head42 headStep41_conv_result5 = headStep41_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep41_conv_blockStep4"
  out.flush

theorem headStep39_conv_blockStep0 :
    convWithTail headStep39_conv_block0 head40 headStep39_conv_result1 = headStep39_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep39_conv_blockStep0"
  out.flush

theorem headStep36_conv_blockStep2 :
    convWithTail headStep36_conv_block2 head37 headStep36_conv_result3 = headStep36_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep36_conv_blockStep2"
  out.flush

theorem headStep33_conv_blockStep4 :
    convWithTail headStep33_conv_block4 head34 headStep33_conv_result5 = headStep33_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep33_conv_blockStep4"
  out.flush

theorem headStep31_conv_blockStep0 :
    convWithTail headStep31_conv_block0 head32 headStep31_conv_result1 = headStep31_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep31_conv_blockStep0"
  out.flush

theorem headStep28_conv_blockStep2 :
    convWithTail headStep28_conv_block2 head29 headStep28_conv_result3 = headStep28_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep28_conv_blockStep2"
  out.flush

theorem headStep27_conv_input :
    ratioA = headStep27_conv_suffix0 := by
  decide +kernel

theorem headStep25_conv_blockStep4 :
    convWithTail headStep25_conv_block4 head26 headStep25_conv_result5 = headStep25_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep25_conv_blockStep4"
  out.flush

theorem headStep23_conv_blockStep0 :
    convWithTail headStep23_conv_block0 head24 headStep23_conv_result1 = headStep23_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep23_conv_blockStep0"
  out.flush

theorem headStep20_conv_blockStep2 :
    convWithTail headStep20_conv_block2 head21 headStep20_conv_result3 = headStep20_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep20_conv_blockStep2"
  out.flush

theorem headStep17_conv_blockStep4 :
    convWithTail headStep17_conv_block4 head18 headStep17_conv_result5 = headStep17_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep17_conv_blockStep4"
  out.flush

theorem headStep15_conv_blockStep0 :
    convWithTail headStep15_conv_block0 head16 headStep15_conv_result1 = headStep15_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep15_conv_blockStep0"
  out.flush

theorem headStep12_conv_blockStep2 :
    convWithTail headStep12_conv_block2 head13 headStep12_conv_result3 = headStep12_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep12_conv_blockStep2"
  out.flush

theorem headStep11_conv_input :
    ratioA = headStep11_conv_suffix0 := by
  decide +kernel

theorem headStep9_conv_blockStep4 :
    convWithTail headStep9_conv_block4 head10 headStep9_conv_result5 = headStep9_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep9_conv_blockStep4"
  out.flush

theorem headStep7_conv_blockStep0 :
    convWithTail headStep7_conv_block0 head8 headStep7_conv_result1 = headStep7_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep7_conv_blockStep0"
  out.flush

theorem headStep4_conv_blockStep2 :
    convWithTail headStep4_conv_block2 head5 headStep4_conv_result3 = headStep4_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep4_conv_blockStep2"
  out.flush

theorem headStep1_conv_blockStep4 :
    convWithTail headStep1_conv_block4 head2 headStep1_conv_result5 = headStep1_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep1_conv_blockStep4"
  out.flush

theorem powerStep11_conv_input :
    pI = powerStep11_conv_suffix0 := by
  decide +kernel

theorem powerStep13_conv_blockStep0 :
    convWithTail powerStep13_conv_block0 power12 powerStep13_conv_result1 = powerStep13_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep13_conv_blockStep0"
  out.flush

theorem powerStep17_conv_blockStep2 :
    convWithTail powerStep17_conv_block2 power16 powerStep17_conv_result3 = powerStep17_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep17_conv_blockStep2"
  out.flush

theorem seed_product_step_conv_blockStep9 :
    convWithTail seed_product_step_conv_block9 power17 seed_product_step_conv_result10 = seed_product_step_conv_result9 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached seed_product_step_conv_blockStep9"
  out.flush

end Grothe.HaagerupCanonical.Trace
