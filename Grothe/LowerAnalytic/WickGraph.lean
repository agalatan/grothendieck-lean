import Grothe.LowerAnalytic.Circular

/-!
# Wick graphs: Gaussian moments of products of a cubic chaos as multigraph sums

For a polynomial `F` in the third chaos and a Gaussian expectation `E`, the moment
`E[∏_{v < N} F]` is computed by integration by parts one edge at a time.  A *partial graph* on
the vertices `Fin N` is a list of edges `es : List (Fin N × Fin N)`; each edge carries a summed
index `j : ι`, and every vertex `v` carries the word of the indices of its edges.  The value of
the partial graph is the nested sum (`gsum`)

  `Σ_{j₁} … Σ_{jₘ} E[∏_v ∂_{w_v} F]`,      `∂_{[i₁, …, iᵣ]} F = ∂_{i₁} ⋯ ∂_{iᵣ} F` (`dw`).

* `gsum_step` (**the edge step**): for a vertex `v₀` of degree `d`, with `k = 3 − d`,
  `k · val es = Σ_{t ≠ v₀} val (es ++ [(v₀, t)])`.  The polynomial `∂_{w_{v₀}} F` is an eigenfunction
  of the Ornstein–Uhlenbeck generator with eigenvalue `−k` (`ouL_dw`), so
  `k E[P X] = E Γ(X, P) = Σⱼ E[∂ⱼX ∂ⱼP]`, and `∂ⱼX` is expanded by the Leibniz rule.
* `gsum_eq_zero_of_deg`: a vertex of degree `≥ 4` makes the value vanish.
* `gsum_full`: when every vertex has degree three the value is the multigraph sum of the
  constants `∂_{w_v} F` (the kernel `kern F`).
* The value only depends on the isomorphism class of the multigraph: it is invariant under
  permutations of the edge list (`gsum_perm`), under flipping edges (`gsum_map_normP`) and
  under relabelling the vertices (`gsum_relabel`).  `gsum_iso` packages these with a decidable
  certificate (`isoOK`: a relabelling after which the normalised sorted edge lists agree), and
  `gsum_step_cert` packages the edge step with such certificates for every successor
  (`stepOK`), so that a moment computation is a finite list of `decide`-checked steps.
-/

open MvPolynomial

namespace Grothe.LowerAnalytic

noncomputable section

variable {ι : Type*}

/-! ### Iterated derivatives -/

/-- The iterated partial derivative `∂_{i₁} ⋯ ∂_{iᵣ} F` along a word. -/
def dw (F : MvPolynomial ι ℝ) : List ι → MvPolynomial ι ℝ
  | [] => F
  | j :: w => pderiv j (dw F w)

@[simp] lemma dw_nil (F : MvPolynomial ι ℝ) : dw F [] = F := rfl

@[simp] lemma dw_cons (F : MvPolynomial ι ℝ) (j : ι) (w : List ι) :
    dw F (j :: w) = pderiv j (dw F w) := rfl

lemma dw_perm (F : MvPolynomial ι ℝ) {w w' : List ι} (h : w.Perm w') : dw F w = dw F w' := by
  induction h with
  | nil => rfl
  | cons x _ ih => simp [ih]
  | swap x y l => simp only [dw_cons]; exact pderiv_pderiv_comm _ _ _
  | trans _ _ ih1 ih2 => exact ih1.trans ih2

/-- The constant term of an iterated derivative. -/
def cw (F : MvPolynomial ι ℝ) (w : List ι) : ℝ := constantCoeff (dw F w)

lemma cw_perm (F : MvPolynomial ι ℝ) {w w' : List ι} (h : w.Perm w') : cw F w = cw F w' := by
  unfold cw; rw [dw_perm F h]

lemma cw_three (F : MvPolynomial ι ℝ) (a b c : ι) : cw F [a, b, c] = kern F a b c := rfl

/-- The constant term of an iterated derivative as a function of the multiset of directions. -/
def cwm (F : MvPolynomial ι ℝ) : Multiset ι → ℝ := Quot.lift (cw F) (fun _ _ h => cw_perm F h)

