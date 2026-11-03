#!/usr/bin/env python3
"""Render the two actual degree-one energyTable targets. Agent-ID: codex-7c2e.

Only the target literals come from JSON. The Lean statements consume the
unchanged energyRows/parseRow/parseEntry/tabVal definitions, and retain every
row and matching entry. No decoder, source bytes or numerical allowance changes.
"""
import argparse
from fractions import Fraction
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'data/upper-preprocess/certificate.json'
OUTPUT = ROOT / 'Grothe/Upper/EnergyDegreeOneLookup.lean'
TEMPLATE = (ROOT / 'tools/templates/energy_degree_one_lookup.lean.in').read_text()


def render():
    values = {}
    for n, m, value in json.loads(SOURCE.read_text())['energies']:
        if (n, m) in {(1, 0), (0, 1)}:
            if (n, m) in values:
                raise ValueError('duplicate degree-one input target')
            q = Fraction(value)
            values[n, m] = f'{q.numerator} / {q.denominator}'
    if values.keys() != {(1, 0), (0, 1)}:
        raise ValueError('missing actual degree-one target')
    return TEMPLATE.replace('@FIRST@', values[1, 0]).replace('@SECOND@', values[0, 1])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    result = render()
    if args.check:
        if not OUTPUT.is_file() or OUTPUT.read_text() != result:
            raise SystemExit('actual degree-one lookup source differs from canonical render')
        print('actual degree-one lookup source is up to date')
    else:
        OUTPUT.write_text(result)
        print(OUTPUT.relative_to(ROOT))


if __name__ == '__main__':
    main()
