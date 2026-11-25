import HaagerupKernel.Basic

set_option warningAsError true

/-!
# Kronecker-packed 80-bit exact integer kernel for 6-channel head convolution

Evaluates all 6 channels of the 251-term weighted head residual directly inside Lean's kernel
(`decide +kernel`) by packing degree-`< 251` integer polynomials at base `B1 = 2^224` so GMP
executes polynomial products in a single kernel operation:

* Smoothed channels (0, 1, 5) with `Q = -X`:
  `H_P(X) ≡ P(X) · ∑_{j<251} E_j(X) · (X P(X)^2)^j - X · ∑_{j<250} O_j(X) · (X P(X)^2)^j (mod X^251)`,
  where `E_j(X) = ∑_a μ_{2j+1, 2a} X^{3a}` and `O_j(X) = ∑_a μ_{2j, 2a+1} X^{3a}` are packed
  once from `tcellRows` using unsigned `Nat` arithmetic (at full 128-bit scale `2^128`);
* Phase channel (2): 1D recurrence `haagMu80` (at scale `2^80`) evaluated via baby-step/giant-step
  Horner in `Q = X P^2`;
* Antisymmetric channels (3, 4): 1D `tigMuList` (at full 128-bit scale `2^128`) evaluated via
  the same baby-step/giant-step Horner scheme.

Soundness is proved in `Haagerup/FastHeadSound.lean`.

-/

namespace HaagerupKernel.FastHead

open HaagerupKernel

/-! ### 1. Scales and Kronecker base constants -/

def D48N : Nat := Nat.pow 2 48
def D80N : Nat := Nat.pow 2 80
def D128N : Nat := Nat.pow 2 128

def D48I : Int := Int.ofNat D48N
def D80I : Int := Int.ofNat D80N
def D128I : Int := Int.ofNat D128N

def B1N : Nat := Nat.pow 2 224
def B2N : Nat := Nat.mul B1N B1N
def B3N : Nat := Nat.mul B2N B1N
def B4N : Nat := Nat.mul B2N B2N
def B8N : Nat := Nat.mul B4N B4N
def B16N : Nat := Nat.mul B8N B8N
def B32N : Nat := Nat.mul B16N B16N
def B64N : Nat := Nat.mul B32N B32N
def B128N : Nat := Nat.mul B64N B64N
def B251N : Nat := Nat.pow B1N 251

def B1I : Int := Int.ofNat B1N
def B2I : Int := Int.ofNat B2N
def B4I : Int := Int.ofNat B4N
def B8I : Int := Int.ofNat B8N
def B16I : Int := Int.ofNat B16N
def B32I : Int := Int.ofNat B32N
def B64I : Int := Int.ofNat B64N
def B128I : Int := Int.ofNat B128N

def H1N : Nat := Nat.div B1N 2
def H1I : Int := Int.ofNat H1N
def H2I : Int := Int.ofNat (Nat.div B2N 2)
def H4I : Int := Int.ofNat (Nat.div B4N 2)
def H8I : Int := Int.ofNat (Nat.div B8N 2)
def H16I : Int := Int.ofNat (Nat.div B16N 2)
def H32I : Int := Int.ofNat (Nat.div B32N 2)
def H64I : Int := Int.ofNat (Nat.div B64N 2)
def H128I : Int := Int.ofNat (Nat.div B128N 2)
def H251I : Int := Int.ofNat (Nat.div B251N 2)

/-! ### 2. Kernel-direct `Nat`-dispatched `Int` arithmetic -/

@[inline] def iNeg : Int → Int
  | Int.ofNat 0 => Int.ofNat 0
  | Int.ofNat (Nat.succ n) => Int.negSucc n
  | Int.negSucc n => Int.ofNat (Nat.succ n)

@[inline] def iNatAbs : Int → Nat
  | Int.ofNat n => n
  | Int.negSucc n => Nat.succ n

@[inline] def iAbs (a : Int) : Int := Int.ofNat (iNatAbs a)

@[inline] def toNat0 : Int → Nat
  | Int.ofNat n => n
  | Int.negSucc _ => 0

@[inline] def natSubInt (a b : Nat) : Int :=
  if Nat.ble b a then Int.ofNat (Nat.sub a b)
  else Int.negSucc (Nat.sub (Nat.sub b a) 1)

