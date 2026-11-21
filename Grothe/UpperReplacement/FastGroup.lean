import Grothe.UpperReplacement.CellHeadCompute
import Grothe.UpperReplacement.CellData
import Grothe.UpperReplacement.RootData
import GrotheQuadKernel.Rotate

set_option warningAsError true

/-!
# Fast eight-residue cell-head evaluator

Agent-ID: gemini-1aa9.

Computes certified enclosures for all eight residues `start, …, start + 7` (`8 ∣ start`) of the
18-channel cell-head witness:
1. Decodes and disk-clips both dyadic response tables directly into flat integer arrays.
2. Builds the exact `2^1024`-scaled radial moment grid and shares symmetric Hermite rows
   (`d = |m|` and `d = |m - 1|`) across all eight residues in the group.
3. Factors the 64-point angular DFT into an exact integer 8×8 radix-8 Cooley-Tukey butterfly,
   pulling `cos (π / 4)` outside the 8-term phase sum.
4. Executes the radial-angular matrix contractions via the precompiled native fixed-point matrix
   multiplier `GrotheQuad.mulBT`, packing the upper triangle `a + b < count` into 128-column blocks.

Soundness against `CellHeadCompute.residueHead` / `HeadWitness.residueSum` is proved in
`FastGroupSound`. This module alone asserts no analytic enclosure.
-/

namespace Grothe.UpperReplacement.FastGroup

open GrotheKernel GrotheKernel.HardyArc CellHeadCompute Certificate

@[inline] def iabs (x : Int) : Int := if x < 0 then -x else x

@[inline] def fxToI (x : GrotheQuad.Fx) : Ival := ⟨x.lo, x.hi⟩

def rootMidRe (c : CI) : Int := Int.fdiv (c.re.lo + c.re.hi) 2

def rootMidIm (c : CI) : Int := Int.fdiv (c.im.lo + c.im.hi) 2

def rootRad (c : CI) : Int :=
  max (c.re.hi - rootMidRe c) (c.im.hi - rootMidIm c)

/-- Twiddle lookup table `pIdx[8 * t + s] = (-(start + t) * s) mod 64`. -/
def phaseIndices (start : Nat) : Array Nat :=
  Array.ofFn fun idx : Fin 64 ↦
    let t := idx.val / 8
    let s := idx.val % 8
    (64 - ((start + t) * s) % 64) % 64

/-- Accumulator for one `(i, j)` pixel across the eight outer butterfly steps `s = 0..7`. -/
structure PixelAcc where
  a0r : Int := 0
  a0i : Int := 0
  e0 : Int := 0
  a2r : Int := 0
  a2i : Int := 0
  e2 : Int := 0
  a4r : Int := 0
  a4i : Int := 0
  e4 : Int := 0
  a6r : Int := 0
  a6i : Int := 0
  e6 : Int := 0
  a1r : Int := 0
  a1i : Int := 0
  b1r : Int := 0
  b1i : Int := 0
  e1a : Int := 0
  e1b : Int := 0
  a5r : Int := 0
  a5i : Int := 0
  b5r : Int := 0
  b5i : Int := 0
  e5a : Int := 0
  e5b : Int := 0
  a3r : Int := 0
  a3i : Int := 0
  b3r : Int := 0
  b3i : Int := 0
  e3a : Int := 0
  e3b : Int := 0
  a7r : Int := 0
  a7i : Int := 0
  b7r : Int := 0
  b7i : Int := 0
  e7a : Int := 0
  e7b : Int := 0

