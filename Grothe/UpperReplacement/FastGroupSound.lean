import Grothe.UpperReplacement.FastGroup
import Grothe.UpperReplacement.CellHeadSound
import Grothe.UpperReplacement.RootChecks

set_option warningAsError true

/-!
# Soundness of the fast eight-residue cell-head evaluator

Agent-ID: gemini-1aa9.

Proves that `FastGroup.groupResidues` encloses the exact signed Hermite grade sums
`HeadWitness.residueSum` for all eight residues `start .. start + 7` when `8 ∣ start`:
1. `CellEncoding.decodeClipped` agrees with `CellEncoding.decode` followed by disk clipping.
2. `RadialCompute.momentsInt` and `RadialCompute.radialRowInt` match `CellHeadCompute.moments`
   and `RadialCompute.radialRow` bit-for-bit on the 128-cell grid on `[0, 6]`, and
   `normalizedRadialMoment` is symmetric in `(p, q)`.
3. `GrotheQuad.mulBT` encloses real matrix products at scale `2^128` (`memFx_mulBT_entry`).
4. `FastGroup.angularGroup8Fx` encloses `unscaledAngular` via the 8×8 radix-8 DFT factorization.
5. `FastGroup.modeHeadFast` and `FastGroup.groupResidues` enclose the exact signed overlaps.
-/

namespace Grothe.UpperReplacement.FastGroup

open GrotheKernel GrotheKernel.HardyArc Upper UpperChaos UpperChaos.HardyArcSound
open CellHeadCompute CellArithmetic Certificate Finset
open scoped ComplexConjugate InnerProductSpace

noncomputable section

/-! ### 1. Soundness of `CellEncoding.decodeClipped` -/

private def clipPair (scale2 : ℤ) (p : ℤ × ℤ) : ℤ × ℤ :=
  if p.1 * p.1 + p.2 * p.2 ≤ scale2 then p else (0, 0)

private theorem digit_lt (b : UInt8) : CellEncoding.digit b < 64 := by
  unfold CellEncoding.digit
  dsimp only
  split_ifs <;> omega

private theorem digitFast_eq (b : UInt8) : CellEncoding.digitFast b = CellEncoding.digit b := by
  have hb : b.toNat.toUInt8 = b := UInt8.ofNat_toNat
  have hd : CellEncoding.digit b < 256 := Nat.lt_trans (digit_lt b) (by decide)
  have hlt : b.toNat < 256 := b.toNat_lt
  have hget : CellEncoding.digitTable[b.toNat]'(by rw [CellEncoding.digitTable_size]; exact hlt) =
      (CellEncoding.digit b).toUInt8 := by
    have h1 : ∀ (a : Array UInt8) (i : ℕ) (hi : i < a.size),
        (ByteArray.mk a)[i]'hi = a[i]'hi := fun _ _ _ ↦ rfl
    have h2 : (Array.ofFn fun i : Fin 256 ↦ (CellEncoding.digit i.val.toUInt8).toUInt8)[b.toNat]'(by
        rw [Array.size_ofFn]; exact hlt) = (CellEncoding.digit b.toNat.toUInt8).toUInt8 :=
      Array.getElem_ofFn _
    rw [hb] at h2
    exact (h1 _ b.toNat _).trans h2
  unfold CellEncoding.digitFast
  rw [hget]
  simp only [Nat.toUInt8, UInt8.toNat, UInt8.ofNat, BitVec.toNat_ofNat]
  change CellEncoding.digit b % 256 = CellEncoding.digit b
  exact Nat.mod_eq_of_lt hd

private theorem wordFastAt_eq (row : ByteArray) (k : ℕ) (h : 9 * k + 8 < row.size) :
    CellEncoding.wordFastAt row (9 * k) h = CellEncoding.word row k := by
  unfold CellEncoding.wordFastAt CellEncoding.word
  have hget : ∀ (j : ℕ) (hj : j ≤ 8),
      (row[9 * k + j]?.getD 0) = row[9 * k + j]'(by omega) := by
    intro j hj
    have hlt : 9 * k + j < row.size := by omega
    rw [getElem?_pos row (9 * k + j) hlt, Option.getD_some]
  have h0 : (row[9 * k]?.getD 0) = row[9 * k]'(by omega) := by
    simpa only [Nat.add_zero] using hget 0 (by omega)
  have hlist : List.range 9 = [0, 1, 2, 3, 4, 5, 6, 7, 8] := by decide
  rw [hlist]
  simp only [List.foldl_cons, List.foldl_nil, digitFast_eq, Nat.add_zero, h0,
    hget 1 (by omega), hget 2 (by omega), hget 3 (by omega), hget 4 (by omega),
    hget 5 (by omega), hget 6 (by omega), hget 7 (by omega), hget 8 (by omega)]
  ring

private theorem decodeRowClippedAux_toList (bytes : ByteArray) (scale2 : ℤ) (n : ℕ)
    (hn : 9 * n ≤ bytes.size) :
    ∀ (rem : ℕ), rem ≤ n → ∀ (re im : Array ℤ),
      let p := CellEncoding.decodeRowClippedAux bytes scale2 n rem re im
      p.1.toList = re.toList ++ (List.range rem).map (fun j ↦
          (clipPair scale2 (CellEncoding.entry bytes (n - rem + j))).1) ∧
      p.2.toList = im.toList ++ (List.range rem).map (fun j ↦
          (clipPair scale2 (CellEncoding.entry bytes (n - rem + j))).2)
  | 0, _, re, im => by simp [CellEncoding.decodeRowClippedAux]
  | rem + 1, hrem, re, im => by
    have hk : 9 * (n - (rem + 1)) + 8 < bytes.size := by omega
    have hstep : CellEncoding.decodeRowClippedAux bytes scale2 n (rem + 1) re im =
        let e := clipPair scale2 (CellEncoding.entry bytes (n - (rem + 1)))
        CellEncoding.decodeRowClippedAux bytes scale2 n rem (re.push e.1) (im.push e.2) := by
      conv_lhs => unfold CellEncoding.decodeRowClippedAux
      simp only [hk, ↓reduceDIte, wordFastAt_eq bytes (n - (rem + 1)) hk]
      have h134 : (134217728 : ℕ) = 2 ^ 27 := by decide
      have h67 : (67108864 : ℤ) = 2 ^ 26 := by decide
      dsimp only [CellEncoding.entry, clipPair]
      rw [h134, h67]
      split_ifs <;> rfl
    set e := clipPair scale2 (CellEncoding.entry bytes (n - (rem + 1)))
    have ih := decodeRowClippedAux_toList bytes scale2 n hn rem (by omega)
      (re.push e.1) (im.push e.2)
    have hidx : ∀ j : ℕ, n - rem + j = n - (rem + 1) + (j + 1) := by intro j; omega
    dsimp only
    rw [hstep]
    constructor
    · rw [ih.1, Array.toList_push, List.range_succ_eq_map, List.map_cons, List.map_map,
        List.append_assoc, List.singleton_append]
      apply congrArg (re.toList ++ ·)
      rw [Nat.add_zero]
      apply congrArg (e.1 :: ·)
      exact List.map_congr_left fun j _ ↦ by simp only [Function.comp_apply, hidx j]
    · rw [ih.2, Array.toList_push, List.range_succ_eq_map, List.map_cons, List.map_map,
        List.append_assoc, List.singleton_append]
      apply congrArg (im.toList ++ ·)
      rw [Nat.add_zero]
      apply congrArg (e.2 :: ·)
      exact List.map_congr_left fun j _ ↦ by simp only [Function.comp_apply, hidx j]

private theorem decodeRowsClippedAux_toList (rows : Array String) (scale2 : ℤ) :
    ∀ (rem : ℕ), rem ≤ rows.size → ∀ (re im : Array ℤ),
      let p := CellEncoding.decodeRowsClippedAux rows scale2 rem re im
      p.1.toList = re.toList ++
        ((List.range rem).flatMap fun j ↦
          (CellEncoding.decodeRow (rows.getD (rows.size - rem + j) "")).toList).map
          (fun q ↦ (clipPair scale2 q).1) ∧
      p.2.toList = im.toList ++
        ((List.range rem).flatMap fun j ↦
          (CellEncoding.decodeRow (rows.getD (rows.size - rem + j) "")).toList).map
          (fun q ↦ (clipPair scale2 q).2)
  | 0, _, re, im => by simp [CellEncoding.decodeRowsClippedAux]
  | rem + 1, hrem, re, im => by
    have hr : rows.size - (rem + 1) < rows.size := by omega
    set bytes := rows[rows.size - (rem + 1)].toByteArray
    set n := bytes.size / 9
    have hstep : CellEncoding.decodeRowsClippedAux rows scale2 (rem + 1) re im =
        let p := CellEncoding.decodeRowClippedAux bytes scale2 n n re im
        CellEncoding.decodeRowsClippedAux rows scale2 rem p.1 p.2 := by
      conv_lhs => unfold CellEncoding.decodeRowsClippedAux
      simp only [hr, ↓reduceDIte, bytes, n]
    have hrow := decodeRowClippedAux_toList bytes scale2 n (Nat.mul_div_le bytes.size 9)
      n (le_refl n) re im
    have hrowEq : rows.getD (rows.size - (rem + 1)) "" = rows[rows.size - (rem + 1)] := by
      simp [Array.getD_eq_getD_getElem?, hr]
    have hrowList :
        (CellEncoding.decodeRow rows[rows.size - (rem + 1)]).toList =
          (List.range n).map (CellEncoding.entry bytes) := by
      simp [CellEncoding.decodeRow, bytes, n, Array.toList_map, Array.toList_range]
    have ih := decodeRowsClippedAux_toList rows scale2 rem (by omega)
      (CellEncoding.decodeRowClippedAux bytes scale2 n n re im).1
      (CellEncoding.decodeRowClippedAux bytes scale2 n n re im).2
    have hidx : ∀ j : ℕ, rows.size - rem + j = rows.size - (rem + 1) + (j + 1) := by
      intro j; omega
    dsimp only
    rw [hstep]
    constructor
    · rw [ih.1, hrow.1, List.range_succ_eq_map, List.flatMap_cons, List.flatMap_map,
        List.map_append, ← List.append_assoc]
      apply congrArg₂ List.append
      · apply congrArg (re.toList ++ ·)
        rw [Nat.add_zero, hrowEq, hrowList, List.map_map]
        exact List.map_congr_left fun j _ ↦ by
          simp only [Nat.sub_self, Nat.zero_add, Function.comp_apply]
      · apply congrArg (List.map _)
        exact List.flatMap_congr fun j _ ↦ by simp only [hidx j]
    · rw [ih.2, hrow.2, List.range_succ_eq_map, List.flatMap_cons, List.flatMap_map,
        List.map_append, ← List.append_assoc]
      apply congrArg₂ List.append
      · apply congrArg (im.toList ++ ·)
        rw [Nat.add_zero, hrowEq, hrowList, List.map_map]
        exact List.map_congr_left fun j _ ↦ by
          simp only [Nat.sub_self, Nat.zero_add, Function.comp_apply]
      · apply congrArg (List.map _)
        exact List.flatMap_congr fun j _ ↦ by simp only [hidx j]

private theorem decode_toList (rows : Array String) :
    (CellEncoding.decode rows).toList =
      (List.range rows.size).flatMap fun j ↦
        (CellEncoding.decodeRow (rows.getD j "")).toList := by
  have hflat : (CellEncoding.decode rows).toList =
      rows.toList.flatMap (fun r ↦ (CellEncoding.decodeRow r).toList) := by
    simp [CellEncoding.decode, Array.toList_flatMap]
  rw [hflat]
  have hrows : rows.toList = (List.range rows.size).map (fun j ↦ rows.getD j "") := by
    apply List.ext_getElem
    · simp
    · intro i h1 h2
      have hi : i < rows.size := by simpa using h1
      simp [Array.getD_eq_getD_getElem?, hi]
  rw [hrows, List.flatMap_map]

theorem decodeClipped_getD (rows : Array String) (scale idx : ℕ) :
    let p := CellEncoding.decodeClipped rows scale
    (p.1.getD idx 0, p.2.getD idx 0) =
      clipPair ((scale : ℤ) * scale) ((CellEncoding.decode rows)[idx]?.getD (0, 0)) := by
  have haux := decodeRowsClippedAux_toList rows ((scale : ℤ) * scale)
    rows.size (le_refl rows.size) (Array.mkEmpty 1048576) (Array.mkEmpty 1048576)
  have hempty : (Array.mkEmpty (α := ℤ) 1048576).toList = [] := by simp
  have hdec : ((List.range rows.size).flatMap fun j ↦
      (CellEncoding.decodeRow (rows.getD (rows.size - rows.size + j) "")).toList) =
      (CellEncoding.decode rows).toList := by
    rw [decode_toList]
    simp only [Nat.sub_self, Nat.zero_add]
  have h1 : (CellEncoding.decodeClipped rows scale).1.toList =
      (CellEncoding.decode rows).toList.map (fun q ↦ (clipPair ((scale : ℤ) * scale) q).1) := by
    change (CellEncoding.decodeRowsClippedAux rows ((scale : ℤ) * scale) rows.size
      (Array.mkEmpty 1048576) (Array.mkEmpty 1048576)).1.toList = _
    rw [haux.1, hempty, List.nil_append, hdec]
  have h2 : (CellEncoding.decodeClipped rows scale).2.toList =
      (CellEncoding.decode rows).toList.map (fun q ↦ (clipPair ((scale : ℤ) * scale) q).2) := by
    change (CellEncoding.decodeRowsClippedAux rows ((scale : ℤ) * scale) rows.size
      (Array.mkEmpty 1048576) (Array.mkEmpty 1048576)).2.toList = _
    rw [haux.2, hempty, List.nil_append, hdec]
  have hget : ∀ (a : Array ℤ) (f : ℤ × ℤ → ℤ),
      a.toList = (CellEncoding.decode rows).toList.map f →
      f (0, 0) = 0 →
      a.getD idx 0 = f ((CellEncoding.decode rows)[idx]?.getD (0, 0)) := by
    intro a f ha hf0
    rw [Array.getD_eq_getD_getElem?, ← Array.getElem?_toList, ha, List.getElem?_map,
      ← Array.getElem?_toList]
    cases (CellEncoding.decode rows).toList[idx]? with
    | none => exact hf0.symm
    | some v => rfl
  have hclip0 : clipPair ((scale : ℤ) * scale) (0, 0) = (0, 0) := by
    unfold clipPair
    have h0 : (0 : ℤ) ≤ (scale : ℤ) * scale := mul_nonneg (Nat.cast_nonneg _) (Nat.cast_nonneg _)
    simp [h0]
  dsimp only
  apply Prod.ext
  · exact hget _ _ h1 (congrArg Prod.fst hclip0)
  · exact hget _ _ h2 (congrArg Prod.snd hclip0)

theorem cellEntry_eq_decodeClipped (rows : Array String) (scale k i j : ℕ) :
    let p := CellEncoding.decodeClipped rows scale
    let idx := k * 16384 + (i * 128 + j)
    cellEntry (CellEncoding.decode rows) scale 128 k i j =
      ((p.1.getD idx 0 : ℂ) + (p.2.getD idx 0 : ℂ) * Complex.I) / (scale : ℂ) := by
  dsimp only
  have hidx : k * 128 * 128 + i * 128 + j = k * 16384 + (i * 128 + j) := by omega
  unfold cellEntry clippedCell
  dsimp only
  rw [hidx]
  have hd := decodeClipped_getD rows scale (k * 16384 + (i * 128 + j))
  dsimp only [clipPair] at hd
  split_ifs with h
  · have h1 := congrArg Prod.fst hd
    have h2 := congrArg Prod.snd hd
    simp only [h, ↓reduceIte] at h1 h2
    rw [h1, h2]
  · have h1 := congrArg Prod.fst hd
    have h2 := congrArg Prod.snd hd
    simp only [h, ↓reduceIte] at h1 h2
    rw [h1, h2]
    simp

/-! ### 2. Exact equality of `RadialCompute.momentsInt` / `radialRowInt` and symmetry -/

private theorem padd2_eq (x y : ℚ) (p : List ℚ) :
    RadialCompute.padd2 x y p = RadialCompute.padd [x, y] p := by
  cases p with
  | nil => rfl
  | cons u rest =>
    cases rest with
    | nil => rfl
    | cons v tail => rfl

private theorem pmulQuad_eq (b d : ℚ) (p : List ℚ) :
    RadialCompute.pmulQuad b d p = RadialCompute.pmul p [0, b, d] := by
  induction p with
  | nil => rfl
  | cons a p ih =>
    simp only [RadialCompute.pmulQuad, RadialCompute.pmul, RadialCompute.psmul,
      List.map_cons, List.map_nil, RadialCompute.padd, mul_zero, add_zero, padd2_eq, ih]

private theorem expPolyQuad_eq (b d : ℚ) (n : ℕ) :
    RadialCompute.expPolyQuad b d n = RadialCompute.expPoly [0, b, d] n := by
  induction n with
  | zero => rfl
  | succ n ih =>
    simp only [RadialCompute.expPolyQuad, RadialCompute.expPoly, ih, pmulQuad_eq]

private theorem pintLoop_eq (p : List ℚ) (h : ℚ) :
    ∀ (d : ℕ) (acc : ℚ),
      RadialCompute.pintLoop p d (-h) h ((-h) ^ d) (h ^ d) acc =
        acc + RadialCompute.pint p d (-h) h
  | d, acc => by
    induction p generalizing d acc with
    | nil => simp [RadialCompute.pintLoop, RadialCompute.pint]
    | cons a rest ih =>
      simp only [RadialCompute.pintLoop, RadialCompute.pint]
      rw [← pow_succ, ← pow_succ, ih (d + 1)]
      ring

private theorem fdiv_eq_rat_floor (a b : ℤ) (hb : 0 < b) :
    Int.fdiv a b = Rat.floor ((a : ℚ) / b) := by
  have hb0 : b ≠ 0 := ne_of_gt hb
  have hbq : (0 : ℚ) < (b : ℚ) := by exact_mod_cast hb
  change Int.fdiv a b = ⌊(a : ℚ) / b⌋
  symm
  rw [Int.floor_eq_iff, Int.fdiv_eq_ediv_of_nonneg a (le_of_lt hb)]
  constructor
  · rw [le_div_iff₀ hbq]
    exact_mod_cast Int.ediv_mul_le a hb0
  · rw [div_lt_iff₀ hbq]
    exact_mod_cast Int.lt_ediv_add_one_mul_self a hb

private theorem sqEnclInt_eq (P : ℕ) :
    ∀ (k : ℕ) (lo hi : ℤ),
      let s := RadialCompute.sqEnclInt ((2 : ℤ) ^ P) k (lo, hi)
      ((s.1 : ℚ) / 2 ^ P, (s.2 : ℚ) / 2 ^ P) =
        RadialCompute.squareEnclosure P k ((lo : ℚ) / 2 ^ P, (hi : ℚ) / 2 ^ P)
  | 0, lo, hi => rfl
  | k + 1, lo, hi => by
    have ih := sqEnclInt_eq P k lo hi
    set s := RadialCompute.sqEnclInt ((2 : ℤ) ^ P) k (lo, hi)
    have h2p : (0 : ℤ) < (2 : ℤ) ^ P := by positivity
    have h2q : (2 : ℚ) ^ P ≠ 0 := by positivity
    simp only [RadialCompute.sqEnclInt, RadialCompute.squareEnclosure, ← ih,
      RadialCompute.rdDown, RadialCompute.rdUp]
    apply Prod.ext
    · dsimp only
      have hsq : ((s.1 : ℚ) / 2 ^ P) ^ 2 * 2 ^ P = ((s.1 * s.1 : ℤ) : ℚ) / ((2 : ℤ) ^ P : ℤ) := by
        push_cast; field_simp
      rw [hsq, ← fdiv_eq_rat_floor (s.1 * s.1) ((2 : ℤ) ^ P) h2p]
    · dsimp only
      have hsq : -(((s.2 : ℚ) / 2 ^ P) ^ 2 * 2 ^ P) =
          ((-(s.2 * s.2) : ℤ) : ℚ) / ((2 : ℤ) ^ P : ℤ) := by
        push_cast; field_simp
      rw [hsq, ← fdiv_eq_rat_floor (-(s.2 * s.2)) ((2 : ℤ) ^ P) h2p]
      push_cast; rfl

private theorem expNegInt_eq (P n : ℕ) (x : ℚ) :
    let e := RadialCompute.expNegInt n ((2 : ℤ) ^ P) x
    ((e.1 : ℚ) / 2 ^ P, (e.2 : ℚ) / 2 ^ P) = RadialCompute.expNegEnclosure P n x := by
  dsimp only [RadialCompute.expNegInt, RadialCompute.expNegEnclosure]
  have h1024 : (1024 : ℚ) = 2 ^ 10 := by norm_num
  rw [h1024, sqEnclInt_eq]
  congr 1
  apply Prod.ext
  · dsimp only [RadialCompute.rdDown]
    have h2p : (0 : ℚ) < 2 ^ P := by positivity
    have hpow : (((2 : ℤ) ^ P : ℤ) : ℚ) = (2 : ℚ) ^ P := by push_cast; rfl
    rw [hpow]
    set z := Rat.floor (((RadialCompute.expTay (-(x / 2 ^ 10)) n).1 -
      RadialCompute.expRem (x / 2 ^ 10) n) * 2 ^ P)
    rcases le_total (0 : ℤ) z with hz | hz
    · have hzr : (0 : ℚ) ≤ (z : ℚ) / 2 ^ P := div_nonneg (by exact_mod_cast hz) h2p.le
      rw [max_eq_right hz, max_eq_right hzr]
    · have hzr : (z : ℚ) / 2 ^ P ≤ 0 := div_nonpos_of_nonpos_of_nonneg (by exact_mod_cast hz) h2p.le
      rw [max_eq_left hz, max_eq_left hzr, Int.cast_zero, zero_div]
  · dsimp only [RadialCompute.rdUp]
    push_cast; rfl

