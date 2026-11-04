#!/usr/bin/env python3
"""Reproduce the temporary exact-prefix diagnostic for PR239.

This probe checks direct reflexive encoding of the complete pinned source literal.
It does not prove source_chars or the final decoder theorem.
Remove the probe, this generator and its root exclusion before PR readiness.
Agent-ID: codex-8c4d.
"""
from __future__ import annotations

import argparse
from hashlib import sha256
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'Grothe/UpperChaos/TaylorFirstPackedChunk253Pilot.lean'
OUTPUT = ROOT / 'Grothe/UpperChaos/TaylorFirstPackedChunk253EncodingProbe.lean'
SOURCE_SHA256 = 'b9d19d1a936ab67cb44d1ec36dc8943618094199217c0da99581758d4614cbdd'
PREFIX_SHA256 = 'cb888cbfd4f09c0dbe7c40eebe0511186999246af68a33cdebc09235349dbe37'
PROBE_SHA256 = '96d9ae0bc0b75e2092af601e59b737b062b218b4317d9299b2aab5ad57350fc4'


def generate() -> str:
    source = SOURCE.read_bytes()
    if sha256(source).hexdigest() != SOURCE_SHA256:
        raise ValueError('Diagnostic source differs from the pinned diagnostic baseline')
    prefix, marker, _ = source.decode().partition('theorem source_chars :')
    if not marker or sha256(prefix.encode()).hexdigest() != PREFIX_SHA256:
        raise ValueError('Diagnostic cut is not the exact pinned encoding prefix')
    result = prefix + 'open Lean Elab Command\nrun_cmd do\n  for target in #[``joined000, ``source_lookup, ``source_encoding] do\n    for ax in ← Lean.collectAxioms target do\n      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do\n        throwError m!"{target} has forbidden axiom {ax}"\n\nend Grothe.UpperChaos.TaylorFirstPackedChunk253Pilot\n'
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
            raise SystemExit('Temporary encoding probe is not up to date')
    else:
        OUTPUT.write_text(result)
    print('Direct-reflexivity encoding diagnostic reproduced; no Lean verdict implied.')


if __name__ == '__main__':
    main()
