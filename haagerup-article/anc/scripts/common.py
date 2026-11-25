"""Shared code of the reproduction scripts: an exact reader of the Lean data, and exact series arithmetic.

These scripts are a reader's aid and an independent cross-check.  They are NOT part of the proof: the Lean
package in the parent folder never reads or runs them, and they do not need Lean to be installed.

What is read, and from where (all as text; every number becomes a Python `int` or `fractions.Fraction`):

  ../Haagerup/Parameters.lean
      d12Q, d6Q                          the denominators 10^12 and 10^6
      ctQ, stQ, seQ, ceQ                 the two rational rotations of the smoothing
      wQ                                 the six weights
      p0Q, q0Q, p1Q, q1Q, p2Q, r3Q, r4Q, p5Q, q5Q   the preprocessors (coefficient lists, constant term first)
      rhoQ, regRQ, jCertQ, budgetQ, tailQ           per channel: circle radius, disk radius, Schur parameter,
                                                    circle-mean budget B_p, tail allowance tau_p
      cCertQ, headCapCertQ, deltaCertQ   the centre c, the head cap, and delta
  ../Haagerup/Data/TigerData.lean        tigCreStrs, tigCimStrs (cell map f_tig), tigQreStrs, tigQimStrs (its
                                         sum-of-squares witness)
  ../Haagerup/Data/TCellData.lean        tcellCreStrs, tcellCimStrs, tcellQreStrs, tcellQimStrs (the same for T_cell)
  ../Haagerup/Data/OverlapData.lean      tigMuList (251 intervals for mu_0..mu_250 of the reflected pair),
                                         tcellRow_0 .. tcellRow_167 and tcellRows (21,168 intervals for the
                                         energies E(d1, d2) of the smoothed map, d1 + 3 d2 <= 501)

The files are generated literals.  The reader checks the shape of everything it reads (number of strings, their
length, the number of intervals, the index set) and raises `DataError` if a definition is missing or malformed.

Encodings (copied from the Lean definitions that decode them, HaagerupKernel/CellKernel.lean and Basic.lean):
  * a table is 36 strings (Fourier index l = 0..35, harmonic m = l - 17), each of 20480 ASCII characters:
    4096 cells of 5 characters; a character c stands for the digit (c - 49 if c > 92 else c - 48) in base 64,
    least significant first, and the cell value is the 30-bit number minus 2^25.  Cell number 64*i + j belongs to
    |z_1| in [3i/32, 3(i+1)/32), |z_2| in [3j/32, 3(j+1)/32).  The map uses the value divided by 2^24.
  * an interval <lo, hi> stands for [lo / 2^128, hi / 2^128].

Python >= 3.10, standard library only.
"""
from __future__ import annotations

import math
import re
import sys
from fractions import Fraction
from functools import lru_cache
from pathlib import Path

SCRIPTS = Path(__file__).resolve().parent
ANC = SCRIPTS.parent
PARAMETERS = ANC / "Haagerup" / "Parameters.lean"
DATA = ANC / "Haagerup" / "Data"
FIGURES = ANC.parent / "figures"

SCALE_BITS = 128           # HaagerupKernel.K: intervals are integers over 2^128
SCALE = 1 << SCALE_BITS
HEAD = 250                 # the head is k = 0..250 (chaos degree 2k + 1 <= 501)
N_CHANNELS = 6
SMOOTHED = (0, 1, 5)       # channels built on the smoothed map f_sm
PHASE = (2,)               # the scalar phase channel
REFLECTED = (3, 4)         # channels built on the reflected pair of f_tig

# The bound stated in the paper's main theorem and proved in Haagerup.lean (`Haagerup.isBound`).  It is the only
# number below that is not read from the data files; 01 and 02 recompute what it is compared with.
HEADLINE = Fraction(140456, 100000)


class DataError(RuntimeError):
    """A definition is missing from a Lean file, or does not have the expected shape."""


# --------------------------------------------------------------------------------------------------------------
# Reporting
# --------------------------------------------------------------------------------------------------------------