private theorem momentStepLoop_eq (P i : ℕ) (ea eb : ℤ × ℤ) :
    ∀ (rem k : ℕ) (acc : Array (ℤ × ℤ)),
      2 ≤ k →
      acc.size = k →
      let aN : ℤ := 3 * i
      let bN : ℤ := 3 * (i + 1)
      let a : ℚ := (aN : ℚ) / 64
      let b : ℚ := (bN : ℚ) / 64
      let eaQ : ℚ × ℚ := ((ea.1 : ℚ) / 2 ^ P, (ea.2 : ℚ) / 2 ^ P)
      let ebQ : ℚ × ℚ := ((eb.1 : ℚ) / 2 ^ P, (eb.2 : ℚ) / 2 ^ P)
      let toQ : ℤ × ℤ → ℚ × ℚ := fun p ↦ ((p.1 : ℚ) / 2 ^ P, (p.2 : ℚ) / 2 ^ P)
      ∀ (v0 v1 : ℚ × ℚ),
      acc.map toQ = RadialCompute.momentCache P a b eaQ ebQ v0 v1 k →
      (RadialCompute.momentStepLoop aN bN ea eb rem k (aN ^ k) (bN ^ k)
          (64 ^ k) (64 ^ (k - 1) * 32) acc).map toQ =
        RadialCompute.momentCache P a b eaQ ebQ v0 v1 (k + rem)
  | 0, k, acc, _, _, _, _, hacc => by simpa [RadialCompute.momentStepLoop] using hacc
  | rem + 1, k, acc, hk2, hsize, v0, v1, hacc => by
    set aN : ℤ := 3 * i
    set bN : ℤ := 3 * (i + 1)
    set a : ℚ := (aN : ℚ) / 64
    set b : ℚ := (bN : ℚ) / 64
    set eaQ : ℚ × ℚ := ((ea.1 : ℚ) / 2 ^ P, (ea.2 : ℚ) / 2 ^ P)
    set ebQ : ℚ × ℚ := ((eb.1 : ℚ) / 2 ^ P, (eb.2 : ℚ) / 2 ^ P)
    set toQ : ℤ × ℤ → ℚ × ℚ := fun p ↦ ((p.1 : ℚ) / 2 ^ P, (p.2 : ℚ) / 2 ^ P)
    conv_lhs => unfold RadialCompute.momentStepLoop
    dsimp only
    set prev := acc.getD (k - 2) (0, 0)
    set numLo := (k : ℤ) * prev.1 * (64 ^ (k - 1) * 32) + aN ^ k * ea.1 - bN ^ k * eb.2
    set numHi := (k : ℤ) * prev.2 * (64 ^ (k - 1) * 32) + aN ^ k * ea.2 - bN ^ k * eb.1
    set lo := Int.fdiv numLo (64 ^ k)
    set hi := -(Int.fdiv (-numHi) (64 ^ k))
    have hpowA : aN ^ k * aN = aN ^ (k + 1) := by rw [pow_succ]
    have hpowB : bN ^ k * bN = bN ^ (k + 1) := by rw [pow_succ]
    have hpowD : (64 : ℤ) ^ k * 64 = 64 ^ (k + 1) := by rw [pow_succ]
    have hpowH : (64 : ℤ) ^ (k - 1) * 32 * 64 = 64 ^ k * 32 := by
      have hk1 : k = (k - 1) + 1 := by omega
      conv_rhs => rw [hk1, pow_succ]
      ring
    rw [hpowA, hpowB, hpowD, hpowH]
    have hk_eq : k + (rem + 1) = (k + 1) + rem := by omega
    rw [hk_eq]
    apply momentStepLoop_eq P i ea eb rem (k + 1) (acc.push (lo, hi)) (by omega)
      (by simp [hsize]) v0 v1
    rw [Array.map_push, hacc]
    obtain ⟨m, rfl⟩ : ∃ m, k = m + 2 := ⟨k - 2, by omega⟩
    conv_rhs => unfold RadialCompute.momentCache
    dsimp only
    congr 1
    have hprev : (RadialCompute.momentCache P a b eaQ ebQ v0 v1 (m + 2))[m]?.getD (0, 0) =
        toQ prev := by
      rw [← hacc, Array.getElem?_map]
      have hm : m < acc.size := by omega
      simp only [prev, Array.getD_eq_getD_getElem?, Nat.add_sub_cancel,
        Array.getElem?_eq_getElem hm, Option.map_some, Option.getD_some]
    rw [hprev]
    have hdenPos : (0 : ℤ) < 64 ^ (m + 2) := by positivity
    have h2p : (2 : ℚ) ^ P ≠ 0 := by positivity
    have h64 : (64 : ℚ) ^ (m + 2) = 2 * (64 ^ (m + 1) * 32) := by
      rw [pow_succ]; ring
    have hLoEq : (((m + 2 : ℕ) : ℚ) / 2 * ((prev.1 : ℚ) / 2 ^ P) +
        a ^ (m + 2) * eaQ.1 - b ^ (m + 2) * ebQ.2) * 2 ^ P =
        (numLo : ℚ) / ((64 : ℤ) ^ (m + 2) : ℤ) := by
      simp only [numLo, a, b, eaQ, ebQ]
      push_cast
      rw [div_pow, div_pow, h64]
      field_simp
    have hHiEq : -((((m + 2 : ℕ) : ℚ) / 2 * ((prev.2 : ℚ) / 2 ^ P) +
        a ^ (m + 2) * eaQ.2 - b ^ (m + 2) * ebQ.1) * 2 ^ P) =
        ((-numHi : ℤ) : ℚ) / ((64 : ℤ) ^ (m + 2) : ℤ) := by
      simp only [numHi, a, b, eaQ, ebQ]
      push_cast
      rw [div_pow, div_pow, h64]
      field_simp
    unfold RadialCompute.momentStep RadialCompute.rdDown RadialCompute.rdUp
    dsimp only [toQ]
    apply Prod.ext
    · dsimp only [lo]
      have hcast : ((m : ℚ) + 2) / 2 = ((m + 2 : ℕ) : ℚ) / 2 := by push_cast; rfl
      rw [hcast, hLoEq, ← fdiv_eq_rat_floor numLo (64 ^ (m + 2)) hdenPos]
    · dsimp only [hi]
      have hcast : ((m : ℚ) + 2) / 2 = ((m + 2 : ℕ) : ℚ) / 2 := by push_cast; rfl
      rw [hcast, hHiEq, ← fdiv_eq_rat_floor (-numHi) (64 ^ (m + 2)) hdenPos]
      push_cast; rfl

