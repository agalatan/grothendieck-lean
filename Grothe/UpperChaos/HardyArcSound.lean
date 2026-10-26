import Grothe.Upper.IntervalSound
import GrotheKernel.HardyArc
import Grothe.UpperChaos.SchurMain

/-!
# Soundness of the Hardy arc checker: interval layer

Membership lemmas for the operations of `GrotheKernel/HardyArc.lean` beyond those of
`Grothe/Upper/IntervalSound.lean`: subtraction, integer constants, the inverse of a positive interval, and complex
intervals (`memC z I`: real and imaginary parts in `I.re`, `I.im`) with addition, multiplication, inverse and Horner
evaluation. Step 4 of the `hardy` plan.
-/

namespace Grothe.UpperChaos.HardyArcSound

open GrotheKernel GrotheKernel.HardyArc Grothe.Upper

lemma mem_sub {x y : ℝ} {a b : Ival} (hx : mem x a) (hy : mem y b) : mem (x - y) (subI a b) := by
  simpa [subI, sub_eq_add_neg] using mem_add hx (mem_neg hy)

lemma mem_intI (n : ℤ) : mem (n : ℝ) (intI n) := by
  constructor <;> simp [intI]

lemma pos_of_posI {x : ℝ} {a : Ival} (hx : mem x a) (hp : posI a = true) : 0 < x := by
  have hlo : (0 : ℤ) < a.lo := by simpa [posI] using hp
  have h1 : (0 : ℝ) < a.lo := by exact_mod_cast hlo
  have h2 := hx.1
  have hD := D_pos
  nlinarith

/-- The inverse of a positive interval. -/
lemma mem_invPosI {x : ℝ} {a : Ival} (hx : mem x a) (hp : posI a = true) : mem x⁻¹ (invPosI a) := by
  have hxpos := pos_of_posI hx hp
  have hlo : (0 : ℤ) < a.lo := by simpa [posI] using hp
  have hhi : (0 : ℤ) < a.hi := by
    have : (a.lo : ℝ) ≤ a.hi := hx.1.trans hx.2
    exact_mod_cast (show (0 : ℝ) < a.hi from lt_of_lt_of_le (by exact_mod_cast hlo) this)
  have hD := D_pos
  have hloR : (0 : ℝ) < a.lo := by exact_mod_cast hlo
  have hhiR : (0 : ℝ) < a.hi := by exact_mod_cast hhi
  obtain ⟨h1, h2⟩ := hx
  -- x⁻¹ D = D² / (x D)
  have key : x⁻¹ * D = (D : ℝ) * D / (x * D) := by field_simp
  constructor
  · -- ⌊D² / hi⌋ ≤ D² / hi ≤ D² / (x D)
    have hfl : (((D * D) / a.hi : ℤ) : ℝ) ≤ (D : ℝ) * D / a.hi := by
      rw [le_div_iff₀ hhiR]
      have := Int.ediv_mul_le (D * D) hhi.ne'
      exact_mod_cast this
    refine hfl.trans ?_
    rw [key]
    exact div_le_div_of_nonneg_left (by positivity) (by positivity) h2
  · -- D² / (x D) ≤ D² / lo ≤ ⌈D² / lo⌉
    rw [key]
    refine (div_le_div_of_nonneg_left (by positivity) hloR h1).trans ?_
    show (D : ℝ) * D / a.lo ≤ ((-((-(D * D)) / a.lo) : ℤ) : ℝ)
    rw [div_le_iff₀ hloR]
    set q : ℤ := (-(D * D)) / a.lo with hq
    have h3 : q * a.lo ≤ -(D * D) := Int.ediv_mul_le (-(D * D)) hlo.ne'
    have h4 : ((q : ℝ)) * a.lo ≤ -((D : ℝ) * D) := by exact_mod_cast h3
    have : (((-q : ℤ) : ℝ)) = -(q : ℝ) := by push_cast; ring
    rw [this]
    nlinarith

/-! ### Complex intervals -/

/-- `z` lies in the complex interval `I`. -/
def memC (z : ℂ) (I : CI) : Prop := mem z.re I.re ∧ mem z.im I.im