class Report:
    """Prints one line per check and remembers whether all passed.  `kind` is the arithmetic of the check:
    "exact", "interval" or "floating point"."""

    def __init__(self, title: str):
        self.failed = 0
        self.count = 0
        print(title)
        print("=" * len(title))

    def section(self, text: str) -> None:
        print()
        print(text)
        print("-" * len(text))

    def info(self, text: str = "") -> None:
        print(text)

    def check(self, kind: str, label: str, ok: bool) -> bool:
        assert kind in ("exact", "interval", "floating point"), kind
        self.count += 1
        if not ok:
            self.failed += 1
        print(f"  [{'ok' if ok else 'FAIL'}] ({kind}) {label}")
        return bool(ok)

    def finish(self) -> int:
        print()
        if self.failed:
            print(f"RESULT: {self.failed} of {self.count} checks FAILED")
            return 1
        print(f"RESULT: all {self.count} checks passed")
        return 0


def dec(x, digits: int) -> str:
    """Decimal expansion of a rational truncated toward zero after `digits` decimals (every digit shown is
    a digit of x)."""
    x = Fraction(x)
    sign = "-" if x < 0 else ""
    n = abs(x.numerator) * 10 ** digits // x.denominator
    s = str(n).rjust(digits + 1, "0")
    return f"{sign}{s[:-digits]}.{s[-digits:]}" if digits else sign + s


def sci(x, digits: int) -> str:
    """Scientific notation of a rational, mantissa truncated toward zero to `digits` decimals."""
    x = Fraction(x)
    if x == 0:
        return "0"
    sign = "-" if x < 0 else ""
    a = abs(x)
    e = int((a.numerator.bit_length() - a.denominator.bit_length()) * 0.30103)
    while a >= Fraction(10) ** (e + 1):
        e += 1
    while a < Fraction(10) ** e:
        e -= 1
    return f"{sign}{dec(a / Fraction(10) ** e, digits)}e{e:+03d}"


# --------------------------------------------------------------------------------------------------------------
# Parameters.lean
# --------------------------------------------------------------------------------------------------------------

_TOKEN = re.compile(r"\s*(?:(\d+)|([A-Za-z_][A-Za-z_0-9]*)|(.))")


def _rational(expr: str, names: dict) -> Fraction:
    """Value of `[-] a [/ b]` where a, b are integer literals or names already defined."""
    toks = [m.group(1) or m.group(2) or m.group(3) for m in _TOKEN.finditer(expr) if m.group(0).strip()]
    pos = 0

    def atom() -> Fraction:
        nonlocal pos
        if pos >= len(toks):
            raise DataError(f"cannot read the rational {expr!r}")
        t = toks[pos]
        pos += 1
        if t == "-":
            return -atom()
        if t.isdigit():
            return Fraction(int(t))
        if t in names and isinstance(names[t], Fraction):
            return names[t]
        raise DataError(f"cannot read the rational {expr!r}")

    val = atom()
    while pos < len(toks):
        if toks[pos] != "/":
            raise DataError(f"cannot read the rational {expr!r}")
        pos += 1
        val = val / atom()
    return val


@lru_cache(maxsize=None)
def parameters() -> dict:
    """All definitions of Parameters.lean: name -> Fraction, list of Fraction (coefficient lists), or list of six
    Fractions (functions on Fin 6)."""
    text = PARAMETERS.read_text(encoding="utf-8")
    text = re.sub(r"/-.*?-/", "", text, flags=re.S)
    text = re.sub(r"--[^\n]*", "", text)
    out: dict = {}
    for m in re.finditer(r"^def\s+(\w+)\s*:\s*([^\n]*?)\s*(?::=|\n)(.*?)(?=^def\s|^end\s|\Z)", text, flags=re.S | re.M):
        name, typ, body = m.group(1), m.group(2).strip(), m.group(3).strip()
        if typ.startswith("ℚ"):
            out[name] = _rational(body, out)
        elif typ.startswith("List ℚ"):
            inner = body.strip()
            if not (inner.startswith("[") and inner.endswith("]")):
                raise DataError(f"{name}: expected a list literal")
            items = [s for s in inner[1:-1].split(",") if s.strip()]
            out[name] = [_rational(s, out) for s in items]
        elif typ.startswith("Fin 6 → ℚ"):
            cases = re.findall(r"\|\s*(\d+)\s*=>\s*([^|]+)", body)
            if [int(i) for i, _ in cases] != list(range(6)):
                raise DataError(f"{name}: expected the six cases 0..5")
            out[name] = [_rational(e, out) for _, e in cases]
        else:
            raise DataError(f"{name}: unexpected type {typ!r} in Parameters.lean")
    needed = ["d12Q", "d6Q", "ctQ", "stQ", "seQ", "ceQ", "wQ", "p0Q", "q0Q", "p1Q", "q1Q", "p2Q", "r3Q", "r4Q",
              "p5Q", "q5Q", "rhoQ", "regRQ", "jCertQ", "budgetQ", "tailQ", "cCertQ", "headCapCertQ", "deltaCertQ"]
    missing = [n for n in needed if n not in out]
    if missing:
        raise DataError(f"Parameters.lean: missing definitions {missing}")
    return out