lemma cw3_eq (F : MvPolynomial ι ℝ) (a b c : ι) : cw F [a, b, c] = cwm F (a ::ₘ b ::ₘ c ::ₘ 0) := rfl

lemma cubicKernel_eq_cwm (F : MvPolynomial ι ℝ) (a b c : ι) :
    cubicKernel F a b c = cwm F (a ::ₘ b ::ₘ c ::ₘ 0) / 6 := rfl

variable [Fintype ι]

section chaos

variable [DecidableEq ι] {F : MvPolynomial ι ℝ}

omit [DecidableEq ι] in
lemma Chaos3.dw_three (hF : Chaos3 F) {w : List ι} (hw : w.length = 3) :
    dw F w = C (cw F w) := by
  match w, hw with
  | [a, b, c], _ =>
    obtain ⟨t, ht⟩ := hF.cubic a b c
    simp only [cw, dw_cons, dw_nil, ht, constantCoeff_C]

omit [DecidableEq ι] in
lemma Chaos3.dw_eq_zero (hF : Chaos3 F) {w : List ι} (hw : 4 ≤ w.length) : dw F w = 0 := by
  induction w with
  | nil => simp at hw
  | cons j w ih =>
    simp only [List.length_cons] at hw
    rcases Nat.lt_or_ge w.length 4 with h | h
    · have h3 : w.length = 3 := by omega
      rw [dw_cons, hF.dw_three h3, pderiv_C]
    · rw [dw_cons, ih h, map_zero]

/-- `∂_w F` lies in the chaos of order `3 − |w|`. -/
lemma Chaos3.ouL_dw (hF : Chaos3 F) (w : List ι) :
    ouL (dw F w) = -(C (3 - (w.length : ℝ)) * dw F w) := by
  induction w with
  | nil => simp [hF.eig, map_ofNat]
  | cons j w ih =>
    rw [dw_cons, Grothe.LowerAnalytic.ouL_pderiv, ih, map_neg, pderiv_C_mul, List.length_cons, Nat.cast_succ]
    rw [show (3 : ℝ) - (w.length + 1) = (3 - w.length) - 1 by ring]
    simp only [map_sub, map_one]
    ring

end chaos

/-! ### Partial graphs and their nested sums -/

variable {N : ℕ}

/-- Attach the index `j` of a new edge `(a, b)` to the words of its endpoints. -/
def addE (a b : Fin N) (j : ι) (w : Fin N → List ι) : Fin N → List ι := fun v =>
  (if v = a then [j] else []) ++ ((if v = b then [j] else []) ++ w v)

/-- The nested edge sum of a partial graph. -/
def gsum (φ : (Fin N → List ι) → ℝ) : List (Fin N × Fin N) → (Fin N → List ι) → ℝ
  | [], w => φ w
  | e :: es, w => ∑ j, gsum φ es (addE e.1 e.2 j w)

omit [Fintype ι] in
lemma addE_apply (a b : Fin N) (j : ι) (w : Fin N → List ι) (v : Fin N) :
    addE a b j w v = (if v = a then [j] else []) ++ ((if v = b then [j] else []) ++ w v) := rfl

@[simp] lemma gsum_nil (φ : (Fin N → List ι) → ℝ) (w : Fin N → List ι) : gsum φ [] w = φ w := rfl

@[simp] lemma gsum_cons (φ : (Fin N → List ι) → ℝ) (e : Fin N × Fin N)
    (es : List (Fin N × Fin N)) (w : Fin N → List ι) :
    gsum φ (e :: es) w = ∑ j, gsum φ es (addE e.1 e.2 j w) := rfl

/-- The degree of a vertex in an edge list. -/
def degE (es : List (Fin N × Fin N)) (v : Fin N) : ℕ :=
  es.countP (fun e => decide (e.1 = v)) + es.countP (fun e => decide (e.2 = v))

@[simp] lemma degE_nil (v : Fin N) : degE ([] : List (Fin N × Fin N)) v = 0 := rfl

lemma degE_cons (e : Fin N × Fin N) (es : List (Fin N × Fin N)) (v : Fin N) :
    degE (e :: es) v = degE es v + (if e.1 = v then 1 else 0) + (if e.2 = v then 1 else 0) := by
  simp only [degE, List.countP_cons, decide_eq_true_eq]
  split_ifs <;> omega

