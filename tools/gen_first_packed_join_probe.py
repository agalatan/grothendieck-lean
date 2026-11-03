#!/usr/bin/env python3
"""Reproduce the temporary exact-prefix diagnostic for PR239.

This probe ends at the numeric join and does not prove the public source binding.
Remove the probe, this generator and its root exclusion before PR readiness.
Agent-ID: codex-8c4d.
"""
from __future__ import annotations

import argparse
from hashlib import sha256
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'Grothe/UpperChaos/TaylorFirstPackedChunk253Pilot.lean'
OUTPUT = ROOT / 'Grothe/UpperChaos/TaylorFirstPackedChunk253JoinProbe.lean'
SOURCE_SHA256 = '4ceacd1b66e647cbfc75b4f7518eb773d7002ceba2e25f378126dba410cf2f99'
PREFIX_SHA256 = 'caf754b428d0cd57d49d36e572aa6078a45c7f292a3f1af2df8d45fa0706d034'
PROBE_SHA256 = '975d02cec2d8395d9116b2687a989b98365e8f17396de5166ac8da90f17aefde'


def generate() -> str:
    source = SOURCE.read_bytes()
    if sha256(source).hexdigest() != SOURCE_SHA256:
        raise ValueError('Diagnostic source differs from the reviewed 762ae baseline')
    prefix, marker, _ = source.decode().partition('def values : List ℤ := values000')
    if not marker or sha256(prefix.encode()).hexdigest() != PREFIX_SHA256:
        raise ValueError('Diagnostic cut is not the exact reviewed numeric-join prefix')
    result = prefix + '''open Lean Elab Command
run_cmd do
  for ax in ← Lean.collectAxioms ``joined000 do
    unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
      throwError m!"joined000 has forbidden axiom {ax}"

end Grothe.UpperChaos.TaylorFirstPackedChunk253Pilot
'''
    if sha256(result.encode()).hexdigest() != PROBE_SHA256:
        raise ValueError('Diagnostic output differs from the reviewed candidate')
    return result


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    result = generate()
    if args.check:
        if not OUTPUT.exists() or OUTPUT.read_bytes() != result.encode():
            raise SystemExit('Temporary numeric-join probe is not up to date')
    else:
        OUTPUT.write_text(result)
    print('Exact numeric-join prefix reproduced; no Lean or public-source verdict implied.')


if __name__ == '__main__':
    main()
