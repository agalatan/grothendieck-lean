#!/usr/bin/env python3
"""Generate or check Grothe/UpperBivar/ from data/upper-bivar/certificate.json.

Agent-ID: gemini-40b2. Refs #793.
All generated Lean files are byte-for-byte reproducible from data/upper-bivar/certificate.json.
Acceptance and analytic soundness are independently verified in Lean:
  - Grothe/UpperBivar/ContourChecks/Channel*.lean (kernel-checked Taylor-Hardy contours)
  - Grothe/UpperBivar/Head.lean (exact interval head and rational endpoint arithmetic)
  - Grothe/UpperBivar/Bound.lean (measure-theoretic realization and convex transfer)
"""
import argparse
from fractions import Fraction
import json
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
CERT_PATH = ROOT / "data/upper-bivar/certificate.json"
OUT_DIR = ROOT / "Grothe/UpperBivar"

SUBARC_CHUNK = 64
D64 = 1 << 64
D64_SQ = 1 << 128
CT_Q = Fraction(23187, 24245)
ST_Q = Fraction(7084, 24245)
SE_Q = Fraction(87841, 98209)
PI_LO20_Q = Fraction(314159265358979323846, 10**20)
TM_ZERO = (0, 0, 0, 0)
TM_ONE = (D64, 0, 0, 0)
TMC_ONE = (TM_ONE, TM_ZERO)


def _of_rat_down64(q: Fraction) -> int:
    return (q.numerator * D64) // q.denominator


def _of_rat_tm(q: Fraction) -> tuple[int, int, int, int]:
    return (_of_rat_down64(q), 0, 0, 1)


def _tm_add(a: tuple[int, int, int, int], b: tuple[int, int, int, int]) -> tuple[int, int, int, int]:
    return (a[0] + b[0], a[1] + b[1], a[2] + b[2], a[3] + b[3])


def _tm_sub(a: tuple[int, int, int, int], b: tuple[int, int, int, int]) -> tuple[int, int, int, int]:
    return (a[0] - b[0], a[1] - b[1], a[2] - b[2], a[3] + b[3])


def _tm_neg(a: tuple[int, int, int, int]) -> tuple[int, int, int, int]:
    return (-a[0], -a[1], -a[2], a[3])


def _tm_double(a: tuple[int, int, int, int]) -> tuple[int, int, int, int]:
    return (2 * a[0], 2 * a[1], 2 * a[2], 2 * a[3])


