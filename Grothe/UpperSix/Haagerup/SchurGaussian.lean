import Grothe.UpperSix.Haagerup.GaussianCore

set_option warningAsError true

/-!
# Fixed-amplitude Gaussian Schur determinant bound for the holomorphic kernel

Self-contained proof of the determinant bound on the continued Gaussian correlation `HholPair F G R`
for arbitrary measurable disk-valued maps `F, G : ℂ × ℂ → ℂ` (`‖F‖, ‖G‖ ≤ 1`):
* Real symmetric `2 × 2` forms `Sym2R` and complex symmetric `2 × 2` forms `Sym2C`, together with
  the circular holomorphic Gaussian kernel `kHol` and correlation `HholPair`;
* The `L*L` operator identity (`LstarL.integral_norm_sq_le`), single-copy Gaussian modulus `norm_M1`,
  and triple-product integrability `integrable_tri`;
* Exact integration of the prescribed Gaussian amplitude (`GaussianAmplitude.lintegral_P4_phih`) and
  the resulting determinant estimate `SchurMainGaussian.norm_HholPair_sq_le`.
-/

namespace Haagerup

open MeasureTheory Complex
open scoped Real ComplexConjugate ENNReal

noncomputable section

/-! ### 1. Real symmetric `2 × 2` matrices (`Sym2R`) -/

structure Sym2R where
  a : ℝ
  b : ℝ
  c : ℝ

namespace Sym2R

def bil (S : Sym2R) (x y : ℝ × ℝ) : ℝ :=
  S.a * x.1 * y.1 + S.b * (x.1 * y.2 + x.2 * y.1) + S.c * x.2 * y.2

def q (S : Sym2R) (y : ℝ × ℝ) : ℝ := S.bil y y
def det (S : Sym2R) : ℝ := S.a * S.c - S.b ^ 2
def adj (S : Sym2R) : Sym2R := ⟨S.c, -S.b, S.a⟩
def app (S : Sym2R) (y : ℝ × ℝ) : ℝ × ℝ := (S.a * y.1 + S.b * y.2, S.b * y.1 + S.c * y.2)
def add (S T : Sym2R) : Sym2R := ⟨S.a + T.a, S.b + T.b, S.c + T.c⟩
def smul (r : ℝ) (S : Sym2R) : Sym2R := ⟨r * S.a, r * S.b, r * S.c⟩

def PD (S : Sym2R) : Prop := 0 < S.a ∧ 0 < S.det
def PSD (S : Sym2R) : Prop := ∀ y, 0 ≤ S.q y

lemma dot_app (S : Sym2R) (x y : ℝ × ℝ) : x.1 * (S.app y).1 + x.2 * (S.app y).2 = S.bil x y := by
  simp [app, bil]; ring

lemma q_nonneg_of_PD {S : Sym2R} (h : S.PD) (y : ℝ × ℝ) : 0 ≤ S.q y := by
  obtain ⟨ha, hd⟩ := h
  simp only [q, bil, det] at *
  have : S.a * (S.a * y.1 ^ 2 + 2 * S.b * y.1 * y.2 + S.c * y.2 ^ 2)
      = (S.a * y.1 + S.b * y.2) ^ 2 + (S.a * S.c - S.b ^ 2) * y.2 ^ 2 := by ring
  have h2 : 0 ≤ S.a * (S.a * y.1 ^ 2 + 2 * S.b * y.1 * y.2 + S.c * y.2 ^ 2) := by
    rw [this]; positivity
  have h3 : 0 ≤ S.a * y.1 ^ 2 + 2 * S.b * y.1 * y.2 + S.c * y.2 ^ 2 := by
    by_contra hneg; push Not at hneg; nlinarith
  linarith [h3]

lemma PSD_of_PD {S : Sym2R} (h : S.PD) : S.PSD := q_nonneg_of_PD h

lemma weight_identity (T E : Sym2R) (y : ℝ × ℝ) :
    let W := add (smul 2 T) E
    let δ := W.det
    let u := E.app y
    let v := W.adj.app u
    δ ^ 2 * E.q y - δ * (u.1 * v.1 + u.2 * v.2)
      = E.q (δ * y.1 - v.1, δ * y.2 - v.2) + 2 * T.q v := by
  simp only [add, smul, det, adj, app, q, bil]; ring

theorem weight_ineq {T E : Sym2R} (hT : T.PSD) (hE : E.PSD) (hδ : 0 < (add (smul 2 T) E).det)
    (y : ℝ × ℝ) :
    let W := add (smul 2 T) E
    let u := E.app y
    let v := W.adj.app u
    u.1 * v.1 + u.2 * v.2 ≤ W.det * E.q y := by
  intro W u v
  have hid := weight_identity T E y
  have h1 := hE (W.det * y.1 - v.1, W.det * y.2 - v.2)
  have h2 := hT v
  have : 0 ≤ W.det ^ 2 * E.q y - W.det * (u.1 * v.1 + u.2 * v.2) := by
    simp only at hid; linarith
  have h3 : W.det * (u.1 * v.1 + u.2 * v.2) ≤ W.det * (W.det * E.q y) := by nlinarith
  exact le_of_mul_le_mul_left h3 hδ

lemma q_add (S T : Sym2R) (y : ℝ × ℝ) : (add S T).q y = S.q y + T.q y := by
  simp only [add, q, bil]; ring

lemma q_smul (r : ℝ) (S : Sym2R) (y : ℝ × ℝ) : (smul r S).q y = r * S.q y := by
  simp only [smul, q, bil]; ring

lemma q_pos_of_PD {S : Sym2R} (h : S.PD) {y : ℝ × ℝ} (hy : y ≠ 0) : 0 < S.q y := by
  obtain ⟨ha, hd⟩ := h
  have hid : S.a * S.q y = (S.a * y.1 + S.b * y.2) ^ 2 + S.det * y.2 ^ 2 := by
    simp only [q, bil, det]; ring
  have : 0 < S.a * S.q y := by
    rw [hid]
    by_cases h2 : y.2 = 0
    · have h1 : y.1 ≠ 0 := fun h1 => hy (Prod.ext h1 h2)
      rw [h2]; simp only [mul_zero, add_zero, ne_eq, OfNat.ofNat_ne_zero, not_false_eq_true,
        zero_pow]; positivity
    · have : 0 < S.det * y.2 ^ 2 := by positivity
      positivity
  exact pos_of_mul_pos_right this ha.le

lemma PD_of_q_pos {S : Sym2R} (h : ∀ y : ℝ × ℝ, y ≠ 0 → 0 < S.q y) : S.PD := by
  have ha : 0 < S.a := by simpa [q, bil] using h (1, 0) (by simp)
  refine ⟨ha, ?_⟩
  have h2 := h (-S.b, S.a) (by intro e; have := congrArg Prod.snd e; simp at this; linarith)
  have hid : S.q (-S.b, S.a) = S.a * S.det := by simp only [q, bil, det]; ring
  rw [hid] at h2
  exact pos_of_mul_pos_right h2 ha.le

end Sym2R

/-! ### 2. Complex symmetric `2 × 2` matrices (`Sym2C`) and `HholPair` -/

structure Sym2C where
  a : ℂ
  b : ℂ
  c : ℂ

namespace Sym2C

def sq (R : Sym2C) : ℂ × ℂ × ℂ × ℂ :=
  (R.a * R.a + R.b * R.b, R.a * R.b + R.b * R.c, R.b * R.a + R.c * R.b, R.b * R.b + R.c * R.c)

def detIm (R : Sym2C) : ℂ :=
  let s := R.sq
  (1 - s.1) * (1 - s.2.2.2) - s.2.1 * s.2.2.1

def Amat (R : Sym2C) : Sym2C :=
  let s := R.sq
  ⟨(1 - s.2.2.2) / R.detIm, s.2.1 / R.detIm, (1 - s.1) / R.detIm⟩

def Cmat (R : Sym2C) : Sym2C :=
  let A := R.Amat
  ⟨R.a * A.a + R.b * A.b, R.a * A.b + R.b * A.c, R.b * A.b + R.c * A.c⟩

def form (S : Sym2C) (x y : ℝ × ℝ) : ℂ :=
  S.a * x.1 * y.1 + S.b * (x.1 * y.2 + x.2 * y.1) + S.c * x.2 * y.2

end Sym2C

def kExp (R : Sym2C) (x y : ℝ × ℝ) : ℂ :=
  -(R.Amat.form x x) / 2 - R.Amat.form y y / 2 + R.Cmat.form x y

def kHol (R : Sym2C) (x ξ y η : ℝ × ℝ) : ℂ :=
  (((2 * Real.pi) ^ 4 : ℝ) : ℂ)⁻¹ * R.detIm⁻¹ * Complex.exp (kExp R x y + kExp R ξ η)

def toC2 (x ξ : ℝ × ℝ) : ℂ × ℂ :=
  (((x.1 : ℂ) + ξ.1 * I) / ((√2 : ℝ) : ℂ), ((x.2 : ℂ) + ξ.2 * I) / ((√2 : ℝ) : ℂ))