omit [Fintype ι] in
lemma length_addE (a b : Fin N) (j : ι) (w : Fin N → List ι) (v : Fin N) :
    (addE a b j w v).length = (w v).length + (if a = v then 1 else 0) + (if b = v then 1 else 0) := by
  unfold addE
  simp only [List.length_append, eq_comm (a := a), eq_comm (a := b)]
  split_ifs <;> simp <;> omega

/-- Agreement of two summands on all words of the final lengths. -/
lemma gsum_congr {φ ψ : (Fin N → List ι) → ℝ} (es : List (Fin N × Fin N)) (w : Fin N → List ι)
    (h : ∀ w' : Fin N → List ι, (∀ v, (w' v).length = (w v).length + degE es v) → φ w' = ψ w') :
    gsum φ es w = gsum ψ es w := by
  induction es generalizing w with
  | nil => exact h w (fun v => by simp)
  | cons e es ih =>
    simp only [gsum_cons]
    refine Finset.sum_congr rfl fun j _ => ih _ fun w' hw' => h w' fun v => ?_
    rw [hw' v, length_addE, degE_cons]
    split_ifs <;> omega

/-! ### Invariance under isomorphism -/

/-- A summand that only depends on the words up to permutation. -/
def PermInv (φ : (Fin N → List ι) → ℝ) : Prop :=
  ∀ w w' : Fin N → List ι, (∀ v, (w v).Perm (w' v)) → φ w = φ w'

omit [Fintype ι] in
lemma addE_perm {w w' : Fin N → List ι} (h : ∀ v, (w v).Perm (w' v)) (a b : Fin N) (j : ι)
    (v : Fin N) : (addE a b j w v).Perm (addE a b j w' v) :=
  ((h v).append_left _).append_left _

lemma gsum_congr_perm {φ : (Fin N → List ι) → ℝ} (hφ : PermInv φ) (es : List (Fin N × Fin N))
    {w w' : Fin N → List ι} (h : ∀ v, (w v).Perm (w' v)) : gsum φ es w = gsum φ es w' := by
  induction es generalizing w w' with
  | nil => exact hφ w w' h
  | cons e es ih =>
    simp only [gsum_cons]
    exact Finset.sum_congr rfl fun j _ => ih (addE_perm h _ _ j)

