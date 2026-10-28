#!/usr/bin/env python3
"""Render/check untrusted q0 polynomial data. Agent-ID: codex-8c4d."""
import argparse
import json
from pathlib import Path

HEADER = """import GrotheKernel.PhiCheck

/-!
# Literal q0 source polynomial exported by Q0RectangleProbe

This is untrusted data from the recorded q0 probe; a separate Lean theorem
must connect it to the source-derived polynomial and denominator.
Coordinates are outer `s`, middle inverse rate, inner shifted argument.
No numerical enclosure is asserted. Agent-ID: codex-8c4d.
-/

namespace Grothe.UpperChaos.Q0LiteralSourceData

"""


def render(data):
    den = data['sourceDen']
    rows = data['sourceCoefficients']
    if type(den) is not int or den <= 0:
        raise ValueError('sourceDen must be a positive JSON integer')
    if not isinstance(rows, list) or any(not isinstance(p, list) or
        any(not isinstance(r, list) or any(type(v) is not int for v in r)
            for r in p) for p in rows):
        raise ValueError('sourceCoefficients must be a nested integer array')
    encoded = ',\n'.join('  ' + json.dumps(p, separators=(',', ':')) for p in rows)
    return (HEADER + f'def sourceDen : Nat := {den}\n\n' +
            'set_option maxRecDepth 65536 in\n' +
            'def sourceCoefficients : List (List (List Int)) := [\n' + encoded +
            '\n]\n\nend Grothe.UpperChaos.Q0LiteralSourceData\n').encode()


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--root', type=Path, default=Path(__file__).resolve().parents[1])
    p.add_argument('--source-json', type=Path, default=Path('data/q0-source-binding/source-polynomial.json'))
    p.add_argument('--check', action='store_true')
    a = p.parse_args()
    source_json = a.source_json if a.source_json.is_absolute() else a.root / a.source_json
    expected = render(json.loads(source_json.read_text()))
    target = a.root / 'Grothe/UpperChaos/Q0LiteralSourceData.lean'
    if a.check:
        if not target.is_file() or target.read_bytes() != expected:
            raise SystemExit(f'missing or changed: {target}')
        print(f'verified {target}')
    else:
        target.write_bytes(expected)


if __name__ == '__main__':
    main()
