import Grothe.UpperQuad.TwistDilateSound
import Grothe.UpperQuad.SeedAnalytic
import Grothe.UpperQuad.ProfileSound
import GrotheQuadExtKernel.TwistNode

/-!
# Soundness of one twisted node

`twistJ_sound`: at a node `s > 0` with `vprof s ≠ 0`, every entry `(c, d)`, `c + d ≤ D_out`, of the
kernel's `twistJ` encloses `Re J^{(j)}_{c,d}(s)` (`twistCoef`, real by `twistCoef_im`).  The chain:
the canonical triangle at the rescaled shift `A' = A√λ` (`mem_canonicalTriangleI`, with S2 at `A'²`
from `mem_seedJ0I_moment`), the full signed triangle and the dilation (`unnormalise_represents`),
the operator `(Q_rᵀ)^j` (`applyQPow_sound`, the scalars by `mem_nodeCoefs`), the normalisation by
`√(c! d!)`, `e^{−jεs}` and the sign `(−1)^j` (`twistCoef_eq_K`).

`twistNode_sound`: the node's `I`-contribution and low-band contributions enclose
`W e^{−s} Σ_{c+d ≤ D_out} V_{c,d}(s) J_{c,d}(s)` and `W e^{−s} ψ_i(s) J_{c,d}(s)`.

The table-level flags the kernel does not check per node are `TwistTablesOK` (`twistTablesValid`, a
`Bool` for the facts: the positivity of `λ`, `√λ`, `√n` and `√(c! d!)`).

Agent-ID: claude-b9ee. Refs #41, #313.
-/

namespace Grothe.UpperQuad

open GrotheQuad Grothe.UpperChaos Grothe.Upper Grothe.UpperChaos.F0ConditionalEvaluator MvPolynomial
open Grothe.UpperChaos.ConditionalSeedNormalization

noncomputable section

/-! ### Parameters and tables -/

lemma twistParams_j (j : ℕ) (hj : j = 1 ∨ j = 2 ∨ j = 3) : (twistParams j).j = j := by
  rcases hj with rfl | rfl | rfl <;> rfl

lemma twistDin_le (j : ℕ) : twistDin (twistParams j) ≤ 216 := by
  unfold twistDin twistParams
  split_ifs <;> simp

lemma mem_lamI (P : ℕ) (hP : 1 ≤ P) (j : ℕ) : mem (lamR j) (lamI P j) := by
  unfold lamI
  rw [lamR_eq]
  exact mem_ratI P hP _ (by norm_num)

/-- The table-level validity flags (a `Bool`, evaluated once by the facts). -/
def twistTablesValid (P : ℕ) (prm : TwistParams) (tabs : TwistTables) : Bool :=
  isPos (lamI P prm.j) && isPos (sqrtI P (lamI P prm.j)) &&
    (List.range (twistDin prm + 2)).all (fun n => isPos (sqrtNatI P (n + 1))) &&
    (List.range (prm.Dout + 1)).all (fun c =>
      (List.range (prm.Dout + 1 - c)).all fun d => isPos (ivGet tabs.sqf c d))

/-- The tables are the kernel's (`twistTables`) for the power `j` at the precision `P`. -/
def TwistTablesOK (P : ℕ) (prm : TwistParams) (tabs : TwistTables) : Prop :=
  tabs.dil = dilTableDil P (lamI P prm.j) (twistDin prm) ∧
    tabs.sqfDil = sqrtFactDil P (twistDin prm) ∧ tabs.sqf = sqrtFactTable P (twistDin prm) ∧
    TermsOK tabs.terms ∧ twistTablesValid P prm tabs = true

lemma twistTables_ok (P : ℕ) (prm : TwistParams) (terms : Array PhaseTerm) (center : Array Int)
    (hT : TermsOK terms) (hv : twistTablesValid P prm (twistTables P prm terms center) = true) :
    TwistTablesOK P prm (twistTables P prm terms center) :=
  ⟨rfl, rfl, rfl, hT, hv⟩

