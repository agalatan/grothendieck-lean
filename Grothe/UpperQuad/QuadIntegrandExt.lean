import Grothe.UpperQuad.CanonicalExplicit
import Grothe.UpperQuad.QuadMehler
import Grothe.UpperQuad.QuadPanelCover

/-!
# The complex extension of the node integrands (part (Q) of `hQuad`)

On a panel where the profile has the constant sign `ε`, the real node integrand
`f_{qcd}(s) = ψ_{d+1−c,q−d}(s) e^{−s} nodeCoef s (c,d)` of a canonical entry (`c ≤ d + 1`) is the
restriction of
```
F_{qcd}(z) = e^{−z} ε^{c+d} nrm(n,m) Q_{k,j}(z) G_{c,d}(z),
    k = d+1−c, j = q−d, n = j+k, m = j,
```
where `Q_{k,j}` is a polynomial with `Hf n m ζ ζ = ζ^k Q_{k,j}(ζ²)` (`Hf_diag`) and
`G_{c,d}(z) = ζ^k Uext c d (ζ/w(z))` for `ζ² = z`, `w = κ ε v(z)` (`Gcd_eq`), written without square
roots so that `F` is analytic wherever `v ≠ 0`.  `vC` is the profile with complex argument.

Agent-ID: claude-b9ee. Refs #303.
-/

namespace Grothe.UpperQuad.QuadRem

open Complex Grothe.UpperChaos Grothe.UpperQuad.Mehler Grothe.UpperQuad.Explicit

noncomputable section

/-! ### The profile with complex argument -/

/-- The coefficient of `s^k` in `vprof`. -/
def vcoef (k : ℕ) : ℝ :=
  ∑ j ∈ Finset.range 12, if k ≤ j then
    ((Upper.profileQ.getD j 0 : ℚ) : ℝ) * ((-1) ^ k * binHalf j k / (k.factorial : ℝ)) / nrmHalf j
  else 0

/-- The profile as a polynomial in a complex variable. -/
def vC (z : ℂ) : ℂ := ∑ k ∈ Finset.range 12, (vcoef k : ℂ) * z ^ k

lemma profileQ_length : Upper.profileQ.length = 12 := by decide

lemma vC_ofReal (s : ℝ) : vC (s : ℂ) = (vprof s : ℂ) := by
  unfold vC vprof lagHalf vcoef
  rw [profileQ_length]
  push_cast
  simp_rw [Finset.sum_mul]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro j hj
  rw [Finset.mul_sum, Finset.sum_div]
  rw [← Finset.sum_range_add_sum_Ico _ (show j + 1 ≤ 12 by
    have := Finset.mem_range.mp hj; omega)]
  rw [Finset.sum_eq_zero (s := Finset.Ico (j + 1) 12) (fun k hk => by
    have := (Finset.mem_Ico.mp hk).1
    simp [show ¬ k ≤ j by omega]), add_zero]
  apply Finset.sum_congr rfl
  intro k hk
  have hkj : k ≤ j := by have := Finset.mem_range.mp hk; omega
  simp only [hkj, ite_true]
  push_cast
  ring

lemma differentiable_vC : Differentiable ℂ vC := by
  unfold vC; fun_prop

/-! ### The primary factor -/

/-- `Q_{k,j}(z) = Σ_{t ≤ j} (−1)^t C(j+k, t) j^{\underline t} z^{j−t}`. -/
def Qp (k j : ℕ) (z : ℂ) : ℂ :=
  ∑ t ∈ Finset.range (j + 1), ((-1 : ℂ) ^ t * ((j + k).choose t : ℂ) * (j.descFactorial t : ℂ)) *
    z ^ (j - t)

lemma Hf_diag (k j : ℕ) (ζ : ℂ) : Hf (j + k) j ζ ζ = ζ ^ k * Qp k j (ζ ^ 2) := by
  unfold Hf Qp
  rw [Finset.mul_sum]
  rw [← Finset.sum_range_add_sum_Ico _ (show j + 1 ≤ j + k + 1 by omega)]
  rw [Finset.sum_eq_zero (s := Finset.Ico (j + 1) (j + k + 1)) (fun t ht => by
    have := (Finset.mem_Ico.mp ht).1
    rw [Nat.descFactorial_eq_zero_iff_lt.mpr (by omega)]
    simp), add_zero]
  apply Finset.sum_congr rfl
  intro t ht
  have htj : t ≤ j := by have := Finset.mem_range.mp ht; omega
  rw [← pow_mul, show j + k - t = k + (j - t) by omega,
    show 2 * (j - t) = (j - t) + (j - t) by ring,
    pow_add, pow_add]
  ring