def channel_polys(p: int):
    """The two preprocessors (P_p, Q_p) of channel p as coefficient lists, constant term first.
    Channels 3, 4 use (-R, R); channel 2 has Q = 0."""
    par = parameters()
    if p == 0:
        return par["p0Q"], par["q0Q"]
    if p == 1:
        return par["p1Q"], par["q1Q"]
    if p == 2:
        return par["p2Q"], []
    if p == 3:
        return [-c for c in par["r3Q"]], par["r3Q"]
    if p == 4:
        return [-c for c in par["r4Q"]], par["r4Q"]
    if p == 5:
        return par["p5Q"], par["q5Q"]
    raise ValueError(p)


def poly_eval(coeffs, x):
    acc = 0
    for c in reversed(coeffs):
        acc = acc * x + c
    return acc


# --------------------------------------------------------------------------------------------------------------
# The cell-map tables
# --------------------------------------------------------------------------------------------------------------

def _section(text: str, name: str) -> str:
    m = re.search(rf"^(?:private\s+)?def\s+{re.escape(name)}\b", text, flags=re.M)
    if not m:
        raise DataError(f"definition {name} not found")
    nxt = re.search(r"^(?:private\s+)?(?:def|theorem|end)\s", text[m.end():], flags=re.M)
    return text[m.end(): m.end() + nxt.start()] if nxt else text[m.end():]


def _decode_string(s: str) -> list:
    """One slice of 4096 signed integers (mirror of HaagerupKernel.Cell.decodeSlice4096)."""
    b = s.encode("ascii")
    if len(b) != 20480:
        raise DataError(f"a table string has {len(b)} characters, expected 20480")
    d = [c - 49 if c > 92 else c - 48 for c in b]
    if min(d) < 0 or max(d) > 63:
        raise DataError("a table string contains a character outside the base-64 alphabet")
    return [d[o] + (d[o + 1] << 6) + (d[o + 2] << 12) + (d[o + 3] << 18) + (d[o + 4] << 24) - 33554432
            for o in range(0, 20480, 5)]


@lru_cache(maxsize=None)
def cell_tables(which: str) -> dict:
    """The four integer tables of a cell map.  `which` is "tig" (f_tig) or "tcell" (T_cell).
    Returns {"cre", "cim", "qre", "qim"}, each a list of 36 lists of 4096 ints: table[l][64*i + j]."""
    fname = {"tig": "TigerData.lean", "tcell": "TCellData.lean"}[which]
    text = (DATA / fname).read_text(encoding="utf-8")
    out = {}
    for key, suffix in (("cre", "CreStrs"), ("cim", "CimStrs"), ("qre", "QreStrs"), ("qim", "QimStrs")):
        strs = re.findall(r'"([^"]*)"', _section(text, which + suffix))
        if len(strs) != 36:
            raise DataError(f"{which}{suffix}: {len(strs)} strings, expected 36")
        out[key] = [_decode_string(s) for s in strs]
    return out


# --------------------------------------------------------------------------------------------------------------
# The certified overlap tables
# --------------------------------------------------------------------------------------------------------------

@lru_cache(maxsize=None)
def _overlap_text() -> str:
    return (DATA / "OverlapData.lean").read_text(encoding="utf-8")