lemma memC_ofR {x : ℝ} {a : Ival} (hx : mem x a) : memC (x : ℂ) (CI.ofR a) := by
  refine ⟨by simpa [CI.ofR] using hx, ?_⟩
  simpa [CI.ofR] using mem_zero

lemma memC_one : memC 1 CI.one := by
  simpa [CI.one] using memC_ofR (mem_intI 1)

lemma memC_add {z w : ℂ} {I J : CI} (hz : memC z I) (hw : memC w J) : memC (z + w) (CI.add I J) :=
  ⟨by simpa [CI.add] using mem_add hz.1 hw.1, by simpa [CI.add] using mem_add hz.2 hw.2⟩

lemma memC_neg {z : ℂ} {I : CI} (hz : memC z I) : memC (-z) (CI.neg I) :=
  ⟨by simpa [CI.neg] using mem_neg hz.1, by simpa [CI.neg] using mem_neg hz.2⟩

lemma memC_sub {z w : ℂ} {I J : CI} (hz : memC z I) (hw : memC w J) : memC (z - w) (CI.sub I J) :=
  ⟨by simpa [CI.sub] using mem_sub hz.1 hw.1, by simpa [CI.sub] using mem_sub hz.2 hw.2⟩

lemma memC_mul {z w : ℂ} {I J : CI} (hz : memC z I) (hw : memC w J) : memC (z * w) (CI.mul I J) :=
  ⟨by simpa [CI.mul] using mem_sub (mem_mul hz.1 hw.1) (mem_mul hz.2 hw.2),
   by simpa [CI.mul] using mem_add (mem_mul hz.1 hw.2) (mem_mul hz.2 hw.1)⟩

lemma mem_normSq {z : ℂ} {I : CI} (hz : memC z I) : mem (Complex.normSq z) (CI.normSq I) := by
  simpa [CI.normSq, Complex.normSq_apply] using mem_add (mem_mul hz.1 hz.1) (mem_mul hz.2 hz.2)

lemma memC_inv {z : ℂ} {I : CI} (hz : memC z I) (hp : posI (CI.normSq I) = true) :
    memC z⁻¹ (CI.inv I) := by
  have hn := mem_invPosI (mem_normSq hz) hp
  refine ⟨?_, ?_⟩
  · simpa [CI.inv, Complex.inv_re, div_eq_mul_inv] using mem_mul hz.1 hn
  · simpa [CI.inv, Complex.inv_im, div_eq_mul_inv, neg_mul] using mem_neg (mem_mul hz.2 hn)

/-- Horner evaluation `c₀ + x (c₁ + x (c₂ + …))` of real coefficients. -/
noncomputable def hornerR (x : ℂ) : List ℝ → ℂ
  | [] => 0
  | c :: cs => (c : ℂ) + x * hornerR x cs

lemma memC_horner {x : ℂ} {X : CI} (hx : memC x X) :
    ∀ {cs : List ℝ} {L : List Ival}, List.Forall₂ mem cs L → memC (hornerR x cs) (CI.horner X L)
  | [], [], _ => by simpa [hornerR, CI.horner] using memC_ofR mem_zero
  | _ :: _, _ :: _, List.Forall₂.cons hc hcs =>
      memC_add (memC_ofR hc) (memC_mul hx (memC_horner hx hcs))

/-! ### The cancellation-free form of the Schur quantities -/

/-- `det(I − σR)`. -/
def dpm (R : Sym2C) (σ : ℂ) : ℂ := (1 - σ * R.a) * (1 - σ * R.c) - (σ * R.b) ^ 2

/-- `(I − σR)⁻¹ = adj(I − σR) / det(I − σR)`. -/
noncomputable def invIm (R : Sym2C) (σ : ℂ) : Sym2C :=
  ⟨(1 - σ * R.c) / dpm R σ, σ * R.b / dpm R σ, (1 - σ * R.a) / dpm R σ⟩

/-- (F1) `det(I − R²) = det(I − R) det(I + R)`. -/
lemma detIm_eq (R : Sym2C) : R.detIm = dpm R 1 * dpm R (-1) := by
  simp only [Sym2C.detIm, Sym2C.sq, dpm]; ring

