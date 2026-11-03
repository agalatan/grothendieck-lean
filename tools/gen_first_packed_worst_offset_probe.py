#!/usr/bin/env python3
"""Reproduce the temporary exact-prefix diagnostic for PR239.

This probe checks the first byte and last242-byte slice of the pinned source literal.
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
OUTPUT = ROOT / 'Grothe/UpperChaos/TaylorFirstPackedChunk253WorstOffsetProbe.lean'
SOURCE_SHA256 = 'ef5db459a8e4d085c9632c082381992427bba240882e94daf97cdff7b235d9d8'
PREFIX_SHA256 = '91fbee115471cb3576f4bb4372488a907907165237b8c770438077c2818a5695'
PROBE_SHA256 = '278099a107939e1dd68c5080716ff54a3a95aebc745f3863a511b359e7a52416'


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

private theorem source_last_slice :
    (((sourceLiteral.toByteArray.data.toList.drop 9314).take 242) ==
      ([51, 48, 52, 57, 53, 51, 49, 48, 53, 52, 56, 52, 51, 53, 51, 55, 58, 56, 53, 44, 56, 56, 54, 49, 50, 50, 52, 50, 48, 54, 52, 49, 52, 51, 50, 55, 58, 56, 55, 44, 54, 55, 55, 57, 48, 54, 51, 56, 51, 55, 56, 54, 52, 51, 48, 53, 58, 56, 55, 44, 52, 56, 52, 56, 56, 54, 52, 52, 50, 48, 56, 55, 53, 53, 49, 51, 58, 56, 55, 44, 53, 49, 49, 51, 53, 51, 52, 50, 52, 54, 57, 49, 53, 50, 55, 49, 58, 56, 56, 44, 49, 54, 55, 50, 55, 56, 52, 53, 51, 55, 50, 50, 53, 51, 55, 49, 58, 56, 56, 44, 50, 51, 52, 48, 51, 54, 48, 54, 52, 55, 54, 57, 52, 51, 56, 55, 58, 57, 50, 44, 45, 49, 50, 52, 48, 57, 51, 52, 50, 48, 53, 54, 48, 49, 55, 50, 49, 58, 57, 49, 44, 45, 55, 51, 48, 50, 51, 56, 49, 55, 50, 53, 49, 57, 55, 56, 57, 57, 58, 57, 53, 44, 51, 50, 56, 56, 50, 52, 54, 48, 55, 54, 49, 57, 55, 49, 50, 49, 58, 57, 57, 44, 54, 52, 56, 54, 54, 49, 53, 56, 53, 48, 54, 53, 53, 56, 50, 57, 58, 57, 55, 44, 45, 49, 54, 56, 56, 49, 55, 52, 48, 55, 57, 57, 52, 49, 48, 48, 51, 58, 57, 52] : List UInt8)) = true := by
  decide +kernel

open Lean Elab Command
run_cmd do
  for target in #[``joined000, ``source_lookup, ``source_first_byte, ``source_last_slice] do
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
            raise SystemExit('Temporary worst-offset probe is not up to date')
    else:
        OUTPUT.write_text(result)
    print('Worst-offset diagnostic reproduced; no Lean verdict implied.')


if __name__ == '__main__':
    main()