@lru_cache(maxsize=None)
def tig_mu_intervals() -> tuple:
    """((lo, hi), ...) for mu_0 .. mu_250 of the reflected pair; the interval is [lo, hi] / 2^128."""
    pairs = [(int(a), int(b)) for a, b in re.findall(r"⟨(-?\d+),\s*(-?\d+)⟩", _section(_overlap_text(), "tigMuList"))]
    if len(pairs) != HEAD + 1:
        raise DataError(f"tigMuList: {len(pairs)} intervals, expected {HEAD + 1}")
    if any(lo > hi for lo, hi in pairs):
        raise DataError("tigMuList: an interval has lo > hi")
    return tuple(pairs)


@lru_cache(maxsize=None)
def tcell_energy_intervals() -> dict:
    """{(d1, d2): (lo, hi)} for the 21,168 pairs with d1 + d2 odd and d1 + 3 d2 <= 501: the energy
    E(d1, d2) of the smoothed map lies in [lo, hi] / 2^128."""
    text = _overlap_text()
    order = [int(n) for n in re.findall(r"tcellRow_(\d+)", _section(text, "tcellRows"))]
    if order != list(range(168)):
        raise DataError("tcellRows: expected tcellRow_0 .. tcellRow_167 in order")
    out = {}
    for d2 in range(168):
        sec = _section(text, f"tcellRow_{d2}")
        head = re.match(r"\s*:\s*RowI\s*:=\s*\(\s*(\d+)\s*,", sec)
        if not head or int(head.group(1)) != d2:
            raise DataError(f"tcellRow_{d2}: the row does not start with its index")
        entries = re.findall(r"\((\d+),\s*⟨(-?\d+),\s*(-?\d+)⟩\)", sec)
        start = 1 - d2 % 2
        expect = list(range(start, 501 - 3 * d2 + 1, 2))
        if [int(e[0]) for e in entries] != expect:
            raise DataError(f"tcellRow_{d2}: unexpected list of d1")
        for d1, lo, hi in entries:
            lo, hi = int(lo), int(hi)
            if lo > hi:
                raise DataError(f"tcellRow_{d2}: an interval has lo > hi")
            out[(int(d1), d2)] = (lo, hi)
    if len(out) != 21168:
        raise DataError(f"tcellRows: {len(out)} entries, expected 21168")
    return out


# --------------------------------------------------------------------------------------------------------------
# pi and Haagerup's coefficients
# --------------------------------------------------------------------------------------------------------------

def _arctan_inv(n: int, terms: int):
    """Enclosure (lo, hi) of arctan(1/n) from the alternating series (consecutive partial sums bracket it)."""
    s = Fraction(0)
    for k in range(terms):
        s += Fraction((-1) ** k, (2 * k + 1) * n ** (2 * k + 1))
    nxt = Fraction((-1) ** terms, (2 * terms + 1) * n ** (2 * terms + 1))
    return min(s, s + nxt), max(s, s + nxt)


