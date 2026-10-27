import Grothe.UpperChaos.GradedHermiteFn
import Grothe.UpperChaos.TaylorInnerLaplace
import Grothe.UpperChaos.PhiDense

/-!
# Polynomial slices of the actual Taylor source

Fixing the first complex coordinate leaves an existing `CPoly` in the
second coordinate. The full inherited phase term list is kept symbolic.
The damping is factored outside the polynomial and its conditional radial
rate is `1 + j * phaseEpsQ`.

Agent-ID: codex-1456
-/

open Complex MvPolynomial
open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

/-- A finite graded center as a polynomial in its second complex coordinate. -/
def gradedHermiteSlice (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) (z : ℂ) : CPoly :=
  ∑ i ∈ gradedSupport N,
    C ((gradedHermiteCoeff a i : ℂ) * (nrm2 i : ℂ) * ev z (H i.1.1 i.1.2)) *
      H i.2.1 i.2.2

theorem ev_gradedHermiteSlice (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) (z w : ℂ) :
    ev w (gradedHermiteSlice N a z) = gradedHermiteFn N a (z, w) := by
  classical
  simp only [gradedHermiteSlice, ev, map_sum, map_mul, eval_C, gradedHermiteFn,
    hfun2, H2]
  refine Finset.sum_congr rfl (fun i _ => ?_)
  ring

/-- The squared second-coordinate radius, as a complex polynomial. -/
def phaseNormSlice : CPoly := X 0 * X 1

/-- The real part of the invariant `conj z * w`, with the first coordinate fixed. -/
def phaseRealSlice (z : ℂ) : CPoly :=
  C (1 / 2 : ℂ) * (C (conj z) * X 0 + C z * X 1)

/-- The imaginary part of `conj z * w`, with the first coordinate fixed. -/
def phaseImagSlice (z : ℂ) : CPoly :=
  C (-I / 2) * (C (conj z) * X 0 - C z * X 1)

theorem ev_phaseNormSlice (w : ℂ) :
    ev w phaseNormSlice = (normSq w : ℂ) := by
  simp [phaseNormSlice, ev, zv, Complex.mul_conj]

theorem ev_phaseRealSlice (z w : ℂ) :
    ev w (phaseRealSlice z) = ((conj z * w).re : ℂ) := by
  have hc : z * conj w = conj (conj z * w) := by simp
  simp only [phaseRealSlice, ev, map_mul, map_add, eval_C, eval_X, zv,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_fin_one]
  rw [hc, Complex.add_conj]
  push_cast
  ring

theorem ev_phaseImagSlice (z w : ℂ) :
    ev w (phaseImagSlice z) = ((conj z * w).im : ℂ) := by
  have hc : z * conj w = conj (conj z * w) := by simp
  simp only [phaseImagSlice, ev, map_mul, map_sub, eval_C, eval_X, zv,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_fin_one]
  rw [hc, Complex.sub_conj]
  push_cast
  calc
    -I / 2 * (2 * ((conj z * w).im : ℂ) * I) =
        -((conj z * w).im : ℂ) * I ^ 2 := by ring
    _ = ((conj z * w).im : ℂ) := by rw [I_sq]; ring

/-- The full invariant polynomial `S` in a fixed first-coordinate slice. -/
def phaseInvariantSlice (ts : List ((ℕ × ℕ × ℕ) × ℚ)) (z : ℂ) : CPoly :=
  (ts.map fun b => C (b.2 : ℂ) * C (normSq z : ℂ) ^ b.1.1 *
    phaseNormSlice ^ b.1.2.1 * phaseRealSlice z ^ b.1.2.2).sum

theorem ev_phaseInvariantSlice (ts : List ((ℕ × ℕ × ℕ) × ℚ)) (z w : ℂ) :
    ev w (phaseInvariantSlice ts z) =
      (Ssum ts (normSq z) (normSq w) (conj z * w).re : ℂ) := by
  classical
  induction ts with
  | nil => simp [phaseInvariantSlice, Ssum, ev]
  | cons b ts ih =>
      have hterm : ev w
          (C (b.2 : ℂ) * C (normSq z : ℂ) ^ b.1.1 *
            phaseNormSlice ^ b.1.2.1 * phaseRealSlice z ^ b.1.2.2) =
          (((b.2 : ℝ) * normSq z ^ b.1.1 * normSq w ^ b.1.2.1 *
            (conj z * w).re ^ b.1.2.2 : ℝ) : ℂ) := by
        simp only [ev, map_mul, map_pow, eval_C]
        change (b.2 : ℂ) * (normSq z : ℂ) ^ b.1.1 *
          ev w phaseNormSlice ^ b.1.2.1 * ev w (phaseRealSlice z) ^ b.1.2.2 = _
        rw [ev_phaseNormSlice, ev_phaseRealSlice]
        simp only [Complex.ofReal_mul, Complex.ofReal_pow, Complex.ofReal_ratCast]
      change MvPolynomial.eval (zv w)
          (C (b.2 : ℂ) * C (normSq z : ℂ) ^ b.1.1 *
            phaseNormSlice ^ b.1.2.1 * phaseRealSlice z ^ b.1.2.2 +
              phaseInvariantSlice ts z) =
          (((b.2 : ℝ) * normSq z ^ b.1.1 * normSq w ^ b.1.2.1 *
            (conj z * w).re ^ b.1.2.2 +
              Ssum ts (normSq z) (normSq w) (conj z * w).re : ℝ) : ℂ)
      rw [map_add]
      change ev w _ + ev w _ = _
      rw [hterm, ih, Complex.ofReal_add]