/-- (F2) `A = ((I − R)⁻¹ + (I + R)⁻¹)/2` (entrywise). -/
lemma Amat_eq (R : Sym2C) (hp : dpm R 1 ≠ 0) (hm : dpm R (-1) ≠ 0) :
    R.Amat = ⟨((invIm R 1).a + (invIm R (-1)).a) / 2, ((invIm R 1).b + (invIm R (-1)).b) / 2,
      ((invIm R 1).c + (invIm R (-1)).c) / 2⟩ := by
  have e : (1 - (R.a * R.a + R.b * R.b)) * (1 - (R.b * R.b + R.c * R.c)) -
      (R.a * R.b + R.b * R.c) * (R.b * R.a + R.c * R.b) = dpm R 1 * dpm R (-1) := by
    simp only [dpm]; ring
  simp only [Sym2C.Amat, Sym2C.detIm, Sym2C.sq, invIm]
  rw [e]
  congr 1 <;> field_simp <;> simp only [dpm] <;> ring

/-- (F2) `C = R A = ((I − R)⁻¹ − (I + R)⁻¹)/2` (entrywise). -/
lemma Cmat_eq (R : Sym2C) (hp : dpm R 1 ≠ 0) (hm : dpm R (-1) ≠ 0) :
    R.Cmat = ⟨((invIm R 1).a - (invIm R (-1)).a) / 2, ((invIm R 1).b - (invIm R (-1)).b) / 2,
      ((invIm R 1).c - (invIm R (-1)).c) / 2⟩ := by
  simp only [Sym2C.Cmat]
  rw [Amat_eq R hp hm]
  simp only [invIm]
  congr 1 <;> field_simp <;> simp only [dpm] <;> ring

/-! ### Real symmetric identities -/

open Sym2R SchurKernel SchurMain

/-- A general real 2×2 matrix `[[a, b], [c, d]]` (mirrors `GR`). -/
structure M2 where
  a : ℝ
  b : ℝ
  c : ℝ
  d : ℝ

namespace M2
def ofS (S : Sym2R) : M2 := ⟨S.a, S.b, S.b, S.c⟩
def mul (M N : M2) : M2 :=
  ⟨M.a * N.a + M.b * N.c, M.a * N.b + M.b * N.d, M.c * N.a + M.d * N.c, M.c * N.b + M.d * N.d⟩
end M2

lemma sand_smul (S N : Sym2R) (r : ℝ) : sand S (smul r N) = smul r (sand S N) := by
  simp only [sand, smul]; congr 1 <;> ring

/-- `(Z − Cr) Z⁻¹ (Z + Cr) = Z − Cr Z⁻¹ Cr`: the product `G₋ Z⁻¹ G₊` is `T` (entries `a`, `b`, `d`). -/
lemma prod_eq_T (Zm Cr : Sym2R) (hd : Zm.det ≠ 0) :
    let P := M2.mul (M2.mul (M2.ofS (add Zm (smul (-1) Cr))) (M2.ofS (smul Zm.det⁻¹ Zm.adj)))
      (M2.ofS (add Zm Cr))
    let T := add Zm (smul (-1) (smul Zm.det⁻¹ (sand Cr Zm.adj)))
    P.a = T.a ∧ P.b = T.b ∧ P.d = T.c := by
  intro P T
  simp only [P, T, M2.mul, M2.ofS, add, smul, sand, adj, det] at hd ⊢
  refine ⟨?_, ?_, ?_⟩ <;> field_simp <;> ring

/-! ### Matrix intervals -/

def memSR (S : Sym2R) (I : SR) : Prop := mem S.a I.a ∧ mem S.b I.b ∧ mem S.c I.c
def memSC (S : Sym2C) (I : SC) : Prop := memC S.a I.a ∧ memC S.b I.b ∧ memC S.c I.c
def memM2 (M : M2) (I : GR) : Prop := mem M.a I.a ∧ mem M.b I.b ∧ mem M.c I.c ∧ mem M.d I.d

lemma memSR_add {S T : Sym2R} {I J : SR} (hS : memSR S I) (hT : memSR T J) : memSR (add S T) (SR.add I J) :=
  ⟨by simpa [add, SR.add] using mem_add hS.1 hT.1, by simpa [add, SR.add] using mem_add hS.2.1 hT.2.1,
   by simpa [add, SR.add] using mem_add hS.2.2 hT.2.2⟩