@lru_cache(maxsize=None)
def pi_enclosure(digits: int = 60):
    """Exact rational (lo, hi) with lo < pi < hi and hi - lo = 10^-digits, from Machin's formula
    pi = 16 arctan(1/5) - 4 arctan(1/239), in exact arithmetic."""
    terms = 2 * digits + 10              # 5^-(2k+1) < 10^-(digits + 3) well before k = terms
    a_lo, a_hi = _arctan_inv(5, terms)
    b_lo, b_hi = _arctan_inv(239, terms // 3 + 5)
    lo, hi = 16 * a_lo - 4 * b_hi, 16 * a_hi - 4 * b_lo
    assert hi - lo < Fraction(1, 10 ** (digits + 2))
    scale = 10 ** digits
    f = lo.numerator * scale // lo.denominator
    assert Fraction(f, scale) <= lo and hi < Fraction(f + 1, scale)
    return Fraction(f, scale), Fraction(f + 1, scale)


def haag_rational(m: int) -> Fraction:
    """r_m / (pi/4) = binom(2m, m)^2 / (16^m (m + 1)): the phase map's coefficients are r_m = (pi/4) * this."""
    return Fraction(math.comb(2 * m, m) ** 2, 16 ** m * (m + 1))


# --------------------------------------------------------------------------------------------------------------
# Exact channel series
# --------------------------------------------------------------------------------------------------------------

def _common_den(coeffs):
    den = 1
    for c in coeffs:
        den = den * c.denominator // math.gcd(den, c.denominator)
    return [int(c * den) for c in coeffs], den


def _horner(blocks, unum, uden, k_max):
    """Coefficients 0..k_max of  sum_n U(X)^n A_n(X)  in interval arithmetic with exact integer endpoints.

    blocks[n] is a list of (degree, lo, hi): the coefficients of A_n are intervals [lo, hi] (integers, common
    scale).  U = unum / uden with unum a list of integers.  Returns (lo, hi, den): lists of integers and the
    integer by which they must be divided (besides the scale of the input).
    Evaluated as A_0 + U (A_1 + U (A_2 + ...)); a product of an interval with a negative coefficient swaps the
    endpoints, so the result encloses the exact coefficient for every choice of values in the input intervals.
    """
    size = k_max + 1
    lo = [0] * size
    hi = [0] * size
    den = 1
    terms = [(j, c) for j, c in enumerate(unum) if c != 0 and j < size]
    for n in range(len(blocks) - 1, -1, -1):
        if n != len(blocks) - 1:
            nlo = [0] * size
            nhi = [0] * size
            for j, c in terms:
                if c > 0:
                    for k in range(j, size):
                        nlo[k] += c * lo[k - j]
                        nhi[k] += c * hi[k - j]
                else:
                    for k in range(j, size):
                        nlo[k] += c * hi[k - j]
                        nhi[k] += c * lo[k - j]
            lo, hi = nlo, nhi
            den *= uden
        for deg, a, b in blocks[n]:
            if deg < size:
                lo[deg] += a * den
                hi[deg] += b * den
    return lo, hi, den


def _mul_exact(lo, hi, pnum, k_max):
    size = k_max + 1
    nlo = [0] * size
    nhi = [0] * size
    for j, c in enumerate(pnum):
        if c == 0 or j >= size:
            continue
        for k in range(j, size):
            if c > 0:
                nlo[k] += c * lo[k - j]
                nhi[k] += c * hi[k - j]
            else:
                nlo[k] += c * hi[k - j]
                nhi[k] += c * lo[k - j]
    return nlo, nhi


def _poly_mul_int(a, b, k_max):
    out = [0] * min(len(a) + len(b) - 1, k_max + 1)
    for i, x in enumerate(a):
        if x:
            for j, y in enumerate(b):
                if i + j < len(out):
                    out[i + j] += x * y
    return out


@lru_cache(maxsize=None)
def _phase_rational_head(k_max: int):
    """Channel 2 without the factor pi/4: the exact rationals [X^k] P_2 sum_m rho_m (X P_2^2)^m, k = 0..k_max."""
    P, _ = channel_polys(2)
    pnum, pden = _common_den(P)
    unum = [0] + _poly_mul_int(pnum, pnum, k_max)
    rnum, rcommon = _common_den([haag_rational(m) for m in range(k_max + 1)])
    lo, hi, den = _horner([[(0, r, r)] for r in rnum], unum, pden * pden, k_max)
    lo, hi = _mul_exact(lo, hi, pnum, k_max)
    assert lo == hi
    scale = rcommon * den * pden
    return tuple(Fraction(a, scale) for a in lo)


def _endpoints(mode: str, lo: int, hi: int):
    """Interval endpoints at scale 2^129: the certified interval, or its midpoint."""
    if mode == "interval":
        return 2 * lo, 2 * hi
    if mode == "midpoint":
        return lo + hi, lo + hi
    raise ValueError(mode)


@lru_cache(maxsize=None)
def channel_head(p: int, mode: str = "interval", k_max: int = HEAD):
    """Enclosures of the head coefficients h_0 .. h_{k_max} of channel p (k_max <= 250), computed in exact
    rational arithmetic from the certified intervals of the Lean data by the paper's channel-series formula

        h_k = sum_{d1 + d2 odd} E(d1, d2) [X^k] ( X^(floor(d1/2) + floor(d2/2)) P(X)^d1 Q(X)^d2 ).

    mode = "interval": every table entry ranges over its certified interval; returns a tuple of (lo, hi)
        Fractions with lo <= h_k <= hi (for channel 2, pi ranges over the enclosure
        3.14159265358979323846 < pi < 3.14159265358979323847 used in the paper).
    mode = "midpoint": every table entry is replaced by the midpoint of its interval (and pi by its value to 60
        decimals); returns (v, v).

      channels 0, 1, 5 (Q = -X):   h = sum_{d1} P^d1 A_d1,  A_d1 = sum_{d2} (-1)^d2 E(d1,d2) X^(fl(d1/2)+fl(d2/2)+d2);
                                   only pairs with d1 + 3 d2 <= 2k + 1 contribute to h_k, and the table holds all
                                   of them for k <= 250.
      channels 3, 4 (P = -R, Q = R): h = R * sum_n mu_n (X R^2)^n,  mu_n = sum_{d1+d2=2n+1} (-1)^d1 E_tig(d1,d2).
      channel 2 (phase, Q = 0):    h = (pi/4) * P * sum_m rho_m (X P^2)^m,  rho_m = binom(2m,m)^2 / (16^m (m+1)).
    """
    if not 0 <= k_max <= HEAD:
        raise ValueError("k_max must be in 0..250")
    par = parameters()
    P, Q = channel_polys(p)
    if p in SMOOTHED:
        if Q != [0, -1]:
            raise DataError("the smoothed channels are implemented for Q = -X only")
        pnum, pden = _common_den(P)
        table = tcell_energy_intervals()
        blocks = [[] for _ in range(2 * k_max + 2)]
        for (d1, d2), (a, b) in table.items():
            deg = d1 // 2 + d2 // 2 + d2
            if deg > k_max:
                continue
            a, b = _endpoints(mode, a, b)
            blocks[d1].append((deg, a, b) if d2 % 2 == 0 else (deg, -b, -a))
        lo, hi, den = _horner(blocks, pnum, pden, k_max)
        scale = 2 * SCALE * den
    elif p in REFLECTED:
        R = Q
        rnum, rden = _common_den(R)
        unum = [0] + _poly_mul_int(rnum, rnum, k_max)
        blocks = [[(0,) + _endpoints(mode, a, b)] for a, b in tig_mu_intervals()[: k_max + 1]]
        lo, hi, den = _horner(blocks, unum, rden * rden, k_max)
        lo, hi = _mul_exact(lo, hi, rnum, k_max)
        scale = 2 * SCALE * den * rden
    else:
        if mode == "interval":
            pi_lo, pi_hi = pi_enclosure(20)          # the enclosure of pi stated in the paper (20 decimals)
        else:
            pi_lo = pi_hi = sum(pi_enclosure(60)) / 2  # pi to 60 decimals
        out = []
        for q in _phase_rational_head(k_max):
            x, y = q * pi_lo / 4, q * pi_hi / 4
            out.append((min(x, y), max(x, y)))
        return tuple(out)
    return tuple((Fraction(a, scale), Fraction(b, scale)) for a, b in zip(lo, hi))


def mixture_head(mode: str = "interval", k_max: int = HEAD):
    """Enclosures of H_k = sum_p w_p h_k^(p), k = 0..k_max, from `channel_head` (weights are non-negative)."""
    w = parameters()["wQ"]
    heads = [channel_head(p, mode, k_max) for p in range(N_CHANNELS)]
    return tuple((sum(w[p] * heads[p][k][0] for p in range(N_CHANNELS)),
                  sum(w[p] * heads[p][k][1] for p in range(N_CHANNELS))) for k in range(k_max + 1))


def abs_sup(lo: Fraction, hi: Fraction) -> Fraction:
    """sup |x| over lo <= x <= hi."""
    return max(abs(lo), abs(hi))


def alternating_head(p: int, mode: str = "interval"):
    """Enclosure of sum_{k=0}^{250} (-1)^k h_k^(p)."""
    lo = hi = Fraction(0)
    for k, (a, b) in enumerate(channel_head(p, mode)):
        if k % 2 == 0:
            lo, hi = lo + a, hi + b
        else:
            lo, hi = lo - b, hi - a
    return lo, hi


# --------------------------------------------------------------------------------------------------------------
# gamma-dagger: the paper's algebraic enclosure, in exact arithmetic
# --------------------------------------------------------------------------------------------------------------

@lru_cache(maxsize=None)
def gamma_dagger_enclosure(degree: int = 14, den: int = 5 * 10 ** 10, pi_digits: int = 20):
    """The enclosure of gamma-dagger of the paper's lemma, recomputed from its construction, with the Taylor
    polynomial P_N of (1 - x)^(-1/2) of even degree N = `degree` (the paper uses N = 14, prefactors with the
    denominator 5*10^10 and pi to 20 decimals; larger values give a tighter enclosure by the same argument).

    Returns a dict: the coefficients c_k of P_N, the coefficients of (1 - x) P_N(x)^2, the remainder
    coefficients d_(N+1)..d_(2N+1), eps = 3^-(N+1), q_0, the two prefactors (the best ones with denominator
    `den`) and the resulting rational bounds lower < gamma-dagger < upper."""
    n = degree
    assert n % 2 == 0
    c = [Fraction(math.comb(2 * k, k), 4 ** k) for k in range(n + 1)]              # Taylor coefficients of (1-x)^(-1/2)
    sq = [sum(c[i] * c[k - i] for i in range(max(0, k - n), min(k, n) + 1)) for k in range(2 * n + 1)]
    prod = [(sq[k] if k <= 2 * n else 0) - (sq[k - 1] if k >= 1 else 0) for k in range(2 * n + 2)]   # (1 - x) P_N^2
    d = {m: -prod[m] for m in range(n + 1, 2 * n + 2)}
    eps = Fraction(1, 3 ** (n + 1))
    # mean of cos^j over a period: binom(j, j/2) / 2^j for even j, 0 for odd j
    mean = [Fraction(math.comb(j, j // 2), 2 ** j) if j % 2 == 0 else Fraction(0) for j in range(n + 3)]
    # (2/pi) * int_0^{pi/2} cos^2 t P_N(cos(2t)/3) dt = mean over u = cos 2t of (1 + u)/2 * P_N(u/3)
    q0 = sum(c[k] / 3 ** k * (mean[k] + mean[k + 1]) / 2 for k in range(n + 1))
    # largest a/den with (a/den)^2 <= 2 / (3 (1 + eps)), smallest b/den with (b/den)^2 >= 2 / (3 (1 - eps))
    t_lo = Fraction(2) / (3 * (1 + eps))
    t_hi = Fraction(2) / (3 * (1 - eps))
    a = math.isqrt(t_lo.numerator * den * den // t_lo.denominator)
    while Fraction(a + 1, den) ** 2 <= t_lo:
        a += 1
    while Fraction(a, den) ** 2 > t_lo:
        a -= 1
    b = math.isqrt(t_hi.numerator * den * den // t_hi.denominator)
    while Fraction(b, den) ** 2 < t_hi:
        b += 1
    while Fraction(b - 1, den) ** 2 >= t_hi:
        b -= 1
    pi_lo, pi_hi = pi_enclosure(pi_digits)
    return {"c": c, "product": prod, "d": d, "eps": eps, "q0": q0, "pref_lo": Fraction(a, den),
            "pref_hi": Fraction(b, den), "lower": Fraction(a, den) * q0 * pi_lo / 2,
            "upper": Fraction(b, den) * q0 * pi_hi / 2}


def gamma_dagger_tight():
    """A 30-digit exact enclosure (lo, hi) of gamma-dagger: the same construction with N = 80."""
    enc = gamma_dagger_enclosure(80, 10 ** 45, 60)
    assert all(v > 0 for v in enc["d"].values()) and sum(enc["d"].values()) == 1
    assert enc["upper"] - enc["lower"] < Fraction(1, 10 ** 30)
    return enc["lower"], enc["upper"]


def main_guard(fn) -> None:
    """Run a script's main(); a DataError is reported as a failure with exit status 2."""
    try:
        code = fn()
    except DataError as exc:
        print(f"DATA ERROR: {exc}")
        code = 2
    sys.stdout.flush()
    sys.exit(code)
