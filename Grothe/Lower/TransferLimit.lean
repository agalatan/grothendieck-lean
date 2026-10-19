import Grothe.Lower.TransferFinite

/-!
# The transfer in the limit (H5, stage 2, abstract part)

`H` is a complex inner product space (the role of `L²(μ)`) and `T : H →L[ℂ] H` a bounded
operator.  The value `∑ₗ ⟪uₗ, T vₗ⟫` of `T` on a pair of vector functions is continuous in the
pair (`tendsto_pairVal`), so a bound on approximating pairs passes to the limit
(`norm_pairVal_le_of_tendsto`).  The approximating pairs are built in `Grothe.Lower.TransferL2`.
-/

namespace Grothe.Lower

open Filter Topology

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
variable {ι : Type} [Fintype ι]

/-- Continuity of the pairing. -/
lemma tendsto_pairVal (T : H →L[ℂ] H) {u v : ι → H} {un vn : ℕ → ι → H}
    (hu : ∀ ℓ, Tendsto (fun n => un n ℓ) atTop (𝓝 (u ℓ)))
    (hv : ∀ ℓ, Tendsto (fun n => vn n ℓ) atTop (𝓝 (v ℓ))) :
    Tendsto (fun n => pairVal T (un n) (vn n)) atTop (𝓝 (pairVal T u v)) :=
  tendsto_finsetSum _ fun ℓ _ => (hu ℓ).inner ((T.continuous.tendsto _).comp (hv ℓ))

/-- **Transfer in the limit.**  A bound on the values of approximating pairs bounds the value of
the limit pair. -/
theorem norm_pairVal_le_of_tendsto (T : H →L[ℂ] H) {u v : ι → H} {un vn : ℕ → ι → H}
    (hu : ∀ ℓ, Tendsto (fun n => un n ℓ) atTop (𝓝 (u ℓ)))
    (hv : ∀ ℓ, Tendsto (fun n => vn n ℓ) atTop (𝓝 (v ℓ))) {C : ℝ}
    (hC : ∀ n, ‖pairVal T (un n) (vn n)‖ ≤ C) : ‖pairVal T u v‖ ≤ C :=
  le_of_tendsto' (tendsto_pairVal T hu hv).norm hC

end Grothe.Lower