lemma memSR_smul {r : ℝ} {S : Sym2R} {i : Ival} {I : SR} (hr : mem r i) (hS : memSR S I) :
    memSR (smul r S) (SR.smul i I) :=
  ⟨by simpa [smul, SR.smul] using mem_mul hr hS.1, by simpa [smul, SR.smul] using mem_mul hr hS.2.1,
   by simpa [smul, SR.smul] using mem_mul hr hS.2.2⟩

lemma mem_det {S : Sym2R} {I : SR} (hS : memSR S I) : mem S.det I.det := by
  simpa [det, SR.det, sq] using mem_sub (mem_mul hS.1 hS.2.2) (mem_mul hS.2.1 hS.2.1)

lemma memSR_adj {S : Sym2R} {I : SR} (hS : memSR S I) : memSR S.adj I.adj :=
  ⟨by simpa [adj, SR.adj] using hS.2.2, by simpa [adj, SR.adj] using mem_neg hS.2.1,
   by simpa [adj, SR.adj] using hS.1⟩

lemma memSR_sand {S N : Sym2R} {I J : SR} (hS : memSR S I) (hN : memSR N J) : memSR (sand S N) (SR.sand I J) := by
  obtain ⟨ha, hb, hc⟩ := hS
  obtain ⟨na, nb, nc⟩ := hN
  have two := mem_intI 2
  refine ⟨?_, ?_, ?_⟩
  · have := mem_add (mem_add (mem_mul na (mem_mul ha ha)) (mem_mul two (mem_mul nb (mem_mul ha hb))))
      (mem_mul nc (mem_mul hb hb))
    convert this using 1 <;> first | rfl | (simp only [sand]; push_cast; ring)
  · have := mem_add (mem_add (mem_mul na (mem_mul ha hb)) (mem_mul nb (mem_add (mem_mul ha hc) (mem_mul hb hb))))
      (mem_mul nc (mem_mul hb hc))
    convert this using 1 <;> first | rfl | (simp only [sand]; ring)
  · have := mem_add (mem_add (mem_mul na (mem_mul hb hb)) (mem_mul two (mem_mul nb (mem_mul hb hc))))
      (mem_mul nc (mem_mul hc hc))
    convert this using 1 <;> first | rfl | (simp only [sand]; push_cast; ring)

lemma memM2_ofS {S : Sym2R} {I : SR} (hS : memSR S I) : memM2 (M2.ofS S) (GR.ofSR I) :=
  ⟨hS.1, hS.2.1, hS.2.1, hS.2.2⟩

lemma memM2_mul {M N : M2} {I J : GR} (hM : memM2 M I) (hN : memM2 N J) : memM2 (M2.mul M N) (GR.mul I J) :=
  ⟨by simpa [M2.mul, GR.mul] using mem_add (mem_mul hM.1 hN.1) (mem_mul hM.2.1 hN.2.2.1),
   by simpa [M2.mul, GR.mul] using mem_add (mem_mul hM.1 hN.2.1) (mem_mul hM.2.1 hN.2.2.2),
   by simpa [M2.mul, GR.mul] using mem_add (mem_mul hM.2.2.1 hN.1) (mem_mul hM.2.2.2 hN.2.2.1),
   by simpa [M2.mul, GR.mul] using mem_add (mem_mul hM.2.2.1 hN.2.1) (mem_mul hM.2.2.2 hN.2.2.2)⟩

/-- A positive-definiteness gate passed on an enclosure gives a positive definite matrix. -/
lemma PD_of_gate {S : Sym2R} {I : SR} (hS : memSR S I) (hg : I.PD = true) : S.PD := by
  simp only [SR.PD, Bool.and_eq_true] at hg
  exact ⟨pos_of_posI hS.1 hg.1, pos_of_posI (mem_det hS) hg.2⟩

/-! ### The real mirror of the kernel pieces and its identification -/

section mirror

variable (R : Sym2C) (j : ℝ)