@[inline] def iAdd (a b : Int) : Int :=
  match a, b with
  | Int.ofNat m, Int.ofNat n => Int.ofNat (Nat.add m n)
  | Int.ofNat m, Int.negSucc n => natSubInt m (Nat.succ n)
  | Int.negSucc m, Int.ofNat n => natSubInt n (Nat.succ m)
  | Int.negSucc m, Int.negSucc n => Int.negSucc (Nat.add m (Nat.succ n))

@[inline] def iSub (a b : Int) : Int := iAdd a (iNeg b)

@[inline] def negNatInt (n : Nat) : Int :=
  if Nat.beq n 0 then Int.ofNat 0 else Int.negSucc (Nat.sub n 1)

@[inline] def iMul (a b : Int) : Int :=
  match a, b with
  | Int.ofNat m, Int.ofNat n => Int.ofNat (Nat.mul m n)
  | Int.ofNat m, Int.negSucc n => negNatInt (Nat.mul m (Nat.succ n))
  | Int.negSucc m, Int.ofNat n => negNatInt (Nat.mul (Nat.succ m) n)
  | Int.negSucc m, Int.negSucc n => Int.ofNat (Nat.mul (Nat.succ m) (Nat.succ n))

@[inline] def iLe (a b : Int) : Bool :=
  match a, b with
  | Int.ofNat m, Int.ofNat n => Nat.ble m n
  | Int.negSucc _, Int.ofNat _ => true
  | Int.ofNat _, Int.negSucc _ => false
  | Int.negSucc m, Int.negSucc n => Nat.ble n m

/-- Truncating division toward zero by a positive `Nat`. -/
@[inline] def tdivNat (x : Int) (d : Nat) : Int :=
  match x with
  | Int.ofNat n => Int.ofNat (Nat.div n d)
  | Int.negSucc n => negNatInt (Nat.div (Nat.succ n) d)

/-! ### 3. Balanced base-`B1` splitting, truncation, coefficientwise `tdivNat`, and L1 norm -/

/-- Balanced Euclidean division: `x = q * bN + r` with `-hI ≤ r < hI` (for `bN = 2 * hI > 0`). -/
@[inline] def balDivMod (bN : Nat) (hI : Int) (x : Int) : Int × Int :=
  match iAdd x hI with
  | Int.ofNat n =>
    (Int.ofNat (Nat.div n bN), iSub (Int.ofNat (Nat.mod n bN)) hI)
  | Int.negSucc n =>
    (Int.negSucc (Nat.div n bN), iSub (Int.ofNat (Nat.sub (Nat.sub bN 1) (Nat.mod n bN))) hI)

@[inline] def trunc251 (x : Int) : Int := (balDivMod B251N H251I x).2

def sdStep (bN : Nat) (bI hI : Int) (f : Int → Nat → Int) (x : Int) (den : Nat) : Int :=
  let (hi, lo) := balDivMod bN hI x
  iAdd (f lo den) (iMul (f hi den) bI)

def sd0 (x : Int) (den : Nat) : Int := tdivNat x den
def sd1 := sdStep B1N B1I H1I sd0
def sd2 := sdStep B2N B2I H2I sd1
def sd3 := sdStep B4N B4I H4I sd2
def sd4 := sdStep B8N B8I H8I sd3
def sd5 := sdStep B16N B16I H16I sd4
def sd6 := sdStep B32N B32I H32I sd5
def sd7 := sdStep B64N B64I H64I sd6
def sd8 := sdStep B128N B128I H128I sd7

@[inline] def kronMul (a b : Int) : Int := sd8 (trunc251 (iMul a b)) D80N

def l1Step (bN : Nat) (hI : Int) (f : Int → Int) (x : Int) : Int :=
  let (hi, lo) := balDivMod bN hI x
  iAdd (f lo) (f hi)

def l1_0 := iAbs
def l1_1 := l1Step B1N H1I l1_0
def l1_2 := l1Step B2N H2I l1_1
def l1_3 := l1Step B4N H4I l1_2
def l1_4 := l1Step B8N H8I l1_3
def l1_5 := l1Step B16N H16I l1_4
def l1_6 := l1Step B32N H32I l1_5
def l1_7 := l1Step B64N H64I l1_6
def l1_8 := l1Step B128N H128I l1_7

