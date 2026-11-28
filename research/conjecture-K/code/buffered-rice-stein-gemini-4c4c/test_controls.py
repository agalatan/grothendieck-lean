#!/usr/bin/env python3
"""Zero-float, -O-safe AST self-audit, adversarial corruption suite, and P3 witness checks (Issue #784).

Agent-ID: gemini-4c4c
Usage:
    python3 -IB test_controls.py [CERT.json]
    python3 -IB -O test_controls.py [CERT.json]
"""
import ast
import copy
from fractions import Fraction as Fr
import json
import pathlib
import sys
import time

HERE = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import verify as VF

ALLOWED_IMPORTS = {"ast", "bisect", "copy", "fractions", "json", "math", "pathlib", "sys", "time", "verify"}


def ast_audit_zero_float_and_no_assert(py_path):
    src = py_path.read_text(encoding="utf-8")
    tree = ast.parse(src, filename=str(py_path))
    for node in ast.walk(tree):
        VF.require(not isinstance(node, ast.Assert), f"Forbidden assert statement in {py_path.name}:{getattr(node, 'lineno', '?')}")
        if isinstance(node, ast.Constant):
            VF.require(
                not isinstance(node.value, (float, complex)),
                f"Forbidden float/complex literal in {py_path.name}:{getattr(node, 'lineno', '?')}",
            )
        elif isinstance(node, ast.Call) and isinstance(node.func, ast.Name):
            VF.require(
                node.func.id not in {"float", "complex", "eval", "exec"},
                f"Forbidden builtin call {node.func.id} in {py_path.name}:{getattr(node, 'lineno', '?')}",
            )
        elif isinstance(node, ast.Import):
            for alias in node.names:
                root = alias.name.split(".")[0]
                VF.require(root in ALLOWED_IMPORTS, f"Disallowed import {alias.name} in {py_path.name}")
        elif isinstance(node, ast.ImportFrom):
            root = (node.module or "").split(".")[0]
            VF.require(root in ALLOWED_IMPORTS, f"Disallowed from-import {node.module} in {py_path.name}")


def expect_reject(mutated_cert, label):
    try:
        VF.verify_certificate(mutated_cert, quiet=True)
    except ValueError:
        return
    raise RuntimeError(f"Negative control FAILED to reject corrupted certificate: {label}")


