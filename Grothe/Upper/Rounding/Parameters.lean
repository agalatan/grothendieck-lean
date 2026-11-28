import Grothe.RealOpaque
import Mathlib.Data.Rat.Defs

set_option warningAsError true

-- Agent-ID: gemini-21d5, codex-a7c4
namespace Grothe.Upper

def d12Q : ℚ := 1000000000000
def d6Q : ℚ := 1000000

def ctQ : ℚ := 23187 / 24245
def stQ : ℚ := 7084 / 24245
def seQ : ℚ := 87841 / 98209
def ceQ : ℚ := 43920 / 98209

def wQ : Fin 6 → ℚ
  | 0 => 855656321685 / d12Q
  | 1 => 87304183672 / d12Q
  | 2 => 156229336 / d12Q
  | 3 => 117021055 / d12Q
  | 4 => 56415370682 / d12Q
  | 5 => 350873570 / d12Q

def p0Q : List ℚ := [991 / 1000, -9 / 1000]
def q0Q : List ℚ := [0, -1]

def p1Q : List ℚ := [99 / 100, -1 / 100]
def q1Q : List ℚ := [0, -1]

def p2Q : List ℚ := [
  91987193366 / d12Q, -494518221970 / d12Q, 403975324766 / d12Q, -99055436 / d12Q,
  0, 0, 0, -27080072 / d12Q, -217490491 / d12Q, -7730415 / d12Q,
  0, -10946266 / d12Q, 0, 475570792 / d12Q, 8681386426 / d12Q
]

def r3Q : List ℚ := [980543369477 / d12Q, -19456630523 / d12Q]
def r4Q : List ℚ := [930767036298 / d12Q, -69232963702 / d12Q]

def p5Q : List ℚ := [
  963782504048 / d12Q, -7609745775 / d12Q, 0, -26371854429 / d12Q,
  0, 0, 0, 0, 0, 0, 0, 0, 2235895748 / d12Q
]
def q5Q : List ℚ := [0, -1]

def rhoQ : Fin 6 → ℚ
  | 0 => 1037 / 1000
  | 1 => 1037 / 1000
  | 2 => 103 / 100
  | 3 => 207 / 200
  | 4 => 109 / 100
  | 5 => 1037 / 1000

def regRQ : Fin 6 → ℚ
  | 0 => 1038 / 1000
  | 1 => 4153 / 4000
  | 2 => 259 / 250
  | 3 => 259 / 250
  | 4 => 1091 / 1000
  | 5 => 4153 / 4000

def jCertQ : Fin 6 → ℚ
  | 0 => 1 / 4
  | 1 => 1 / 4
  | 2 => 1 / 5
  | 3 => 2 / 5
  | 4 => 2 / 5
  | 5 => 1 / 5

def budgetQ : Fin 6 → ℚ
  | 0 => 2528814 / d6Q
  | 1 => 2507841 / d6Q
  | 2 => 2919013 / d6Q
  | 3 => 1692090 / d6Q
  | 4 => 1658129 / d6Q
  | 5 => 3355048 / d6Q

def tailQ : Fin 6 → ℚ
  | 0 => 50024 / d12Q
  | 1 => 49816 / d12Q
  | 2 => 1785796 / d12Q
  | 3 => 110835 / d12Q
  | 4 => 3 / d12Q
  | 5 => 57619 / d12Q

def cCertQ : ℚ := 711974258589 / d12Q
def headCapCertQ : ℚ := 6157850 / d12Q
/-- The head cap plus the weighted tail caps, exactly: `headCapCertQ + ∑ p, wQ p * tailQ p`. -/
def deltaCertQ : ℚ := 6205314847032059049 / 1000000000000000000000000

end Grothe.Upper