/-- Eight-step radix-8 butterfly sum for one pixel `ij = i * 128 + j`. -/
def pixelStep (pIdx : Array Nat) (pRM pIM pRR tblR tblI : Array Int) (ij : Nat) :
    Nat → PixelAcc → PixelAcc
  | 0, acc => acc
  | s + 1, acc =>
    let k0 := s * 16384 + ij
    let k1 := (s + 8) * 16384 + ij
    let k2 := (s + 16) * 16384 + ij
    let k3 := (s + 24) * 16384 + ij
    let k4 := (s + 32) * 16384 + ij
    let k5 := (s + 40) * 16384 + ij
    let k6 := (s + 48) * 16384 + ij
    let k7 := (s + 56) * 16384 + ij
    let z0r := tblR.getD k0 0; let z0i := tblI.getD k0 0
    let z1r := tblR.getD k1 0; let z1i := tblI.getD k1 0
    let z2r := tblR.getD k2 0; let z2i := tblI.getD k2 0
    let z3r := tblR.getD k3 0; let z3i := tblI.getD k3 0
    let z4r := tblR.getD k4 0; let z4i := tblI.getD k4 0
    let z5r := tblR.getD k5 0; let z5i := tblI.getD k5 0
    let z6r := tblR.getD k6 0; let z6i := tblI.getD k6 0
    let z7r := tblR.getD k7 0; let z7i := tblI.getD k7 0
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
    pixelStep pIdx pRM pIM pRR tblR tblI ij s {
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

/-- The eight complex fixed-point outputs of one pixel `(i, j)`. -/
structure PixelOut where
  r0 : GrotheQuad.Fx
  r1 : GrotheQuad.Fx
  r2 : GrotheQuad.Fx
  r3 : GrotheQuad.Fx
  r4 : GrotheQuad.Fx
  r5 : GrotheQuad.Fx
  r6 : GrotheQuad.Fx
  r7 : GrotheQuad.Fx
  i0 : GrotheQuad.Fx
  i1 : GrotheQuad.Fx
  i2 : GrotheQuad.Fx
  i3 : GrotheQuad.Fx
  i4 : GrotheQuad.Fx
  i5 : GrotheQuad.Fx
  i6 : GrotheQuad.Fx
  i7 : GrotheQuad.Fx

def PixelOut.reAt (p : PixelOut) : Nat → GrotheQuad.Fx
  | 0 => p.r0
  | 1 => p.r1
  | 2 => p.r2
  | 3 => p.r3
  | 4 => p.r4
  | 5 => p.r5
  | 6 => p.r6
  | 7 => p.r7
  | _ => default

def PixelOut.imAt (p : PixelOut) : Nat → GrotheQuad.Fx
  | 0 => p.i0
  | 1 => p.i1
  | 2 => p.i2
  | 3 => p.i3
  | 4 => p.i4
  | 5 => p.i5
  | 6 => p.i6
  | 7 => p.i7
  | _ => default

def shift32 : Int := (2 : Int) ^ 32

def finalizeEven (ar ai e : Int) : GrotheQuad.Fx × GrotheQuad.Fx :=
  let mr := Int.fdiv ar shift32
  let mi := Int.fdiv ai shift32
  let er := Int.fdiv e shift32 + 2
  (⟨mr - er, mr + er⟩, ⟨mi - er, mi + er⟩)

def finalizeOdd (hM hR absHM : Int) (sign : Int) (ar ai br bi ea eb : Int) :
    GrotheQuad.Fx × GrotheQuad.Fx :=
  let hbr := Int.fdiv (hM * br) D
  let hbi := Int.fdiv (hM * bi) D
  let mr := Int.fdiv (ar + sign * hbr) shift32
  let mi := Int.fdiv (ai + sign * hbi) shift32
  let ebTot := Int.fdiv (hR * (max (iabs br) (iabs bi) + eb) + absHM * eb) D + 2
  let er := Int.fdiv (ea + ebTot) shift32 + 2
  (⟨mr - er, mr + er⟩, ⟨mi - er, mi + er⟩)

def pixelOut (pIdx : Array Nat) (pRM pIM pRR tblR tblI : Array Int)
    (hM hR absHM : Int) (ij : Nat) : PixelOut :=
  let acc := pixelStep pIdx pRM pIM pRR tblR tblI ij 8 {}
  let f0 := finalizeEven acc.a0r acc.a0i acc.e0
  let f2 := finalizeEven acc.a2r acc.a2i acc.e2
  let f4 := finalizeEven acc.a4r acc.a4i acc.e4
  let f6 := finalizeEven acc.a6r acc.a6i acc.e6
  let f1 := finalizeOdd hM hR absHM 1 acc.a1r acc.a1i acc.b1r acc.b1i acc.e1a acc.e1b
  let f5 := finalizeOdd hM hR absHM (-1) acc.a5r acc.a5i acc.b5r acc.b5i acc.e5a acc.e5b
  let f3 := finalizeOdd hM hR absHM 1 acc.a3r acc.a3i acc.b3r acc.b3i acc.e3a acc.e3b
  let f7 := finalizeOdd hM hR absHM (-1) acc.a7r acc.a7i acc.b7r acc.b7i acc.e7a acc.e7b
  { r0 := f0.1, r1 := f1.1, r2 := f2.1, r3 := f3.1,
    r4 := f4.1, r5 := f5.1, r6 := f6.1, r7 := f7.1,
    i0 := f0.2, i1 := f1.2, i2 := f2.2, i3 := f3.2,
    i4 := f4.2, i5 := f5.2, i6 := f6.2, i7 := f7.2 }

def gridPixels (start : Nat) (roots : Array CI) (tblR tblI : Array Int) :
    Array (Array PixelOut) :=
  let pRM := roots.map rootMidRe
  let pIM := roots.map rootMidIm
  let pRR := roots.map rootRad
  let hM := pRM.getD 8 0
  let hR := pRR.getD 8 0
  let absHM := iabs hM
  let pIdx := phaseIndices start
  Array.ofFn fun i : Fin 128 ↦
    Array.ofFn fun j : Fin 128 ↦
      pixelOut pIdx pRM pIM pRR tblR tblI hM hR absHM (i.val * 128 + j.val)

/-- Compute all eight `(re, im)` `128 × 128` angular matrices for residues `start .. start + 7`. -/
def angularGroup8Fx (start : Nat) (roots : Array CI) (tblR tblI : Array Int) :
    Array (Array (Array GrotheQuad.Fx) × Array (Array GrotheQuad.Fx)) :=
  let pix := gridPixels start roots tblR tblI
  Array.ofFn fun t : Fin 8 ↦
    (pix.map fun row ↦ row.map fun p ↦ p.reAt t.val,
     pix.map fun row ↦ row.map fun p ↦ p.imAt t.val)

/-- Maximum number of radial rows needed for angular difference `d` across residues
`start .. start + 7`. -/
def groupMaxCount (start d : Nat) : Nat :=
  (List.range 8).foldl (fun best k ↦
    (frequencies 125 64 (start + k)).foldl (fun best m ↦
      if m.natAbs == d || (m - 1).natAbs == d then
        max best (126 - shift m)
      else best) best) 0

def radialRowFx (P p q : Nat) (gridInt : Array (Array (Int × Int))) : Array GrotheQuad.Fx :=
  (RadialCompute.radialRowInt P p q gridInt).map fun v ↦ ⟨v.lo, v.hi⟩

def radialFamilyFx (P d count : Nat) (gridInt : Array (Array (Int × Int))) :
    Array (Array GrotheQuad.Fx) :=
  Array.ofFn fun a : Fin count ↦ radialRowFx P (a.val + d) a.val gridInt

/-- Shared symmetric radial rows for all angular differences `d < 128` used in the group. -/
def groupRadials (start : Nat) (gridInt : Array (Array (Int × Int))) :
    Array (Array (Array GrotheQuad.Fx)) :=
  Array.ofFn fun d : Fin 128 ↦
    let cnt := groupMaxCount start d.val
    if cnt = 0 then #[] else radialFamilyFx 1024 d.val cnt gridInt

/-- Signed grade overlaps for one angular frequency, evaluated with compiled-C `GrotheQuad.mulBT`
and three-band column packing of the upper triangle `a + b < count`. -/
def modeHeadFast (K : Nat) (m : Int) (sinc : Ival)
    (left right : Array (Array GrotheQuad.Fx))
    (angF angG : Array (Array GrotheQuad.Fx) × Array (Array GrotheQuad.Fx)) : Array Ival :=
  let offset := shift m
  let count := K + 1 - offset
  let rF_re := GrotheQuad.mulBT right count angF.1 128
  let rF_im := GrotheQuad.mulBT right count angF.2 128
  let rG_re := GrotheQuad.mulBT right count angG.1 128
  let rG_im := GrotheQuad.mulBT right count angG.2 128
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
  let t2 :=
    rF_re.extract 0 b2 ++ rF_im.extract 0 b2 ++ rG_re.extract 0 b2 ++ rG_im.extract 0 b2
  let c2 := GrotheQuad.mulBT left2 (count - n1) t2 128
  let sincSq := mulI sinc sinc
  Array.ofFn fun j : Fin (K + 1) ↦
    if offset ≤ j.val then
      let span := j.val - offset
      mulI sincSq <| sumI (span + 1) fun a ↦
        let b := span - a
        let (fRe, fIm, gRe, gIm) :=
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
        CellArithmetic.overlapI ⟨fxToI fRe, fxToI fIm⟩ ⟨fxToI gRe, fxToI gIm⟩
    else zeroI

/-- Compute all eight residue grade-energy arrays from explicit data tables. -/
def groupResiduesOf (L R : Array String) (r64 r128 : Array CI) (pInv : Ival)
    (gridInt : Array (Array (Int × Int))) (start : Nat) : Array (Array Ival) :=
  let pF := CellEncoding.decodeClipped L (2 ^ 26)
  let pG := CellEncoding.decodeClipped R (2 ^ 26)
  let angFs := angularGroup8Fx start r64 pF.1 pF.2
  let angGs := angularGroup8Fx start r64 pG.1 pG.2
  let radCache := groupRadials start gridInt
  Array.ofFn fun k : Fin 8 ↦
    let angF := angFs.getD k.val (#[], #[])
    let angG := angGs.getD k.val (#[], #[])
    headsSum 125 ((frequencies 125 64 (start + k.val)).map fun m ↦
      modeHeadFast 125 m (sincAt 64 r128 pInv m)
        (radCache.getD m.natAbs #[]) (radCache.getD (m - 1).natAbs #[]) angF angG)

/-- Compute all eight residue grade-energy arrays for group `start .. start + 7`. -/
def groupResidues (start : Nat) : Array (Array Ival) :=
  groupResiduesOf leftCellRows rightCellRows RootData.roots64 RootData.roots128
    RootData.piInvI (RadialCompute.momentsInt 1024 128 128 252) start

end Grothe.UpperReplacement.FastGroup
