import Haagerup.SmoothedRows

/-! The smoothed row checker encloses the signed head of the actual rounding kernel.

Agent-ID: codex-a7c4
-/

set_option warningAsError true
set_option maxRecDepth 4096
set_option exponentiation.threshold 2048
namespace Haagerup
open Finset Polynomial HaagerupKernel HaagerupKernel.Cell
noncomputable section

attribute [local irreducible] Array.ofFn List.ofFn List.flatten sumInt sumIval lagTable1024 binomArr251
  modeOverlapsAt bTable1024 extractBMids gammaCells gammaMids gammaOK kBlock kBlocks smoothedTerm flatIdx headIdx

private theorem smoothedEntry_eq (bt : MidTable) (ks : Array KBlock) (d1 d2 : Nat) :
    let k := (d1+d2-1)/2
    let b := ks.getD k (false,#[],#[])
    smoothedRowEntry binomArr251 bt ks d1 d2 =
      (d1,sumIval (d2+1) (smoothedTerm binomArr251 bt b.2.1 b.2.2 k d2)) := by
  unfold smoothedRowEntry
  dsimp only


private theorem entry_mem {cr ci qr qi : Array Int} {ct st se ce : ℝ}
    (hd : ct^2 + st^2 = 1) (he : se^2 + ce^2 = 1) (hsos : sosAllOK cr ci qr qi = true)
    {gm : GammaMids} {b512 b400 : MidTable} {d1 d2 : ℕ}
    (hdeg : d1+3*d2 ≤ 501) (ho : (d1+d2)%2 = 1)
    (hg : ∀ k ≤ 250, ∀ j1 < k+2, ∀ j2 < k+1,
      |(gScaled cr ci k j1 j2).re * 2^512 - ((gLookup704 gm k j1 j2).1 : ℝ)| ≤ 1 ∧
      |(gScaled cr ci k j1 j2).im * 2^512 - ((gLookup704 gm k j1 j2).2 : ℝ)| ≤ 1)
    (hb : tableEncloses ct st se (2^512) b512) (hb' : tableEncloses ct st se (2^400) b400)
    (hok : ((List.range 251).all fun k => ((kBlocks gm b512).getD k (false,#[],#[])).1) = true) :
    let G := (memLp_smoothMap ct st se ce (measurable_cellFn cr ci) (norm_cellFn_le hsos)).toLp
      (smoothMap ct st se ce (cellFn cr ci))
    mem (energy G (d1,d2)) (smoothedRowEntry binomArr251 b400 (kBlocks gm b512) d1 d2).2 := by
  rw [smoothedEntry_eq]
  dsimp only
  rw [smoothed_energy_eq hd he hsos ho]
  let k := (d1+d2-1)/2
  have hk : k ≤ 250 := by dsimp only [k]; omega
  have hdm : d2 ≤ min 167 (250-k) := by dsimp only [k]; omega
  have hat : (kBlocks gm b512).getD k (false,#[],#[]) = kBlock gm b512 k := by
    unfold kBlocks
    exact array_ofFn_getD _ k _ (by omega : k < 251)
  have hgood := List.all_eq_true.mp hok k (List.mem_range.mpr (by omega))
  rw [hat] at hgood ⊢
  apply mem_sumIval
  intro p hp
  exact smoothedTerms_sound hk hdm (hg k hk) hb hb' hgood p hp

/-- The checked rows enclose every nonzero smoothed-channel mode overlap in `headIdx 501`. -/
theorem smoothedRowsCheck_table_sound {creArr cimArr qreArr qimArr : Array Int}
    (hsos : sosAllOK creArr cimArr qreArr qimArr = true)
    {cn sn chyp se ce ehyp : ℕ}
    (hd : ((cn : ℝ) / chyp) ^ 2 + ((sn : ℝ) / chyp) ^ 2 = 1)
    (he : ((se : ℝ) / ehyp) ^ 2 + ((ce : ℝ) / ehyp) ^ 2 = 1)
    {rows : List RowI}
    (hcheck : smoothedRowsCheck creArr cimArr cn sn chyp se ce ehyp rows = true) :
    let ct := (cn : ℝ) / chyp; let st := (sn : ℝ) / chyp
    let seR := (se : ℝ) / ehyp; let ceR := (ce : ℝ) / ehyp
    let G := (memLp_smoothMap ct st seR ceR (measurable_cellFn creArr cimArr)
      (norm_cellFn_le hsos)).toLp (smoothMap ct st seR ceR (cellFn creArr cimArr))
    (∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → energy G p = 0) ∧
    (flatIdx rows).Nodup ∧
    (∀ p ∈ flatIdx rows, p ∈ headIdx 501) ∧
    (∀ p ∈ headIdx 501, p ∉ flatIdx rows → energy G p = 0) ∧
    (∀ r ∈ rows, r.1 ≤ 167 ∧ ∀ e ∈ r.2, e.1 ≤ 501 ∧ mem (energy G (e.1, r.1)) e.2) := by
  let ct := (cn : ℝ) / chyp
  let st := (sn : ℝ) / chyp
  let seR := (se : ℝ) / ehyp
  let ceR := (ce : ℝ) / ehyp
  let G := (memLp_smoothMap ct st seR ceR (measurable_cellFn creArr cimArr) (norm_cellFn_le hsos)).toLp
    (smoothMap ct st seR ceR (cellFn creArr cimArr))
  let denM : ℤ := Int.ofNat (ehyp * chyp)
  let u0N : ℤ := Int.ofNat (ehyp * cn)
  let u1N : ℤ := -(Int.ofNat (se * sn))
  let v0N : ℤ := Int.ofNat (ehyp * sn)
  let v1N : ℤ := Int.ofNat (se * cn)
  have hc := (smoothedRowsCheck_iff _ _ _ _ _ _ _ _ _).mp hcheck
  rw [computeSmoothedRows_factored] at hc
  unfold computeSmoothedFactored at hc
  generalize hv : modeOverlapsAt sh416 sh680 creArr cimArr lagTable1024 = overlap at hc
  obtain ⟨okv,ov⟩ := overlap
  dsimp (config := { iota := false, proj := false, zetaDelta := false }) only at hc
  generalize hx : extractBMids (bTable1024 u0N u1N v0N v1N denM) = mids at hc
  obtain ⟨okx,b512,b400⟩ := mids
  let gc := gammaCells binomArr251 ov
  let gm := gammaMids gc
  let ks := kBlocks gm b512
  change (decide (0 < ehyp*chyp) && okv && gammaOK gc && okx &&
    ((List.range 251).all fun k => (ks.getD k (false,#[],#[])).1), smoothedRows binomArr251 b400 ks) =
    (true, rows) at hc
  simp only [Prod.mk.injEq, Bool.and_eq_true, decide_eq_true_eq] at hc
  obtain ⟨⟨⟨⟨⟨hpos,rfl⟩,hg⟩,rfl⟩,hk⟩,hrows⟩ := hc
  have hdM : (0 : ℤ) < denM := by dsimp [denM]; exact_mod_cast hpos
  have hehyp : 0 < ehyp := Nat.pos_of_mul_pos_right hpos
  have hchyp : 0 < chyp := Nat.pos_of_mul_pos_left hpos
  have ratios : (u0N:ℝ)/denM = ct ∧ (u1N:ℝ)/denM = -(seR*st) ∧
      (v0N:ℝ)/denM = st ∧ (v1N:ℝ)/denM = seR*ct := by
    have h1 : (ehyp:ℝ) ≠ 0 := by positivity
    have h2 : (chyp:ℝ) ≠ 0 := by positivity
    dsimp only [u0N,u1N,v0N,v1N,denM,ct,st,seR]
    push_cast [Int.ofNat_eq_natCast]
    exact ⟨by field_simp,by field_simp,by field_simp,by field_simp⟩
  have bs : tableEncloses ct st seR (2^512) b512 ∧ tableEncloses ct st seR (2^400) b400 := by
    have row {a b : ℕ} (hb : b ≤ 167) (ha : a ≤ 251-b) := extractBMids_sound hdM hx hb ha
    constructor <;> intro b hb a ha <;> have h := row hb ha <;>
      dsimp only at h <;> rw [ratios.1,ratios.2.1,ratios.2.2.1,ratios.2.2.2] at h
    · exact ⟨fun j hj => h.1 j (by omega),h.2.1⟩
    · exact ⟨fun j hj => h.2.2.1 j (by omega),h.2.2.2⟩
  have hpar := energy_eq_zero_of_even
    (memLp_smoothMap ct st seR ceR (measurable_cellFn creArr cimArr) (norm_cellFn_le hsos))
    (fun c x hc => smoothMap_rot2 ct st seR ceR (fun _ v hc' => cellFn_rot2 creArr cimArr hc' v) hc x)
  have shape := flatIdx_ofFn_props (M := 168) rfl hrows (fun m t => congrArg Prod.fst
    (smoothedEntry_eq b400 ks (1-m.val%2+2*t.val) m.val))
  obtain ⟨hnod,hiff,hrow⟩ := shape
  refine ⟨hpar, hnod, fun p hp => ((hiff p).1 hp).2, fun p hp hn => hpar p (by
      have : (p.1+p.2)%2 ≠ 1 := fun h => hn ((hiff p).2 ⟨h,hp⟩)
      omega), fun r hr => ?_⟩
  obtain ⟨hd2,ent⟩ := hrow r hr
  refine ⟨hd2,fun e he' => ?_⟩
  obtain ⟨hle,m,t,heq,rfl⟩ := ent e he'
  refine ⟨hle,?_⟩
  let d2 := m.val
  let d1 := 1-d2%2+2*t.val
  have he1 : (smoothedRowEntry binomArr251 b400 ks d1 d2).1 = d1 :=
    congrArg Prod.fst (smoothedEntry_eq b400 ks d1 d2)
  change mem (energy G ((smoothedRowEntry binomArr251 b400 ks d1 d2).1,r.1)) _
  rw [he1,heq]
  have hdeg : d1+3*d2 ≤ 501 := by
    have ht := t.isLt
    have hm := m.isLt
    dsimp only [d1,d2]; omega
  have ho : (d1+d2)%2 = 1 := by dsimp only [d1]; omega
  exact entry_mem hd he hsos hdeg ho
    (fun _ hk _ ha _ hb => gammaLookup_sound hv hg hk (by omega) (by omega)) bs.1 bs.2 hk

/-- The checked rows enclose every smoothed-channel head coefficient through index 250. -/
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
  obtain ⟨hpar, hnod, hsub, hcov, hrow⟩ := smoothedRowsCheck_table_sound hsos hd he hcheck
  exact mem_bivarT_of_table (N := 501) (K := 251) (NZ := 501) (MW := 167)
    (by omega) hQ0 hP hQ _ hpar hnod hsub hcov hrow

end
end Haagerup
