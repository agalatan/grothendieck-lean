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
SOURCE_SHA256 = 'dbbbac2a52921c221255bd81bbcabe7c5cdb4c1746b5bbf1d1649d57e070441f'
PREFIX_SHA256 = '1aac1e166cfa461ee0e3a9ea6ac65b7a169fb3cb79d47ca6f93fcfacf7133e4d'
PROBE_SHA256 = '1db7cc6474162a56324e974e63ffdbae3d8d909280515429cfae0dcd3072dc54'


def generate() -> str:
    source = SOURCE.read_bytes()
    if sha256(source).hexdigest() != SOURCE_SHA256:
        raise ValueError('Diagnostic source differs from the pinned diagnostic baseline')
    prefix, marker, _ = source.decode().partition('def values : List ℤ := values000')
    if not marker or sha256(prefix.encode()).hexdigest() != PREFIX_SHA256:
        raise ValueError('Diagnostic cut is not the exact pinned numeric-join prefix')
    result = prefix + '''open Lean Elab Command
run_cmd do
  for ax in ← Lean.collectAxioms ``joined000 do
    unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
      throwError m!"joined000 has forbidden axiom {ax}"

end Grothe.UpperChaos.TaylorFirstPackedChunk253Pilot
'''
    if sha256(result.encode()).hexdigest() != PROBE_SHA256:
        raise ValueError('Diagnostic output differs from the pinned candidate')
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
