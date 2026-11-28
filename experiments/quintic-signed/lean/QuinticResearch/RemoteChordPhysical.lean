import QuinticResearch.RemoteChordSound
import Grothe.LowerAnalytic.Bernstein2

namespace Grothe.LowerAnalytic.RemoteRadial
open Finset

/-- Expanded radial denominator for arbitrary real debit and radius. -/
noncomputable def radialDen (s d x : ℝ) : ℝ :=
  2*(nu:ℝ)+s*(muLower:ℝ)*x*((1-(nu:ℝ)-(beta:ℝ)/2-3*d/8)+
    ((beta:ℝ)/4+3*d/8)*x^2-d*x^4/16)

/-- The coefficient array checked by Lean evaluates to the chord times the
radial denominator minus one. The identity has no restriction on the debit. -/
theorem chord_product_eq (c : ℚ × ℚ) (s d : ℚ) (x : ℝ) :
    let p := add (times [c.1,0,c.2] (denominator s d)) [-1]
    (∑ j ∈ range p.length, (coeff p j:ℝ)*x^j) =
      ((c.1:ℝ)+(c.2:ℝ)*x^2)*radialDen s d x-1 := by
  norm_num [add, times, coeff, denominator, sumTo, List.range_succ, List.foldl_append,
    Finset.sum_range_succ, radialDen]
  ring


/-- The same affine price bounds the inverse radial denominator for every
real debit between its rational endpoint checks. -/
theorem reciprocal_chord {i : ℕ} (hi : i < 32) {s : ℚ} (hs : s ∈ ([1,2]:List ℚ))
    {d x : ℝ} (hd : 0 ≤ d) (hd' : d ≤ (nu:ℝ))
    (hx0 : (edge i:ℝ) ≤ x) (hx1 : x ≤ (edge (i+1):ℝ)) :
    let c := chord s (edge i) (edge (i+1))
    (radialDen s d x)⁻¹ ≤ (c.1:ℝ)+(c.2:ℝ)*x^2 := by
  let c := chord s (edge i) (edge (i+1))
  let line := (c.1:ℝ)+(c.2:ℝ)*x^2
  have he (d₀ : ℚ) (he : d₀ ∈ ([0,nu]:List ℚ)) : 0 ≤ line*radialDen s d₀ x-1 := by
    have h := chord_polynomial_nonneg hi hs he hx0 hx1
    dsimp only at h
    rw [chord_product_eq] at h
    exact h
  have hzero := he 0 (by simp)
  have hnu := he nu (by simp)
  have hbase : (0:ℝ)<(nu:ℝ) := by norm_num [nu]
  have affine : (nu:ℝ)*(line*radialDen s d x-1) =
      ((nu:ℝ)-d)*(line*radialDen s 0 x-1)+d*(line*radialDen s nu x-1) := by
    unfold radialDen
    ring
  have hmult : 0 ≤ (nu:ℝ)*(line*radialDen s d x-1) := by
    rw [affine]
    exact add_nonneg (mul_nonneg (sub_nonneg.mpr hd') (by simpa using hzero)) (mul_nonneg hd hnu)
  have hprod := (mul_nonneg_iff_of_pos_left hbase).mp hmult
  have hgrid : (List.range 32).all (fun j => decide (0 ≤ edge j ∧ edge (j+1) ≤ 6)) = true := by decide +kernel
  have he' : 0 ≤ edge i ∧ edge (i+1) ≤ 6 :=
    of_decide_eq_true (List.all_eq_true.mp hgrid i (List.mem_range.mpr hi))
  have hx : 0 ≤ x := le_trans (by exact_mod_cast he'.1) hx0
  have hx6 : x ≤ 6 := le_trans hx1 (by exact_mod_cast he'.2)
  have hx2 : x^2 ≤ (36:ℝ) := by nlinarith only [mul_nonneg (sub_nonneg.mpr hx6) (by linarith only [hx] : 0≤6+x)]
  have hq : 0 < ((1-(nu:ℝ)-(beta:ℝ)/2-3*d/8)+
      ((beta:ℝ)/4+3*d/8)*x^2-d*x^4/16) := by
    have hν : d ≤ 47/2000 := by simpa [nu] using hd'
    have hβ : (beta:ℝ) = 63/80 := by norm_num [beta,nu]
    have hνeq : (nu:ℝ) = 47/2000 := by norm_num [nu]
    rw [hβ,hνeq]
    have slope : 0 ≤ (63/80:ℝ)/4+3*d/8-d*x^2/16 := by
      nlinarith only [hν,mul_nonneg hd (sub_nonneg.mpr hx2)]
    nlinarith only [hν,mul_nonneg slope (sq_nonneg x)]
  have hs' : (0:ℝ) ≤ s := by
    simp only [List.mem_cons,List.not_mem_nil,or_false] at hs
    rcases hs with rfl|rfl <;> norm_num
  have hpos : 0 < radialDen s d x := by
    unfold radialDen
    exact add_pos_of_pos_of_nonneg (by positivity)
      (mul_nonneg (mul_nonneg (mul_nonneg hs' (by norm_num [muLower])) hx) hq.le)
  apply (inv_le_iff_one_le_mul₀ hpos).mpr
  linarith only [hprod, mul_comm line (radialDen s d x)]

end Grothe.LowerAnalytic.RemoteRadial
