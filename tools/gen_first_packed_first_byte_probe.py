#!/usr/bin/env python3
"""Reproduce the temporary exact-prefix diagnostic for PR239.

This probe checks only the first byte of the original pinned source literal.
It does not prove a full byte slice, concatenation or the final decoder theorem.
Remove the probe, this generator and its root exclusion before PR readiness.
Agent-ID: codex-8c4d.
"""
from __future__ import annotations

import argparse
from hashlib import sha256
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'Grothe/UpperChaos/TaylorFirstPackedChunk253Pilot.lean'
OUTPUT = ROOT / 'Grothe/UpperChaos/TaylorFirstPackedChunk253FirstByteProbe.lean'
SOURCE_SHA256 = 'ef5db459a8e4d085c9632c082381992427bba240882e94daf97cdff7b235d9d8'
PREFIX_SHA256 = '91fbee115471cb3576f4bb4372488a907907165237b8c770438077c2818a5695'
PROBE_SHA256 = '48eccdf3d983c7d0f3a1b658b3f82df730ea45146952eda7fb79da6b79670348'


def generate() -> str:
    source = SOURCE.read_bytes()
    if sha256(source).hexdigest() != SOURCE_SHA256:
        raise ValueError('Diagnostic source differs from the pinned diagnostic baseline')
    prefix, marker, _ = source.decode().partition('private theorem source_concat')
    if not marker or sha256(prefix.encode()).hexdigest() != PREFIX_SHA256:
        raise ValueError('Diagnostic cut is not the exact pinned lookup prefix')
    result = prefix + '''private theorem source_first_byte :
    ((sourceLiteral.toByteArray.data.toList.take 1) == ([50] : List UInt8)) = true := by
  decide +kernel

open Lean Elab Command
run_cmd do
  for target in #[``joined000, ``source_lookup, ``source_first_byte] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"

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
            raise SystemExit('Temporary first-byte probe is not up to date')
    else:
        OUTPUT.write_text(result)
    print('First-byte diagnostic reproduced; no Lean verdict implied.')


if __name__ == '__main__':
    main()