/-! ### 4. Tail-recursive list helpers and table shape/width/L1 validators -/

def revL {α : Type} : List α → List α → List α
  | [], acc => acc
  | x :: xs, acc => revL xs (x :: acc)

/-- Expected row length for `tcellRows` row `m`: `250 - 3*(m/2)` for odd `m`, `251 - 3*(m/2)` for even `m`. -/
@[inline] def expectedRowLen (m : Nat) : Nat :=
  let base := if Nat.beq (Nat.mod m 2) 1 then 250 else 251
  Nat.sub base (Nat.mul 3 (Nat.div m 2))

/-- Tail-recursive validation of one row of `tcellRows`: exact `n = expN, expN+2, ...`,
exact length `len`, `0 ≤ iv.lo ≤ D128`, `iv.hi - iv.lo ≤ D48`, accumulating `∑ iv.lo`. -/
def checkEntries : Nat → Nat → List (Nat × Ival) → Nat → Option Nat
  | _, 0, [], tot => some tot
  | expN, len + 1, (n, iv) :: es, tot =>
    if Nat.beq n expN && iLe 0 iv.lo && iLe iv.lo D128I && iLe (iSub iv.hi iv.lo) D48I then
      checkEntries (Nat.add expN 2) len es (Nat.add tot (toNat0 iv.lo))
    else none
  | _, _, _, _ => none

/-- Tail-recursive validation of reversed `tcellRows` (`m = 167` down to `0`) plus `∑ iv.lo ≤ D128`. -/
def checkRowsShape : Nat → List RowI → Nat → Bool
  | 0, [], tot => Nat.ble tot D128N
  | rem + 1, (m, es) :: rest, tot =>
    if Nat.beq m rem then
      let startN := if Nat.beq (Nat.mod m 2) 1 then 0 else 1
      match checkEntries startN (expectedRowLen m) es tot with
      | some tot' => checkRowsShape rem rest tot'
      | none => false
    else false
  | _, _, _ => false

/-- Tail-recursive validation of `tigMuList`: exact length `251`, `|iv.lo| ≤ D128`,
`iv.hi - iv.lo ≤ D48`, and `∑ |iv.lo| ≤ D128`. -/
def checkTigMu : Nat → List Ival → Nat → Bool
  | 0, [], tot => Nat.ble tot D128N
  | rem + 1, iv :: rest, tot =>
    let a := iNatAbs iv.lo
    if Nat.ble a D128N && iLe (iSub iv.hi iv.lo) D48I then
      checkTigMu rem rest (Nat.add tot a)
    else false
  | _, _, _ => false

/-- Tail-recursive validation of a sparse polynomial `l` with denominator `den`:
`0 < den`, `l.length ≤ 16`, degrees strictly increasing and `< 251`, and `∑ |c| ≤ den`. -/
def checkSparseGo : Nat → Nat → List (Nat × Int) → Nat → Nat → Bool
  | _, _, [], den, tot => Nat.ble tot den
  | minD, maxLen, (d, c) :: rest, den, tot =>
    match maxLen with
    | 0 => false
    | k + 1 =>
      if Nat.ble minD d && Nat.ble (Nat.add d 1) 251 then
        checkSparseGo (Nat.add d 1) k rest den (Nat.add tot (iNatAbs c))
      else false

def checkSparse (l : List (Nat × Int)) (den : Nat) : Bool :=
  Nat.ble 1 den && checkSparseGo 0 16 l den 0

/-! ### 5. Unsigned `Nat` packing of `tcellRows` into `E_j` (even `m`) and `O_j` (odd `m`) -/

def zipNat (es : List (Nat × Ival)) (bs : List Nat) (acc : List Nat) : List Nat :=
  match es, bs with
  | [], _ => revL acc []
  | (_, iv) :: es', [] =>
    zipNat es' [] (toNat0 iv.lo :: acc)
  | (_, iv) :: es', b :: bs' =>
    zipNat es' bs' (Nat.add (Nat.mul b B3N) (toNat0 iv.lo) :: acc)