omit [Fintype ι] in
lemma addE_comm (a b c d : Fin N) (j j' : ι) (w : Fin N → List ι) (v : Fin N) :
    (addE a b j (addE c d j' w) v).Perm (addE c d j' (addE a b j w) v) := by
  classical
  rw [List.perm_iff_count]
  intro x
  unfold addE
  split_ifs <;> simp only [List.count_cons, List.count_append, List.count_nil] <;> omega

lemma gsum_perm {φ : (Fin N → List ι) → ℝ} (hφ : PermInv φ) {es es' : List (Fin N × Fin N)}
    (h : es.Perm es') (w : Fin N → List ι) : gsum φ es w = gsum φ es' w := by
  induction h generalizing w with
  | nil => rfl
  | cons e _ ih => simp only [gsum_cons]; exact Finset.sum_congr rfl fun j _ => ih _
  | swap x y l =>
    simp only [gsum_cons]
    rw [Finset.sum_comm]
    exact Finset.sum_congr rfl fun j _ => Finset.sum_congr rfl fun j' _ =>
      gsum_congr_perm hφ l (addE_comm _ _ _ _ _ _ _)
  | trans _ _ ih1 ih2 => exact (ih1 w).trans (ih2 w)

/-- Normalise an edge so that its first endpoint is the smaller one. -/
def normP (e : Fin N × Fin N) : Fin N × Fin N := if e.1 ≤ e.2 then e else (e.2, e.1)

omit [Fintype ι] in
lemma addE_normP (e : Fin N × Fin N) (j : ι) (w : Fin N → List ι) (v : Fin N) :
    (addE (normP e).1 (normP e).2 j w v).Perm (addE e.1 e.2 j w v) := by
  unfold normP
  split_ifs
  · exact List.Perm.refl _
  · classical
    rw [List.perm_iff_count]
    intro x
    unfold addE
    split_ifs <;> simp only [List.count_cons, List.count_append, List.count_nil] <;> omega

lemma gsum_map_normP {φ : (Fin N → List ι) → ℝ} (hφ : PermInv φ) (es : List (Fin N × Fin N))
    (w : Fin N → List ι) : gsum φ (es.map normP) w = gsum φ es w := by
  induction es generalizing w with
  | nil => rfl
  | cons e es ih =>
    simp only [List.map_cons, gsum_cons]
    refine Finset.sum_congr rfl fun j _ => ?_
    rw [ih]
    exact gsum_congr_perm hφ es (addE_normP e j w)

omit [Fintype ι] in
lemma addE_relabel (π : Fin N ≃ Fin N) (a b : Fin N) (j : ι) (w : Fin N → List ι) :
    (addE (π a) (π b) j w) ∘ π = addE a b j (w ∘ π) := by
  funext v
  simp only [Function.comp, addE, π.apply_eq_iff_eq]

lemma gsum_relabel {φ : (Fin N → List ι) → ℝ} (π : Fin N ≃ Fin N) (hφ : ∀ w, φ (w ∘ π) = φ w)
    (es : List (Fin N × Fin N)) (w : Fin N → List ι) :
    gsum φ (es.map fun e => (π e.1, π e.2)) w = gsum φ es (w ∘ π) := by
  induction es generalizing w with
  | nil => exact (hφ w).symm
  | cons e es ih =>
    simp only [List.map_cons, gsum_cons]
    refine Finset.sum_congr rfl fun j _ => ?_
    rw [ih, addE_relabel]

/-- The lexicographic order on edges used to sort edge lists. -/
def edgeLE (e e' : Fin N × Fin N) : Prop := e.1 < e'.1 ∨ (e.1 = e'.1 ∧ e.2 ≤ e'.2)

instance : DecidableRel (edgeLE (N := N)) := fun _ _ => by unfold edgeLE; infer_instance

/-- The canonical form of an edge list after a relabelling `π`. -/
def relabelSort (π : Fin N → Fin N) (es : List (Fin N × Fin N)) : List (Fin N × Fin N) :=
  List.insertionSort edgeLE ((es.map fun e => (π e.1, π e.2)).map normP)

/-- The isomorphism certificate: `π` is injective and maps `es` onto `es'` (as normalised
sorted edge lists). -/
def isoOK (π : Fin N → Fin N) (es es' : List (Fin N × Fin N)) : Prop :=
  (∀ a b, π a = π b → a = b) ∧ relabelSort π es = es'

instance (π : Fin N → Fin N) (es es' : List (Fin N × Fin N)) : Decidable (isoOK π es es') := by
  unfold isoOK; infer_instance

/-- **Isomorphism invariance** of the closed value of a partial graph. -/
theorem gsum_iso {φ : (Fin N → List ι) → ℝ} (hφ : PermInv φ)
    (hφπ : ∀ (π : Fin N ≃ Fin N) w, φ (w ∘ π) = φ w) {π : Fin N → Fin N}
    {es es' : List (Fin N × Fin N)} (h : isoOK π es es') :
    gsum φ es (fun _ => []) = gsum φ es' (fun _ => []) := by
  obtain ⟨hinj, hsort⟩ := h
  have hbij : Function.Bijective π := Finite.injective_iff_bijective.mp fun a b => hinj a b
  set σ : Fin N ≃ Fin N := Equiv.ofBijective π hbij
  rw [← hsort, relabelSort, gsum_perm hφ (List.perm_insertionSort _ _), gsum_map_normP hφ]
  have := gsum_relabel σ (hφπ σ) es (fun _ => [])
  exact this.symm

/-! ### The Gaussian value and the edge step -/

/-- The Gaussian summand `E[∏_v ∂_{w_v} F]`. -/
def phiE (E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ) (F : MvPolynomial ι ℝ) (w : Fin N → List ι) : ℝ :=
  E (∏ v, dw F (w v))

omit [Fintype ι] in
lemma phiE_permInv (E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ) (F : MvPolynomial ι ℝ) :
    PermInv (phiE (N := N) E F) := fun w w' h => by
  unfold phiE
  rw [Finset.prod_congr rfl fun v _ => dw_perm F (h v)]

omit [Fintype ι] in
lemma phiE_relabel (E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ) (F : MvPolynomial ι ℝ) (π : Fin N ≃ Fin N)
    (w : Fin N → List ι) : phiE E F (w ∘ π) = phiE E F w := by
  unfold phiE
  congr 1
  exact Equiv.prod_comp π (fun v => dw F (w v))

/-- The value of a partial graph. -/
def gval (E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ) (F : MvPolynomial ι ℝ) (es : List (Fin N × Fin N)) : ℝ :=
  gsum (phiE E F) es (fun _ => [])

lemma gval_empty (E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ) (F : MvPolynomial ι ℝ) :
    gval E F ([] : List (Fin N × Fin N)) = E (F ^ N) := by
  simp [gval, phiE]

lemma gval_iso (E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ) (F : MvPolynomial ι ℝ) {π : Fin N → Fin N}
    {es es' : List (Fin N × Fin N)} (h : isoOK π es es') : gval E F es = gval E F es' :=
  gsum_iso (phiE_permInv E F) (phiE_relabel E F) h

section step

variable [DecidableEq ι]

omit [Fintype ι] [DecidableEq ι] in
/-- The Leibniz rule for a finite product. -/
lemma pderiv_prod {α : Type*} [DecidableEq α] (j : ι) (P : α → MvPolynomial ι ℝ) (s : Finset α) :
    pderiv j (∏ v ∈ s, P v) = ∑ t ∈ s, ∏ v ∈ s, (if v = t then pderiv j (P v) else P v) := by
  induction s using Finset.induction_on with
  | empty => simp
  | insert a s ha ih =>
    have h1 : ∏ v ∈ insert a s, (if v = a then pderiv j (P v) else P v)
        = pderiv j (P a) * ∏ v ∈ s, P v := by
      rw [Finset.prod_insert ha, ite_eq_left rfl]
      congr 1
      exact Finset.prod_congr rfl fun v hv => ite_eq_right fun (h : v = a) => ha (h ▸ hv)
    have h2 : ∀ t ∈ s, ∏ v ∈ insert a s, (if v = t then pderiv j (P v) else P v)
        = P a * ∏ v ∈ s, (if v = t then pderiv j (P v) else P v) := fun t ht => by
      rw [Finset.prod_insert ha, ite_eq_right fun (h : a = t) => ha (h ▸ ht)]
    rw [Finset.prod_insert ha, pderiv_mul, ih, Finset.sum_insert ha, h1, Finset.sum_congr rfl h2,
      ← Finset.mul_sum]

variable {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} (hE : IsGaussianExpectation E) {F : MvPolynomial ι ℝ}
  (hF : Chaos3 F)
include hE hF

/-- The base case of the edge step. -/
lemma phiE_step (w : Fin N → List ι) (v₀ : Fin N) :
    (3 - ((w v₀).length : ℝ)) * phiE E F w
      = ∑ t ∈ Finset.univ.erase v₀, ∑ j, phiE E F (addE v₀ t j w) := by
  set k : ℝ := 3 - ((w v₀).length : ℝ)
  set P : MvPolynomial ι ℝ := dw F (w v₀)
  set X : MvPolynomial ι ℝ := ∏ v ∈ Finset.univ.erase v₀, dw F (w v)
  have hprod : ∏ v, dw F (w v) = P * X := (Finset.mul_prod_erase _ _ (Finset.mem_univ v₀)).symm
  have hP : ouL P = -(C k * P) := hF.ouL_dw (w v₀)
  -- `k E[XP] = E Γ(X, P)`
  have h1 : k * E (X * P) = E (gam X P) := by
    have h := gE_mul_ouL hE X P
    rw [hP, mul_neg, map_neg, mul_left_comm, C_mul_apply] at h
    linarith
  have h2 : gam X P = ∑ j, ∑ t ∈ Finset.univ.erase v₀,
      ∏ v, dw F (addE v₀ t j w v) := by
    unfold gam
    refine Finset.sum_congr rfl fun j _ => ?_
    rw [pderiv_prod, Finset.sum_mul]
    refine Finset.sum_congr rfl fun t ht => ?_
    have htv : t ≠ v₀ := Finset.ne_of_mem_erase ht
    rw [← Finset.mul_prod_erase _ _ (Finset.mem_univ v₀), mul_comm]
    congr 1
    · simp [addE, htv.symm, P]
    · refine Finset.prod_congr rfl fun v hv => ?_
      have hv0 : v ≠ v₀ := Finset.ne_of_mem_erase hv
      by_cases hvt : v = t
      · subst hvt; simp [addE, hv0]
      · simp [addE, hv0, hvt]
  unfold phiE
  rw [hprod, mul_comm P X, h1, h2, map_sum, Finset.sum_comm]
  refine Finset.sum_congr rfl fun t _ => ?_
  rw [map_sum]

/-- **The edge step**: `(3 − deg v₀) · val es = Σ_{t ≠ v₀} val (es ++ [(v₀, t)])`. -/
theorem gsum_step (es : List (Fin N × Fin N)) (w : Fin N → List ι) (v₀ : Fin N) :
    (3 - (((w v₀).length + degE es v₀ : ℕ) : ℝ)) * gsum (phiE E F) es w
      = ∑ t ∈ Finset.univ.erase v₀, gsum (phiE E F) (es ++ [(v₀, t)]) w := by
  induction es generalizing w with
  | nil =>
    simp only [degE_nil, add_zero, gsum_nil, List.nil_append, gsum_cons]
    rw [phiE_step hE hF w v₀]
  | cons e es ih =>
    simp only [gsum_cons, List.cons_append, Finset.mul_sum]
    rw [Finset.sum_comm]
    refine Finset.sum_congr rfl fun j _ => ?_
    rw [← ih]
    congr 3
    rw [length_addE, degE_cons]
    split_ifs <;> simp_all <;> omega

omit hE [DecidableEq ι] in
/-- A vertex of degree at least four kills the value. -/
theorem gsum_eq_zero_of_deg (es : List (Fin N × Fin N)) (w : Fin N → List ι) (v : Fin N)
    (hv : 4 ≤ (w v).length + degE es v) : gsum (phiE E F) es w = 0 := by
  induction es generalizing w with
  | nil =>
    simp only [degE_nil, add_zero] at hv
    simp only [gsum_nil, phiE]
    rw [Finset.prod_eq_zero (Finset.mem_univ v) (hF.dw_eq_zero hv), map_zero]
  | cons e es ih =>
    simp only [gsum_cons]
    refine Finset.sum_eq_zero fun j _ => ih _ ?_
    rw [length_addE]
    rw [degE_cons] at hv
    split_ifs at hv ⊢ <;> simp_all <;> omega

/-- The summand of a closed graph: the product of the constants `∂_{w_v} F`. -/
def phiC (F : MvPolynomial ι ℝ) (w : Fin N → List ι) : ℝ := ∏ v, cw F (w v)

omit hE hF [Fintype ι] [DecidableEq ι] in
lemma phiC_permInv (F : MvPolynomial ι ℝ) : PermInv (phiC (N := N) F) := fun w w' h => by
  unfold phiC
  rw [Finset.prod_congr rfl fun v _ => cw_perm F (h v)]

omit hE hF [Fintype ι] [DecidableEq ι] in
lemma phiC_relabel (F : MvPolynomial ι ℝ) (π : Fin N ≃ Fin N) (w : Fin N → List ι) :
    phiC F (w ∘ π) = phiC F w := Equiv.prod_comp π (fun v => cw F (w v))

omit [DecidableEq ι] in
/-- **Closed graphs**: if every vertex has degree three, the value is the multigraph sum. -/
theorem gval_full (es : List (Fin N × Fin N)) (h : ∀ v, degE es v = 3) :
    gval E F es = gsum (phiC F) es (fun _ => []) := by
  unfold gval
  refine gsum_congr es _ fun w' hw' => ?_
  have h3 : ∀ v, (w' v).length = 3 := fun v => by rw [hw' v, h v]; rfl
  unfold phiE phiC
  rw [Finset.prod_congr rfl fun v _ => hF.dw_three (h3 v), ← map_prod, gE_C hE]

end step

/-! ### Certified steps -/

/-- Number of a vertex's free slots. -/
def slack (es : List (Fin N × Fin N)) (v : Fin N) : ℕ := 3 - degE es v

/-- The certificate of one edge step at `v₀`: the listed successors `(t, π, es')` are exactly the
vertices `t ≠ v₀` of degree `< 3`, without repetition, and `es ++ [(v₀, t)]` is isomorphic to
`es'` through `π`. -/
def stepOK (es : List (Fin N × Fin N)) (v₀ : Fin N) (k : ℕ)
    (succ : List (Fin N × (Fin N → Fin N) × List (Fin N × Fin N))) : Prop :=
  degE es v₀ + k = 3 ∧ (succ.map Prod.fst).Nodup ∧
    (∀ t, (t ≠ v₀ ∧ degE es t < 3) ↔ t ∈ succ.map Prod.fst) ∧
    ∀ x ∈ succ, isoOK x.2.1 (es ++ [(v₀, x.1)]) x.2.2

instance (es : List (Fin N × Fin N)) (v₀ : Fin N) (k : ℕ)
    (succ : List (Fin N × (Fin N → Fin N) × List (Fin N × Fin N))) :
    Decidable (stepOK es v₀ k succ) := by
  unfold stepOK; infer_instance

lemma degE_append_single (es : List (Fin N × Fin N)) (a b v : Fin N) :
    degE (es ++ [(a, b)]) v = degE es v + (if a = v then 1 else 0) + (if b = v then 1 else 0) := by
  simp only [degE, List.countP_append, List.countP_cons, List.countP_nil, decide_eq_true_eq]
  split_ifs <;> omega

section cert

variable [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} (hE : IsGaussianExpectation E)
  {F : MvPolynomial ι ℝ} (hF : Chaos3 F)
include hE hF

/-- **A certified edge step**: `k · val es = Σ val es'` over the certified successors. -/
theorem gval_step_cert {es : List (Fin N × Fin N)} {v₀ : Fin N} {k : ℕ}
    {succ : List (Fin N × (Fin N → Fin N) × List (Fin N × Fin N))} (h : stepOK es v₀ k succ) :
    (k : ℝ) * gval E F es = (succ.map fun x => gval E F x.2.2).sum := by
  obtain ⟨hk, hnd, hset, hiso⟩ := h
  have hstep := gsum_step hE hF es (fun _ => []) v₀
  simp only [List.length_nil, zero_add] at hstep
  have hk' : (3 : ℝ) - ((degE es v₀ : ℕ) : ℝ) = k := by
    have : ((degE es v₀ : ℕ) : ℝ) + k = 3 := by exact_mod_cast hk
    linarith
  rw [hk'] at hstep
  unfold gval
  rw [hstep]
  -- drop the saturated targets
  have hfilter : ∑ t ∈ Finset.univ.erase v₀, gsum (phiE E F) (es ++ [(v₀, t)]) (fun _ => [])
      = ∑ t ∈ (succ.map Prod.fst).toFinset, gsum (phiE E F) (es ++ [(v₀, t)]) (fun _ => []) := by
    symm
    apply Finset.sum_subset
    · intro t ht
      rw [List.mem_toFinset, ← hset] at ht
      exact Finset.mem_erase.mpr ⟨ht.1, Finset.mem_univ _⟩
    · intro t ht hn
      rw [List.mem_toFinset, ← hset] at hn
      have htv : t ≠ v₀ := Finset.ne_of_mem_erase ht
      have hdeg : 3 ≤ degE es t := by
        by_contra hc; exact hn ⟨htv, by omega⟩
      refine gsum_eq_zero_of_deg hF _ _ t ?_
      rw [degE_append_single, ite_eq_right (Ne.symm htv), ite_eq_left rfl]
      simp only [List.length_nil, zero_add]
      omega
  rw [hfilter, List.sum_toFinset _ hnd, List.map_map]
  congr 1
  refine List.map_congr_left fun x hx => ?_
  exact gsum_iso (phiE_permInv E F) (phiE_relabel E F) (hiso x hx)

end cert

end

end Grothe.LowerAnalytic
