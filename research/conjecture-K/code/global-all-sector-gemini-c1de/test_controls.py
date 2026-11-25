#!/usr/bin/env python3
"""Negative and corruption control suite for Global All-Sector Closure F_joint(c*) <= 0 (#436).

Agent-ID: gemini-c1de. Refs #436, #177.
Verifies 23 independent rejection controls:
  1. Part 1 gap between amplitude exterior slabs rejected.
  2. Part 1 amplitude exterior matrix inflation breaking S_r >= 3/4 PSD rejected.
  3. Part 1 shift exterior even matrix inflation rejected.
  4. Part 1 shift exterior odd O_iso inflation breaking B_3 - O_iso > 0 rejected.
  5. Part 1 w=11/8 Jensen diagonal lower-bound under-reporting rejected.
  6. Part 2 origin strip missing slab rejected.
  7. Part 2 origin strip M_re inflation breaking B_3 - M_re > 0 rejected.
  8. Part 2 origin strip M_im off-diagonal inflation breaking 3x3 Sylvester det > 0 rejected.
  9. Part 2 w=0 Jensen diagonal lower-bound under-reporting rejected.
 10. Part 2 non-positive s_odd rejected.
 11. Part 3 4D bulk slab discontinuity rejected.
 12. Part 3 open_boxes > 0 rejected.
 13. Part 3 non-negative worst_margin >= 0 rejected.
 14. Part 3 non-positive min_odd_piv <= 0 rejected.
 15. Part 3 inner handoff gap (s_odd_p3 > s_odd_p2) rejected.
 16. Part 3 negative s_odd rejected, and negative base curvature bound n_up rejected (2 checks).
 17. Part 3 closed-box sum mismatch rejected, and zeroed closed_g rejected (2 checks).
 18. Summary total_4d_boxes tampering rejected.
 19. Part 3 T2 ring24 inward-rounded hT (short by 2^-51) rejected.
 20. Part 3 coarse sector 2 of 24 inward-rounded angular width (1501199875790165/2^55 < 1/24) rejected.
 21. CLI bad cpp_sha256 rejected AND CLI `-O` rejected (2 checks).
 22. Live C++17 false-target & rounding-gap control (`certify_all_sector --control-false-hotspot`).
 23. C++ `-DNDEBUG` compilation rejected at compile time.
"""
import copy
import json
import subprocess
import sys
import tempfile
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import verify  # noqa: E402


def expect_fail(label: str, fn):
    try:
        fn()
    except (AssertionError, ValueError, RuntimeError) as exc:
        print(f"CONTROL PASS (rejected as expected): {label} -> {exc}")
        return
    raise SystemExit(f"CONTROL FAILURE: {label} unexpectedly PASSED!")