/-- `G± = Re (I ∓ R)⁻¹ − jI` (`σ = 1`: `G₊`). -/
noncomputable def gpmR (σ : ℂ) : Sym2R := add (SchurKernel.re (invIm R σ)) (smul (-1) ⟨j, 0, j⟩)
noncomputable def zR : Sym2R := smul (1 / 2) (add (gpmR R j 1) (gpmR R j (-1)))
noncomputable def crR : Sym2R := smul (1 / 2) (add (gpmR R j 1) (smul (-1) (gpmR R j (-1))))
noncomputable def ciR : Sym2R :=
  smul (1 / 2) (add (SchurKernel.im (invIm R 1)) (smul (-1) (SchurKernel.im (invIm R (-1)))))

variable {R j}

lemma Z_Bj_eq (hp : dpm R 1 ≠ 0) (hm : dpm R (-1) ≠ 0) : Z (Bj R j) = zR R j := by
  simp only [Z, SchurKernel.re, Bj, zR, gpmR, add, smul]
  rw [Amat_eq R hp hm]
  simp only [Complex.sub_re, Complex.div_re, Complex.add_re, Complex.ofReal_re]
  congr 1 <;> norm_num <;> ring

lemma re_Cmat_eq (hp : dpm R 1 ≠ 0) (hm : dpm R (-1) ≠ 0) : SchurKernel.re R.Cmat = crR R j := by
  simp only [SchurKernel.re, crR, gpmR, add, smul]
  rw [Cmat_eq R hp hm]
  simp only [Complex.sub_re, Complex.div_re]
  congr 1 <;> norm_num <;> ring

lemma im_Cmat_eq (hp : dpm R 1 ≠ 0) (hm : dpm R (-1) ≠ 0) : SchurKernel.im R.Cmat = ciR R := by
  simp only [SchurKernel.im, ciR, add, smul]
  rw [Cmat_eq R hp hm]
  simp only [Complex.sub_im, Complex.div_im]
  congr 1 <;> norm_num <;> ring

lemma gpm_plus (R : Sym2C) (j : ℝ) : gpmR R j 1 = add (zR R j) (crR R j) := by
  simp only [zR, crR, gpmR, add, smul]; congr 1 <;> ring

lemma gpm_minus (R : Sym2C) (j : ℝ) : gpmR R j (-1) = add (zR R j) (smul (-1) (crR R j)) := by
  simp only [zR, crR, gpmR, add, smul]; congr 1 <;> ring

lemma normSq_detIm (R : Sym2C) : ‖R.detIm‖ ^ 2 = Complex.normSq (dpm R 1) * Complex.normSq (dpm R (-1)) := by
  rw [detIm_eq, ← Complex.normSq_mul, Complex.normSq_eq_norm_sq]

end mirror

/-! ### Membership of the kernel pieces -/

section pieces

variable {R : Sym2C} {RI : SC}

/-- `σ` of the kernel's `neg` flag. -/
def sig (neg : Bool) : ℂ := if neg then -1 else 1

lemma memC_dpm (hR : memSC R RI) (neg : Bool) : memC (dpm R (sig neg)) (HardyArc.invIm RI neg).2 := by
  obtain ⟨ha, hb, hc⟩ := hR
  cases neg
  · have h := memC_sub (memC_mul (memC_sub memC_one ha) (memC_sub memC_one hc)) (memC_mul (memC_neg hb) (memC_neg hb))
    convert h using 1 <;> first | rfl | (simp only [dpm, sig, Bool.false_eq_true, ↓reduceIte]; ring)
  · have h := memC_sub (memC_mul (memC_sub memC_one (memC_neg ha)) (memC_sub memC_one (memC_neg hc)))
      (memC_mul (memC_neg (memC_neg hb)) (memC_neg (memC_neg hb)))
    convert h using 1 <;> first | rfl | (simp only [dpm, sig, ↓reduceIte]; ring)