abbrev Pt8 := ((ℝ × ℝ) × (ℝ × ℝ)) × ((ℝ × ℝ) × (ℝ × ℝ))

def HholPair (F G : ℂ × ℂ → ℂ) (R : Sym2C) : ℂ :=
  ∫ q : Pt8, conj (F (toC2 q.1.1 q.1.2)) * G (toC2 q.2.1 q.2.2) *
    kHol R q.1.1 q.1.2 q.2.1 q.2.2

/-! ### 3. The `L*L` identity (`LstarL`) -/

namespace LstarL

variable {X Y : Type*} [MeasurableSpace X] [MeasurableSpace Y] {μ : Measure X} {ν : Measure Y}
  [SFinite μ] [SFinite ν]

def tri (L : X → Y → ℂ) (g : Y → ℂ) (p : X × (Y × Y)) : ℂ :=
  conj (L p.1 p.2.1 * g p.2.1) * (L p.1 p.2.2 * g p.2.2)

lemma norm_integral_sq (f : Y → ℂ) :
    ‖∫ y, f y ∂ν‖ ^ 2 = (∫ q : Y × Y, conj (f q.1) * f q.2 ∂(ν.prod ν)).re := by
  rw [integral_prod_mul (fun y => conj (f y)) f, integral_conj, mul_comm, Complex.mul_conj,
    Complex.ofReal_re, Complex.normSq_eq_norm_sq]

theorem integral_norm_sq_eq (L : X → Y → ℂ) (g : Y → ℂ)
    (hint : Integrable (tri L g) (μ.prod (ν.prod ν))) :
    ∫ x, ‖∫ y, L x y * g y ∂ν‖ ^ 2 ∂μ =
      (∫ q : Y × Y, conj (g q.1) * g q.2 * ∫ x, conj (L x q.1) * L x q.2 ∂μ ∂(ν.prod ν)).re := by
  simp_rw [norm_integral_sq]
  have h1 : ∀ x, (∫ q : Y × Y, conj (L x q.1 * g q.1) * (L x q.2 * g q.2) ∂(ν.prod ν))
      = ∫ q : Y × Y, tri L g (x, q) ∂(ν.prod ν) := fun _ => rfl
  simp_rw [h1]
  have hre := integral_re hint.integral_prod_left
  simp only [RCLike.re_to_complex] at hre
  rw [hre, integral_integral_swap (f := fun x q => tri L g (x, q)) hint]
  congr 1
  refine integral_congr_ae (Filter.Eventually.of_forall fun q => ?_)
  simp only [tri]
  rw [← integral_const_mul]
  congr 1; ext x; simp only [map_mul]; ring

theorem integral_norm_sq_le (L : X → Y → ℂ) (g : Y → ℂ)
    (hint : Integrable (tri L g) (μ.prod (ν.prod ν))) :
    ∫ x, ‖∫ y, L x y * g y ∂ν‖ ^ 2 ∂μ ≤
      ∫ q : Y × Y, ‖g q.1‖ * ‖g q.2‖ * ‖∫ x, conj (L x q.1) * L x q.2 ∂μ‖ ∂(ν.prod ν) := by
  rw [integral_norm_sq_eq L g hint]
  refine (Complex.re_le_norm _).trans ((norm_integral_le_integral_norm _).trans (le_of_eq ?_))
  congr 1; ext q; simp

end LstarL

/-! ### 4. Single-copy kernel (`SchurKernel`) and `ℝ⁴` product (`SchurBound`) -/

namespace SchurKernel

open Sym2R

def sand (S N : Sym2R) : Sym2R :=
  ⟨N.a * S.a ^ 2 + 2 * N.b * S.a * S.b + N.c * S.b ^ 2,
   N.a * S.a * S.b + N.b * (S.a * S.c + S.b ^ 2) + N.c * S.b * S.c,
   N.a * S.b ^ 2 + 2 * N.b * S.b * S.c + N.c * S.c ^ 2⟩

def re (S : Sym2C) : Sym2R := ⟨S.a.re, S.b.re, S.c.re⟩
def im (S : Sym2C) : Sym2R := ⟨S.a.im, S.b.im, S.c.im⟩

def Z (B : Sym2C) : Sym2R := re B
def Kr (B C : Sym2C) : Sym2R := smul (Z B).det⁻¹ (sand (re C) (Z B).adj)
def Ki (B C : Sym2C) : Sym2R := smul (Z B).det⁻¹ (sand (im C) (Z B).adj)
def T (B C : Sym2C) : Sym2R := add (Z B) (smul (-1) (Kr B C))
def E (B C : Sym2C) : Sym2R := smul (1 / 2) (add (Kr B C) (Ki B C))
def Dr (B C : Sym2C) : Sym2R := add (T B C) (E B C)

def L1 (B C : Sym2C) (x y : ℝ × ℝ) : ℂ :=
  cexp (-(B.form x x) / 2 - B.form y y / 2 + C.form x y)