def main():
    here = Path(__file__).resolve().parent
    res_path = here / "result.json"
    base = json.loads(res_path.read_text(encoding="utf-8"))

    # Sanity: clean certificate passes
    verify.verify_all(base)

    # 1. Part 1 discontinuity
    d1 = copy.deepcopy(base)
    d1["part1_potential_slabs"][5]["wl"] = (0.0001).hex()
    expect_fail("Part 1 slab discontinuity", lambda: verify.verify_all(d1))

    # 2. Part 1 amplitude exterior PSD failure
    d2 = copy.deepcopy(base)
    d2["part1_potential_slabs"][0]["P_re"]["a00"][1] = (10.0).hex()
    expect_fail("Part 1 amplitude exterior PSD failure", lambda: verify.verify_all(d2))

    # 3. Part 1 shift exterior even PSD failure
    d3 = copy.deepcopy(base)
    for s in d3["part1_potential_slabs"]:
        if s["shift_ext"]:
            s["P_im"]["a11"][1] = (50.0).hex()
            break
    expect_fail("Part 1 shift exterior even PSD failure", lambda: verify.verify_all(d3))

    # 4. Part 1 shift exterior odd O_iso PSD failure & Jensen diagonal under-report failure
    d4 = copy.deepcopy(base)
    for s in d4["part1_potential_slabs"]:
        if s["shift_ext"]:
            s["O_iso"][0][1] = (2.0).hex()
            break
    expect_fail("Part 1 shift exterior odd O_iso PSD failure", lambda: verify.verify_all(d4))

    d4b = copy.deepcopy(base)
    for s in d4b["part1_potential_slabs"]:
        if s["shift_ext"]:
            s["O_iso"][0][0] = (0.40).hex()
            s["O_iso"][0][1] = (0.41).hex()
            break
    expect_fail("Part 1 w=11/8 Jensen diagonal lower-bound violation", lambda: verify.verify_all(d4b))

    # 5. Part 2 missing origin slab
    d5 = copy.deepcopy(base)
    d5["part2_origin_strip"].pop(10)
    expect_fail("Part 2 missing origin slab", lambda: verify.verify_all(d5))

    # 6. Part 2 M_re diagonal PSD failure
    d6 = copy.deepcopy(base)
    d6["part2_origin_strip"][0]["M_re"][0][1] = (2.0).hex()
    expect_fail("Part 2 M_re diagonal PSD failure", lambda: verify.verify_all(d6))

    # 7. Part 2 M_im off-diagonal 3x3 Sylvester failure & w=0 Jensen diagonal under-report failure
    d7 = copy.deepcopy(base)
    d7["part2_origin_strip"][0]["M_im"][1][1] = (2.0).hex()
    expect_fail("Part 2 M_im off-diagonal PSD failure", lambda: verify.verify_all(d7))

    d7b = copy.deepcopy(base)
    d7b["part2_origin_strip"][0]["M_im"][0][0] = (1.04).hex()
    d7b["part2_origin_strip"][0]["M_im"][0][1] = (1.05).hex()
    expect_fail("Part 2 w=0 Jensen diagonal lower-bound violation", lambda: verify.verify_all(d7b))

    # 8. Part 2 non-positive s_odd
    d8 = copy.deepcopy(base)
    d8["part2_origin_strip"][0]["s_odd"] = (0.0).hex()
    expect_fail("Part 2 non-positive s_odd", lambda: verify.verify_all(d8))

    # 9. Part 3 slab discontinuity
    d9 = copy.deepcopy(base)
    d9["part3_bulk_4d"].pop(5)
    expect_fail("Part 3 slab discontinuity", lambda: verify.verify_all(d9))

    # 10. Part 3 open_boxes > 0
    d10 = copy.deepcopy(base)
    d10["part3_bulk_4d"][0]["open_boxes"] = 1
    expect_fail("Part 3 open_boxes > 0", lambda: verify.verify_all(d10))

    # 11. Part 3 worst_margin >= 0
    d11 = copy.deepcopy(base)
    d11["part3_bulk_4d"][0]["worst_margin"] = (0.0).hex()
    expect_fail("Part 3 worst_margin >= 0", lambda: verify.verify_all(d11))

    # 12. Part 3 min_odd_piv <= 0
    d12 = copy.deepcopy(base)
    d12["part3_bulk_4d"][0]["min_odd_piv"] = (0.0).hex()
    expect_fail("Part 3 min_odd_piv <= 0", lambda: verify.verify_all(d12))

    # 13. Part 3 inner handoff gap (s_odd_p3 > s_odd_p2)
    d13 = copy.deepcopy(base)
    d13["part3_bulk_4d"][-1]["s_odd"] = (0.5).hex()
    expect_fail("Part 3 inner handoff gap s_odd_p3 > s_odd_p2", lambda: verify.verify_all(d13))

    # 14. Part 3 negative s_odd and negative curvature bound
    d14a = copy.deepcopy(base)
    d14a["part3_bulk_4d"][0]["s_odd"] = (-1.0).hex()
    expect_fail("Part 3 negative s_odd", lambda: verify.verify_all(d14a))
    d14b = copy.deepcopy(base)
    d14b["part3_bulk_4d"][0]["n_up"] = (-1.0).hex()
    expect_fail("Part 3 negative n_up", lambda: verify.verify_all(d14b))

    # 15. Part 3 box breakdown mismatch & zeroed closed_g
    d15a = copy.deepcopy(base)
    d15a["part3_bulk_4d"][0]["closed_ext"] += 1
    expect_fail("Part 3 closed-box sum mismatch", lambda: verify.verify_all(d15a))
    d15b = copy.deepcopy(base)
    d15b["part3_bulk_4d"][0]["closed_g"] = [0, 0, 0]
    d15b["part3_bulk_4d"][0]["total_boxes"] = (
        d15b["part3_bulk_4d"][0]["closed_ext"]
        + d15b["part3_bulk_4d"][0]["closed_ori"]
        + d15b["part3_bulk_4d"][0]["closed_piv"]
    )
    expect_fail("Part 3 zeroed closed_g", lambda: verify.verify_all(d15b))

    # 16. Summary total_4d_boxes tampering
    d16 = copy.deepcopy(base)
    d16["summary"]["total_4d_boxes"] -= 1
    expect_fail("Summary total_4d_boxes mismatch", lambda: verify.verify_all(d16))

    # 16b-16c. Exact Part 3 binary64 rounding-control regressions (codex-a7c4):
    #   (1) First T2 ring after 4.0: inward-rounded naive hT = 0.5*(Th - Tl) (short by 2^-51) rejected!
    d16b = copy.deepcopy(base)
    rc_t2 = d16b["rounding_controls"]["t2_ring24"]
    tl_f = float.fromhex(rc_t2["Tl"])
    th_f = float.fromhex(rc_t2["Th"])
    # Exact binary64 upward-rounded 0.5 * sub_up(Th, Tl) on T2[24..25] has Tm - Tl - hT == 2^-51:
    tm_q = verify.parse_hex(rc_t2["Tm"])
    tl_q = verify.parse_hex(rc_t2["Tl"])
    naive_ht = float(tm_q - tl_q - verify.F(1, 2**51))
    assert tl_f == 4.0 and th_f > 4.0
    rc_t2["hT"] = naive_ht.hex()
    expect_fail("Part 3 T2 ring24 inward-rounded hT (short by 2^-51)", lambda: verify.verify_all(d16b))

    #   (2) Coarse sector 2 of 24: subtracting upward-rounded endpoints gives 1501199875790165/2^55 < 1/24, rejected!
    d16c = copy.deepcopy(base)
    bad_df_hi = float(verify.F(1501199875790165, 2**55))
    d16c["rounding_controls"]["t0_sector2"]["df"][1] = bad_df_hi.hex()
    expect_fail("Part 3 sector 2 of 24 inward-rounded angular width (1501199875790165/2^55 < 1/24)", lambda: verify.verify_all(d16c))

    # 17-19. CLI & live C++ controls
    with tempfile.TemporaryDirectory() as td:
        bad = Path(td) / "bad.json"
        d17 = copy.deepcopy(base)
        d17["cpp_sha256"] = "0" * 64
        bad.write_text(json.dumps(d17), encoding="utf-8")
        r1 = subprocess.run(
            [sys.executable, "-I", str(here / "verify.py"), "--result", str(bad)],
            capture_output=True, text=True,
        )
        assert r1.returncode != 0, "Bad cpp_sha256 unexpectedly passed!"
        print("CONTROL PASS (rejected as expected): CLI bad cpp_sha256")

        r2 = subprocess.run(
            [sys.executable, "-I", "-O", str(here / "verify.py")],
            capture_output=True, text=True,
        )
        assert r2.returncode != 0, "python3 -O unexpectedly passed!"
        print("CONTROL PASS (rejected as expected): CLI -O rejected")

        # 18. Live C++17 hotspot false-target control
        exe = Path(td) / "certify_all_sector"
        subprocess.run(
            [
                "clang++", "-O2", "-ffp-contract=off", "-frounding-math",
                "-std=c++17", "-pthread", "-Wall", "-Wextra", "-Werror",
                str(here / "certify_all_sector.cpp"), "-o", str(exe),
            ],
            check=True,
        )
        r3 = subprocess.run([str(exe), "--control-false-hotspot"], capture_output=True, text=True, check=True)
        assert "CONTROL_ALL_SECTOR dp=" in r3.stdout and "false_odd_piv=-" in r3.stdout
        print(f"CONTROL PASS (live C++ false-target): {r3.stdout.strip()}")

        # 19. C++ -DNDEBUG build rejected at compile time
        r_ndebug = subprocess.run(
            [
                "clang++", "-O2", "-DNDEBUG", "-ffp-contract=off", "-frounding-math",
                "-std=c++17", "-pthread", str(here / "certify_all_sector.cpp"),
                "-o", str(Path(td) / "should_fail"),
            ],
            capture_output=True, text=True,
        )
        assert r_ndebug.returncode != 0, "C++ -DNDEBUG build unexpectedly succeeded!"
        print("CONTROL PASS (rejected as expected): C++ -DNDEBUG compile rejected")

    print("ALL 23 NEGATIVE/CORRUPTION CONTROLS PASSED")


if __name__ == "__main__":
    main()
