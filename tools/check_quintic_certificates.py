#!/usr/bin/env python3
"""Exercise the real independent verifier, including directed-bound failures."""

from copy import deepcopy
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import subprocess
import sys
import tempfile


HERE = Path(__file__).resolve().parent
VERIFIER = HERE / "verify_quintic_coefficient.py"
CERTIFICATE = HERE / "quintic_sign.json"
spec = importlib.util.spec_from_file_location("quintic_independent_verifier", VERIFIER)
verifier = importlib.util.module_from_spec(spec)
spec.loader.exec_module(verifier)


def run():
    data = json.loads(CERTIFICATE.read_text())
    baseline = verifier.verify(deepcopy(data))
    if baseline["status"] != "PASS" or len(baseline["profiles"]) != 2:
        raise AssertionError("Unmodified two-profile certificate must pass")
    controls = []

    def reject(name, changed, exception, message):
        try:
            verifier.verify(changed)
        except exception as error:
            if message not in str(error):
                raise AssertionError(f"{name}: unexpected failure: {error}") from error
            controls.append({"name": name, "status": "REJECTED",
                             "exception": type(error).__name__, "reason": str(error)})
        else:
            raise AssertionError(f"{name}: invalid certificate accepted")

    for name, field, value, reason in [
        ("false strict lower bound", "coefficient_lower", "-1/1000", "lower bound failed"),
        ("false strict upper bound", "coefficient_upper", "-1/100", "upper bound failed"),
    ]:
        changed = deepcopy(data)
        changed[field] = value
        reject(name, changed, ArithmeticError, reason)

    for value in ["0", "-1/10"]:
        changed = deepcopy(data)
        changed["profiles"][0]["b"] = value
        reject(f"nonpositive b={value}", changed, ValueError, "Positive rational b required")

    for value in ["0", "-1"]:
        changed = deepcopy(data)
        changed["m"] = value
        reject(f"nonpositive m={value}", changed, ValueError, "Positive integer m required")

    for value in ["01", True, 1.5]:
        changed = deepcopy(data)
        changed["m"] = value
        reject(f"noncanonical integer m={value!r}", changed, ValueError, "Integer m required")

    for value in [95, "128", 128.0, True]:
        changed = deepcopy(data)
        changed["precision_bits"] = value
        reject(f"invalid precision_bits={value!r}", changed, ValueError, "At least 96 bits required")

    changed = deepcopy(data)
    changed['profiles'] = []
    reject('empty response bank', changed, ValueError, 'At least one actual profile is required')

    bank_data = json.loads((HERE/'quintic_bank.json').read_text())
    bank_controls = []
    mutations = [
        ('too-small finite dimension', lambda d: d.update(finite_m='1'), 'm>=2'),
        ('wrong first response kind', lambda d: d['profiles'].reverse(), 'bank must start'),
        ('incomplete cancellation triangle', lambda d: d['profiles'].pop(), 'bank must start'),
        ('nonpositive norm floor', lambda d: d.update(requested_floor='0'), 'positive requested floor'),
        ('false common support floor', lambda d: d.update(requested_floor='1'), 'support payoff failed'),
    ]
    with tempfile.TemporaryDirectory(prefix='quintic-certificate-controls-') as tmp:
        for name, mutate, expected in mutations:
            changed = deepcopy(bank_data)
            mutate(changed)
            input_path, out_path = Path(tmp)/'input.json', Path(tmp)/'out.json'
            input_path.write_text(json.dumps(changed))
            result = subprocess.run([sys.executable, '-I', str(HERE/'verify_quintic_bank.py'),
                                     str(input_path), '--out', str(out_path)],
                                    capture_output=True, text=True)
            if result.returncode == 0 or expected not in result.stderr:
                raise AssertionError('Invalid bank certificate was not rejected: '+name)
            bank_controls.append({'name': name, 'status': 'REJECTED'})

    return {
        "status": "PASS", "baseline_profiles": len(baseline["profiles"]),
        "controls_rejected": len(controls), "controls": controls,
        "bank_controls_rejected": len(bank_controls), "bank_controls": bank_controls,
        "verifier_sha256": hashlib.sha256(VERIFIER.read_bytes()).hexdigest(),
        "certificate_sha256": hashlib.sha256(CERTIFICATE.read_bytes()).hexdigest(),
        "scope": "Actual verifier calls; false lower/upper bounds recompute the Arb integrals.",
    }


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--out', type=Path)
    args = parser.parse_args()
    result = run()
    output = json.dumps(result, indent=2) + "\n"
    if args.out:
        args.out.write_text(output)
    print(output, end="")
