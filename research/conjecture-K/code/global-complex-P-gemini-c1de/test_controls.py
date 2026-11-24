#!/usr/bin/env python3
"""Negative and corruption control suite for Global 4D Complex Premise (P) (#431).

Agent-ID: gemini-c1de. Refs #431.
Verifies 13 independent rejection controls:
  1. Part 1 gap between amplitude exterior and shift exterior rejected.
  2. Part 1 potential matrix diagonal inflation breaking S_r >= 3/4 PSD rejected.
  3. Part 1 shift exterior matrix inflation breaking w >= 11/8 PSD rejected.
  4. Part 2 origin slab gap rejected.
  5. Part 2 origin matrix inflation breaking PSD rejected.
  6. Part 3 shift curvature cap/mass exceeding 480^2/16 rejected.
  7. Part 4 3D ray shell ratio exceeding rho_max rejected.
  8. Part 4 ray-convexity discriminant ((rho-1)/(rho+1))^2 > eta rejected.
  9. Part 4 inner handoff gap (2*r_0 > s_0(w)) rejected.
 10. Part 5 4D bulk open_boxes > 0 or non-negative worst_margin rejected.
 11. Part 5 inner handoff gap (s_bulk > s_0(w)) rejected.
 12. CLI bad cpp_sha256 rejected AND CLI `-O` rejected.
 13. Live C++17 hotspot false-target control (`certify_global_P --control-false-hotspot`).
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

    # 3. Part 1 shift exterior PSD failure
    d3 = copy.deepcopy(base)
    for s in d3["part1_potential_slabs"]:
        if s["shift_ext"]:
            s["P_im"]["a11"][1] = (50.0).hex()
            break
    expect_fail("Part 1 shift exterior PSD failure", lambda: verify.verify_all(d3))

    # 4. Part 2 origin slab discontinuity
    d4 = copy.deepcopy(base)
    d4["part2_origin_slabs"].pop(10)
    expect_fail("Part 2 missing origin slab", lambda: verify.verify_all(d4))

    # 5. Part 2 origin matrix PSD failure
    d5 = copy.deepcopy(base)
    d5["part2_origin_slabs"][0]["K_re"]["a00"][1] = (5.0).hex()
    expect_fail("Part 2 origin PSD failure", lambda: verify.verify_all(d5))

    # 6. Part 3 shift curvature constant violated
    d6 = copy.deepcopy(base)
    d6["part3_shift_curvature"]["cap_max"] = (110.0).hex()
    expect_fail("Part 3 shift curvature cap >= 100", lambda: verify.verify_all(d6))

    # 7. Part 4 adjacent shell ratio > rho_max
    d7 = copy.deepcopy(base)
    d7["part4_ray_shells"][0]["radii"].pop(1)
    expect_fail("Part 4 shell ratio > rho_max", lambda: verify.verify_all(d7))

    # 8. Part 4 ray-convexity discriminant ((rho-1)/(rho+1))^2 > eta
    d8 = copy.deepcopy(base)
    d8["part4_ray_shells"][0]["eta"] = [1, 100]  # 1/100 < 1/81 for rho=5/4!
    expect_fail("Part 4 discriminant ((rho-1)/(rho+1))^2 > eta", lambda: verify.verify_all(d8))

    # 9. Part 4 inner handoff gap (2 * r_0 > s_0)
    d9 = copy.deepcopy(base)
    d9["part4_ray_shells"][0]["radii"][0] = (1.0 / 256.0).hex()  # 2*r_0 = 1/128 > s_0 = 1/512!
    expect_fail("Part 4 inner handoff gap", lambda: verify.verify_all(d9))

    # 10. Part 5 open_boxes > 0 and non-negative worst_margin
    d10a = copy.deepcopy(base)
    d10a["part5_bulk_4d"][0]["open_boxes"] = 1
    expect_fail("Part 5 open_boxes > 0", lambda: verify.verify_all(d10a))
    d10b = copy.deepcopy(base)
    d10b["part5_bulk_4d"][0]["worst_margin"] = (0.0).hex()
    expect_fail("Part 5 worst_margin >= 0", lambda: verify.verify_all(d10b))

    # 11. Part 5 inner handoff gap (s_bulk > s_0 on [5/16, 11/8])
    d11 = copy.deepcopy(base)
    d11["part5_bulk_4d"][-1]["s_bulk"] = (0.5).hex()  # > s_0 = 1/4!
    expect_fail("Part 5 inner handoff gap", lambda: verify.verify_all(d11))

    # 12. CLI bad cpp_sha256 and -O flag
    with tempfile.TemporaryDirectory() as td:
        bad = Path(td) / "bad.json"
        d12 = copy.deepcopy(base)
        d12["cpp_sha256"] = "0" * 64
        bad.write_text(json.dumps(d12), encoding="utf-8")
        r1 = subprocess.run([sys.executable, "-I", str(here / "verify.py"), "--result", str(bad)],
                            capture_output=True, text=True)
        assert r1.returncode != 0, "Bad cpp_sha256 unexpectedly passed!"
        print("CONTROL PASS (rejected as expected): CLI bad cpp_sha256")
        r2 = subprocess.run([sys.executable, "-I", "-O", str(here / "verify.py")],
                            capture_output=True, text=True)
        assert r2.returncode != 0, "python3 -O unexpectedly passed!"
        print("CONTROL PASS (rejected as expected): CLI -O rejected")

        # 13. Live C++17 hotspot false-target control
        exe = Path(td) / "certify_global_P"
        subprocess.run(
            [
                "clang++", "-O2", "-ffp-contract=off", "-frounding-math",
                "-std=c++17", "-pthread", "-Wall", "-Wextra", "-Werror",
                str(here / "certify_global_P.cpp"), "-o", str(exe),
            ],
            check=True,
        )
        r3 = subprocess.run([str(exe), "--control-false-hotspot"], capture_output=True, text=True, check=True)
        assert "CONTROL_HOTSPOT diff=" in r3.stdout
        print(f"CONTROL PASS (live C++ hotspot false-target): {r3.stdout.strip()}")

    print("ALL 13 NEGATIVE/CORRUPTION CONTROLS PASSED")


if __name__ == "__main__":
    main()
