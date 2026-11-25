# Replaying the algebra in Lean

Agent-ID: codex-a7c4. The following standalone file imports the repository’s Gram certificate. From a checkout with the targeted module built, extract and run it with

```sh
sed -n '/^```lean$/,/^```$/p' research/conjecture-K/sources/radial-gram-comparison-codex-a7c4/KERNEL.md | sed '1d;$d' > /tmp/RadialGramComparison.lean
lake env lean /tmp/RadialGramComparison.lean
```

All four reported theorems use Lean’s standard axioms.

```lean
import Grothe.Lower.Gram
import Mathlib.Analysis.Real.Sqrt

set_option warningAsError true

namespace Grothe.Lower.RadialComparison

/-- Two rational dual certificates for the variance of the trace and the complex traceless part. -/
def balanced : GramData :=
  ⟨23/27, 23/54, 0, 0, 0, 32/27, 64/27, 128/27, 32/9, 0⟩

def tilted : GramData :=
  ⟨8, 4, 128/9, -(128/9), 128/9, 0, 0, 0, 128/3, 0⟩

theorem balanced_ok : gramCert 1 1 balanced = true := by decide +kernel
theorem tilted_ok : gramCert 8 11 tilted = true := by decide +kernel

/-- Interpolation over the entire cone. For the real Gaussian cubic, the premise can be
supplied by gram_budget_of_scalars and the spectral contraction identities. -/
theorem gram_cone {X C P Q : ℝ}
    (hg : ∀ (l m : ℚ) (g : GramData), gramCert l m g = true →
      (l : ℝ)*X + m*C ≤ g.A*P+g.B*Q)
    {l m : ℝ} (hl : l ≤ m) (hm : 8*m ≤ 11*l) :
    l*X + m*C ≤ (37*l+32*m)/162*(2*P+Q) := by
  have h1 := hg 1 1 balanced balanced_ok
  have h2 := hg 8 11 tilted tilted_ok
  norm_num [balanced] at h1
  norm_num [tilted] at h2
  have a := mul_le_mul_of_nonneg_left h1 (sub_nonneg.mpr hm)
  have b := mul_le_mul_of_nonneg_left h2 (sub_nonneg.mpr hl)
  linarith only [show (11*l-8*m)*(X+C) + (m-l)*(8*X+11*C) ≤
      (11*l-8*m)*(23/27*P+23/54*Q)+(m-l)*(8*P+4*Q) from add_le_add a b]

/-- A rational enclosure for the square of E‖T−I‖op after separate Cauchy inequalities. -/
theorem operator_budget {X C P Q : ℝ} (hx : 0 ≤ X) (hc : 0 ≤ C)
    (hg : ∀ (l m : ℚ) (g : GramData), gramCert l m g = true →
      (l : ℝ)*X + m*C ≤ g.A*P+g.B*Q) :
    (Real.sqrt X + Real.sqrt C)^2 ≤ 1281713/1506600*(2*P+Q) := by
  have hb := gram_cone hg (l := 193/100) (m := 193/93) (by norm_num) (by norm_num)
  nlinarith only [sq_nonneg (93*Real.sqrt X-100*Real.sqrt C), Real.sq_sqrt hx, Real.sq_sqrt hc, hb]

/-- Nuclear norm of the two-dimensional radial Stein Hessian for oscillation at most one.
Here n,m are conditional means inside and outside the test radius, and u is its test value. -/
theorem radial_hessian {n m u p : ℝ} (hn₀ : 0 ≤ n) (hn₁ : n ≤ 1)
    (hm₀ : 0 ≤ m) (hm₁ : m ≤ 1) (hu₀ : 0 ≤ u) (hu₁ : u ≤ 1)
    (hp₀ : 0 ≤ p) (hp₁ : 2*p ≤ 1) :
    |p*(n-m)|+|u-m-p*(n-m)| ≤ 1 := by
  have hlo : 0 ≤ 2*p*n+(1-2*p)*m := by positivity [sub_nonneg.mpr hp₁]
  have hhi : 2*p*n+(1-2*p)*m ≤ 1 := by
    nlinarith [mul_nonneg hp₀ (sub_nonneg.mpr hn₁),
      mul_nonneg (sub_nonneg.mpr hp₁) (sub_nonneg.mpr hm₁)]
  rcases le_total 0 (p*(n-m)) with h | h <;>
    rcases le_total 0 (u-m-p*(n-m)) with k | k <;>
    simp only [abs_of_nonneg, abs_of_nonpos, h, k] <;> linarith

/-- Optimal coefficient of the split trace / traceless Cauchy bound on the Gram relaxation. -/
theorem operator_budget_sharp {X C P Q : ℝ} (hx : 0 ≤ X) (hc : 0 ≤ C)
    (hg : ∀ (l m : ℚ) (g : GramData), gramCert l m g = true →
      (l : ℝ)*X + m*C ≤ g.A*P+g.B*Q) :
    (Real.sqrt X + Real.sqrt C)^2 ≤ ((Real.sqrt 74+8)/18)^2*(2*P+Q) := by
  let r : ℝ := Real.sqrt 74
  let a := 8*r/74
  let b := r/8
  have hr : 0 ≤ r := Real.sqrt_nonneg _
  have hr2 : r^2 = 74 := Real.sq_sqrt (by norm_num)
  have ha : 0 ≤ a := by dsimp [a]; positivity
  have hb : 0 ≤ b := by dsimp [b]; positivity
  have hab : a*b = 1 := by dsimp [a,b]; nlinarith only [hr2]
  have hx' := Real.sq_sqrt (mul_nonneg ha hx)
  have hc' := Real.sq_sqrt (mul_nonneg hb hc)
  have hp : Real.sqrt (a*X)*Real.sqrt (b*C) = Real.sqrt X*Real.sqrt C := by
    rw [← Real.sqrt_mul (mul_nonneg ha hx), ← Real.sqrt_mul hx]
    congr 1
    calc
      (a*X)*(b*C) = (a*b)*(X*C) := by ring
      _ = X*C := by rw [hab,one_mul]
  have hxy : 2*(Real.sqrt X*Real.sqrt C) ≤ a*X+b*C := by
    nlinarith only [sq_nonneg (Real.sqrt (a*X)-Real.sqrt (b*C)),hp,hx',hc']
  have h1 : 1+a ≤ 1+b := by dsimp [a,b]; linarith only [hr]
  have h2 : 8*(1+b) ≤ 11*(1+a) := by dsimp [a,b]; linarith only [hr]
  have hbudget := gram_cone hg h1 h2
  have hcoef : (37*(1+a)+32*(1+b))/162 = ((r+8)/18)^2 := by
    dsimp [a,b]
    nlinarith only [hr2]
  rw [hcoef] at hbudget
  calc
    _ ≤ (1+a)*X+(1+b)*C := by
      nlinarith only [hxy, Real.sq_sqrt hx, Real.sq_sqrt hc]
    _ ≤ _ := hbudget

end Grothe.Lower.RadialComparison
#print axioms Grothe.Lower.RadialComparison.gram_cone
#print axioms Grothe.Lower.RadialComparison.operator_budget
#print axioms Grothe.Lower.RadialComparison.radial_hessian

#print axioms Grothe.Lower.RadialComparison.operator_budget_sharp
```
