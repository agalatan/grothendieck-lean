import Grothe.LowerAnalytic.Influence
import Grothe.LowerAnalytic.Circular

/-!
# The contraction tensors of a circular cubic and their Gram inequalities

The complex coefficient tensor `t = 3 P₊P₊P₋ (f + ig)` of a circular cubic `q = a + ib` with real
kernels `f = ∂³a/6`, `g = ∂³b/6` (`cplxT`, `gramT`; `P± = (1 ∓ iJ)/2` the projections of the
complex structure `J`), its contractions `N, H, B, W, Y` (`ctN`, `ctH`, `ctB`, `ctW`, `ctY`) and
the scalars `n = ‖N‖²`, `h = ‖H‖²`, `b = ‖B‖²`, `y = ‖Y‖²`, `z = Re tr(N Hᵀ)` (`gramN`, …, `gramZ`)
of the contraction-Gram budget (`GramBudget.lean`), and the spectral norms `u₂, u₄, v₂, v₄`
(`specU2`, `specU4`, `specV2`, `specV4`).

**Proved here**, for every tensor `t` symmetric in its first two slots (so for `gramT J a b`,
`gramT_symm12`), by finite sum manipulations only:

* the Hermitian pairing `hip X Y = Σ X conj Y` of 4-tensors, its permutation invariance and the
  Cauchy–Schwarz inequalities `Re⟨X,Y⟩ ≤ (‖X‖² + ‖Y‖²)/2`, `(Re⟨X,Y⟩)² ≤ ‖X‖² ‖Y‖²`;
* the factorisation lemma `master` (a pairing of two single contractions with the same split of
  the outer indices factors through the Gram matrices of the contracted slots) and the tetrahedral
  regrouping `tetra` (crossed splits give a pairing of `W`-type contractions);
* `z = ‖W‖²` (`gramZ_eq_hipW`), `T = Re⟨W^{(23)}, W⟩` (`gramT0`), the six pairings
  `⟨W^σ, W⟩ ∈ {z, T}` and `y = ‖Y‖² = ⟨Y, W⟩ = (z + 2T)/3` (`gramY_eq`), whence **`y ≤ z`**
  (`gramY_le_gramZ`, the field `symm`);
* **Schatten–Hölder `b ≤ n`** (`gramB_le_gramN`, the field `schatten`): with the Gram matrix
  `M_{ad;a'd'} = Σ_b t_{abd} conj t_{a'bd'}` of the slices, `b = Re Σ M_x M_{σx}` for the slot swap
  `σ` and `‖M‖² = n`;
* **`G₁ = Gram(D, C₊₊) ⪰ 0`** (`gram1a_of_symm`, `gram1b_of_symm`, the fields `gram1a`,
  `gram1b`): `D_{ij;kl} = Σ_a t_{ija} conj t_{kla}`, `C_{ij;kl} = Σ_a t_{iak} conj t_{laj}`,
  `C₊₊ = (1 + J₁)(1 + J₂)C/4`, with `‖D‖² = h`, `‖C‖² = n`, `⟨C^{(12)}, C⟩ = ⟨C^{(34)}, C⟩ = ⟨C, D⟩ = T`,
  `⟨C^{(12)(34)}, C⟩ = b`, so `⟨D, C₊₊⟩ = T` and `‖C₊₊‖² = (n + b + 2T)/4`, and `2T = 3y − z`.
-/

open MvPolynomial ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

variable {ι : Type*} [Fintype ι]

/-! ### The complex coefficient tensor and its contractions -/

section tensors

variable [DecidableEq ι]

