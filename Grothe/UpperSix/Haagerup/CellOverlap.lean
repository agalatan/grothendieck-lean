import Grothe.UpperSix.Haagerup.CellOverlapCore

-- Agent-ID: codex-a7c4

set_option warningAsError true
set_option maxRecDepth 4096
set_option exponentiation.threshold 2048

namespace Haagerup
open Finset Polynomial Real HaagerupKernel HaagerupKernel.Cell HaagerupKernel.Hardy
noncomputable section

section
attribute [local irreducible] Array.ofFn List.ofFn List.flatten sumInt sumIval lagTable1024 binomArr251 headIdx flatIdx
set_option maxHeartbeats 700000 in
/-- Master soundness of `smoothedRowsCheck`: `bivarT 251 rows PI QI 501 167` encloses
`bivarKernel P Q (energy (toLp (smoothMap ct st se ce (cellFn creArr cimArr))))` on `j < 251`. -/
theorem mem_bivarT_smoothed {creArr cimArr qreArr qimArr : Array Int}
    (hsos : sosAllOK creArr cimArr qreArr qimArr = true)
    {cn sn chyp se ce ehyp : ℕ}
    (hd : ((cn : ℝ) / chyp) ^ 2 + ((sn : ℝ) / chyp) ^ 2 = 1)
    (he : ((se : ℝ) / ehyp) ^ 2 + ((ce : ℝ) / ehyp) ^ 2 = 1)
    {rows : List RowI}
    (hcheck : smoothedRowsCheck creArr cimArr cn sn chyp se ce ehyp rows = true)
    {P Q : ℝ[X]} {PI QI : List Ival}
    (hQ0 : Q.coeff 0 = 0) (hP : memB 251 P PI) (hQ : memB 251 Q QI) :
    let ct := (cn : ℝ) / chyp; let st := (sn : ℝ) / chyp
    let seR := (se : ℝ) / ehyp; let ceR := (ce : ℝ) / ehyp
    let G := (memLp_smoothMap ct st seR ceR (measurable_cellFn creArr cimArr)
      (norm_cellFn_le hsos)).toLp (smoothMap ct st seR ceR (cellFn creArr cimArr))
    ∀ j < 251, mem (bivarKernel P Q (energy G) j) ((bivarT 251 rows PI QI 501 167).getD j zeroI) := by
  dsimp only
  set ct := (cn : ℝ) / chyp; set st := (sn : ℝ) / chyp
  set seR := (se : ℝ) / ehyp; set ceR := (ce : ℝ) / ehyp
  set G := (memLp_smoothMap ct st seR ceR (measurable_cellFn creArr cimArr)
    (norm_cellFn_le hsos)).toLp (smoothMap ct st seR ceR (cellFn creArr cimArr))
  have hcomp := (smoothedRowsCheck_iff creArr cimArr cn sn chyp se ce ehyp rows).1 hcheck
  clear hcheck
  unfold computeSmoothedRows at hcomp
  have hlag_s : ∀ a < 19, ∀ n ≤ 250, ∀ i < 64,
      memLag (cellLagInt a n i) (((lagTable1024.getD a #[]).getD n #[]).getD i (0, 0)) :=
    fun _ ha _ hn _ hi => lagTable1024_sound ha hn hi
  have hbin_s : ∀ n ≤ 251, ∀ k ≤ n, getBinom binomArr251 n k = n.choose k :=
    fun _ hn _ hk => getBinom_binomArr251 hn hk
  have hb_ext := @extractBMids_sound
  generalize lagTable1024 = lagTbl at hcomp hlag_s
  generalize binomArr251 = binomTbl at hcomp hbin_s
  generalize bTable1024 = bTblFn at hcomp hb_ext
  dsimp (config := { iota := false, proj := false, zetaDelta := false }) only at hcomp
  generalize hov_eq : modeOverlapsAt sh416 sh680 creArr cimArr lagTbl = ovRes at hcomp
  rcases ovRes with ⟨lagOK, ov560⟩
  set denM : ℤ := Int.ofNat (ehyp * chyp)
  set u0N : ℤ := Int.ofNat (ehyp * cn)
  set u1N : ℤ := -(Int.ofNat (se * sn))
  set v0N : ℤ := Int.ofNat (ehyp * sn)
  set v1N : ℤ := Int.ofNat (se * cn)
  generalize hext_eq : extractBMids (bTblFn u0N u1N v0N v1N denM) = extRes at hcomp
  rcases extRes with ⟨bOK, bMid512, bMid400⟩
  injection hcomp with hallOK hrows_eq
  simp only [Bool.and_eq_true, decide_eq_true_eq] at hallOK
  obtain ⟨⟨⟨⟨hec_pos, hlagOK⟩, hgOK⟩, hbOK⟩, ht1OK⟩ := hallOK
  subst hlagOK hbOK
  have hdenM_pos : (0 : ℤ) < denM := by
    dsimp only [denM]; simp only [Int.ofNat_eq_natCast]; exact_mod_cast hec_pos
  have hehyp_pos : 0 < ehyp := Nat.pos_of_mul_pos_right hec_pos
  have hchyp_pos : 0 < chyp := Nat.pos_of_mul_pos_left hec_pos
  have hu0_eq : (u0N : ℝ) / denM = ct := by
    dsimp only [u0N, denM, ct]; push_cast [Int.ofNat_eq_natCast]
    have : (ehyp : ℝ) ≠ 0 := by positivity
    have : (chyp : ℝ) ≠ 0 := by positivity
    field_simp
  have hu1_eq : (u1N : ℝ) / denM = -(seR * st) := by
    dsimp only [u1N, denM, seR, st]; push_cast [Int.ofNat_eq_natCast]
    have : (ehyp : ℝ) ≠ 0 := by positivity
    have : (chyp : ℝ) ≠ 0 := by positivity
    field_simp
  have hv0_eq : (v0N : ℝ) / denM = st := by
    dsimp only [v0N, denM, st]; push_cast [Int.ofNat_eq_natCast]
    have : (ehyp : ℝ) ≠ 0 := by positivity
    have : (chyp : ℝ) ≠ 0 := by positivity
    field_simp
  have hv1_eq : (v1N : ℝ) / denM = seR * ct := by
    dsimp only [v1N, denM, seR, ct]; push_cast [Int.ofNat_eq_natCast]
    have : (ehyp : ℝ) ≠ 0 := by positivity
    have : (chyp : ℝ) ≠ 0 := by positivity
    field_simp
  -- Characterize `flatIdx rows` without unrolling `Fin 168`:
  obtain ⟨hflat_nodup, hflat_iff, hrow_mem⟩ :=
    flatIdx_ofFn_props (M := 168) rfl hrows_eq fun _ _ => match_triple_fst _ _ _
  have hpar := energy_eq_zero_of_even
    (memLp_smoothMap ct st seR ceR (measurable_cellFn creArr cimArr) (norm_cellFn_le hsos))
    (fun c x hc => smoothMap_rot2 ct st seR ceR (fun _ v hc' => cellFn_rot2 creArr cimArr hc' v) hc x)
  refine mem_bivarT_of_table (N := 501) (K := 251) (NZ := 501) (MW := 167)
    (by omega) hQ0 hP hQ (energy G) hpar hflat_nodup
    (fun p hp => ((hflat_iff p).1 hp).2)
    (fun p hp hnp => hpar p (by
      have hno : (p.1 + p.2) % 2 ≠ 1 := fun ho => hnp ((hflat_iff p).2 ⟨ho, hp⟩)
      omega)) ?_
  -- Prove enclosure `hb` for every row `r` and entry `e ∈ r.2`:
  intro r hr
  obtain ⟨hd2_167, he_fn⟩ := hrow_mem r hr
  refine ⟨hd2_167, fun e he_mem => ?_⟩
  obtain ⟨he_501, mIdx, tIdx, hr1_eq, rfl⟩ := he_fn e he_mem
  let d2 := mIdx.val
  let t := tIdx.val
  have hd2_lt : d2 < 168 := mIdx.isLt
  have ht_lt : t < (501 - 3 * d2 - (1 - d2 % 2)) / 2 + 1 := tIdx.isLt
  refine ⟨he_501, ?_⟩
  rw [hr1_eq]
  set nStart := 1 - d2 % 2
  set d1 := nStart + 2 * t
  have hd1_501 : d1 + 3 * d2 ≤ 501 := by dsimp only [d1, nStart]; omega
  have hodd : (d1 + d2) % 2 = 1 := by dsimp only [d1, nStart]; omega
  set k := (d1 + d2 - 1) / 2
  have hk_250 : k ≤ 250 := by omega
  have hd2_max : d2 ≤ min 167 (250 - k) := by omega
  rw [array_ofFn_getD _ k (false, #[], #[]) (by omega : k < 251)]
  dsimp only
  rw [smoothed_energy_eq hd he hsos hodd]
  have hok_q2 := (List.all_eq_true.1 ht1OK) k (List.mem_range.2 (by omega))
  rw [array_ofFn_getD _ k (false, #[], #[]) (by omega)] at hok_q2
  dsimp only at hok_q2
  refine mem_sumIval (d2 + 1) _ _ fun p2 hp2 => ?_
  dsimp only
  set q2 := d2 - p2
  by_cases hcond : p2 ≤ k + 1 ∧ q2 ≤ k
  · rw [ite_eq_left hcond, ite_eq_left (decide_eq_true hcond)]
    set p1 := k + 1 - p2
    set q1 := k - q2
    have hb1_s := hb_ext hdenM_pos hext_eq (b := p2) (a := p1) (by omega) (by omega)
    dsimp only at hb1_s
    rw [hu0_eq, hu1_eq, hv0_eq, hv1_eq, show p1 + p2 = k + 1 by omega] at hb1_s
    have hb2_s := hb_ext hdenM_pos hext_eq (b := q2) (a := q1) (by omega) (by omega)
    dsimp only at hb2_s
    rw [hu0_eq, hu1_eq, hv0_eq, hv1_eq, show q1 + q2 = k by omega] at hb2_s
    rcases hb1_eq : (bMid400.getD p2 #[]).getD p1 (#[], 0) with ⟨b1Row, sb1⟩
    rcases hb2_eq : (bMid512.getD q2 #[]).getD q1 (#[], 0) with ⟨b2Row, sb2⟩
    rw [hb1_eq] at hb1_s
    rw [hb2_eq] at hb2_s
    dsimp only at hb1_s hb2_s
    have hok_cells := (List.all_eq_true.1 hok_q2) q2 (List.mem_range.2 (by omega))
    rw [array_ofFn_getD _ q2 (false, (#[], 0), (#[], 0)) (by omega)] at hok_cells
    dsimp only at hok_cells
    rw [show k - q2 = q1 from rfl, hb2_eq] at hok_cells
    dsimp only at hok_cells
    rw [show k + 1 - p2 = p1 from rfl, show d2 - p2 = q2 from rfl,
      hb1_eq,
      array_ofFn_getD _ q2 (#[], 0) (by omega),
      array_ofFn_getD _ q2 (#[], 0) (by omega)]
    dsimp only
    rw [array_ofFn_getD _ q2 (false, (#[], 0), (#[], 0)) (by omega)]
    dsimp only
    rw [show k - q2 = q1 from rfl, hb2_eq]
    dsimp only
    set innerF : ℕ → ℂ := fun j1 =>
      ∑ j2 ∈ range (k + 1),
        gScaled creArr cimArr k j1 j2 *
          ((bCoeff ct (-(seR * st)) st (seR * ct) q1 q2 j2 : ℝ) : ℂ)
    set C_val : ℂ := ∑ j1 ∈ range (k + 2),
      ((bCoeff ct (-(seR * st)) st (seR * ct) p1 p2 j1 : ℝ) : ℂ) * innerF j1
    have hd2_pair := dotT1_sound
      (b1F := fun j1 => bCoeff ct (-(seR * st)) st (seR * ct) p1 p2 j1 * (2 : ℝ) ^ 400)
      (innerF := innerF)
      (fun j1 hj1 => hb1_s.2.2.1 j1 (by omega))
      hb1_s.2.2.2 hok_cells ?_
    · dsimp only at hd2_pair
      obtain ⟨hd2_re, hd2_im⟩ := hd2_pair
      rw [abs_le] at hd2_re hd2_im
      have hCre_sum : C_val.re * (2 : ℝ) ^ 800 =
          ∑ j1 ∈ range (k + 2),
            (bCoeff ct (-(seR * st)) st (seR * ct) p1 p2 j1 * (2 : ℝ) ^ 400) *
              ((innerF j1).re * (2 : ℝ) ^ 400) := by
        dsimp only [C_val]
        rw [Complex.re_sum, sum_mul]
        refine sum_congr rfl fun j1 _ => ?_
        simp only [Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im, zero_mul, sub_zero]
        ring
      have hCim_sum : C_val.im * (2 : ℝ) ^ 800 =
          ∑ j1 ∈ range (k + 2),
            (bCoeff ct (-(seR * st)) st (seR * ct) p1 p2 j1 * (2 : ℝ) ^ 400) *
              ((innerF j1).im * (2 : ℝ) ^ 400) := by
        dsimp only [C_val]
        rw [Complex.im_sum, sum_mul]
        refine sum_congr rfl fun j1 _ => ?_
        simp only [Complex.mul_im, Complex.ofReal_re, Complex.ofReal_im, zero_mul, add_zero]
        ring
      rw [← hCre_sum] at hd2_re
      rw [← hCim_sum] at hd2_im
      have hsh512_pos : (0 : ℤ) < sh512 := by unfold sh512; positivity
      have hbin1 : getBinom binomTbl (k + 1) p1 = (k + 1).choose p1 :=
        hbin_s (k + 1) (by omega) p1 (by omega)
      have hbin2 : getBinom binomTbl k q1 = k.choose q1 :=
        hbin_s k (by omega) q1 (by omega)
      rw [hbin1, hbin2]
      set binomNat := (k + 1).choose p1 * k.choose q1
      set binomProd : ℤ := Int.ofNat binomNat
      have hbin_nn : (0 : ℝ) ≤ (binomProd : ℝ) := by
        dsimp only [binomProd]; simp only [Int.ofNat_eq_natCast]; positivity
      have hden_pos : (0 : ℤ) < Int.ofNat (k + 1) * sh448 := by
        unfold sh448; simp only [Int.ofNat_eq_natCast]; positivity
      have hscRe : C_val.re * (2 : ℝ) ^ 288 * (sh512 : ℝ) = C_val.re * (2 : ℝ) ^ 800 := by
        unfold sh512; push_cast; ring
      have hscIm : C_val.im * (2 : ℝ) ^ 288 * (sh512 : ℝ) = C_val.im * (2 : ℝ) ^ 800 := by
        unfold sh512; push_cast; ring
      have hcRe_lo := ediv_le_of_mul hsh512_pos (by rw [hscRe, Int.cast_sub]; linarith [hd2_re.1])
      have hcRe_hi := le_neg_ediv_neg_of_mul hsh512_pos (by rw [hscRe, Int.cast_add]; linarith [hd2_re.2])
      have hcIm_lo := ediv_le_of_mul hsh512_pos (by rw [hscIm, Int.cast_sub]; linarith [hd2_im.1])
      have hcIm_hi := le_neg_ediv_neg_of_mul hsh512_pos (by rw [hscIm, Int.cast_add]; linarith [hd2_im.2])
      have hsr := sqIntIval_sound hcRe_lo hcRe_hi
      have hsi := sqIntIval_sound hcIm_lo hcIm_hi
      have hnorm_sq : ‖C_val‖ ^ 2 * (2 : ℝ) ^ 576 =
          (C_val.re * (2 : ℝ) ^ 288) ^ 2 + (C_val.im * (2 : ℝ) ^ 288) ^ 2 := by
        rw [← Complex.normSq_eq_norm_sq, Complex.normSq_apply]; ring
      have hnum_lo := mul_le_mul_of_nonneg_right (add_le_add hsr.1 hsi.1) hbin_nn
      have hnum_hi := mul_le_mul_of_nonneg_right (add_le_add hsr.2 hsi.2) hbin_nn
      have hsc_fin : ((binomNat : ℝ) * ‖C_val‖ ^ 2 / (k + 1 : ℝ)) * (D : ℝ) *
          ((Int.ofNat (k + 1) * sh448 : ℤ) : ℝ) =
          ((binomNat : ℝ) * ‖C_val‖ ^ 2) * (2 : ℝ) ^ 576 := by
        unfold D K sh448
        have hk1_ne : (k + 1 : ℝ) ≠ 0 := by positivity
        push_cast [Int.ofNat_eq_natCast]; field_simp; ring
      refine ⟨ediv_le_of_mul hden_pos ?_, le_neg_ediv_neg_of_mul hden_pos ?_⟩
      · rw [hsc_fin]
        dsimp only [binomProd] at hnum_lo ⊢
        push_cast [Int.ofNat_eq_natCast] at hnum_lo ⊢
        linarith [hnorm_sq, show (‖C_val‖ ^ 2 * (2 : ℝ) ^ 576) * (binomNat : ℝ) =
          ((binomNat : ℝ) * ‖C_val‖ ^ 2) * (2 : ℝ) ^ 576 by ring]
      · rw [hsc_fin]
        dsimp only [binomProd] at hnum_hi ⊢
        push_cast [Int.ofNat_eq_natCast] at hnum_hi ⊢
        linarith [hnorm_sq, show (‖C_val‖ ^ 2 * (2 : ℝ) ^ 576) * (binomNat : ℝ) =
          ((binomNat : ℝ) * ‖C_val‖ ^ 2) * (2 : ℝ) ^ 576 by ring]
    · intro j1 hj1 hj1_ok
      rw [array_ofFn_getD _ j1 (false, 0, 0) hj1] at hj1_ok ⊢
      dsimp only at hj1_ok ⊢
      rw [array_ofFn_getD _ j1 0 hj1, array_ofFn_getD _ j1 0 hj1] at hj1_ok ⊢
      dsimp only at hj1_ok ⊢
      refine t1Cell_sound (fun j2 hj2 => gLookup704_sound_of_mid ?_ hk_250 (by omega) (by omega))
        hb2_s.1 hb2_s.2.1 hj1_ok
      intro idxM hM
      dsimp only
      intro n1 hn1 n2 hn2
      dsimp only
      have hov_s := modeOverlapsAt_sound (bLag := 608) (by omega)
        (by unfold sh416; rfl) (by unfold sh680; positivity) hlag_s creArr cimArr hov_eq hM
        n1 hn1 n2 hn2
      dsimp only at hov_s
      have hsc560 : (2 : ℝ) ^ (2 * 608 + 24) / (sh680 : ℝ) = (2 : ℝ) ^ 560 := by
        unfold sh680; push_cast; ring
      rw [hsc560] at hov_s
      have hg_ok0 := (List.all_eq_true.1 hgOK) idxM (List.mem_range.2 hM)
      dsimp only at hg_ok0
      have hg_ok1 := (List.all_eq_true.1 hg_ok0) n1
        (List.mem_range.2 (by simp only [Int.ofNat_eq_natCast]; omega))
      have hg_ok := (List.all_eq_true.1 hg_ok1) n2
        (List.mem_range.2 (by simp only [Int.ofNat_eq_natCast]; omega))
      rw [array_ofFn_getD _ idxM #[] hM] at hg_ok
      dsimp only at hg_ok
      rw [array_ofFn_getD _ n1 #[] (by simp only [Int.ofNat_eq_natCast]; omega)] at hg_ok
      dsimp only at hg_ok
      rw [array_ofFn_getD _ n2 (false, 0, 0) (by simp only [Int.ofNat_eq_natCast]; omega)] at hg_ok
      dsimp only at hg_ok
      rw [array_ofFn_getD _ idxM #[] hM]
      dsimp only
      rw [array_ofFn_getD _ n1 #[] (by simp only [Int.ofNat_eq_natCast]; omega)]
      dsimp only
      rw [array_ofFn_getD _ n2 (0, 0) (by simp only [Int.ofNat_eq_natCast]; omega)]
      dsimp only
      rw [array_ofFn_getD _ idxM #[] hM]
      dsimp only
      rw [array_ofFn_getD _ n1 #[] (by simp only [Int.ofNat_eq_natCast]; omega)]
      dsimp only
      rw [array_ofFn_getD _ n2 (false, 0, 0) (by simp only [Int.ofNat_eq_natCast]; omega)]
      dsimp only
      rcases hovp : ((ov560.getD idxM #[]).getD n1 #[]).getD n2 ((0, 0), (0, 0)) with ⟨reIv, imIv⟩
      have hovp' : (if h : n2 < ((ov560.getD idxM #[]).getD n1 #[]).size then
          ((ov560.getD idxM #[]).getD n1 #[]).getInternal n2 h else ((0, 0), (0, 0))) =
          (reIv, imIv) := hovp
      rw [hovp'] at hg_ok ⊢
      rw [hovp] at hov_s
      dsimp only at hg_ok hov_s ⊢
      rw [Bool.and_eq_true] at hg_ok
      simp only [Int.ofNat_eq_natCast] at hg_ok ⊢
      set k0_m := (((idxM : ℤ) - 17).natAbs + (1 - ((idxM : ℤ) - 17)).natAbs - 1) / 2
      set denGNat := (n1 + n2).choose n1 * risingFact (n1 + n2) k0_m
      have hbinom_eq : getBinom binomTbl (n1 + n2) n1 = (n1 + n2).choose n1 :=
        hbin_s (n1 + n2) (by omega) n1 (Nat.le_add_right n1 n2)
      rw [hbinom_eq] at hg_ok ⊢
      have hdenG_pos : 0 < denGNat :=
        mul_pos (Nat.choose_pos (Nat.le_add_right n1 n2)) (risingFact_pos _ _)
      set denG : ℤ := (denGNat : ℤ)
      have hsh_pos : (0 : ℤ) < denG * sh48 := by
        unfold sh48; dsimp only [denG]; have := hdenG_pos; positivity
      have hdenR_ne : (denGNat : ℝ) ≠ 0 := by exact_mod_cast hdenG_pos.ne'
      have hbp_re : (((ivDivPosL reIv (denG * sh48)).1 : ℤ) : ℝ) ≤
            ((modeOverlap creArr cimArr idxM n1 n2).re / (denGNat : ℝ)) * (2 : ℝ) ^ 512 ∧
          ((modeOverlap creArr cimArr idxM n1 n2).re / (denGNat : ℝ)) * (2 : ℝ) ^ 512 ≤
            (((ivDivPosL reIv (denG * sh48)).2 : ℤ) : ℝ) := by
        have hsc : ((modeOverlap creArr cimArr idxM n1 n2).re / (denGNat : ℝ)) * (2 : ℝ) ^ 512 *
            ((denG * sh48 : ℤ) : ℝ) = (modeOverlap creArr cimArr idxM n1 n2).re * (2 : ℝ) ^ 560 := by
          unfold sh48; dsimp only [denG]; push_cast; field_simp; ring
        exact ⟨ediv_le_of_mul hsh_pos (by rw [hsc]; exact hov_s.1),
          le_neg_ediv_neg_of_mul hsh_pos (by rw [hsc]; exact hov_s.2.1)⟩
      have hbp_im : (((ivDivPosL imIv (denG * sh48)).1 : ℤ) : ℝ) ≤
            ((modeOverlap creArr cimArr idxM n1 n2).im / (denGNat : ℝ)) * (2 : ℝ) ^ 512 ∧
          ((modeOverlap creArr cimArr idxM n1 n2).im / (denGNat : ℝ)) * (2 : ℝ) ^ 512 ≤
            (((ivDivPosL imIv (denG * sh48)).2 : ℤ) : ℝ) := by
        have hsc : ((modeOverlap creArr cimArr idxM n1 n2).im / (denGNat : ℝ)) * (2 : ℝ) ^ 512 *
            ((denG * sh48 : ℤ) : ℝ) = (modeOverlap creArr cimArr idxM n1 n2).im * (2 : ℝ) ^ 560 := by
          unfold sh48; dsimp only [denG]; push_cast; field_simp; ring
        exact ⟨ediv_le_of_mul hsh_pos (by rw [hsc]; exact hov_s.2.2.1),
          le_neg_ediv_neg_of_mul hsh_pos (by rw [hsc]; exact hov_s.2.2.2)⟩
      unfold toMid at hg_ok ⊢
      dsimp only at hg_ok ⊢
      rw [decide_eq_true_eq, decide_eq_true_eq] at hg_ok
      exact ⟨midpoint_err_le_one hbp_re.1 hbp_re.2 hg_ok.1,
        midpoint_err_le_one hbp_im.1 hbp_im.2 hg_ok.2⟩
  · rw [ite_eq_right hcond, ite_eq_right (mt of_decide_eq_true hcond)]
    exact mem_zero

end

end

end Haagerup