lemma differentiable_Qp (k j : ℕ) : Differentiable ℂ (Qp k j) := by
  unfold Qp; fun_prop

/-! ### The conditional factor -/

/-- `κ = √(1 + a²)`. -/
def kappa : ℝ := Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2)

/-- The scaled profile `w(z) = κ ε v(z)`. -/
def wC (ε : ℝ) (z : ℂ) : ℂ := (kappa : ℂ) * (ε : ℂ) * vC z

/-- `G_{c,d}(z) = ζ^{d+1−c} Uext c d (ζ / w(z))` written without square roots. -/
def Gcd (ε : ℝ) (c d : ℕ) (z : ℂ) : ℂ :=
  (∑ i ∈ Finset.range (c + 1), (c.choose i : ℂ) * ((d + 1).descFactorial i : ℂ) *
    (-1) ^ (c + d - i) * (z ^ (d + 1 - i) * (wC ε z)⁻¹ ^ (c + d + 1 - 2 * i)) *
      Phi (c + d - i) (z * (wC ε z)⁻¹ ^ 2)) /
    ((Real.sqrt ((c.factorial : ℝ) * d.factorial * Real.pi) : ℝ) : ℂ)

/-- **`G` is `ζ^k Uext` at the shift `ζ/w`** for any square root `ζ` of `z`. -/
theorem Gcd_eq (ε : ℝ) (c d : ℕ) (hc : c ≤ d + 1) {z ζ : ℂ} (hζ : ζ ^ 2 = z) :
    Gcd ε c d z = ζ ^ (d + 1 - c) * Uext c d (ζ / wC ε z) := by
  unfold Gcd Uext Dcd
  rw [mul_div_assoc', Finset.mul_sum]
  congr 1
  apply Finset.sum_congr rfl
  intro i hi
  have hic : i ≤ c := by have := Finset.mem_range.mp hi; omega
  by_cases hid : i ≤ d + 1
  · have hpow : ζ ^ (d + 1 - c) * (ζ / wC ε z) ^ (c + d + 1 - 2 * i) =
        z ^ (d + 1 - i) * (wC ε z)⁻¹ ^ (c + d + 1 - 2 * i) := by
      rw [div_eq_mul_inv, mul_pow, ← mul_assoc, ← pow_add, ← hζ, ← pow_mul]
      congr 2
      omega
    have hsq : (ζ / wC ε z) ^ 2 = z * (wC ε z)⁻¹ ^ 2 := by
      rw [div_eq_mul_inv, mul_pow, hζ]
    rw [hsq, ← hpow]
    ring
  · push Not at hid
    rw [Nat.descFactorial_eq_zero_iff_lt.mpr hid]
    simp

/-! ### The extension -/

/-- **The complex extension of the canonical node integrand** `(q, c, d)` on a panel of sign `ε`. -/
def Fext (ε : ℝ) (q c d : ℕ) (z : ℂ) : ℂ :=
  Complex.exp (-z) * (ε : ℂ) ^ (c + d) * (nrm (q - d + (d + 1 - c)) (q - d) : ℂ) *
    Qp (d + 1 - c) (q - d) z * Gcd ε c d z

/-- `F` is analytic wherever the profile does not vanish. -/
theorem differentiableAt_Fext (ε : ℝ) (hε : ε ≠ 0) (q c d : ℕ) {z : ℂ} (hv : vC z ≠ 0) :
    DifferentiableAt ℂ (Fext ε q c d) z := by
  have hw : wC ε z ≠ 0 := by
    unfold wC
    have hk : (kappa : ℂ) ≠ 0 := by
      unfold kappa
      exact_mod_cast (Real.sqrt_pos.mpr (by positivity)).ne'
    exact mul_ne_zero (mul_ne_zero hk (by exact_mod_cast hε)) hv
  have hwd : DifferentiableAt ℂ (wC ε) z := by
    unfold wC; exact (differentiable_vC z).const_mul _
  have hinv : DifferentiableAt ℂ (fun z => (wC ε z)⁻¹) z := hwd.inv hw
  unfold Fext Gcd
  refine DifferentiableAt.mul ?_ (DifferentiableAt.div_const ?_ _)
  · exact ((((differentiableAt_id.neg.cexp).mul_const _).mul_const _).mul
      ((differentiable_Qp _ _) z))
  · apply DifferentiableAt.fun_sum
    intro i _
    apply DifferentiableAt.mul
    · exact (differentiableAt_const _).mul ((differentiableAt_id.pow _).mul (hinv.pow _))
    · exact ((differentiable_Phi _) _).comp z (differentiableAt_id.mul (hinv.pow _))

/-- The factorisation of `F` at any square root `ζ` of `z`. -/
theorem Fext_eq_mul (ε : ℝ) (q c d : ℕ) (hc : c ≤ d + 1) {z ζ : ℂ} (hζ : ζ ^ 2 = z) :
    Fext ε q c d z = Complex.exp (-z) * (ε : ℂ) ^ (c + d) *
      ((nrm (q - d + (d + 1 - c)) (q - d) : ℂ) * Hf (q - d + (d + 1 - c)) (q - d) ζ ζ) *
        Uext c d (ζ / wC ε z) := by
  unfold Fext
  rw [Gcd_eq ε c d hc hζ, Hf_diag, hζ]
  ring

/-- **On the real panel the extension is the node integrand.** -/
theorem Fext_ofReal (q c d : ℕ) (_hd : d ≤ q) (hc : c ≤ d + 1) {s : ℝ} (hs : 0 < s)
    (hv : vprof s ≠ 0) :
    Fext (F0ConditionalEvaluator.profileSign s) q c d s = (nodeF q c d s : ℂ) := by
  set ε := F0ConditionalEvaluator.profileSign s with hεdef
  have hζ : ((Real.sqrt s : ℝ) : ℂ) ^ 2 = (s : ℂ) := by
    rw [← Complex.ofReal_pow, Real.sq_sqrt hs.le]
  rw [Fext_eq_mul ε q c d hc hζ]
  -- the primary factor
  have hprim : (nrm (q - d + (d + 1 - c)) (q - d) : ℂ) *
      Hf (q - d + (d + 1 - c)) (q - d) (Real.sqrt s : ℂ) (Real.sqrt s : ℂ) =
      (RadialLaguerre.radialFactor (d + 1 - c) (q - d) s : ℂ) := by
    rw [← RadialLaguerre.hfun_radial_laguerre (d + 1 - c) (q - d) hs.le]
    unfold hfun
    rw [ev_H_eq_Hf, Complex.conj_ofReal]
  -- the shift
  have hw : wC ε (s : ℂ) = (F0ConditionalEvaluator.profileScale s : ℂ) := by
    unfold wC F0ConditionalEvaluator.profileScale
    rw [vC_ofReal]
    have hsign : ε * vprof s = |vprof s| := by
      rw [hεdef]
      unfold F0ConditionalEvaluator.profileSign
      by_cases h : vprof s < 0
      · simp [h, abs_of_neg h]
      · simp [h, abs_of_nonneg (le_of_not_gt h)]
    unfold kappa
    push_cast
    rw [mul_assoc, ← Complex.ofReal_mul, hsign]
  have hshift : (Real.sqrt s : ℂ) / wC ε (s : ℂ) =
      ((F0ConditionalEvaluator.profileShift s : ℝ) : ℂ) := by
    rw [hw]; unfold F0ConditionalEvaluator.profileShift; push_cast; rfl
  have hA : F0ConditionalEvaluator.profileShift s ≠ 0 := by
    unfold F0ConditionalEvaluator.profileShift
    exact div_ne_zero (Real.sqrt_pos.mpr hs).ne'
      (F0ConditionalEvaluator.profileScale_pos s hv).ne'
  rw [hprim, hshift, ← canonicalCoefficient_eq_Uext _ hA,
    F0ConditionalEvaluator.canonicalCoefficient_eq_ofReal_re]
  unfold nodeF nodeCoef
  push_cast
  ring

end

end Grothe.UpperQuad.QuadRem
