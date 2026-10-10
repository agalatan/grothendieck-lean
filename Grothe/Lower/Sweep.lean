import Grothe.Lower.Moment

/-!
# Majorants of a capped convex potential

The potential `Ψ` of a row is known through *node caps* `Ψ(rₖ) ≤ cₖ`, its convexity on `[0, ∞)`
and a Lipschitz constant `smax` (`CapsHold`).  Convexity puts `Ψ` below the chord of any two
nodes between them, and the Lipschitz bound below the line of slope `smax` through the last
node beyond it.

`sweepTop` certifies an inequality `Ψ(σv) + g(v) ≤ maj(v)` for all `v ≥ 0`, where `maj` is a
polynomial and `g` is piecewise rational on a mesh `0 < v₁ < v₂ < …`: on the `k`-th mesh cell
`v^{sh(k)} g(v)` is the polynomial `cp k`, with `sh(0) = 0` and `sh(k) = 4` otherwise
(`pickIdx` is the index of the cell of `v`).  The sweep walks through the common refinement of
the mesh and the node abscissae `rₖ/σ`, certifies
`v^{sh}(maj(v) − chord(σv)) − cp(v) ≥ 0` on each piece by the positivity certificate, and treats the
half-line beyond the last node by Taylor coefficients (`major_sound`).
-/

namespace Grothe.Lower

/-- Node caps, convexity and the Lipschitz bound of a potential. -/
structure CapsHold (Ψ : ℝ → ℝ) (nodes : List (ℚ × ℚ)) (smax : ℚ) : Prop where
  convex : ConvexOn ℝ (Set.Ici 0) Ψ
  caps : ∀ n ∈ nodes, Ψ n.1 ≤ n.2
  lip : ∀ s t : ℝ, 0 ≤ s → s ≤ t → Ψ t ≤ Ψ s + smax * (t - s)