def packRowsNat : List RowI → List Nat → List Nat → List Nat × List Nat
  | [], ev, od => (ev, od)
  | (m, es) :: rest, ev, od =>
    if Nat.beq (Nat.mod m 2) 1 then
      packRowsNat rest (zipNat es ev []) od
    else
      packRowsNat rest ev (zipNat es od [])

def natListToIntAcc : List Nat → List Int → List Int
  | [], acc => revL acc []
  | n :: ns, acc => natListToIntAcc ns (Int.ofNat n :: acc)

/-! ### 6. Baby-step / giant-step Kronecker polynomial evaluation -/

def dot16 : List Int → List Int → Int → Int
  | a :: as, b :: bs, acc => dot16 as bs (iAdd acc (iMul a b))
  | _, _, acc => acc

def split16Acc : Nat → List Int → List Int → List Int × List Int
  | 0, xs, acc => (revL acc [], xs)
  | _, [], acc => (revL acc [], [])
  | k + 1, x :: xs, acc => split16Acc k xs (x :: acc)

def chunk16Rev : Nat → List Int → List (List Int) → List (List Int)
  | 0, _, acc => acc
  | _ + 1, [], acc => acc
  | n + 1, xs, acc =>
    let (hd, tl) := split16Acc 16 xs []
    chunk16Rev n tl (hd :: acc)

def buildPows16L (qEnc : Int) : List Int × Int :=
  let q0 := D80I
  let q1 := qEnc
  let q2 := kronMul q1 qEnc
  let q3 := kronMul q2 qEnc
  let q4 := kronMul q3 qEnc
  let q5 := kronMul q4 qEnc
  let q6 := kronMul q5 qEnc
  let q7 := kronMul q6 qEnc
  let q8 := kronMul q7 qEnc
  let q9 := kronMul q8 qEnc
  let q10 := kronMul q9 qEnc
  let q11 := kronMul q10 qEnc
  let q12 := kronMul q11 qEnc
  let q13 := kronMul q12 qEnc
  let q14 := kronMul q13 qEnc
  let q15 := kronMul q14 qEnc
  let q16 := kronMul q15 qEnc
  ([q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15], q16)

/-- Horner over chunks of scale-`D128` packed polynomials (`E`, `O`, `tigMu`). -/
def hornerD128 (qows16 : List Int) (q16 : Int) : List (List Int) → Int → Int
  | [], acc => acc
  | blk :: rest, acc =>
    let acc' := sd8 (trunc251 (iAdd (iMul (iMul acc q16) D48I) (dot16 blk qows16 0))) D128N
    hornerD128 qows16 q16 rest acc'

/-- Horner over chunks of scale-`D80` packed polynomials (`haagMu80`). -/
def hornerD80 (qows16 : List Int) (q16 : Int) : List (List Int) → Int → Int
  | [], acc => acc
  | blk :: rest, acc =>
    let acc' := sd8 (trunc251 (iAdd (iMul acc q16) (dot16 blk qows16 0))) D80N
    hornerD80 qows16 q16 rest acc'

def evalSmoothed (revE revO : List (List Int)) (pEnc : Int) : Int :=
  let qEnc := kronMul (trunc251 (iMul B1I pEnc)) pEnc
  let (qows16, q16) := buildPows16L qEnc
  let sE := hornerD128 qows16 q16 revE 0
  let sO := hornerD128 qows16 q16 revO 0
  iSub (kronMul sE pEnc) (trunc251 (iMul B1I sO))

def eval1D_D80 (revMu : List (List Int)) (pEnc : Int) : Int :=
  let qEnc := kronMul (trunc251 (iMul B1I pEnc)) pEnc
  let (qows16, q16) := buildPows16L qEnc
  let s := hornerD80 qows16 q16 revMu 0
  kronMul s pEnc

def eval1D_D128 (revMu : List (List Int)) (pEnc : Int) : Int :=
  let qEnc := kronMul (trunc251 (iMul B1I pEnc)) pEnc
  let (qows16, q16) := buildPows16L qEnc
  let s := hornerD128 qows16 q16 revMu 0
  kronMul s pEnc

def encPolyAux : List (Nat × Int) → Nat → Int → Int
  | [], _, acc => acc
  | (d, c) :: rest, den, acc =>
    let cd := tdivNat (iMul c D80I) den
    encPolyAux rest den (iAdd acc (iMul cd (Int.ofNat (Nat.pow B1N d))))