def run_corruption_controls(base_cert):
    # 1. Gap in ou_slabs s-coverage:
    c = copy.deepcopy(base_cert)
    c["ou_slabs"][1]["s_lo"] = c["ou_slabs"][1]["s_hi"]
    expect_reject(c, "ou_slab_s_gap")

    # 2a. OU slab below minimum chi_ou threshold:
    c = copy.deepcopy(base_cert)
    c["ou_slabs"][-1]["chi_hi"] = "1/1000"
    expect_reject(c, "ou_slab_below_threshold")

    # 2b. Gap between OU slab reach and lowest Stein tile chi_lo on [1/6, 5/24] (tests strip sweep directly):
    c = copy.deepcopy(base_cert)
    c["ou_slabs"][0]["chi_hi"] = "1/50"  # 0.020 >= 11/2000, but [1/6, 5/24] Stein tiles start at 3/100 = 0.030
    expect_reject(c, "ou_to_stein_strip_gap")

    # 3. Chi sliver inside sharp_tiles:
    c = copy.deepcopy(base_cert)
    s0 = Fr(c["sharp_tiles"][0]["s_lo"])
    s1 = Fr(c["sharp_tiles"][0]["s_hi"])
    # Raise chi_lo on all tiles touching the top band [10, 42] on [1/6, 1/3] from 10 to 12:
    for t in c["sharp_tiles"]:
        if Fr(t["chi_lo"]) == Fr(10):
            t["chi_lo"] = "12"
    expect_reject(c, "stein_tile_chi_gap")

    # 4. Incomplete top kurtosis cover (< 42):
    c = copy.deepcopy(base_cert)
    for t in c["sharp_tiles"]:
        if Fr(t["chi_hi"]) == Fr(42):
            t["chi_hi"] = "41"
    expect_reject(c, "stein_tile_top_short")

    # 5. Reversed s-bracket on a tile:
    c = copy.deepcopy(base_cert)
    c["sharp_tiles"][0]["model_left"], c["sharp_tiles"][0]["model_right"] = (
        c["sharp_tiles"][0]["model_right"],
        c["sharp_tiles"][0]["model_left"],
    )
    expect_reject(c, "stein_bad_s_bracket")

    # 6. Half-line Sturm failure via lowered lam[0]:
    c = copy.deepcopy(base_cert)
    first_mid = next(iter(c["models"]))
    c["models"][first_mid]["lam"][0] = str(Fr(c["models"][first_mid]["lam"][0]) - Fr(1, 2))
    expect_reject(c, "stein_halfline_sturm_fail")

    # 7. Non-PSD M_ker matrix:
    c = copy.deepcopy(base_cert)
    first_mid = next(iter(c["models"]))
    c["models"][first_mid]["m_ker"][0] = "-1"
    expect_reject(c, "stein_m_ker_non_psd")

    # 8. Negative LP cut multiplier in par certificate:
    c = copy.deepcopy(base_cert)
    first_pid = next(pid for pid, pv in c["pars"].items() if pv["cuts"])
    typ, th, yv = c["pars"][first_pid]["cuts"][0]
    c["pars"][first_pid]["cuts"][0] = [typ, th, str(-Fr(yv) - Fr(1, 1000))]
    expect_reject(c, "par_negative_cut_weight")

    # 9. Unsound sqrt_ub in par certificate:
    c = copy.deepcopy(base_cert)
    first_pid = next(iter(c["pars"]))
    c["pars"][first_pid]["sqrt_ub"] = "1/10000"
    expect_reject(c, "par_unsound_sqrt_ub")

    # 10. Unused par entry in certificate:
    c = copy.deepcopy(base_cert)
    first_pid = next(iter(c["pars"]))
    c["pars"]["unused_999999"] = copy.deepcopy(c["pars"][first_pid])
    expect_reject(c, "unused_par_entry")

    # 11. Over-optimistic remote-energy frontier threshold below sqrt(2*pi/13) = 0.6952137...:
    c = copy.deepcopy(base_cert)
    c["t_frontier_ub"] = "139042/200000"  # 0.695210 < sqrt(2*pi/13), even if schema allowed it:
    expect_reject(c, "false_frontier_below_sqrt_2pi_13")

    # 12. Over-optimistic Gaussian cap on mid-t s=1 buffered Rice node:
    c = copy.deepcopy(base_cert)
    c["midt_nodes"][0]["r_buf"] = "12534/10000"  # 1.2534 < certified ~1.25394
    expect_reject(c, "midt_false_gaussian_cap")

    # 13. Extending P3 remote closure across the Gaussian barrier to t = 62/100:
    c = copy.deepcopy(base_cert)
    c["p3_remote_closure"]["t_max"] = "62/100"
    c["p3_remote_closure"]["segments"].append(
        {"t_lo": "61/100", "t_hi": "62/100", "mode": "buffered_rice", "s": "5/8"}
    )
    expect_reject(c, "p3_breach_gaussian_barrier")
    return 14