lemma integrand_eq (B C : Sym2C) (y y' x : ℝ × ℝ) :
    conj (L1 B C x y) * L1 B C x y' =
      Gauss2.g (2 * B.a.re) (2 * B.b.re) (2 * B.c.re)
        (conj C.a * y.1 + conj C.b * y.2 + C.a * y'.1 + C.b * y'.2)
        (conj C.b * y.1 + conj C.c * y.2 + C.b * y'.1 + C.c * y'.2) x *
      cexp (-(conj (B.form y y)) / 2 - B.form y' y' / 2) := by
  simp only [L1, Gauss2.g, ← Complex.exp_conj, ← Complex.exp_add, Sym2C.form]
  congr 1
  simp only [map_add, map_sub, map_neg, map_mul, map_div₀, Complex.conj_ofReal, map_ofNat]
  have ha : (B.a : ℂ) + conj B.a = 2 * (B.a.re : ℂ) := by rw [Complex.add_conj]; push_cast; ring
  have hb : (B.b : ℂ) + conj B.b = 2 * (B.b.re : ℂ) := by rw [Complex.add_conj]; push_cast; ring
  have hc : (B.c : ℂ) + conj B.c = 2 * (B.c.re : ℂ) := by rw [Complex.add_conj]; push_cast; ring
  push_cast
  linear_combination (-(x.1 : ℂ) ^ 2 / 2) * ha + (-(x.1 : ℂ) * x.2) * hb + (-(x.2 : ℂ) ^ 2 / 2) * hc

theorem integral_M1 (B C : Sym2C) (hZ : (Z B).PD) (y y' : ℝ × ℝ) :
    ∫ x : ℝ × ℝ, conj (L1 B C x y) * L1 B C x y' =
      ((π / √(Z B).det : ℝ) : ℂ) *
        (cexp ((2 * B.c.re * (conj C.a * y.1 + conj C.b * y.2 + C.a * y'.1 + C.b * y'.2) ^ 2
          - 2 * (2 * B.b.re) * (conj C.a * y.1 + conj C.b * y.2 + C.a * y'.1 + C.b * y'.2)
            * (conj C.b * y.1 + conj C.c * y.2 + C.b * y'.1 + C.c * y'.2)
          + 2 * B.a.re * (conj C.b * y.1 + conj C.c * y.2 + C.b * y'.1 + C.c * y'.2) ^ 2)
            / (2 * (4 * (Z B).det))) *
         cexp (-(conj (B.form y y)) / 2 - B.form y' y' / 2)) := by
  obtain ⟨ha, hd⟩ := hZ
  simp only [Z, re, det] at ha hd
  simp_rw [integrand_eq]
  rw [integral_mul_const, Gauss2.integral_g (by linarith) (by nlinarith)]
  have h4 : (2 * B.a.re) * (2 * B.c.re) - (2 * B.b.re) ^ 2 = 4 * (Z B).det := by
    simp only [Z, re, det]; ring
  rw [h4, show √(4 * (Z B).det) = 2 * √(Z B).det by
    rw [Real.sqrt_mul (by norm_num), show √(4 : ℝ) = 2 by
      rw [show (4 : ℝ) = 2 ^ 2 by norm_num, Real.sqrt_sq (by norm_num)]]]
  have hs : 0 < √(Z B).det := Real.sqrt_pos.2 (by simp only [Z, re, det]; linarith)
  rw [mul_assoc]
  refine congrArg₂ (· * ·) ?_ ?_
  · congr 1; field_simp
  · congr 2; simp only [Z, re, det]; push_cast; ring

theorem norm_M1 (B C : Sym2C) (hZ : (Z B).PD) (y y' : ℝ × ℝ) :
    ‖∫ x : ℝ × ℝ, conj (L1 B C x y) * L1 B C x y'‖ =
      π / √(Z B).det * Real.exp (-(Dr B C).q y / 2 - (Dr B C).q y' / 2 + (E B C).bil y y') := by
  have hd : (Z B).det ≠ 0 := hZ.2.ne'
  rw [integral_M1 B C hZ, norm_mul, norm_mul, Complex.norm_of_nonneg (by positivity),
    Complex.norm_exp, Complex.norm_exp, ← Real.exp_add]
  congr 2
  rw [show (2 : ℂ) * (4 * ((Z B).det : ℂ)) = ((8 * (Z B).det : ℝ) : ℂ) by push_cast; ring,
    Complex.div_ofReal_re]
  simp only [Complex.add_re, Complex.sub_re, Complex.mul_re, Complex.mul_im, Complex.add_im,
    Complex.conj_re, Complex.conj_im, Complex.ofReal_re, Complex.ofReal_im, sq,
    Complex.neg_re, Complex.div_ofNat_re, Complex.re_ofNat, Complex.im_ofNat, Sym2C.form]
  simp only [Dr, T, E, Kr, Ki, Z, re, im, sand, smul, add, q, bil, det, adj] at hd ⊢
  field_simp; ring

lemma q_sand (S N : Sym2R) (y : ℝ × ℝ) : (sand S N).q y = N.q (S.app y) := by
  simp only [sand, q, bil, app]; ring

lemma adj_PD {S : Sym2R} (h : S.PD) : S.adj.PD := by
  obtain ⟨ha, hd⟩ := h
  refine ⟨by simp only [adj, det] at *; nlinarith, by simpa [adj, det, mul_comm] using hd⟩

lemma E_PSD (B C : Sym2C) (hZ : (Z B).PD) : (E B C).PSD := fun y => by
  have hdi : 0 < (Z B).det⁻¹ := inv_pos.2 hZ.2
  have hA := adj_PD hZ
  simp only [E, Kr, Ki]
  rw [q_smul, q_add, q_smul, q_smul, q_sand, q_sand]
  have := q_nonneg_of_PD hA ((re C).app y)
  have := q_nonneg_of_PD hA ((im C).app y)
  positivity

def P1 (B C : Sym2C) (y y' : ℝ × ℝ) : ℝ :=
  π / √(Z B).det * Real.exp (-(Dr B C).q y / 2 - (Dr B C).q y' / 2 + (E B C).bil y y')

end SchurKernel

namespace SchurBound

open SchurKernel Sym2R

abbrev V := (ℝ × ℝ) × (ℝ × ℝ)

def L4 (B C : Sym2C) (c : ℂ) (X Y : V) : ℂ := c * (L1 B C X.1 Y.1 * L1 B C X.2 Y.2)

theorem integral_M4 (B C : Sym2C) (c : ℂ) (Y Y' : V) :
    ∫ X : V, conj (L4 B C c X Y) * L4 B C c X Y' =
      ((‖c‖ ^ 2 : ℝ) : ℂ) * ((∫ x : ℝ × ℝ, conj (L1 B C x Y.1) * L1 B C x Y'.1) *
        ∫ ξ : ℝ × ℝ, conj (L1 B C ξ Y.2) * L1 B C ξ Y'.2) := by
  have e : ∀ X : V, conj (L4 B C c X Y) * L4 B C c X Y' =
      ((‖c‖ ^ 2 : ℝ) : ℂ) * ((conj (L1 B C X.1 Y.1) * L1 B C X.1 Y'.1) *
        (conj (L1 B C X.2 Y.2) * L1 B C X.2 Y'.2)) := fun X => by
    simp only [L4, map_mul]
    rw [show ((‖c‖ ^ 2 : ℝ) : ℂ) = conj c * c by
      rw [mul_comm, Complex.mul_conj, Complex.normSq_eq_norm_sq]]
    ring
  simp_rw [e]
  rw [integral_const_mul, Measure.volume_eq_prod,
    integral_prod_mul (fun x => conj (L1 B C x Y.1) * L1 B C x Y'.1)
      (fun ξ => conj (L1 B C ξ Y.2) * L1 B C ξ Y'.2)]

theorem norm_M4 (B C : Sym2C) (hZ : (Z B).PD) (c : ℂ) (Y Y' : V) :
    ‖∫ X : V, conj (L4 B C c X Y) * L4 B C c X Y'‖ =
      ‖c‖ ^ 2 * (P1 B C Y.1 Y'.1 * P1 B C Y.2 Y'.2) := by
  rw [integral_M4, norm_mul, norm_mul, norm_M1 B C hZ, norm_M1 B C hZ,
    Complex.norm_of_nonneg (by positivity)]
  rfl

lemma P1_nonneg (B C : Sym2C) (y y' : ℝ × ℝ) : 0 ≤ P1 B C y y' := by simp only [P1]; positivity

def P4 (B C : Sym2C) (Y Y' : V) : ℝ≥0∞ :=
  ENNReal.ofReal (P1 B C Y.1 Y'.1 * P1 B C Y.2 Y'.2)

lemma measurable_P4 (B C : Sym2C) : Measurable (Function.uncurry (P4 B C)) := by
  have hc : Continuous fun p : V × V => P1 B C p.1.1 p.2.1 * P1 B C p.1.2 p.2.2 := by
    simp only [P1, q, bil]; fun_prop
  exact hc.measurable.ennreal_ofReal

end SchurBound

/-! ### 5. Triple-product integrability (`SchurIntegrability`) -/

namespace SchurIntegrability

open SchurKernel SchurBound Sym2R

lemma norm_L1 (B C : Sym2C) (x y : ℝ × ℝ) :
    ‖L1 B C x y‖ = Real.exp (-(Z B).q x / 2 - (Z B).q y / 2 + (re C).bil x y) := by
  rw [L1, Complex.norm_exp]; congr 1
  simp only [Sym2C.form, Complex.add_re, Complex.sub_re, Complex.neg_re, Complex.mul_re,
    Complex.ofReal_re, Complex.ofReal_im, Complex.div_ofNat_re, Z, SchurKernel.re, q, bil,
    Complex.add_im, Complex.mul_im]
  ring

lemma norm_L1_mul_eq (B C : Sym2C) (y y' x : ℝ × ℝ) :
    ‖L1 B C x y‖ * ‖L1 B C x y'‖ = Real.exp (-(Z B).q y / 2 - (Z B).q y' / 2) *
      Gauss2.gR (2 * (Z B).a) (2 * (Z B).b) (2 * (Z B).c)
        ((re C).app (y.1 + y'.1, y.2 + y'.2)).1 ((re C).app (y.1 + y'.1, y.2 + y'.2)).2 x := by
  rw [norm_L1, norm_L1, ← Real.exp_add, Gauss2.gR, ← Real.exp_add]
  congr 1; simp only [q, bil, app]; ring

lemma integrable_norm_L1_mul (B C : Sym2C) (hZ : (Z B).PD) (y y' : ℝ × ℝ) :
    Integrable fun x : ℝ × ℝ => ‖L1 B C x y‖ * ‖L1 B C x y'‖ := by
  obtain ⟨ha, hd⟩ := hZ
  simp_rw [norm_L1_mul_eq]
  refine (Gauss2.integrable_gR (by linarith) ?_ _ _).const_mul _
  simp only [det] at hd; nlinarith

lemma integral_norm_L1_mul (B C : Sym2C) (hZ : (Z B).PD) (y y' : ℝ × ℝ) :
    ∫ x : ℝ × ℝ, ‖L1 B C x y‖ * ‖L1 B C x y'‖ =
      π / √(Z B).det * Real.exp (-(Z B).q y / 2 - (Z B).q y' / 2 +
        (Kr B C).q (y.1 + y'.1, y.2 + y'.2) / 4) := by
  have hd := hZ.2; have ha := hZ.1
  simp_rw [norm_L1_mul_eq]
  rw [integral_const_mul, Gauss2.integral_gR (by linarith) (by simp only [det] at hd; nlinarith)]
  have h4 : 2 * (Z B).a * (2 * (Z B).c) - (2 * (Z B).b) ^ 2 = 4 * (Z B).det := by
    simp only [det]; ring
  rw [h4, show √(4 * (Z B).det) = 2 * √(Z B).det by
    rw [Real.sqrt_mul (by norm_num), show √(4 : ℝ) = 2 by
      rw [show (4 : ℝ) = 2 ^ 2 by norm_num, Real.sqrt_sq (by norm_num)]]]
  have hs : 0 < √(Z B).det := Real.sqrt_pos.2 hd
  rw [Real.exp_add]
  have hK : (Kr B C).q (y.1 + y'.1, y.2 + y'.2) = (Z B).det⁻¹ *
      ((Z B).c * ((re C).app (y.1 + y'.1, y.2 + y'.2)).1 ^ 2
        - 2 * (Z B).b * ((re C).app (y.1 + y'.1, y.2 + y'.2)).1 *
            ((re C).app (y.1 + y'.1, y.2 + y'.2)).2
        + (Z B).a * ((re C).app (y.1 + y'.1, y.2 + y'.2)).2 ^ 2) := by
    simp only [Kr]; rw [q_smul, q_sand]; simp only [adj, q, bil]; ring
  rw [hK]; field_simp

lemma Kr_PSD (B C : Sym2C) (hZ : (Z B).PD) : (Kr B C).PSD := fun _ => by
  simp only [Kr]; rw [q_smul, q_sand]
  exact mul_nonneg (inv_pos.2 hZ.2).le (q_nonneg_of_PD (adj_PD hZ) _)

lemma integral_norm_L1_mul_le (B C : Sym2C) (hZ : (Z B).PD) (hT : (T B C).PD) (y y' : ℝ × ℝ) :
    ∫ x : ℝ × ℝ, ‖L1 B C x y‖ * ‖L1 B C x y'‖ ≤ π / √(Z B).det := by
  rw [integral_norm_L1_mul B C hZ]
  have hpar : (Kr B C).q (y.1 + y'.1, y.2 + y'.2) + (Kr B C).q (y.1 - y'.1, y.2 - y'.2)
      = 2 * (Kr B C).q y + 2 * (Kr B C).q y' := by simp only [q, bil]; ring
  have h1 := Kr_PSD B C hZ (y.1 - y'.1, y.2 - y'.2)
  have hTq : ∀ v, (T B C).q v = (Z B).q v - (Kr B C).q v := fun v => by
    simp only [T]; rw [q_add, q_smul]; ring
  have h2 := hTq y; have h3 := hTq y'
  have h4 := q_nonneg_of_PD hT y; have h5 := q_nonneg_of_PD hT y'
  calc π / √(Z B).det * Real.exp (-(Z B).q y / 2 - (Z B).q y' / 2 +
        (Kr B C).q (y.1 + y'.1, y.2 + y'.2) / 4)
      ≤ π / √(Z B).det * Real.exp 0 := by gcongr; linarith
    _ = π / √(Z B).det := by simp

def phih (j : ℝ) (Y : V) : ℝ :=
  j / π * Real.exp (-(j * (Y.1.1 ^ 2 + Y.1.2 ^ 2 + Y.2.1 ^ 2 + Y.2.2 ^ 2)) / 2)

lemma phih_nonneg (j : ℝ) (hj : 0 < j) (Y : V) : 0 ≤ phih j Y := by unfold phih; positivity

lemma continuous_phih (j : ℝ) : Continuous (phih j) := by unfold phih; fun_prop

lemma integrable_phih (j : ℝ) (hj : 0 < j) : Integrable (phih j) (volume : Measure V) := by
  have g := Gauss2.integrable_gR (a := j) (b := 0) (c := j) hj (by nlinarith) 0 0
  have h := (g.mul_prod g).const_mul (j / π)
  rw [Measure.volume_eq_prod]
  refine h.congr (Filter.Eventually.of_forall fun _ => ?_)
  simp only [phih, Gauss2.gR]; rw [mul_assoc, ← Real.exp_add]; congr 2; ring

def gw (j : ℝ) (G : ℂ × ℂ → ℂ) (Y : V) : ℂ := G (toC2 Y.1 Y.2) * (phih j Y : ℂ)

lemma norm_gw_le (j : ℝ) {G : ℂ × ℂ → ℂ} (hG : ∀ u, ‖G u‖ ≤ 1) (hj : 0 < j) (Y : V) :
    ‖gw j G Y‖ ≤ phih j Y := by
  rw [gw, norm_mul, Complex.norm_of_nonneg (phih_nonneg j hj Y)]
  exact mul_le_of_le_one_left (phih_nonneg j hj Y) (hG _)

lemma measurable_gw (j : ℝ) {G : ℂ × ℂ → ℂ} (hGm : Measurable G) : Measurable (gw j G) := by
  unfold gw
  exact (hGm.comp (by unfold toC2; fun_prop : Continuous fun Y : V => toC2 Y.1 Y.2).measurable).mul
    (Complex.measurable_ofReal.comp (continuous_phih j).measurable)

lemma continuous_L1 (B C : Sym2C) : Continuous fun p : (ℝ × ℝ) × (ℝ × ℝ) => L1 B C p.1 p.2 := by
  unfold L1; simp only [Sym2C.form]; fun_prop

lemma norm_tri (B C : Sym2C) (j : ℝ) (c : ℂ) (G : ℂ × ℂ → ℂ) (X : V) (q : V × V) :
    ‖LstarL.tri (L4 B C c) (gw j G) (X, q)‖ = ‖c‖ ^ 2 * (‖gw j G q.1‖ * ‖gw j G q.2‖) *
      ((‖L1 B C X.1 q.1.1‖ * ‖L1 B C X.1 q.2.1‖) *
        (‖L1 B C X.2 q.1.2‖ * ‖L1 B C X.2 q.2.2‖)) := by
  simp only [LstarL.tri, L4, norm_mul, Complex.norm_conj]; ring

theorem integrable_tri (B C : Sym2C) (j : ℝ) (hZ : (Z B).PD) (hT : (T B C).PD) (hj : 0 < j)
    {G : ℂ × ℂ → ℂ} (hGm : Measurable G) (hG : ∀ u, ‖G u‖ ≤ 1) (c : ℂ) :
    Integrable (LstarL.tri (L4 B C c) (gw j G))
      ((volume : Measure V).prod ((volume : Measure V).prod volume)) := by
  have hL := continuous_L1 B C
  have hgm := measurable_gw j hGm
  have hL4 : Measurable fun p : V × V => L4 B C c p.1 p.2 := by
    unfold L4
    exact measurable_const.mul ((hL.comp (by fun_prop : Continuous fun p : V × V => (p.1.1, p.2.1))).mul
      (hL.comp (by fun_prop : Continuous fun p : V × V => (p.1.2, p.2.2)))).measurable
  have htm : Measurable (LstarL.tri (L4 B C c) (gw j G)) := by
    unfold LstarL.tri
    exact (Complex.continuous_conj.measurable.comp ((hL4.comp (measurable_fst.prodMk
        (measurable_fst.comp measurable_snd))).mul (hgm.comp (measurable_fst.comp measurable_snd)))).mul
      ((hL4.comp (measurable_fst.prodMk (measurable_snd.comp measurable_snd))).mul
        (hgm.comp (measurable_snd.comp measurable_snd)))
  refine (integrable_prod_iff' htm.aestronglyMeasurable).2
    ⟨Filter.Eventually.of_forall fun q => ?_, ?_⟩
  · have hx := (integrable_norm_L1_mul B C hZ q.1.1 q.2.1).mul_prod
      (integrable_norm_L1_mul B C hZ q.1.2 q.2.2)
    rw [← Measure.volume_eq_prod] at hx
    refine Integrable.mono' (hx.const_mul (‖c‖ ^ 2 * (‖gw j G q.1‖ * ‖gw j G q.2‖)))
      (htm.comp (measurable_id.prodMk measurable_const)).aestronglyMeasurable
      (Filter.Eventually.of_forall fun X => le_of_eq (norm_tri B C j c G X q))
  · have hφ := (integrable_phih j hj).mul_prod (integrable_phih j hj)
    rw [← Measure.volume_eq_prod] at hφ
    refine Integrable.mono' (hφ.const_mul (‖c‖ ^ 2 * (π / √(Z B).det) ^ 2))
      (htm.norm.stronglyMeasurable.integral_prod_left'.aestronglyMeasurable)
      (Filter.Eventually.of_forall fun q => ?_)
    have e : ∫ X : V, ‖LstarL.tri (L4 B C c) (gw j G) (X, q)‖ =
        ‖c‖ ^ 2 * (‖gw j G q.1‖ * ‖gw j G q.2‖) *
          ((∫ x : ℝ × ℝ, ‖L1 B C x q.1.1‖ * ‖L1 B C x q.2.1‖) *
            ∫ ξ : ℝ × ℝ, ‖L1 B C ξ q.1.2‖ * ‖L1 B C ξ q.2.2‖) := by
      simp_rw [norm_tri]
      rw [integral_const_mul, Measure.volume_eq_prod, integral_prod_mul
        (fun x : ℝ × ℝ => ‖L1 B C x q.1.1‖ * ‖L1 B C x q.2.1‖)
        (fun ξ : ℝ × ℝ => ‖L1 B C ξ q.1.2‖ * ‖L1 B C ξ q.2.2‖)]
    rw [Real.norm_of_nonneg (integral_nonneg fun _ => norm_nonneg _), e]
    have hI1 := integral_norm_L1_mul_le B C hZ hT q.1.1 q.2.1
    have hI2 := integral_norm_L1_mul_le B C hZ hT q.1.2 q.2.2
    have hI1n : 0 ≤ ∫ x : ℝ × ℝ, ‖L1 B C x q.1.1‖ * ‖L1 B C x q.2.1‖ :=
      integral_nonneg fun _ => by positivity
    have hI2n : 0 ≤ ∫ ξ : ℝ × ℝ, ‖L1 B C ξ q.1.2‖ * ‖L1 B C ξ q.2.2‖ :=
      integral_nonneg fun _ => by positivity
    have hg1 := norm_gw_le j hG hj q.1; have hg2 := norm_gw_le j hG hj q.2
    calc ‖c‖ ^ 2 * (‖gw j G q.1‖ * ‖gw j G q.2‖) *
          ((∫ x : ℝ × ℝ, ‖L1 B C x q.1.1‖ * ‖L1 B C x q.2.1‖) *
            ∫ ξ : ℝ × ℝ, ‖L1 B C ξ q.1.2‖ * ‖L1 B C ξ q.2.2‖)
        ≤ ‖c‖ ^ 2 * (phih j q.1 * phih j q.2) * ((π / √(Z B).det) * (π / √(Z B).det)) := by
          have hp1 := phih_nonneg j hj q.1; have hp2 := phih_nonneg j hj q.2; gcongr
      _ = ‖c‖ ^ 2 * (π / √(Z B).det) ^ 2 * (phih j q.1 * phih j q.2) := by ring

end SchurIntegrability

/-! ### 6. Exact Gaussian-amplitude kernel integration (`GaussianAmplitude`) -/

namespace GaussianAmplitude

open Sym2R SchurKernel SchurBound SchurIntegrability

def shifted (A : Sym2R) (j : ℝ) : Sym2R := ⟨A.a + j, A.b, A.c + j⟩

lemma shifted_q (A : Sym2R) (j : ℝ) (y : ℝ × ℝ) :
    (shifted A j).q y = A.q y + j * (y.1 ^ 2 + y.2 ^ 2) := by
  simp only [shifted, q, bil]; ring

lemma shifted_PD {A : Sym2R} (hA : A.PD) {j : ℝ} (hj : 0 ≤ j) : (shifted A j).PD :=
  PD_of_q_pos fun y hy => by
    rw [shifted_q]
    have := q_pos_of_PD hA hy
    have : 0 ≤ j * (y.1 ^ 2 + y.2 ^ 2) := by positivity
    linarith

lemma add_PD_PSD {A E : Sym2R} (hA : A.PD) (hE : E.PSD) : (add A E).PD :=
  PD_of_q_pos fun y hy => by
    rw [q_add]; exact add_pos_of_pos_of_nonneg (q_pos_of_PD hA hy) (hE y)

def congruence (S N : Sym2R) : Sym2R :=
  ⟨N.a * S.a ^ 2 + 2 * N.b * S.a * S.b + N.c * S.b ^ 2,
   N.a * S.a * S.b + N.b * (S.a * S.c + S.b ^ 2) + N.c * S.b * S.c,
   N.a * S.b ^ 2 + 2 * N.b * S.b * S.c + N.c * S.c ^ 2⟩

lemma q_congruence (S N : Sym2R) (y : ℝ × ℝ) : (congruence S N).q y = N.q (S.app y) := by
  simp only [congruence, q, bil, app]; ring

def complement (A E : Sym2R) : Sym2R :=
  add A (smul (-A.det⁻¹) (congruence E A.adj))

lemma complement_q (A E : Sym2R) (y : ℝ × ℝ) :
    (complement A E).q y = A.q y - A.det⁻¹ * A.adj.q (E.app y) := by
  rw [complement, q_add, q_smul, q_congruence]; ring

lemma complement_PD {Vm E : Sym2R} (hV : Vm.PD) (hE : E.PSD) :
    (complement (add Vm E) E).PD := by
  let A := add Vm E
  have hA : A.PD := add_PD_PSD hV hE
  have hhalf : (smul (1 / 2) Vm).PSD := fun y => by
    rw [q_smul]; exact mul_nonneg (by norm_num) (PSD_of_PD hV y)
  have heq : add (smul 2 (smul (1 / 2) Vm)) E = A := by
    dsimp [A, add, smul]; congr 1 <;> ring
  refine PD_of_q_pos fun y hy => ?_
  have hw := weight_ineq hhalf hE (by rw [heq]; exact hA.2) y
  change (E.app y).1 * ((add (smul 2 (smul (1 / 2) Vm)) E).adj.app (E.app y)).1 +
      (E.app y).2 * ((add (smul 2 (smul (1 / 2) Vm)) E).adj.app (E.app y)).2 ≤
        (add (smul 2 (smul (1 / 2) Vm)) E).det * E.q y at hw
  rw [heq, dot_app] at hw
  have hb : A.det⁻¹ * A.adj.q (E.app y) ≤ E.q y := by
    rw [inv_mul_eq_div, div_le_iff₀ hA.2]; simpa only [q, mul_comm] using hw
  have hp := q_pos_of_PD hV hy
  change 0 < (complement A E).q y
  rw [complement_q]
  have ha : A.q y = Vm.q y + E.q y := q_add Vm E y
  linarith

lemma determinant_complement (A E : Sym2R) (hA : A.det ≠ 0) :
    A.det * (complement A E).det = (add A (smul (-1) E)).det * (add A E).det := by
  simp only [complement, add, smul, congruence, adj, det] at *
  field_simp; ring

lemma determinant_complement_add (Vm E : Sym2R) (hA : (add Vm E).det ≠ 0) :
    (add Vm E).det * (complement (add Vm E) E).det = Vm.det * (add Vm (smul 2 E)).det := by
  rw [determinant_complement _ _ hA]
  congr 1 <;> simp only [add, smul, det] <;> ring

def pairGaussian (A E : Sym2R) (y y' : ℝ × ℝ) : ℝ :=
  Real.exp (-A.q y / 2 - A.q y' / 2 + E.bil y y')

lemma pairGaussian_eq (A E : Sym2R) (y y' : ℝ × ℝ) :
    pairGaussian A E y y' = Real.exp (-A.q y / 2) *
      Gauss2.gR A.a A.b A.c (E.app y).1 (E.app y).2 y' := by
  rw [pairGaussian, Gauss2.gR, ← Real.exp_add]; congr 1
  simp only [q, bil, app]; ring

lemma integrable_pairGaussian_inner {A : Sym2R} (hA : A.PD) (E : Sym2R) (y : ℝ × ℝ) :
    Integrable (pairGaussian A E y) := by
  change Integrable fun y' => pairGaussian A E y y'
  simp_rw [pairGaussian_eq]
  exact (Gauss2.integrable_gR hA.1 hA.2 _ _).const_mul _

lemma integral_pairGaussian_inner {A : Sym2R} (hA : A.PD) (E : Sym2R) (y : ℝ × ℝ) :
    ∫ y', pairGaussian A E y y' =
      (2 * Real.pi / √A.det) * Real.exp (-(complement A E).q y / 2) := by
  simp_rw [pairGaussian_eq]
  rw [integral_const_mul, Gauss2.integral_gR hA.1 hA.2, mul_left_comm, ← Real.exp_add]
  congr 2
  rw [complement_q]; simp only [adj, app, q, bil, det]; field_simp; ring

lemma integrable_pairGaussian {A : Sym2R} (hA : A.PD) (E : Sym2R) (hS : (complement A E).PD) :
    Integrable fun p : (ℝ × ℝ) × (ℝ × ℝ) => pairGaussian A E p.1 p.2 := by
  rw [Measure.volume_eq_prod]
  have hm : AEStronglyMeasurable (fun p : (ℝ × ℝ) × (ℝ × ℝ) => pairGaussian A E p.1 p.2)
      (volume.prod volume) := Continuous.aestronglyMeasurable (by unfold pairGaussian q bil; fun_prop)
  refine (integrable_prod_iff hm).2 ⟨Filter.Eventually.of_forall (integrable_pairGaussian_inner hA E), ?_⟩
  have hn : ∀ y y', ‖pairGaussian A E y y'‖ = pairGaussian A E y y' := fun _ _ =>
    Real.norm_of_nonneg (Real.exp_pos _).le
  simp_rw [hn, integral_pairGaussian_inner hA]
  have hg := (Gauss2.integrable_gR hS.1 hS.2 (0 : ℝ) 0).const_mul (2 * Real.pi / √A.det)
  refine hg.congr (Filter.Eventually.of_forall fun _ => ?_)
  simp only [Gauss2.gR, q, bil]; congr 2; ring

theorem integral_pairGaussian {A : Sym2R} (hA : A.PD) (E : Sym2R) (hS : (complement A E).PD) :
    ∫ y, ∫ y', pairGaussian A E y y' = 4 * Real.pi ^ 2 / √(A.det * (complement A E).det) := by
  simp_rw [integral_pairGaussian_inner hA]
  rw [integral_const_mul]
  have he : (fun y : ℝ × ℝ => Real.exp (-(complement A E).q y / 2)) =
      Gauss2.gR (complement A E).a (complement A E).b (complement A E).c 0 0 := by
    funext y; simp only [Gauss2.gR, q, bil, zero_mul, add_zero]; congr 1; ring
  rw [he, Gauss2.integral_gR hS.1 hS.2]
  norm_num
  rw [Real.sqrt_mul hA.2.le]; dsimp [det]; ring

theorem lintegral_product_kernel (k : (ℝ × ℝ) → (ℝ × ℝ) → ℝ≥0∞)
    (hkm : Measurable (Function.uncurry k)) :
    (∫⁻ Y : (ℝ × ℝ) × (ℝ × ℝ), ∫⁻ Y' : (ℝ × ℝ) × (ℝ × ℝ), k Y.1 Y'.1 * k Y.2 Y'.2) =
      (∫⁻ y, ∫⁻ y', k y y') ^ 2 := by
  have hkr : ∀ y : ℝ × ℝ, Measurable (k y) := fun _ =>
    hkm.comp (measurable_const.prodMk measurable_id)
  have hki : Measurable fun y => ∫⁻ y', k y y' := hkm.lintegral_prod_right
  have hin : ∀ Y : (ℝ × ℝ) × (ℝ × ℝ),
      (∫⁻ Y' : (ℝ × ℝ) × (ℝ × ℝ), k Y.1 Y'.1 * k Y.2 Y'.2) =
        (∫⁻ y', k Y.1 y') * ∫⁻ y', k Y.2 y' := fun Y => by
    rw [Measure.volume_eq_prod, lintegral_prod_mul (hkr Y.1).aemeasurable (hkr Y.2).aemeasurable]
  simp_rw [hin]
  rw [Measure.volume_eq_prod, lintegral_prod_mul hki.aemeasurable hki.aemeasurable, ← sq]

def weight (j : ℝ) (y : ℝ × ℝ) : ℝ := Real.exp (-j * (y.1 ^ 2 + y.2 ^ 2) / 2)

def weightedP1 (B C : Sym2C) (j : ℝ) (y y' : ℝ × ℝ) : ℝ :=
  P1 B C y y' * weight j y * weight j y'

lemma weightedP1_nonneg (B C : Sym2C) (j : ℝ) (y y' : ℝ × ℝ) : 0 ≤ weightedP1 B C j y y' := by
  unfold weightedP1 P1 weight; positivity

lemma weightedP1_eq (B C : Sym2C) (j : ℝ) (y y' : ℝ × ℝ) :
    weightedP1 B C j y y' = Real.pi / √(Z B).det *
      pairGaussian (add (shifted (T B C) j) (E B C)) (E B C) y y' := by
  simp only [weightedP1, P1, weight, pairGaussian, Dr, q_add, shifted_q, mul_assoc, ← Real.exp_add]
  congr 2; ring

theorem integrable_weightedP1 (B C : Sym2C) {j : ℝ} (hj : 0 < j)
    (hZ : (Z B).PD) (hT : (T B C).PD) :
    Integrable fun p : (ℝ × ℝ) × (ℝ × ℝ) => weightedP1 B C j p.1 p.2 := by
  have hV := shifted_PD hT hj.le
  have hE := E_PSD B C hZ
  simp_rw [weightedP1_eq]
  exact (integrable_pairGaussian (add_PD_PSD hV hE) _ (complement_PD hV hE)).const_mul _

theorem integral_P1_gaussian (B C : Sym2C) {j : ℝ} (hj : 0 < j)
    (hZ : (Z B).PD) (hT : (T B C).PD) :
    ∫ y, ∫ y', weightedP1 B C j y y' =
      4 * Real.pi ^ 3 / (√(Z B).det *
        √((shifted (T B C) j).det * (shifted (add (T B C) (smul 2 (E B C))) j).det)) := by
  have hV := shifted_PD hT hj.le
  have hE := E_PSD B C hZ
  have hA := add_PD_PSD hV hE
  have hS := complement_PD hV hE
  simp_rw [weightedP1_eq, integral_const_mul]
  rw [integral_pairGaussian hA _ hS, determinant_complement_add _ _ hA.2.ne']
  have he : add (shifted (T B C) j) (smul 2 (E B C)) = shifted (add (T B C) (smul 2 (E B C))) j := by
    simp only [add, shifted, smul]; congr 1 <;> ring
  rw [he]; ring

lemma measurable_weightedP1 (B C : Sym2C) (j : ℝ) :
    Measurable (Function.uncurry (weightedP1 B C j)) :=
  Continuous.measurable (by unfold Function.uncurry weightedP1 P1 weight q bil; fun_prop)

lemma lintegral_weightedP1 (B C : Sym2C) {j : ℝ} (hj : 0 < j)
    (hZ : (Z B).PD) (hT : (T B C).PD) :
    ∫⁻ y, ∫⁻ y', ENNReal.ofReal (weightedP1 B C j y y') =
      ENNReal.ofReal (4 * Real.pi ^ 3 / (√(Z B).det *
        √((shifted (T B C) j).det * (shifted (add (T B C) (smul 2 (E B C))) j).det))) := by
  have hm := (measurable_weightedP1 B C j).ennreal_ofReal
  have hi := integrable_weightedP1 B C hj hZ hT
  rw [Measure.volume_eq_prod] at hi
  change Measurable (fun p : (ℝ × ℝ) × (ℝ × ℝ) => ENNReal.ofReal (weightedP1 B C j p.1 p.2)) at hm
  calc (∫⁻ y, ∫⁻ y', ENNReal.ofReal (weightedP1 B C j y y'))
      = ∫⁻ p : (ℝ × ℝ) × (ℝ × ℝ), ENNReal.ofReal (weightedP1 B C j p.1 p.2)
          ∂(volume.prod volume) := (lintegral_prod _ hm.aemeasurable).symm
    _ = ENNReal.ofReal (∫ p : (ℝ × ℝ) × (ℝ × ℝ), weightedP1 B C j p.1 p.2
          ∂(volume.prod volume)) :=
      (ofReal_integral_eq_lintegral_ofReal hi
        (Filter.Eventually.of_forall fun p => weightedP1_nonneg B C j p.1 p.2)).symm
    _ = _ := by rw [integral_prod _ hi, integral_P1_gaussian B C hj hZ hT]

def mass (B C : Sym2C) (j : ℝ) : ℝ :=
  16 * j ^ 2 * Real.pi ^ 4 / ((Z B).det * (shifted (T B C) j).det *
    (shifted (add (T B C) (smul 2 (E B C))) j).det)

lemma mass_nonneg (B C : Sym2C) {j : ℝ} (hj : 0 < j)
    (hZ : (Z B).PD) (hT : (T B C).PD) : 0 ≤ mass B C j := by
  have hV := shifted_PD hT hj.le
  have hE : (smul 2 (E B C)).PSD := fun y => by
    rw [q_smul]; exact mul_nonneg (by norm_num) (E_PSD B C hZ y)
  have hU := shifted_PD (add_PD_PSD hT hE) hj.le
  unfold mass
  exact div_nonneg (by positivity) (mul_nonneg (mul_nonneg hZ.2.le hV.2.le) hU.2.le)

lemma phih_factor (j : ℝ) (Y : V) :
    phih j Y = (j / Real.pi) * weight j Y.1 * weight j Y.2 := by
  simp only [phih, weight, mul_assoc, ← Real.exp_add]; congr 2; ring

theorem lintegral_P4_phih (B C : Sym2C) {j : ℝ} (hj : 0 < j)
    (hZ : (Z B).PD) (hT : (T B C).PD) :
    ∫⁻ Y : V, ∫⁻ Y' : V,
      ENNReal.ofReal (phih j Y) * ENNReal.ofReal (phih j Y') * SchurBound.P4 B C Y Y' =
        ENNReal.ofReal (mass B C j) := by
  let k : (ℝ × ℝ) → (ℝ × ℝ) → ℝ≥0∞ := fun y y' => ENNReal.ofReal (weightedP1 B C j y y')
  have hkm : Measurable (Function.uncurry k) := (measurable_weightedP1 B C j).ennreal_ofReal
  have hp : ∀ Y Y' : V,
      ENNReal.ofReal (phih j Y) * ENNReal.ofReal (phih j Y') * SchurBound.P4 B C Y Y' =
        ENNReal.ofReal ((j / Real.pi) ^ 2) * (k Y.1 Y'.1 * k Y.2 Y'.2) := fun Y Y' => by
    have hw : ∀ y, 0 ≤ weight j y := fun _ => (Real.exp_pos _).le
    have hf : ∀ Y, 0 ≤ phih j Y := fun Y => by
      rw [phih_factor]; exact mul_nonneg (mul_nonneg (div_pos hj Real.pi_pos).le (hw Y.1)) (hw Y.2)
    dsimp [k, SchurBound.P4]
    rw [← ENNReal.ofReal_mul (hf Y), ← ENNReal.ofReal_mul (mul_nonneg (hf Y) (hf Y')),
      ← ENNReal.ofReal_mul (weightedP1_nonneg B C j Y.1 Y'.1), ← ENNReal.ofReal_mul (sq_nonneg _)]
    refine congrArg ENNReal.ofReal ?_; rw [phih_factor, phih_factor]; unfold weightedP1; ring
  simp_rw [hp, lintegral_const_mul' _ _ ENNReal.ofReal_ne_top]
  rw [lintegral_product_kernel k hkm]
  have hk := lintegral_weightedP1 B C hj hZ hT
  change (∫⁻ y, ∫⁻ y', k y y') = _ at hk
  rw [hk]
  have hV := shifted_PD hT hj.le
  have hE : (smul 2 (E B C)).PSD := fun y => by
    rw [q_smul]; exact mul_nonneg (by norm_num) (E_PSD B C hZ y)
  have hU := shifted_PD (add_PD_PSD hT hE) hj.le
  rw [← ENNReal.ofReal_pow (by positivity), ← ENNReal.ofReal_mul (sq_nonneg _)]
  congr 1
  simp only [div_pow, mul_pow, Real.sq_sqrt hZ.2.le, Real.sq_sqrt (mul_nonneg hV.2.le hU.2.le)]
  unfold mass
  have hZd := hZ.2.ne'; have hVd := hV.2.ne'; have hUd := hU.2.ne'; have hpi := Real.pi_ne_zero
  field_simp; ring

end GaussianAmplitude

/-! ### 7. Determinant bound for `HholPair` (`SchurMain` + `SchurMainGaussian`) -/

namespace SchurMain

open SchurKernel SchurBound SchurIntegrability Sym2R

def Bj (R : Sym2C) (j : ℝ) : Sym2C := ⟨R.Amat.a - j, R.Amat.b, R.Amat.c - j⟩

def cst (R : Sym2C) (j : ℝ) : ℂ :=
  (((2 * π) ^ 4 : ℝ) : ℂ)⁻¹ * R.detIm⁻¹ * (((π / j) ^ 2 : ℝ) : ℂ)

private lemma exp_factor (K c p q e e2 e3 r1 r2 : ℂ)
    (h : e = r1 + e2 + e3 + r2) (hK : K = c * p * q) :
    K * cexp e = (p * cexp r1) * (c * (cexp e2 * cexp e3)) * (q * cexp r2) := by
  rw [h, hK, Complex.exp_add, Complex.exp_add, Complex.exp_add]; ring

lemma kHol_eq (R : Sym2C) (j : ℝ) (hj : 0 < j) (X Y : V) :
    kHol R X.1 X.2 Y.1 Y.2 = (phih j X : ℂ) * L4 (Bj R j) R.Cmat (cst R j) X Y * (phih j Y : ℂ) := by
  have hj' : (j : ℂ) ≠ 0 := by exact_mod_cast hj.ne'
  have hπ : (π : ℂ) ≠ 0 := by exact_mod_cast Real.pi_ne_zero
  simp only [kHol, L4, L1, phih, cst, Bj, kExp, Sym2C.form]
  push_cast
  refine exp_factor _ _ ((j : ℂ) / π) ((j : ℂ) / π) _ _ _ _ _ (by ring) (by field_simp)

lemma HholPair_eq (R : Sym2C) (j : ℝ) (hj : 0 < j) (F G : ℂ × ℂ → ℂ) :
    HholPair F G R =
      ∫ q : V × V, conj (gw j F q.1) * (L4 (Bj R j) R.Cmat (cst R j) q.1 q.2 * gw j G q.2) := by
  unfold HholPair; refine congrArg (integral _) ?_; ext q
  rw [kHol_eq R j hj q.1 q.2]; simp only [gw, map_mul, Complex.conj_ofReal]; ring

lemma phih_sq (j : ℝ) (Y : V) : phih j Y ^ 2 = (j / π) ^ 2 *
    (Gauss2.gR (2 * j) 0 (2 * j) 0 0 Y.1 * Gauss2.gR (2 * j) 0 (2 * j) 0 0 Y.2) := by
  simp only [phih, Gauss2.gR, mul_pow, ← Real.exp_add, ← Real.exp_nat_mul]
  congr 2; push_cast; ring

lemma integrable_phih_sq (j : ℝ) (hj : 0 < j) : Integrable fun Y : V => phih j Y ^ 2 := by
  have g := Gauss2.integrable_gR (a := 2 * j) (b := 0) (c := 2 * j) (by linarith) (by nlinarith) 0 0
  have h := (g.mul_prod g).const_mul ((j / π) ^ 2)
  rw [← Measure.volume_eq_prod] at h
  exact h.congr (Filter.Eventually.of_forall fun Y => (phih_sq j Y).symm)

lemma integral_phih_sq (j : ℝ) (hj : 0 < j) : ∫ Y : V, phih j Y ^ 2 = 1 := by
  simp_rw [phih_sq]
  rw [integral_const_mul, Measure.volume_eq_prod,
    integral_prod_mul (fun y : ℝ × ℝ => Gauss2.gR (2 * j) 0 (2 * j) 0 0 y)
      (fun y : ℝ × ℝ => Gauss2.gR (2 * j) 0 (2 * j) 0 0 y),
    Gauss2.integral_gR (by linarith) (by nlinarith)]
  have h4 : 2 * j * (2 * j) - (0 : ℝ) ^ 2 = (2 * j) ^ 2 := by ring
  rw [h4, Real.sqrt_sq (by linarith)]
  have hπ : (π : ℝ) ≠ 0 := Real.pi_ne_zero
  have : j ≠ 0 := hj.ne'
  simp; field_simp

lemma le_sqrt_of_amgm {x A Bv K : ℝ} (hA : A ≤ 1) (hB : Bv ≤ K) (hK : 0 ≤ K)
    (h : ∀ t : ℝ, 0 < t → x ≤ (t * A + Bv / t) / 2) : x ≤ √K := by
  rcases hK.lt_or_eq with hK | hK
  · have hs : 0 < √K := Real.sqrt_pos.2 hK
    refine (h _ hs).trans ?_
    have : Bv / √K ≤ K / √K := div_le_div_of_nonneg_right hB hs.le
    have hKs : K / √K = √K := by rw [div_eq_iff hs.ne', Real.mul_self_sqrt hK.le]
    nlinarith
  · subst hK
    simp only [Real.sqrt_zero]
    refine le_of_forall_pos_lt_add fun ε hε => ?_
    have := h ε hε
    have : Bv / ε ≤ 0 := div_nonpos_of_nonpos_of_nonneg hB hε.le
    nlinarith

lemma mul_le_amgm {a b t : ℝ} (ht : 0 < t) : a * b ≤ (t * a ^ 2 + b ^ 2 / t) / 2 := by
  have : t * a ^ 2 + b ^ 2 / t - 2 * (a * b) = (t * a - b) ^ 2 / t := by field_simp; ring
  have : 0 ≤ (t * a - b) ^ 2 / t := by positivity
  linarith

end SchurMain

namespace SchurMainGaussian

open SchurKernel SchurBound SchurIntegrability Sym2R SchurMain GaussianAmplitude

private lemma continuous_P1_pair (B C : Sym2C) :
    Continuous fun q : V × V => P1 B C q.1.1 q.2.1 * P1 B C q.1.2 q.2.2 := by
  simp only [P1, q, bil]; fun_prop

lemma integral_norm_Lg_sq_le {R : Sym2C} {j : ℝ} (hj : 0 < j)
    (hZ : (Z (Bj R j)).PD) (hT : (T (Bj R j) R.Cmat).PD)
    {G : ℂ × ℂ → ℂ} (hGm : Measurable G) (hG : ∀ u, ‖G u‖ ≤ 1) :
    ∫ X : V, ‖∫ Y : V, L4 (Bj R j) R.Cmat (cst R j) X Y * gw j G Y‖ ^ 2 ≤
      ‖cst R j‖ ^ 2 * mass (Bj R j) R.Cmat j := by
  set B := Bj R j; set C := R.Cmat; set c := cst R j
  have hint := integrable_tri B C j hZ hT hj hGm hG c
  refine (LstarL.integral_norm_sq_le (L4 B C c) (gw j G) hint).trans ?_
  simp_rw [norm_M4 B C hZ c]
  set a : V → ℝ≥0∞ := fun Y => ENNReal.ofReal ‖gw j G Y‖
  have hgm := measurable_gw j hGm
  have ham : Measurable a := hgm.norm.ennreal_ofReal
  have hΦm : Measurable fun q : V × V => ‖gw j G q.1‖ * ‖gw j G q.2‖ *
      (‖c‖ ^ 2 * (P1 B C q.1.1 q.2.1 * P1 B C q.1.2 q.2.2)) := by
    have := continuous_P1_pair B C
    exact ((hgm.comp measurable_fst).norm.mul (hgm.comp measurable_snd).norm).mul
      (measurable_const.mul this.measurable)
  have hΦ0 : ∀ q : V × V, 0 ≤ ‖gw j G q.1‖ * ‖gw j G q.2‖ *
      (‖c‖ ^ 2 * (P1 B C q.1.1 q.2.1 * P1 B C q.1.2 q.2.2)) := fun q => by
    have := P1_nonneg B C q.1.1 q.2.1; have := P1_nonneg B C q.1.2 q.2.2; positivity
  rw [integral_eq_lintegral_of_nonneg_ae (Filter.Eventually.of_forall hΦ0) hΦm.aestronglyMeasurable]
  have hP : Measurable fun q : V × V => SchurBound.P4 B C q.1 q.2 := measurable_P4 B C
  have hmeas : Measurable fun q : V × V => a q.1 * a q.2 * SchurBound.P4 B C q.1 q.2 :=
    ((ham.comp measurable_fst).mul (ham.comp measurable_snd)).mul hP
  have hpt : ∀ q : V × V, ENNReal.ofReal (‖gw j G q.1‖ * ‖gw j G q.2‖ *
      (‖c‖ ^ 2 * (P1 B C q.1.1 q.2.1 * P1 B C q.1.2 q.2.2)))
      = ENNReal.ofReal (‖c‖ ^ 2) * (a q.1 * a q.2 * SchurBound.P4 B C q.1 q.2) := fun q => by
    have h1 := P1_nonneg B C q.1.1 q.2.1; have h2 := P1_nonneg B C q.1.2 q.2.2
    simp only [a, SchurBound.P4]
    rw [← ENNReal.ofReal_mul (norm_nonneg _), ← ENNReal.ofReal_mul (by positivity),
      ← ENNReal.ofReal_mul (by positivity)]
    refine congrArg ENNReal.ofReal ?_; ring
  have hlin : ∫⁻ q : V × V, ENNReal.ofReal (‖gw j G q.1‖ * ‖gw j G q.2‖ *
      (‖c‖ ^ 2 * (P1 B C q.1.1 q.2.1 * P1 B C q.1.2 q.2.2))) ∂(volume.prod volume)
      = ENNReal.ofReal (‖c‖ ^ 2) * ∫⁻ Y : V, ∫⁻ Y' : V, a Y * a Y' * SchurBound.P4 B C Y Y' := by
    simp_rw [hpt]
    rw [lintegral_const_mul' _ _ ENNReal.ofReal_ne_top, lintegral_prod _ hmeas.aemeasurable]
  rw [hlin]
  have hmass : ∫⁻ Y : V, ∫⁻ Y' : V, a Y * a Y' * SchurBound.P4 B C Y Y' ≤
      ENNReal.ofReal (mass B C j) := by
    rw [← lintegral_P4_phih B C hj hZ hT]
    refine lintegral_mono fun Y => lintegral_mono fun Y' => ?_
    exact mul_le_mul' (mul_le_mul' (ENNReal.ofReal_le_ofReal (norm_gw_le j hG hj Y))
      (ENNReal.ofReal_le_ofReal (norm_gw_le j hG hj Y'))) le_rfl
  have hfin : ENNReal.ofReal (‖c‖ ^ 2) * ∫⁻ Y : V, ∫⁻ Y' : V, a Y * a Y' * SchurBound.P4 B C Y Y' ≤
      ENNReal.ofReal (‖c‖ ^ 2 * mass B C j) := by
    rw [ENNReal.ofReal_mul (sq_nonneg _)]; exact mul_le_mul' le_rfl hmass
  exact ENNReal.toReal_le_of_le_ofReal (mul_nonneg (sq_nonneg _) (mass_nonneg B C hj hZ hT)) hfin

theorem norm_HholPair_le {R : Sym2C} {j : ℝ} (hj : 0 < j)
    (hZ : (Z (Bj R j)).PD) (hT : (T (Bj R j) R.Cmat).PD)
    {F G : ℂ × ℂ → ℂ} (hFm : Measurable F) (hGm : Measurable G)
    (hF : ∀ u, ‖F u‖ ≤ 1) (hG : ∀ u, ‖G u‖ ≤ 1) :
    ‖HholPair F G R‖ ≤ √(‖cst R j‖ ^ 2 * mass (Bj R j) R.Cmat j) := by
  set B := Bj R j; set C := R.Cmat; set c := cst R j
  have hK : 0 ≤ ‖c‖ ^ 2 * mass B C j := mul_nonneg (sq_nonneg _) (mass_nonneg B C hj hZ hT)
  rw [SchurMain.HholPair_eq R j hj F G]
  set f := gw j F; set g := gw j G
  by_cases hint : Integrable (fun q : V × V => conj (f q.1) * (L4 B C c q.1 q.2 * g q.2))
  swap
  · rw [integral_undef hint, norm_zero]; positivity
  rw [Measure.volume_eq_prod] at hint ⊢
  rw [integral_prod _ hint]; simp_rw [integral_const_mul]
  refine (norm_integral_le_integral_norm _).trans ?_
  simp_rw [norm_mul, Complex.norm_conj]
  have hf2 : Integrable fun X : V => ‖f X‖ ^ 2 := by
    refine (integrable_phih_sq j hj).mono' ((measurable_gw j hFm).norm.pow_const 2).aestronglyMeasurable
      (Filter.Eventually.of_forall fun X => ?_)
    rw [Real.norm_of_nonneg (sq_nonneg _)]
    exact pow_le_pow_left₀ (norm_nonneg _) (norm_gw_le j hF hj X) 2
  have hint3 := integrable_tri B C j hZ hT hj hGm hG c
  have hLg2 : Integrable fun X : V => ‖∫ Y : V, L4 B C c X Y * g Y‖ ^ 2 := by
    refine (hint3.integral_prod_left.re).congr (Filter.Eventually.of_forall fun X => ?_)
    simp only [RCLike.re_to_complex]
    exact (LstarL.norm_integral_sq (fun Y => L4 B C c X Y * g Y)).symm
  have hA : ∫ X : V, ‖f X‖ ^ 2 ≤ 1 := by
    rw [← integral_phih_sq j hj]
    exact integral_mono hf2 (integrable_phih_sq j hj) fun X =>
      pow_le_pow_left₀ (norm_nonneg _) (norm_gw_le j hF hj X) 2
  have hB := integral_norm_Lg_sq_le hj hZ hT hGm hG
  refine le_sqrt_of_amgm hA hB hK fun t ht => ?_
  calc ∫ X : V, ‖f X‖ * ‖∫ Y : V, L4 B C c X Y * g Y‖
      ≤ ∫ X : V, (t * ‖f X‖ ^ 2 + ‖∫ Y : V, L4 B C c X Y * g Y‖ ^ 2 / t) / 2 :=
        integral_mono_of_nonneg (Filter.Eventually.of_forall fun _ => by positivity)
          (((hf2.const_mul t).add (hLg2.div_const t)).div_const 2)
          (Filter.Eventually.of_forall fun _ => mul_le_amgm ht)
    _ = ((t * ∫ X : V, ‖f X‖ ^ 2) + (∫ X : V, ‖∫ Y : V, L4 B C c X Y * g Y‖ ^ 2) / t) / 2 := by
      rw [integral_div, integral_add (hf2.const_mul t) (hLg2.div_const t),
        integral_const_mul, integral_div]

theorem norm_HholPair_sq_le (R : Sym2C) (j : ℝ) (hj : 0 < j)
    (hZ : (Z (Bj R j)).PD) (hT : (T (Bj R j) R.Cmat).PD)
    {F G : ℂ × ℂ → ℂ} (hFm : Measurable F) (hGm : Measurable G)
    (hF : ∀ u, ‖F u‖ ≤ 1) (hG : ∀ u, ‖G u‖ ≤ 1) :
    ‖HholPair F G R‖ ^ 2 ≤
      1 / (16 * j ^ 2 * ‖R.detIm‖ ^ 2 * (Z (Bj R j)).det *
        (shifted (T (Bj R j) R.Cmat) j).det *
        (shifted (add (T (Bj R j) R.Cmat) (smul 2 (E (Bj R j) R.Cmat))) j).det) := by
  have h := norm_HholPair_le hj hZ hT hFm hGm hF hG
  have hK : 0 ≤ ‖cst R j‖ ^ 2 * mass (Bj R j) R.Cmat j :=
    mul_nonneg (sq_nonneg _) (mass_nonneg _ _ hj hZ hT)
  have hzd := hZ.2
  obtain ⟨-, _⟩ := shifted_PD hT hj.le
  have hE : (smul 2 (E (Bj R j) R.Cmat)).PSD := fun y => by
    rw [q_smul]; exact mul_nonneg (by norm_num) (E_PSD _ _ hZ y)
  obtain ⟨-, _⟩ := shifted_PD (add_PD_PSD hT hE) hj.le
  have hn : ‖cst R j‖ = ((2 * π) ^ 4)⁻¹ * ‖R.detIm‖⁻¹ * (π / j) ^ 2 := by
    simp only [cst, norm_mul, norm_inv,
      Complex.norm_of_nonneg (by positivity : (0 : ℝ) ≤ (2 * π) ^ 4),
      Complex.norm_of_nonneg (by positivity : (0 : ℝ) ≤ (π / j) ^ 2)]
  calc ‖HholPair F G R‖ ^ 2 ≤ (√(‖cst R j‖ ^ 2 * mass (Bj R j) R.Cmat j)) ^ 2 :=
        pow_le_pow_left₀ (norm_nonneg _) h 2
    _ = _ := by
      rw [Real.sq_sqrt hK, hn, mass]
      rcases eq_or_ne ‖R.detIm‖ 0 with h0 | h0
      · simp [h0]
      · have : j ≠ 0 := hj.ne'; have : π ≠ 0 := Real.pi_ne_zero
        field_simp; ring

end SchurMainGaussian

end

end Haagerup