def _tm_half(a: tuple[int, int, int, int]) -> tuple[int, int, int, int]:
    return (a[0] // 2, a[1] // 2, a[2] // 2, (a[3] + 1) // 2 + 2)


def _tm_mul(a: tuple[int, int, int, int], b: tuple[int, int, int, int]) -> tuple[int, int, int, int]:
    ac, ad, aq, ar = a
    bc, bd, bq, br = b
    c = (ac * bc) // D64
    d = (ac * bd + ad * bc) // D64
    q = (ac * bq + ad * bd + aq * bc) // D64
    b1 = abs(ac) + abs(ad) + abs(aq)
    b2 = abs(bc) + abs(bd) + abs(bq)
    t3 = abs(ad * bq + aq * bd)
    t4 = abs(aq) * abs(bq)
    tr = t3 + t4 + ar * b2 + br * b1 + ar * br
    fup = 0 if tr == 0 else ((tr - 1) // D64) + 1
    return (c, d, q, fup + 3)


def _tm_lo(a: tuple[int, int, int, int]) -> int:
    return a[0] - (abs(a[1]) + abs(a[2]) + a[3])


def _tm_inv_pos(a: tuple[int, int, int, int]) -> tuple[int, int, int, int]:
    ac, ad, aq, ar = a
    lo = _tm_lo(a)
    assert ac >= 0 and lo > 0, "tmInvPos non-positive enclosure"
    ic = D64_SQ // ac
    ic2 = (ic * ic) // D64
    d2 = ((-ad) * ic2) // D64
    d2c = (((ad * ad) // D64) * ic) // D64
    q2 = ((d2c - aq) * ic2) // D64
    res = _tm_sub(TM_ONE, _tm_mul(a, (ic, d2, q2, 0)))
    ah = abs(res[0]) + abs(res[1]) + abs(res[2]) + res[3]
    num = ah * D64
    rem = 0 if num == 0 else ((num - 1) // lo) + 1
    return (ic, d2, q2, rem)


def _tmc_mul(z, w):
    return (
        _tm_sub(_tm_mul(z[0], w[0]), _tm_mul(z[1], w[1])),
        _tm_add(_tm_mul(z[0], w[1]), _tm_mul(z[1], w[0])),
    )


def _tmc_horner(x, cs):
    acc = (TM_ZERO, TM_ZERO)
    for c in reversed(cs):
        acc = (_tm_add(c, _tmc_mul(x, acc)[0]), _tmc_mul(x, acc)[1])
    return acc


def _smoothed_subarc_checkpoints(c: dict, chunk_size: int = SUBARC_CHUNK) -> list[tuple[list[int], int, int, int]]:
    """Exact port of HaagerupKernel.TaylorHardy smoothed Simpson quadrature per chunk."""
    m00 = CT_Q * CT_Q + SE_Q * ST_Q * ST_Q
    m01 = CT_Q * ST_Q * (1 - SE_Q)
    m11 = ST_Q * ST_Q + SE_Q * CT_Q * CT_Q
    c00, c01sq = _of_rat_tm(m00 * m00), _of_rat_tm(m01 * m01)
    c0001, c0111, c11 = _of_rat_tm(m00 * m01), _of_rat_tm(m01 * m11), _of_rat_tm(m11 * m11)
    P = [_of_rat_tm(Fraction(x, 10**9)) for x in c["p_ints"]]
    Q = [_of_rat_tm(Fraction(x, 10**9)) for x in c["q_ints"]]
    rhoQ = Fraction(c["rhoQ"][0], c["rhoQ"][1])
    jQ = Fraction(c["jQ"][0], c["jQ"][1])
    budgetQ = Fraction(c["budgetQ_num"], 10**6)
    rhoTM, jTM, j16sq = _of_rat_tm(rhoQ), _of_rat_tm(jQ), _of_rat_tm(16 * jQ * jQ)
    M_grid = 1 << c["mean_k"]
    unit = D64 // (2 * M_grid)

    def inv_im(R, neg: bool):
        ra, rb, rc = ((_tm_neg(R[0][0]), _tm_neg(R[0][1])), (_tm_neg(R[1][0]), _tm_neg(R[1][1])), (_tm_neg(R[2][0]), _tm_neg(R[2][1]))) if neg else R
        m_00 = (_tm_sub(TM_ONE, ra[0]), _tm_sub(TM_ZERO, ra[1]))
        m_01 = (_tm_neg(rb[0]), _tm_neg(rb[1]))
        m_11 = (_tm_sub(TM_ONE, rc[0]), _tm_sub(TM_ZERO, rc[1]))
        d = (_tm_sub(_tmc_mul(m_00, m_11)[0], _tmc_mul(m_01, m_01)[0]), _tm_sub(_tmc_mul(m_00, m_11)[1], _tmc_mul(m_01, m_01)[1]))
        nd = _tm_add(_tm_mul(d[0], d[0]), _tm_mul(d[1], d[1]))
        ndi = _tm_inv_pos(nd)
        di = (_tm_mul(d[0], ndi), _tm_neg(_tm_mul(d[1], ndi)))
        c_mid = _tmc_mul(m_01, di)
        return ((_tmc_mul(m_11, di), (_tm_neg(c_mid[0]), _tm_neg(c_mid[1])), _tmc_mul(m_00, di)), nd)

    steps: list[int] = c["mean_steps"]
    chunks = [steps[i : i + chunk_size] for i in range(0, len(steps), chunk_size)]
    out: list[tuple[list[int], int, int, int]] = []
    pos = 0
    acc = 0
    for ch in chunks:
        pos0, acc0 = pos, acc
        for w in ch:
            sm, h = (2 * pos + w) * unit, w * unit
            s = (sm, h, 0, 0)
            s2 = _tm_mul(s, s)
            one_ps2 = _tm_add(TM_ONE, s2)
            di = _tm_inv_pos(one_ps2)
            t = (_tm_mul(_tm_mul(rhoTM, _tm_sub(TM_ONE, s2)), di), _tm_mul(_tm_mul(rhoTM, _tm_double(s)), di))
            t2 = _tmc_mul(t, t)
            p = _tmc_mul(t, _tmc_horner(t2, P))
            q = _tmc_mul(t, _tmc_horner(t2, Q))
            R = (
                (_tm_add(_tm_mul(c00, p[0]), _tm_mul(c01sq, q[0])), _tm_add(_tm_mul(c00, p[1]), _tm_mul(c01sq, q[1]))),
                (_tm_add(_tm_mul(c0001, p[0]), _tm_mul(c0111, q[0])), _tm_add(_tm_mul(c0001, p[1]), _tm_mul(c0111, q[1]))),
                (_tm_add(_tm_mul(c01sq, p[0]), _tm_mul(c11, q[0])), _tm_add(_tm_mul(c01sq, p[1]), _tm_mul(c11, q[1]))),
            )
            (ip, np), (im, nm) = inv_im(R, False), inv_im(R, True)
            gpa, gpb, gpc = _tm_sub(ip[0][0], jTM), ip[1][0], _tm_sub(ip[2][0], jTM)
            gma, gmb, gmc = _tm_sub(im[0][0], jTM), im[1][0], _tm_sub(im[2][0], jTM)
            za, zb, zc = _tm_half(_tm_add(gpa, gma)), _tm_half(_tm_add(gpb, gmb)), _tm_half(_tm_add(gpc, gmc))
            zdet = _tm_sub(_tm_mul(za, zc), _tm_mul(zb, zb))
            assert _tm_lo(za) > 0 and _tm_lo(zdet) > 0
            zdi = _tm_inv_pos(zdet)
            zia, zib, zic = _tm_mul(zc, zdi), _tm_neg(_tm_mul(zb, zdi)), _tm_mul(za, zdi)
            m00_s = _tm_add(_tm_mul(gma, zia), _tm_mul(gmb, zib))
            m01_s = _tm_add(_tm_mul(gma, zib), _tm_mul(gmb, zic))
            m10_s = _tm_add(_tm_mul(gmb, zia), _tm_mul(gmc, zib))
            m11_s = _tm_add(_tm_mul(gmb, zib), _tm_mul(gmc, zic))
            ta = _tm_add(_tm_mul(m00_s, gpa), _tm_mul(m01_s, gpb))
            tb = _tm_add(_tm_mul(m00_s, gpb), _tm_mul(m01_s, gpc))
            tc = _tm_add(_tm_mul(m10_s, gpb), _tm_mul(m11_s, gpc))
            tdet = _tm_sub(_tm_mul(ta, tc), _tm_mul(tb, tb))
            assert _tm_lo(ta) > 0 and _tm_lo(tdet) > 0
            cia = _tm_half(_tm_sub(ip[0][1], im[0][1]))
            cib = _tm_half(_tm_sub(ip[1][1], im[1][1]))
            cic = _tm_half(_tm_sub(ip[2][1], im[2][1]))
            cia2, cib2, cic2 = _tm_mul(cia, cia), _tm_mul(cib, cib), _tm_mul(cic, cic)
            ciab, cibc = _tm_mul(cia, cib), _tm_mul(cib, cic)
            sa = _tm_add(_tm_add(_tm_mul(zia, cia2), _tm_double(_tm_mul(zib, ciab))), _tm_mul(zic, cib2))
            sb = _tm_add(_tm_add(_tm_mul(zia, ciab), _tm_mul(zib, _tm_add(_tm_mul(cia, cic), cib2))), _tm_mul(zic, cibc))
            sc = _tm_add(_tm_add(_tm_mul(zia, cib2), _tm_double(_tm_mul(zib, cibc))), _tm_mul(zic, cic2))
            tea, teb, tec = _tm_add(_tm_add(za, sa), jTM), _tm_add(zb, sb), _tm_add(_tm_add(zc, sc), jTM)
            tja, tjc = _tm_add(ta, jTM), _tm_add(tc, jTM)
            dtj = _tm_sub(_tm_mul(tja, tjc), _tm_mul(tb, tb))
            dtej = _tm_sub(_tm_mul(tea, tec), _tm_mul(teb, teb))
            assert _tm_lo(dtj) > 0 and _tm_lo(dtej) > 0
            den = _tm_mul(_tm_mul(_tm_mul(j16sq, _tm_mul(np, nm)), zdet), _tm_mul(dtj, dtej))
            inv = _tm_inv_pos(_tm_mul(one_ps2, den))
            acc += w * (3 * inv[0] + inv[2] + 3 * inv[3])
            pos += w
        out.append((ch, pos0, acc0, acc))
    cap = (3 * M_grid) * _of_rat_down64(PI_LO20_Q * budgetQ)
    assert pos == M_grid and 4 * acc <= cap
    return out


def _wrap_right_append(names: list[str], width: int = 100) -> list[str]:
    n = len(names)
    assert n >= 2
    if n == 2:
        return [f"  {names[0]} ++ {names[1]}"]
    toks = [f"{names[0]} ++"] + [f"({names[i]} ++" for i in range(1, n - 2)] + [
        f"({names[-2]} ++ {names[-1]}" + ")" * (n - 2)
    ]
    lines: list[str] = []
    cur = "  " + toks[0]
    for tok in toks[1:]:
        if len(cur) + 1 + len(tok) <= width:
            cur += " " + tok
        else:
            lines.append(cur)
            cur = "    " + tok
    lines.append(cur)
    return lines


def wrap_list(items: list[str], indent: str = "  ", width: int = 100) -> str:
    lines: list[str] = []
    cur = indent
    for idx, it in enumerate(items):
        sep = ", " if idx + 1 < len(items) else ""
        tok = f"{it}{sep}"
        if len(cur) + len(tok) > width and cur != indent:
            lines.append(cur.rstrip())
            cur = indent + tok
        else:
            cur += tok
    if cur.strip():
        lines.append(cur.rstrip())
    return "\n".join(lines)


def fmt_q_poly(ints_list: list[int]) -> list[str]:
    terms: list[str] = []
    for x in ints_list:
        if x == 0:
            terms.append("0")
        elif x == 10**9:
            terms.append("1")
        elif x == -(10**9):
            terms.append("-1")
        else:
            terms.append(f"{x} / d9Q")
    return terms


def fin_fn(name: str, typ: str, vals: list[str], private: bool = False) -> list[str]:
    n = len(vals)
    pref = "private def" if private else "def"
    out = [f"{pref} {name} : Fin {n} → {typ}"]
    for idx, v in enumerate(vals):
        out.append(f"  | ⟨{idx}, _⟩ => {v}")
    out.append(f"  | ⟨_ + {n}, h⟩ => absurd h (by omega)")
    out.append("")
    return out


def build_expected_files(dat: dict) -> dict[Path, str]:
    assert not dat.get("use_selector", False), "UpperBivar uses the 6+M polynomial mixture"
    w_ints: list[int] = dat["w_ints"]
    hb_num: int = dat["hb_num"]
    exact_D27: int = dat["exact_D27"]
    res_num27: int = 10**27 - exact_D27
    new_chs: list[dict] = dat["certified_new"]
    M = len(new_chs)
    K = 6 + M
    assert len(w_ints) == K
    assert sum(w_ints) == 10**12 and all(w >= 0 for w in w_ints)

    files: dict[Path, str] = {}

    # ------------------------------------------------------------------
    # 1. Parameters.lean
    # ------------------------------------------------------------------
    p_lines = [
        "import Grothe.UpperSix.Haagerup.Parameters",
        "",
        "set_option warningAsError true",
        "",
        "/-!",
        "# Parameters for the bivariate smoothed-cell, phase, and multi-scale tiger upper witness",
        "",
        "Generated by `tools/gen_upper_bivar.py` from `data/upper-bivar/certificate.json`.",
        "Agent-ID: gemini-40b2",
        "-/",
        "",
        "namespace Haagerup.UpperBivar",
        "",
        "def d9Q : ℚ := 1000000000",
        "",
    ]
    for m, c in enumerate(new_chs):
        p_terms = fmt_q_poly(c["p_ints"])
        p_lines.append(f"def newP{m} : List ℚ := [")
        p_lines.append(wrap_list(p_terms))
        p_lines.append("]")
        if c["kind"] == "tcell":
            q_terms = fmt_q_poly(c["q_ints"])
            p_lines.append(f"def newQ{m} : List ℚ := [")
            p_lines.append(wrap_list(q_terms))
            p_lines.append("]")
        p_lines.append("")

    p_lines += fin_fn("newLastIndex", "ℕ", [str(c["K_cut"]) for c in new_chs])
    p_lines += fin_fn("newRhoQ", "ℚ", [f"{c['rhoQ'][0]} / {c['rhoQ'][1]}" for c in new_chs])
    p_lines += fin_fn("newRegRQ", "ℚ", [f"{c['regRQ'][0]} / {c['regRQ'][1]}" for c in new_chs])
    p_lines += fin_fn("newJCertQ", "ℚ", [f"{c['jQ'][0]} / {c['jQ'][1]}" for c in new_chs])
    p_lines += fin_fn("newBudgetQ", "ℚ", [f"{c['budgetQ_num']} / d6Q" for c in new_chs])
    p_lines += fin_fn("newLinearFloor", "ℚ", [f"{c['linearFloor_num']} / 10 ^ 6" for c in new_chs])
    p_lines += fin_fn("newTailCap", "ℚ", [f"{c['tailCap_num']} / 10 ^ 15" for c in new_chs])
    p_lines += fin_fn("weight", "ℚ", [f"{w} / 10 ^ 12" for w in w_ints])

    p_lines += [
        "def center : ℚ := 1",
        f"def headBudget : ℚ := {hb_num} / 10 ^ 15",
        "",
        "end Haagerup.UpperBivar",
        "",
    ]
    files[OUT_DIR / "Parameters.lean"] = "\n".join(p_lines)

    # ------------------------------------------------------------------
    # 2. ContourChecks/Channel{m}.lean + ContourChecks.lean
    # ------------------------------------------------------------------
    for m, c in enumerate(new_chs):
        rk, mk = c["reg_k"], c["mean_k"]
        m_fin = f"(⟨{m}, by decide⟩ : Fin {M})"
        use_subarc = c["kind"] == "tcell" and len(c["mean_steps"]) > 128
        th_import = (
            "import Grothe.UpperBivar.SubArc"
            if use_subarc
            else "import Grothe.UpperSix.HaagerupKernel.TaylorHardy"
        )
        ch_lines = [
            "import Grothe.UpperBivar.Parameters",
            th_import,
            "",
            "set_option warningAsError true",
            "",
            "/-!",
            f"# Kernel-checked disk positivity and Hardy circle budget for new channel {m}",
            "",
            "Generated by `tools/gen_upper_bivar.py` from `data/upper-bivar/certificate.json`.",
            "Agent-ID: gemini-40b2",
            "-/",
            "",
            "namespace Haagerup.UpperBivar",
            "open HaagerupKernel.TaylorHardy",
            "",
            f"def newRegSteps{m} : List Nat := [",
            wrap_list([str(x) for x in c["reg_steps"]]),
            "]",
            "",
        ]
        if use_subarc:
            ckpts = _smoothed_subarc_checkpoints(c, SUBARC_CHUNK)
            step_names = [f"newMeanSteps{m}_{j}" for j in range(len(ckpts))]
            for j, (ch_steps, _, _, _) in enumerate(ckpts):
                ch_lines += [
                    f"private def newMeanSteps{m}_{j} : List Nat := [",
                    wrap_list([str(x) for x in ch_steps]),
                    "]",
                    "",
                ]
            ch_lines.append(f"def newMeanSteps{m} : List Nat :=")
            ch_lines += _wrap_right_append(step_names)
            ch_lines += [
                "",
                f"theorem newReg{m}_ok :",
                f"    regQ1SmoothedOK ctQ stQ seQ newP{m} newQ{m} (newRegRQ {m_fin})",
                f"      {rk} newRegSteps{m} = true := by",
                "  decide +kernel",
                "",
                f"private abbrev newMeanUnit{m} : Nat := Nat.div D64N (Nat.mul 2 (Nat.pow 2 {mk}))",
                "",
                f"private abbrev newMeanLeaf{m} : Int → Int → Option TM2 :=",
                f"  smoothedLeafInv ctQ stQ seQ newP{m} newQ{m} (newRhoQ {m_fin})",
                f"    (newJCertQ {m_fin})",
                "",
            ]
            part_names = [f"newMean{m}_part{j}" for j in range(len(ckpts))]
            for j, (_, pos0, acc0, mid) in enumerate(ckpts):
                ch_lines += [
                    f"private theorem newMean{m}_part{j} :",
                    f"    sumSimpsonPart newMeanUnit{m} newMeanLeaf{m} {pos0} newMeanSteps{m}_{j}",
                    f"      {acc0} = some {mid} := by",
                    "  decide +kernel",
                    "",
                ]
            n_parts = len(part_names)
            chain_lines = [
                " " * (4 + 2 * j) + f"(sumSimpsonPart_chain {part_names[j]}"
                for j in range(n_parts - 2)
            ] + [
                " " * (4 + 2 * (n_parts - 2))
                + f"(sumSimpsonPart_chain {part_names[-2]} {part_names[-1]}"
                + ")" * (n_parts - 1)
            ]
            ch_lines += [
                f"theorem newMean{m}_ok :",
                f"    meanQ1SmoothedOK ctQ stQ seQ newP{m} newQ{m} (newRhoQ {m_fin})",
                f"      (newJCertQ {m_fin}) (newBudgetQ {m_fin})",
                f"      {mk} newMeanSteps{m} = true :=",
                "  meanQ1SmoothedOK_of_acc",
                *chain_lines,
                "    (by decide +kernel)",
                "",
            ]
        elif c["kind"] == "tcell":
            ch_lines += [
                f"def newMeanSteps{m} : List Nat := [",
                wrap_list([str(x) for x in c["mean_steps"]]),
                "]",
                "",
                f"theorem newReg{m}_ok :",
                f"    regQ1SmoothedOK ctQ stQ seQ newP{m} newQ{m} (newRegRQ {m_fin})",
                f"      {rk} newRegSteps{m} = true := by",
                "  decide +kernel",
                "",
                f"theorem newMean{m}_ok :",
                f"    meanQ1SmoothedOK ctQ stQ seQ newP{m} newQ{m} (newRhoQ {m_fin})",
                f"      (newJCertQ {m_fin}) (newBudgetQ {m_fin})",
                f"      {mk} newMeanSteps{m} = true := by",
                "  decide +kernel",
                "",
            ]
        elif c["kind"] == "tig":
            ch_lines += [
                f"def newMeanSteps{m} : List Nat := [",
                wrap_list([str(x) for x in c["mean_steps"]]),
                "]",
                "",
                f"theorem newReg{m}_ok :",
                f"    regQ1DiagOK newP{m} (newRegRQ {m_fin}) {rk} newRegSteps{m} = true := by",
                "  decide +kernel",
                "",
                f"theorem newMean{m}_ok :",
                f"    meanQ1AntiOK newP{m} (newRhoQ {m_fin})",
                f"      (newJCertQ {m_fin}) (newBudgetQ {m_fin})",
                f"      {mk} newMeanSteps{m} = true := by",
                "  decide +kernel",
                "",
            ]
        else:
            ch_lines += [
                f"def newMeanSteps{m} : List Nat := [",
                wrap_list([str(x) for x in c["mean_steps"]]),
                "]",
                "",
                f"theorem newReg{m}_ok :",
                f"    regQ1DiagOK newP{m} (newRegRQ {m_fin}) {rk} newRegSteps{m} = true := by",
                "  decide +kernel",
                "",
                f"theorem newMean{m}_ok :",
                f"    meanQ1PhaseOK newP{m} (newRhoQ {m_fin})",
                f"      (newJCertQ {m_fin}) (newBudgetQ {m_fin})",
                f"      {mk} newMeanSteps{m} = true := by",
                "  decide +kernel",
                "",
            ]
        ch_lines += ["end Haagerup.UpperBivar", ""]
        files[OUT_DIR / "ContourChecks" / f"Channel{m}.lean"] = "\n".join(ch_lines)

    c_lines = [f"import Grothe.UpperBivar.ContourChecks.Channel{m}" for m in range(M)] + [
        "",
        "set_option warningAsError true",
        "",
        "/-!",
        "# Aggregated contour checks and rational tail comparisons for new channels",
        "",
        "Generated by `tools/gen_upper_bivar.py` from `data/upper-bivar/certificate.json`.",
        "Agent-ID: gemini-40b2",
        "-/",
        "",
        "namespace Haagerup.UpperBivar",
        "",
        "theorem new_tails_rat_ok :",
        f"    (List.finRange {M}).all (fun m ↦",
        "      decide (((newBudgetQ m - newLinearFloor m ^ 2 * newRhoQ m ^ 2) / newRhoQ m ^ 4) *",
        "        (newRhoQ m)⁻¹ ^ (2 * (2 * newLastIndex m + 1)) ≤",
        "          newTailCap m ^ 2 * (1 - (newRhoQ m)⁻¹ ^ 4))) = true := by",
        "  decide +kernel",
        "",
        "end Haagerup.UpperBivar",
        "",
    ]
    files[OUT_DIR / "ContourChecks.lean"] = "\n".join(c_lines)

    # ------------------------------------------------------------------
    # 3. Head.lean
    # ------------------------------------------------------------------
    head_vals: list[str] = []
    for m, c in enumerate(new_chs):
        if c["kind"] == "tcell":
            head_vals.append(f"bivarT 251 tcellRows (newP{m}.map ofRatI) (newQ{m}.map ofRatI) 501 167")
        elif c["kind"] == "tig":
            head_vals.append(f"bivarT 251 (onedRowsI 251 tigMuList) (newP{m}.map ofRatI) [] 503 0")
        else:
            head_vals.append(f"bivarT 321 (onedRowsI 321 (haagMuList 321)) (newP{m}.map ofRatI) [] 643 0")

    h_lines = [
        "import Grothe.UpperBivar.Parameters",
        "import Grothe.UpperSixExact.Head",
        "",
        "set_option warningAsError true",
        "",
        "/-!",
        "# Mixed interval head, linear floors, and rational endpoint arithmetic",
        "",
        "Generated by `tools/gen_upper_bivar.py` from `data/upper-bivar/certificate.json`.",
        "Agent-ID: gemini-40b2",
        "-/",
        "",
        "namespace Haagerup.UpperBivar",
        "open Finset HaagerupKernel Haagerup.Data",
        "",
        f"theorem weight_nonneg (i : Fin {K}) : 0 ≤ weight i := by",
        "  fin_cases i <;> decide +kernel",
        "",
        "theorem weight_sum : ∑ i, weight i = 1 := by decide +kernel",
        "",
    ]
    h_lines += fin_fn("newHeadIntervals", "List Ival", head_vals)
    h_lines += [
        f"def combineAll {{α : Type*}} (six : Fin 6 → α) (ext : Fin {M} → α) (i : Fin {K}) : α :=",
        "  if h6 : i.val < 6 then six ⟨i.val, h6⟩",
        "  else ext ⟨i.val - 6, by omega⟩",
        "",
        f"def allHeads (six : Fin 6 → List Ival) : Fin {K} → List Ival :=",
        "  combineAll six newHeadIntervals",
        "",
        f"def allCaps (six : Fin 6 → ℚ) : Fin {K} → ℚ :=",
        "  combineAll six newTailCap",
        "",
        "def newLinearFloorsOK : Bool :=",
        f"  (List.finRange {M}).all (fun m ↦",
        "    decide (ofRatHi (newLinearFloor m) ≤ ((newHeadIntervals m).getD 0 zeroI).lo))",
        "",
        "def newHeadLengthsOK : Bool :=",
        f"  (List.finRange {M}).all (fun m ↦ decide ((newHeadIntervals m).length = newLastIndex m + 1))",
        "",
        "def withinBudgets (six : Fin 6 → List Ival) : Bool :=",
        f"  decide (absSum (addL (sumL ((List.finRange {K}).map fun i ↦",
        "    (allHeads six i).map (mulI (ofRatI (weight i)))))",
        "    [negI (ofRatI center)]) ≤ ofRatLo headBudget ∧",
        "    newLinearFloorsOK = true ∧ newHeadLengthsOK = true)",
        "",
        "set_option maxRecDepth 10000 in",
        "theorem budgets_ok : withinBudgets SixChannelExact.headIntervals = true := by",
        "  native_decide",
        "",
        "theorem head_ok :",
        f"    absSum (addL (sumL ((List.finRange {K}).map fun i ↦",
        "      (allHeads SixChannelExact.headIntervals i).map (mulI (ofRatI (weight i)))))",
        "      [negI (ofRatI center)]) ≤ ofRatLo headBudget :=",
        "  (of_decide_eq_true budgets_ok).1",
        "",
        "theorem new_floors_ok : newLinearFloorsOK = true :=",
        "  (of_decide_eq_true budgets_ok).2.1",
        "",
        f"theorem new_head_length (m : Fin {M}) :",
        "    (newHeadIntervals m).length = newLastIndex m + 1 :=",
        "  of_decide_eq_true (List.all_eq_true.1 (of_decide_eq_true budgets_ok).2.2 m",
        "    (List.mem_finRange m))",
        "",
        "def residual : ℚ := headBudget + ∑ i, weight i * allCaps SixChannelExact.phaseTailCap i",
        "",
        f"theorem residual_eq : residual = {res_num27} / 10 ^ 27 := by decide +kernel",
        "",
        "theorem residual_lt_center : residual < center := by rw [residual_eq]; decide +kernel",
        "",
        "theorem reciprocal_eq :",
        f"    1 / (center - residual) = 10 ^ 27 / {exact_D27} := by",
        "  rw [residual_eq]",
        "  decide +kernel",
        "",
        "end Haagerup.UpperBivar",
        "",
    ]
    files[OUT_DIR / "Head.lean"] = "\n".join(h_lines)

    # ------------------------------------------------------------------
    # 4. Bound.lean
    # ------------------------------------------------------------------
    b_lines = [
        "import Grothe.UpperBivar.ContourChecks",
        "import Grothe.UpperBivar.Head",
        "import Grothe.UpperSixExact.Bound",
        "",
        "set_option warningAsError true",
        "",
        "/-!",
        "# Multi-channel Grothendieck bound with bivariate smoothed-cell preprocessors",
        "",
        "Generated by `tools/gen_upper_bivar.py` from `data/upper-bivar/certificate.json`.",
        "Agent-ID: gemini-40b2",
        "-/",
        "",
        "namespace Haagerup.UpperBivar",
        "",
        "open Finset Polynomial MeasureTheory",
        "open HaagerupKernel HaagerupKernel.Cell HaagerupKernel.Hardy Haagerup.Data",
        "",
        "noncomputable section",
        "",
        "private lemma ofListQ_map_neg : ∀ l : List ℚ, ofListQ (l.map (- ·)) = -ofListQ l",
        "  | [] => by simp [ofListQ]",
        "  | a :: l => by",
        "    simp only [List.map_cons, ofListQ, ofListQ_map_neg l, Rat.cast_neg, map_neg, mul_neg]",
        "    ring",
        "",
        "private lemma l1_ofListQ_le_one {l : List ℚ}",
        "    (h : decide ((l.map fun q ↦ |q|).sum ≤ 1) = true) :",
        "    l1 (ofListQ l) ≤ 1 :=",
        "  (l1_ofListQ_le l).trans (by simpa only [Rat.cast_one] using Rat.cast_le.2 (of_decide_eq_true h))",
        "",
        f"private lemma new_tail_cmp_of_fin (m : Fin {M}) :",
        "    (((newBudgetQ m : ℝ) - (newLinearFloor m : ℝ) ^ 2 * (newRhoQ m : ℝ) ^ 2) /",
        "      (newRhoQ m : ℝ) ^ 4) * (newRhoQ m : ℝ)⁻¹ ^ (2 * (2 * newLastIndex m + 1)) ≤",
        "      (newTailCap m : ℝ) ^ 2 * (1 - (newRhoQ m : ℝ)⁻¹ ^ 4) := by",
        "  have hall := List.all_eq_true.1 new_tails_rat_ok m (List.mem_finRange m)",
        "  have q := (Rat.cast_le (K := ℝ)).2 (of_decide_eq_true hall)",
        "  simpa only [Rat.cast_mul, Rat.cast_pow, Rat.cast_inv, Rat.cast_div, Rat.cast_sub,",
        "    Rat.cast_one] using q",
        "",
        "private lemma toLp_congr_fn {F₁ F₂ : ℂ × ℂ → ℂ} (h₁ : MemLp F₁ 2 mu2) (h₂ : MemLp F₂ 2 mu2)",
        "    (heq : F₁ = F₂) : h₁.toLp F₁ = h₂.toLp F₂ := by",
        "  subst heq; rfl",
        "",
        "private def fTCell : ℂ × ℂ → ℂ := cellFn tcellCreArr tcellCimArr",
        "",
        "private def fSmoothed : ℂ × ℂ → ℂ :=",
        "  smoothMap (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ) (ceQ : ℝ) fTCell",
        "",
        "private lemma memLp_fSmoothed : MemLp fSmoothed 2 mu2 :=",
        "  memLp_smoothMap (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ) (ceQ : ℝ)",
        "    (measurable_cellFn tcellCreArr tcellCimArr) (norm_cellFn_le tcell_sos_ok)",
        "",
        "private def gSmoothedLp : Lp ℂ 2 mu2 := memLp_fSmoothed.toLp fSmoothed",
        "",
        "private def fTig : ℂ × ℂ → ℂ := cellFn tigCreArr tigCimArr",
        "",
        "private lemma memLp_fTig : MemLp fTig 2 mu2 := memLp_cellFn tig_sos_ok",
        "",
        "private def gTigLp : Lp ℂ 2 mu2 := memLp_fTig.toLp fTig",
        "",
        "private lemma hdQ : ctQ ^ 2 + stQ ^ 2 = 1 := by norm_num [ctQ, stQ]",
        "private lemma heQ : seQ ^ 2 + ceQ ^ 2 = 1 := by norm_num [seQ, ceQ]",
        "",
        "private lemma gSmoothedLp_eq_nat :",
        "    gSmoothedLp = (memLp_smoothMap ((23187 : ℝ) / 24245) ((7084 : ℝ) / 24245)",
        "      ((87841 : ℝ) / 98209) ((43920 : ℝ) / 98209)",
        "      (measurable_cellFn tcellCreArr tcellCimArr) (norm_cellFn_le tcell_sos_ok)).toLp",
        "      (smoothMap ((23187 : ℝ) / 24245) ((7084 : ℝ) / 24245)",
        "        ((87841 : ℝ) / 98209) ((43920 : ℝ) / 98209) fTCell) := by",
        "  have hct : (ctQ : ℝ) = (23187 : ℝ) / 24245 := by norm_num [ctQ]",
        "  have hst : (stQ : ℝ) = (7084 : ℝ) / 24245 := by norm_num [stQ]",
        "  have hse : (seQ : ℝ) = (87841 : ℝ) / 98209 := by norm_num [seQ]",
        "  have hce : (ceQ : ℝ) = (43920 : ℝ) / 98209 := by norm_num [ceQ]",
        "  refine toLp_congr_fn memLp_fSmoothed _ ?_",
        "  unfold fSmoothed",
        "  rw [hct, hst, hse, hce]",
        "",
        "private lemma hq_nil : l1 (ofListQ []) ≤ 1 := l1_ofListQ_le_one (by decide +kernel)",
    ]

    for m, c in enumerate(new_chs):
        if c["kind"] == "tcell":
            b_lines.append(f"private lemma hnewP{m} : l1 (ofListQ newP{m}) ≤ 1 := l1_ofListQ_le_one (by decide +kernel)")
            b_lines.append(f"private lemma hnewQ{m} : l1 (ofListQ newQ{m}) ≤ 1 := l1_ofListQ_le_one (by decide +kernel)")
        elif c["kind"] == "tig":
            b_lines.append(f"private lemma hnewP{m}_neg : l1 (ofListQ (newP{m}.map (- ·))) ≤ 1 :=")
            b_lines.append("  l1_ofListQ_le_one (by decide +kernel)")
            b_lines.append(f"private lemma hnewP{m} : l1 (ofListQ newP{m}) ≤ 1 := l1_ofListQ_le_one (by decide +kernel)")
        else:
            b_lines.append(f"private lemma hnewP{m} : l1 (ofListQ newP{m}) ≤ 1 := l1_ofListQ_le_one (by decide +kernel)")
    b_lines.append("")

    hchan_vals: list[str] = []
    for m, c in enumerate(new_chs):
        if c["kind"] == "tcell":
            hchan_vals.append(f"bivarKernel (ofListQ newP{m}) (ofListQ newQ{m}) (energy gSmoothedLp)")
        elif c["kind"] == "tig":
            hchan_vals.append(f"bivarKernel (ofListQ (newP{m}.map (- ·))) (ofListQ newP{m}) (energy gTigLp)")
        else:
            hchan_vals.append(f"bivarKernel (ofListQ newP{m}) (ofListQ []) (energy (memLp_phase2.toLp phase2))")
    b_lines += fin_fn("newHChan", "ℕ → ℝ", hchan_vals, private=True)

    b_lines += [
        f"private lemma newHChan_summable (m : Fin {M}) : Summable fun n ↦ |newHChan m n| := by",
        "  fin_cases m",
    ]
    for m, c in enumerate(new_chs):
        if c["kind"] == "tcell":
            b_lines.append(f"  · exact summable_abs_bivarKernel _ _ hnewP{m} hnewQ{m} _ (summable_abs_energy gSmoothedLp)")
        elif c["kind"] == "tig":
            b_lines.append(f"  · exact summable_abs_bivarKernel _ _ hnewP{m}_neg hnewP{m} _ (summable_abs_energy gTigLp)")
        else:
            b_lines.append(f"  · exact summable_abs_bivarKernel _ _ hnewP{m} hq_nil _")
            b_lines.append("      (summable_abs_energy (memLp_phase2.toLp phase2))")
    b_lines.append("")

    b_lines += [
        f"private lemma newHChan_dominated (m : Fin {M}) : DominatedKernel (radialKernel (newHChan m)) := by",
        "  have hsm_m := measurable_smoothMap (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ) (ceQ : ℝ)",
        "    (measurable_cellFn tcellCreArr tcellCimArr)",
        "  have hsm_1 := norm_smoothMap_le (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ) (ceQ : ℝ)",
        "    (norm_cellFn_le tcell_sos_ok)",
        "  have hsm_rot : ∀ c x, ‖c‖ = 1 → fSmoothed (rot2 c x) = c * fSmoothed x :=",
        "    fun c x hc ↦ smoothMap_rot2 (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ) (ceQ : ℝ)",
        "      (fun _ v hc' ↦ cellFn_rot2 tcellCreArr tcellCimArr hc' v) hc x",
        "  fin_cases m",
    ]
    for m, c in enumerate(new_chs):
        if c["kind"] == "tcell":
            b_lines.append(f"  · exact (rounding_diskKernel hsm_m hsm_1 hsm_rot memLp_fSmoothed hnewP{m} hnewQ{m}).dominated")
        elif c["kind"] == "tig":
            b_lines += [
                "  · exact (rounding_diskKernel (measurable_cellFn tigCreArr tigCimArr)",
                "      (norm_cellFn_le tig_sos_ok) (fun _ u hc ↦ cellFn_rot2 tigCreArr tigCimArr hc u)",
                f"      memLp_fTig hnewP{m}_neg hnewP{m}).dominated",
            ]
        else:
            b_lines += [
                "  · exact (rounding_diskKernel measurable_phase2 norm_phase2_le",
                f"      (fun _ u hc ↦ phase2_rot2 hc u) memLp_phase2 hnewP{m} hq_nil).dominated",
            ]
    b_lines.append("")

    b_lines += [
        f"private lemma newHChan_mem (m : Fin {M}) (n : ℕ) (hn : n < newLastIndex m + 1) :",
        "    mem (newHChan m n) ((newHeadIntervals m).getD n zeroI) := by",
        "  have hdR : ((23187 : ℝ) / 24245) ^ 2 + ((7084 : ℝ) / 24245) ^ 2 = 1 := by norm_num",
        "  have heR : ((87841 : ℝ) / 98209) ^ 2 + ((43920 : ℝ) / 98209) ^ 2 = 1 := by norm_num",
        "  fin_cases m",
    ]
    for m, c in enumerate(new_chs):
        if c["kind"] == "tcell":
            b_lines += [
                "  · dsimp only [newHChan, newHeadIntervals]",
                "    rw [gSmoothedLp_eq_nat]",
                f"    exact mem_bivarT_smoothed tcell_sos_ok hdR heR tcell_rows_ok (by simp [newQ{m}, ofListQ])",
                f"      (memB_ofListQ newP{m} 251) (memB_ofListQ newQ{m} 251) n hn",
            ]
        elif c["kind"] == "tig":
            b_lines += [
                "  · dsimp only [newHChan, newHeadIntervals, gTigLp, memLp_fTig, fTig]",
                f"    rw [ofListQ_map_neg, tig_bivarKernel_eq tig_sos_ok (ofListQ newP{m}) n]",
                f"    exact mem_bivarT_oned (Q := 0) (memB_ofListQ newP{m} 251) (muTigOf tigCreArr tigCimArr)",
                "      (fun _ hk ↦ mem_muTigOf tig_mu_ok hk) n hn",
            ]
        else:
            b_lines += [
                "  · dsimp only [newHChan, newHeadIntervals]",
                f"    have heq : bivarKernel (ofListQ newP{m}) (ofListQ []) (energy (memLp_phase2.toLp phase2)) n =",
                f"        bivarKernel (ofListQ newP{m}) 0 (onedTable haagCoeff) n :=",
                f"      (phase_bivarKernel_eq (ofListQ newP{m}) n).trans",
                f"        (bivarKernel_oned_eq_head (ofListQ newP{m}) 0 haagCoeff (Nat.lt_succ_self n)).symm",
                "    rw [heq]",
                f"    exact mem_bivarT_oned (Q := 0) (memB_ofListQ newP{m} 321) haagCoeff",
                "      (fun _ hk ↦ mem_haagMuList hk) n hn",
            ]
    b_lines.append("")

    b_lines += [
        "private theorem lower_of_interval {x : ℝ} {I : Ival} {q : ℚ}",
        "    (hm : Haagerup.mem x I) (h : ofRatHi q ≤ I.lo) : (q : ℝ) ≤ x := by",
        "  have hh : (ofRatHi q : ℝ) ≤ I.lo := by exact_mod_cast h",
        "  have hd : (0 : ℝ) < (D : ℝ) := by norm_num [D]",
        "  exact (mul_le_mul_iff_left₀ hd).mp ((Haagerup.le_ofRatHi q).trans (hh.trans hm.1))",
        "",
        "private theorem tail_after_linear (h : ℕ → ℝ) (r B L T : ℝ) (K : ℕ) (hr : 1 < r)",
        "    (hL : 0 ≤ L) (h0 : L ≤ h 0) (hT : 0 ≤ T)",
        "    (hB : ∀ J, ∑ n ∈ range J, h n ^ 2 * r ^ (2 * (2 * n + 1)) ≤ B)",
        "    (hcmp : ((B - L ^ 2 * r ^ 2) / r ^ 4) * r⁻¹ ^ (2 * (2 * K + 1)) ≤",
        "      T ^ 2 * (1 - r⁻¹ ^ 4)) :",
        "    ∑' n, |h (n + (K + 1))| ≤ T := by",
        "  simpa only [Nat.add_assoc] using hardy_tail (fun n ↦ h (n + 1)) r hr _",
        "    (hardy_budget_after_linear h r B L (zero_lt_one.trans hr) hL h0 hB) K T hT hcmp",
        "",
        f"private lemma newHChan_tail (m : Fin {M}) :",
        "    ∑' n, |newHChan m (n + (newLastIndex m + 1))| ≤ (newTailCap m : ℝ) := by",
        "  have hr1 : 1 < (newRhoQ m : ℝ) := by fin_cases m <;> norm_num [newRhoQ]",
        "  have hT0 : 0 ≤ (newTailCap m : ℝ) := by fin_cases m <;> norm_num [newTailCap]",
        "  have hL0 : 0 ≤ (newLinearFloor m : ℝ) := by fin_cases m <;> norm_num [newLinearFloor]",
        "  have hchecked : ofRatHi (newLinearFloor m) ≤ ((newHeadIntervals m).getD 0 zeroI).lo :=",
        "    of_decide_eq_true (List.all_eq_true.1 new_floors_ok m (List.mem_finRange m))",
        "  have h0 := lower_of_interval (newHChan_mem m 0 (Nat.zero_lt_succ _)) hchecked",
        "  refine tail_after_linear (newHChan m) (newRhoQ m : ℝ) (newBudgetQ m : ℝ)",
        "    (newLinearFloor m : ℝ) (newTailCap m : ℝ) (newLastIndex m) hr1 hL0 h0 hT0 ?_",
        "    (new_tail_cmp_of_fin m)",
        "  intro J",
        "  fin_cases m",
    ]
    for m, c in enumerate(new_chs):
        if c["kind"] == "tcell":
            b_lines += [
                "  · exact hardy_smoothed_channel_tm hdQ heQ (measurable_cellFn tcellCreArr tcellCimArr)",
                "      (norm_cellFn_le tcell_sos_ok) (fun _ v hc ↦ cellFn_rot2 tcellCreArr tcellCimArr hc v)",
                f"      hnewP{m} hnewQ{m} (by norm_num [newRhoQ]) (by norm_num [newRhoQ, newRegRQ])",
                f"      (by norm_num [newJCertQ]) (by norm_num [newBudgetQ, d6Q]) newReg{m}_ok newMean{m}_ok J",
            ]
        elif c["kind"] == "tig":
            b_lines += [
                "  · exact hardy_anti_channel_tm (measurable_cellFn tigCreArr tigCimArr)",
                "      (norm_cellFn_le tig_sos_ok) (fun _ u hc ↦ cellFn_rot2 tigCreArr tigCimArr hc u)",
                f"      memLp_fTig hnewP{m} (by norm_num [newRhoQ]) (by norm_num [newRhoQ, newRegRQ])",
                f"      (by norm_num [newJCertQ]) (by norm_num [newBudgetQ, d6Q]) newReg{m}_ok newMean{m}_ok J",
            ]
        else:
            b_lines += [
                "  · exact hardy_phase_channel_tm measurable_phase2 norm_phase2_le",
                f"      (fun _ u hc ↦ phase2_rot2 hc u) memLp_phase2 hnewP{m}",
                "      (by norm_num [newRhoQ]) (by norm_num [newRhoQ, newRegRQ])",
                f"      (by norm_num [newJCertQ]) (by norm_num [newBudgetQ, d6Q]) newReg{m}_ok newMean{m}_ok J",
            ]
    b_lines.append("")

    b_lines += [
        f"theorem isBound : Statement.IsBound ((10 : ℝ) ^ 27 / {exact_D27}) := by",
        "  obtain ⟨hSix, hsSix, hdSix, hmSix, heSix⟩ := SixChannelExact.exists_certified_channels",
        "  have hlenSix (p : Fin 6) : (SixChannelExact.headIntervals p).length ≤ 320 + 1 := by",
        "    rw [SixChannelExact.head_length]; simp only [SixChannelExact.lastIndex]; split <;> decide",
        f"  have hlenNew (m : Fin {M}) : (newHeadIntervals m).length ≤ 320 + 1 := by",
        "    rw [new_head_length]; fin_cases m <;> decide",
        "  have htr := convex_transfer_variable_ival (N := 320) (wQ := weight)",
        "    (h := combineAll hSix newHChan)",
        "    (headI := allHeads SixChannelExact.headIntervals)",
        "    (tl := fun i ↦ ((allCaps SixChannelExact.phaseTailCap i : ℚ) : ℝ))",
        "    (cQ := center) (headCapQ := headBudget) (δ := (residual : ℝ))",
        "    (fun i ↦ by exact_mod_cast weight_nonneg i)",
        "    (by exact_mod_cast weight_sum)",
        "    (fun i ↦ by",
        "      dsimp only [combineAll]; split_ifs with h6",
        "      · exact hsSix _",
        "      · exact newHChan_summable _)",
        "    (fun i ↦ by",
        "      dsimp only [combineAll]; split_ifs with h6",
        "      · exact hdSix _",
        "      · exact newHChan_dominated _)",
        "    (fun i ↦ by",
        "      dsimp only [allHeads, combineAll]; split_ifs with h6",
        "      · exact hlenSix _",
        "      · exact hlenNew _)",
        "    (fun i n hn ↦ by",
        "      dsimp only [allHeads, combineAll] at hn ⊢; split_ifs at hn ⊢ with h6",
        "      · exact hmSix _ n hn",
        "      · exact newHChan_mem _ n ((new_head_length _) ▸ hn))",
        "    (fun i ↦ by",
        "      dsimp only [allHeads, allCaps, combineAll]; split_ifs with h6",
        "      · exact heSix _",
        "      · rw [new_head_length]; exact newHChan_tail _)",
        "    head_ok",
        "    (by dsimp only [residual]; push_cast; exact le_rfl)",
        "    (by exact_mod_cast residual_lt_center)",
        f"  have hv : 1 / ((center : ℝ) - (residual : ℝ)) = (10 : ℝ) ^ 27 / {exact_D27} := by",
        "    rw [center, residual_eq]; norm_num",
        "  rwa [← hv]",
        "",
        "end",
        "",
        "end Haagerup.UpperBivar",
        "",
    ]
    files[OUT_DIR / "Bound.lean"] = "\n".join(b_lines)
    return files


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true", help="Verify generated Lean files match certificate.json")
    args = parser.parse_args()

    if not CERT_PATH.is_file():
        print(f"ERROR: missing certificate file {CERT_PATH}", file=sys.stderr)
        return 1
    dat = json.loads(CERT_PATH.read_text())
    expected = build_expected_files(dat)

    if args.check:
        mismatches: list[str] = []
        for path, content in sorted(expected.items()):
            if not path.is_file():
                mismatches.append(f"missing {path.relative_to(ROOT)}")
            elif path.read_text() != content:
                mismatches.append(f"stale {path.relative_to(ROOT)}")
        if mismatches:
            for msg in mismatches:
                print(f"ERROR: {msg}", file=sys.stderr)
            return 1
        print(f"OK: {len(expected)} generated files in Grothe/UpperBivar/ match data/upper-bivar/certificate.json")
        return 0

    written = 0
    for path, content in sorted(expected.items()):
        path.parent.mkdir(parents=True, exist_ok=True)
        if not path.is_file() or path.read_text() != content:
            path.write_text(content)
            written += 1
    print(f"Synced {len(expected)} files under {OUT_DIR.relative_to(ROOT)} ({written} updated)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