def verify_p3_witnesses_and_false_cap_control(cert):
    """Verify #628 ATK P3 §§6-7 mandatory controls & explicit remote driver pairs in zero-float Fraction arithmetic:
       (a) §6 mandatory negative control: target 31/50 = 0.62 at t = 3/10 = 0.30 is strictly rejected across all s,
           and explicitly exceeded by f_c = ph(z_1 + c W), g_c = ph(z_1 - c W) at c = 11/4 (t ~ 0.3029, V ~ 0.6324 > 0.62);
       (b) §7 items 1 & 3: exact orthogonal-rotation formula for f_c = ph(z_1 + c W), g_c = ph(z_1 - c W):
             alpha^2 = 1/(1+c^2), beta^2 = c^2/(1+c^2), t(c) = (sqrt(pi)/2)*alpha,
             V(c) = (pi/4) * [ alpha^2 - eps*(alpha^6/8 - beta^2) + eta*(3*alpha^10/64 - 3*alpha^4*beta^2/8) ]
           reproduces every entry of the §3 item 4 benchmark table to all printed digits, satisfies V < 500/701,
           and lies strictly below our certified piecewise-quadratic upper bound on [0, 61/100].
    """
    pi_lo, pi_hi, R0_lo, R0_hi = VF.verify_pi_and_r0()
    eps, eta, tau = Fr(39, 50), Fr(779, 10000), Fr(500, 701)
    rho_rev = Fr(2287, 2500)

    # (a) Mandatory §6 negative control: false cap tau_false = 31/50 = 0.62 at t = 3/10 = 0.30
    tau_false = Fr(31, 50)
    t_test = Fr(3, 10)
    rbuf_map = {Fr(5, 8): VF.ceil_dec(R0_hi * VF.sqrt_bounds(1 + Fr(5, 8))[1], 10**10)}
    for nrow in cert["midt_nodes"]:
        rbuf_map[Fr(nrow["s"])] = Fr(nrow["r_buf"])

    v_unbuf = (1 - eta) * (t_test**2) + eta + (eps - eta) * (rho_rev**2)
    VF.require(v_unbuf > tau_false, "P3 §6 control: unbuffered bound unexpectedly <= 0.62 at t=0.30")
    for sj, rb in rbuf_map.items():
        v_sj = (1 - eta) * (t_test**2) + eta + ((eps - eta) / sj) * ((rb - t_test) ** 2)
        VF.require(v_sj > tau_false, f"P3 §6 control: s={sj} bound unexpectedly <= 0.62 at t=0.30")

    # Also verify Gaussian floor itself exceeds 0.62 at t = 0.30:
    v_gauss_030 = (1 - eta) * (t_test**2) + eta + (eps - eta) * (pi_lo / 4 - t_test**2)
    VF.require(v_gauss_030 > Fr(648, 1000) > tau_false, "Gaussian floor at t=0.30 check failed")

    # (b) Exact rational enclosures of #628 ATK P3 §3 item 4 & §7 items 1, 3:
    def driver_bounds(c_val):
        c_val = Fr(c_val)
        a2 = Fr(1) / (1 + c_val * c_val)
        b2 = (c_val * c_val) / (1 + c_val * c_val)
        al_lo, al_hi = VF.sqrt_bounds(a2)
        t_lo = R0_lo * al_lo
        t_hi = R0_hi * al_hi
        coef = a2 - eps * ((a2**3) / 8 - b2) + eta * (3 * (a2**5) / 64 - 3 * (a2**2) * b2 / 8)
        VF.require(coef > 0, "driver V/pi coefficient must be positive")
        return t_lo, t_hi, (pi_lo / 4) * coef, (pi_hi / 4) * coef

    # Endpoint c = 0 (t = sqrt(pi)/2, V = 0.71168978...) and c -> oo (t = 0, V = eps*pi/4 = 0.6126105...):
    _, _, v0_lo, v0_hi = driver_bounds(Fr(0))
    VF.require(Fr(711689, 10**6) < v0_lo < v0_hi < Fr(711691, 10**6) < tau, "P3 §7(3) c=0 endpoint check failed")
    v_inf_lo, v_inf_hi = eps * pi_lo / 4, eps * pi_hi / 4
    VF.require(Fr(612610, 10**6) < v_inf_lo < v_inf_hi < Fr(612611, 10**6) < tau, "P3 §7(3) c->oo endpoint check failed")

    # Explicit witness near t = 0.30 exceeding 0.62: c = 11/4 gives t in (0.3028, 0.3029) and V > 0.6323 > 0.62:
    t114_l, t114_h, v114_l, _ = driver_bounds(Fr(11, 4))
    VF.require(Fr(3028, 10000) < t114_l < t114_h < Fr(3029, 10000) and v114_l > Fr(6323, 10000) > tau_false,
               "Explicit driver witness at c=11/4 failed")

    # Full 7-column benchmark table from #628 ATK P3 §3 item 4 (rounded to 4 / 5 decimals in problem statement):
    table_s3 = [
        (Fr(3, 5), Fr(7599, 10000), Fr(70655, 100000)),
        (Fr(4, 5), Fr(6920, 10000), Fr(69752, 100000)),
        (Fr(1), Fr(6267, 10000), Fr(68665, 100000)),
        (Fr(13, 10), Fr(5403, 10000), Fr(67094, 100000)),
        (Fr(17, 10), Fr(4493, 10000), Fr(65460, 100000)),
        (Fr(23, 10), Fr(3534, 10000), Fr(63929, 100000)),
        (Fr(16, 5), Fr(2643, 10000), Fr(62776, 100000)),
    ]
    segs = cert["p3_remote_closure"]["segments"]
    checked_in_range = 0
    for c_q, t_tab, v_tab in table_s3:
        tl, th, vl, vh = driver_bounds(c_q)
        VF.require(abs(tl - t_tab) < Fr(6, 100000) and abs(vl - v_tab) < Fr(6, 1000000),
                   f"P3 §3 table mismatch at c={c_q}")
        VF.require(vh < tau, f"driver V >= 500/701 at c={c_q}")
        if th <= Fr(61, 100):
            # Locate enclosing segment in p3_remote_closure and check certified upper bound strictly dominates vh:
            matched = False
            for seg in segs:
                ta, tb = Fr(seg["t_lo"]), Fr(seg["t_hi"])
                if ta <= tl and th <= tb:
                    matched = True
                    if seg["mode"] == "unbuffered_2287_2500":
                        ub_seg = (1 - eta) * (tb**2) + eta + (eps - eta) * (rho_rev**2)
                    else:
                        sj = Fr(seg["s"])
                        rb = rbuf_map[sj]
                        ub_seg = max((1 - eta) * (te**2) + eta + ((eps - eta) / sj) * ((rb - te) ** 2) for te in (ta, tb))
                    VF.require(vh < ub_seg < tau, f"certified P3 segment bound failed to enclose witness at c={c_q}")
                    checked_in_range += 1
                    break
            VF.require(matched, f"no P3 segment enclosed witness t in [{tl}, {th}]")
    VF.require(checked_in_range == 4, "expected 4 benchmark witnesses inside [0, 61/100]")
    return len(table_s3)


def main():
    t0 = time.monotonic()
    cert_path = pathlib.Path(sys.argv[1]) if len(sys.argv) > 1 else VF.DEFAULT_CERT

    # 1. AST zero-float & no-assert audit of both verify.py and test_controls.py:
    ast_audit_zero_float_and_no_assert(HERE / "verify.py")
    ast_audit_zero_float_and_no_assert(pathlib.Path(__file__).resolve())

    # 2. Baseline exact verification:
    cert = json.loads(cert_path.read_text(encoding="utf-8"))
    VF.verify_certificate(cert, quiet=True)

    # 3. Adversarial corruption controls:
    n_corrupt = run_corruption_controls(cert)

    # 4. #628 ATK P3 §§6-7 witness & false-cap controls:
    n_witness = verify_p3_witnesses_and_false_cap_control(cert)

    elapsed_ms = int((time.monotonic() - t0) * 1000)
    print(f"PASS ({elapsed_ms} ms): AST zero-float/no-assert audit (2 files), {n_corrupt} corruption controls, "
          f"and {n_witness} exact P3 §§6-7 witness/false-cap checks succeeded.")


if __name__ == "__main__":
    main()
