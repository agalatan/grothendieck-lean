#!/usr/bin/env python3
"""Reproduce the temporary exact-prefix diagnostic for PR239.

This probe ends at the original public source-string equality. It does not prove
the character-list identity or the final public decoder theorem.
Remove the probe, this generator and its root exclusion before PR readiness.
Agent-ID: codex-8c4d.
"""
from __future__ import annotations

import argparse
from hashlib import sha256
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'Grothe/UpperChaos/TaylorFirstPackedChunk253Pilot.lean'
OUTPUT = ROOT / 'Grothe/UpperChaos/TaylorFirstPackedChunk253SourceProbe.lean'
SOURCE_SHA256 = 'dbbbac2a52921c221255bd81bbcabe7c5cdb4c1746b5bbf1d1649d57e070441f'
PREFIX_SHA256 = '07e4f0f506a7701f00fcdf1cbfad0dad2db7c2a8779b996467f84b8ad826dcd6'
PROBE_SHA256 = 'ebbc9677acdc3d8f0e1967b84934c0f56750438c700942b8ec3d77deb06b4a5b'


def generate() -> str:
    source = SOURCE.read_bytes()
    if sha256(source).hexdigest() != SOURCE_SHA256:
        raise ValueError('Diagnostic source differs from the pinned diagnostic baseline')
    prefix, marker, _ = source.decode().partition('private theorem comma_chars')
    if not marker or sha256(prefix.encode()).hexdigest() != PREFIX_SHA256:
        raise ValueError('Diagnostic cut is not the exact pinned source-string prefix')
    result = prefix + '''open Lean Elab Command
run_cmd do
  for target in #[``joined000, ``source_string] do
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
            raise SystemExit('Temporary source-string probe is not up to date')
    else:
        OUTPUT.write_text(result)
    print('Exact source-string prefix reproduced; no Lean verdict implied.')


if __name__ == '__main__':
    main()
