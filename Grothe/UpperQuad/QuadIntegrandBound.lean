import Grothe.UpperQuad.QuadIntegrandExt
import Grothe.UpperQuad.QuadTaylorShift

/-!
# The `ℓ²` size of the extended integrand vector (part (Q) of `hQuad`)

The canonical head entries `canon = {(q, c, d) : q < 251, d ≤ q, c ≤ d + 1}` and the vector
`FextV ε z = (Fext ε q c d z)_{canon}`.  For every square root `ζ` of `z` and `0 < τ < 1`
(`norm_FextV_sq_le`):
```
‖FextV ε z‖² ≤ |e^{−z}|² τ^{−501} (1−τ²)⁻¹ exp(Re mehlerExp τ ζ ζ) ·
  Σ_{c+d ≤ 501} |Uext c d (ζ/w(z))|²,
```
by the factorisation `Fext = e^{−z} ε^{c+d} h_{n,m}(ζ,ζ) Uext` (`Fext_eq_mul`), the injection
`(q,c,d) ↦ ((q+1−c, q−d), (c, d))` into two triangles of total degree `≤ 501`, and the complex
Mehler bound.

Agent-ID: claude-b9ee. Refs #303.
-/

namespace Grothe.UpperQuad.QuadRem

open Complex Grothe.UpperChaos Grothe.UpperQuad.Mehler Grothe.UpperQuad.Explicit
open Grothe.UpperQuad.TaylorShift

noncomputable section

/-- The canonical head entries (irreducible: never let the elaborator evaluate the product). -/
@[irreducible] def canon : Finset (ℕ × ℕ × ℕ) :=
  ((Finset.range 251 ×ˢ Finset.range 252 ×ˢ Finset.range 251)).filter
    (fun x => x.2.2 ≤ x.1 ∧ x.2.1 ≤ x.2.2 + 1)

lemma mem_canon {x : ℕ × ℕ × ℕ} : x ∈ canon ↔ x.1 < 251 ∧ x.2.2 ≤ x.1 ∧ x.2.1 ≤ x.2.2 + 1 := by
  unfold canon
  rw [Finset.mem_filter, Finset.mem_product, Finset.mem_product, Finset.mem_range,
    Finset.mem_range, Finset.mem_range]
  constructor
  · rintro ⟨⟨h1, -, -⟩, h2, h3⟩; exact ⟨h1, h2, h3⟩
  · rintro ⟨h1, h2, h3⟩; exact ⟨⟨h1, by omega, by omega⟩, h2, h3⟩

/-- The vector of the canonical extended integrands. -/
def FextV (ε : ℝ) (z : ℂ) : EuclideanSpace ℂ canon :=
  WithLp.toLp 2 (fun x : canon => Fext ε x.1.1 x.1.2.1 x.1.2.2 z)

lemma norm_FextV_sq (ε : ℝ) (z : ℂ) :
    ‖FextV ε z‖ ^ 2 = ∑ x ∈ canon, ‖Fext ε x.1 x.2.1 x.2.2 z‖ ^ 2 := by
  rw [FextV, EuclideanSpace.norm_eq, Real.sq_sqrt (Finset.sum_nonneg fun _ _ => sq_nonneg _),
    ← Finset.sum_coe_sort canon]

lemma nrm_sq (p q : ℕ) : nrm p q ^ 2 = 1 / ((p.factorial : ℝ) * q.factorial) := by
  unfold nrm
  rw [inv_pow, Real.sq_sqrt (by positivity)]
  push_cast; rw [one_div]

