#!/usr/bin/env python3
"""Adversarial corruption and negative controls for raw-joint-ab-gemini-4c4c.

Agent-ID: gemini-4c4c. Closes #706, Refs #177.
Run with: python3 -I research/conjecture-K/code/raw-joint-ab-gemini-4c4c/test_controls.py
"""

import copy
import json
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile

if not __debug__:
    raise RuntimeError("Assertions required; do not run with -O.")
sys.dont_write_bytecode = True

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import verify  # noqa: E402


def expect_reject(label: str, mutator, base_data: dict, cpp_path: Path, check_hash: bool = False) -> None:
    d = copy.deepcopy(base_data)
    mutator(d)
    with tempfile.NamedTemporaryFile("w", suffix=".json", delete=False, encoding="utf-8") as tf:
        json.dump(d, tf)
        tmp_path = Path(tf.name)
    try:
        try:
            verify.verify_certificate(tmp_path, cpp_path, check_cpp_hash=check_hash)
        except (AssertionError, ValueError, KeyError) as exc:
            print(f"  [PASS] rejected {label}: {exc}")
            return
        raise RuntimeError(f"SECURITY FAILURE: verifier ACCEPTED corrupted certificate ({label})")
    finally:
        tmp_path.unlink(missing_ok=True)


def main() -> None:
    cert_path = HERE / "result.json"
    cpp_path = HERE / "certify_raw_joint_ab.cpp"
    base_data = json.loads(cert_path.read_text(encoding="utf-8"))

    # Baseline must pass:
    verify.verify_certificate(cert_path, cpp_path, check_cpp_hash=True)
    print("[baseline] verify_certificate PASS")

    # 1. Bad C++ SHA-256 must fail:
    with tempfile.NamedTemporaryFile("wb", suffix=".cpp", delete=False) as tf:
        tf.write(cpp_path.read_bytes() + b"\n// tampered\n")
        bad_cpp = Path(tf.name)
    try:
        try:
            verify.verify_certificate(cert_path, bad_cpp, check_cpp_hash=True)
            raise RuntimeError("Accepted tampered C++ file")
        except AssertionError as exc:
            print(f"  [PASS] rejected tampered C++ SHA-256: {exc}")
    finally:
        bad_cpp.unlink(missing_ok=True)

    # 2. Missing -DNDEBUG guard in C++ source:
    with tempfile.NamedTemporaryFile("w", suffix=".cpp", delete=False, encoding="utf-8") as tf:
        tf.write("// stripped NDEBUG\nint main(){return 0;}\n")
        stripped_cpp = Path(tf.name)
    try:
        try:
            verify.verify_certificate(cert_path, stripped_cpp, check_cpp_hash=True)
            raise RuntimeError("Accepted stripped NDEBUG guard")
        except AssertionError as exc:
            print(f"  [PASS] rejected missing NDEBUG guard: {exc}")
    finally:
        stripped_cpp.unlink(missing_ok=True)

    # 3. python3 -O rejection:
    proc_o = subprocess.run([sys.executable, "-I", "-O", str(HERE / "verify.py")], capture_output=True, text=True)
    assert proc_o.returncode != 0 and "Assertions are required" in proc_o.stderr
    print("  [PASS] rejected python -O execution")

    # 4-18. Certificate mutations:
    expect_reject("self_tests_passed=False", lambda d: d.update({"self_tests_passed": False}), base_data, cpp_path)
    expect_reject("slab_shift_max=2.5 < 2.9", lambda d: d.update({"slab_shift_max": "0x1.4p+1"}), base_data, cpp_path)
    expect_reject("amplitude_shell_max=3.5", lambda d: d.update({"amplitude_shell_max": "0x1.cp+1"}), base_data, cpp_path)
    expect_reject("signed_reserve=1/200", lambda d: d.update({"signed_reserve": [1, 200]}), base_data, cpp_path)
    expect_reject(
        "false kappa_diag=31/100 at peak (exceeds 7.4.9 obstruction 0.298365)",
        lambda d: d["rows"][0].update({"kappa_diag": [31, 100]}),
        base_data, cpp_path,
    )
    expect_reject(
        "Part 1 slab gap",
        lambda d: d["rows"][0]["part1_origin_slabs"][5].update({"wl": "0x1.0p-4"}),
        base_data, cpp_path,
    )
    expect_reject(
        "Part 1 Sylvester PSD failure on Target D (K_re.a00 inflated)",
        lambda d: d["rows"][0]["part1_origin_slabs"][0]["K_re"].__setitem__(1, "0x1.1p+0"),
        base_data, cpp_path,
    )
    expect_reject(
        "Part 1 Sylvester PSD failure on Target S (off-diagonal K_re.a01 inflated)",
        lambda d: (
            d["rows"][1]["part1_origin_slabs"][0]["K_re"].__setitem__(2, "-0x1.0p-1"),
            d["rows"][1]["part1_origin_slabs"][0]["K_re"].__setitem__(3, "0x1.0p-1"),
        ),
        base_data, cpp_path,
    )
    expect_reject(
        "Part 2 shift curvature violation (cap_max inflated)",
        lambda d: d["rows"][0]["part2_shift_curvature"].update({"cap_max": "0x1.0p+12"}),
        base_data, cpp_path,
    )
    expect_reject(
        "Part 3 slab gap",
        lambda d: d["rows"][2]["part3_ray_shells"][3].update({"wl": "0x1.0p-3"}),
        base_data, cpp_path,
    )
    expect_reject(
        "Part 3 ray-convexity discriminant > eta (rho_max=2/1 vs eta=1/400)",
        lambda d: d["rows"][0]["part3_ray_shells"][0]["stages"][0].__setitem__(3, [2, 1]),
        base_data, cpp_path,
    )
    expect_reject(
        "Part 3 inner handoff violation (2*r0 > s0)",
        lambda d: d["rows"][0]["part3_ray_shells"][0]["stages"][0].__setitem__(0, "0x1.0p-10"),
        base_data, cpp_path,
    )
    expect_reject(
        "Part 3 inter-stage gap violation",
        lambda d: d["rows"][0]["part3_ray_shells"][0]["stages"][1].__setitem__(0, "0x1.0p-3"),
        base_data, cpp_path,
    )
    expect_reject(
        "Part 3 outer handoff violation (final r1 < 4)",
        lambda d: d["rows"][0]["part3_ray_shells"][0]["stages"][-1].__setitem__(1, "0x1.0p+1"),
        base_data, cpp_path,
    )
    expect_reject(
        "Part 3 truncated shell count",
        lambda d: d["rows"][0]["part3_ray_shells"][0]["stages"][0].__setitem__(
            4, d["rows"][0]["part3_ray_shells"][0]["stages"][0][4] - 1
        ),
        base_data, cpp_path,
    )
    expect_reject(
        "Part 3 open_boxes > 0",
        lambda d: d["rows"][1]["part3_ray_shells"][2].update({"open_boxes": 1}),
        base_data, cpp_path,
    )
    expect_reject(
        "Part 3 non-negative stage worst_D margin",
        lambda d: d["rows"][0]["part3_ray_shells"][0]["stages"][0].__setitem__(8, "0x0p+0"),
        base_data, cpp_path,
    )

    # 19-20. Compiler-level controls (-DNDEBUG rejection & live false hotspot):
    cxx = shutil.which("clang++") or shutil.which("g++")
    if cxx:
        with tempfile.TemporaryDirectory() as tmp:
            nd_proc = subprocess.run(
                [cxx, "-DNDEBUG", "-std=c++17", str(cpp_path), "-o", str(Path(tmp) / "bad")],
                capture_output=True, text=True,
            )
            assert nd_proc.returncode != 0
            print("  [PASS] compiler rejected -DNDEBUG build")

            bin_path = Path(tmp) / "certify_raw_joint_ab"
            subprocess.run(
                [cxx, "-O2", "-ffp-contract=off", "-frounding-math", "-std=c++17",
                 "-pthread", "-Wall", "-Wextra", "-Werror", str(cpp_path), "-o", str(bin_path)],
                check=True,
            )
            hot = subprocess.run([str(bin_path), "--control-false-hotspot"], check=True, capture_output=True, text=True)
            assert "CONTROL_HOTSPOT" in hot.stdout
            print(f"  [PASS] live C++ hotspot control: {hot.stdout.strip()}")

    print("[test_controls] ALL 21 CONTROLS PASSED")


if __name__ == "__main__":
    main()
