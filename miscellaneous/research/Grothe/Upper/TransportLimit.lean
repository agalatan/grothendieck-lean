import Mathlib.Analysis.Complex.Basic

/-!
# A ceiling for a norm-only homogeneous transport certificate

Uniform dilation followed by a disk-valued correction cannot obtain an
arbitrary score gain from the generic norm-distance comparison alone.
The triangle inequality forces `a*N ≤ 1+e`. The resulting certified score
is at most `b/N²`, where `b` is the old score and `N` the old norm.
This bounds the certificate formula, not the true score of a new response.
-/

namespace Grothe.Upper.TransportLimit

/-- Dimensionless form of the transport ceiling. -/
theorem comparison_ceiling (b M t e : ℝ) (hb : 0 ≤ b) (hM : b ≤ M)
    (ht : 0 ≤ t) (he : 0 ≤ e) (htriangle : t ≤ 1+e) :
    b*t^2-M*(2*t*e+e^2) ≤ b := by
  have hp : 0 ≤ 2*t*e+e^2 := by positivity
  have hbase : t^2 ≤ 1+2*t*e+e^2 := by
    by_cases h : t ≤ 1
    · nlinarith [mul_nonneg (by linarith : 0 ≤ 1-t) (by linarith : 0 ≤ 1+t)]
    · have hx : 0 ≤ t*(1+e-t) := mul_nonneg ht (by linarith)
      nlinarith [sq_nonneg (t-1), sq_nonneg e]
  have h1 := mul_le_mul_of_nonneg_left hbase hb
  have h2 := mul_le_mul_of_nonneg_right hM hp
  nlinarith

/-- A score proved solely by `a²*b-2*a*N*e-e²` cannot exceed `b/N²`.
Here `a*N ≤ 1+e` follows from a unit-norm corrected response at distance
at most `e` from the dilated response. No conclusion about its true score
is made. The undivided form also covers `N=0`. -/
theorem norm_transport_ceiling (b N a e certified : ℝ) (hb : 0 ≤ b)
    (hbN : b ≤ N^2) (hN : 0 ≤ N) (ha : 0 ≤ a) (he : 0 ≤ e)
    (htriangle : a*N ≤ 1+e)
    (hcertified : certified ≤ a^2*b-2*a*N*e-e^2) :
    N^2*certified ≤ b := by
  calc
    N^2*certified ≤ N^2*(a^2*b-2*a*N*e-e^2) :=
      mul_le_mul_of_nonneg_left hcertified (sq_nonneg N)
    _ = b*(a*N)^2-N^2*(2*(a*N)*e+e^2) := by ring
    _ ≤ b := comparison_ceiling b (N^2) (a*N) e hb hbN
      (mul_nonneg ha hN) he htriangle

end Grothe.Upper.TransportLimit
