import Grothe.UpperChaos.ActualSourceNormEvaluation
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
# Strict transitive audit for the actual source-norm Gram evaluator

Agent-ID: codex-2ca4.

The exact finite source-norm formula and its actual weighted matrix-energy
bound use only the standard Lean axioms. These WIP proof bodies and guards
await compilation; no numerical source-norm certificate is supplied here.
-/

open Lean Elab Command

run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let targets : Array Name := #[
    ``Grothe.UpperChaos.ActualSourceNormEvaluation.gramValue_actual_eq_sourceNormValue,
    ``Grothe.UpperChaos.ActualSourceNormEvaluation.integral_scaledTransform_sq_eq_value,
    ``Grothe.UpperChaos.ActualSourceNormEvaluation.pairGram_eq_gatePairValue,
    ``Grothe.UpperChaos.ActualSourceNormEvaluation.sourceNormValue_im_eq_zero,
    ``Grothe.UpperChaos.ActualSourceNormEvaluation.sourceNormValue_re_nonneg,
    ``Grothe.UpperChaos.ActualSourceNormEvaluation.tsum_actual_matrix_energy_le_value,
    ``Grothe.UpperChaos.ActualSourceNormGram.complex_integral_eval_sq_eq_gram,
    ``Grothe.UpperChaos.ActualSourceNormGram.gramValue_im_eq_zero,
    ``Grothe.UpperChaos.ActualSourceNormGram.gramValue_re_nonneg,
    ``Grothe.UpperChaos.ActualSourceNormGram.integrable_tensor_cross,
    ``Grothe.UpperChaos.ActualSourceNormGram.integral_eval_sq_eq_gram_re,
    ``Grothe.UpperChaos.ActualSourceNormGram.integral_scaledTransform_sq_eq_gram,
    ``Grothe.UpperChaos.ActualSourceNormGram.integral_tensor_cross,
    ``Grothe.UpperChaos.ActualSourceNormGram.tsum_actual_matrix_energy_le_gram,
    ``Grothe.UpperChaos.BipartiteKernelGramEvaluation.ev4_conditionalP4,
    ``Grothe.UpperChaos.BipartiteKernelGramEvaluation.ev4_conjugateLinearPolynomial,
    ``Grothe.UpperChaos.BipartiteKernelGramEvaluation.ev4_linearPolynomial,
    ``Grothe.UpperChaos.BipartiteKernelGramEvaluation.ev4_outerPolynomial,
    ``Grothe.UpperChaos.BipartiteKernelGramEvaluation.ev4_shiftedMomentPolynomial,
    ``Grothe.UpperChaos.BipartiteKernelGramEvaluation.integral_ev4_quadraticWeight,
    ``Grothe.UpperChaos.BipartiteKernelGramEvaluation.integral_gramIntegrand_eq_value,
    ``Grothe.UpperChaos.BipartiteKernelGramEvaluation.integral_pairing_eq_value,
    ``Grothe.UpperChaos.BipartiteKernelGramMoments.exp_image_sq_eq_quadraticWeight,
    ``Grothe.UpperChaos.BipartiteKernelGramMoments.gramIntegrand_eq_pairing,
    ``Grothe.UpperChaos.BipartiteKernelGramMoments.gramIntegrand_factor,
    ``Grothe.UpperChaos.BipartiteKernelGramMoments.integrable_gramIntegrand,
    ``Grothe.UpperChaos.BipartiteKernelGramMoments.integrable_gramIntegrand_inner,
    ``Grothe.UpperChaos.BipartiteKernelGramMoments.integrable_tiltedMonomial,
    ``Grothe.UpperChaos.BipartiteKernelGramMoments.integral_gramIntegrand_eq_conditional,
    ``Grothe.UpperChaos.BipartiteKernelGramMoments.integral_gramIntegrand_inner,
    ``Grothe.UpperChaos.BipartiteKernelGramMoments.integral_tiltedMonomial,
    ``Grothe.UpperChaos.BipartiteKernelGramMoments.norm_kernel_sq_factor]
  for target in targets do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
