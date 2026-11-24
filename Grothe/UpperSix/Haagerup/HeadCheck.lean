import Grothe.UpperSix.HaagerupKernel.FastHead
import Grothe.UpperSix.Haagerup.Data.OverlapData

set_option warningAsError true

/-!
# Kernel-verified 6-channel head convolution check

Verifies the 251-term 6-channel weighted head residual bound directly inside Lean's kernel
(`decide +kernel`) via `HaagerupKernel.FastHead.fastHeadOK` (Kronecker-packed 80-bit exact
integer polynomial arithmetic at base `2^224`).

Agent-ID: gemini-21d5, codex-a7c4, gemini-1aa9
-/

namespace Haagerup
open HaagerupKernel HaagerupKernel.FastHead Haagerup.Data

def p0Sparse : List (Nat × Int) := [(0, 991), (1, -9)]
def p1Sparse : List (Nat × Int) := [(0, 99), (1, -1)]
def p2Sparse : List (Nat × Int) := [
  (0, 91987193366), (1, -494518221970), (2, 403975324766), (3, -99055436),
  (7, -27080072), (8, -217490491), (9, -7730415), (11, -10946266),
  (13, 475570792), (14, 8681386426)
]
def r3Sparse : List (Nat × Int) := [(0, 980543369477), (1, -19456630523)]
def r4Sparse : List (Nat × Int) := [(0, 930767036298), (1, -69232963702)]
def p5Sparse : List (Nat × Int) := [
  (0, 963782504048), (1, -7609745775), (3, -26371854429), (12, 2235895748)
]

def d0Sparse : Nat := 1000
def d1Sparse : Nat := 100
def d12Sparse : Nat := 1000000000000

def w0Sparse : Nat := 855656321685
def w1Sparse : Nat := 87304183672
def w2Sparse : Nat := 156229336
def w3Sparse : Nat := 117021055
def w4Sparse : Nat := 56415370682
def w5Sparse : Nat := 350873570

def cCertNum : Nat := 711974258589
def headCapNum : Nat := 6157850

set_option maxRecDepth 100000 in
theorem head_sum_ok :
    fastHeadOK tcellRows tigMuList
      p0Sparse p1Sparse p2Sparse r3Sparse r4Sparse p5Sparse
      d0Sparse d1Sparse d12Sparse d12Sparse d12Sparse d12Sparse
      w0Sparse w1Sparse w2Sparse w3Sparse w4Sparse w5Sparse d12Sparse
      cCertNum d12Sparse headCapNum d12Sparse = true := by
  decide +kernel

end Haagerup