lemma memSC_invIm (hR : memSC R RI) (neg : Bool) (hpos : posI (CI.normSq (HardyArc.invIm RI neg).2) = true) :
    memSC (invIm R (sig neg)) (HardyArc.invIm RI neg).1 := by
  have hd := memC_dpm hR neg
  have hi := memC_inv hd hpos
  obtain ⟨ha, hb, hc⟩ := hR
  cases neg
  · refine ⟨?_, ?_, ?_⟩
    · convert memC_mul (memC_sub memC_one hc) hi using 1 <;> first | rfl | (simp only [invIm, sig, div_eq_mul_inv, Bool.false_eq_true, ↓reduceIte]; ring)
    · convert memC_neg (memC_mul (memC_neg hb) hi) using 1 <;> first | rfl | (simp only [invIm, sig, div_eq_mul_inv, Bool.false_eq_true, ↓reduceIte]; ring)
    · convert memC_mul (memC_sub memC_one ha) hi using 1 <;> first | rfl | (simp only [invIm, sig, div_eq_mul_inv, Bool.false_eq_true, ↓reduceIte]; ring)
  · refine ⟨?_, ?_, ?_⟩
    · convert memC_mul (memC_sub memC_one (memC_neg hc)) hi using 1 <;>
        first | rfl | (simp only [invIm, sig, div_eq_mul_inv, ↓reduceIte]; ring)
    · convert memC_neg (memC_mul (memC_neg (memC_neg hb)) hi) using 1 <;>
        first | rfl | (simp only [invIm, sig, div_eq_mul_inv, ↓reduceIte]; ring)
    · convert memC_mul (memC_sub memC_one (memC_neg ha)) hi using 1 <;>
        first | rfl | (simp only [invIm, sig, div_eq_mul_inv, ↓reduceIte]; ring)

end pieces

/-! ### The main soundness theorem of the Schur value -/

section main

variable {R : Sym2C} {RI : SC} {j : ℝ} {jI : Ival}

lemma mem_half : mem (1 / 2 : ℝ) half := by
  have h := mem_invPosI (mem_intI 2) (by decide)
  simpa [half, one_div] using h

lemma mem_neg_one : mem (-1 : ℝ) (negI (intI 1)) := by simpa using mem_neg (mem_intI 1)

lemma memSR_re {S : Sym2C} {I : SC} (h : memSC S I) : memSR (SchurKernel.re S) (SC.re I) :=
  ⟨h.1.1, h.2.1.1, h.2.2.1⟩

lemma memSR_im {S : Sym2C} {I : SC} (h : memSC S I) : memSR (SchurKernel.im S) (SC.im I) :=
  ⟨h.1.2, h.2.1.2, h.2.2.2⟩

lemma memSR_gpm (hR : memSC R RI) (hj : mem j jI) (neg : Bool)
    (hpos : posI (CI.normSq (HardyArc.invIm RI neg).2) = true) : memSR (gpmR R j (sig neg)) (gpm jI RI neg) :=
  memSR_add (memSR_re (memSC_invIm hR neg hpos)) (memSR_smul mem_neg_one ⟨hj, mem_zero, hj⟩)

lemma sig_false : sig false = 1 := by simp [sig]
lemma sig_true : sig true = -1 := by simp [sig]