/-- **The `ℓ²` bound of the extended integrand vector.** -/
theorem norm_FextV_sq_le (ε : ℝ) (hε : |ε| = 1) {z ζ : ℂ} (hζ : ζ ^ 2 = z) {τ : ℝ} (hτ0 : 0 < τ)
    (hτ1 : τ < 1) :
    ‖FextV ε z‖ ^ 2 ≤ ‖Complex.exp (-z)‖ ^ 2 * (τ⁻¹ ^ 501 *
      ((1 - τ ^ 2)⁻¹ * Real.exp (mehlerExp τ ζ ζ).re)) *
        sqSum 501 (fun c d => Uext c d (ζ / wC ε z)) := by
  set U : ℕ → ℕ → ℝ := fun c d => ‖Uext c d (ζ / wC ε z)‖ ^ 2 with hU
  set h : ℕ × ℕ → ℝ := fun nm => τ ^ (nm.1 + nm.2) * ‖Hf nm.1 nm.2 ζ ζ‖ ^ 2 /
    ((nm.1.factorial : ℝ) * nm.2.factorial) with hh
  have hE := norm_nonneg (Complex.exp (-z))
  -- each canonical term
  have hterm : ∀ x ∈ canon, ‖Fext ε x.1 x.2.1 x.2.2 z‖ ^ 2 ≤
      ‖Complex.exp (-z)‖ ^ 2 * τ⁻¹ ^ 501 *
        (h (x.1 + 1 - x.2.1, x.1 - x.2.2) * U x.2.1 x.2.2) := by
    intro x hx
    obtain ⟨hq, hd, hc⟩ := mem_canon.mp hx
    rw [Fext_eq_mul ε x.1 x.2.1 x.2.2 hc hζ]
    have hn : x.1 - x.2.2 + (x.2.2 + 1 - x.2.1) = x.1 + 1 - x.2.1 := by omega
    rw [hn]
    set n := x.1 + 1 - x.2.1
    set m := x.1 - x.2.2
    have hfac : (0 : ℝ) < (n.factorial : ℝ) * m.factorial := by positivity
    have key : ‖Complex.exp (-z) * (ε : ℂ) ^ (x.2.1 + x.2.2) *
        ((nrm n m : ℂ) * Hf n m ζ ζ) * Uext x.2.1 x.2.2 (ζ / wC ε z)‖ ^ 2 =
        ‖Complex.exp (-z)‖ ^ 2 * (‖Hf n m ζ ζ‖ ^ 2 / ((n.factorial : ℝ) * m.factorial)) *
          ‖Uext x.2.1 x.2.2 (ζ / wC ε z)‖ ^ 2 := by
      rw [norm_mul, norm_mul, norm_mul, norm_mul, norm_pow, Complex.norm_real, Real.norm_eq_abs,
        hε, one_pow, mul_one, Complex.norm_real, Real.norm_eq_abs, abs_of_pos (nrm_pos _ _)]
      rw [mul_pow, mul_pow, mul_pow, nrm_sq]
      field_simp
    rw [key]
    have hdeg : n + m ≤ 501 := by simp only [n, m]; omega
    have hτp : τ ^ 501 ≤ τ ^ (n + m) := pow_le_pow_of_le_one hτ0.le hτ1.le hdeg
    have hone : 1 ≤ τ⁻¹ ^ 501 * τ ^ (n + m) := by
      rw [inv_pow, le_inv_mul_iff₀ (by positivity), mul_one]; exact hτp
    have hrhs : ‖Complex.exp (-z)‖ ^ 2 * τ⁻¹ ^ 501 * (h (n, m) * U x.2.1 x.2.2) =
        ‖Complex.exp (-z)‖ ^ 2 * (τ⁻¹ ^ 501 * τ ^ (n + m)) *
          (‖Hf n m ζ ζ‖ ^ 2 / ((n.factorial : ℝ) * m.factorial)) *
            ‖Uext x.2.1 x.2.2 (ζ / wC ε z)‖ ^ 2 := by
      simp only [hh, hU]; ring
    rw [hrhs]
    have h1 : 0 ≤ ‖Complex.exp (-z)‖ ^ 2 := sq_nonneg _
    have h2 : 0 ≤ ‖Hf n m ζ ζ‖ ^ 2 / ((n.factorial : ℝ) * m.factorial) := by positivity
    have h3 : 0 ≤ ‖Uext x.2.1 x.2.2 (ζ / wC ε z)‖ ^ 2 := sq_nonneg _
    have := mul_le_mul_of_nonneg_left hone h1
    calc ‖Complex.exp (-z)‖ ^ 2 * (‖Hf n m ζ ζ‖ ^ 2 / ((n.factorial : ℝ) * m.factorial)) *
          ‖Uext x.2.1 x.2.2 (ζ / wC ε z)‖ ^ 2
        = (‖Complex.exp (-z)‖ ^ 2 * 1) * (‖Hf n m ζ ζ‖ ^ 2 / ((n.factorial : ℝ) * m.factorial)) *
          ‖Uext x.2.1 x.2.2 (ζ / wC ε z)‖ ^ 2 := by ring
      _ ≤ _ := by gcongr
  -- the injection into two triangles
  have hinj : ∑ x ∈ canon, h (x.1 + 1 - x.2.1, x.1 - x.2.2) * U x.2.1 x.2.2 ≤
      ∑ p ∈ tri 501 ×ˢ tri 501, h p.1 * U p.2.1 p.2.2 := by
    have := Finset.sum_le_sum_of_subset_of_nonneg
      (f := fun p : (ℕ × ℕ) × (ℕ × ℕ) => h p.1 * U p.2.1 p.2.2)
      (s := canon.image (fun x => ((x.1 + 1 - x.2.1, x.1 - x.2.2), (x.2.1, x.2.2))))
      (t := tri 501 ×ˢ tri 501) (by
        intro p hp
        obtain ⟨x, hx, rfl⟩ := Finset.mem_image.mp hp
        obtain ⟨hq, hd, hc⟩ := mem_canon.mp hx
        rw [Finset.mem_product, mem_tri, mem_tri]
        constructor <;> dsimp only <;> omega)
      (fun p _ _ => mul_nonneg (by simp only [hh]; positivity) (by simp only [hU]; positivity))
    rw [Finset.sum_image] at this
    · exact this
    · intro x hx y hy hxy
      simp only [Prod.mk.injEq] at hxy
      obtain ⟨⟨h1, h2⟩, h3, h4⟩ := hxy
      obtain ⟨hqx, hdx, hcx⟩ := mem_canon.mp hx
      obtain ⟨hqy, hdy, hcy⟩ := mem_canon.mp hy
      ext <;> omega
  have hprod : ∑ p ∈ tri 501 ×ˢ tri 501, h p.1 * U p.2.1 p.2.2 =
      (∑ nm ∈ tri 501, h nm) * sqSum 501 (fun c d => Uext c d (ζ / wC ε z)) := by
    rw [Finset.sum_product, sqSum, Finset.sum_mul_sum]
  have hmeh := sum_mehler_le τ hτ0.le hτ1 ζ ζ (tri 501)
  rw [norm_FextV_sq]
  have hsq := sqSum_nonneg 501 (fun c d => Uext c d (ζ / wC ε z))
  have hC : 0 ≤ ‖Complex.exp (-z)‖ ^ 2 * τ⁻¹ ^ 501 := by positivity
  calc ∑ x ∈ canon, ‖Fext ε x.1 x.2.1 x.2.2 z‖ ^ 2
      ≤ ∑ x ∈ canon, ‖Complex.exp (-z)‖ ^ 2 * τ⁻¹ ^ 501 *
          (h (x.1 + 1 - x.2.1, x.1 - x.2.2) * U x.2.1 x.2.2) := Finset.sum_le_sum hterm
    _ = ‖Complex.exp (-z)‖ ^ 2 * τ⁻¹ ^ 501 *
          ∑ x ∈ canon, h (x.1 + 1 - x.2.1, x.1 - x.2.2) * U x.2.1 x.2.2 := by
        rw [Finset.mul_sum]
    _ ≤ ‖Complex.exp (-z)‖ ^ 2 * τ⁻¹ ^ 501 *
          ((∑ nm ∈ tri 501, h nm) * sqSum 501 (fun c d => Uext c d (ζ / wC ε z))) := by
        rw [← hprod]; exact mul_le_mul_of_nonneg_left hinj hC
    _ ≤ ‖Complex.exp (-z)‖ ^ 2 * τ⁻¹ ^ 501 *
          (((1 - τ ^ 2)⁻¹ * Real.exp (mehlerExp τ ζ ζ).re) *
            sqSum 501 (fun c d => Uext c d (ζ / wC ε z))) :=
        mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_right hmeh hsq) hC
    _ = _ := by ring

end

end Grothe.UpperQuad.QuadRem
