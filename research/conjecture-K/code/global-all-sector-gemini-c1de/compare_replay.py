"""Compare the KGAS Linux replay with the published receipt. Agent-ID: codex-a7c4."""
import argparse
import hashlib
import json
import re
import subprocess
import sys
import tempfile
from fractions import Fraction
from pathlib import Path

HERE = Path(__file__).resolve().parent
PUBLISHED = "fe5e948a3090d64692064575268289490f7f89d3ab0747ee27dfc09dff1bdcbb"
LINUX = "6a14ef823cd34e2153d433851bf713666823541a4f8f476976fa0d99eeb50407"
PRODUCER = "2186d7971f9693cc2440fe794eab29ffb80a0ca3b775f916583cb903eab0705c"
VERIFIER = "fc9af6813e2bf7430989ff1bce18aa6db27f287b2997fd8c874ec3ddf1f92e17"

# List indices are normalized to [] in the measurement whitelist. Every other
# path, including domains, cutoffs, subdivisions, counts and flags, is fixed.
MEASUREMENT = re.compile(
    r"part1_potential_slabs\[\]\.(?:even_margin|odd_margin|O_iso\[\]\[\]"
    r"|P_(?:re|im)\.a(?:00|01|11)\[\])"
    r"|part2_origin_strip\[\]\.(?:margin|M_(?:re|im)\[\]\[\])"
    r"|part3_bulk_4d\[\]\.(?:worst_margin|min_odd_piv|[ab]2_up|n_up)"
    r"|summary\.(?:worst_margin|min_odd_piv)"
)
HEX = re.compile(r"(-?)0x([0-9a-f]+)(?:\.([0-9a-f]+))?p([+-]\d+)")


def require(condition, message):
    if not condition:
        raise ValueError(message)


def sha(data):
    return hashlib.sha256(data).hexdigest()


def dyadic(s):
    match = HEX.fullmatch(s) if isinstance(s, str) else None
    require(match is not None, "expected an exact hexadecimal measurement")
    sign, integer, fraction, exponent = match.groups()
    fraction = fraction or ""
    n = int(integer + fraction, 16)
    return Fraction(-n if sign else n, 16 ** len(fraction)) * Fraction(2) ** int(exponent)


def is_measurement(path):
    return MEASUREMENT.fullmatch(re.sub(r"\[\d+\]", "[]", path)) is not None


def restore(value, edits, path=""):
    if isinstance(value, dict):
        return {k: restore(v, edits, f"{path}.{k}" if path else k) for k, v in value.items()}
    if isinstance(value, list):
        return [restore(v, edits, f"{path}[{i}]") for i, v in enumerate(value)]
    if not is_measurement(path):
        return value
    edit = next(edits, None)
    require(edit is not None, f"truncated delta at {path}")
    if edit == ".":
        return value
    # Keep the specified prefix of the C++ hexadecimal mantissa and its original
    # binary exponent. This lossless textual patch uses no floating arithmetic.
    keep, suffix = edit.split(":")
    mantissa, exponent = value.split("p")
    require(keep.isdecimal() and int(keep) <= len(mantissa), f"bad edit at {path}")
    result = f"{mantissa[:int(keep)]}{suffix}p{exponent}"
    dyadic(result)
    return result


def compare(left, right):
    differences = []
    stack = [("", left, right)]
    scalars = 0
    while stack:
        path, old, new = stack.pop()
        require(type(old) is type(new), f"changed JSON type at {path}")
        if isinstance(old, dict):
            require(old.keys() == new.keys(), f"changed object keys at {path}")
            stack.extend((f"{path}.{k}" if path else k, old[k], new[k]) for k in old)
        elif isinstance(old, list):
            require(len(old) == len(new), f"changed list length at {path}")
            stack.extend((f"{path}[{i}]", a, b) for i, (a, b) in enumerate(zip(old, new)))
        else:
            scalars += 1
            if old == new:
                continue
            require(is_measurement(path), f"changed fixed field at {path}")
            a, b = dyadic(old), dyadic(new)
            require((a > 0) - (a < 0) == (b > 0) - (b < 0), f"changed sign at {path}")
            differences.append((abs(a - b), path))
    return scalars, differences


def controls():
    original = {"part3_bulk_4d": [{"min_odd_piv": "0x1p-2", "wl": "0x0p+0"}]}
    for changed, failure in (
        ({"min_odd_piv": "-0x1p-2", "wl": "0x0p+0"}, "changed sign"),
        ({"min_odd_piv": "0x1p-2", "wl": "0x1p-8"}, "changed fixed field"),
        ({"min_odd_piv": "0x1p-2"}, "changed object keys"),
        ({"min_odd_piv": 1, "wl": "0x0p+0"}, "changed JSON type"),
    ):
        try:
            compare(original, {"part3_bulk_4d": [changed]})
        except ValueError as error:
            require(str(error).startswith(failure), "wrong control failure")
        else:
            raise ValueError(f"accepted control for {failure}")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--linux", type=Path, help="also match a downloaded uncompressed receipt")
    parser.add_argument("--source-dir", type=Path, default=HERE,
                        help="directory containing result.json, the C++ source and verify.py")
    args = parser.parse_args()
    published = args.source_dir / "result.json"
    verifier = args.source_dir / "verify.py"
    raw = published.read_bytes()
    require(sha(raw) == PUBLISHED, "published receipt digest")
    require(sha(verifier.read_bytes()) == VERIFIER, "verifier digest")
    require(sha((args.source_dir / "certify_all_sector.cpp").read_bytes()) == PRODUCER, "producer digest")
    baseline = json.loads(raw)
    edits = iter((HERE / "linux-full-replay.delta").read_text(encoding="ascii").split())
    linux = restore(baseline, edits)
    require(next(edits, None) is None, "extra delta entries")
    payload = (json.dumps(linux, separators=(",", ":")) + "\n").encode("ascii")
    require(sha(payload) == LINUX, "independent Linux receipt digest")
    if args.linux:
        require(args.linux.read_bytes() == payload, "downloaded receipt differs from recovered bytes")
    with tempfile.TemporaryDirectory() as tmp:
        fresh = Path(tmp) / "linux.json"
        fresh.write_bytes(payload)
        for receipt in (published, fresh):
            subprocess.run([sys.executable, "-IB", str(verifier), "--result", str(receipt)], check=True)
    controls()
    scalars, changes = compare(baseline, linux)
    require((scalars, len(changes)) == (21457, 14410), "field counts")
    largest = max(changes)
    require(largest == (Fraction(751, 2**54), "part3_bulk_4d[57].min_odd_piv"), "largest difference")
    print(f"{scalars} scalar fields, {len(changes)} changed measurements, zero sign changes")
    print(f"Largest absolute difference {largest[0]} at {largest[1]}")
    print("Rejected sign, geometry, missing-key and changed-type controls.")


if __name__ == "__main__":
    main()
