import Grothe.UpperQuad.TwistFunctional
import Grothe.UpperQuad.PairsSound
import Grothe.UpperQuad.NodeSound
import GrotheQuadKernel.Dilate

/-!
# Soundness of the dilation table and of the dilated functional

* `dilTable_sound`: every entry `dil[e][f][m]` of `dilTable P lam D` encloses `λ⁻¹ T[e,f; g,h]`,
  `(g, h) = pairOfMin e f m`, with `T = dilT λ^{−1/2}` (the levels `dilLevel0`, `dilLevelNext` by
  induction, given the kernel's positivity flags on `λ`, `√λ` and `√n`);
* `fullTriangleI_sound`: the full signed triangle encloses `σ^{g+h} Re U_{g,h}(A')` (canonical pairs
  from the canonical array, the others by `canonicalCoefficient_reflection`);
* `unnormaliseDil_dilate_sound`: the kernel's input vector `K'` represents `Kfun j s` on the degree
  `D` (`Represents`, scale `2^KTw`), by `re_Kfun_H`.

Fixed-point membership at an arbitrary scale is `memSc K` (`memTw = memSc KTw`).

Agent-ID: claude-b9ee. Refs #41, #313.
-/

namespace Grothe.UpperQuad

open GrotheQuad Grothe.UpperChaos Grothe.UpperChaos.F0ConditionalEvaluator MvPolynomial

noncomputable section

/-! ### Fixed-point membership at an arbitrary scale -/

/-- `x ∈ [lo, hi] / 2^K`. -/
def memSc (K : ℕ) (x : ℝ) (p : ℤ × ℤ) : Prop :=
  (p.1 : ℝ) ≤ x * (2 : ℝ) ^ K ∧ x * (2 : ℝ) ^ K ≤ p.2

lemma memSc_KTw {x : ℝ} {p : ℤ × ℤ} : memSc KTw x p ↔ memTw x p := Iff.rfl

lemma memSc_toFixed (K : ℕ) {x : ℝ} {a : Ival} (hx : mem x a) :
    memSc K x (toFixedLo K a, toFixedHi K a) :=
  ⟨toFixedLo_le K hx, le_toFixedHi K hx⟩

lemma memSc_zero (K : ℕ) : memSc K 0 ((0 : ℤ), (0 : ℤ)) := by simp [memSc]

lemma memSc_addPair {K : ℕ} {x y : ℝ} {p q : ℤ × ℤ} (hx : memSc K x p) (hy : memSc K y q) :
    memSc K (x + y) (addPair p q) := by
  unfold memSc addPair at *
  push_cast
  constructor <;> nlinarith [hx.1, hx.2, hy.1, hy.2]

lemma memSc_mulPair {K : ℕ} {x y : ℝ} {p q : ℤ × ℤ} (hx : memSc K x p) (hy : memSc K y q) :
    memSc (2 * K) (x * y) (mulPair p q) := by
  have hsc : x * y * (2 : ℝ) ^ (2 * K) = (x * (2 : ℝ) ^ K) * (y * (2 : ℝ) ^ K) := by
    rw [two_mul, pow_add]; ring
  unfold memSc mulPair
  rw [hsc]
  exact mulFx_bounds (a := ⟨p.1, p.2⟩) (b := ⟨q.1, q.2⟩) hx.1 hx.2 hy.1 hy.2

/-- Outward rounding by `s` bits. -/
lemma memSc_shift {K s : ℕ} {x : ℝ} {p : ℤ × ℤ} (hx : memSc (K + s) x p) :
    memSc K x (shDown s p.1, shUp s p.2) := by
  unfold memSc at hx ⊢
  have hK : x * (2 : ℝ) ^ (K + s) = (x * 2 ^ K) * 2 ^ s := by rw [pow_add]; ring
  have hpos : (0 : ℝ) < 2 ^ s := by positivity
  constructor
  · have h1 : ((shDown s p.1 : ℤ) : ℝ) * 2 ^ s ≤ (x * 2 ^ K) * 2 ^ s :=
      (shDown_mul_le s p.1).trans (hK ▸ hx.1)
    exact le_of_mul_le_mul_right h1 hpos
  · have h2 : (x * 2 ^ K) * 2 ^ s ≤ ((shUp s p.2 : ℤ) : ℝ) * 2 ^ s :=
      (hK ▸ hx.2).trans (le_shUp_mul s p.2)
    exact le_of_mul_le_mul_right h2 hpos

lemma memSc_sumPairs {K : ℕ} {f : ℕ → ℝ} {g : ℕ → ℤ × ℤ} (n : ℕ)
    (h : ∀ k, k < n → memSc K (f k) (g k)) :
    memSc K (∑ k ∈ Finset.range n, f k) (sumPairs n g) := by
  unfold sumPairs
  induction n with
  | zero => simpa using memSc_zero K
  | succ n ih =>
    rw [List.range_succ, List.foldl_append, List.foldl_cons, List.foldl_nil, Finset.sum_range_succ]
    exact memSc_addPair (ih fun k hk => h k (by omega)) (h n (by omega))

lemma eq_zero_of_mem_zeroI {x : ℝ} (h : mem x zeroI) : x = 0 := (mem_zeroI_iff x).mp h

/-! ### The dilation table -/

/-- The rows of the level `e` enclose `T[e,f; pairOfMin e f m]` for `f ≤ F`, `m ≤ min(e, f)`. -/
def DilRowsOK (μ : ℝ) (e F : ℕ) (rows : Array DilRow) : Prop :=
  ∀ f, f ≤ F → ∀ m, m ≤ min e f →
    mem (dilT μ e f (pairOfMin e f m).1 (pairOfMin e f m).2) ((rows.getD f #[]).getD m zeroI)

lemma pairOfMin_of_charge {e f g h : ℕ} (hge : g ≤ e) (_hhf : h ≤ f) (hc : g + f = h + e) :
    pairOfMin e f (min g h) = (g, h) ∧ min g h ≤ min e f := by
  unfold pairOfMin
  split_ifs with hef
  · refine ⟨?_, by omega⟩
    have : min g h = h := by omega
    rw [this, Prod.mk.injEq]
    omega
  · refine ⟨?_, by omega⟩
    have : min g h = g := by omega
    rw [this, Prod.mk.injEq]
    omega

lemma mem_tget {μ : ℝ} {e F : ℕ} {rows : Array DilRow} (hr : DilRowsOK μ e F rows) {f : ℕ}
    (hf : f ≤ F) (g h : ℕ) : mem (dilT μ e f g h) (tget e rows f g h) := by
  unfold tget
  by_cases hs : g ≤ e ∧ h ≤ f ∧ g + f = h + e
  · have hb : (g ≤ e && h ≤ f && g + f == h + e) = true := by simp [hs.1, hs.2.1, hs.2.2]
    simp only [hb, ↓reduceIte]
    obtain ⟨hp, hm⟩ := pairOfMin_of_charge hs.1 hs.2.1 hs.2.2
    have := hr f hf (min g h) hm
    rwa [hp] at this
  · have hb : (g ≤ e && h ≤ f && g + f == h + e) = false := by
      by_contra hb'
      simp only [Bool.not_eq_false, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at hb'
      exact hs ⟨hb'.1.1, hb'.1.2, hb'.2⟩
    simp only [hb, Bool.false_eq_true, ↓reduceIte]
    rw [dilT_eq_zero μ e f g h hs]
    exact mem_zeroI

/-- The square-root table: `sq[n] ∋ √n` for `n ≤ M`, with positive lower ends for `1 ≤ n ≤ M`. -/
def SqOK (sq : Array Ival) (M : ℕ) : Prop :=
  (∀ n, n ≤ M → mem (Real.sqrt (n : ℕ)) (sq.getD n zeroI)) ∧
    ∀ n, 1 ≤ n → n ≤ M → 0 < (sq.getD n zeroI).lo

lemma sqOK_sqrtTable (P M : ℕ) (hpos : ∀ n, n < M → isPos (sqrtNatI P (n + 1)) = true) :
    SqOK (sqrtTable P M) M := by
  refine ⟨fun n hn => ?_, fun n h1 hn => ?_⟩
  · rw [sqrtTable_getD P M n hn]; exact mem_sqrtNatI P n
  · rw [sqrtTable_getD P M n hn]
    have := hpos (n - 1) (by omega)
    rw [Nat.sub_add_cancel h1] at this
    exact lo_pos_of_isPos this

lemma getD_push_lt {α : Type*} (a : Array α) (x d : α) {i : ℕ} (hi : i < a.size) :
    (a.push x).getD i d = a.getD i d := by
  rw [Array.getD_eq_getD_getElem?, Array.getD_eq_getD_getElem?,
    Array.getElem?_eq_getElem (by simp; omega), Array.getElem?_eq_getElem hi, Option.getD_some,
    Option.getD_some, Array.getElem_push_lt]

lemma getD_push_size {α : Type*} (a : Array α) (x d : α) : (a.push x).getD a.size d = x := by
  simp [Array.getD_eq_getD_getElem?]

lemma getD_push_eq {α : Type*} (a : Array α) (x d : α) {i : ℕ} (hi : i = a.size) :
    (a.push x).getD i d = x := by
  rw [hi]; exact getD_push_size a x d

lemma getD_singleton {α : Type*} (x d : α) : (#[x] : Array α).getD 0 d = x := rfl

lemma getD_ofFn {α : Type*} {n : ℕ} (f : Fin n → α) {i : ℕ} (hi : i < n) (d : α) :
    (Array.ofFn f).getD i d = f ⟨i, hi⟩ := by
  simp [Array.getD_eq_getD_getElem?, hi]

lemma dilLevel0_spec (P : ℕ) {μ : ℝ} {mu : Ival} (hmu : mem μ mu) {sq : Array Ival} {D : ℕ}
    (hsq : SqOK sq (D + 1)) :
    ∀ n, n ≤ D →
      let rows := (List.range n).foldl (fun rows f =>
        rows.push #[divI P (mulI P mu (addI P (mulI P (sq.getD (f + 1) zeroI) (tget 0 rows f 0 f))
          (mulI P (sq.getD 1 zeroI) (tget 0 rows f 1 (f + 1))))) (sq.getD (f + 1) zeroI)])
        #[#[ofInt P 1]]
      rows.size = n + 1 ∧ DilRowsOK μ 0 n rows := by
  intro n
  induction n with
  | zero =>
    intro _
    refine ⟨rfl, fun f hf m hm => ?_⟩
    have hf0 : f = 0 := by omega
    have hm0 : m = 0 := by omega
    subst hf0; subst hm0
    simp only [pairOfMin, ge_iff_le, le_refl, ↓reduceIte, Nat.sub_self, add_zero, dilT_zero_zero,
      and_self]
    simpa using mem_one P
  | succ n ih =>
    intro hn
    obtain ⟨hsize, hok⟩ := ih (by omega)
    rw [List.range_succ, List.foldl_append, List.foldl_cons, List.foldl_nil]
    generalize ((List.range n).foldl _ #[#[ofInt P 1]]) = rows at hsize hok ⊢
    refine ⟨by simp [hsize], fun f hf m hm => ?_⟩
    have hm0 : m = 0 := by omega
    subst hm0
    rcases Nat.lt_or_ge f (n + 1) with hlt | hge
    · rw [getD_push_lt rows _ _ (by omega)]
      exact hok f (by omega) 0 (by omega)
    · have hfe : f = n + 1 := by omega
      subst hfe
      rw [getD_push_eq rows _ _ hsize.symm, getD_singleton]
      have hp : pairOfMin 0 (n + 1) 0 = (0, n + 1) := by simp [pairOfMin]
      rw [hp]
      dsimp only
      rw [dilT_zero_succ]
      have hsqn := hsq.1 (n + 1) (by omega)
      have hsq1 := hsq.1 1 (by omega)
      have hpos := hsq.2 (n + 1) (by omega) (by omega)
      have ht1 := mem_tget hok (le_refl n) 0 n
      have ht2 := mem_tget hok (le_refl n) 1 (n + 1)
      have := mem_divI P (mem_mulI P hmu (mem_addI P (mem_mulI P hsqn ht1) (mem_mulI P hsq1 ht2)))
        (hsqn) hpos
      simpa [Nat.add_sub_cancel] using this

lemma dilLevel0_sound (P : ℕ) {μ : ℝ} {mu : Ival} (hmu : mem μ mu) {sq : Array Ival} {D : ℕ}
    (hsq : SqOK sq (D + 1)) : DilRowsOK μ 0 D (dilLevel0 P mu sq D) :=
  (dilLevel0_spec P hmu hsq D le_rfl).2

lemma dilLevelNext_sound (P : ℕ) {μ : ℝ} {mu : Ival} (hmu : mem μ mu) {sq : Array Ival} {D e : ℕ}
    (hsq : SqOK sq (D + 1)) (he : e < D) {prev : Array DilRow} (hprev : DilRowsOK μ e (D - e) prev) :
    DilRowsOK μ (e + 1) (D - (e + 1)) (dilLevelNext P mu sq D e prev) := by
  intro f hf m hm
  unfold dilLevelNext
  have hf' : f < D - e := by omega
  have hm' : m < min (e + 1) f + 1 := by omega
  rw [getD_ofFn _ hf', getD_ofFn _ hm']
  dsimp only
  set gh := pairOfMin (e + 1) f m with hgh
  rw [dilT_succ]
  have hg : gh.1 ≤ D + 1 := by
    simp only [hgh, pairOfMin]; split_ifs <;> simp <;> omega
  have hh : gh.2 + 1 ≤ D + 1 := by
    simp only [hgh, pairOfMin]; split_ifs <;> simp <;> omega
  have t1 := mem_tget hprev (f := f) (by omega) (gh.1 - 1) gh.2
  have t2 := mem_tget hprev (f := f) (by omega) gh.1 (gh.2 + 1)
  have t3 := mem_tget hprev (f := f - 1) (by omega) gh.1 gh.2
  exact mem_divI P (mem_subI P (mem_mulI P hmu (mem_addI P (mem_mulI P (hsq.1 _ hg) t1)
      (mem_mulI P (hsq.1 _ hh) t2))) (mem_mulI P (hsq.1 f (by omega)) t3))
    (hsq.1 (e + 1) (by omega)) (hsq.2 (e + 1) (by omega) (by omega))

/-- The table enclosure: `dil[e][f][m] ∋ λ⁻¹ T[e,f; pairOfMin e f m]` for `e + f ≤ D`. -/
def DilTableOK (μ c : ℝ) (D : ℕ) (dil : Array (Array (Array Ival))) : Prop :=
  ∀ e f m, e + f ≤ D → m ≤ min e f →
    mem (c * dilT μ e f (pairOfMin e f m).1 (pairOfMin e f m).2)
      (((dil.getD e #[]).getD f #[]).getD m zeroI)

lemma mem_conv_getD (P : ℕ) {c x : ℝ} {cI : Ival} (hc : mem c cI) (rows : Array DilRow) (f m : ℕ)
    (hx : mem x ((rows.getD f #[]).getD m zeroI)) :
    mem (c * x) (((rows.map fun row => row.map fun t => mulI P cI t).getD f #[]).getD m zeroI) := by
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_map] at hx ⊢
  rcases hrow : rows[f]? with _ | row
  · rw [hrow] at hx
    simp only [Option.getD_none, Array.getElem?_empty, Option.map_none] at hx ⊢
    rw [eq_zero_of_mem_zeroI hx, mul_zero]; exact mem_zeroI
  · rw [hrow] at hx
    simp only [Option.map_some, Option.getD_some, Array.getElem?_map] at hx ⊢
    rcases hent : row[m]? with _ | t
    · rw [hent] at hx
      simp only [Option.getD_none, Option.map_none] at hx ⊢
      rw [eq_zero_of_mem_zeroI hx, mul_zero]; exact mem_zeroI
    · rw [hent] at hx
      simp only [Option.map_some, Option.getD_some] at hx ⊢
      exact mem_mulI P hc hx

/-- The levels of the dilation table as a recursion. -/
def levels {α : Type*} (step : α → ℕ → α) (l0 : α) : ℕ → α
  | 0 => l0
  | e + 1 => step (levels step l0 e) e

lemma foldl_levels {α β : Type*} (step : α → ℕ → α) (conv : α → β) (l0 : α) (n : ℕ) :
    (((List.range n).foldl (fun st e => (step st.1 e, st.2.push (conv (step st.1 e))))
        (l0, #[conv l0])).2.size = n + 1) ∧
      ∀ e, e ≤ n → ∀ d, ((List.range n).foldl (fun st e => (step st.1 e, st.2.push (conv (step st.1 e))))
        (l0, #[conv l0])).2.getD e d = conv (levels step l0 e) := by
  have key : ∀ n, ((List.range n).foldl (fun st e => (step st.1 e, st.2.push (conv (step st.1 e))))
      (l0, #[conv l0])).1 = levels step l0 n ∧
      ((List.range n).foldl (fun st e => (step st.1 e, st.2.push (conv (step st.1 e))))
        (l0, #[conv l0])).2.size = n + 1 ∧
      ∀ e, e ≤ n → ∀ d, ((List.range n).foldl (fun st e => (step st.1 e, st.2.push (conv (step st.1 e))))
        (l0, #[conv l0])).2.getD e d = conv (levels step l0 e) := by
    intro n
    induction n with
    | zero =>
      refine ⟨rfl, rfl, fun e he d => ?_⟩
      have : e = 0 := by omega
      subst this; rfl
    | succ n ih =>
      obtain ⟨h1, h2, h3⟩ := ih
      rw [List.range_succ, List.foldl_append, List.foldl_cons, List.foldl_nil]
      generalize ((List.range n).foldl _ _) = st at h1 h2 h3 ⊢
      refine ⟨by simp [h1, levels], by simp [h2], fun e he d => ?_⟩
      rcases Nat.lt_or_ge e (n + 1) with hlt | hge
      · rw [getD_push_lt _ _ _ (by omega)]; exact h3 e (by omega) d
      · have : e = n + 1 := by omega
        subst this
        rw [getD_push_eq _ _ _ h2.symm, h1]
        rfl
  exact ⟨(key n).2.1, (key n).2.2⟩

theorem dilTable_sound (P : ℕ) {lam : ℝ} {lamI : Ival} (hlam : mem lam lamI)
    (hlam0 : 0 < lam) (hpos1 : 0 < lamI.lo) (hpos2 : 0 < (sqrtI P lamI).lo) (D : ℕ)
    (hsqpos : ∀ n, n < D + 2 → isPos (sqrtNatI P (n + 1)) = true) :
    DilTableOK (Real.sqrt lam)⁻¹ lam⁻¹ D (dilTable P lamI D) := by
  have hmu : mem (Real.sqrt lam)⁻¹ (invI P (sqrtI P lamI)) := by
    have := mem_invI P (mem_sqrtI P hlam0.le hlam) hpos2
    simpa [one_div] using this
  have hinv : mem lam⁻¹ (invI P lamI) := by
    have := mem_invI P hlam hpos1
    simpa [one_div] using this
  have hsq : SqOK (sqrtTable P (D + 2)) (D + 1) := by
    have h := sqOK_sqrtTable P (D + 2) hsqpos
    exact ⟨fun n hn => h.1 n (by omega), fun n h1 hn => h.2 n h1 (by omega)⟩
  -- the levels as a recursion
  let mu := invI P (sqrtI P lamI)
  let sq := sqrtTable P (D + 2)
  let conv : Array DilRow → Array (Array Ival) := fun rows =>
    rows.map fun row => row.map fun t => mulI P (invI P lamI) t
  have hfold := foldl_levels (fun rows e => dilLevelNext P mu sq D e rows) conv
    (dilLevel0 P mu sq D) D
  have hlev : ∀ e, e ≤ D →
      DilRowsOK (Real.sqrt lam)⁻¹ e (D - e)
        (levels (fun rows e => dilLevelNext P mu sq D e rows) (dilLevel0 P mu sq D) e) := by
    intro e
    induction e with
    | zero => intro _; exact dilLevel0_sound P hmu hsq (D := D)
    | succ e ih =>
      intro he
      exact dilLevelNext_sound P hmu hsq (by omega) (ih (by omega))
  intro e f m hef hm
  have hdil : dilTable P lamI D = ((List.range D).foldl (fun st e =>
      ((fun rows e => dilLevelNext P mu sq D e rows) st.1 e,
        st.2.push (conv ((fun rows e => dilLevelNext P mu sq D e rows) st.1 e))))
      (dilLevel0 P mu sq D, #[conv (dilLevel0 P mu sq D)])).2 := rfl
  rw [hdil, hfold.2 e (by omega) #[]]
  exact mem_conv_getD P hinv _ f m (hlev e (by omega) f (by omega) m hm)

/-! ### The full signed triangle -/

/-- The scaled signed canonical value `κ σ^{g+h} Re U_{g,h}(A)` (`σ = ±1` from `neg`). -/
def signedU (κ : ℝ) (neg : Bool) (A : ℝ) (g h : ℕ) : ℝ :=
  κ * (signOf neg ^ (g + h) * (canonicalCoefficient A (g, h)).re)

lemma mem_reflectI (P : ℕ) (hP : 1 ≤ P) (g h : ℕ) (hg : 0 < g) :
    mem (Real.sqrt (((h + 1 : ℕ) : ℝ) / (g : ℕ))) (reflectI P g h) := by
  unfold reflectI
  have := mem_ratI P hP ((h + 1 : ℕ) : ℤ) hg
  exact mem_sqrtI P (by positivity) (by simpa using this)

theorem fullTriangleI_sound (P : ℕ) (hP : 1 ≤ P) {κ A : ℝ} {neg : Bool} {vals : Array Ival}
    (D : ℕ)
    (hvals : ∀ i, i < (canonicalPairs D D).size →
      mem (κ * signOf neg ^ (((canonicalPairs D D).getD i (0, 0)).1 +
          ((canonicalPairs D D).getD i (0, 0)).2) *
        (canonicalCoefficient A ((canonicalPairs D D).getD i (0, 0))).re) (vals.getD i zeroI))
    (g h : ℕ) (hgh : g + h ≤ D) :
    mem (signedU κ neg A g h) (ivGet (fullTriangleI P vals D) g h) := by
  unfold fullTriangleI ivGet ivOfFn
  have hg' : g < D + 1 := by omega
  have hh' : h < D + 1 - g := by omega
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, hg', hh', ↓reduceDIte,
    Option.getD_some]
  rw [← Array.getD_eq_getD_getElem?, ← Array.getD_eq_getD_getElem?]
  split_ifs with hc
  · have hr := canonicalPairs_getD_rank D D g h hc (by omega) hgh
    have hi := canonicalRank_lt D D g h hc (by omega) hgh
    have := hvals _ hi
    rw [hr] at this
    unfold signedU
    rw [← mul_assoc]
    exact this
  · have hc' : h + 1 ≤ (g - 1) + 1 := by omega
    have hr := canonicalPairs_getD_rank D D (h + 1) (g - 1) hc' (by omega) (by omega)
    have hi := canonicalRank_lt D D (h + 1) (g - 1) hc' (by omega) (by omega)
    have hv := hvals _ hi
    rw [hr] at hv
    have hrefl := mem_reflectI P hP g h (by omega)
    have hm := mem_mulI P hv hrefl
    unfold signedU
    have hg1 : g - 1 + 1 = g := by omega
    have hcan := canonicalCoefficient_reflection A h (g - 1)
    rw [hg1] at hcan
    rw [hcan, Complex.re_ofReal_mul]
    have hpar : h + 1 + (g - 1) = g + h := by omega
    dsimp only at hm
    rw [hpar] at hm
    convert hm using 1
    ring

/-! ### The dilated, unnormalised functional -/

lemma twGet_map_map (v : IvVec) (F : Ival → ℤ × ℤ) (c d : ℕ) (hc : c < v.size)
    (hd : d < (v.getD c #[]).size) :
    twGet (v.map fun row => row.map F) c d = F (ivGet v c d) := by
  unfold twGet ivGet
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_map, Array.getElem?_eq_getElem hc,
    Option.map_some, Option.getD_some]
  rw [Array.getD_eq_getD_getElem?, Array.getElem?_eq_getElem hc, Option.getD_some] at hd
  simp [Array.getElem?_eq_getElem hd]

lemma ivOfFn_size (D : ℕ) (f : ℕ → ℕ → Ival) (c : ℕ) (hc : c ≤ D) :
    c < (ivOfFn D f).size ∧ ∀ d, c + d ≤ D → d < ((ivOfFn D f).getD c #[]).size := by
  unfold ivOfFn
  refine ⟨by simp; omega, fun d hd => ?_⟩
  have hc' : c < D + 1 := by omega
  simp [Array.getD_eq_getD_getElem?, hc']
  omega

/-- The full signed triangle at the scale `2^KDil`. -/
lemma fullTriangleDil_sound (P : ℕ) (hP : 1 ≤ P) {κ A : ℝ} {neg : Bool} {vals : Array Ival}
    (D : ℕ)
    (hvals : ∀ i, i < (canonicalPairs D D).size →
      mem (κ * signOf neg ^ (((canonicalPairs D D).getD i (0, 0)).1 +
          ((canonicalPairs D D).getD i (0, 0)).2) *
        (canonicalCoefficient A ((canonicalPairs D D).getD i (0, 0))).re) (vals.getD i zeroI))
    (g h : ℕ) (hgh : g + h ≤ D) :
    memSc KDil (signedU κ neg A g h) (twGet (fullTriangleDil P vals D) g h) := by
  unfold fullTriangleDil
  obtain ⟨h1, h2⟩ := ivOfFn_size D (fun g h => if g ≤ h + 1 then vals.getD (canonicalRank D g h) zeroI
    else mulI P (vals.getD (canonicalRank D (h + 1) (g - 1)) zeroI) (reflectI P g h)) g (by omega)
  have hsz : g < (fullTriangleI P vals D).size := h1
  have hsz2 : h < ((fullTriangleI P vals D).getD g #[]).size := h2 h hgh
  rw [twGet_map_map _ toDil g h hsz hsz2]
  exact memSc_toFixed KDil (fullTriangleI_sound P hP D hvals g h hgh)

/-- The dilated functional `K_{e,f} = Σ_m dil[e][f][m] · I_{pairOfMin e f m}` encloses
`Σ_m λ⁻¹ T · σ^{g+h} Re U_{g,h}` at the scale `2^KDil`. -/
lemma dilateDil_sound {μ c κ A : ℝ} {neg : Bool} {D : ℕ} {dil : Array (Array (Array (ℤ × ℤ)))}
    (hdil : ∀ e f m, e + f ≤ D → m ≤ min e f →
      memSc KDil (c * dilT μ e f (pairOfMin e f m).1 (pairOfMin e f m).2)
        (((dil.getD e #[]).getD f #[]).getD m (0, 0)))
    {I : TwVec} (hI : ∀ g h, g + h ≤ D → memSc KDil (signedU κ neg A g h) (twGet I g h))
    (e f : ℕ) (hef : e + f ≤ D) :
    memSc KDil (∑ m ∈ Finset.range (min e f + 1),
        (c * dilT μ e f (pairOfMin e f m).1 (pairOfMin e f m).2) *
          signedU κ neg A (pairOfMin e f m).1 (pairOfMin e f m).2)
      (twGet (dilateDil dil D I) e f) := by
  unfold dilateDil
  rw [twGet_twOfFn _ _ e f hef]
  apply memSc_shift (K := KDil) (s := KDil)
  rw [show KDil + KDil = 2 * KDil by ring]
  apply memSc_sumPairs
  intro m hm
  have hgh : (pairOfMin e f m).1 + (pairOfMin e f m).2 ≤ D := by
    unfold pairOfMin; split_ifs <;> simp <;> omega
  exact memSc_mulPair (hdil e f m hef (by omega)) (hI _ _ hgh)

/-- The table of `√(c! d!)` at the scale `2^KDil`. -/
lemma sqrtFactDil_sound (P D : ℕ) (hD : D ≤ 502) (c d : ℕ) (hcd : c + d ≤ D) :
    memSc KDil (nrm c d)⁻¹ (((sqrtFactDil P D).getD c #[]).getD d (0, 0)) := by
  unfold sqrtFactDil
  have hc : c < D + 1 := by omega
  have hd : d < D + 1 - c := by omega
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, hc, hd, ↓reduceDIte,
    Option.getD_some]
  apply memSc_toFixed
  unfold nrm
  rw [inv_inv, factT_eq c (by omega), factT_eq d (by omega)]
  have := mem_sqrtI P (by positivity) (mem_ofNat P (c.factorial * d.factorial))
  simpa using this

/-- **The kernel's input vector represents the node functional**: for the canonical array `vals`
at the rescaled shift `A' = A√λ` (signs `σ` by `neg`), the vector `K'` of `twistJ` represents
`Kfun j s` on the degree `D`. -/
theorem unnormalise_represents (P : ℕ) (hP : 1 ≤ P) (j : ℕ) {s : ℝ} (hs : 0 ≤ s)
    (hv : vprof s ≠ 0) {neg : Bool} (hsign : profileSign s = signOf neg) {vals : Array Ival}
    (D : ℕ) (hD : D ≤ 502) (κ : ℝ)
    (hvals : ∀ i, i < (canonicalPairs D D).size →
      mem (κ * signOf neg ^ (((canonicalPairs D D).getD i (0, 0)).1 +
          ((canonicalPairs D D).getD i (0, 0)).2) *
        (canonicalCoefficient (twistShift j s) ((canonicalPairs D D).getD i (0, 0))).re)
        (vals.getD i zeroI))
    {dil : Array (Array (Array (ℤ × ℤ)))}
    (hdil : ∀ e f m, e + f ≤ D → m ≤ min e f →
      memSc KDil ((lamR j)⁻¹ * dilT (twistMu j) e f (pairOfMin e f m).1 (pairOfMin e f m).2)
        (((dil.getD e #[]).getD f #[]).getD m (0, 0))) :
    Represents ((κ : ℂ) • Kfun j s) D
      (unnormaliseDil (sqrtFactDil P D) D (dilateDil dil D (fullTriangleDil P vals D))) := by
  intro e f hef
  unfold unnormaliseDil
  rw [twGet_twOfFn _ _ e f hef]
  have hsm : (((κ : ℂ) • Kfun j s) (H e f)).re = κ * (Kfun j s (H e f)).re := by
    rw [AddMonoidHom.smul_apply, smul_eq_mul, Complex.re_ofReal_mul]
  rw [hsm, re_Kfun_H j hs hv e f]
  have hK := dilateDil_sound hdil (fun g h hgh => fullTriangleDil_sound P hP D hvals g h hgh) e f hef
  have hprod := memSc_mulPair (sqrtFactDil_sound P D hD e f hef) hK
  have hshift := memSc_shift (K := KTw) (s := 2 * KDil - KTw) (by
    rw [show KTw + (2 * KDil - KTw) = 2 * KDil by unfold KTw KDil; norm_num]
    exact hprod)
  rw [memSc_KTw] at hshift
  convert hshift using 1
  · simp only [signedU, hsign, Finset.mul_sum, Prod.mk.eta]
    apply Finset.sum_congr rfl
    intro m _
    ring
  · rfl

end

end Grothe.UpperQuad