lemma twistTablesValid_unpack {P : ℕ} {prm : TwistParams} {tabs : TwistTables}
    (h : twistTablesValid P prm tabs = true) :
    isPos (lamI P prm.j) = true ∧ isPos (sqrtI P (lamI P prm.j)) = true ∧
      (∀ n, n < twistDin prm + 2 → isPos (sqrtNatI P (n + 1)) = true) ∧
      (∀ c d, c + d ≤ prm.Dout → isPos (ivGet tabs.sqf c d) = true) := by
  unfold twistTablesValid at h
  simp only [Bool.and_eq_true, List.all_eq_true, List.mem_range] at h
  obtain ⟨⟨⟨h1, h2⟩, h3⟩, h4⟩ := h
  exact ⟨h1, h2, h3, fun c d hcd => h4 c (by omega) d (by omega)⟩

/-- The dilation table at the scale `2^KDil`. -/
lemma dilTableDil_sound (P : ℕ) (hP : 1 ≤ P) (j D : ℕ) (hpos1 : isPos (lamI P j) = true)
    (hpos2 : isPos (sqrtI P (lamI P j)) = true)
    (hsqpos : ∀ n, n < D + 2 → isPos (sqrtNatI P (n + 1)) = true) :
    ∀ e f m, e + f ≤ D → m ≤ min e f →
      memSc KDil ((lamR j)⁻¹ * dilT (twistMu j) e f (pairOfMin e f m).1 (pairOfMin e f m).2)
        ((((dilTableDil P (lamI P j) D).getD e #[]).getD f #[]).getD m (0, 0)) := by
  intro e f m hef hm
  have h := dilTable_sound P (mem_lamI P hP j) (lamR_pos j) (lo_pos_of_isPos hpos1)
    (lo_pos_of_isPos hpos2) D hsqpos e f m hef hm
  rw [show (Real.sqrt (lamR j))⁻¹ = twistMu j from rfl] at h
  unfold dilTableDil
  generalize (dilTable P (lamI P j) D) = T at h ⊢
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_map] at h ⊢
  rcases h1 : T[e]? with _ | lv
  · rw [h1] at h
    simp only [Option.getD_none, Array.getElem?_empty, Option.map_none] at h ⊢
    rw [eq_zero_of_mem_zeroI h]; exact memSc_zero _
  · rw [h1] at h
    simp only [Option.map_some, Option.getD_some, Array.getElem?_map] at h ⊢
    rcases h2 : lv[f]? with _ | row
    · rw [h2] at h
      simp only [Option.getD_none, Array.getElem?_empty, Option.map_none] at h ⊢
      rw [eq_zero_of_mem_zeroI h]; exact memSc_zero _
    · rw [h2] at h
      simp only [Option.map_some, Option.getD_some, Array.getElem?_map] at h ⊢
      rcases h3 : row[m]? with _ | t
      · rw [h3] at h
        simp only [Option.getD_none, Option.map_none] at h ⊢
        rw [eq_zero_of_mem_zeroI h]; exact memSc_zero _
      · rw [h3] at h
        simp only [Option.map_some, Option.getD_some] at h ⊢
        exact memSc_toFixed KDil h

lemma mem_sqrtFactTable (P D c d : ℕ) (hD : D ≤ 502) (hcd : c + d ≤ D) :
    mem (nrm c d)⁻¹ (ivGet (sqrtFactTable P D) c d) := by
  unfold sqrtFactTable ivGet
  have hc : c < D + 1 := by omega
  have hd : d < D + 1 - c := by omega
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, hc, hd, ↓reduceDIte,
    Option.getD_some]
  unfold nrm
  rw [inv_inv, factT_eq c (by omega), factT_eq d (by omega)]
  have := mem_sqrtI P (by positivity) (mem_ofNat P (c.factorial * d.factorial))
  simpa using this

/-! ### The node flags -/

lemma twistValid_unpack (P : ℕ) (prm : TwistParams) (nd : NodeSpec) (aI : Ival)
    (h : twistValid P prm nd aI = true) :
    bracketOK bracketPrec nd.order nd.bracket = true ∧ 0 < nd.loD ∧ 0 < nd.hiD ∧ 1 ≤ nd.order ∧
      weightValid P nd = true ∧ isPos (nodeS P nd) = true ∧
      nodeFactorsValid P (nodeS P nd) = true ∧ expAlphaValid P prm.j (nodeS P nd) = true ∧
      isPos (lamI P prm.j) = true ∧ isPos (sqrtI P (lamI P prm.j)) = true ∧
      isPos (mulI P (sqrtI P (lamI P prm.j)) aI) = true ∧
      ratiosValid P (sqI P (mulI P (sqrtI P (lamI P prm.j)) aI))
        (ratioDepth (twistDin prm)) = true ∧
      (∀ n, n < twistDin prm + 1 → isPos (sqrtNatI P (n + 1)) = true) ∧
      (∀ c, c < (twistDin prm + 1) / 2 + 1 →
        isPos (mulI P (mulI P (sqrtI P (lamI P prm.j)) aI) (sqrtNatI P (c + 1))) = true) := by
  unfold twistValid at h
  simp only [Bool.and_eq_true, decide_eq_true_eq, List.all_eq_true, List.mem_range] at h
  obtain ⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, h5⟩, h6⟩, h7⟩, h8⟩, h9⟩, h10⟩, h11⟩, h12⟩, h13⟩, h14⟩ :=
    h
  exact ⟨h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14⟩

/-- `e^{−jεs}` from the kernel's `expAlphaI`. -/
lemma mem_expAlphaI (P : ℕ) (hP : 1 ≤ P) (j : ℕ) {s : ℝ} {sI : Ival} (hs0 : 0 ≤ s) (hs : mem s sI)
    (hv : expAlphaValid P j sI = true) :
    mem (Real.exp (-(j * phaseEpsQ : ℝ) * s)) (expAlphaI P j sI) := by
  unfold expAlphaValid at hv
  simp only [Bool.and_eq_true] at hv
  obtain ⟨⟨⟨h1, h2⟩, h3⟩, h4⟩ := hv
  have hjs : mem ((j : ℝ) * s / (20 : ℕ)) (divN P 20 (mulN P j sI)) :=
    mem_divN P hP (by norm_num) (mem_mulN P j hs)
  have e1 := mem_expNegI P hP 400 hs0 hs h1 h2
  have e2 := mem_expNegI P hP 400 (by positivity) hjs h3 h4
  have := mem_mulI P (mem_powI P e1 j) e2
  unfold expAlphaI
  convert this using 1
  rw [← Real.exp_nat_mul, ← Real.exp_add]
  congr 1
  norm_num [phaseEpsQ]
  ring

/-! ### `twistJ` -/

/-- The node data: `s > 0` in `sI` with `vprof s ≠ 0`, its sign and shift enclosed. -/
structure NodeData (P : ℕ) (piI : Ival) (s : ℝ) (sI : Ival) (neg : Bool) (aI : Ival) : Prop where
  pos : 0 < s
  mem_s : mem s sI
  vprof_ne : vprof s ≠ 0
  sign : profileSign s = signOf neg
  shift : mem (profileShift s) aI

lemma mem_twistShift (P : ℕ) (hP : 1 ≤ P) (j : ℕ) {s : ℝ} {aI : Ival}
    (hA : mem (profileShift s) aI) :
    mem (twistShift j s) (mulI P (sqrtI P (lamI P j)) aI) := by
  unfold twistShift
  rw [mul_comm]
  exact mem_mulI P (mem_sqrtI P (lamR_pos j).le (mem_lamI P hP j)) hA

lemma ivGet_ivOfFn (D : ℕ) (f : ℕ → ℕ → Ival) (c d : ℕ) (h : c + d ≤ D) :
    ivGet (ivOfFn D f) c d = f c d := by
  unfold ivGet ivOfFn
  have hc : c < D + 1 := by omega
  have hd : d < D + 1 - c := by omega
  simp [Array.getD_eq_getD_getElem?, hc, hd]

/-- The normalisation `J_{c,d} = J'_{c,d} / √(c! d!)`. -/
lemma normalise_sound (P : ℕ) {sqf : Array (Array Ival)} {D : ℕ}
    (hsqf : ∀ c d, c + d ≤ D → mem (nrm c d)⁻¹ (ivGet sqf c d) ∧ 0 < (ivGet sqf c d).lo)
    {F : CPoly →+ ℂ} {J' : TwVec} (hJ : Represents F D J') (c d : ℕ) (hcd : c + d ≤ D) :
    mem (nrm c d * (F (H c d)).re) (ivGet (normalise P sqf D J') c d) := by
  unfold normalise
  rw [ivGet_ivOfFn _ _ c d hcd]
  have h := hJ c d hcd
  have hq := mem_divI P (mem_ofFixed KTw h.1 h.2) (hsqf c d hcd).1 (hsqf c d hcd).2
  convert hq using 1
  rw [div_inv_eq_mul, mul_comm]

/-- The canonical array with the seed scalar `1` encloses the signed normalised coefficients
`σ^{c+d} U_{c,d} / S(A)` (the seed `S(A)` is applied at the end of `twistJ`). -/
lemma mem_canonicalTriangleI_one (P : ℕ) {A : ℝ} {aI : Ival} (hA : mem A aI) (hA0 : 0 < A)
    (sq ratios : Array Ival)
    (hr : ∀ d, mem (OriginalPositiveMoment.ratio d (A ^ 2)) (ratios.getD d ⟨0, 1, 0⟩))
    (D : ℕ) (hsqT : ∀ n, n ≤ D + 1 → sq.getD n zeroI = sqrtNatI P n)
    (hsq : ∀ n, 1 ≤ n → n ≤ D → 0 < (sqrtNatI P n).lo)
    (hden : ∀ c, c < (D + 1) / 2 → 0 < (mulI P aI (sqrtNatI P (c + 1))).lo) (dMax i : ℕ)
    (hi : i < (canonicalPairs D dMax).size) (neg : Bool) :
    mem (signOf neg ^ (((canonicalPairs D dMax).getD i (0, 0)).1 +
        ((canonicalPairs D dMax).getD i (0, 0)).2) *
        (1 * uRe A ((canonicalPairs D dMax).getD i (0, 0)).1
          ((canonicalPairs D dMax).getD i (0, 0)).2))
      ((canonicalTriangleI P (ofInt P 1) neg zeroI aI sq ratios D dMax).getD i zeroI) := by
  unfold canonicalTriangleI canonicalFrom
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, hi, ↓reduceDIte, Option.getD_some]
  rw [← Array.getD_eq_getD_getElem?, ← Array.getD_eq_getD_getElem?]
  have hz : isZero zeroI = true := rfl
  simp only [actualCoefficient, hz, ↓reduceIte]
  have hu := mem_normalizedTriangleI P hA hA0 ratios sq hr D hsqT hsq hden dMax i hi
  exact mem_signedCoefficient P (mem_one P) hu neg _ _

lemma RealHom.smul {F : CPoly →+ ℂ} (hF : RealHom F) (κ : ℝ) : RealHom ((κ : ℂ) • F) := by
  intro x p
  simp only [AddMonoidHom.smul_apply, smul_eq_mul, hF x p]
  ring

/-- **One node**: the kernel's `twistJ` encloses the real part of the twisted conditional
coefficients on `c + d ≤ D_out`. -/
theorem twistJ_sound (P : ℕ) (hP : 1 ≤ P) {piI : Ival} (hpi : mem Real.pi piI) (hW : WatsonHyp 70)
    {prm : TwistParams} (hDin : twistDin prm ≤ 502) {tabs : TwistTables}
    (htab : TwistTablesOK P prm tabs) {s : ℝ} {sI : Ival} {neg : Bool} {aI : Ival}
    (hnd : NodeData P piI s sI neg aI)
    (hexp : expAlphaValid P prm.j sI = true)
    (hA'pos : isPos (mulI P (sqrtI P (lamI P prm.j)) aI) = true)
    (hrv : ratiosValid P (sqI P (mulI P (sqrtI P (lamI P prm.j)) aI))
      (ratioDepth (twistDin prm)) = true)
    (hsq : ∀ n, n < twistDin prm + 1 → isPos (sqrtNatI P (n + 1)) = true)
    (hden : ∀ c, c < (twistDin prm + 1) / 2 + 1 →
      isPos (mulI P (mulI P (sqrtI P (lamI P prm.j)) aI) (sqrtNatI P (c + 1))) = true)
    (c d : ℕ) (hcd : c + d ≤ prm.Dout) :
    mem (twistCoef prm.j s (c, d)).re (ivGet (twistJ P prm tabs piI sI neg aI) c d) := by
  obtain ⟨hdil, hsqfDil, hsqf, hT, htv⟩ := htab
  obtain ⟨hl1, hl2, hsq2, hsqfpos⟩ := twistTablesValid_unpack htv
  set j := prm.j with hj
  set Din := twistDin prm with hDinDef
  have hs0 := hnd.pos.le
  -- the rescaled shift and the canonical triangle at it
  have hA' := mem_twistShift P hP j hnd.shift
  have hA'0 : 0 < twistShift j s := pos_of_isPos hA'pos hA'
  have hx2 : mem (twistShift j s ^ 2) (sqI P (mulI P (sqrtI P (lamI P j)) aI)) := by
    rw [sq]; exact mem_sqI P hA'
  have hJ0 := mem_seedJ0I_moment P hP hpi (sq_nonneg _) hx2 hW
  have hS := mem_seedScalarI P hP hpi hA' hJ0
  have hratios : ∀ d, mem (OriginalPositiveMoment.ratio d (twistShift j s ^ 2))
      ((ratiosI P (sqI P (mulI P (sqrtI P (lamI P j)) aI)) (ratioDepth Din)).getD d ⟨0, 1, 0⟩) := by
    intro d
    by_cases hd : d < (ratiosI P (sqI P (mulI P (sqrtI P (lamI P j)) aI)) (ratioDepth Din)).size
    · have h := mem_ratiosI P hP (sq_nonneg _) hx2 (ratioDepth Din) hrv d hd
      rw [Array.getD_eq_getD_getElem?, Array.getElem?_eq_getElem hd, Option.getD_some] at h ⊢
      exact h
    · rw [Array.getD_eq_getD_getElem?, Array.getElem?_eq_none (by omega), Option.getD_none]
      obtain ⟨h0, h1⟩ := OriginalPositiveMoment.ratio_mem_unit d (twistShift j s ^ 2)
      constructor
      · simp; exact h0.le
      · simpa using h1
  have hS0 := seedScalar_pos hA'0
  have hvals : ∀ i, i < (canonicalPairs Din Din).size →
      mem ((seedScalar (twistShift j s))⁻¹ *
          signOf neg ^ (((canonicalPairs Din Din).getD i (0, 0)).1 +
          ((canonicalPairs Din Din).getD i (0, 0)).2) *
        (canonicalCoefficient (twistShift j s) ((canonicalPairs Din Din).getD i (0, 0))).re)
        ((canonicalTriangleI P (ofInt P 1) neg zeroI (mulI P (sqrtI P (lamI P j)) aI)
          (sqrtTable P (Din + 1)) (ratiosI P (sqI P (mulI P (sqrtI P (lamI P j)) aI))
            (ratioDepth Din)) Din Din).getD i zeroI) := by
    intro i hi
    have h := mem_canonicalTriangleI_one P hA' hA'0 (sqrtTable P (Din + 1)) _ hratios
      Din (fun n hn => sqrtTable_getD P (Din + 1) n hn)
      (fun n hn1 hnD => lo_pos_of_isPos (by
        have := hsq (n - 1) (by omega)
        rwa [Nat.sub_add_cancel hn1] at this))
      (fun c hc => lo_pos_of_isPos (hden c (by omega))) Din i hi neg
    convert h using 1
    unfold uRe normalizedCoefficient
    rw [Complex.div_ofReal_re]
    field_simp
  -- the dilated functional
  have hK := unnormalise_represents P hP j hs0 hnd.vprof_ne hnd.sign Din hDin _ hvals
    (dil := tabs.dil) (by
      rw [hdil]
      exact dilTableDil_sound P hP j Din hl1 hl2 hsq2)
  -- the operator
  have hr : mem (Real.sqrt s) (sqrtI P sI) := mem_sqrtI P hs0 hnd.mem_s
  rw [← hsqfDil] at hK
  have hJ' := applyQPow_sound (nodeCoefs P tabs.terms sI (sqrtI P sI))
    (toTw (divN P 2 (sqrtI P sI)))
    (a := nodeA tabs.terms s) (h := Real.sqrt s / 2)
    (fun j' k hjk => mem_nodeCoefs P hP hT hnd.mem_s hr j' k hjk)
    (memTw_toTw (mem_divN P hP (by norm_num) hr)) j prm.Dout
    ((realHom_Kfun j s).smul _) hK
  -- the normalisation and the scalar factors
  have hea := mem_mulI P (mem_expAlphaI P hP j hs0 hnd.mem_s hexp) hS
  have hcoef : (twistCoef j s (c, d)).re =
      (-1) ^ j * ((Real.exp (-(j * phaseEpsQ : ℝ) * s) * seedScalar (twistShift j s)) *
        (nrm c d * (mulLeft (nodeQ tabs.terms s ^ j)
          ((((seedScalar (twistShift j s))⁻¹ : ℝ) : ℂ) • Kfun j s) (H c d)).re)) := by
    have hSne := hS0.ne'
    rw [twistCoef_eq_K hT j hs0 c d, Complex.re_ofReal_mul, mulLeft_apply,
      AddMonoidHom.smul_apply, smul_eq_mul, Complex.re_ofReal_mul]
    field_simp
  have hn := normalise_sound P (sqf := tabs.sqf) (D := prm.Dout)
    (fun c d hcd => ⟨by
      rw [hsqf]
      exact mem_sqrtFactTable P Din c d hDin (by simp only [hDinDef, twistDin]; omega),
      lo_pos_of_isPos (hsqfpos c d hcd)⟩) hJ' c d hcd
  unfold twistJ
  simp only
  rw [ivGet_ivOfFn _ _ c d hcd, hcoef]
  have hm := mem_mulI P hea hn
  split_ifs with hodd
  · have hpow : ((-1 : ℝ) ^ j) = -1 := by
      have : j % 2 = 1 := by simpa using hodd
      rw [← Nat.div_add_mod j 2, this, pow_add, pow_mul]; simp
    rw [hpow, neg_one_mul]
    exact mem_negI hm
  · have hpow : ((-1 : ℝ) ^ j) = 1 := by
      have : j % 2 = 0 := by
        have := Nat.mod_two_eq_zero_or_one j
        simp at hodd; omega
      rw [← Nat.div_add_mod j 2, this, add_zero, pow_mul]; simp
    rw [hpow, one_mul]
    exact hm

end

end Grothe.UpperQuad