/-! ### 7. Haagerup phase coefficients and 1D `tigMu` extraction -/

def piQuarter80 : Int :=
  tdivNat (iMul 314159265358979323846 D80I) (Nat.mul 4 (Nat.pow 10 20))

def haagMu80Go : Nat → Nat → Int → List Int → List Int
  | 0, _, _, acc => revL acc []
  | rem + 1, k, cur, acc =>
    let odd := Nat.add (Nat.mul 2 k) 1
    let num := Int.ofNat (Nat.mul odd odd)
    let den := Nat.mul (Nat.mul 4 (Nat.add k 1)) (Nat.add k 2)
    haagMu80Go rem (Nat.add k 1) (tdivNat (iMul num cur) den) (cur :: acc)

def haagMu80 : List Int := haagMu80Go 251 0 piQuarter80 []

def sumNatAbs : List Int → Nat → Nat
  | [], acc => acc
  | x :: xs, acc => sumNatAbs xs (Nat.add acc (iNatAbs x))

def tigMu128Acc : List Ival → List Int → List Int
  | [], acc => revL acc []
  | iv :: rest, acc => tigMu128Acc rest (iv.lo :: acc)

/-! ### 8. Complete 6-channel head residual checker -/

/-- Conservative L1 error budget in ULPs of `2^-80` (`2 × 10^6`, vs actual margin `> 1.5 × 10^12`). -/
def errBudget80 : Int := 2000000

def fastHeadOK (rows : List RowI) (tigMu : List Ival)
    (p0 p1 p2 r3 r4 p5 : List (Nat × Int))
    (d0 d1 d2 d3 d4 d5 : Nat)
    (w0 w1 w2 w3 w4 w5 wDen : Nat)
    (cNum cDen capNum capDen : Nat) : Bool :=
  let revRows := revL rows []
  let hMu := haagMu80
  if checkRowsShape 168 revRows 0 &&
     checkTigMu 251 tigMu 0 &&
     Nat.ble (sumNatAbs hMu 0) D80N &&
     checkSparse p0 d0 && checkSparse p1 d1 && checkSparse p2 d2 &&
     checkSparse r3 d3 && checkSparse r4 d4 && checkSparse p5 d5 &&
     Nat.ble 1 wDen && Nat.ble wDen D80N &&
     Nat.beq (Nat.add w0 (Nat.add w1 (Nat.add w2 (Nat.add w3 (Nat.add w4 w5))))) wDen &&
     Nat.ble 1 cDen && Nat.ble cNum cDen &&
     Nat.ble 1 capDen
  then
    let (evN, odN) := packRowsNat revRows [] []
    let revO := chunk16Rev 16 (natListToIntAcc evN []) []
    let revE := chunk16Rev 16 (natListToIntAcc odN []) []
    let h0 := evalSmoothed revE revO (encPolyAux p0 d0 0)
    let h1 := evalSmoothed revE revO (encPolyAux p1 d1 0)
    let h5 := evalSmoothed revE revO (encPolyAux p5 d5 0)
    let revHaag := chunk16Rev 16 hMu []
    let h2 := eval1D_D80 revHaag (encPolyAux p2 d2 0)
    let revTig := chunk16Rev 16 (tigMu128Acc tigMu []) []
    let h3 := eval1D_D128 revTig (encPolyAux r3 d3 0)
    let h4 := eval1D_D128 revTig (encPolyAux r4 d4 0)
    let wSum :=
      iAdd (iMul (Int.ofNat w0) h0)
      (iAdd (iMul (Int.ofNat w1) h1)
      (iAdd (iMul (Int.ofNat w2) h2)
      (iAdd (iMul (Int.ofNat w3) h3)
      (iAdd (iMul (Int.ofNat w4) h4)
            (iMul (Int.ofNat w5) h5)))))
    let hComb := sd8 wSum wDen
    let c80 := tdivNat (iMul (Int.ofNat cNum) D80I) cDen
    let cap80 := tdivNat (iMul (Int.ofNat capNum) D80I) capDen
    let res := l1_8 (iSub hComb c80)
    iLe (iAdd res errBudget80) cap80
  else false

end HaagerupKernel.FastHead