/-- The undamped factor `i*D*S` of the actual phase in one conditional coordinate. -/
def phasePowerSlice (ts : List ((ℕ × ℕ × ℕ) × ℚ)) (z : ℂ) : CPoly :=
  C I * phaseImagSlice z * phaseInvariantSlice ts z

theorem ev_phasePowerSlice (ts : List ((ℕ × ℕ × ℕ) × ℚ)) (z w : ℂ) :
    ev w (phasePowerSlice ts z) = I * ((conj z * w).im : ℂ) *
      (Ssum ts (normSq z) (normSq w) (conj z * w).re : ℂ) := by
  simp only [phasePowerSlice, ev, map_mul, eval_C]
  change I * ev w (phaseImagSlice z) * ev w (phaseInvariantSlice ts z) = _
  rw [ev_phaseImagSlice, ev_phaseInvariantSlice]

/-- The polynomial source in the conditional coordinate, with damping removed. -/
def taylorSourceSlice (ts : List ((ℕ × ℕ × ℕ) × ℚ)) (j N : ℕ)
    (a : ℕ → ℕ → ℕ → ℚ) (z : ℂ) : CPoly :=
  conjP (gradedHermiteSlice N a z) * phasePowerSlice ts z ^ j

theorem ev_taylorSourceSlice (ts : List ((ℕ × ℕ × ℕ) × ℚ)) (j N : ℕ)
    (a : ℕ → ℕ → ℕ → ℚ) (z w : ℂ) :
    ev w (taylorSourceSlice ts j N a z) =
      conj (gradedHermiteFn N a (z, w)) *
        (I * ((conj z * w).im : ℂ) *
          (Ssum ts (normSq z) (normSq w) (conj z * w).re : ℂ)) ^ j := by
  simp only [taylorSourceSlice, ev, map_mul, map_pow]
  change ev w (conjP (gradedHermiteSlice N a z)) * ev w (phasePowerSlice ts z) ^ j = _
  rw [ev_conjP, ev_gradedHermiteSlice, ev_phasePowerSlice]

/-- Factoring the damping leaves the exact finite polynomial slice at every point. -/
theorem taylor_source_eq_slice (ts : List ((ℕ × ℕ × ℕ) × ℚ)) (eps : ℝ) (j N : ℕ)
    (a : ℕ → ℕ → ℕ → ℚ) (z w : ℂ) :
    conj (gradedHermiteFn N a (z, w)) *
      (I * (((conj z * w).im *
        Real.exp (-eps * (normSq z + normSq w)) *
          Ssum ts (normSq z) (normSq w) (conj z * w).re : ℝ) : ℂ)) ^ j =
      (Real.exp (-(j : ℝ) * eps * normSq z) : ℂ) *
        ev w (taylorSourceSlice ts j N a z) *
          (Real.exp (-(j : ℝ) * eps * normSq w) : ℂ) := by
  let B : ℂ := I * ((conj z * w).im : ℂ) *
    (Ssum ts (normSq z) (normSq w) (conj z * w).re : ℂ)
  have hphase :
      I * (((conj z * w).im * Real.exp (-eps * (normSq z + normSq w)) *
          Ssum ts (normSq z) (normSq w) (conj z * w).re : ℝ) : ℂ) =
        B * (Real.exp (-eps * (normSq z + normSq w)) : ℂ) := by
    dsimp only [B]
    push_cast
    ring
  have he : Real.exp (-eps * (normSq z + normSq w)) ^ j =
      Real.exp (-(j : ℝ) * eps * normSq z) *
        Real.exp (-(j : ℝ) * eps * normSq w) := by
    rw [← Real.exp_nat_mul, ← Real.exp_add]
    congr 1
    ring
  have heC := congrArg (fun r : ℝ => (r : ℂ)) he
  simp only [Complex.ofReal_pow, Complex.ofReal_mul] at heC
  rw [hphase, mul_pow, heC, ev_taylorSourceSlice]
  dsimp only [B]
  ring

/-- The production source is the polynomial slice with its actual radial damping. -/
theorem taylorInnerSource_gradedHermite_eq_slice (j N : ℕ)
    (a : ℕ → ℕ → ℕ → ℚ) (z w : ℂ) :
    taylorInnerSource j (gradedHermiteFn N a) (z, w) =
      (Real.exp (-(j : ℝ) * (Grothe.Upper.phaseEpsQ : ℝ) * normSq z) : ℂ) *
        ev w (taylorSourceSlice phaseTerms j N a z) *
          (Real.exp (-((1 + (j : ℝ) * (Grothe.Upper.phaseEpsQ : ℝ)) - 1) *
            normSq w) : ℂ) := by
  have h := taylor_source_eq_slice phaseTerms (Grothe.Upper.phaseEpsQ : ℝ) j N a z w
  simpa only [taylorInnerSource, taylorPhasePower, phiT, Sphase, Ssum,
    Complex.normSq_eq_norm_sq, add_sub_cancel_left, neg_mul] using h

end
end Grothe.UpperChaos