private theorem fastMomentCellInt_eq (P n size i : ℕ) :
    (RadialCompute.fastMomentCellInt n size i ((2 : ℤ) ^ P)).map
        (fun p ↦ ((p.1 : ℚ) / 2 ^ P, (p.2 : ℚ) / 2 ^ P)) =
      RadialCompute.fastMomentCache P n (6 * i / 128) (6 * (i + 1) / 128) size := by
  have haEq : (6 : ℚ) * i / 128 = ((3 * i : ℤ) : ℚ) / 64 := by push_cast; ring
  have hbEq : (6 : ℚ) * ((i : ℚ) + 1) / 128 = ((3 * ((i : ℤ) + 1) : ℤ) : ℚ) / 64 := by
    push_cast; ring
  rw [haEq, hbEq]
  set aN : ℤ := 3 * i
  set bN : ℤ := 3 * (i + 1)
  set a : ℚ := (aN : ℚ) / 64
  set b : ℚ := (bN : ℚ) / 64
  set c : ℚ := (a + b) / 2
  set h : ℚ := (b - a) / 2
  set S := (RadialCompute.expPolyQuad (-2 * c) (-1) n).1
  have hS : S = (RadialCompute.expPoly [0, -2 * c, -1] n).1 := by
    simp [S, expPolyQuad_eq]
  have hp0 : RadialCompute.pintLoop S 0 (-h) h 1 1 0 = RadialCompute.pint S 0 (-h) h := by
    simpa using pintLoop_eq S h 0 0
  have hp1 : RadialCompute.pintLoop S 1 (-h) h (-h) h 0 = RadialCompute.pint S 1 (-h) h := by
    simpa using pintLoop_eq S h 1 0
  have hp2 : RadialCompute.pintLoop S 2 (-h) h (h * h) (h * h) 0 =
      RadialCompute.pint S 2 (-h) h := by
    have hsq : (-h) ^ 2 = h * h ∧ h ^ 2 = h * h := by constructor <;> ring
    simpa [hsq.1, hsq.2] using pintLoop_eq S h 2 0
  have hbase0 : 2 * (c * RadialCompute.pint S 0 (-h) h + RadialCompute.pint S 1 (-h) h) =
      RadialCompute.radialBase a b n 0 := by
    unfold RadialCompute.radialBase
    have h2 : List.range (0 + 2) = [0, 1] := by decide
    have hc0 : RadialCompute.choose 1 0 = 1 := by decide
    have hc1 : RadialCompute.choose 1 1 = 1 := by decide
    dsimp only
    rw [h2, ← hS]
    simp only [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil, add_zero, hc0, hc1]
    push_cast; ring
  have hbase1 : 2 * (c ^ 2 * RadialCompute.pint S 0 (-h) h +
      2 * c * RadialCompute.pint S 1 (-h) h + RadialCompute.pint S 2 (-h) h) =
      RadialCompute.radialBase a b n 1 := by
    unfold RadialCompute.radialBase
    have h3 : List.range (1 + 2) = [0, 1, 2] := by decide
    have hc0 : RadialCompute.choose 2 0 = 1 := by decide
    have hc1 : RadialCompute.choose 2 1 = 2 := by decide
    have hc2 : RadialCompute.choose 2 2 = 1 := by decide
    dsimp only
    rw [h3, ← hS]
    simp only [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil, add_zero, hc0, hc1, hc2]
    push_cast; ring
  have herr0 : RadialCompute.expRem (2 * c * h + h ^ 2) n * (2 * (b ^ 2 - a ^ 2) / 2) =
      RadialCompute.radialError a b n 0 := by
    unfold RadialCompute.radialError
    change RadialCompute.expRem (2 * c * h + h ^ 2) n * (2 * (b ^ 2 - a ^ 2) / 2) =
      RadialCompute.expRem (2 * c * h + h ^ 2) n * (2 * (b ^ (0 + 2) - a ^ (0 + 2)) / ((0 : ℚ) + 2))
    norm_num
  have herr1 : RadialCompute.expRem (2 * c * h + h ^ 2) n * (2 * (b ^ 3 - a ^ 3) / 3) =
      RadialCompute.radialError a b n 1 := by
    unfold RadialCompute.radialError
    change RadialCompute.expRem (2 * c * h + h ^ 2) n * (2 * (b ^ 3 - a ^ 3) / 3) =
      RadialCompute.expRem (2 * c * h + h ^ 2) n * (2 * (b ^ (1 + 2) - a ^ (1 + 2)) / ((1 : ℚ) + 2))
    norm_num
  have h2p : (2 : ℚ) ^ P ≠ 0 := by positivity
  have hX := expNegInt_eq P n (c ^ 2)
  have hea := expNegInt_eq P n (a ^ 2)
  have heb := expNegInt_eq P n (b ^ 2)
  have hmulDiv : ∀ (z : ℤ) (q : ℚ), (z : ℚ) / 2 ^ P * q * 2 ^ P = (z : ℚ) * q := by
    intro z q
    rw [mul_comm ((z : ℚ) / 2 ^ P) q, mul_assoc, div_mul_cancel₀ _ h2p, mul_comm]
  have hradPair : ∀ (lo hi : ℚ),
      let X := RadialCompute.expNegInt n ((2 : ℤ) ^ P) (c ^ 2)
      let Xq := RadialCompute.expNegEnclosure P n (c ^ 2)
      ((Rat.floor (if 0 ≤ lo then (X.1 : ℚ) * lo else (X.2 : ℚ) * lo) : ℚ) / 2 ^ P,
       ((-Rat.floor (-(if 0 ≤ hi then (X.2 : ℚ) * hi else (X.1 : ℚ) * hi)) : ℤ) : ℚ) / 2 ^ P) =
        (RadialCompute.rdDown (if 0 ≤ lo then Xq.1 * lo else Xq.2 * lo) P,
         RadialCompute.rdUp (if 0 ≤ hi then Xq.2 * hi else Xq.1 * hi) P) := by
    intro lo hi
    dsimp only [RadialCompute.rdDown, RadialCompute.rdUp]
    rw [← hX]
    apply Prod.ext
    · dsimp only
      congr 2
      by_cases hlo : 0 ≤ lo
      · rw [ite_eq_left hlo, ite_eq_left hlo, hmulDiv]
      · rw [ite_eq_right hlo, ite_eq_right hlo, hmulDiv]
    · dsimp only
      rw [Int.cast_neg]
      apply congrArg (fun z : ℤ ↦ -(z : ℚ) / 2 ^ P)
      apply congrArg Rat.floor
      apply congrArg Neg.neg
      by_cases hhi : 0 ≤ hi
      · rw [ite_eq_left hhi, ite_eq_left hhi, hmulDiv]
      · rw [ite_eq_right hhi, ite_eq_right hhi, hmulDiv]
  have hrad0 := hradPair (RadialCompute.radialBase a b n 0 - RadialCompute.radialError a b n 0)
    (RadialCompute.radialBase a b n 0 + RadialCompute.radialError a b n 0)
  have hrad1 := hradPair (RadialCompute.radialBase a b n 1 - RadialCompute.radialError a b n 1)
    (RadialCompute.radialBase a b n 1 + RadialCompute.radialError a b n 1)
  cases size with
  | zero =>
    simp [RadialCompute.fastMomentCellInt, RadialCompute.fastMomentCache,
      RadialCompute.momentCache]
  | succ s =>
    cases s with
    | zero =>
      have h1 : ∀ (x : ℤ × ℤ) (y : ℚ × ℚ),
          ((x.1 : ℚ) / 2 ^ P, (x.2 : ℚ) / 2 ^ P) = y →
          #[x].map (fun p ↦ ((p.1 : ℚ) / 2 ^ P, (p.2 : ℚ) / 2 ^ P)) = (#[]).push y := by
        intro x y hxy
        rw [← hxy]; simp
      have hlhs : RadialCompute.fastMomentCellInt n 1 i ((2 : ℤ) ^ P) =
          let X := RadialCompute.expNegInt n ((2 : ℤ) ^ P) (c ^ 2)
          let lo0 := 2 * (c * RadialCompute.pintLoop S 0 (-h) h 1 1 0 +
            RadialCompute.pintLoop S 1 (-h) h (-h) h 0) -
            RadialCompute.expRem (2 * c * h + h ^ 2) n * (2 * (b ^ 2 - a ^ 2) / 2)
          let hi0 := 2 * (c * RadialCompute.pintLoop S 0 (-h) h 1 1 0 +
            RadialCompute.pintLoop S 1 (-h) h (-h) h 0) +
            RadialCompute.expRem (2 * c * h + h ^ 2) n * (2 * (b ^ 2 - a ^ 2) / 2)
          #[(Rat.floor (if 0 ≤ lo0 then (X.1 : ℚ) * lo0 else (X.2 : ℚ) * lo0),
             -(Rat.floor (-(if 0 ≤ hi0 then (X.2 : ℚ) * hi0 else (X.1 : ℚ) * hi0))))] := rfl
      rw [hlhs, RadialCompute.fastMomentCache, RadialCompute.momentCache]
      dsimp only
      rw [hp0, hp1, hbase0, herr0]
      apply h1
      unfold RadialCompute.radialEnclosure
      exact hrad0
    | succ m =>
      have hlhs : RadialCompute.fastMomentCellInt n (m + 2) i ((2 : ℤ) ^ P) =
          let X := RadialCompute.expNegInt n ((2 : ℤ) ^ P) (c ^ 2)
          let lo0 := 2 * (c * RadialCompute.pintLoop S 0 (-h) h 1 1 0 +
            RadialCompute.pintLoop S 1 (-h) h (-h) h 0) -
            RadialCompute.expRem (2 * c * h + h ^ 2) n * (2 * (b ^ 2 - a ^ 2) / 2)
          let hi0 := 2 * (c * RadialCompute.pintLoop S 0 (-h) h 1 1 0 +
            RadialCompute.pintLoop S 1 (-h) h (-h) h 0) +
            RadialCompute.expRem (2 * c * h + h ^ 2) n * (2 * (b ^ 2 - a ^ 2) / 2)
          let lo1 := 2 * (c ^ 2 * RadialCompute.pintLoop S 0 (-h) h 1 1 0 +
            2 * c * RadialCompute.pintLoop S 1 (-h) h (-h) h 0 +
            RadialCompute.pintLoop S 2 (-h) h (h * h) (h * h) 0) -
            RadialCompute.expRem (2 * c * h + h ^ 2) n * (2 * (b ^ 3 - a ^ 3) / 3)
          let hi1 := 2 * (c ^ 2 * RadialCompute.pintLoop S 0 (-h) h 1 1 0 +
            2 * c * RadialCompute.pintLoop S 1 (-h) h (-h) h 0 +
            RadialCompute.pintLoop S 2 (-h) h (h * h) (h * h) 0) +
            RadialCompute.expRem (2 * c * h + h ^ 2) n * (2 * (b ^ 3 - a ^ 3) / 3)
          let init := ((Array.mkEmpty (m + 2)).push
            (Rat.floor (if 0 ≤ lo0 then (X.1 : ℚ) * lo0 else (X.2 : ℚ) * lo0),
             -(Rat.floor (-(if 0 ≤ hi0 then (X.2 : ℚ) * hi0 else (X.1 : ℚ) * hi0))))).push
            (Rat.floor (if 0 ≤ lo1 then (X.1 : ℚ) * lo1 else (X.2 : ℚ) * lo1),
             -(Rat.floor (-(if 0 ≤ hi1 then (X.2 : ℚ) * hi1 else (X.1 : ℚ) * hi1))))
          RadialCompute.momentStepLoop aN bN
            (RadialCompute.expNegInt n ((2 : ℤ) ^ P) (a ^ 2))
            (RadialCompute.expNegInt n ((2 : ℤ) ^ P) (b ^ 2))
            m 2 (aN * aN) (bN * bN) (64 * 64) (64 * 32) init := rfl
      rw [hlhs, RadialCompute.fastMomentCache]
      dsimp only
      rw [hp0, hp1, hp2, hbase0, hbase1, herr0, herr1]
      have hinit :
          let X := RadialCompute.expNegInt n ((2 : ℤ) ^ P) (c ^ 2)
          let lo0 := RadialCompute.radialBase a b n 0 - RadialCompute.radialError a b n 0
          let hi0 := RadialCompute.radialBase a b n 0 + RadialCompute.radialError a b n 0
          let lo1 := RadialCompute.radialBase a b n 1 - RadialCompute.radialError a b n 1
          let hi1 := RadialCompute.radialBase a b n 1 + RadialCompute.radialError a b n 1
          (((Array.mkEmpty (m + 2)).push
              (Rat.floor (if 0 ≤ lo0 then (X.1 : ℚ) * lo0 else (X.2 : ℚ) * lo0),
               -Rat.floor (-(if 0 ≤ hi0 then (X.2 : ℚ) * hi0 else (X.1 : ℚ) * hi0)))).push
              (Rat.floor (if 0 ≤ lo1 then (X.1 : ℚ) * lo1 else (X.2 : ℚ) * lo1),
               -Rat.floor (-(if 0 ≤ hi1 then (X.2 : ℚ) * hi1 else (X.1 : ℚ) * hi1)))).map
            (fun p ↦ ((p.1 : ℚ) / 2 ^ P, (p.2 : ℚ) / 2 ^ P)) =
          RadialCompute.momentCache P a b
            (((RadialCompute.expNegInt n ((2 : ℤ) ^ P) (a ^ 2)).1 : ℚ) / 2 ^ P,
             ((RadialCompute.expNegInt n ((2 : ℤ) ^ P) (a ^ 2)).2 : ℚ) / 2 ^ P)
            (((RadialCompute.expNegInt n ((2 : ℤ) ^ P) (b ^ 2)).1 : ℚ) / 2 ^ P,
             ((RadialCompute.expNegInt n ((2 : ℤ) ^ P) (b ^ 2)).2 : ℚ) / 2 ^ P)
            (RadialCompute.radialEnclosure P n a b 0)
            (RadialCompute.radialEnclosure P n a b 1) 2 := by
        dsimp only
        simp only [RadialCompute.momentCache, Array.map_push, Array.mkEmpty_eq, Array.map_empty]
        exact congrArg₂ (fun x y ↦ (#[].push x).push y) hrad0 hrad1
      have hstep := momentStepLoop_eq P i
        (RadialCompute.expNegInt n ((2 : ℤ) ^ P) (a ^ 2))
        (RadialCompute.expNegInt n ((2 : ℤ) ^ P) (b ^ 2))
        m 2 _ (le_refl 2) (by simp)
        (RadialCompute.radialEnclosure P n a b 0)
        (RadialCompute.radialEnclosure P n a b 1) hinit
      have hcomm : 2 + m = m + 2 := Nat.add_comm 2 m
      have ha2 : aN ^ 2 = aN * aN := pow_two aN
      have hb2 : bN ^ 2 = bN * bN := pow_two bN
      have h64_2 : (64 : ℤ) ^ 2 = 64 * 64 := by decide
      have h64_1 : (64 : ℤ) ^ (2 - 1) * 32 = 64 * 32 := by decide
      rw [hcomm, hea, heb, ha2, hb2, h64_2, h64_1] at hstep
      exact hstep

private def hermiteCoeffInt (p q k : ℕ) : ℤ :=
  (-1 : ℤ) ^ k * (p.choose k : ℤ) * (q.descFactorial k : ℤ)

private theorem hermiteCoeffInt_cast (p q k : ℕ) :
    (hermiteCoeffInt p q k : ℚ) = RadialCompute.hermiteCoefficient p q k := by
  simp only [hermiteCoeffInt, RadialCompute.hermiteCoefficient,
    RadialCompute.choose_eq, RadialCompute.descending_eq]
  push_cast; rfl

private theorem hermiteCoeffInt_step (p q k : ℕ) :
    -(hermiteCoeffInt p q k * ((p : ℤ) - k) * ((q : ℤ) - k)) / ((k : ℤ) + 1) =
      hermiteCoeffInt p q (k + 1) := by
  by_cases hkp : k < p
  · by_cases hkq : k < q
    · have hch : (k + 1) * p.choose (k + 1) = (p - k) * p.choose k := by
        simpa [Nat.mul_comm] using Nat.choose_succ_right_eq p k
      have hdesc : q.descFactorial (k + 1) = (q - k) * q.descFactorial k :=
        Nat.descFactorial_succ q k
      have hnum : -(hermiteCoeffInt p q k * ((p : ℤ) - k) * ((q : ℤ) - k)) =
          ((k : ℤ) + 1) * hermiteCoeffInt p q (k + 1) := by
        unfold hermiteCoeffInt
        have hpz : ((p - k : ℕ) : ℤ) = (p : ℤ) - k := Nat.cast_sub (by omega)
        have hqz : ((q - k : ℕ) : ℤ) = (q : ℤ) - k := Nat.cast_sub (by omega)
        have hchz : ((k + 1 : ℕ) : ℤ) * (p.choose (k + 1) : ℤ) =
            ((p - k : ℕ) : ℤ) * (p.choose k : ℤ) := by exact_mod_cast hch
        have hdescz : (q.descFactorial (k + 1) : ℤ) =
            ((q - k : ℕ) : ℤ) * (q.descFactorial k : ℤ) := by exact_mod_cast hdesc
        rw [hpz] at hchz
        rw [hqz] at hdescz
        rw [pow_succ, hdescz]
        push_cast at hchz ⊢
        linear_combination (-1 : ℤ) ^ k * ((q : ℤ) - k) * (q.descFactorial k : ℤ) * hchz
      rw [hnum, Int.mul_ediv_cancel_left _ (by omega)]
    · have hq0 : q.descFactorial (k + 1) = 0 := Nat.descFactorial_eq_zero_iff_lt.mpr (by omega)
      have hsub : q.descFactorial k = 0 ∨ (q : ℤ) - k = 0 := by
        by_cases h : q = k
        · right; omega
        · left; exact Nat.descFactorial_eq_zero_iff_lt.mpr (by omega)
      unfold hermiteCoeffInt
      rw [hq0]
      rcases hsub with h0 | h0 <;> simp [h0]
  · have hp0 : p.choose (k + 1) = 0 := Nat.choose_eq_zero_of_lt (by omega)
    have hsub : p.choose k = 0 ∨ (p : ℤ) - k = 0 := by
      by_cases h : p = k
      · right; omega
      · left; exact Nat.choose_eq_zero_of_lt (by omega)
    unfold hermiteCoeffInt
    rw [hp0]
    rcases hsub with h0 | h0 <;> simp [h0]

private theorem hermiteCoeffsIntAux_toList (p q : ℕ) :
    ∀ (rem k : ℕ) (acc : Array ℤ),
      (RadialCompute.hermiteCoeffsIntAux p q rem k (hermiteCoeffInt p q k) acc).toList =
        acc.toList ++ (List.range rem).map (fun j ↦ hermiteCoeffInt p q (k + 1 + j))
  | 0, _, acc => by simp [RadialCompute.hermiteCoeffsIntAux]
  | rem + 1, k, acc => by
    conv_lhs => unfold RadialCompute.hermiteCoeffsIntAux
    dsimp only
    rw [hermiteCoeffInt_step p q k, hermiteCoeffsIntAux_toList p q rem (k + 1),
      Array.toList_push, List.range_succ_eq_map, List.map_cons, List.map_map,
      List.append_assoc, List.singleton_append]
    congr 2
    exact List.map_congr_left fun j _ ↦ by congr 1; omega

private theorem hermiteCoeffsInt_spec (p q : ℕ) :
    (RadialCompute.hermiteCoeffsInt p q).size = min p q + 1 ∧
    ∀ k ≤ min p q, (RadialCompute.hermiteCoeffsInt p q).getD k 0 = hermiteCoeffInt p q k := by
  have hlist : (RadialCompute.hermiteCoeffsInt p q).toList =
      (List.range (min p q + 1)).map (hermiteCoeffInt p q) := by
    unfold RadialCompute.hermiteCoeffsInt
    have h0 : (1 : ℤ) = hermiteCoeffInt p q 0 := by simp [hermiteCoeffInt]
    have h1 := hermiteCoeffsIntAux_toList p q (min p q) 0
      ((Array.mkEmpty (min p q + 1)).push 1)
    rw [← h0] at h1
    rw [h1, Array.toList_push, Array.mkEmpty_eq, Array.toList_empty, List.nil_append,
      List.range_succ_eq_map, List.map_cons, List.map_map, h0, List.singleton_append]
    congr 1
    exact List.map_congr_left fun j _ ↦ by
      simp only [Function.comp_apply, Nat.zero_add, Nat.add_comm]
  constructor
  · rw [← Array.length_toList, hlist, List.length_map, List.length_range]
  · intro k hk
    rw [Array.getD_eq_getD_getElem?, ← Array.getElem?_toList, hlist, List.getElem?_map,
      List.getElem?_range (by omega)]
    simp

private theorem hermiteCellIntAux_eq (P p q : ℕ) (cell : Array (ℤ × ℤ)) :
    let coeffs := RadialCompute.hermiteCoeffsInt p q
    let toQ : ℤ × ℤ → ℚ × ℚ := fun v ↦ ((v.1 : ℚ) / 2 ^ P, (v.2 : ℚ) / 2 ^ P)
    ∀ (m : ℕ), m ≤ min p q + 1 → ∀ (lo hi : ℤ),
      let r := RadialCompute.hermiteCellIntAux coeffs cell (p + q) m lo hi
      ((r.1 : ℚ) / 2 ^ P = (lo : ℚ) / 2 ^ P +
        ((List.range m).map fun k ↦
          let c := RadialCompute.hermiteCoefficient p q k
          let t := (cell.map toQ)[p - k + (q - k)]?.getD (0, 0)
          c * if 0 ≤ c then t.1 else t.2).sum) ∧
      ((r.2 : ℚ) / 2 ^ P = (hi : ℚ) / 2 ^ P +
        ((List.range m).map fun k ↦
          let c := RadialCompute.hermiteCoefficient p q k
          let t := (cell.map toQ)[p - k + (q - k)]?.getD (0, 0)
          c * if 0 ≤ c then t.2 else t.1).sum)
  | 0, _, lo, hi => by simp [RadialCompute.hermiteCellIntAux]
  | k + 1, hk, lo, hi => by
    set coeffs := RadialCompute.hermiteCoeffsInt p q
    set toQ : ℤ × ℤ → ℚ × ℚ := fun v ↦ ((v.1 : ℚ) / 2 ^ P, (v.2 : ℚ) / 2 ^ P)
    have hcs := (hermiteCoeffsInt_spec p q).2 k (by omega)
    have hcq : (coeffs.getD k 0 : ℚ) = RadialCompute.hermiteCoefficient p q k := by
      rw [hcs, hermiteCoeffInt_cast]
    have hidx : p - k + (q - k) = p + q - 2 * k := by omega
    have hcell : (cell.map toQ)[p + q - 2 * k]?.getD (0, 0) =
        toQ (cell.getD (p + q - 2 * k) (0, 0)) := by
      rw [Array.getElem?_map, Array.getD_eq_getD_getElem?]
      cases cell[p + q - 2 * k]? with
      | none => simp [toQ]
      | some v => simp
    have hstep : RadialCompute.hermiteCellIntAux coeffs cell (p + q) (k + 1) lo hi =
        let c := coeffs.getD k 0
        let t := cell.getD (p + q - 2 * k) (0, 0)
        if 0 ≤ c then
          RadialCompute.hermiteCellIntAux coeffs cell (p + q) k (lo + c * t.1) (hi + c * t.2)
        else
          RadialCompute.hermiteCellIntAux coeffs cell (p + q) k (lo + c * t.2) (hi + c * t.1) :=
      rfl
    dsimp only
    rw [hstep]
    by_cases hc : 0 ≤ coeffs.getD k 0
    · have hcq_nn : (0 : ℚ) ≤ RadialCompute.hermiteCoefficient p q k := by
        rw [← hcq]; exact_mod_cast hc
      have ih := hermiteCellIntAux_eq P p q cell k (by omega)
        (lo + coeffs.getD k 0 * (cell.getD (p + q - 2 * k) (0, 0)).1)
        (hi + coeffs.getD k 0 * (cell.getD (p + q - 2 * k) (0, 0)).2)
      simp only [hc, ↓reduceIte]
      constructor
      · rw [List.range_succ, List.map_append, List.map_cons, List.map_nil,
          List.sum_append, List.sum_cons, List.sum_nil, add_zero, hidx, hcell,
          ite_eq_left hcq_nn, ih.1, ← hcq]
        dsimp only [toQ]; push_cast; ring
      · rw [List.range_succ, List.map_append, List.map_cons, List.map_nil,
          List.sum_append, List.sum_cons, List.sum_nil, add_zero, hidx, hcell,
          ite_eq_left hcq_nn, ih.2, ← hcq]
        dsimp only [toQ]; push_cast; ring
    · have hcq_neg : ¬ (0 : ℚ) ≤ RadialCompute.hermiteCoefficient p q k := by
        rw [← hcq]; exact_mod_cast hc
      have ih := hermiteCellIntAux_eq P p q cell k (by omega)
        (lo + coeffs.getD k 0 * (cell.getD (p + q - 2 * k) (0, 0)).2)
        (hi + coeffs.getD k 0 * (cell.getD (p + q - 2 * k) (0, 0)).1)
      simp only [hc, ↓reduceIte]
      constructor
      · rw [List.range_succ, List.map_append, List.map_cons, List.map_nil,
          List.sum_append, List.sum_cons, List.sum_nil, add_zero, hidx, hcell,
          ite_eq_right hcq_neg, ih.1, ← hcq]
        dsimp only [toQ]; push_cast; ring
      · rw [List.range_succ, List.map_append, List.map_cons, List.map_nil,
          List.sum_append, List.sum_cons, List.sum_nil, add_zero, hidx, hcell,
          ite_eq_right hcq_neg, ih.2, ← hcq]
        dsimp only [toQ]; push_cast; ring

theorem radialRowInt_eq (P n size p q : ℕ) :
    RadialCompute.radialRowInt P p q (RadialCompute.momentsInt P n 128 size) =
      RadialCompute.radialRow P p q (moments P n 128 size 6) := by
  rw [RadialCompute.radialRow_eq_map]
  unfold RadialCompute.radialRowInt RadialCompute.momentsInt moments
  rw [Array.map_ofFn, Array.map_ofFn]
  apply congrArg Array.ofFn
  funext i
  dsimp only [Function.comp_apply, RadialCompute.normalizedFromCache]
  apply congrArg RadialCompute.fixedI
  apply congrArg (GrotheQuad.mulI P (RadialCompute.normalization P p q))
  have h128 : ((128 : ℕ) : ℚ) = 128 := by norm_num
  simp only [h128]
  rw [← fastMomentCellInt_eq P n size i.val]
  set cell := RadialCompute.fastMomentCellInt n size i.val ((2 : ℤ) ^ P)
  set toQ : ℤ × ℤ → ℚ × ℚ := fun v ↦ ((v.1 : ℚ) / 2 ^ P, (v.2 : ℚ) / 2 ^ P)
  have hsize := (hermiteCoeffsInt_spec p q).1
  rw [hsize]
  have hcell := hermiteCellIntAux_eq P p q cell (min p q + 1) (le_refl _) 0 0
  set v := RadialCompute.hermiteCellIntAux (RadialCompute.hermiteCoeffsInt p q)
    cell (p + q) (min p q + 1) 0 0
  have htail : ∀ (f : ℕ → ℚ), (∀ k, min p q + 1 ≤ k → f k = 0) →
      ((List.range (p + 1)).map f).sum = ((List.range (min p q + 1)).map f).sum := by
    intro f hf
    have hsplit : List.range (p + 1) =
        List.range (min p q + 1) ++ (List.range (p - min p q)).map (fun j ↦ min p q + 1 + j) := by
      have : p + 1 = (min p q + 1) + (p - min p q) := by omega
      rw [this, List.range_add]
    rw [hsplit, List.map_append, List.sum_append]
    have hzero : ((List.range (p - min p q)).map (fun j ↦ min p q + 1 + j) |>.map f).sum = 0 := by
      rw [List.map_map]
      have hall : ∀ x ∈ (List.range (p - min p q)).map (f ∘ fun j ↦ min p q + 1 + j), x = 0 := by
        intro x hx
        rcases List.mem_map.mp hx with ⟨j, _, rfl⟩
        exact hf (min p q + 1 + j) (by omega)
      exact List.sum_eq_zero hall
    rw [hzero, add_zero]
  have hzero_coeff : ∀ k, min p q + 1 ≤ k → RadialCompute.hermiteCoefficient p q k = 0 := by
    intro k hk
    rw [← hermiteCoeffInt_cast]
    unfold hermiteCoeffInt
    rcases le_total p q with hpq | hqp
    · have : p.choose k = 0 := Nat.choose_eq_zero_of_lt (by omega)
      simp [this]
    · have : q.descFactorial k = 0 := Nat.descFactorial_eq_zero_iff_lt.mpr (by omega)
      simp [this]
  have hv1 : (RadialCompute.hermiteFromCache p q (cell.map toQ)).1 = (v.1 : ℚ) / 2 ^ P := by
    unfold RadialCompute.hermiteFromCache
    dsimp only
    rw [htail _ (fun k hk ↦ by simp only [hzero_coeff k hk, zero_mul]),
      ← zero_add (((List.range _).map _).sum)]
    simpa only [Int.cast_zero, zero_div] using hcell.1.symm
  have hv2 : (RadialCompute.hermiteFromCache p q (cell.map toQ)).2 = (v.2 : ℚ) / 2 ^ P := by
    unfold RadialCompute.hermiteFromCache
    dsimp only
    rw [htail _ (fun k hk ↦ by simp only [hzero_coeff k hk, zero_mul]),
      ← zero_add (((List.range _).map _).sum)]
    simpa only [Int.cast_zero, zero_div] using hcell.2.symm
  unfold RadialCompute.rationalBoundsFloat
  rw [hv1, hv2]
  have h2p : (2 : ℚ) ^ P ≠ 0 := by positivity
  have hmul1 : (v.1 : ℚ) / 2 ^ P * 2 ^ P = (v.1 : ℚ) := div_mul_cancel₀ _ h2p
  have hmul2 : -((v.2 : ℚ) / 2 ^ P * 2 ^ P) = ((-v.2 : ℤ) : ℚ) := by
    rw [div_mul_cancel₀ _ h2p]; push_cast; rfl
  rw [hmul1, hmul2]
  have hf1 : Rat.floor (v.1 : ℚ) = v.1 := Rat.floor_intCast v.1
  have hf2 : Rat.floor ((-v.2 : ℤ) : ℚ) = -v.2 := Rat.floor_intCast (-v.2)
  rw [hf1, hf2, neg_neg]

private theorem radialHermiteCoeff_comm (p q k : ℕ) :
    radialHermiteCoeff p q k = radialHermiteCoeff q p k := by
  unfold radialHermiteCoeff
  have h1 : p.descFactorial k = k.factorial * p.choose k :=
    Nat.descFactorial_eq_factorial_mul_choose p k
  have h2 : q.descFactorial k = k.factorial * q.choose k :=
    Nat.descFactorial_eq_factorial_mul_choose q k
  have hnat : p.choose k * q.descFactorial k = q.choose k * p.descFactorial k := by
    rw [h1, h2]; ring
  have hq : ((p.choose k * q.descFactorial k : ℕ) : ℚ) =
      ((q.choose k * p.descFactorial k : ℕ) : ℚ) := by exact_mod_cast hnat
  push_cast at hq
  linear_combination (-1 : ℚ) ^ k * hq

theorem normalizedRadialMoment_comm (p q : ℕ) (a b : ℝ) :
    normalizedRadialMoment p q a b = normalizedRadialMoment q p a b := by
  unfold normalizedRadialMoment
  have hnrm : UpperChaos.nrm p q = UpperChaos.nrm q p := by
    unfold UpperChaos.nrm
    rw [Nat.mul_comm p.factorial q.factorial]
  rw [hnrm]
  congr 1
  unfold radialHermiteMoment
  apply intervalIntegral.integral_congr
  intro r _
  dsimp only
  congr 1
  unfold radialHermite
  have hzero : ∀ a b k : ℕ, min a b + 1 ≤ k → radialHermiteCoeff a b k = 0 := by
    intro a b k hk
    unfold radialHermiteCoeff
    rcases le_total a b with hab | hba
    · simp [Nat.choose_eq_zero_of_lt (by omega : a < k)]
    · simp [Nat.descFactorial_eq_zero_iff_lt.mpr (by omega : b < k)]
  have htrim : ∀ a b : ℕ,
      ∑ k ∈ Finset.range (a + 1), (radialHermiteCoeff a b k : ℝ) * r ^ (a - k + (b - k)) =
      ∑ k ∈ Finset.range (min a b + 1), (radialHermiteCoeff a b k : ℝ) * r ^ (a - k + (b - k)) := by
    intro a b
    symm
    apply Finset.sum_subset (Finset.range_mono (by omega))
    intro k hk hnot
    rw [Finset.mem_range] at hk hnot
    simp [hzero a b k (by omega)]
  rw [htrim p q, htrim q p, min_comm p q]
  apply Finset.sum_congr rfl
  intro k _
  rw [radialHermiteCoeff_comm p q k, add_comm (p - k) (q - k)]

/-! ### 3. Soundness of `GrotheQuad.mulBT` -/

def memFx (x : ℝ) (a : GrotheQuad.Fx) : Prop :=
  (a.lo : ℝ) ≤ x * (2 : ℝ) ^ GrotheQuad.KFix ∧ x * (2 : ℝ) ^ GrotheQuad.KFix ≤ (a.hi : ℝ)

private def memFx2 (x : ℝ) (p : ℤ × ℤ) : Prop :=
  (p.1 : ℝ) ≤ x * (2 : ℝ) ^ (2 * GrotheQuad.KFix) ∧
    x * (2 : ℝ) ^ (2 * GrotheQuad.KFix) ≤ (p.2 : ℝ)

theorem mem_fxToI_iff {x : ℝ} {a : GrotheQuad.Fx} :
    Upper.mem x (fxToI a) ↔ memFx x a := by
  simp only [Upper.mem, fxToI, memFx, GrotheKernel.D, GrotheKernel.K, GrotheQuad.KFix,
    Int.cast_pow, Int.cast_ofNat]

private theorem memFx2_zero : memFx2 0 (0, 0) := by
  simp [memFx2]

private theorem memFx2_addPair {x y : ℝ} {a b : ℤ × ℤ} (hx : memFx2 x a) (hy : memFx2 y b) :
    memFx2 (x + y) (GrotheQuad.addPair a b) := by
  unfold memFx2 GrotheQuad.addPair at *
  push_cast
  constructor <;> linarith [hx.1, hx.2, hy.1, hy.2]

private theorem memFx2_mulFx {x y : ℝ} {a b : GrotheQuad.Fx}
    (hx : memFx x a) (hy : memFx y b) :
    memFx2 (x * y) (GrotheQuad.mulFx a b) := by
  have hsc : x * y * (2 : ℝ) ^ (2 * GrotheQuad.KFix) =
      (x * 2 ^ GrotheQuad.KFix) * (y * 2 ^ GrotheQuad.KFix) := by
    rw [two_mul, pow_add]; ring
  unfold memFx2
  rw [hsc]
  obtain ⟨hx1, hx2⟩ := hx
  obtain ⟨hy1, hy2⟩ := hy
  unfold GrotheQuad.mulFx
  split_ifs with ha1 hb1 hb2 ha2 hb3 hb4 hb5 hb6
  · have : (0 : ℝ) ≤ a.lo := by exact_mod_cast ha1
    have : (0 : ℝ) ≤ b.lo := by exact_mod_cast hb1
    push_cast; constructor <;> nlinarith
  · have : (0 : ℝ) ≤ a.lo := by exact_mod_cast ha1
    have : (b.hi : ℝ) ≤ 0 := by exact_mod_cast hb2
    push_cast; constructor <;> nlinarith
  · have : (0 : ℝ) ≤ a.lo := by exact_mod_cast ha1
    have : (b.lo : ℝ) < 0 := by exact_mod_cast Int.lt_of_not_ge hb1
    have : (0 : ℝ) < b.hi := by exact_mod_cast Int.lt_of_not_ge hb2
    push_cast; constructor <;> nlinarith
  · have : (a.hi : ℝ) ≤ 0 := by exact_mod_cast ha2
    have : (0 : ℝ) ≤ b.lo := by exact_mod_cast hb3
    push_cast; constructor <;> nlinarith
  · have : (a.hi : ℝ) ≤ 0 := by exact_mod_cast ha2
    have : (b.hi : ℝ) ≤ 0 := by exact_mod_cast hb4
    push_cast; constructor <;> nlinarith
  · have : (a.hi : ℝ) ≤ 0 := by exact_mod_cast ha2
    have : (b.lo : ℝ) < 0 := by exact_mod_cast Int.lt_of_not_ge hb3
    have : (0 : ℝ) < b.hi := by exact_mod_cast Int.lt_of_not_ge hb4
    push_cast; constructor <;> nlinarith
  · have : (a.lo : ℝ) < 0 := by exact_mod_cast Int.lt_of_not_ge ha1
    have : (0 : ℝ) < a.hi := by exact_mod_cast Int.lt_of_not_ge ha2
    have : (0 : ℝ) ≤ b.lo := by exact_mod_cast hb5
    push_cast; constructor <;> nlinarith
  · have : (a.lo : ℝ) < 0 := by exact_mod_cast Int.lt_of_not_ge ha1
    have : (0 : ℝ) < a.hi := by exact_mod_cast Int.lt_of_not_ge ha2
    have : (b.hi : ℝ) ≤ 0 := by exact_mod_cast hb6
    push_cast; constructor <;> nlinarith
  · have : (a.lo : ℝ) < 0 := by exact_mod_cast Int.lt_of_not_ge ha1
    have : (0 : ℝ) < a.hi := by exact_mod_cast Int.lt_of_not_ge ha2
    have : (b.lo : ℝ) < 0 := by exact_mod_cast Int.lt_of_not_ge hb5
    have : (0 : ℝ) < b.hi := by exact_mod_cast Int.lt_of_not_ge hb6
    push_cast
    set X := x * (2 : ℝ) ^ GrotheQuad.KFix
    set Y := y * (2 : ℝ) ^ GrotheQuad.KFix
    constructor
    · rcases le_total 0 X with hX | hX <;> rcases le_total 0 Y with hY | hY
      · exact le_trans (min_le_left _ _) (le_trans (min_le_right _ _) (by nlinarith))
      · exact le_trans (min_le_right _ _) (le_trans (min_le_left _ _) (by nlinarith))
      · exact le_trans (min_le_left _ _) (le_trans (min_le_right _ _) (by nlinarith))
      · exact le_trans (min_le_right _ _) (le_trans (min_le_left _ _) (by nlinarith))
    · rcases le_total 0 X with hX | hX <;> rcases le_total 0 Y with hY | hY
      · exact le_trans (by nlinarith) (le_trans (le_max_right _ _) (le_max_right _ _))
      · exact le_trans (by nlinarith) (le_trans (le_max_left _ _) (le_max_left _ _))
      · exact le_trans (by nlinarith) (le_trans (le_max_left _ _) (le_max_left _ _))
      · exact le_trans (by nlinarith) (le_trans (le_max_left _ _) (le_max_left _ _))

private theorem memFx_roundFx {x : ℝ} {p : ℤ × ℤ} (h : memFx2 x p) :
    memFx x (GrotheQuad.roundFx p) := by
  unfold memFx2 at h
  rw [two_mul, pow_add] at h
  unfold memFx GrotheQuad.roundFx
  have hpos : (0 : ℝ) < (2 : ℝ) ^ GrotheQuad.KFix := by positivity
  have h1 := UpperQuad.shDown_mul_le GrotheQuad.KFix p.1
  have h2 := UpperQuad.le_shUp_mul GrotheQuad.KFix p.2
  have h' : (p.1 : ℝ) ≤ x * 2 ^ GrotheQuad.KFix * 2 ^ GrotheQuad.KFix ∧
      x * 2 ^ GrotheQuad.KFix * 2 ^ GrotheQuad.KFix ≤ p.2 := by
    rw [mul_assoc]; exact h
  constructor
  · exact le_of_mul_le_mul_right (h1.trans h'.1) hpos
  · exact le_of_mul_le_mul_right (h'.2.trans h2) hpos

private theorem memFx2_sumPairs {f : ℕ → ℝ} {g : ℕ → ℤ × ℤ} (n : ℕ)
    (h : ∀ k < n, memFx2 (f k) (g k)) :
    memFx2 (∑ k ∈ Finset.range n, f k) (GrotheQuad.sumPairs n g) := by
  induction n with
  | zero => simpa [GrotheQuad.sumPairs] using memFx2_zero
  | succ n ih =>
    simp only [GrotheQuad.sumPairs, List.range_succ, List.foldl_append, List.foldl_cons,
      List.foldl_nil, Finset.sum_range_succ]
    exact memFx2_addPair (ih fun k hk ↦ h k (by omega)) (h n (by omega))

private theorem getFx_ofFn (r cols : ℕ) (f : ℕ → ℕ → GrotheQuad.Fx) {i j : ℕ}
    (hi : i < r) (hj : j < cols) :
    GrotheQuad.getFx
      (Array.ofFn fun i : Fin r ↦ Array.ofFn fun j : Fin cols ↦ f i.val j.val) i j = f i j := by
  unfold GrotheQuad.getFx
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, hi, hj, ↓reduceDIte,
    Option.getD_some]

theorem memFx_mulBT_entry {B T : ℕ → ℝ} {B' T' : Array (Array GrotheQuad.Fx)} {rows r i j : ℕ}
    (hi : i < rows) (hj : j < r)
    (hB : ∀ k < r, memFx (B k) (GrotheQuad.getFx B' i k))
    (hT : ∀ k < r, memFx (T k) (GrotheQuad.getFx T' j k)) :
    memFx (∑ k ∈ Finset.range r, B k * T k)
      (GrotheQuad.getFx (GrotheQuad.mulBT B' rows T' r) i j) := by
  unfold GrotheQuad.mulBT
  rw [getFx_ofFn rows r
    (fun i j ↦ GrotheQuad.roundFx (GrotheQuad.sumPairs r fun k ↦
      GrotheQuad.mulFx (GrotheQuad.getFx B' i k) (GrotheQuad.getFx T' j k))) hi hj]
  apply memFx_roundFx
  apply memFx2_sumPairs
  intro k hk
  exact memFx2_mulFx (hB k hk) (hT k hk)

private theorem getFx_extract {M : Array (Array GrotheQuad.Fx)} {s e i j : ℕ}
    (hi : i < e - s) (he : e ≤ M.size) :
    GrotheQuad.getFx (M.extract s e) i j = GrotheQuad.getFx M (s + i) j := by
  unfold GrotheQuad.getFx
  have h1 : i < (M.extract s e).size := by rw [Array.size_extract]; omega
  have h2 : s + i < M.size := by omega
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_eq_getElem h1,
    Array.getElem?_eq_getElem h2, Option.getD_some, Array.getElem_extract]

private theorem getFx_append_left {A B : Array (Array GrotheQuad.Fx)} {i j : ℕ}
    (hi : i < A.size) :
    GrotheQuad.getFx (A ++ B) i j = GrotheQuad.getFx A i j := by
  unfold GrotheQuad.getFx
  have h1 : i < (A ++ B).size := by rw [Array.size_append]; omega
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_eq_getElem h1,
    Array.getElem?_eq_getElem hi, Option.getD_some, Array.getElem_append_left hi]

private theorem getFx_append_right {A B : Array (Array GrotheQuad.Fx)} {i j : ℕ}
    (hi : i < B.size) :
    GrotheQuad.getFx (A ++ B) (A.size + i) j = GrotheQuad.getFx B i j := by
  unfold GrotheQuad.getFx
  have h1 : A.size + i < (A ++ B).size := by rw [Array.size_append]; omega
  have hge : A.size ≤ A.size + i := Nat.le_add_right _ _
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_eq_getElem h1,
    Array.getElem?_eq_getElem hi, Option.getD_some, Array.getElem_append_right hge,
    Nat.add_sub_cancel_left]

private theorem getFx_append_right_of_eq {A B : Array (Array GrotheQuad.Fx)} {s i j : ℕ}
    (hs : A.size = s) (hi : i < B.size) :
    GrotheQuad.getFx (A ++ B) (s + i) j = GrotheQuad.getFx B i j := by
  subst hs
  exact getFx_append_right hi

/-! ### 4. Soundness of the exact-integer radix-8×8 angular butterfly -/

private def ComplexClose (z : ℂ) (ar ai e : ℤ) : Prop :=
  |(D : ℝ) * z.re - ar| ≤ e ∧ |(D : ℝ) * z.im - ai| ≤ e

private theorem iabs_cast (x : ℤ) : ((iabs x : ℤ) : ℝ) = |(x : ℝ)| := by
  unfold iabs
  split_ifs with h
  · have h' : (x : ℝ) < 0 := by exact_mod_cast h
    rw [Int.cast_neg, abs_of_neg h']
  · have h' : (0 : ℝ) ≤ x := by exact_mod_cast not_lt.mp h
    rw [abs_of_nonneg h']

private theorem ComplexClose_zero : ComplexClose 0 0 0 0 := by
  simp [ComplexClose]

private theorem ComplexClose_of_memC {z : ℂ} {c : CI} (hz : memC z c) :
    ComplexClose z (rootMidRe c) (rootMidIm c) (rootRad c) := by
  obtain ⟨⟨hr1, hr2⟩, ⟨hi1, hi2⟩⟩ := hz
  have hf : ∀ (lo hi : ℤ) (x : ℝ), (lo : ℝ) ≤ x * D → x * D ≤ hi →
      |(D : ℝ) * x - Int.fdiv (lo + hi) 2| ≤ ((hi - Int.fdiv (lo + hi) 2 : ℤ) : ℝ) := by
    intro lo hi x h1 h2'
    have hdiv : 2 * Int.fdiv (lo + hi) 2 ≤ lo + hi ∧
        lo + hi ≤ 2 * Int.fdiv (lo + hi) 2 + 1 := by
      rw [Int.fdiv_eq_ediv_of_nonneg _ (by decide)]
      omega
    have hlo_le : 2 * Int.fdiv (lo + hi) 2 - hi ≤ lo := by omega
    have hlo_r : ((2 * Int.fdiv (lo + hi) 2 - hi : ℤ) : ℝ) ≤ lo := by exact_mod_cast hlo_le
    push_cast at hlo_r ⊢
    rw [abs_le]
    constructor <;> linarith
  have hrm := hf c.re.lo c.re.hi z.re hr1 hr2
  have him := hf c.im.lo c.im.hi z.im hi1 hi2
  have hle1 : ((c.re.hi - rootMidRe c : ℤ) : ℝ) ≤ (rootRad c : ℝ) := by
    exact_mod_cast le_max_left (c.re.hi - rootMidRe c) (c.im.hi - rootMidIm c)
  have hle2 : ((c.im.hi - rootMidIm c : ℤ) : ℝ) ≤ (rootRad c : ℝ) := by
    exact_mod_cast le_max_right (c.re.hi - rootMidRe c) (c.im.hi - rootMidIm c)
  exact ⟨hrm.trans hle1, him.trans hle2⟩

private theorem ComplexClose_mul_gauss {α : ℂ} {cr ci r : ℤ}
    (hα : ComplexClose α cr ci r) (wr wi : ℤ) :
    ComplexClose (α * ((wr : ℂ) + (wi : ℂ) * Complex.I))
      (cr * wr - ci * wi) (cr * wi + ci * wr) (r * (iabs wr + iabs wi)) := by
  obtain ⟨hre, him⟩ := hα
  have hreEq : (D : ℝ) * (α * ((wr : ℂ) + (wi : ℂ) * Complex.I)).re -
      ((cr * wr - ci * wi : ℤ) : ℝ) =
      ((D : ℝ) * α.re - cr) * wr - ((D : ℝ) * α.im - ci) * wi := by
    simp only [Complex.mul_re, Complex.add_re, Complex.intCast_re, Complex.mul_im,
      Complex.add_im, Complex.intCast_im, Complex.I_re, Complex.I_im]
    push_cast; ring
  have himEq : (D : ℝ) * (α * ((wr : ℂ) + (wi : ℂ) * Complex.I)).im -
      ((cr * wi + ci * wr : ℤ) : ℝ) =
      ((D : ℝ) * α.re - cr) * wi + ((D : ℝ) * α.im - ci) * wr := by
    simp only [Complex.mul_im, Complex.add_re, Complex.intCast_re, Complex.mul_re,
      Complex.add_im, Complex.intCast_im, Complex.I_re, Complex.I_im]
    push_cast; ring
  constructor
  · rw [hreEq]
    calc |((D : ℝ) * α.re - cr) * wr - ((D : ℝ) * α.im - ci) * wi|
        ≤ |((D : ℝ) * α.re - cr) * wr| + |((D : ℝ) * α.im - ci) * wi| := abs_sub _ _
      _ = |(D : ℝ) * α.re - cr| * |(wr : ℝ)| + |(D : ℝ) * α.im - ci| * |(wi : ℝ)| := by
          rw [abs_mul, abs_mul]
      _ ≤ (r : ℝ) * |(wr : ℝ)| + (r : ℝ) * |(wi : ℝ)| :=
          add_le_add (mul_le_mul_of_nonneg_right hre (abs_nonneg _))
            (mul_le_mul_of_nonneg_right him (abs_nonneg _))
      _ = ((r * (iabs wr + iabs wi) : ℤ) : ℝ) := by
          push_cast [iabs_cast]; ring
  · rw [himEq]
    calc |((D : ℝ) * α.re - cr) * wi + ((D : ℝ) * α.im - ci) * wr|
        ≤ |((D : ℝ) * α.re - cr) * wi| + |((D : ℝ) * α.im - ci) * wr| := abs_add_le _ _
      _ = |(D : ℝ) * α.re - cr| * |(wi : ℝ)| + |(D : ℝ) * α.im - ci| * |(wr : ℝ)| := by
          rw [abs_mul, abs_mul]
      _ ≤ (r : ℝ) * |(wi : ℝ)| + (r : ℝ) * |(wr : ℝ)| :=
          add_le_add (mul_le_mul_of_nonneg_right hre (abs_nonneg _))
            (mul_le_mul_of_nonneg_right him (abs_nonneg _))
      _ = ((r * (iabs wr + iabs wi) : ℤ) : ℝ) := by
          push_cast [iabs_cast]; ring

private theorem ComplexClose_add {z₁ z₂ : ℂ} {a₁r a₁i e₁ a₂r a₂i e₂ : ℤ}
    (h₁ : ComplexClose z₁ a₁r a₁i e₁) (h₂ : ComplexClose z₂ a₂r a₂i e₂) :
    ComplexClose (z₁ + z₂) (a₁r + a₂r) (a₁i + a₂i) (e₁ + e₂) := by
  constructor
  · have h : (D : ℝ) * (z₁ + z₂).re - ((a₁r + a₂r : ℤ) : ℝ) =
        ((D : ℝ) * z₁.re - a₁r) + ((D : ℝ) * z₂.re - a₂r) := by
      simp only [Complex.add_re]; push_cast; ring
    rw [h]
    exact (abs_add_le _ _).trans (by push_cast; linarith [h₁.1, h₂.1])
  · have h : (D : ℝ) * (z₁ + z₂).im - ((a₁i + a₂i : ℤ) : ℝ) =
        ((D : ℝ) * z₁.im - a₁i) + ((D : ℝ) * z₂.im - a₂i) := by
      simp only [Complex.add_im]; push_cast; ring
    rw [h]
    exact (abs_add_le _ _).trans (by push_cast; linarith [h₁.2, h₂.2])

private theorem fdiv_bounds_real (a b : ℤ) (hb : 0 < b) :
    ((Int.fdiv a b : ℤ) : ℝ) * b ≤ a ∧ (a : ℝ) < (((Int.fdiv a b : ℤ) : ℝ) + 1) * b := by
  rw [Int.fdiv_eq_ediv_of_nonneg a (le_of_lt hb)]
  constructor
  · exact_mod_cast Int.ediv_mul_le a (ne_of_gt hb)
  · exact_mod_cast Int.lt_ediv_add_one_mul_self a hb

private theorem memFx_finalizeEven {z : ℂ} {ar ai e : ℤ}
    (hz : ComplexClose ((((2 : ℝ) ^ 32 : ℝ) : ℂ) * z) ar ai e) :
    memFx z.re (finalizeEven ar ai e).1 ∧ memFx z.im (finalizeEven ar ai e).2 := by
  have hs32_pos : (0 : ℤ) < shift32 := by decide
  have hs32_r : ((shift32 : ℤ) : ℝ) = (2 : ℝ) ^ 32 := by
    unfold shift32; norm_num
  have h2_32 : (0 : ℝ) < (2 : ℝ) ^ 32 := by positivity
  have hDK : (D : ℝ) = (2 : ℝ) ^ GrotheQuad.KFix := by
    unfold GrotheKernel.D GrotheKernel.K GrotheQuad.KFix; norm_num
  have hcomp : ∀ (x : ℝ) (a : ℤ), |(D : ℝ) * ((2 : ℝ) ^ 32 * x) - a| ≤ e →
      memFx x ⟨Int.fdiv a shift32 - (Int.fdiv e shift32 + 2),
               Int.fdiv a shift32 + (Int.fdiv e shift32 + 2)⟩ := by
    intro x a hxa
    obtain ⟨ha1, ha2⟩ := fdiv_bounds_real a shift32 hs32_pos
    obtain ⟨_, he2⟩ := fdiv_bounds_real e shift32 hs32_pos
    rw [hs32_r] at ha1 ha2 he2
    have hstep : |(D : ℝ) * x - Int.fdiv a shift32| * (2 : ℝ) ^ 32 ≤
        (((Int.fdiv e shift32 : ℤ) : ℝ) + 2) * (2 : ℝ) ^ 32 := by
      have hmul : |(D : ℝ) * x - Int.fdiv a shift32| * (2 : ℝ) ^ 32 =
          |((D : ℝ) * ((2 : ℝ) ^ 32 * x) - a) + (a - (Int.fdiv a shift32 : ℝ) * (2 : ℝ) ^ 32)| := by
        calc |(D : ℝ) * x - Int.fdiv a shift32| * (2 : ℝ) ^ 32
            = |(D : ℝ) * x - Int.fdiv a shift32| * |(2 : ℝ) ^ 32| := by rw [abs_of_pos h2_32]
          _ = |((D : ℝ) * x - Int.fdiv a shift32) * (2 : ℝ) ^ 32| := (abs_mul _ _).symm
          _ = _ := by congr 1; ring
      rw [hmul]
      have hdiff : |(a : ℝ) - (Int.fdiv a shift32 : ℝ) * (2 : ℝ) ^ 32| ≤ (2 : ℝ) ^ 32 := by
        rw [abs_le]; constructor <;> linarith
      calc |((D : ℝ) * ((2 : ℝ) ^ 32 * x) - a) + (a - (Int.fdiv a shift32 : ℝ) * (2 : ℝ) ^ 32)|
          ≤ |(D : ℝ) * ((2 : ℝ) ^ 32 * x) - a| +
              |(a : ℝ) - (Int.fdiv a shift32 : ℝ) * (2 : ℝ) ^ 32| :=
            abs_add_le _ _
        _ ≤ (e : ℝ) + (2 : ℝ) ^ 32 := add_le_add hxa hdiff
        _ ≤ (((Int.fdiv e shift32 : ℤ) : ℝ) + 1) * (2 : ℝ) ^ 32 + (2 : ℝ) ^ 32 := by linarith
        _ = (((Int.fdiv e shift32 : ℤ) : ℝ) + 2) * (2 : ℝ) ^ 32 := by ring
    have hbd := le_of_mul_le_mul_right hstep h2_32
    rw [abs_le] at hbd
    unfold memFx
    rw [← hDK]
    push_cast
    constructor <;> linarith [hbd.1, hbd.2]
  have hre : |(D : ℝ) * ((2 : ℝ) ^ 32 * z.re) - ar| ≤ e := by
    simpa only [Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im, zero_mul, sub_zero] using hz.1
  have him : |(D : ℝ) * ((2 : ℝ) ^ 32 * z.im) - ai| ≤ e := by
    simpa only [Complex.mul_im, Complex.ofReal_re, Complex.ofReal_im, zero_mul, add_zero] using hz.2
  exact ⟨hcomp z.re ar hre, hcomp z.im ai him⟩

private theorem ComplexClose_odd_combine {c : ℝ} {hM hR : ℤ}
    (hc : |(D : ℝ) * c - hM| ≤ hR) {s : ℤ} (hs : s = 1 ∨ s = -1)
    {A B : ℂ} {ar ai br bi ea eb : ℤ}
    (hA : ComplexClose A ar ai ea) (hB : ComplexClose B br bi eb) :
    ComplexClose (A + (((s : ℝ) * c : ℝ) : ℂ) * B)
      (ar + s * Int.fdiv (hM * br) D)
      (ai + s * Int.fdiv (hM * bi) D)
      (ea + (Int.fdiv (hR * (max (iabs br) (iabs bi) + eb) + iabs hM * eb) D + 2)) := by
  have hDpos : (0 : ℤ) < D := by unfold GrotheKernel.D GrotheKernel.K; positivity
  have hDr : (0 : ℝ) < (D : ℝ) := by exact_mod_cast hDpos
  have hhR0 : (0 : ℝ) ≤ hR := (abs_nonneg _).trans hc
  set num := hR * (max (iabs br) (iabs bi) + eb) + iabs hM * eb
  set ebTot := Int.fdiv num D + 2
  have hprod : ∀ (x : ℝ) (b : ℤ), |(D : ℝ) * x - b| ≤ eb → |(b : ℝ)| ≤ max |(br : ℝ)| |(bi : ℝ)| →
      |(D : ℝ) * (c * x) - Int.fdiv (hM * b) D| ≤ (ebTot : ℝ) := by
    intro x b hxb hble
    obtain ⟨hb1, hb2⟩ := fdiv_bounds_real (hM * b) D hDpos
    obtain ⟨_, hn2⟩ := fdiv_bounds_real num D hDpos
    have hDx : |(D : ℝ) * x| ≤ |(b : ℝ)| + eb := by
      have htri := abs_add_le ((D : ℝ) * x - b) b
      rw [sub_add_cancel] at htri
      linarith
    have hfrac : |(D : ℝ) * (c * x) - (hM : ℝ) * b / D| * (D : ℝ) ≤ (num : ℝ) := by
      have hid : ((D : ℝ) * (c * x) - (hM : ℝ) * b / D) * (D : ℝ) =
          ((D : ℝ) * c - hM) * ((D : ℝ) * x) + (hM : ℝ) * ((D : ℝ) * x - b) := by
        field_simp; ring
      have hlhs : |(D : ℝ) * (c * x) - (hM : ℝ) * b / D| * (D : ℝ) =
          |((D : ℝ) * c - hM) * ((D : ℝ) * x) + (hM : ℝ) * ((D : ℝ) * x - b)| := by
        calc |(D : ℝ) * (c * x) - (hM : ℝ) * b / D| * (D : ℝ)
            = |(D : ℝ) * (c * x) - (hM : ℝ) * b / D| * |(D : ℝ)| := by rw [abs_of_pos hDr]
          _ = |((D : ℝ) * (c * x) - (hM : ℝ) * b / D) * (D : ℝ)| := (abs_mul _ _).symm
          _ = _ := by rw [hid]
      rw [hlhs]
      calc |((D : ℝ) * c - hM) * ((D : ℝ) * x) + (hM : ℝ) * ((D : ℝ) * x - b)|
          ≤ |((D : ℝ) * c - hM) * ((D : ℝ) * x)| + |(hM : ℝ) * ((D : ℝ) * x - b)| := abs_add_le _ _
        _ = |(D : ℝ) * c - hM| * |(D : ℝ) * x| + |(hM : ℝ)| * |(D : ℝ) * x - b| := by
            rw [abs_mul ((D : ℝ) * c - hM), abs_mul (hM : ℝ)]
        _ ≤ (hR : ℝ) * (|(b : ℝ)| + eb) + |(hM : ℝ)| * eb :=
            add_le_add (mul_le_mul hc hDx (abs_nonneg _) hhR0)
              (mul_le_mul_of_nonneg_left hxb (abs_nonneg _))
        _ ≤ (hR : ℝ) * (max |(br : ℝ)| |(bi : ℝ)| + eb) + |(hM : ℝ)| * eb :=
            add_le_add (mul_le_mul_of_nonneg_left (add_le_add hble (le_refl _)) hhR0) (le_refl _)
        _ = (num : ℝ) := by
            simp only [num]; push_cast [iabs_cast]; rfl
    have hfrac' : |(D : ℝ) * (c * x) - (hM : ℝ) * b / D| ≤ (num : ℝ) / D :=
      (le_div_iff₀ hDr).mpr hfrac
    have hdiv : |(hM : ℝ) * b / D - Int.fdiv (hM * b) D| ≤ 1 := by
      have h1 : ((Int.fdiv (hM * b) D : ℤ) : ℝ) ≤ (hM : ℝ) * b / D :=
        (le_div_iff₀ hDr).mpr (by push_cast at hb1; exact hb1)
      have h2 : (hM : ℝ) * b / D < ((Int.fdiv (hM * b) D : ℤ) : ℝ) + 1 :=
        (div_lt_iff₀ hDr).mpr (by push_cast at hb2; exact hb2)
      rw [abs_le]; constructor <;> linarith
    have hnum_lt : (num : ℝ) / D < ((Int.fdiv num D : ℤ) : ℝ) + 1 :=
      (div_lt_iff₀ hDr).mpr hn2
    have hsplit : (D : ℝ) * (c * x) - Int.fdiv (hM * b) D =
        ((D : ℝ) * (c * x) - (hM : ℝ) * b / D) + ((hM : ℝ) * b / D - Int.fdiv (hM * b) D) := by
      ring
    rw [hsplit]
    have hsum := (abs_add_le _ _).trans (add_le_add hfrac' hdiv)
    simp only [ebTot]; push_cast; linarith
  have hsAbs : |(s : ℝ)| = 1 := by rcases hs with rfl | rfl <;> norm_num
  constructor
  · have hre : (D : ℝ) * (A + (((s : ℝ) * c : ℝ) : ℂ) * B).re -
        ((ar + s * Int.fdiv (hM * br) D : ℤ) : ℝ) =
        ((D : ℝ) * A.re - ar) + (s : ℝ) * ((D : ℝ) * (c * B.re) - Int.fdiv (hM * br) D) := by
      simp only [Complex.add_re, Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im,
        zero_mul, sub_zero]
      push_cast; ring
    rw [hre]
    have h1 := hprod B.re br hB.1 (le_max_left _ _)
    calc |((D : ℝ) * A.re - ar) + (s : ℝ) * ((D : ℝ) * (c * B.re) - Int.fdiv (hM * br) D)|
        ≤ |(D : ℝ) * A.re - ar| + |(s : ℝ) * ((D : ℝ) * (c * B.re) - Int.fdiv (hM * br) D)| :=
          abs_add_le _ _
      _ = |(D : ℝ) * A.re - ar| + |(D : ℝ) * (c * B.re) - Int.fdiv (hM * br) D| := by
          rw [abs_mul, hsAbs, one_mul]
      _ ≤ (ea : ℝ) + (ebTot : ℝ) := add_le_add hA.1 h1
      _ = ((ea + ebTot : ℤ) : ℝ) := by push_cast; rfl
  · have him : (D : ℝ) * (A + (((s : ℝ) * c : ℝ) : ℂ) * B).im -
        ((ai + s * Int.fdiv (hM * bi) D : ℤ) : ℝ) =
        ((D : ℝ) * A.im - ai) + (s : ℝ) * ((D : ℝ) * (c * B.im) - Int.fdiv (hM * bi) D) := by
      simp only [Complex.add_im, Complex.mul_im, Complex.ofReal_re, Complex.ofReal_im,
        zero_mul, add_zero]
      push_cast; ring
    rw [him]
    have h1 := hprod B.im bi hB.2 (le_max_right _ _)
    calc |((D : ℝ) * A.im - ai) + (s : ℝ) * ((D : ℝ) * (c * B.im) - Int.fdiv (hM * bi) D)|
        ≤ |(D : ℝ) * A.im - ai| + |(s : ℝ) * ((D : ℝ) * (c * B.im) - Int.fdiv (hM * bi) D)| :=
          abs_add_le _ _
      _ = |(D : ℝ) * A.im - ai| + |(D : ℝ) * (c * B.im) - Int.fdiv (hM * bi) D| := by
          rw [abs_mul, hsAbs, one_mul]
      _ ≤ (ea : ℝ) + (ebTot : ℝ) := add_le_add hA.2 h1
      _ = ((ea + ebTot : ℤ) : ℝ) := by push_cast; rfl

private theorem memFx_finalizeOdd {c : ℝ} {hM hR : ℤ}
    (hc : |(D : ℝ) * c - hM| ≤ hR) {s : ℤ} (hs : s = 1 ∨ s = -1)
    {z A B : ℂ} (hz : ((((2 : ℝ) ^ 32 : ℝ) : ℂ) * z) = A + (((s : ℝ) * c : ℝ) : ℂ) * B)
    {ar ai br bi ea eb : ℤ}
    (hA : ComplexClose A ar ai ea) (hB : ComplexClose B br bi eb) :
    memFx z.re (finalizeOdd hM hR (iabs hM) s ar ai br bi ea eb).1 ∧
    memFx z.im (finalizeOdd hM hR (iabs hM) s ar ai br bi ea eb).2 := by
  have hcomb := ComplexClose_odd_combine hc hs hA hB
  rw [← hz] at hcomb
  exact memFx_finalizeEven hcomb

/-- Exact complex value at index `k` and pixel `ij`. -/
private def zPix (tblR tblI : Array ℤ) (ij k : ℕ) : ℂ :=
  (tblR.getD (k * 16384 + ij) 0 : ℂ) + (tblI.getD (k * 16384 + ij) 0 : ℂ) * Complex.I

/-- Exact unit root `ω^m = exp (2πi m / 64)`. -/
private def omega64 (m : ℤ) : ℂ :=
  Complex.exp (((2 * Real.pi * (m : ℝ) / 64 : ℝ) : ℂ) * Complex.I)

private theorem phaseIndices_getD (start t s : ℕ) (ht : t < 8) (hs : s < 8) :
    (phaseIndices start).getD (8 * t + s) 0 = (64 - ((start + t) * s) % 64) % 64 := by
  unfold phaseIndices
  have hlt : 8 * t + s < 64 := by omega
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, hlt, ↓reduceDIte, Option.getD_some]
  have hdiv : (8 * t + s) / 8 = t := by omega
  have hmod : (8 * t + s) % 8 = s := by omega
  rw [hdiv, hmod]

private theorem complexClose_root64 (start t s : ℕ) (ht : t < 8) (hs : s < 8) :
    let roots := rootTable 64
    let idx := (phaseIndices start).getD (8 * t + s) 0
    ComplexClose (omega64 (-((start + t : ℤ) * s)))
      ((roots.map rootMidRe).getD idx 0)
      ((roots.map rootMidIm).getD idx 0)
      ((roots.map rootRad).getD idx 0) := by
  dsimp only
  rw [phaseIndices_getD start t s ht hs]
  set r := (64 - ((start + t) * s) % 64) % 64
  have hr : r < 64 := Nat.mod_lt _ (by decide)
  have hmem : memC (omega64 (-((start + t : ℤ) * s))) ((rootTable 64)[r]'(by
      simp [rootTable]; exact hr)) := by
    have hidx : ((-((start + t : ℤ) * s)) % ((64 : ℕ) : ℤ)).toNat = r := by
      have hneg : (-(((start + t) * s : ℕ) : ℤ)) % 64 = (r : ℤ) := by
        dsimp only [r]; omega
      have hcast : -((start + t : ℤ) * (s : ℤ)) = -(((start + t) * s : ℕ) : ℤ) := by
        push_cast; ring
      change ((-((start + t : ℤ) * s)) % (64 : ℤ)).toNat = r
      rw [hcast, hneg, Int.toNat_natCast]
    have hrt : (rootTable 64)[r]'(by simp [rootTable]; exact hr) =
        CellNumerics.rootC 64 (-((start + t : ℤ) * s)) := by
      simp only [rootTable, Array.getElem_ofFn, CellNumerics.rootC]
      have hr64 : (((r : ℕ) : ℤ) % ((64 : ℕ) : ℤ)).toNat = r := by
        change ((r : ℤ) % (64 : ℤ)).toNat = r
        rw [Int.emod_eq_of_lt (by omega) (by omega), Int.toNat_natCast]
      rw [hr64, hidx]
    rw [hrt]
    exact CellNumerics.mem_rootC (by decide) (-((start + t : ℤ) * s))
  have hget : ∀ (f : CI → ℤ),
      ((rootTable 64).map f).getD r 0 = f ((rootTable 64)[r]'(by simp [rootTable]; exact hr)) := by
    intro f
    have hsz : r < ((rootTable 64).map f).size := by simp [rootTable]; exact hr
    simp [Array.getD_eq_getD_getElem?, Array.getElem?_eq_getElem hsz]
  rw [hget rootMidRe, hget rootMidIm, hget rootRad]
  exact ComplexClose_of_memC hmem

private def bfW0 (tblR tblI : Array ℤ) (ij s : ℕ) : ℂ :=
  let z := fun q ↦ zPix tblR tblI ij (s + 8 * q);
  ((z 0 + z 4) + (z 2 + z 6)) + ((z 1 + z 5) + (z 3 + z 7))

private def bfW4 (tblR tblI : Array ℤ) (ij s : ℕ) : ℂ :=
  let z := fun q ↦ zPix tblR tblI ij (s + 8 * q);
  ((z 0 + z 4) + (z 2 + z 6)) - ((z 1 + z 5) + (z 3 + z 7))

private def bfW2 (tblR tblI : Array ℤ) (ij s : ℕ) : ℂ :=
  let z := fun q ↦ zPix tblR tblI ij (s + 8 * q);
  ((z 0 + z 4) - (z 2 + z 6)) - Complex.I * ((z 1 + z 5) - (z 3 + z 7))

private def bfW6 (tblR tblI : Array ℤ) (ij s : ℕ) : ℂ :=
  let z := fun q ↦ zPix tblR tblI ij (s + 8 * q);
  ((z 0 + z 4) - (z 2 + z 6)) + Complex.I * ((z 1 + z 5) - (z 3 + z 7))

private def bfS0 (tblR tblI : Array ℤ) (ij s : ℕ) : ℂ :=
  let z := fun q ↦ zPix tblR tblI ij (s + 8 * q);
  (z 0 - z 4) - Complex.I * (z 2 - z 6)

private def bfS1 (tblR tblI : Array ℤ) (ij s : ℕ) : ℂ :=
  let z := fun q ↦ zPix tblR tblI ij (s + 8 * q);
  (z 0 - z 4) + Complex.I * (z 2 - z 6)

private def bfV1 (tblR tblI : Array ℤ) (ij s : ℕ) : ℂ :=
  let z := fun q ↦ zPix tblR tblI ij (s + 8 * q);
  ((z 1 - z 5) - (z 3 - z 7)) - Complex.I * ((z 1 - z 5) + (z 3 - z 7))

private def bfV3 (tblR tblI : Array ℤ) (ij s : ℕ) : ℂ :=
  let z := fun q ↦ zPix tblR tblI ij (s + 8 * q);
  (-((z 1 - z 5) - (z 3 - z 7))) - Complex.I * ((z 1 - z 5) + (z 3 - z 7))

private theorem gauss_add (a b c d : ℤ) :
    ((a : ℂ) + (b : ℂ) * Complex.I) + ((c : ℂ) + (d : ℂ) * Complex.I) =
      ((a + c : ℤ) : ℂ) + ((b + d : ℤ) : ℂ) * Complex.I := by
  push_cast; ring

private theorem gauss_sub (a b c d : ℤ) :
    ((a : ℂ) + (b : ℂ) * Complex.I) - ((c : ℂ) + (d : ℂ) * Complex.I) =
      ((a - c : ℤ) : ℂ) + ((b - d : ℤ) : ℂ) * Complex.I := by
  push_cast; ring

private theorem gauss_sub_I_mul (a b c d : ℤ) :
    ((a : ℂ) + (b : ℂ) * Complex.I) - Complex.I * ((c : ℂ) + (d : ℂ) * Complex.I) =
      ((a + d : ℤ) : ℂ) + ((b - c : ℤ) : ℂ) * Complex.I := by
  push_cast; linear_combination -(d : ℂ) * Complex.I_sq

private theorem gauss_add_I_mul (a b c d : ℤ) :
    ((a : ℂ) + (b : ℂ) * Complex.I) + Complex.I * ((c : ℂ) + (d : ℂ) * Complex.I) =
      ((a - d : ℤ) : ℂ) + ((b + c : ℤ) : ℂ) * Complex.I := by
  push_cast; linear_combination (d : ℂ) * Complex.I_sq

private theorem gauss_neg_sub_I_mul (a b c d : ℤ) :
    (-((a : ℂ) + (b : ℂ) * Complex.I)) - Complex.I * ((c : ℂ) + (d : ℂ) * Complex.I) =
      ((-a + d : ℤ) : ℂ) + ((-b - c : ℤ) : ℂ) * Complex.I := by
  push_cast; linear_combination -(d : ℂ) * Complex.I_sq

private structure PixelInv (acc : PixelAcc)
    (Z0 Z2 Z4 Z6 A1 B1 A5 B5 A3 B3 A7 B7 : ℂ) : Prop where
  h0 : ComplexClose Z0 acc.a0r acc.a0i acc.e0
  h2 : ComplexClose Z2 acc.a2r acc.a2i acc.e2
  h4 : ComplexClose Z4 acc.a4r acc.a4i acc.e4
  h6 : ComplexClose Z6 acc.a6r acc.a6i acc.e6
  h1a : ComplexClose A1 acc.a1r acc.a1i acc.e1a
  h1b : ComplexClose B1 acc.b1r acc.b1i acc.e1b
  h5a : ComplexClose A5 acc.a5r acc.a5i acc.e5a
  h5b : ComplexClose B5 acc.b5r acc.b5i acc.e5b
  h3a : ComplexClose A3 acc.a3r acc.a3i acc.e3a
  h3b : ComplexClose B3 acc.b3r acc.b3i acc.e3b
  h7a : ComplexClose A7 acc.a7r acc.a7i acc.e7a
  h7b : ComplexClose B7 acc.b7r acc.b7i acc.e7b

private theorem close_step_aux {Z α W : ℂ} {ar ai e cr ci r wr wi : ℤ}
    (hZ : ComplexClose Z ar ai e) (hα : ComplexClose α cr ci r)
    (hW : W = (wr : ℂ) + (wi : ℂ) * Complex.I) :
    ComplexClose (Z + α * W) (ar + cr * wr - ci * wi) (ai + cr * wi + ci * wr)
      (e + r * (iabs wr + iabs wi)) := by
  rw [hW]
  have h := ComplexClose_add hZ (ComplexClose_mul_gauss hα wr wi)
  have h1 : ar + (cr * wr - ci * wi) = ar + cr * wr - ci * wi := by ring
  have h2 : ai + (cr * wi + ci * wr) = ai + cr * wi + ci * wr := by ring
  rwa [h1, h2] at h

private theorem add_sum_range_succ (Z : ℂ) (f : ℕ → ℂ) (s : ℕ) :
    (Z + f s) + ∑ k ∈ Finset.range s, f k = Z + ∑ k ∈ Finset.range (s + 1), f k := by
  rw [Finset.sum_range_succ]; ring

private theorem pixelStep_sound (start : ℕ) (tblR tblI : Array ℤ) (ij : ℕ) :
    ∀ (n : ℕ), n ≤ 8 → ∀ (acc : PixelAcc) (Z0 Z2 Z4 Z6 A1 B1 A5 B5 A3 B3 A7 B7 : ℂ),
      PixelInv acc Z0 Z2 Z4 Z6 A1 B1 A5 B5 A3 B3 A7 B7 →
      PixelInv
        (pixelStep (phaseIndices start) ((rootTable 64).map rootMidRe)
          ((rootTable 64).map rootMidIm) ((rootTable 64).map rootRad) tblR tblI ij n acc)
        (Z0 + ∑ s ∈ Finset.range n, omega64 (-((start + 0 : ℤ) * s)) * bfW0 tblR tblI ij s)
        (Z2 + ∑ s ∈ Finset.range n, omega64 (-((start + 2 : ℤ) * s)) * bfW2 tblR tblI ij s)
        (Z4 + ∑ s ∈ Finset.range n, omega64 (-((start + 4 : ℤ) * s)) * bfW4 tblR tblI ij s)
        (Z6 + ∑ s ∈ Finset.range n, omega64 (-((start + 6 : ℤ) * s)) * bfW6 tblR tblI ij s)
        (A1 + ∑ s ∈ Finset.range n, omega64 (-((start + 1 : ℤ) * s)) * bfS0 tblR tblI ij s)
        (B1 + ∑ s ∈ Finset.range n, omega64 (-((start + 1 : ℤ) * s)) * bfV1 tblR tblI ij s)
        (A5 + ∑ s ∈ Finset.range n, omega64 (-((start + 5 : ℤ) * s)) * bfS0 tblR tblI ij s)
        (B5 + ∑ s ∈ Finset.range n, omega64 (-((start + 5 : ℤ) * s)) * bfV1 tblR tblI ij s)
        (A3 + ∑ s ∈ Finset.range n, omega64 (-((start + 3 : ℤ) * s)) * bfS1 tblR tblI ij s)
        (B3 + ∑ s ∈ Finset.range n, omega64 (-((start + 3 : ℤ) * s)) * bfV3 tblR tblI ij s)
        (A7 + ∑ s ∈ Finset.range n, omega64 (-((start + 7 : ℤ) * s)) * bfS1 tblR tblI ij s)
        (B7 + ∑ s ∈ Finset.range n, omega64 (-((start + 7 : ℤ) * s)) * bfV3 tblR tblI ij s)
  | 0, _, acc, Z0, Z2, Z4, Z6, A1, B1, A5, B5, A3, B3, A7, B7, hinv => by
    simpa [pixelStep] using hinv
  | s + 1, hs, acc, Z0, Z2, Z4, Z6, A1, B1, A5, B5, A3, B3, A7, B7, hinv => by
    have hs8 : s < 8 := by omega
    have hr0 := complexClose_root64 start 0 s (by omega) hs8
    have hr1 := complexClose_root64 start 1 s (by omega) hs8
    have hr2 := complexClose_root64 start 2 s (by omega) hs8
    have hr3 := complexClose_root64 start 3 s (by omega) hs8
    have hr4 := complexClose_root64 start 4 s (by omega) hs8
    have hr5 := complexClose_root64 start 5 s (by omega) hs8
    have hr6 := complexClose_root64 start 6 s (by omega) hs8
    have hr7 := complexClose_root64 start 7 s (by omega) hs8
    simp only [Nat.mul_zero, Nat.zero_add] at hr0
    simp only [Nat.mul_one] at hr1
    have hstep :
        let pRM := (rootTable 64).map rootMidRe
        let pIM := (rootTable 64).map rootMidIm
        let pRR := (rootTable 64).map rootRad
        let pIdx := phaseIndices start
        let z0r := tblR.getD (s * 16384 + ij) 0; let z0i := tblI.getD (s * 16384 + ij) 0
        let z1r := tblR.getD ((s + 8) * 16384 + ij) 0; let z1i := tblI.getD ((s + 8) * 16384 + ij) 0
        let z2r := tblR.getD ((s + 16) * 16384 + ij) 0
        let z2i := tblI.getD ((s + 16) * 16384 + ij) 0
        let z3r := tblR.getD ((s + 24) * 16384 + ij) 0
        let z3i := tblI.getD ((s + 24) * 16384 + ij) 0
        let z4r := tblR.getD ((s + 32) * 16384 + ij) 0
        let z4i := tblI.getD ((s + 32) * 16384 + ij) 0
        let z5r := tblR.getD ((s + 40) * 16384 + ij) 0
        let z5i := tblI.getD ((s + 40) * 16384 + ij) 0
        let z6r := tblR.getD ((s + 48) * 16384 + ij) 0
        let z6i := tblI.getD ((s + 48) * 16384 + ij) 0
        let z7r := tblR.getD ((s + 56) * 16384 + ij) 0
        let z7i := tblI.getD ((s + 56) * 16384 + ij) 0
        let e0r := z0r + z4r; let e0i := z0i + z4i
        let o0r := z0r - z4r; let o0i := z0i - z4i
        let e1r := z2r + z6r; let e1i := z2i + z6i
        let o1r := z2r - z6r; let o1i := z2i - z6i
        let e2r := z1r + z5r; let e2i := z1i + z5i
        let o2r := z1r - z5r; let o2i := z1i - z5i
        let e3r := z3r + z7r; let e3i := z3i + z7i
        let o3r := z3r - z7r; let o3i := z3i - z7i
        let p0r := e0r + e1r; let p0i := e0i + e1i
        let p1r := e0r - e1r; let p1i := e0i - e1i
        let p2r := e2r + e3r; let p2i := e2i + e3i
        let p3r := e2r - e3r; let p3i := e2i - e3i
        let w0r := p0r + p2r; let w0i := p0i + p2i
        let w4r := p0r - p2r; let w4i := p0i - p2i
        let w2r := p1r + p3i; let w2i := p1i - p3r
        let w6r := p1r - p3i; let w6i := p1i + p3r
        let s0r := o0r + o1i; let s0i := o0i - o1r
        let s1r := o0r - o1i; let s1i := o0i + o1r
        let dr := o2r - o3r; let di := o2i - o3i
        let ur := o2r + o3r; let ui := o2i + o3i
        let v1r := dr + ui; let v1i := di - ur
        let v3r := -dr + ui; let v3i := -di - ur
        let i0 := pIdx.getD s 0; let i1 := pIdx.getD (8 + s) 0
        let i2 := pIdx.getD (16 + s) 0; let i3 := pIdx.getD (24 + s) 0
        let i4 := pIdx.getD (32 + s) 0; let i5 := pIdx.getD (40 + s) 0
        let i6 := pIdx.getD (48 + s) 0; let i7 := pIdx.getD (56 + s) 0
        let c0r := pRM.getD i0 0; let c0i := pIM.getD i0 0; let r0 := pRR.getD i0 0
        let c1r := pRM.getD i1 0; let c1i := pIM.getD i1 0; let r1 := pRR.getD i1 0
        let c2r := pRM.getD i2 0; let c2i := pIM.getD i2 0; let r2 := pRR.getD i2 0
        let c3r := pRM.getD i3 0; let c3i := pIM.getD i3 0; let r3 := pRR.getD i3 0
        let c4r := pRM.getD i4 0; let c4i := pIM.getD i4 0; let r4 := pRR.getD i4 0
        let c5r := pRM.getD i5 0; let c5i := pIM.getD i5 0; let r5 := pRR.getD i5 0
        let c6r := pRM.getD i6 0; let c6i := pIM.getD i6 0; let r6 := pRR.getD i6 0
        let c7r := pRM.getD i7 0; let c7i := pIM.getD i7 0; let r7 := pRR.getD i7 0
        let absS0 := iabs s0r + iabs s0i
        let absS1 := iabs s1r + iabs s1i
        let absV1 := iabs v1r + iabs v1i
        let absV3 := iabs v3r + iabs v3i
        let acc' : PixelAcc := {
          a0r := acc.a0r + c0r * w0r - c0i * w0i
          a0i := acc.a0i + c0r * w0i + c0i * w0r
          e0 := acc.e0 + r0 * (iabs w0r + iabs w0i)
          a2r := acc.a2r + c2r * w2r - c2i * w2i
          a2i := acc.a2i + c2r * w2i + c2i * w2r
          e2 := acc.e2 + r2 * (iabs w2r + iabs w2i)
          a4r := acc.a4r + c4r * w4r - c4i * w4i
          a4i := acc.a4i + c4r * w4i + c4i * w4r
          e4 := acc.e4 + r4 * (iabs w4r + iabs w4i)
          a6r := acc.a6r + c6r * w6r - c6i * w6i
          a6i := acc.a6i + c6r * w6i + c6i * w6r
          e6 := acc.e6 + r6 * (iabs w6r + iabs w6i)
          a1r := acc.a1r + c1r * s0r - c1i * s0i
          a1i := acc.a1i + c1r * s0i + c1i * s0r
          b1r := acc.b1r + c1r * v1r - c1i * v1i
          b1i := acc.b1i + c1r * v1i + c1i * v1r
          e1a := acc.e1a + r1 * absS0
          e1b := acc.e1b + r1 * absV1
          a5r := acc.a5r + c5r * s0r - c5i * s0i
          a5i := acc.a5i + c5r * s0i + c5i * s0r
          b5r := acc.b5r + c5r * v1r - c5i * v1i
          b5i := acc.b5i + c5r * v1i + c5i * v1r
          e5a := acc.e5a + r5 * absS0
          e5b := acc.e5b + r5 * absV1
          a3r := acc.a3r + c3r * s1r - c3i * s1i
          a3i := acc.a3i + c3r * s1i + c3i * s1r
          b3r := acc.b3r + c3r * v3r - c3i * v3i
          b3i := acc.b3i + c3r * v3i + c3i * v3r
          e3a := acc.e3a + r3 * absS1
          e3b := acc.e3b + r3 * absV3
          a7r := acc.a7r + c7r * s1r - c7i * s1i
          a7i := acc.a7i + c7r * s1i + c7i * s1r
          b7r := acc.b7r + c7r * v3r - c7i * v3i
          b7i := acc.b7i + c7r * v3i + c7i * v3r
          e7a := acc.e7a + r7 * absS1
          e7b := acc.e7b + r7 * absV3
        }
        PixelInv acc'
          (Z0 + omega64 (-((start + 0 : ℤ) * s)) * bfW0 tblR tblI ij s)
          (Z2 + omega64 (-((start + 2 : ℤ) * s)) * bfW2 tblR tblI ij s)
          (Z4 + omega64 (-((start + 4 : ℤ) * s)) * bfW4 tblR tblI ij s)
          (Z6 + omega64 (-((start + 6 : ℤ) * s)) * bfW6 tblR tblI ij s)
          (A1 + omega64 (-((start + 1 : ℤ) * s)) * bfS0 tblR tblI ij s)
          (B1 + omega64 (-((start + 1 : ℤ) * s)) * bfV1 tblR tblI ij s)
          (A5 + omega64 (-((start + 5 : ℤ) * s)) * bfS0 tblR tblI ij s)
          (B5 + omega64 (-((start + 5 : ℤ) * s)) * bfV1 tblR tblI ij s)
          (A3 + omega64 (-((start + 3 : ℤ) * s)) * bfS1 tblR tblI ij s)
          (B3 + omega64 (-((start + 3 : ℤ) * s)) * bfV3 tblR tblI ij s)
          (A7 + omega64 (-((start + 7 : ℤ) * s)) * bfS1 tblR tblI ij s)
          (B7 + omega64 (-((start + 7 : ℤ) * s)) * bfV3 tblR tblI ij s) := by
      intro pRM pIM pRR pIdx z0r z0i z1r z1i z2r z2i z3r z3i z4r z4i z5r z5i z6r z6i z7r z7i
        e0r e0i o0r o0i e1r e1i o1r o1i e2r e2i o2r o2i e3r e3i o3r o3i
        p0r p0i p1r p1i p2r p2i p3r p3i w0r w0i w4r w4i w2r w2i w6r w6i
        s0r s0i s1r s1i dr di ur ui v1r v1i v3r v3i i0 i1 i2 i3 i4 i5 i6 i7
        c0r c0i r0 c1r c1i r1 c2r c2i r2 c3r c3i r3 c4r c4i r4 c5r c5i r5
        c6r c6i r6 c7r c7i r7 absS0 absS1 absV1 absV3 acc'
      have hz0 : zPix tblR tblI ij (s + 8 * 0) = (z0r : ℂ) + (z0i : ℂ) * Complex.I := rfl
      have hz1 : zPix tblR tblI ij (s + 8 * 1) = (z1r : ℂ) + (z1i : ℂ) * Complex.I := rfl
      have hz2 : zPix tblR tblI ij (s + 8 * 2) = (z2r : ℂ) + (z2i : ℂ) * Complex.I := rfl
      have hz3 : zPix tblR tblI ij (s + 8 * 3) = (z3r : ℂ) + (z3i : ℂ) * Complex.I := rfl
      have hz4 : zPix tblR tblI ij (s + 8 * 4) = (z4r : ℂ) + (z4i : ℂ) * Complex.I := rfl
      have hz5 : zPix tblR tblI ij (s + 8 * 5) = (z5r : ℂ) + (z5i : ℂ) * Complex.I := rfl
      have hz6 : zPix tblR tblI ij (s + 8 * 6) = (z6r : ℂ) + (z6i : ℂ) * Complex.I := rfl
      have hz7 : zPix tblR tblI ij (s + 8 * 7) = (z7r : ℂ) + (z7i : ℂ) * Complex.I := rfl
      have hw0 : bfW0 tblR tblI ij s = (w0r : ℂ) + (w0i : ℂ) * Complex.I := by
        unfold bfW0; dsimp only
        rw [hz0, hz1, hz2, hz3, hz4, hz5, hz6, hz7,
          gauss_add, gauss_add, gauss_add, gauss_add, gauss_add, gauss_add, gauss_add]
      have hw4 : bfW4 tblR tblI ij s = (w4r : ℂ) + (w4i : ℂ) * Complex.I := by
        unfold bfW4; dsimp only
        rw [hz0, hz1, hz2, hz3, hz4, hz5, hz6, hz7,
          gauss_add, gauss_add, gauss_add, gauss_add, gauss_add, gauss_add, gauss_sub]
      have hw2 : bfW2 tblR tblI ij s = (w2r : ℂ) + (w2i : ℂ) * Complex.I := by
        unfold bfW2; dsimp only
        rw [hz0, hz1, hz2, hz3, hz4, hz5, hz6, hz7,
          gauss_add, gauss_add, gauss_add, gauss_add, gauss_sub, gauss_sub, gauss_sub_I_mul]
      have hw6 : bfW6 tblR tblI ij s = (w6r : ℂ) + (w6i : ℂ) * Complex.I := by
        unfold bfW6; dsimp only
        rw [hz0, hz1, hz2, hz3, hz4, hz5, hz6, hz7,
          gauss_add, gauss_add, gauss_add, gauss_add, gauss_sub, gauss_sub, gauss_add_I_mul]
      have hs0 : bfS0 tblR tblI ij s = (s0r : ℂ) + (s0i : ℂ) * Complex.I := by
        unfold bfS0; dsimp only
        rw [hz0, hz2, hz4, hz6, gauss_sub, gauss_sub, gauss_sub_I_mul]
      have hs1 : bfS1 tblR tblI ij s = (s1r : ℂ) + (s1i : ℂ) * Complex.I := by
        unfold bfS1; dsimp only
        rw [hz0, hz2, hz4, hz6, gauss_sub, gauss_sub, gauss_add_I_mul]
      have hv1 : bfV1 tblR tblI ij s = (v1r : ℂ) + (v1i : ℂ) * Complex.I := by
        unfold bfV1; dsimp only
        rw [hz1, hz3, hz5, hz7, gauss_sub, gauss_sub, gauss_sub, gauss_add, gauss_sub_I_mul]
      have hv3 : bfV3 tblR tblI ij s = (v3r : ℂ) + (v3i : ℂ) * Complex.I := by
        unfold bfV3; dsimp only
        rw [hz1, hz3, hz5, hz7, gauss_sub, gauss_sub, gauss_sub, gauss_add, gauss_neg_sub_I_mul]
      exact
        { h0 := close_step_aux hinv.h0 hr0 hw0
          h2 := close_step_aux hinv.h2 hr2 hw2
          h4 := close_step_aux hinv.h4 hr4 hw4
          h6 := close_step_aux hinv.h6 hr6 hw6
          h1a := close_step_aux hinv.h1a hr1 hs0
          h1b := close_step_aux hinv.h1b hr1 hv1
          h5a := close_step_aux hinv.h5a hr5 hs0
          h5b := close_step_aux hinv.h5b hr5 hv1
          h3a := close_step_aux hinv.h3a hr3 hs1
          h3b := close_step_aux hinv.h3b hr3 hv3
          h7a := close_step_aux hinv.h7a hr7 hs1
          h7b := close_step_aux hinv.h7b hr7 hv3 }
    have ih := pixelStep_sound start tblR tblI ij s (by omega) _ _ _ _ _ _ _ _ _ _ _ _ _ hstep
    simp_rw [← add_sum_range_succ]
    exact ih

private theorem dft64_factor {start t : ℕ} (hstart : start % 8 = 0) (f : ℕ → ℂ) :
    ∑ k ∈ Finset.range 64, omega64 (-((start + t : ℤ) * k)) * f k =
      ∑ s ∈ Finset.range 8, omega64 (-((start + t : ℤ) * s)) *
        ∑ q ∈ Finset.range 8,
          Complex.exp (((-(t : ℝ) * (2 * Real.pi * q / 8) : ℝ) : ℂ) * Complex.I) *
            f (s + 8 * q) := by
  have hbij : ∑ k ∈ Finset.range 64, omega64 (-((start + t : ℤ) * k)) * f k =
      ∑ s ∈ Finset.range 8, ∑ q ∈ Finset.range 8,
        omega64 (-((start + t : ℤ) * (s + 8 * q))) * f (s + 8 * q) := by
    rw [← Finset.sum_product']
    refine Finset.sum_bij (fun k _ ↦ (k % 8, k / 8)) ?_ ?_ ?_ ?_
    · intro k hk
      rw [Finset.mem_range] at hk
      exact Finset.mem_product.mpr
        ⟨Finset.mem_range.mpr (by omega), Finset.mem_range.mpr (by omega)⟩
    · intro a _ b _ hab
      have h1 := congrArg Prod.fst hab
      have h2 := congrArg Prod.snd hab
      omega
    · intro p hp
      rcases Finset.mem_product.mp hp with ⟨h1, h2⟩
      rw [Finset.mem_range] at h1 h2
      exact ⟨p.1 + 8 * p.2, Finset.mem_range.mpr (by omega), by ext <;> dsimp <;> omega⟩
    · intro k _
      have heq : k % 8 + 8 * (k / 8) = k := by omega
      have heqz : ((k % 8 : ℕ) : ℤ) + 8 * ((k / 8 : ℕ) : ℤ) = (k : ℤ) := by exact_mod_cast heq
      dsimp only
      rw [heq, heqz]
  rw [hbij]
  apply Finset.sum_congr rfl
  intro s _
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro q _
  rw [← mul_assoc]
  congr 1
  unfold omega64
  rw [← Complex.exp_add]
  obtain ⟨g, hg⟩ : ∃ g, start = 8 * g := ⟨start / 8, by omega⟩
  have hper :
      (((2 * Real.pi * ((-((start + t : ℤ) * ((s : ℤ) + 8 * (q : ℤ))) : ℤ) : ℝ) / 64 : ℝ) : ℂ) *
        Complex.I) =
      ((((2 * Real.pi * (((-((start + t : ℤ) * s)) : ℤ) : ℝ) / 64 : ℝ) : ℂ) * Complex.I) +
        (((-(t : ℝ) * (2 * Real.pi * q / 8) : ℝ) : ℂ) * Complex.I)) +
      ((-(g * q : ℤ) : ℤ) : ℂ) * (2 * (Real.pi : ℂ) * Complex.I) := by
    rw [hg]; push_cast; field_simp; ring
  rw [hper, Complex.exp_add, Complex.exp_int_mul_two_pi_mul_I, mul_one]

private theorem dft8_eval (tblR tblI : Array ℤ) (ij s : ℕ) :
    let c : ℝ := Real.cos (Real.pi / 4)
    let S := fun t : ℕ ↦ ∑ q ∈ Finset.range 8,
      Complex.exp (((-(t : ℝ) * (2 * Real.pi * q / 8) : ℝ) : ℂ) * Complex.I) *
        zPix tblR tblI ij (s + 8 * q)
    S 0 = bfW0 tblR tblI ij s ∧ S 2 = bfW2 tblR tblI ij s ∧
    S 4 = bfW4 tblR tblI ij s ∧ S 6 = bfW6 tblR tblI ij s ∧
    S 1 = bfS0 tblR tblI ij s + (c : ℂ) * bfV1 tblR tblI ij s ∧
    S 5 = bfS0 tblR tblI ij s - (c : ℂ) * bfV1 tblR tblI ij s ∧
    S 3 = bfS1 tblR tblI ij s + (c : ℂ) * bfV3 tblR tblI ij s ∧
    S 7 = bfS1 tblR tblI ij s - (c : ℂ) * bfV3 tblR tblI ij s := by
  dsimp only
  set z := fun q ↦ zPix tblR tblI ij (s + 8 * q)
  set c := Real.cos (Real.pi / 4)
  have hsc : Real.sin (Real.pi / 4) = c := by
    simp [c, Real.sin_pi_div_four, Real.cos_pi_div_four]
  set ζ := Complex.exp (((-(Real.pi / 4) : ℝ) : ℂ) * Complex.I)
  have hζ : ζ = (c : ℂ) - (c : ℂ) * Complex.I := by
    unfold ζ
    rw [Complex.exp_mul_I, ← Complex.ofReal_cos, ← Complex.ofReal_sin,
      Real.cos_neg, Real.sin_neg, hsc, Complex.ofReal_neg]
    ring
  have hζ2 : ζ ^ 2 = -Complex.I := by
    rw [hζ]
    have hc2 : c * c = 1 / 2 := by
      have hsq : Real.sqrt 2 * Real.sqrt 2 = 2 := Real.mul_self_sqrt (by norm_num)
      simp only [c, Real.cos_pi_div_four]
      linear_combination (1 / 4 : ℝ) * hsq
    have hc2c : (c : ℂ) * (c : ℂ) = 1 / 2 := by
      rw [← Complex.ofReal_mul, hc2]; push_cast; rfl
    linear_combination (c : ℂ) ^ 2 * Complex.I_sq - 2 * Complex.I * hc2c
  have hζ3 : ζ ^ 3 = -(c : ℂ) - (c : ℂ) * Complex.I := by
    calc ζ ^ 3 = ζ ^ 2 * ζ := by ring
      _ = (-Complex.I) * ((c : ℂ) - (c : ℂ) * Complex.I) := by rw [hζ2, hζ]
      _ = -(c : ℂ) - (c : ℂ) * Complex.I := by linear_combination (c : ℂ) * Complex.I_sq
  have hζ4 : ζ ^ 4 = -1 := by
    calc ζ ^ 4 = (ζ ^ 2) ^ 2 := by ring
      _ = (-Complex.I) ^ 2 := by rw [hζ2]
      _ = -1 := by linear_combination Complex.I_sq
  have hζ5 : ζ ^ 5 = -ζ := by rw [show (5 : ℕ) = 4 + 1 by rfl, pow_add, hζ4]; ring
  have hζ6 : ζ ^ 6 = Complex.I := by rw [show (6 : ℕ) = 4 + 2 by rfl, pow_add, hζ4, hζ2]; ring
  have hζ7 : ζ ^ 7 = -ζ ^ 3 := by rw [show (7 : ℕ) = 4 + 3 by rfl, pow_add, hζ4]; ring
  have hζ8 : ζ ^ 8 = 1 := by rw [show (8 : ℕ) = 4 + 4 by rfl, pow_add, hζ4]; ring
  have hpow : ∀ t q : ℕ,
      Complex.exp (((-(t : ℝ) * (2 * Real.pi * q / 8) : ℝ) : ℂ) * Complex.I) = ζ ^ (t * q) := by
    intro t q
    rw [← Complex.exp_nat_mul]
    congr 1; push_cast; ring
  have hexpand : ∀ t : ℕ,
      ∑ q ∈ Finset.range 8,
        Complex.exp (((-(t : ℝ) * (2 * Real.pi * q / 8) : ℝ) : ℂ) * Complex.I) * z q =
      z 0 + ζ ^ t * z 1 + ζ ^ (t * 2) * z 2 + ζ ^ (t * 3) * z 3 +
      ζ ^ (t * 4) * z 4 + ζ ^ (t * 5) * z 5 + ζ ^ (t * 6) * z 6 + ζ ^ (t * 7) * z 7 := by
    intro t
    simp_rw [hpow t]
    rw [Finset.sum_range_succ, Finset.sum_range_succ, Finset.sum_range_succ,
      Finset.sum_range_succ, Finset.sum_range_succ, Finset.sum_range_succ,
      Finset.sum_range_succ, Finset.sum_range_one]
    simp only [Nat.mul_zero, pow_zero, one_mul, Nat.mul_one]
  have hmod8 : ∀ k : ℕ, ζ ^ k = ζ ^ (k % 8) := by
    intro k
    conv_lhs => rw [← Nat.div_add_mod k 8, pow_add, pow_mul, hζ8, one_pow, one_mul]
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · rw [hexpand 0]; simp [bfW0, z]; ring
  · rw [hexpand 2, hmod8 8, hmod8 10, hmod8 12, hmod8 14]
    simp only [Nat.reduceMul, Nat.reduceMod, pow_zero, hζ2, hζ4, hζ6, bfW2, z]; ring
  · rw [hexpand 4, hmod8 8, hmod8 12, hmod8 16, hmod8 20, hmod8 24, hmod8 28]
    simp only [Nat.reduceMul, Nat.reduceMod, pow_zero, hζ4, bfW4, z]; ring
  · rw [hexpand 6, hmod8 12, hmod8 18, hmod8 24, hmod8 30, hmod8 36, hmod8 42]
    simp only [Nat.reduceMul, Nat.reduceMod, pow_zero, hζ2, hζ4, hζ6, bfW6, z]; ring
  · rw [hexpand 1]
    simp only [Nat.one_mul, pow_one, hζ2, hζ3, hζ4, hζ5, hζ6, hζ7]
    simp only [hζ, bfS0, bfV1, z]; ring
  · rw [hexpand 5, hmod8 10, hmod8 15, hmod8 20, hmod8 25, hmod8 30, hmod8 35]
    simp only [Nat.reduceMod, pow_one, hζ2, hζ3, hζ4, hζ5, hζ6, hζ7]
    simp only [hζ, bfS0, bfV1, z]; ring
  · rw [hexpand 3, hmod8 9, hmod8 12, hmod8 15, hmod8 18, hmod8 21]
    simp only [Nat.reduceMul, Nat.reduceMod, pow_one, hζ2, hζ3, hζ4, hζ5, hζ6, hζ7]
    simp only [hζ, bfS1, bfV3, z]; ring
  · rw [hexpand 7, hmod8 14, hmod8 21, hmod8 28, hmod8 35, hmod8 42, hmod8 49]
    simp only [Nat.reduceMod, pow_one, hζ2, hζ3, hζ4, hζ5, hζ6, hζ7]
    simp only [hζ, bfS1, bfV3, z]; ring

private theorem root8_cos_close :
    |(D : ℝ) * Real.cos (Real.pi / 4) - (((rootTable 64).map rootMidRe).getD 8 0 : ℤ)| ≤
      (((rootTable 64).map rootRad).getD 8 0 : ℤ) := by
  have hsz : 8 < (rootTable 64).size := by
    rw [rootTable, Array.size_ofFn]; decide
  have hrt8 : (rootTable 64)[8]'hsz = CellNumerics.rootC 64 8 := by
    change (Array.ofFn fun k : Fin 64 ↦ CellNumerics.rootC 64 k.val)[8]'(by
      rw [Array.size_ofFn]; decide) = CellNumerics.rootC 64 8
    rw [Array.getElem_ofFn]; rfl
  have hmem : memC (Complex.exp (((2 * Real.pi * (8 : ℤ) / 64 : ℝ) : ℂ) * Complex.I))
      ((rootTable 64)[8]'hsz) := by
    rw [hrt8]
    exact CellNumerics.mem_rootC (by decide) 8
  have hcl := ComplexClose_of_memC hmem
  have hre : (Complex.exp (((2 * Real.pi * (8 : ℤ) / 64 : ℝ) : ℂ) * Complex.I)).re =
      Real.cos (Real.pi / 4) := by
    rw [Complex.exp_ofReal_mul_I_re]
    congr 1; push_cast; ring
  have hM_eq : ((rootTable 64).map rootMidRe).getD 8 0 = rootMidRe ((rootTable 64)[8]'hsz) := by
    simp only [Array.getD_eq_getD_getElem?, Array.getElem?_map,
      Array.getElem?_eq_getElem hsz, Option.map_some, Option.getD_some]
  have hR_eq : ((rootTable 64).map rootRad).getD 8 0 = rootRad ((rootTable 64)[8]'hsz) := by
    simp only [Array.getD_eq_getD_getElem?, Array.getElem?_map,
      Array.getElem?_eq_getElem hsz, Option.map_some, Option.getD_some]
  rw [hM_eq, hR_eq, ← hre]
  exact hcl.1

theorem memFx_angularGroup8Fx (rows : Array String) {start t i j : ℕ}
    (hstart : start % 8 = 0) (ht : t < 8) (hi : i < 128) (hj : j < 128)
    {m : ℤ} (hm : (m % (64 : ℤ)).toNat = start + t) :
    let p := CellEncoding.decodeClipped rows (2 ^ 26)
    let ang := (angularGroup8Fx start (rootTable 64) p.1 p.2).getD t (#[], #[])
    let u := unscaledAngular (CellEncoding.decode rows) (2 ^ 26) 128 64 m i j
    memFx u.re (GrotheQuad.getFx ang.1 i j) ∧ memFx u.im (GrotheQuad.getFx ang.2 i j) := by
  dsimp only
  set p := CellEncoding.decodeClipped rows (2 ^ 26)
  set roots := rootTable 64
  set pRM := roots.map rootMidRe
  set pIM := roots.map rootMidIm
  set pRR := roots.map rootRad
  set hM := pRM.getD 8 0
  set hR := pRR.getD 8 0
  set ij := i * 128 + j
  set u := unscaledAngular (CellEncoding.decode rows) (2 ^ 26) 128 64 m i j
  have hgetRe : GrotheQuad.getFx ((angularGroup8Fx start roots p.1 p.2).getD t (#[], #[])).1 i j =
      (pixelOut (phaseIndices start) pRM pIM pRR p.1 p.2 hM hR (iabs hM) ij).reAt t := by
    unfold angularGroup8Fx gridPixels GrotheQuad.getFx
    simp only [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, ht, hi, hj, ↓reduceDIte,
      Array.getElem?_map, Option.map_some, Option.getD_some, roots, pRM, pIM, pRR, hM, hR, ij]
  have hgetIm : GrotheQuad.getFx ((angularGroup8Fx start roots p.1 p.2).getD t (#[], #[])).2 i j =
      (pixelOut (phaseIndices start) pRM pIM pRR p.1 p.2 hM hR (iabs hM) ij).imAt t := by
    unfold angularGroup8Fx gridPixels GrotheQuad.getFx
    simp only [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, ht, hi, hj, ↓reduceDIte,
      Array.getElem?_map, Option.map_some, Option.getD_some, roots, pRM, pIM, pRR, hM, hR, ij]
  rw [hgetRe, hgetIm]
  have h2_32_u : ((((2 : ℝ) ^ 32 : ℝ) : ℂ) * u) =
      ∑ k ∈ Finset.range 64, omega64 (-((start + t : ℤ) * k)) * zPix p.1 p.2 ij k := by
    unfold u unscaledAngular
    rw [Finset.mul_sum, Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro k _
    rw [cellEntry_eq_decodeClipped rows (2 ^ 26) k i j]
    have hmod : (start : ℤ) + t = m % 64 := by
      have h := Int.toNat_of_nonneg (Int.emod_nonneg m (by decide : (64 : ℤ) ≠ 0))
      rw [hm] at h
      push_cast at h
      exact h
    have hexp :
        Complex.exp (((-(m : ℝ) * (2 * Real.pi * k / ((64 : ℕ) : ℝ)) : ℝ) : ℂ) * Complex.I) =
          omega64 (-((start + t : ℤ) * k)) := by
      unfold omega64
      have h1 := CellNumerics.exp_integer_mod (by decide : 0 < 64) (-(m * k))
      have h2 := CellNumerics.exp_integer_mod (by decide : 0 < 64) (-((start + t : ℤ) * k))
      have heq : (-(m * k)) % (64 : ℤ) = (-((start + t : ℤ) * k)) % (64 : ℤ) := by
        have hdiv : (m % 64) * (k : ℤ) = m * k - 64 * ((m / 64) * k) := by
          have := Int.mul_ediv_add_emod m 64; nlinarith
        rw [hmod, hdiv]
        omega
      have hl :
          (((-(m : ℝ) * (2 * Real.pi * k / ((64 : ℕ) : ℝ)) : ℝ) : ℂ) * Complex.I) =
          (((2 * Real.pi * ((-(m * k) : ℤ) : ℝ) / ((64 : ℕ) : ℝ) : ℝ) : ℂ) * Complex.I) := by
        push_cast; ring
      have hr :
          (((2 * Real.pi * ((-((start + t : ℤ) * k) : ℤ) : ℝ) / ((64 : ℕ) : ℝ) : ℝ) : ℂ) *
            Complex.I) =
          (((2 * Real.pi * ((-((start + t : ℤ) * k) : ℤ) : ℝ) / 64 : ℝ) : ℂ) * Complex.I) := by
        push_cast; rfl
      rw [hl, h1]
      have heq' : (-(m * (k : ℤ)) % ((64 : ℕ) : ℤ)).toNat =
          (-((start + t : ℤ) * (k : ℤ)) % ((64 : ℕ) : ℤ)).toNat := congrArg Int.toNat heq
      rw [heq', ← h2, hr]
    rw [hexp]
    dsimp only [zPix, p, ij]
    push_cast
    field_simp
    ring
  have hcos : |(D : ℝ) * Real.cos (Real.pi / 4) - hM| ≤ hR := root8_cos_close
  have hinv0 : PixelInv {} 0 0 0 0 0 0 0 0 0 0 0 0 :=
    ⟨ComplexClose_zero, ComplexClose_zero, ComplexClose_zero, ComplexClose_zero,
     ComplexClose_zero, ComplexClose_zero, ComplexClose_zero, ComplexClose_zero,
     ComplexClose_zero, ComplexClose_zero, ComplexClose_zero, ComplexClose_zero⟩
  have hstep := pixelStep_sound start p.1 p.2 ij 8 (le_refl 8) {} 0 0 0 0 0 0 0 0 0 0 0 0 hinv0
  simp only [zero_add] at hstep
  have hfac := dft64_factor (t := t) hstart (fun k ↦ zPix p.1 p.2 ij k)
  rw [hfac] at h2_32_u
  have hsum_even : ∀ (w : ℕ → ℂ) (ar ai e : ℤ),
      (∀ s ∈ Finset.range 8,
        ∑ q ∈ Finset.range 8,
          Complex.exp (((-(t : ℝ) * (2 * Real.pi * q / 8) : ℝ) : ℂ) * Complex.I) *
            zPix p.1 p.2 ij (s + 8 * q) = w s) →
      ComplexClose (∑ s ∈ Finset.range 8, omega64 (-((start + t : ℤ) * s)) * w s) ar ai e →
      memFx u.re (finalizeEven ar ai e).1 ∧ memFx u.im (finalizeEven ar ai e).2 := by
    intro w ar ai e hw hcl
    have heq : ((((2 : ℝ) ^ 32 : ℝ) : ℂ) * u) =
        ∑ s ∈ Finset.range 8, omega64 (-((start + t : ℤ) * s)) * w s := by
      rw [h2_32_u]
      exact Finset.sum_congr rfl fun s hs ↦ by rw [hw s hs]
    rw [← heq] at hcl
    exact memFx_finalizeEven hcl
  have hsum_odd : ∀ (sg : ℤ), sg = 1 ∨ sg = -1 →
      ∀ (aFn bFn : ℕ → ℂ) (ar ai br bi ea eb : ℤ),
      (∀ s ∈ Finset.range 8,
        ∑ q ∈ Finset.range 8,
          Complex.exp (((-(t : ℝ) * (2 * Real.pi * q / 8) : ℝ) : ℂ) * Complex.I) *
            zPix p.1 p.2 ij (s + 8 * q) =
          aFn s + (((sg : ℝ) * Real.cos (Real.pi / 4) : ℝ) : ℂ) * bFn s) →
      ComplexClose (∑ s ∈ Finset.range 8, omega64 (-((start + t : ℤ) * s)) * aFn s) ar ai ea →
      ComplexClose (∑ s ∈ Finset.range 8, omega64 (-((start + t : ℤ) * s)) * bFn s) br bi eb →
      memFx u.re (finalizeOdd hM hR (iabs hM) sg ar ai br bi ea eb).1 ∧
      memFx u.im (finalizeOdd hM hR (iabs hM) sg ar ai br bi ea eb).2 := by
    intro sg hsg aFn bFn ar ai br bi ea eb hfn hA hB
    have heq : ((((2 : ℝ) ^ 32 : ℝ) : ℂ) * u) =
        (∑ s ∈ Finset.range 8, omega64 (-((start + t : ℤ) * s)) * aFn s) +
        (((sg : ℝ) * Real.cos (Real.pi / 4) : ℝ) : ℂ) *
          (∑ s ∈ Finset.range 8, omega64 (-((start + t : ℤ) * s)) * bFn s) := by
      rw [h2_32_u, Finset.mul_sum, ← Finset.sum_add_distrib]
      apply Finset.sum_congr rfl
      intro s hs
      rw [hfn s hs]; ring
    exact memFx_finalizeOdd hcos hsg heq hA hB
  unfold pixelOut PixelOut.reAt PixelOut.imAt
  interval_cases t
  · exact hsum_even _ _ _ _ (fun s _ ↦ (dft8_eval p.1 p.2 ij s).1) hstep.h0
  · exact hsum_odd 1 (Or.inl rfl) _ _ _ _ _ _ _ _
      (fun s _ ↦ by
        have h := (dft8_eval p.1 p.2 ij s).2.2.2.2.1
        dsimp only at h
        rw [h]; push_cast; ring) hstep.h1a hstep.h1b
  · exact hsum_even _ _ _ _ (fun s _ ↦ (dft8_eval p.1 p.2 ij s).2.1) hstep.h2
  · exact hsum_odd 1 (Or.inl rfl) _ _ _ _ _ _ _ _
      (fun s _ ↦ by
        have h := (dft8_eval p.1 p.2 ij s).2.2.2.2.2.2.1
        dsimp only at h
        rw [h]; push_cast; ring) hstep.h3a hstep.h3b
  · exact hsum_even _ _ _ _ (fun s _ ↦ (dft8_eval p.1 p.2 ij s).2.2.1) hstep.h4
  · exact hsum_odd (-1) (Or.inr rfl) _ _ _ _ _ _ _ _
      (fun s _ ↦ by
        have h := (dft8_eval p.1 p.2 ij s).2.2.2.2.2.1
        dsimp only at h
        rw [h]; push_cast; ring) hstep.h5a hstep.h5b
  · exact hsum_even _ _ _ _ (fun s _ ↦ (dft8_eval p.1 p.2 ij s).2.2.2.1) hstep.h6
  · exact hsum_odd (-1) (Or.inr rfl) _ _ _ _ _ _ _ _
      (fun s _ ↦ by
        have h := (dft8_eval p.1 p.2 ij s).2.2.2.2.2.2.2
        dsimp only at h
        rw [h]; push_cast; ring) hstep.h7a hstep.h7b

/-! ### 5. Soundness of `groupRadials`, `modeHeadFast`, and `groupResidues` -/

private theorem foldl_max_ge {α : Type*} (l : List α) (f : α → ℕ → ℕ)
    (hmono : ∀ a x, x ≤ f a x) : ∀ init : ℕ, init ≤ l.foldl (fun acc a ↦ f a acc) init := by
  induction l with
  | nil => intro init; exact le_refl _
  | cons a l ih =>
    intro init
    exact (hmono a init).trans (ih (f a init))

private theorem foldl_max_mono {α : Type*} (l : List α) (f : α → ℕ → ℕ)
    (hstep : ∀ a x y, x ≤ y → f a x ≤ f a y) :
    ∀ x y : ℕ, x ≤ y → l.foldl (fun acc a ↦ f a acc) x ≤ l.foldl (fun acc a ↦ f a acc) y := by
  induction l with
  | nil => intro x y hxy; exact hxy
  | cons a l ih => intro x y hxy; exact ih _ _ (hstep a x y hxy)

private theorem foldl_max_mem {α : Type*} (l : List α) (f : α → ℕ → ℕ)
    (hmono : ∀ a x, x ≤ f a x) (hstep : ∀ a x y, x ≤ y → f a x ≤ f a y) :
    ∀ {a}, a ∈ l → ∀ init : ℕ, f a init ≤ l.foldl (fun acc x ↦ f x acc) init := by
  induction l with
  | nil => intro _ ha; cases ha
  | cons x l ih =>
    intro a ha init
    simp only [List.foldl_cons]
    rcases List.mem_cons.mp ha with rfl | hmem
    · exact foldl_max_ge l f hmono (f a init)
    · exact (hstep a init (f x init) (hmono x init)).trans (ih hmem (f x init))

private theorem le_groupMaxCount {start k d : ℕ} (hk : k < 8)
    {m : ℤ} (hm : m ∈ frequencies 125 64 (start + k))
    (hd : d = m.natAbs ∨ d = (m - 1).natAbs) :
    126 - shift m ≤ groupMaxCount start d := by
  unfold groupMaxCount
  set inner : ℤ → ℕ → ℕ := fun m best ↦
    if m.natAbs == d || (m - 1).natAbs == d then max best (126 - shift m) else best
  have hinner_mono : ∀ m x, x ≤ inner m x := by
    intro m x; unfold inner; split_ifs <;> [exact le_max_left _ _; exact le_refl _]
  have hinner_step : ∀ m x y, x ≤ y → inner m x ≤ inner m y := by
    intro m x y hxy; unfold inner; split_ifs <;> [exact max_le_max_right _ hxy; exact hxy]
  set outer : ℕ → ℕ → ℕ := fun k best ↦
    (frequencies 125 64 (start + k)).foldl (fun b m ↦ inner m b) best
  have houter_mono : ∀ k x, x ≤ outer k x := fun k x ↦ foldl_max_ge _ inner hinner_mono x
  have houter_step : ∀ k x y, x ≤ y → outer k x ≤ outer k y :=
    fun k x y hxy ↦ foldl_max_mono _ inner hinner_step x y hxy
  have h1 := foldl_max_mem (List.range 8) outer houter_mono houter_step (List.mem_range.mpr hk) 0
  have h2 := foldl_max_mem (frequencies 125 64 (start + k)) inner hinner_mono hinner_step hm 0
  have hcond : (m.natAbs == d || (m - 1).natAbs == d) = true := by
    rcases hd with rfl | rfl <;> simp
  have h3 : 126 - shift m ≤ inner m 0 := by
    dsimp only [inner]
    rw [ite_eq_left hcond]
    exact le_max_right _ _
  exact h3.trans (h2.trans h1)

private theorem memFx_groupRadials {start k a i : ℕ} {m : ℤ}
    (hk : k < 8) (hm : m ∈ frequencies 125 64 (start + k))
    (hi : i < 128) (ha : a < 126 - shift m) :
    let radCache := groupRadials start (RadialCompute.momentsInt 1024 128 128 252)
    memFx
      (normalizedRadialMoment (cellMode m a 0).1.1 (cellMode m a 0).1.2
        ((6 : ℝ) * i / 128) ((6 : ℝ) * (i + 1) / 128))
      (GrotheQuad.getFx (radCache.getD m.natAbs #[]) a i) ∧
    memFx
      (normalizedRadialMoment (cellMode m 0 a).2.1 (cellMode m 0 a).2.2
        ((6 : ℝ) * i / 128) ((6 : ℝ) * (i + 1) / 128))
      (GrotheQuad.getFx (radCache.getD (m - 1).natAbs #[]) a i) := by
  dsimp only
  have hmRange : -125 ≤ m ∧ m ≤ 126 := by
    have hmem := (List.mem_filter.mp hm).1
    rcases List.mem_map.mp hmem with ⟨idx, hidx, rfl⟩
    rw [List.mem_range] at hidx
    omega
  have hgrid := grid_128_six ⟨i, hi⟩
  have hhelp : ∀ (d : ℕ) (hd : d = m.natAbs ∨ d = (m - 1).natAbs),
      d < 128 → (a + d) + a < 252 →
      memFx (normalizedRadialMoment (a + d) a ((6 : ℝ) * i / 128) ((6 : ℝ) * (i + 1) / 128))
        (GrotheQuad.getFx
          ((groupRadials start (RadialCompute.momentsInt 1024 128 128 252)).getD d #[]) a i) := by
    intro d hd hd128 hsum
    have hcnt : 126 - shift m ≤ groupMaxCount start d := le_groupMaxCount hk hm hd
    have hne : groupMaxCount start d ≠ 0 := by omega
    have hrow : GrotheQuad.getFx
        ((groupRadials start (RadialCompute.momentsInt 1024 128 128 252)).getD d #[]) a i =
        let v := getI (RadialCompute.radialRow 1024 (a + d) a (moments 1024 128 128 252 6)) i
        ⟨v.lo, v.hi⟩ := by
      unfold groupRadials radialFamilyFx radialRowFx GrotheQuad.getFx
      simp only [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, hd128, ↓reduceDIte,
        Option.getD_some, hne, ↓reduceIte, show a < groupMaxCount start d by omega,
        radialRowInt_eq]
      have hsz : i < (RadialCompute.radialRow 1024 (a + d) a
          (moments 1024 128 128 252 6)).size := by
        rw [RadialCompute.radialRow_eq_map]; simp [moments]; exact hi
      simp [getI, Array.getElem?_map, Array.getElem?_eq_getElem hsz]
    rw [hrow]
    have hmem := mem_radialRow 1024 (by decide) (n := 128) (by decide) 6 (a + d) a hsum hi
      hgrid.1 hgrid.2.1 hgrid.2.2.1 hgrid.2.2.2
    rw [← mem_fxToI_iff]
    change Upper.mem _
      (getI (RadialCompute.radialRow 1024 (a + d) a (moments 1024 128 128 252 6)) i)
    simpa only [Nat.cast_ofNat, Rat.cast_ofNat] using hmem
  have hml : (cellMode m a 0).1.1 = a + m.toNat ∧ (cellMode m a 0).1.2 = a + (-m).toNat := by
    simp [cellMode]
  have hmr : (cellMode m 0 a).2.1 = a + (1 - m).toNat ∧
      (cellMode m 0 a).2.2 = a + (m - 1).toNat := by
    simp [cellMode]
  constructor
  · rw [hml.1, hml.2]
    by_cases h0 : 0 ≤ m
    · have h1 : m.toNat = m.natAbs := by omega
      have h2 : (-m).toNat = 0 := by omega
      rw [h1, h2, Nat.add_zero]
      exact hhelp m.natAbs (Or.inl rfl) (by omega)
        (by unfold shift at ha; split_ifs at ha <;> omega)
    · have h1 : m.toNat = 0 := by omega
      have h2 : (-m).toNat = m.natAbs := by omega
      rw [h1, h2, Nat.add_zero, normalizedRadialMoment_comm]
      exact hhelp m.natAbs (Or.inl rfl) (by omega)
        (by unfold shift at ha; split_ifs at ha <;> omega)
  · rw [hmr.1, hmr.2]
    by_cases h1 : 1 ≤ m
    · have ha1 : (1 - m).toNat = 0 := by omega
      have ha2 : (m - 1).toNat = (m - 1).natAbs := by omega
      rw [ha1, ha2, Nat.add_zero, normalizedRadialMoment_comm]
      exact hhelp (m - 1).natAbs (Or.inr rfl) (by omega)
        (by unfold shift at ha; split_ifs at ha <;> omega)
    · have ha1 : (1 - m).toNat = (m - 1).natAbs := by omega
      have ha2 : (m - 1).toNat = 0 := by omega
      rw [ha1, ha2, Nat.add_zero]
      exact hhelp (m - 1).natAbs (Or.inr rfl) (by omega)
        (by unfold shift at ha; split_ifs at ha <;> omega)

private noncomputable def unscaledCoeff (table : Array (ℤ × ℤ)) (m : ℤ) (a b : ℕ) : ℂ :=
  ∑ i ∈ Finset.range 128,
    (normalizedRadialMoment (cellMode m a b).1.1 (cellMode m a b).1.2
      ((6 : ℝ) * i / 128) ((6 : ℝ) * (i + 1) / 128) : ℂ) *
    ∑ j ∈ Finset.range 128,
      unscaledAngular table (2 ^ 26) 128 64 m i j *
        (normalizedRadialMoment (cellMode m a b).2.1 (cellMode m a b).2.2
          ((6 : ℝ) * j / 128) ((6 : ℝ) * (j + 1) / 128) : ℂ)

private theorem inner_eq_sinc_mul_unscaled (table : Array (ℤ × ℤ)) (m : ℤ) (a b : ℕ) :
    ⟪hvec2 (cellMode m a b), cellVector table (2 ^ 26) 128 64 6⟫_ℂ =
      (Real.sinc ((m : ℝ) * (Real.pi / 64)) : ℂ) * unscaledCoeff table m a b := by
  rw [cellVector, cellCoefficient_eq_inner table (2 ^ 26) 64 (by decide) (by norm_num)
    (cellMode m a b) (cellMode_charge m a b)]
  unfold cellCoefficient cellRowCoefficient unscaledCoeff
  simp_rw [cellMode_frequency, angularCellCoefficient_eq_sinc (by decide : 0 < 64), Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro i _
  apply Finset.sum_congr rfl
  intro j _
  push_cast; ring

private theorem mem_band3_pair {count a b : ℕ} (hcount128 : count ≤ 128) (hab : a + b < count)
    {lFn RFre RFim RGre RGim : ℕ → ℕ → ℝ}
    {left rF_re rF_im rG_re rG_im : Array (Array GrotheQuad.Fx)}
    (hleftSz : count ≤ left.size)
    (hsz_rF_re : rF_re.size = count) (hsz_rF_im : rF_im.size = count)
    (hsz_rG_re : rG_re.size = count) (hsz_rG_im : rG_im.size = count)
    (hleft : ∀ a i, a < count → i < 128 → memFx (lFn a i) (GrotheQuad.getFx left a i))
    (hrFre : ∀ b i, b < count → i < 128 → memFx (RFre b i) (GrotheQuad.getFx rF_re b i))
    (hrFim : ∀ b i, b < count → i < 128 → memFx (RFim b i) (GrotheQuad.getFx rF_im b i))
    (hrGre : ∀ b i, b < count → i < 128 → memFx (RGre b i) (GrotheQuad.getFx rG_re b i))
    (hrGim : ∀ b i, b < count → i < 128 → memFx (RGim b i) (GrotheQuad.getFx rG_im b i))
    {uF uG : ℂ}
    (huFre : uF.re = ∑ i ∈ Finset.range 128, lFn a i * RFre b i)
    (huFim : uF.im = ∑ i ∈ Finset.range 128, lFn a i * RFim b i)
    (huGre : uG.re = ∑ i ∈ Finset.range 128, lFn a i * RGre b i)
    (huGim : uG.im = ∑ i ∈ Finset.range 128, lFn a i * RGim b i) :
    let n0 := count - 64
    let n1 := count - 32
    let b1 := min count 64
    let b2 := min count 32
    let c0F_re := GrotheQuad.mulBT left n0 rF_re 128
    let c0F_im := GrotheQuad.mulBT left n0 rF_im 128
    let c0G_re := GrotheQuad.mulBT left n0 rG_re 128
    let c0G_im := GrotheQuad.mulBT left n0 rG_im 128
    let left1 := left.extract n0 n1
    let t1_re := rF_re.extract 0 b1 ++ rG_re.extract 0 b1
    let t1_im := rF_im.extract 0 b1 ++ rG_im.extract 0 b1
    let c1_re := GrotheQuad.mulBT left1 (n1 - n0) t1_re 128
    let c1_im := GrotheQuad.mulBT left1 (n1 - n0) t1_im 128
    let left2 := left.extract n1 count
    let t2 := rF_re.extract 0 b2 ++ rF_im.extract 0 b2 ++
      rG_re.extract 0 b2 ++ rG_im.extract 0 b2
    let c2 := GrotheQuad.mulBT left2 (count - n1) t2 128
    let p :=
      if a < n0 then
        (GrotheQuad.getFx c0F_re a b, GrotheQuad.getFx c0F_im a b,
         GrotheQuad.getFx c0G_re a b, GrotheQuad.getFx c0G_im a b)
      else if a < n1 then
        let a' := a - n0
        (GrotheQuad.getFx c1_re a' b, GrotheQuad.getFx c1_im a' b,
         GrotheQuad.getFx c1_re a' (b1 + b), GrotheQuad.getFx c1_im a' (b1 + b))
      else
        let a' := a - n1
        (GrotheQuad.getFx c2 a' b, GrotheQuad.getFx c2 a' (b2 + b),
         GrotheQuad.getFx c2 a' (2 * b2 + b), GrotheQuad.getFx c2 a' (3 * b2 + b))
    memC uF ⟨fxToI p.1, fxToI p.2.1⟩ ∧
    memC uG ⟨fxToI p.2.2.1, fxToI p.2.2.2⟩ := by
  dsimp only
  set n0 := count - 64
  set n1 := count - 32
  set b1 := min count 64
  set b2 := min count 32
  by_cases ha0 : a < n0
  · rw [ite_eq_left ha0]
    dsimp only
    have hb128 : b < 128 := by omega
    have hbc : b < count := by omega
    constructor
    · constructor
      · apply mem_fxToI_iff.mpr; rw [huFre]
        exact memFx_mulBT_entry ha0 hb128
          (fun i hi ↦ hleft a i (by omega) hi) (fun i hi ↦ hrFre b i hbc hi)
      · apply mem_fxToI_iff.mpr; rw [huFim]
        exact memFx_mulBT_entry ha0 hb128
          (fun i hi ↦ hleft a i (by omega) hi) (fun i hi ↦ hrFim b i hbc hi)
    · constructor
      · apply mem_fxToI_iff.mpr; rw [huGre]
        exact memFx_mulBT_entry ha0 hb128
          (fun i hi ↦ hleft a i (by omega) hi) (fun i hi ↦ hrGre b i hbc hi)
      · apply mem_fxToI_iff.mpr; rw [huGim]
        exact memFx_mulBT_entry ha0 hb128
          (fun i hi ↦ hleft a i (by omega) hi) (fun i hi ↦ hrGim b i hbc hi)
  · by_cases ha1 : a < n1
    · rw [ite_eq_right ha0, ite_eq_left ha1]
      dsimp only
      have ha' : a - n0 < n1 - n0 := by omega
      have hbb1 : b < b1 := by omega
      have hb128 : b < 128 := by omega
      have hbb1_128 : b1 + b < 128 := by omega
      have hbc : b < count := by omega
      have hsz1F : (rF_re.extract 0 b1).size = b1 := by rw [Array.size_extract, hsz_rF_re]; omega
      have hsz1Fi : (rF_im.extract 0 b1).size = b1 := by rw [Array.size_extract, hsz_rF_im]; omega
      have hsz1G : (rG_re.extract 0 b1).size = b1 := by rw [Array.size_extract, hsz_rG_re]; omega
      have hsz1Gi : (rG_im.extract 0 b1).size = b1 := by rw [Array.size_extract, hsz_rG_im]; omega
      have hl1 : ∀ i < 128,
          memFx (lFn a i) (GrotheQuad.getFx (left.extract n0 n1) (a - n0) i) := by
        intro i hi
        rw [getFx_extract ha' (by omega), show n0 + (a - n0) = a by omega]
        exact hleft a i (by omega) hi
      have hr1Fre : ∀ i < 128,
          memFx (RFre b i) (GrotheQuad.getFx (rF_re.extract 0 b1 ++ rG_re.extract 0 b1) b i) := by
        intro i hi
        rw [getFx_append_left (by omega), getFx_extract (by omega) (by omega), Nat.zero_add]
        exact hrFre b i hbc hi
      have hr1Fim : ∀ i < 128,
          memFx (RFim b i) (GrotheQuad.getFx (rF_im.extract 0 b1 ++ rG_im.extract 0 b1) b i) := by
        intro i hi
        rw [getFx_append_left (by omega), getFx_extract (by omega) (by omega), Nat.zero_add]
        exact hrFim b i hbc hi
      have hr1Gre : ∀ i < 128,
          memFx (RGre b i)
            (GrotheQuad.getFx (rF_re.extract 0 b1 ++ rG_re.extract 0 b1) (b1 + b) i) := by
        intro i hi
        rw [getFx_append_right_of_eq hsz1F (by omega),
          getFx_extract (by omega) (by omega), Nat.zero_add]
        exact hrGre b i hbc hi
      have hr1Gim : ∀ i < 128,
          memFx (RGim b i)
            (GrotheQuad.getFx (rF_im.extract 0 b1 ++ rG_im.extract 0 b1) (b1 + b) i) := by
        intro i hi
        rw [getFx_append_right_of_eq hsz1Fi (by omega),
          getFx_extract (by omega) (by omega), Nat.zero_add]
        exact hrGim b i hbc hi
      constructor
      · constructor
        · apply mem_fxToI_iff.mpr; rw [huFre]
          exact memFx_mulBT_entry ha' hb128 hl1 hr1Fre
        · apply mem_fxToI_iff.mpr; rw [huFim]
          exact memFx_mulBT_entry ha' hb128 hl1 hr1Fim
      · constructor
        · apply mem_fxToI_iff.mpr; rw [huGre]
          exact memFx_mulBT_entry ha' hbb1_128 hl1 hr1Gre
        · apply mem_fxToI_iff.mpr; rw [huGim]
          exact memFx_mulBT_entry ha' hbb1_128 hl1 hr1Gim
    · rw [ite_eq_right ha0, ite_eq_right ha1]
      dsimp only
      have ha' : a - n1 < count - n1 := by omega
      have hbb2 : b < b2 := by omega
      have hb128 : b < 128 := by omega
      have h1b2 : b2 + b < 128 := by omega
      have h2b2 : 2 * b2 + b < 128 := by omega
      have h3b2 : 3 * b2 + b < 128 := by omega
      have hbc : b < count := by omega
      have hsz2Fre : (rF_re.extract 0 b2).size = b2 := by rw [Array.size_extract, hsz_rF_re]; omega
      have hsz2Fim : (rF_im.extract 0 b2).size = b2 := by rw [Array.size_extract, hsz_rF_im]; omega
      have hsz2Gre : (rG_re.extract 0 b2).size = b2 := by rw [Array.size_extract, hsz_rG_re]; omega
      have hsz2Gim : (rG_im.extract 0 b2).size = b2 := by rw [Array.size_extract, hsz_rG_im]; omega
      have hsz12 : (rF_re.extract 0 b2 ++ rF_im.extract 0 b2).size = 2 * b2 := by
        rw [Array.size_append, hsz2Fre, hsz2Fim]; omega
      have hsz123 : (rF_re.extract 0 b2 ++ rF_im.extract 0 b2 ++ rG_re.extract 0 b2).size =
          3 * b2 := by
        rw [Array.size_append, hsz12, hsz2Gre]; omega
      have hl2 : ∀ i < 128,
          memFx (lFn a i) (GrotheQuad.getFx (left.extract n1 count) (a - n1) i) := by
        intro i hi
        rw [getFx_extract ha' (by omega), show n1 + (a - n1) = a by omega]
        exact hleft a i (by omega) hi
      let t2' := rF_re.extract 0 b2 ++ rF_im.extract 0 b2 ++
        rG_re.extract 0 b2 ++ rG_im.extract 0 b2
      have hr2Fre : ∀ i < 128, memFx (RFre b i) (GrotheQuad.getFx t2' b i) := by
        intro i hi
        dsimp only [t2']
        rw [getFx_append_left (by omega), getFx_append_left (by omega),
          getFx_append_left (by omega), getFx_extract (by omega) (by omega), Nat.zero_add]
        exact hrFre b i hbc hi
      have hr2Fim : ∀ i < 128, memFx (RFim b i) (GrotheQuad.getFx t2' (b2 + b) i) := by
        intro i hi
        dsimp only [t2']
        rw [getFx_append_left (by omega), getFx_append_left (by omega),
          getFx_append_right_of_eq hsz2Fre (by omega),
          getFx_extract (by omega) (by omega), Nat.zero_add]
        exact hrFim b i hbc hi
      have hr2Gre : ∀ i < 128, memFx (RGre b i) (GrotheQuad.getFx t2' (2 * b2 + b) i) := by
        intro i hi
        dsimp only [t2']
        rw [getFx_append_left (by omega), getFx_append_right_of_eq hsz12 (by omega),
          getFx_extract (by omega) (by omega), Nat.zero_add]
        exact hrGre b i hbc hi
      have hr2Gim : ∀ i < 128, memFx (RGim b i) (GrotheQuad.getFx t2' (3 * b2 + b) i) := by
        intro i hi
        dsimp only [t2']
        rw [getFx_append_right_of_eq hsz123 (by omega),
          getFx_extract (by omega) (by omega), Nat.zero_add]
        exact hrGim b i hbc hi
      constructor
      · constructor
        · apply mem_fxToI_iff.mpr; rw [huFre]
          exact memFx_mulBT_entry ha' hb128 hl2 hr2Fre
        · apply mem_fxToI_iff.mpr; rw [huFim]
          exact memFx_mulBT_entry ha' h1b2 hl2 hr2Fim
      · constructor
        · apply mem_fxToI_iff.mpr; rw [huGre]
          exact memFx_mulBT_entry ha' h2b2 hl2 hr2Gre
        · apply mem_fxToI_iff.mpr; rw [huGim]
          exact memFx_mulBT_entry ha' h3b2 hl2 hr2Gim

theorem mem_modeHeadFast {K j : ℕ} (hK : K + 1 ≤ 128) (hj : j ≤ K) (m : ℤ) (sinc : Ival)
    (hsinc : Upper.mem (Real.sinc ((m : ℝ) * (Real.pi / 64))) sinc)
    {left right : Array (Array GrotheQuad.Fx)}
    (hleftSz : K + 1 - shift m ≤ left.size)
    {angF angG : Array (Array GrotheQuad.Fx) × Array (Array GrotheQuad.Fx)}
    {F G : Array (ℤ × ℤ)}
    (hleft : ∀ a i : ℕ, a < K + 1 - shift m → i < 128 →
      memFx (normalizedRadialMoment (cellMode m a 0).1.1 (cellMode m a 0).1.2
        ((6 : ℝ) * i / 128) ((6 : ℝ) * (i + 1) / 128)) (GrotheQuad.getFx left a i))
    (hright : ∀ b j : ℕ, b < K + 1 - shift m → j < 128 →
      memFx (normalizedRadialMoment (cellMode m 0 b).2.1 (cellMode m 0 b).2.2
        ((6 : ℝ) * j / 128) ((6 : ℝ) * (j + 1) / 128)) (GrotheQuad.getFx right b j))
    (hF : ∀ i j : ℕ, i < 128 → j < 128 →
      memFx (unscaledAngular F (2 ^ 26) 128 64 m i j).re (GrotheQuad.getFx angF.1 i j) ∧
      memFx (unscaledAngular F (2 ^ 26) 128 64 m i j).im (GrotheQuad.getFx angF.2 i j))
    (hG : ∀ i j : ℕ, i < 128 → j < 128 →
      memFx (unscaledAngular G (2 ^ 26) 128 64 m i j).re (GrotheQuad.getFx angG.1 i j) ∧
      memFx (unscaledAngular G (2 ^ 26) 128 64 m i j).im (GrotheQuad.getFx angG.2 i j)) :
    Upper.mem
      (modeGrade j m fun m a b ↦
        crossCoefficient (cellVector F (2 ^ 26) 128 64 6) (cellVector G (2 ^ 26) 128 64 6)
          (cellMode m a b))
      (getI (modeHeadFast K m sinc left right angF angG) j) := by
  set offset := shift m
  set count := K + 1 - offset
  have hcount128 : count ≤ 128 := by omega
  set lFn : ℕ → ℕ → ℝ := fun a i ↦
    normalizedRadialMoment (cellMode m a 0).1.1 (cellMode m a 0).1.2
      ((6 : ℝ) * i / 128) ((6 : ℝ) * (i + 1) / 128)
  set rFn : ℕ → ℕ → ℝ := fun b j ↦
    normalizedRadialMoment (cellMode m 0 b).2.1 (cellMode m 0 b).2.2
      ((6 : ℝ) * j / 128) ((6 : ℝ) * (j + 1) / 128)
  set rF_re := GrotheQuad.mulBT right count angF.1 128
  set rF_im := GrotheQuad.mulBT right count angF.2 128
  set rG_re := GrotheQuad.mulBT right count angG.1 128
  set rG_im := GrotheQuad.mulBT right count angG.2 128
  set RFre : ℕ → ℕ → ℝ := fun b i ↦
    ∑ j ∈ Finset.range 128, rFn b j * (unscaledAngular F (2 ^ 26) 128 64 m i j).re
  set RFim : ℕ → ℕ → ℝ := fun b i ↦
    ∑ j ∈ Finset.range 128, rFn b j * (unscaledAngular F (2 ^ 26) 128 64 m i j).im
  set RGre : ℕ → ℕ → ℝ := fun b i ↦
    ∑ j ∈ Finset.range 128, rFn b j * (unscaledAngular G (2 ^ 26) 128 64 m i j).re
  set RGim : ℕ → ℕ → ℝ := fun b i ↦
    ∑ j ∈ Finset.range 128, rFn b j * (unscaledAngular G (2 ^ 26) 128 64 m i j).im
  have hrFre : ∀ b i, b < count → i < 128 → memFx (RFre b i) (GrotheQuad.getFx rF_re b i) :=
    fun b i hb hi ↦ memFx_mulBT_entry hb hi (fun j hj ↦ hright b j hb hj)
      (fun j hj ↦ (hF i j hi hj).1)
  have hrFim : ∀ b i, b < count → i < 128 → memFx (RFim b i) (GrotheQuad.getFx rF_im b i) :=
    fun b i hb hi ↦ memFx_mulBT_entry hb hi (fun j hj ↦ hright b j hb hj)
      (fun j hj ↦ (hF i j hi hj).2)
  have hrGre : ∀ b i, b < count → i < 128 → memFx (RGre b i) (GrotheQuad.getFx rG_re b i) :=
    fun b i hb hi ↦ memFx_mulBT_entry hb hi (fun j hj ↦ hright b j hb hj)
      (fun j hj ↦ (hG i j hi hj).1)
  have hrGim : ∀ b i, b < count → i < 128 → memFx (RGim b i) (GrotheQuad.getFx rG_im b i) :=
    fun b i hb hi ↦ memFx_mulBT_entry hb hi (fun j hj ↦ hright b j hb hj)
      (fun j hj ↦ (hG i j hi hj).2)
  have hreEq : ∀ (T : Array (ℤ × ℤ)) (a b : ℕ),
      (unscaledCoeff T m a b).re =
        ∑ i ∈ Finset.range 128, lFn a i *
          ∑ j ∈ Finset.range 128, rFn b j * (unscaledAngular T (2 ^ 26) 128 64 m i j).re := by
    intro T a b
    unfold unscaledCoeff
    rw [Complex.re_sum]
    apply Finset.sum_congr rfl
    intro i _
    have hcm1 : (cellMode m a b).1 = (cellMode m a 0).1 := by simp [cellMode]
    have hcm2 : (cellMode m a b).2 = (cellMode m 0 b).2 := by simp [cellMode]
    rw [hcm1, hcm2, Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im, zero_mul, sub_zero,
      Complex.re_sum]
    congr 1
    apply Finset.sum_congr rfl
    intro j _
    rw [Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im, mul_zero, sub_zero, mul_comm]
  have himEq : ∀ (T : Array (ℤ × ℤ)) (a b : ℕ),
      (unscaledCoeff T m a b).im =
        ∑ i ∈ Finset.range 128, lFn a i *
          ∑ j ∈ Finset.range 128, rFn b j * (unscaledAngular T (2 ^ 26) 128 64 m i j).im := by
    intro T a b
    unfold unscaledCoeff
    rw [Complex.im_sum]
    apply Finset.sum_congr rfl
    intro i _
    have hcm1 : (cellMode m a b).1 = (cellMode m a 0).1 := by simp [cellMode]
    have hcm2 : (cellMode m a b).2 = (cellMode m 0 b).2 := by simp [cellMode]
    rw [hcm1, hcm2, Complex.mul_im, Complex.ofReal_re, Complex.ofReal_im, zero_mul, add_zero,
      Complex.im_sum]
    congr 1
    apply Finset.sum_congr rfl
    intro j _
    rw [Complex.mul_im, Complex.ofReal_re, Complex.ofReal_im, mul_zero, zero_add, mul_comm]
  have hsz_rF_re : rF_re.size = count := by simp [rF_re, GrotheQuad.mulBT]
  have hsz_rF_im : rF_im.size = count := by simp [rF_im, GrotheQuad.mulBT]
  have hsz_rG_re : rG_re.size = count := by simp [rG_re, GrotheQuad.mulBT]
  have hsz_rG_im : rG_im.size = count := by simp [rG_im, GrotheQuad.mulBT]
  unfold modeHeadFast
  rw [getI_ofFn _ (by omega)]
  change Upper.mem
    (if modeShift m ≤ j then
      ∑ a ∈ Finset.range (j - modeShift m + 1),
        crossCoefficient (cellVector F (2 ^ 26) 128 64 6) (cellVector G (2 ^ 26) 128 64 6)
          (cellMode m a (j - modeShift m - a))
    else 0)
    (if offset ≤ j then _ else zeroI)
  have hsh : offset = modeShift m := rfl
  rw [hsh]
  by_cases hle : modeShift m ≤ j
  · rw [ite_eq_left hle, ite_eq_left hle]
    have hsumEq :
        ∑ a ∈ Finset.range (j - modeShift m + 1),
          crossCoefficient (cellVector F (2 ^ 26) 128 64 6) (cellVector G (2 ^ 26) 128 64 6)
            (cellMode m a (j - modeShift m - a)) =
        (Real.sinc ((m : ℝ) * (Real.pi / 64)) * Real.sinc ((m : ℝ) * (Real.pi / 64))) *
        ∑ a ∈ Finset.range (j - modeShift m + 1),
          (conj (unscaledCoeff F m a (j - modeShift m - a)) *
            unscaledCoeff G m a (j - modeShift m - a)).re := by
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro a _
      unfold crossCoefficient
      rw [inner_eq_sinc_mul_unscaled F, inner_eq_sinc_mul_unscaled G, map_mul, Complex.conj_ofReal]
      set s := Real.sinc ((m : ℝ) * (Real.pi / 64))
      set uF := unscaledCoeff F m a (j - modeShift m - a)
      set uG := unscaledCoeff G m a (j - modeShift m - a)
      have hre : ((s : ℂ) * conj uF * ((s : ℂ) * uG)).re =
          (((s * s : ℝ) : ℂ) * (conj uF * uG)).re := by
        congr 1; push_cast; ring
      rw [hre, Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im, zero_mul, sub_zero]
    rw [hsumEq]
    apply mem_mul (mem_mul hsinc hsinc)
    apply mem_sumI
    intro a ha
    have hab : a + (j - modeShift m - a) < count := by
      dsimp only [count]
      rw [hsh]
      omega
    have hp := mem_band3_pair hcount128 hab hleftSz
      hsz_rF_re hsz_rF_im hsz_rG_re hsz_rG_im
      hleft hrFre hrFim hrGre hrGim
      (hreEq F a (j - modeShift m - a)) (himEq F a (j - modeShift m - a))
      (hreEq G a (j - modeShift m - a)) (himEq G a (j - modeShift m - a))
    exact mem_overlapI hp.1 hp.2
  · rw [ite_eq_right hle, ite_eq_right hle]
    exact Upper.mem_zero

private theorem mem_groupResiduesOf (L R : Array String) {start k j : ℕ}
    (hstart : start % 8 = 0) (hk : k < 8) (hj : j ≤ 125) :
    Upper.mem
      (((frequencies 125 64 (start + k)).map fun m ↦ modeGrade j m fun m a b ↦
        crossCoefficient
          (cellVector (CellEncoding.decode L) (2 ^ 26) 128 64 6)
          (cellVector (CellEncoding.decode R) (2 ^ 26) 128 64 6)
          (cellMode m a b)).sum)
      (getI ((groupResiduesOf L R (rootTable 64) (rootTable 128) CellNumerics.piInvI
        (RadialCompute.momentsInt 1024 128 128 252) start)[k]?.getD #[]) j) := by
  unfold groupResiduesOf
  rw [Array.getElem?_ofFn, dite_eq_left hk, Option.getD_some]
  dsimp only
  apply mem_headsSum hj
  intro m hm
  have hres : (m % (64 : ℤ)).toNat = start + k := by
    simpa only [beq_iff_eq, Nat.cast_ofNat] using (List.mem_filter.mp hm).2
  have hsinc : Upper.mem (Real.sinc ((m : ℝ) * (Real.pi / 64)))
      (sincAt 64 (rootTable 128) CellNumerics.piInvI m) := by
    rw [sincAt_rootTable (by decide : 0 < 64)]
    exact CellNumerics.mem_sincI (by decide : 0 < 64) m
  have hmRange : -125 ≤ m ∧ m ≤ 126 := by
    have hmem := (List.mem_filter.mp hm).1
    rcases List.mem_map.mp hmem with ⟨idx, hidx, rfl⟩
    rw [List.mem_range] at hidx
    omega
  have hleftSz : 126 - shift m ≤
      ((groupRadials start
        (RadialCompute.momentsInt 1024 128 128 252)).getD m.natAbs #[]).size := by
    have hcnt := le_groupMaxCount hk hm (Or.inl rfl)
    have hne : groupMaxCount start m.natAbs ≠ 0 := by
      unfold shift at hcnt; split_ifs at hcnt <;> omega
    have hm128 : m.natAbs < 128 := by omega
    unfold groupRadials radialFamilyFx
    simp only [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, hm128, ↓reduceDIte,
      Option.getD_some, hne, ↓reduceIte, Array.size_ofFn]
    exact hcnt
  exact mem_modeHeadFast (by decide) hj m _ hsinc hleftSz
    (fun a i ha hi ↦ (memFx_groupRadials hk hm hi ha).1)
    (fun b j hb hj ↦ (memFx_groupRadials hk hm hj hb).2)
    (fun i j hi hj ↦ memFx_angularGroup8Fx L hstart hk hi hj hres)
    (fun i j hi hj ↦ memFx_angularGroup8Fx R hstart hk hi hj hres)

theorem mem_groupResidues {start k j : ℕ} (hstart : start % 8 = 0)
    (hk : k < 8) (hj : j ≤ 125) :
    Upper.mem
      (((frequencies 125 64 (start + k)).map fun m ↦ modeGrade j m fun m a b ↦
        crossCoefficient
          (cellVector (CellEncoding.decode leftCellRows) (2 ^ 26) 128 64 6)
          (cellVector (CellEncoding.decode rightCellRows) (2 ^ 26) 128 64 6)
          (cellMode m a b)).sum)
      (getI ((groupResidues start)[k]?.getD #[]) j) := by
  unfold groupResidues
  rw [RootData.roots64_eq, RootData.roots128_eq, RootData.piInvI_eq]
  exact mem_groupResiduesOf leftCellRows rightCellRows hstart hk hj

end

end Grothe.UpperReplacement.FastGroup
