import Grothe.LowerAnalytic.Reduction
import Grothe.LowerAnalytic.MassRowFrame
import Grothe.Lower.Cert.Rows
import Grothe.Lower.Cert.Envelope

/-!
# The lower bound of the witness with an identity tail, modulo its node caps

The witness `T = P₁,₀ − eP₂,₁ + ν(Id − P₁,₀ − P₂,₁)` with `(e, ν) = (191/250, 47/2000)` has the hat weight
`epsHat e ν = 25/31`, the weight `ε` of the rows, and the hat tail `nuHat ν = 47/1953`. For a unimodular pair `f, g`:

* the shared reduction (`reductionHyp_of_nodeCaps`, from the node caps `TailNodeCaps (nuHat ν)` of the potentials of the
  rows with the tail) and the checks of the rows (`rowData_facts`: `checkRow` for the plain rows, `checkSpecRow` for the
  spectral ones) give the scalar inequality of every row (`rowOf_of_shared`);
* the mass row gives `V̂ ≤ (1 − λ)t² + λ + S − ε‖Qh‖²` with `λ = 1/2` (`massRow_frame`), i.e. the scalar rows of its tangents;
* the envelope (`certEnvelope`, `env_bound_of_cells`) mixes them into `V̂ ≤ envB` for `t ∈ [0, 9/10]` (`profile_bound`).

The phase reduction turns the cap of the hat value into the cap `(1 − ν)envB + ν` of the witness (`witnessCap_cert`), and
the transfer gives `K ≥ 1/((1 − ν)envB + ν)` for every Grothendieck bound `K` (`lower_bound_of_tailNodeCaps`).
-/

open MeasureTheory Grothe.Lower

namespace Grothe.LowerAnalytic

noncomputable section

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- **The envelope caps the hat value**: the mass row and the shared reduction of the rows give `V ≤ envB` for
`t ∈ [0, 9/10]`. -/
theorem profile_bound (V t : ℝ) (Qh v : E) (hv : ‖v‖ ^ 2 = 2) (ht0 : 0 ≤ t) (ht1 : t ≤ 9 / 10)
    (hmass : V ≤ (1 - 1 / 2) * t ^ 2 + 1 / 2 + (massS : ℝ) - (ε : ℝ) * ‖Qh‖ ^ 2)
    (hred : SharedReduction rowData V t Qh v) : V ≤ (envB : ℝ) := by
  obtain ⟨Ω, _, μ, _, U, X1, X2, X3, τ, x, hM, hSI, hτ0, hτ1, hX, hshared⟩ := hred
  have hS : SteinCut μ U := steinCut_of_inputs μ hM hSI
  refine env_bound_of_cells rowData massS envB envCells certEnvelope (Qh := Qh) hv ht0 ht1 ?_
  rintro (_ | k) m a h
  · cases h
    exact rowOf_massTangent hmass m v
  · obtain ⟨r, hr, rfl⟩ := Option.map_eq_some_iff.1 h
    have hm := List.mem_of_getElem? hr
    exact rowOf_of_shared r (rowData_facts r hm) hM hS hτ0 hτ1 hX (hshared r hm)

/-- **The scalar cap of the witness** `(191/250, 47/2000)`, modulo the node caps of the rows with its tail. -/
theorem witnessCap_cert (hcaps : TailNodeCaps (nuHat (47 / 2000))) (n : ℕ) (hn : 2 ≤ n) :
    WitnessCap n (191 / 250) (47 / 2000) ((1 - 47 / 2000) * (envB : ℝ) + 47 / 2000) := by
  have he : epsHat (191 / 250) (47 / 2000) = ε := by norm_num [epsHat, ε]
  have hν : 2 * nuHat (47 / 2000) + 1 / 2 = (massC : ℝ) := by norm_num [nuHat, massC]
  obtain ⟨m, rfl⟩ : ∃ m, n = m + 1 := ⟨n - 1, by omega⟩
  refine witnessCap_of_VhatOf_le (m + 1) (by norm_num) fun f g hf hg _ => ?_
  obtain ⟨v, hv, hshared⟩ := reductionHyp_of_nodeCaps he hcaps (n := m) (by omega) f g hf hg
  exact profile_bound _ _ _ v hv (norm_nonneg _) (tOf_le (m + 1) hf hg)
    (massRow_frame (m + 1) (by omega) he hν hf hg) hshared

/-- **The lower bound, modulo the node caps**: `K ≥ 1/((1 − ν)envB + ν)` for every Grothendieck bound `K`, given the node
caps `TailNodeCaps (nuHat (47/2000))` of the potentials of the rows with the tail of the witness. -/
theorem lower_bound_of_tailNodeCaps (hcaps : TailNodeCaps (nuHat (47 / 2000))) {K : ℝ}
    (hK : IsGrothendieckBound K) : 1 / ((1 - 47 / 2000) * (envB : ℝ) + 47 / 2000) ≤ K :=
  transfer_lower (transferInputs_of_witnessCap (by norm_num) (by norm_num) 2
    fun n hn => witnessCap_cert hcaps n hn) hK

end

end Grothe.LowerAnalytic