theorem schurValue_sound (hR : memSC R RI) (hj : mem j jI) {v : ℤ}
    (hv : schurValue jI RI = some v) :
    (Z (Bj R j)).PD ∧ (SchurKernel.T (Bj R j) R.Cmat).PD ∧
      1 / (64 * j ^ 4 * ‖R.detIm‖ ^ 2 * (Z (Bj R j)).det * (W (Bj R j) R.Cmat).det) ≤ (v : ℝ) / D := by
  unfold schurValue at hv
  split_ifs at hv with hg
  obtain rfl : (invPosI (denOf jI RI)).hi = v := Option.some.inj hv
  simp only [gatesOK, Bool.and_eq_true] at hg
  obtain ⟨⟨⟨⟨hp1, hp2⟩, hZg⟩, hTg⟩, hdg⟩ := hg
  -- the two determinants
  have hdp := memC_dpm hR false
  have hdm := memC_dpm hR true
  rw [sig_false] at hdp
  rw [sig_true] at hdm
  have hdp0 : dpm R 1 ≠ 0 := fun h0 => by
    have := pos_of_posI (mem_normSq hdp) hp1; simp [h0] at this
  have hdm0 : dpm R (-1) ≠ 0 := fun h0 => by
    have := pos_of_posI (mem_normSq hdm) hp2; simp [h0] at this
  -- G±, Z, Cr, Ci
  have hGp := memSR_gpm hR hj false hp1
  have hGm := memSR_gpm hR hj true hp2
  rw [sig_false] at hGp
  rw [sig_true] at hGm
  have hZ : memSR (zR R j) (zOf jI RI) := memSR_smul mem_half (memSR_add hGp hGm)
  have hCr : memSR (crR R j) (crOf jI RI) := memSR_smul mem_half (memSR_add hGp (memSR_smul mem_neg_one hGm))
  have hIp := memSC_invIm hR false hp1
  have hIm := memSC_invIm hR true hp2
  rw [sig_false] at hIp
  rw [sig_true] at hIm
  have hCi : memSR (ciR R) (ciOf RI) :=
    memSR_smul mem_half (memSR_add (memSR_im hIp) (memSR_smul mem_neg_one (memSR_im hIm)))
  have hZPD : (zR R j).PD := PD_of_gate hZ hZg
  have hZd : posI (zOf jI RI).det = true := by
    simp only [SR.PD, Bool.and_eq_true] at hZg; exact hZg.2
  have hZi : memSR (smul (zR R j).det⁻¹ (zR R j).adj) (ziOf jI RI) :=
    memSR_smul (mem_invPosI (mem_det hZ) hZd) (memSR_adj hZ)
  -- T = G₋ Z⁻¹ G₊
  have hP := memM2_mul (memM2_mul (memM2_ofS hGm) (memM2_ofS hZi)) (memM2_ofS hGp)
  rw [gpm_minus, gpm_plus] at hP
  obtain ⟨eA, eB, eD⟩ := prod_eq_T (zR R j) (crR R j) hZPD.2.ne'
  set Tr := add (zR R j) (smul (-1) (smul (zR R j).det⁻¹ (sand (crR R j) (zR R j).adj))) with hTr
  have hT : memSR Tr (tOf jI RI) := by
    refine ⟨?_, ?_, ?_⟩
    · rw [← eA]; exact hP.1
    · rw [← eB]; exact hP.2.1
    · rw [← eD]; exact hP.2.2.2
  have hTeq : SchurKernel.T (Bj R j) R.Cmat = Tr := by
    simp only [SchurKernel.T, SchurKernel.Kr]
    rw [Z_Bj_eq hdp0 hdm0, re_Cmat_eq (j := j) hdp0 hdm0]
  -- E and W
  set Er := smul (1 / 2) (add (sand (crR R j) (smul (zR R j).det⁻¹ (zR R j).adj))
    (sand (ciR R) (smul (zR R j).det⁻¹ (zR R j).adj))) with hEr
  have hE : memSR Er (eOf jI RI) := memSR_smul mem_half (memSR_add (memSR_sand hCr hZi) (memSR_sand hCi hZi))
  have hEeq : SchurKernel.E (Bj R j) R.Cmat = Er := by
    simp only [SchurKernel.E, SchurKernel.Kr, SchurKernel.Ki, hEr, sand_smul]
    rw [Z_Bj_eq hdp0 hdm0, re_Cmat_eq (j := j) hdp0 hdm0, im_Cmat_eq hdp0 hdm0]
  have hW : memSR (add (smul 2 Tr) Er) (wOf jI RI) := memSR_add (memSR_smul (mem_intI 2) hT) hE
  have hWeq : W (Bj R j) R.Cmat = add (smul 2 Tr) Er := by
    simp only [W]; rw [hTeq, hEeq]
  -- the denominator
  have hden : mem (64 * (j * j * (j * j)) * (Complex.normSq (dpm R 1) * Complex.normSq (dpm R (-1))) *
      (zR R j).det * (add (smul 2 Tr) Er).det) (denOf jI RI) := by
    have := mem_mul (mem_mul (mem_mul (mem_mul (mem_intI 64) (mem_mul (mem_mul hj hj) (mem_mul hj hj)))
      (mem_mul (mem_normSq hdp) (mem_normSq hdm))) (mem_det hZ)) (mem_det hW)
    simpa [denOf, ndOf] using this
  have hinv := (mem_invPosI hden hdg).2
  refine ⟨?_, ?_, ?_⟩
  · rw [Z_Bj_eq hdp0 hdm0]; exact hZPD
  · rw [hTeq]; exact PD_of_gate hT hTg
  · rw [Z_Bj_eq hdp0 hdm0, hWeq, normSq_detIm]
    rw [le_div_iff₀ D_pos]
    convert hinv using 1
    rw [one_div]; ring_nf

end main

end Grothe.UpperChaos.HardyArcSound