/-- A convex function is below the chord of two caps. -/
lemma chord_le (Ψ : ℝ → ℝ) (hΨ : ConvexOn ℝ (Set.Ici 0) Ψ) (r r' c c' s : ℝ) (hr : 0 ≤ r)
    (hrr : r < r') (h1 : r ≤ s) (h2 : s ≤ r') (hc : Ψ r ≤ c) (hc' : Ψ r' ≤ c') :
    Ψ s ≤ c + (c' - c) / (r' - r) * (s - r) := by
  have hd : 0 < r' - r := by linarith
  obtain ⟨lam, hlam⟩ : ∃ lam : ℝ, lam = (s - r) / (r' - r) := ⟨_, rfl⟩
  have h0 : 0 ≤ lam := by rw [hlam]; exact div_nonneg (by linarith) hd.le
  have h1' : lam ≤ 1 := by rw [hlam, div_le_one hd]; linarith
  have hs : (1 - lam) * r + lam * r' = s := by rw [hlam]; field_simp; ring
  have hcv := hΨ.2 (Set.mem_Ici.2 hr) (Set.mem_Ici.2 (hr.trans hrr.le))
    (by linarith : 0 ≤ 1 - lam) h0 (by ring : (1 - lam) + lam = 1)
  simp only [smul_eq_mul] at hcv
  rw [hs] at hcv
  have e : c + (c' - c) / (r' - r) * (s - r) = (1 - lam) * c + lam * c' := by
    rw [hlam]; field_simp; ring
  rw [e]
  nlinarith [mul_le_mul_of_nonneg_left hc (by linarith : 0 ≤ 1 - lam),
    mul_le_mul_of_nonneg_left hc' h0]

open Classical in
/-- Index of the mesh cell of `v`: the number of leading mesh points `≤ v`. -/
noncomputable def pickIdx : List ℚ → ℝ → ℕ
  | [], _ => 0
  | t :: rest, v => if v < (t : ℝ) then 0 else pickIdx rest v + 1

/-- The power of `v` clearing the denominators on the `k`-th mesh cell. -/
def shOf (k : ℕ) : ℕ := if k = 0 then 0 else 4

/-- `v^sh (maj(v) − c₀ − c₁v) − cp(v)`. -/
def pieceP (sh : ℕ) (maj : List ℚ) (c0 c1 : ℚ) (cp : List ℚ) : List ℚ :=
  addLq (shiftUp sh (addLq maj [-c0, -c1])) (negL cp)

lemma evalL_pieceP (sh : ℕ) (maj : List ℚ) (c0 c1 : ℚ) (cp : List ℚ) (v : ℝ) :
    evalL ((pieceP sh maj c0 c1 cp).map ((↑) : ℚ → ℝ)) v
      = v ^ sh * (evalL (maj.map ((↑) : ℚ → ℝ)) v - c0 - c1 * v)
        - evalL (cp.map ((↑) : ℚ → ℝ)) v := by
  simp only [pieceP, evalL_addLq, evalL_shiftUp, evalL_negL, List.map_cons, List.map_nil, evalL,
    Rat.cast_neg]
  ring

lemma piece_ok (k : ℕ) (v gv maj cpv c0 c1 Ψv : ℝ) (hk : k = 0 ∨ 0 < v)
    (hg : v ^ shOf k * gv = cpv) (hP : 0 ≤ v ^ shOf k * (maj - c0 - c1 * v) - cpv)
    (hΨ : Ψv ≤ c0 + c1 * v) : Ψv + gv ≤ maj := by
  have hpos : 0 < v ^ shOf k := by
    rcases hk with rfl | hv
    · simp [shOf]
    · positivity
  have h1 : 0 ≤ v ^ shOf k * (maj - c0 - c1 * v - gv) := by
    rw [mul_sub, hg]; linarith
  have := nonneg_of_mul_nonneg_right h1 hpos
  linarith

/-- Slope of the chord of two nodes. -/
def slope (n n' : ℚ × ℚ) : ℚ := (n'.2 - n.2) / (n'.1 - n.1)

/-- The end of the next piece and the state after it: the next mesh point or the next node
abscissa `hiN`, whichever comes first. -/
def nextStep (hiN : ℚ) (k : ℕ) (vs : List ℚ) (n : ℚ × ℚ) (rest : List (ℚ × ℚ)) :
    ℚ × ℕ × List ℚ × List (ℚ × ℚ) :=
  match vs with
  | [] => (hiN, k, [], rest)
  | t :: r =>
    if t < hiN then (t, k + 1, r, n :: rest)
    else if t = hiN then (t, k + 1, r, rest)
    else (hiN, k, t :: r, rest)

lemma nextStep_spec (hiN : ℚ) (k : ℕ) (vs : List ℚ) (n : ℚ × ℚ) (rest : List (ℚ × ℚ)) :
    (nextStep hiN k vs n rest).1 ≤ hiN ∧
    (∀ v : ℝ, v < ((nextStep hiN k vs n rest).1 : ℝ) → pickIdx vs v = 0) ∧
    (∀ v : ℝ, ((nextStep hiN k vs n rest).1 : ℝ) ≤ v →
      k + pickIdx vs v = (nextStep hiN k vs n rest).2.1
        + pickIdx (nextStep hiN k vs n rest).2.2.1 v) ∧
    ((nextStep hiN k vs n rest).2.2.2 = n :: rest ∨
      ((nextStep hiN k vs n rest).2.2.2 = rest ∧ (nextStep hiN k vs n rest).1 = hiN)) := by
  cases vs with
  | nil => simp [nextStep, pickIdx]
  | cons t r =>
    by_cases h1 : t < hiN
    · rw [show nextStep hiN k (t :: r) n rest = (t, k + 1, r, n :: rest) by simp [nextStep, h1]]
      refine ⟨h1.le, fun v hv => by simp [pickIdx, hv], fun v hv => ?_, Or.inl rfl⟩
      have hn : ¬ v < (t : ℝ) := not_lt.2 hv
      simp only [pickIdx, hn, ↓reduceIte]; omega
    · by_cases h2 : t = hiN
      · rw [show nextStep hiN k (t :: r) n rest = (t, k + 1, r, rest) by simp [nextStep, h2]]
        refine ⟨h2.le, fun v hv => by simp [pickIdx, hv], fun v hv => ?_, Or.inr ⟨rfl, h2⟩⟩
        have hn : ¬ v < (t : ℝ) := not_lt.2 hv
        simp only [pickIdx, hn, ↓reduceIte]; omega
      · rw [show nextStep hiN k (t :: r) n rest = (hiN, k, t :: r, rest) by
          simp [nextStep, h1, h2]]
        have h3 : hiN < t := lt_of_le_of_ne (not_lt.1 h1) (Ne.symm h2)
        refine ⟨le_rfl, fun v hv => ?_, fun v _ => rfl, Or.inr ⟨rfl, rfl⟩⟩
        have : v < (t : ℝ) := hv.trans (by exact_mod_cast h3)
        simp [pickIdx, this]

/-- The sweep from `lo` in mesh cell `k`, with remaining mesh points `vs` and remaining nodes
(the first one at or before `σ·lo`). -/
def sweep (σ smax : ℚ) (maj : List ℚ) (cp : ℕ → List ℚ) :
    ℕ → ℚ → ℕ → List ℚ → List (ℚ × ℚ) → Bool
  | 0, _, _, _, _ => false
  | f + 1, lo, k, vs, nodes =>
    match nodes with
    | [] => false
    | [n] =>
      vs.isEmpty && (decide (k = 0) || decide (0 < lo)) &&
        tailOn (pieceP (shOf k) maj (n.2 - smax * n.1) (smax * σ) (cp k)) 16 lo
    | n :: n' :: ns =>
      decide (n.1 < n'.1) && (decide (k = 0) || decide (0 < lo)) &&
        decide (lo < (nextStep (n'.1 / σ) k vs n (n' :: ns)).1) &&
        posOn (pieceP (shOf k) maj (n.2 - slope n n' * n.1) (slope n n' * σ) (cp k)) 7 lo
          (nextStep (n'.1 / σ) k vs n (n' :: ns)).1 &&
        sweep σ smax maj cp f (nextStep (n'.1 / σ) k vs n (n' :: ns)).1
          (nextStep (n'.1 / σ) k vs n (n' :: ns)).2.1
          (nextStep (n'.1 / σ) k vs n (n' :: ns)).2.2.1
          (nextStep (n'.1 / σ) k vs n (n' :: ns)).2.2.2

theorem sweep_sound (Ψ : ℝ → ℝ) (smax σ : ℚ) (hσ : 0 < σ) (maj : List ℚ) (cp : ℕ → List ℚ)
    (g : ℝ → ℝ) (vsAll : List ℚ) (hconv : ConvexOn ℝ (Set.Ici 0) Ψ)
    (hlip : ∀ s t : ℝ, 0 ≤ s → s ≤ t → Ψ t ≤ Ψ s + smax * (t - s))
    (hg : ∀ v : ℝ, 0 ≤ v → (pickIdx vsAll v = 0 ∨ 0 < v) →
      v ^ shOf (pickIdx vsAll v) * g v = evalL ((cp (pickIdx vsAll v)).map ((↑) : ℚ → ℝ)) v) :
    ∀ (f : ℕ) (lo : ℚ) (k : ℕ) (vs : List ℚ) (nodes : List (ℚ × ℚ)),
      sweep σ smax maj cp f lo k vs nodes = true → 0 ≤ lo →
      (∀ n ∈ nodes, Ψ n.1 ≤ n.2) →
      (∀ n ∈ nodes.head?, 0 ≤ n.1 ∧ n.1 ≤ σ * lo) →
      (∀ v : ℝ, (lo : ℝ) ≤ v → pickIdx vsAll v = k + pickIdx vs v) →
      ∀ v : ℝ, (lo : ℝ) ≤ v → Ψ (σ * v) + g v ≤ evalL (maj.map ((↑) : ℚ → ℝ)) v := by
  have hσR : (0 : ℝ) < σ := by exact_mod_cast hσ
  intro f
  induction f with
  | zero => intro lo k vs nodes h; simp [sweep] at h
  | succ f ih =>
    intro lo k vs nodes h hlo hcaps hhead hidx v hv
    have hloR : (0 : ℝ) ≤ lo := by exact_mod_cast hlo
    have hv0 : (0 : ℝ) ≤ v := hloR.trans hv
    cases nodes with
    | nil => simp [sweep] at h
    | cons n ns' =>
      obtain ⟨hn0, hn1⟩ := hhead n (by simp)
      have hn0R : (0 : ℝ) ≤ n.1 := by exact_mod_cast hn0
      have hn1R : (n.1 : ℝ) ≤ σ * lo := by exact_mod_cast hn1
      have hnv : (n.1 : ℝ) ≤ σ * v := hn1R.trans (mul_le_mul_of_nonneg_left hv hσR.le)
      cases ns' with
      | nil =>
        simp only [sweep, Bool.and_eq_true, Bool.or_eq_true, decide_eq_true_eq,
          List.isEmpty_iff] at h
        obtain ⟨⟨hvs, hk⟩, htail⟩ := h
        subst hvs
        have hidx' : pickIdx vsAll v = k := by simpa [pickIdx] using hidx v hv
        have hk' : k = 0 ∨ 0 < v :=
          hk.imp id fun h0 => lt_of_lt_of_le (by exact_mod_cast h0) hv
        have hP := tailOn_sound _ 16 lo htail v hv
        rw [evalL_pieceP] at hP
        have hgv := hg v hv0 (by rw [hidx']; exact hk')
        rw [hidx'] at hgv
        have hΨ : Ψ (σ * v) ≤ ((n.2 - smax * n.1 : ℚ) : ℝ) + ((smax * σ : ℚ) : ℝ) * v := by
          have h1 := hlip n.1 (σ * v) hn0R hnv
          have h2 := hcaps n (by simp)
          have e : (smax : ℝ) * (σ * v - n.1) = smax * σ * v - smax * n.1 := by ring
          push_cast
          linarith
        exact piece_ok k v (g v) _ _ _ _ _ hk' hgv hP hΨ
      | cons n' ns =>
        simp only [sweep, Bool.and_eq_true, Bool.or_eq_true, decide_eq_true_eq] at h
        obtain ⟨⟨⟨⟨hnn, hk⟩, hlt⟩, hpos⟩, hrec⟩ := h
        obtain ⟨s1, s2, s3, s4⟩ := nextStep_spec (n'.1 / σ) k vs n (n' :: ns)
        generalize nextStep (n'.1 / σ) k vs n (n' :: ns) = st at hlt hpos hrec s1 s2 s3 s4
        have hnnR : (n.1 : ℝ) < n'.1 := by exact_mod_cast hnn
        have hhiq : σ * st.1 ≤ n'.1 := by
          have := mul_le_mul_of_nonneg_left s1 hσ.le
          rwa [mul_div_cancel₀ _ hσ.ne'] at this
        have hhi : (σ : ℝ) * st.1 ≤ n'.1 := by exact_mod_cast hhiq
        have hk' : k = 0 ∨ 0 < v :=
          hk.imp id fun h0 => lt_of_lt_of_le (by exact_mod_cast h0) hv
        by_cases hvh : v < (st.1 : ℝ)
        · have hidx' : pickIdx vsAll v = k := by rw [hidx v hv, s2 v hvh, add_zero]
          have hP := posOn_sound _ 7 lo st.1 hlt hpos v hv hvh.le
          rw [evalL_pieceP] at hP
          have hgv := hg v hv0 (by rw [hidx']; exact hk')
          rw [hidx'] at hgv
          have hΨ : Ψ (σ * v) ≤ ((n.2 - slope n n' * n.1 : ℚ) : ℝ)
              + ((slope n n' * σ : ℚ) : ℝ) * v := by
            have h1 := chord_le Ψ hconv n.1 n'.1 n.2 n'.2 (σ * v) hn0R hnnR hnv
              ((mul_le_mul_of_nonneg_left hvh.le hσR.le).trans hhi) (hcaps n (by simp))
              (hcaps n' (by simp))
            have e : ((n.2 - slope n n' * n.1 : ℚ) : ℝ) + ((slope n n' * σ : ℚ) : ℝ) * v
                = n.2 + ((n'.2 : ℝ) - n.2) / (n'.1 - n.1) * (σ * v - n.1) := by
              simp only [slope]; push_cast; ring
            rw [e]; exact h1
          exact piece_ok k v (g v) _ _ _ _ _ hk' hgv hP hΨ
        · have hvh' : (st.1 : ℝ) ≤ v := not_lt.1 hvh
          have hst0 : 0 ≤ st.1 := hlo.trans hlt.le
          refine ih st.1 st.2.1 st.2.2.1 st.2.2.2 hrec hst0 ?_ ?_ ?_ v hvh'
          · intro m hm
            rcases s4 with h4 | ⟨h4, _⟩
            · exact hcaps m (by rw [h4] at hm; exact hm)
            · exact hcaps m (by rw [h4] at hm; exact List.mem_cons_of_mem _ hm)
          · intro m hm
            rcases s4 with h4 | ⟨h4, h5⟩
            · rw [h4] at hm
              simp only [List.head?_cons, Option.mem_def, Option.some.injEq] at hm
              subst hm
              exact ⟨hn0, hn1.trans (mul_le_mul_of_nonneg_left hlt.le hσ.le)⟩
            · rw [h4] at hm
              simp only [List.head?_cons, Option.mem_def, Option.some.injEq] at hm
              subst hm
              refine ⟨hn0.trans hnn.le, ?_⟩
              rw [h5, mul_div_cancel₀ _ hσ.ne']
          · intro w hw
            rw [hidx w ((by exact_mod_cast hlt.le : (lo : ℝ) ≤ st.1).trans hw)]
            exact s3 w hw

/-- The majorant check from `v = 0`. -/
def sweepTop (σ smax : ℚ) (maj : List ℚ) (cp : ℕ → List ℚ) (vs : List ℚ)
    (nodes : List (ℚ × ℚ)) : Bool :=
  decide (0 < σ) && (match nodes with
    | n :: _ => n.1 == 0
    | [] => false) &&
  sweep σ smax maj cp (vs.length + nodes.length + 1) 0 0 vs nodes

/-- **Soundness of the majorant check.** -/
theorem major_sound (Ψ : ℝ → ℝ) (nodes : List (ℚ × ℚ)) (smax : ℚ) (hΨ : CapsHold Ψ nodes smax)
    (σ : ℚ) (maj : List ℚ) (cp : ℕ → List ℚ) (vs : List ℚ) (g : ℝ → ℝ)
    (hg : ∀ v : ℝ, 0 ≤ v → (pickIdx vs v = 0 ∨ 0 < v) →
      v ^ shOf (pickIdx vs v) * g v = evalL ((cp (pickIdx vs v)).map ((↑) : ℚ → ℝ)) v)
    (h : sweepTop σ smax maj cp vs nodes = true) (v : ℝ) (hv : 0 ≤ v) :
    Ψ (σ * v) + g v ≤ evalL (maj.map ((↑) : ℚ → ℝ)) v := by
  simp only [sweepTop, Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨hσ, hhead⟩, hsw⟩ := h
  cases nodes with
  | nil => simp at hhead
  | cons n ns =>
    simp only [beq_iff_eq] at hhead
    refine sweep_sound Ψ smax σ hσ maj cp g vs hΨ.convex hΨ.lip hg _ 0 0 vs (n :: ns) hsw le_rfl
      hΨ.caps ?_ (fun w _ => by rw [zero_add]) v (by simpa using hv)
    intro m hm
    simp only [List.head?_cons, Option.mem_def, Option.some.injEq] at hm
    subst hm
    rw [hhead]; simp

end Grothe.Lower