/-- `P₊ = (1 − iJ)/2` (`s = 1`) and `P₋ = (1 + iJ)/2` (`s = −1`). -/
def cplxProj (J : ι → ι → ℝ) (s : ℝ) (a a' : ι) : ℂ :=
  ((if a = a' then 1 else 0) - s * Complex.I * J a a') / 2

/-- The complex coefficient tensor `t = 3 P₊P₊P₋ (f + ig)` of `q = a + ib` with real kernels
`f`, `g`. -/
def cplxT (J : ι → ι → ℝ) (f g : ι → ι → ι → ℝ) (a b c : ι) : ℂ :=
  3 * ∑ a', ∑ b', ∑ c', cplxProj J 1 a a' * cplxProj J 1 b b' * cplxProj J (-1) c c'
    * (f a' b' c' + Complex.I * g a' b' c')

/-- The tensor `t` of the circular cubic `q = a + ib`. -/
def gramT (J : ι → ι → ℝ) (a b : MvPolynomial ι ℝ) : ι → ι → ι → ℂ :=
  cplxT J (cubicKernel a) (cubicKernel b)

end tensors

variable (t : ι → ι → ι → ℂ)

/-- `N_{ab} = Σ_{jk} t_{ajk} t̄_{bjk}`. -/
def ctN (a b : ι) : ℂ := ∑ j, ∑ k, t a j k * conj (t b j k)
/-- `H_{ab} = Σ_{jk} t_{jka} t̄_{jkb}`. -/
def ctH (a b : ι) : ℂ := ∑ j, ∑ k, t j k a * conj (t j k b)
/-- `B_{be} = Σ_{ad} t_{abd} t_{dea}`. -/
def ctB (b e : ι) : ℂ := ∑ a, ∑ d, t a b d * t d e a
/-- `W_{abj;c} = Σ_i t_{abi} t_{jic}`. -/
def ctW (a b j c : ι) : ℂ := ∑ i, t a b i * t j i c
/-- `Y = Sym_{a,b,j} W`. -/
def ctY (a b j c : ι) : ℂ :=
  (ctW t a b j c + ctW t a j b c + ctW t b a j c + ctW t b j a c + ctW t j a b c
    + ctW t j b a c) / 6

/-- `n = ‖N‖²`. -/
def gramN : ℝ := ∑ a, ∑ b, Complex.normSq (ctN t a b)
/-- `h = ‖H‖²`. -/
def gramH : ℝ := ∑ a, ∑ b, Complex.normSq (ctH t a b)
/-- `b = ‖B‖²`. -/
def gramB : ℝ := ∑ b, ∑ e, Complex.normSq (ctB t b e)
/-- `y = ‖Y‖²`. -/
def gramY : ℝ := ∑ a, ∑ b, ∑ j, ∑ c, Complex.normSq (ctY t a b j c)
/-- `z = Re tr(N Hᵀ) = Re Σ_{ab} N_{ab} H_{ab}`. -/
def gramZ : ℝ := ∑ a, ∑ b, (ctN t a b * ctH t a b).re

lemma gramN_nonneg : 0 ≤ gramN t :=
  Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => Complex.normSq_nonneg _
lemma gramH_nonneg : 0 ≤ gramH t :=
  Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => Complex.normSq_nonneg _
lemma gramB_nonneg : 0 ≤ gramB t :=
  Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => Complex.normSq_nonneg _
lemma gramY_nonneg : 0 ≤ gramY t :=
  Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ =>
    Finset.sum_nonneg fun _ _ => Complex.normSq_nonneg _

/-- **`G₀ = Gram(N, Hᵀ)` is positive semidefinite**: `z² ≤ n h` (Cauchy–Schwarz). -/
lemma gramZ_sq_le : gramZ t ^ 2 ≤ gramN t * gramH t := by
  have hM : |gramZ t| ≤ ∑ a, ∑ b, ‖ctN t a b‖ * ‖ctH t a b‖ := by
    refine (Finset.abs_sum_le_sum_abs _ _).trans (Finset.sum_le_sum fun a _ => ?_)
    refine (Finset.abs_sum_le_sum_abs _ _).trans (Finset.sum_le_sum fun b _ => ?_)
    exact (Complex.abs_re_le_norm _).trans (by rw [norm_mul])
  have hCS : (∑ a, ∑ b, ‖ctN t a b‖ * ‖ctH t a b‖) ^ 2
      ≤ (∑ a, ∑ b, ‖ctN t a b‖ ^ 2) * ∑ a, ∑ b, ‖ctH t a b‖ ^ 2 := by
    have := Finset.sum_mul_sq_le_sq_mul_sq (Finset.univ : Finset (ι × ι))
      (fun p => ‖ctN t p.1 p.2‖) (fun p => ‖ctH t p.1 p.2‖)
    simpa only [Fintype.sum_prod_type] using this
  have e1 : gramN t = ∑ a, ∑ b, ‖ctN t a b‖ ^ 2 := by
    simp only [gramN, Complex.normSq_eq_norm_sq]
  have e2 : gramH t = ∑ a, ∑ b, ‖ctH t a b‖ ^ 2 := by
    simp only [gramH, Complex.normSq_eq_norm_sq]
  rw [e1, e2]
  calc gramZ t ^ 2 = |gramZ t| ^ 2 := (sq_abs _).symm
    _ ≤ (∑ a, ∑ b, ‖ctN t a b‖ * ‖ctH t a b‖) ^ 2 := pow_le_pow_left₀ (abs_nonneg _) hM 2
    _ ≤ _ := hCS

/-! ### The spectral norms -/

section spectral

variable (E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ) (a b : MvPolynomial ι ℝ)

/-- `u₂ = ‖U₂‖²`, the second-chaos energy of `U − 1`. -/
def specU2 : ℝ := E (proj2 (radU a b - C 1) * proj2 (radU a b - C 1))
/-- `u₄ = ‖U₄‖²`. -/
def specU4 : ℝ := E (proj4 (radU a b - C 1) * proj4 (radU a b - C 1))
/-- `v₂ = ‖(q²)₂‖² = ‖P₂‖² + ‖Q₂‖²` for `q² = P + iQ`. -/
def specV2 : ℝ :=
  E (proj2 (radP a b) * proj2 (radP a b)) + E (proj2 (radQ a b) * proj2 (radQ a b))
/-- `v₄ = ‖(q²)₄‖²`. -/
def specV4 : ℝ :=
  E (proj4 (radP a b) * proj4 (radP a b)) + E (proj4 (radQ a b) * proj4 (radQ a b))

end spectral

/-- `⟨X, Y⟩ = Σ X conj Y`, the Hermitian pairing of 4-tensors. -/
def hip (X Y : ι → ι → ι → ι → ℂ) : ℂ := ∑ a, ∑ b, ∑ c, ∑ d, X a b c d * conj (Y a b c d)

/-- `W^{(23)}_{abj;c} = W_{ajb;c}`. -/
def ctW23 (a b j c : ι) : ℂ := ctW t a j b c

/-- `T = Re ⟨W^{(23)}, W⟩`. -/
def gramT0 : ℝ := (hip (ctW23 t) (ctW t)).re

/-- `D_{ij;kl} = Σ_a t_{ija} conj t_{kla}`. -/
def ctD (i j k l : ι) : ℂ := ∑ a, t i j a * conj (t k l a)
/-- `C_{ij;kl} = Σ_a t_{iak} conj t_{laj}`. -/
def ctC (i j k l : ι) : ℂ := ∑ a, t i a k * conj (t l a j)
/-- `C₊₊ = (1 + J₁)(1 + J₂) C / 4`, symmetrised in each pair. -/
def ctCpp (i j k l : ι) : ℂ :=
  (ctC t i j k l + ctC t j i k l + ctC t i j l k + ctC t j i l k) / 4


/-- `M_{ad;a'd'} = Σ_b t_{abd} conj t_{a'bd'}`, the Gram matrix of the slices `(t_{a·d})`. -/
def ctM (a d a' d' : ι) : ℂ := ∑ b, t a b d * conj (t a' b d')


/-! ### Sum bookkeeping -/

section sums

variable {M : Type*} [AddCommMonoid M]

lemma sum3_swap12 (F : ι → ι → ι → M) : ∑ a, ∑ b, ∑ c, F b a c = ∑ a, ∑ b, ∑ c, F a b c :=
  Finset.sum_comm

lemma sum3_swap23 (F : ι → ι → ι → M) : ∑ a, ∑ b, ∑ c, F a c b = ∑ a, ∑ b, ∑ c, F a b c :=
  Finset.sum_congr rfl fun _ _ => Finset.sum_comm

lemma csum4_swap12 (F : ι → ι → ι → ι → M) :
    ∑ a, ∑ b, ∑ c, ∑ d, F b a c d = ∑ a, ∑ b, ∑ c, ∑ d, F a b c d :=
  Finset.sum_comm

lemma csum4_swap23 (F : ι → ι → ι → ι → M) :
    ∑ a, ∑ b, ∑ c, ∑ d, F a c b d = ∑ a, ∑ b, ∑ c, ∑ d, F a b c d :=
  Finset.sum_congr rfl fun _ _ => Finset.sum_comm

lemma csum4_swap34 (F : ι → ι → ι → ι → M) :
    ∑ a, ∑ b, ∑ c, ∑ d, F a b d c = ∑ a, ∑ b, ∑ c, ∑ d, F a b c d :=
  Finset.sum_congr rfl fun _ _ => Finset.sum_congr rfl fun _ _ => Finset.sum_comm

lemma sum3_swap13 (F : ι → ι → ι → M) : ∑ a, ∑ b, ∑ c, F c b a = ∑ a, ∑ b, ∑ c, F a b c :=
  (sum3_swap12 fun a b c => F c a b).trans ((sum3_swap23 fun a b c => F b a c).trans (sum3_swap12 F))

lemma csum4_swap13 (F : ι → ι → ι → ι → M) :
    ∑ a, ∑ b, ∑ c, ∑ d, F c b a d = ∑ a, ∑ b, ∑ c, ∑ d, F a b c d :=
  (csum4_swap12 fun a b c d => F c a b d).trans
    ((csum4_swap23 fun a b c d => F b a c d).trans (csum4_swap12 F))

lemma csum4_swap14 (F : ι → ι → ι → ι → M) :
    ∑ a, ∑ b, ∑ c, ∑ d, F d b c a = ∑ a, ∑ b, ∑ c, ∑ d, F a b c d :=
  (csum4_swap13 fun a b c d => F d b c a).symm.trans
    ((csum4_swap34 fun a b c d => F c b a d).trans (csum4_swap13 F))

lemma csum4_swap24 (F : ι → ι → ι → ι → M) :
    ∑ a, ∑ b, ∑ c, ∑ d, F a d c b = ∑ a, ∑ b, ∑ c, ∑ d, F a b c d :=
  (csum4_swap23 fun a b c d => F a d b c).trans
    ((csum4_swap34 fun a b c d => F a c b d).trans (csum4_swap23 F))

/-- `(x y a b) ↦ (a b x y)`. -/
lemma sum4_comm_13 {α β γ δ : Type*} [Fintype α] [Fintype β] [Fintype γ] [Fintype δ]
    (F : α → β → γ → δ → M) :
    ∑ x, ∑ y, ∑ a, ∑ b, F x y a b = ∑ a, ∑ b, ∑ x, ∑ y, F x y a b :=
  calc ∑ x, ∑ y, ∑ a, ∑ b, F x y a b = ∑ x, ∑ a, ∑ y, ∑ b, F x y a b :=
        Finset.sum_congr rfl fun _ _ => Finset.sum_comm
    _ = ∑ a, ∑ x, ∑ y, ∑ b, F x y a b := Finset.sum_comm
    _ = ∑ a, ∑ x, ∑ b, ∑ y, F x y a b :=
        Finset.sum_congr rfl fun _ _ => Finset.sum_congr rfl fun _ _ => Finset.sum_comm
    _ = ∑ a, ∑ b, ∑ x, ∑ y, F x y a b := Finset.sum_congr rfl fun _ _ => Finset.sum_comm

end sums

/-- **The factorisation lemma**: a sum of products of two single contractions, paired against a
conjugate of the same shape, factors through the two Gram matrices of the contracted slots. -/
lemma master {α β γ δ : Type*} [Fintype α] [Fintype β] [Fintype γ] [Fintype δ]
    (u : γ → α → ℂ) (v : γ → β → ℂ) (u' : δ → α → ℂ) (v' : δ → β → ℂ) :
    ∑ x, ∑ y, (∑ a, u a x * v a y) * conj (∑ b, u' b x * v' b y)
      = ∑ a, ∑ b, (∑ x, u a x * conj (u' b x)) * (∑ y, v a y * conj (v' b y)) := by
  simp only [map_sum, map_mul, Finset.sum_mul_sum]
  conv_lhs => rw [sum4_comm_13]
  refine Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ =>
    Finset.sum_congr rfl fun x _ => Finset.sum_congr rfl fun y _ => by ring

/-- `master` with pairs of outer indices and single contracted indices. -/
lemma master_pp (u v u' v' : ι → ι → ι → ℂ) :
    ∑ x₁, ∑ x₂, ∑ y₁, ∑ y₂, (∑ a, u a x₁ x₂ * v a y₁ y₂) * conj (∑ b, u' b x₁ x₂ * v' b y₁ y₂)
      = ∑ a, ∑ b, (∑ x₁, ∑ x₂, u a x₁ x₂ * conj (u' b x₁ x₂))
        * (∑ y₁, ∑ y₂, v a y₁ y₂ * conj (v' b y₁ y₂)) := by
  have h := master (fun a (x : ι × ι) => u a x.1 x.2) (fun a (y : ι × ι) => v a y.1 y.2)
    (fun b (x : ι × ι) => u' b x.1 x.2) (fun b (y : ι × ι) => v' b y.1 y.2)
  simpa only [Fintype.sum_prod_type] using h

/-- `master` with single outer indices and pairs of contracted indices. -/
lemma master_ss (u v u' v' : ι → ι → ι → ℂ) :
    ∑ x, ∑ y, (∑ a₁, ∑ a₂, u a₁ a₂ x * v a₁ a₂ y) * conj (∑ b₁, ∑ b₂, u' b₁ b₂ x * v' b₁ b₂ y)
      = ∑ a₁, ∑ a₂, ∑ b₁, ∑ b₂, (∑ x, u a₁ a₂ x * conj (u' b₁ b₂ x))
        * (∑ y, v a₁ a₂ y * conj (v' b₁ b₂ y)) := by
  have h := master (fun (a : ι × ι) x => u a.1 a.2 x) (fun (a : ι × ι) y => v a.1 a.2 y)
    (fun (b : ι × ι) x => u' b.1 b.2 x) (fun (b : ι × ι) y => v' b.1 b.2 y)
  simpa only [Fintype.sum_prod_type] using h

/-- **The tetrahedral regrouping**: when the two contracted pairs are crossed, the pairing is a
sum over the two remaining pairs of products of `W`-type contractions. -/
lemma tetra (P Q R S : ι → ι → ι → ℂ) :
    ∑ i, ∑ j, ∑ k, ∑ l, (∑ a, P a i k * conj (Q a l j)) * conj (∑ b, R b i j * conj (S b k l))
      = ∑ a, ∑ b, ∑ i, ∑ l, (∑ k, P a i k * S b k l) * conj (∑ j, Q a l j * R b i j) := by
  simp only [map_sum, map_mul, Complex.conj_conj, Finset.sum_mul_sum]
  have e1 : ∀ i j k l, ∑ a, ∑ b, P a i k * conj (Q a l j) * (conj (R b i j) * S b k l)
      = ∑ a, ∑ b, (P a i k * S b k l) * (conj (Q a l j) * conj (R b i j)) := fun i j k l =>
    Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => by ring
  simp only [e1]
  -- reorder `i j k l a b` to `a b i l k j`
  calc ∑ i, ∑ j, ∑ k, ∑ l, ∑ a, ∑ b, P a i k * S b k l * (conj (Q a l j) * conj (R b i j))
      = ∑ i, ∑ j, ∑ a, ∑ b, ∑ k, ∑ l,
          P a i k * S b k l * (conj (Q a l j) * conj (R b i j)) :=
        Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => sum4_comm_13 _
    _ = ∑ a, ∑ b, ∑ i, ∑ j, ∑ k, ∑ l,
          P a i k * S b k l * (conj (Q a l j) * conj (R b i j)) := sum4_comm_13 _
    _ = ∑ a, ∑ b, ∑ i, ∑ l, ∑ k, ∑ j,
          P a i k * S b k l * (conj (Q a l j) * conj (R b i j)) :=
        Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ =>
          Finset.sum_congr rfl fun i _ => (sum3_swap13 fun j k l =>
            P a i k * S b k l * (conj (Q a l j) * conj (R b i j))).symm

/-! ### The Hermitian pairing of 4-tensors -/

variable {t}

lemma hip_conj (X Y : ι → ι → ι → ι → ℂ) : conj (hip X Y) = hip Y X := by
  simp only [hip, map_sum, map_mul, Complex.conj_conj]
  exact Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ =>
    Finset.sum_congr rfl fun c _ => Finset.sum_congr rfl fun d _ => mul_comm _ _

lemma hip_self (X : ι → ι → ι → ι → ℂ) :
    hip X X = ((∑ a, ∑ b, ∑ c, ∑ d, Complex.normSq (X a b c d) : ℝ) : ℂ) := by
  simp only [hip, Complex.mul_conj, Complex.ofReal_sum]

lemma hip_self_re (X : ι → ι → ι → ι → ℂ) :
    (hip X X).re = ∑ a, ∑ b, ∑ c, ∑ d, Complex.normSq (X a b c d) := by
  rw [hip_self, Complex.ofReal_re]

lemma hip_self_re_nonneg (X : ι → ι → ι → ι → ℂ) : 0 ≤ (hip X X).re := by
  rw [hip_self_re]
  exact Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ =>
    Finset.sum_nonneg fun _ _ => Complex.normSq_nonneg _

lemma hip_add_right (X Y Z : ι → ι → ι → ι → ℂ) :
    hip X (fun a b c d => Y a b c d + Z a b c d) = hip X Y + hip X Z := by
  simp only [hip, map_add, mul_add, Finset.sum_add_distrib]

lemma hip_add_left (X Y Z : ι → ι → ι → ι → ℂ) :
    hip (fun a b c d => X a b c d + Y a b c d) Z = hip X Z + hip Y Z := by
  simp only [hip, add_mul, Finset.sum_add_distrib]

lemma hip_div_right (X Y : ι → ι → ι → ι → ℂ) (n : ℕ) [n.AtLeastTwo] :
    hip X (fun a b c d => Y a b c d / (OfNat.ofNat n : ℂ)) = hip X Y / OfNat.ofNat n := by
  simp only [hip, map_div₀, map_ofNat, mul_div_assoc, Finset.sum_div]

lemma hip_div_left (X Y : ι → ι → ι → ι → ℂ) (n : ℕ) [n.AtLeastTwo] :
    hip (fun a b c d => X a b c d / (OfNat.ofNat n : ℂ)) Y = hip X Y / OfNat.ofNat n := by
  simp only [hip, div_mul_eq_mul_div, Finset.sum_div]

lemma hip_swap12 (X Y : ι → ι → ι → ι → ℂ) :
    hip (fun a b c d => X b a c d) (fun a b c d => Y b a c d) = hip X Y := csum4_swap12 _
lemma hip_swap23 (X Y : ι → ι → ι → ι → ℂ) :
    hip (fun a b c d => X a c b d) (fun a b c d => Y a c b d) = hip X Y := csum4_swap23 _
lemma hip_swap34 (X Y : ι → ι → ι → ι → ℂ) :
    hip (fun a b c d => X a b d c) (fun a b c d => Y a b d c) = hip X Y := csum4_swap34 _
lemma hip_swap13 (X Y : ι → ι → ι → ι → ℂ) :
    hip (fun a b c d => X c b a d) (fun a b c d => Y c b a d) = hip X Y := csum4_swap13 _
lemma hip_swap14 (X Y : ι → ι → ι → ι → ℂ) :
    hip (fun a b c d => X d b c a) (fun a b c d => Y d b c a) = hip X Y := csum4_swap14 _
lemma hip_swap24 (X Y : ι → ι → ι → ι → ℂ) :
    hip (fun a b c d => X a d c b) (fun a b c d => Y a d c b) = hip X Y := csum4_swap24 _
/-- The pair swap `(13)(24)`. -/
lemma hip_swapP (X Y : ι → ι → ι → ι → ℂ) :
    hip (fun a b c d => X c d a b) (fun a b c d => Y c d a b) = hip X Y :=
  (hip_swap13 (fun a b c d => X a d c b) (fun a b c d => Y a d c b)).trans (hip_swap24 X Y)
/-- The cycle `(bcd) ↦ (cdb)`: `X a c d b`. -/
lemma hip_cyc (X Y : ι → ι → ι → ι → ℂ) :
    hip (fun a b c d => X a c d b) (fun a b c d => Y a c d b) = hip X Y :=
  (hip_swap23 (fun a b c d => X a b d c) (fun a b c d => Y a b d c)).trans (hip_swap34 X Y)
/-- The cycle `(bcd) ↦ (dbc)`: `X a d b c`. -/
lemma hip_cyc' (X Y : ι → ι → ι → ι → ℂ) :
    hip (fun a b c d => X a d b c) (fun a b c d => Y a d b c) = hip X Y :=
  (hip_swap34 (fun a b c d => X a c b d) (fun a b c d => Y a c b d)).trans (hip_swap23 X Y)
/-- The cycle `(abc) ↦ (bca)`: `X b c a d`. -/
lemma hip_cyc3 (X Y : ι → ι → ι → ι → ℂ) :
    hip (fun a b c d => X b c a d) (fun a b c d => Y b c a d) = hip X Y :=
  (hip_swap12 (fun a b c d => X a c b d) (fun a b c d => Y a c b d)).trans (hip_swap23 X Y)
/-- The cycle `(abc) ↦ (cab)`: `X c a b d`. -/
lemma hip_cyc3' (X Y : ι → ι → ι → ι → ℂ) :
    hip (fun a b c d => X c a b d) (fun a b c d => Y c a b d) = hip X Y :=
  (hip_swap23 (fun a b c d => X b a c d) (fun a b c d => Y b a c d)).trans (hip_swap12 X Y)

/-- `Re ⟨X, Y⟩ ≤ (‖X‖² + ‖Y‖²)/2`. -/
lemma hip_re_le (X Y : ι → ι → ι → ι → ℂ) :
    (hip X Y).re ≤ ((hip X X).re + (hip Y Y).re) / 2 := by
  rw [hip_self_re, hip_self_re, hip, Complex.re_sum]
  simp only [Complex.re_sum, ← Finset.sum_add_distrib, Finset.sum_div]
  refine Finset.sum_le_sum fun a _ => Finset.sum_le_sum fun b _ => Finset.sum_le_sum fun c _ =>
    Finset.sum_le_sum fun d _ => ?_
  have h1 := Complex.re_le_norm (X a b c d * conj (Y a b c d))
  rw [norm_mul, Complex.norm_conj] at h1
  rw [Complex.normSq_eq_norm_sq, Complex.normSq_eq_norm_sq]
  nlinarith [sq_nonneg (‖X a b c d‖ - ‖Y a b c d‖)]

/-- Cauchy–Schwarz: `(Re ⟨X, Y⟩)² ≤ ‖X‖² ‖Y‖²`. -/
lemma hip_re_sq_le (X Y : ι → ι → ι → ι → ℂ) :
    (hip X Y).re ^ 2 ≤ (hip X X).re * (hip Y Y).re := by
  have hM : |(hip X Y).re| ≤ ∑ p : ι × ι × ι × ι, ‖X p.1 p.2.1 p.2.2.1 p.2.2.2‖
      * ‖Y p.1 p.2.1 p.2.2.1 p.2.2.2‖ := by
    rw [hip, Complex.re_sum]
    simp only [Complex.re_sum, Fintype.sum_prod_type]
    refine (Finset.abs_sum_le_sum_abs _ _).trans (Finset.sum_le_sum fun a _ => ?_)
    refine (Finset.abs_sum_le_sum_abs _ _).trans (Finset.sum_le_sum fun b _ => ?_)
    refine (Finset.abs_sum_le_sum_abs _ _).trans (Finset.sum_le_sum fun c _ => ?_)
    refine (Finset.abs_sum_le_sum_abs _ _).trans (Finset.sum_le_sum fun d _ => ?_)
    exact (Complex.abs_re_le_norm _).trans (by rw [norm_mul, Complex.norm_conj])
  have hCS := Finset.sum_mul_sq_le_sq_mul_sq (Finset.univ : Finset (ι × ι × ι × ι))
    (fun p => ‖X p.1 p.2.1 p.2.2.1 p.2.2.2‖) (fun p => ‖Y p.1 p.2.1 p.2.2.1 p.2.2.2‖)
  have e1 : (hip X X).re = ∑ p : ι × ι × ι × ι, ‖X p.1 p.2.1 p.2.2.1 p.2.2.2‖ ^ 2 := by
    rw [hip_self_re]; simp only [Fintype.sum_prod_type, Complex.normSq_eq_norm_sq]
  have e2 : (hip Y Y).re = ∑ p : ι × ι × ι × ι, ‖Y p.1 p.2.1 p.2.2.1 p.2.2.2‖ ^ 2 := by
    rw [hip_self_re]; simp only [Fintype.sum_prod_type, Complex.normSq_eq_norm_sq]
  rw [e1, e2]
  calc (hip X Y).re ^ 2 = |(hip X Y).re| ^ 2 := (sq_abs _).symm
    _ ≤ (∑ p : ι × ι × ι × ι, ‖X p.1 p.2.1 p.2.2.1 p.2.2.2‖ * ‖Y p.1 p.2.1 p.2.2.1 p.2.2.2‖) ^ 2 :=
        pow_le_pow_left₀ (abs_nonneg _) hM 2
    _ ≤ _ := hCS

/-! ### The `W`-contractions: `z = ‖W‖²`, `y = (z + 2T)/3`, `y ≤ z` -/

section W

variable (ht : ∀ a b c, t a b c = t b a c)

include ht in
lemma ctW_symm12 (a b j c : ι) : ctW t b a j c = ctW t a b j c :=
  Finset.sum_congr rfl fun i _ => by rw [ht b a i]

include ht in
/-- `z = ‖W‖²`. -/
lemma gramZ_eq_hipW : gramZ t = (hip (ctW t) (ctW t)).re := by
  have h := master_pp (fun a j k => t a j k) (fun a j k => t j k a) (fun a j k => t a j k)
    (fun a j k => t j k a)
  have e : ∀ x₁ x₂ y₁ y₂, (∑ a, t a x₁ x₂ * t y₁ y₂ a) = ctW t y₁ y₂ x₁ x₂ :=
    fun x₁ x₂ y₁ y₂ => by
      unfold ctW
      exact Finset.sum_congr rfl fun a _ => by rw [ht a x₁ x₂]; ring
  simp only [e] at h
  have hL : hip (ctW t) (ctW t) = ∑ a, ∑ b, ctN t a b * ctH t a b := by
    rw [← hip_swapP]; exact h
  rw [gramZ]
  simp only [← Complex.re_sum]
  rw [hL]

include ht in
lemma hipW_eq : hip (ctW t) (ctW t) = (gramZ t : ℂ) := by
  rw [hip_self, gramZ_eq_hipW ht, hip_self_re]

/-- `⟨W^{(23)}, W⟩` is real. -/
lemma hipW23_conj : conj (hip (ctW23 t) (ctW t)) = hip (ctW23 t) (ctW t) := by
  rw [hip_conj, ← hip_swap23 (ctW t) (ctW23 t)]; rfl

lemma hipW23_eq : hip (ctW23 t) (ctW t) = (gramT0 t : ℂ) :=
  (Complex.conj_eq_iff_re.mp hipW23_conj).symm

lemma hipW_W23 : hip (ctW t) (ctW23 t) = (gramT0 t : ℂ) := by
  rw [← hip_conj, hipW23_eq, Complex.conj_ofReal]

lemma hipW23_W23 : hip (ctW23 t) (ctW23 t) = hip (ctW t) (ctW t) := hip_swap23 _ _

include ht in
/-- `⟨W^{(12)}, W⟩ = ⟨W, W⟩`. -/
lemma hipW12 : hip (fun a b j c => ctW t b a j c) (ctW t) = hip (ctW t) (ctW t) := by
  simp only [ctW_symm12 ht]

include ht in
/-- `⟨W^{(123)}, W⟩ = ⟨W^{(23)}, W⟩` (`W_{bja;c}`). -/
lemma hipW123 : hip (fun a b j c => ctW t b j a c) (ctW t) = hip (ctW23 t) (ctW t) := by
  rw [← hip_swap12 (ctW23 t) (ctW t)]
  congr 1
  funext a b c d
  exact (ctW_symm12 ht a b c d).symm

include ht in
/-- `⟨W^{(13)}, W⟩ = ⟨W^{(23)}, W⟩`. -/
lemma hipW13 : hip (fun a b j c => ctW t j b a c) (ctW t) = hip (ctW23 t) (ctW t) := by
  have e : (fun a b j c => ctW t j b a c) = fun a b j c => ctW t b j a c := by
    funext a b j c; exact ctW_symm12 ht b j a c
  rw [e]; exact hipW123 ht

include ht in
/-- `⟨W^{(132)}, W⟩ = ⟨W^{(23)}, W⟩` (`W_{jab;c}`). -/
lemma hipW132 : hip (fun a b j c => ctW t j a b c) (ctW t) = hip (ctW23 t) (ctW t) := by
  congr 1
  funext a b j c
  exact ctW_symm12 ht a j b c

lemma ctY_swap12 (a b j c : ι) : ctY t b a j c = ctY t a b j c := by unfold ctY; ring
lemma ctY_swap23 (a b j c : ι) : ctY t a j b c = ctY t a b j c := by unfold ctY; ring
lemma ctY_swap13 (a b j c : ι) : ctY t j b a c = ctY t a b j c := by unfold ctY; ring
lemma ctY_cyc3 (a b j c : ι) : ctY t b j a c = ctY t a b j c := by unfold ctY; ring
lemma ctY_cyc3' (a b j c : ι) : ctY t j a b c = ctY t a b j c := by unfold ctY; ring

/-- `‖Y‖² = ⟨Y, W⟩` (`Y` is the symmetrisation of `W`). -/
lemma hipY_Y : hip (ctY t) (ctY t) = hip (ctY t) (ctW t) := by
  have e : ctY t = fun a b j c => (ctW t a b j c + ctW t a j b c + ctW t b a j c
      + ctW t b j a c + ctW t j a b c + ctW t j b a c) / 6 := rfl
  have e' : hip (ctY t) (ctY t) = hip (ctY t) (fun a b j c => (ctW t a b j c + ctW t a j b c
      + ctW t b a j c + ctW t b j a c + ctW t j a b c + ctW t j b a c) / 6) := rfl
  rw [e', hip_div_right, hip_add_right, hip_add_right, hip_add_right, hip_add_right, hip_add_right]
  have h2 : hip (ctY t) (fun a b j c => ctW t a j b c) = hip (ctY t) (ctW t) := by
    rw [← hip_swap23 (ctY t) (ctW t)]; congr 1; funext a b c d; exact (ctY_swap23 a b c d).symm
  have h3 : hip (ctY t) (fun a b j c => ctW t b a j c) = hip (ctY t) (ctW t) := by
    rw [← hip_swap12 (ctY t) (ctW t)]; congr 1; funext a b c d; exact (ctY_swap12 a b c d).symm
  have h4 : hip (ctY t) (fun a b j c => ctW t b j a c) = hip (ctY t) (ctW t) := by
    rw [← hip_cyc3 (ctY t) (ctW t)]; congr 1; funext a b c d; exact (ctY_cyc3 a b c d).symm
  have h5 : hip (ctY t) (fun a b j c => ctW t j a b c) = hip (ctY t) (ctW t) := by
    rw [← hip_cyc3' (ctY t) (ctW t)]; congr 1; funext a b c d; exact (ctY_cyc3' a b c d).symm
  have h6 : hip (ctY t) (fun a b j c => ctW t j b a c) = hip (ctY t) (ctW t) := by
    rw [← hip_swap13 (ctY t) (ctW t)]; congr 1; funext a b c d; exact (ctY_swap13 a b c d).symm
  rw [h2, h3, h4, h5, h6]
  ring

include ht in
/-- `⟨Y, W⟩ = (2 ‖W‖² + 4 T)/6`. -/
lemma hipY_W : hip (ctY t) (ctW t) = (2 * gramZ t + 4 * gramT0 t) / 6 := by
  have e : ctY t = fun a b j c => (ctW t a b j c + ctW t a j b c + ctW t b a j c
      + ctW t b j a c + ctW t j a b c + ctW t j b a c) / 6 := rfl
  rw [e, hip_div_left, hip_add_left, hip_add_left, hip_add_left, hip_add_left, hip_add_left]
  have h2 : hip (fun a b j c => ctW t a j b c) (ctW t) = hip (ctW23 t) (ctW t) := rfl
  rw [h2, hipW12 ht, hipW123 ht, hipW132 ht, hipW13 ht, hipW_eq ht, hipW23_eq]
  ring

include ht in
/-- `y = (z + 2T)/3`. -/
lemma gramY_eq : gramY t = (2 * gramZ t + 4 * gramT0 t) / 6 := by
  have h : gramY t = (hip (ctY t) (ctY t)).re := (hip_self_re _).symm
  rw [h, hipY_Y, hipY_W ht]
  exact_mod_cast rfl

include ht in
/-- `T ≤ z`. -/
lemma gramT0_le : gramT0 t ≤ gramZ t := by
  have h := hip_re_le (ctW23 t) (ctW t)
  rw [hipW23_W23] at h
  rw [gramZ_eq_hipW ht]
  exact h.trans (le_of_eq (add_self_div_two _))

include ht in
/-- **`y ≤ z`** (the field `symm`): the symmetrisation `Y` of `W` is shorter than `W`. -/
theorem gramY_le_gramZ : gramY t ≤ gramZ t := by
  rw [gramY_eq ht]
  linarith [gramT0_le ht]

end W

/-! ### Schatten–Hölder: `b ≤ n` -/

section schatten

variable (ht : ∀ a b c, t a b c = t b a c)

include ht in
/-- `‖M‖² = n`. -/
lemma hipM_M : hip (ctM t) (ctM t) = (gramN t : ℂ) := by
  have h := master_pp (fun b a d => t a b d) (fun b a' d' => conj (t a' b d')) (fun b a d => t a b d)
    (fun b a' d' => conj (t a' b d'))
  have e1 : ∀ b b', (∑ a, ∑ d, t a b d * conj (t a b' d)) = ctN t b b' := fun b b' =>
    Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun d _ => by rw [ht a b d, ht a b' d]
  have e2 : ∀ b b', (∑ a', ∑ d', conj (t a' b d') * conj (conj (t a' b' d'))) = conj (ctN t b b') :=
    fun b b' => by
      simp only [ctN, map_sum, map_mul, Complex.conj_conj]
      exact Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun d _ => by rw [ht a b d, ht a b' d]
  simp only [e1, e2] at h
  rw [show ((gramN t : ℝ) : ℂ) = ∑ a, ∑ b, ctN t a b * conj (ctN t a b) by
    simp only [gramN, Complex.ofReal_sum, Complex.mul_conj]]
  exact h

/-- `b = Re Σ M_{ad;a'd'} M_{da;d'a'}`. -/
lemma gramB_eq_M : gramB t = (∑ a, ∑ d, ∑ a', ∑ d', ctM t a d a' d' * ctM t d a d' a').re := by
  have h := master_ss (fun a d b => t a b d) (fun a d e => t d e a) (fun a d b => t a b d)
    (fun a d e => t d e a)
  have e : ∀ a d a' d', (∑ y, t d y a * conj (t d' y a')) = ctM t d a d' a' := fun _ _ _ _ => rfl
  simp only [e, Complex.mul_conj] at h
  have h' : ((gramB t : ℝ) : ℂ) = ∑ a, ∑ d, ∑ a', ∑ d', ctM t a d a' d' * ctM t d a d' a' := by
    rw [gramB, Complex.ofReal_sum]; simp only [Complex.ofReal_sum]; exact h
  rw [← h', Complex.ofReal_re]

include ht in
/-- **Schatten–Hölder** (the field `schatten`): `b ≤ n`. -/
theorem gramB_le_gramN : gramB t ≤ gramN t := by
  rw [gramB_eq_M]
  have hn : gramN t = (hip (ctM t) (ctM t)).re := by rw [hipM_M ht, Complex.ofReal_re]
  rw [hn, hip_self_re, Complex.re_sum]
  simp only [Complex.re_sum]
  have hσ : ∑ a, ∑ d, ∑ a', ∑ d', Complex.normSq (ctM t d a d' a')
      = ∑ a, ∑ d, ∑ a', ∑ d', Complex.normSq (ctM t a d a' d') :=
    (csum4_swap12 fun a b c d => Complex.normSq (ctM t a b d c)).trans
      (csum4_swap34 fun a b c d => Complex.normSq (ctM t a b c d))
  have key : ∑ a, ∑ d, ∑ a', ∑ d', (ctM t a d a' d' * ctM t d a d' a').re
      ≤ ∑ a, ∑ d, ∑ a', ∑ d', (Complex.normSq (ctM t a d a' d')
        + Complex.normSq (ctM t d a d' a')) / 2 := by
    refine Finset.sum_le_sum fun a _ => Finset.sum_le_sum fun d _ => Finset.sum_le_sum fun a' _ =>
      Finset.sum_le_sum fun d' _ => ?_
    have h1 := Complex.re_le_norm (ctM t a d a' d' * ctM t d a d' a')
    rw [norm_mul] at h1
    rw [Complex.normSq_eq_norm_sq, Complex.normSq_eq_norm_sq]
    nlinarith [sq_nonneg (‖ctM t a d a' d'‖ - ‖ctM t d a d' a'‖)]
  refine key.trans (le_of_eq ?_)
  simp only [← Finset.sum_div, Finset.sum_add_distrib, hσ]
  ring

end schatten

/-! ### The Gram matrix `G₁ = Gram(D, C₊₊)` -/

section gram1

variable (ht : ∀ a b c, t a b c = t b a c)

lemma csum4_cyc3 {M : Type*} [AddCommMonoid M] (F : ι → ι → ι → ι → M) :
    ∑ a, ∑ b, ∑ c, ∑ d, F b c a d = ∑ a, ∑ b, ∑ c, ∑ d, F a b c d :=
  (csum4_swap12 fun a b c d => F a c b d).trans (csum4_swap23 F)

lemma csum4_cyc' {M : Type*} [AddCommMonoid M] (F : ι → ι → ι → ι → M) :
    ∑ a, ∑ b, ∑ c, ∑ d, F a d b c = ∑ a, ∑ b, ∑ c, ∑ d, F a b c d :=
  (csum4_swap34 fun a b c d => F a c b d).trans (csum4_swap23 F)

lemma csum4_cyc {M : Type*} [AddCommMonoid M] (F : ι → ι → ι → ι → M) :
    ∑ a, ∑ b, ∑ c, ∑ d, F a c d b = ∑ a, ∑ b, ∑ c, ∑ d, F a b c d :=
  (csum4_swap23 fun a b c d => F a b d c).trans (csum4_swap34 F)

lemma csum4_perm_dacb {M : Type*} [AddCommMonoid M] (F : ι → ι → ι → ι → M) :
    ∑ a, ∑ b, ∑ c, ∑ d, F d a c b = ∑ a, ∑ b, ∑ c, ∑ d, F a b c d :=
  (csum4_swap14 fun a b c d => F a d c b).trans (csum4_swap24 F)

lemma hip_perm_dbac (X Y : ι → ι → ι → ι → ℂ) :
    hip (fun a b c d => X d b a c) (fun a b c d => Y d b a c) = hip X Y :=
  (hip_swap14 (fun a b c d => X a b d c) (fun a b c d => Y a b d c)).trans (hip_swap34 X Y)

lemma hip_perm_cadb (X Y : ι → ι → ι → ι → ℂ) :
    hip (fun a b c d => X c a d b) (fun a b c d => Y c a d b) = hip X Y :=
  (hip_cyc3' (fun a b c d => X a b d c) (fun a b c d => Y a b d c)).trans (hip_swap34 X Y)

lemma hip_swap1234 (X Y : ι → ι → ι → ι → ℂ) :
    hip (fun a b c d => X b a d c) (fun a b c d => Y b a d c) = hip X Y :=
  (hip_swap12 (fun a b c d => X a b d c) (fun a b c d => Y a b d c)).trans (hip_swap34 X Y)

/-- `‖D‖² = h`. -/
lemma hipD_D : hip (ctD t) (ctD t) = (gramH t : ℂ) := by
  have h := master_pp (fun a i j => t i j a) (fun a k l => conj (t k l a)) (fun a i j => t i j a)
    (fun a k l => conj (t k l a))
  have e1 : ∀ a b, (∑ i, ∑ j, t i j a * conj (t i j b)) = ctH t a b := fun _ _ => rfl
  have e2 : ∀ a b, (∑ k, ∑ l, conj (t k l a) * conj (conj (t k l b))) = conj (ctH t a b) :=
    fun a b => by simp only [ctH, map_sum, map_mul, Complex.conj_conj]
  simp only [e1, e2] at h
  rw [show ((gramH t : ℝ) : ℂ) = ∑ a, ∑ b, ctH t a b * conj (ctH t a b) by
    simp only [gramH, Complex.ofReal_sum, Complex.mul_conj]]
  exact h

include ht in
/-- `‖C‖² = n`. -/
lemma hipC_C : hip (ctC t) (ctC t) = (gramN t : ℂ) := by
  have h := master_pp (fun a i k => t i a k) (fun a l j => conj (t l a j)) (fun a i k => t i a k)
    (fun a l j => conj (t l a j))
  have e1 : ∀ a b, (∑ i, ∑ k, t i a k * conj (t i b k)) = ctN t a b := fun a b =>
    Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun k _ => by rw [ht i a k, ht i b k]
  have e2 : ∀ a b, (∑ l, ∑ j, conj (t l a j) * conj (conj (t l b j))) = conj (ctN t a b) :=
    fun a b => by
      simp only [ctN, map_sum, map_mul, Complex.conj_conj]
      exact Finset.sum_congr rfl fun l _ => Finset.sum_congr rfl fun j _ => by rw [ht l a j, ht l b j]
  simp only [e1, e2] at h
  calc hip (ctC t) (ctC t)
      = ∑ i, ∑ j, ∑ k, ∑ l, ctC t i j k l * conj (ctC t i j k l) := rfl
    _ = ∑ i, ∑ k, ∑ l, ∑ j, ctC t i j k l * conj (ctC t i j k l) := (csum4_cyc' _).symm
    _ = ∑ a, ∑ b, ctN t a b * conj (ctN t a b) := h
    _ = _ := by simp only [gramN, Complex.ofReal_sum, Complex.mul_conj]

/-- `⟨C^{(12)(34)}, C⟩ = b`. -/
lemma hipC1234_C : hip (fun i j k l => ctC t j i l k) (ctC t) = (gramB t : ℂ) := by
  have h := master_pp (fun a j l => t j a l) (fun a k i => conj (t k a i))
    (fun b j l => conj (t l b j)) (fun b k i => t i b k)
  have e1 : ∀ a b, (∑ j, ∑ l, t j a l * conj (conj (t l b j))) = ctB t a b := fun a b => by
    simp only [Complex.conj_conj]; rfl
  have e2 : ∀ a b, (∑ k, ∑ i, conj (t k a i) * conj (t i b k)) = conj (ctB t a b) := fun a b => by
    simp only [ctB, map_sum, map_mul]
  simp only [e1, e2] at h
  calc hip (fun i j k l => ctC t j i l k) (ctC t)
      = ∑ i, ∑ j, ∑ k, ∑ l, ctC t j i l k * conj (ctC t i j k l) := rfl
    _ = ∑ j, ∑ l, ∑ k, ∑ i, ctC t j i l k * conj (ctC t i j k l) := (csum4_perm_dacb _).symm
    _ = ∑ j, ∑ l, ∑ k, ∑ i, (∑ a, t j a l * conj (t k a i))
          * conj (∑ b, conj (t l b j) * t i b k) := by
        refine Finset.sum_congr rfl fun j _ => Finset.sum_congr rfl fun l _ =>
          Finset.sum_congr rfl fun k _ => Finset.sum_congr rfl fun i _ => ?_
        rw [show ctC t i j k l = ∑ b, conj (t l b j) * t i b k from
          Finset.sum_congr rfl fun b _ => mul_comm _ _]
        rfl
    _ = ∑ a, ∑ b, ctB t a b * conj (ctB t a b) := h
    _ = _ := by simp only [gramB, Complex.ofReal_sum, Complex.mul_conj]

include ht in
/-- `⟨C^{(12)}, C⟩ = T`. -/
lemma hipC12_C : hip (fun i j k l => ctC t j i k l) (ctC t) = (gramT0 t : ℂ) := by
  have h := tetra (fun a k j => t j a k) (fun a l i => t l a i) (fun b k i => t i b k)
    (fun b j l => t l b j)
  have e1 : ∀ a b k l, (∑ j, t j a k * t l b j) = ctW t l b a k := fun a b k l =>
    Finset.sum_congr rfl fun j _ => by rw [ht j a k]; ring
  have e2 : ∀ a b k l, (∑ i, t l a i * t i b k) = ctW t l a b k := fun a b k l =>
    Finset.sum_congr rfl fun i _ => by rw [ht i b k]
  simp only [e1, e2] at h
  calc hip (fun i j k l => ctC t j i k l) (ctC t)
      = ∑ i, ∑ j, ∑ k, ∑ l, (∑ a, t j a k * conj (t l a i))
          * conj (∑ b, t i b k * conj (t l b j)) := rfl
    _ = ∑ k, ∑ i, ∑ j, ∑ l, (∑ a, t j a k * conj (t l a i))
          * conj (∑ b, t i b k * conj (t l b j)) := (csum4_cyc3 _).symm
    _ = ∑ a, ∑ b, ∑ k, ∑ l, ctW t l b a k * conj (ctW t l a b k) := h
    _ = hip (ctW t) (ctW23 t) := hip_perm_dbac _ _
    _ = _ := hipW_W23

include ht in
/-- `⟨C^{(34)}, C⟩ = T`. -/
lemma hipC34_C : hip (fun i j k l => ctC t i j l k) (ctC t) = (gramT0 t : ℂ) := by
  have h := tetra (fun a i l => t i a l) (fun a j k => t k a j) (fun b i k => t i b k)
    (fun b l j => t l b j)
  have e1 : ∀ a b i j, (∑ l, t i a l * t l b j) = ctW t i a b j := fun a b i j =>
    Finset.sum_congr rfl fun l _ => by rw [ht l b j]
  have e2 : ∀ a b i j, (∑ k, t k a j * t i b k) = ctW t i b a j := fun a b i j =>
    Finset.sum_congr rfl fun k _ => by rw [ht k a j]; ring
  simp only [e1, e2] at h
  calc hip (fun i j k l => ctC t i j l k) (ctC t)
      = ∑ i, ∑ j, ∑ k, ∑ l, (∑ a, t i a l * conj (t k a j))
          * conj (∑ b, t i b k * conj (t l b j)) := rfl
    _ = ∑ i, ∑ k, ∑ l, ∑ j, (∑ a, t i a l * conj (t k a j))
          * conj (∑ b, t i b k * conj (t l b j)) := (csum4_cyc' _).symm
    _ = ∑ a, ∑ b, ∑ i, ∑ j, ctW t i a b j * conj (ctW t i b a j) := h
    _ = hip (ctW t) (ctW23 t) := hip_cyc3' _ _
    _ = _ := hipW_W23

include ht in
/-- `⟨C, D⟩ = T`. -/
lemma hipC_D : hip (ctC t) (ctD t) = (gramT0 t : ℂ) := by
  have h := tetra (fun a i k => t i a k) (fun a l j => t l a j) (fun b i j => t i j b)
    (fun b k l => t k l b)
  have e1 : ∀ a b i l, (∑ k, t i a k * t k l b) = ctW t i a l b := fun a b i l =>
    Finset.sum_congr rfl fun k _ => by rw [ht k l b]
  have e2 : ∀ a b i l, (∑ j, t l a j * t i j b) = ctW t l a i b := fun a b i l => rfl
  simp only [e1, e2] at h
  calc hip (ctC t) (ctD t)
      = ∑ a, ∑ b, ∑ i, ∑ l, ctW t i a l b * conj (ctW t l a i b) := h
    _ = hip (ctW t) (fun a b j c => ctW t j b a c) := hip_perm_cadb _ _
    _ = _ := by rw [← hip_conj, hipW13 ht, hipW23_eq, Complex.conj_ofReal]

include ht in
lemma ctD_swap12 (i j k l : ι) : ctD t j i k l = ctD t i j k l :=
  Finset.sum_congr rfl fun a _ => by rw [ht j i a]
include ht in
lemma ctD_swap34 (i j k l : ι) : ctD t i j l k = ctD t i j k l :=
  Finset.sum_congr rfl fun a _ => by rw [ht l k a]
lemma ctCpp_swap12 (i j k l : ι) : ctCpp t j i k l = ctCpp t i j k l := by unfold ctCpp; ring
lemma ctCpp_swap34 (i j k l : ι) : ctCpp t i j l k = ctCpp t i j k l := by unfold ctCpp; ring

include ht in
/-- `⟨D, C₊₊⟩ = T`. -/
lemma hipD_Cpp : hip (ctD t) (ctCpp t) = (gramT0 t : ℂ) := by
  have e : hip (ctD t) (ctCpp t) = hip (ctD t) (fun i j k l =>
      (ctC t i j k l + ctC t j i k l + ctC t i j l k + ctC t j i l k) / 4) := rfl
  rw [e, hip_div_right, hip_add_right, hip_add_right, hip_add_right]
  have h0 : hip (ctD t) (ctC t) = (gramT0 t : ℂ) := by
    rw [← hip_conj, hipC_D ht, Complex.conj_ofReal]
  have h1 : hip (ctD t) (fun i j k l => ctC t j i k l) = hip (ctD t) (ctC t) := by
    rw [← hip_swap12 (ctD t) (ctC t)]; congr 1; funext i j k l; exact (ctD_swap12 ht i j k l).symm
  have h2 : hip (ctD t) (fun i j k l => ctC t i j l k) = hip (ctD t) (ctC t) := by
    rw [← hip_swap34 (ctD t) (ctC t)]; congr 1; funext i j k l; exact (ctD_swap34 ht i j k l).symm
  have h3 : hip (ctD t) (fun i j k l => ctC t j i l k) = hip (ctD t) (ctC t) := by
    rw [← hip_swap1234 (ctD t) (ctC t)]; congr 1; funext i j k l
    rw [ctD_swap12 ht, ctD_swap34 ht]
  rw [h1, h2, h3, h0]
  ring

include ht in
/-- `‖C₊₊‖² = (n + b + 2T)/4`. -/
lemma hipCpp_Cpp : hip (ctCpp t) (ctCpp t) = (((gramN t + gramB t + 2 * gramT0 t) / 4 : ℝ) : ℂ) := by
  have e : hip (ctCpp t) (ctCpp t) = hip (ctCpp t) (fun i j k l =>
      (ctC t i j k l + ctC t j i k l + ctC t i j l k + ctC t j i l k) / 4) := rfl
  rw [e, hip_div_right, hip_add_right, hip_add_right, hip_add_right]
  have h1 : hip (ctCpp t) (fun i j k l => ctC t j i k l) = hip (ctCpp t) (ctC t) := by
    rw [← hip_swap12 (ctCpp t) (ctC t)]; congr 1; funext i j k l; exact (ctCpp_swap12 i j k l).symm
  have h2 : hip (ctCpp t) (fun i j k l => ctC t i j l k) = hip (ctCpp t) (ctC t) := by
    rw [← hip_swap34 (ctCpp t) (ctC t)]; congr 1; funext i j k l; exact (ctCpp_swap34 i j k l).symm
  have h3 : hip (ctCpp t) (fun i j k l => ctC t j i l k) = hip (ctCpp t) (ctC t) := by
    rw [← hip_swap1234 (ctCpp t) (ctC t)]; congr 1; funext i j k l
    rw [ctCpp_swap12, ctCpp_swap34]
  rw [h1, h2, h3]
  have e' : hip (ctCpp t) (ctC t) = hip (fun i j k l =>
      (ctC t i j k l + ctC t j i k l + ctC t i j l k + ctC t j i l k) / 4) (ctC t) := rfl
  rw [e', hip_div_left, hip_add_left, hip_add_left, hip_add_left, hipC_C ht, hipC12_C ht,
    hipC34_C ht, hipC1234_C]
  push_cast
  ring

include ht in
/-- **`G₁ ⪰ 0`, first condition** (the field `gram1a`): `n + b + 2T ≥ 0`, `2T = 3y − z`. -/
theorem gram1a_of_symm : 0 ≤ gramN t + gramB t + (3 * gramY t - gramZ t) := by
  have hy := gramY_eq ht
  have h := hip_self_re_nonneg (ctCpp t)
  rw [hipCpp_Cpp ht, Complex.ofReal_re] at h
  linarith

include ht in
/-- **`G₁ ⪰ 0`, second condition** (the field `gram1b`): `4T² ≤ h (n + b + 2T)`, the
Cauchy–Schwarz inequality of `D` and `C₊₊`. -/
theorem gram1b_of_symm : (3 * gramY t - gramZ t) ^ 2
    ≤ gramH t * (gramN t + gramB t + (3 * gramY t - gramZ t)) := by
  have hy := gramY_eq ht
  have hcs := hip_re_sq_le (ctD t) (ctCpp t)
  rw [hipD_Cpp ht, hipD_D, hipCpp_Cpp ht, Complex.ofReal_re, Complex.ofReal_re,
    Complex.ofReal_re] at hcs
  have e : 3 * gramY t - gramZ t = 2 * gramT0 t := by linarith
  rw [e]
  nlinarith [hcs]

end gram1


/-! ### The symmetric tensor of a circular cubic -/

section gramT

variable [DecidableEq ι] (J : ι → ι → ℝ)

/-- `t_{abc} = t_{bac}` when the kernels are symmetric in their first two slots. -/
lemma cplxT_symm12 {f g : ι → ι → ι → ℝ} (hf : ∀ a b c, f a b c = f b a c)
    (hg : ∀ a b c, g a b c = g b a c) (a b c : ι) : cplxT J f g b a c = cplxT J f g a b c := by
  unfold cplxT
  congr 1
  calc ∑ a', ∑ b', ∑ c', cplxProj J 1 b a' * cplxProj J 1 a b' * cplxProj J (-1) c c'
          * (f a' b' c' + Complex.I * g a' b' c')
      = ∑ a', ∑ b', ∑ c', cplxProj J 1 b b' * cplxProj J 1 a a' * cplxProj J (-1) c c'
          * (f b' a' c' + Complex.I * g b' a' c') := (sum3_swap12 _).symm
    _ = _ := Finset.sum_congr rfl fun a' _ => Finset.sum_congr rfl fun b' _ =>
        Finset.sum_congr rfl fun c' _ => by rw [hf b' a' c', hg b' a' c']; ring

lemma gramT_symm12 (a b : MvPolynomial ι ℝ) (i j k : ι) :
    gramT J a b i j k = gramT J a b j i k :=
  (cplxT_symm12 J (cubicKernel_symm12 a) (cubicKernel_symm12 b) i j k).symm

variable (a b : MvPolynomial ι ℝ)

/-- **Schatten–Hölder** for the tensor of a circular cubic: `b ≤ n`. -/
theorem gramT_schatten : gramB (gramT J a b) ≤ gramN (gramT J a b) :=
  gramB_le_gramN (gramT_symm12 J a b)

/-- **Symmetrisation** for the tensor of a circular cubic: `y ≤ z`. -/
theorem gramT_symm : gramY (gramT J a b) ≤ gramZ (gramT J a b) :=
  gramY_le_gramZ (gramT_symm12 J a b)

/-- **`G₁ ⪰ 0`**, first condition, for the tensor of a circular cubic. -/
theorem gramT_gram1a : 0 ≤ gramN (gramT J a b) + gramB (gramT J a b)
    + (3 * gramY (gramT J a b) - gramZ (gramT J a b)) :=
  gram1a_of_symm (gramT_symm12 J a b)

/-- **`G₁ ⪰ 0`**, second condition, for the tensor of a circular cubic. -/
theorem gramT_gram1b : (3 * gramY (gramT J a b) - gramZ (gramT J a b)) ^ 2
    ≤ gramH (gramT J a b) * (gramN (gramT J a b) + gramB (gramT J a b)
      + (3 * gramY (gramT J a b) - gramZ (gramT J a b))) :=
  gram1b_of_symm (gramT_symm12 J a b)

end gramT

end

end Grothe.LowerAnalytic
