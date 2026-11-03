#!/usr/bin/env python3
"""Replay the complete root 6 direct-cell family. Agent-ID: codex-aa04.

This is the same shared-profile and serialized-leaf renderer as root 10.
Every stored model is checked against the pinned candidate before emission.
"""
import argparse
import json
from pathlib import Path

import gen_base_pair_root10 as shared

ROOT = Path(__file__).resolve().parents[2]
DATA = ROOT / 'data/q0_quadrature'
RECIPE = DATA / 'base-pair-root6-recipe.json'
TRACE = DATA / 'base-pair-root6-trace.json'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--discover', action='store_true')
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    recipe = json.loads(RECIPE.read_bytes())
    if args.discover:
        raw = shared.discover(recipe)
        if args.check:
            if TRACE.read_text() != raw:
                raise SystemExit('root 6 trace is not reproducible')
        else:
            TRACE.write_text(raw)
    for name, text in shared.generate(TRACE.read_bytes(), recipe).items():
        name = name.replace('Q0BasePairRoot10', 'Q0BasePairRoot6')
        text = (text.replace('Q0BasePairRoot10', 'Q0BasePairRoot6')
                    .replace('retained root 10', 'retained root 6')
                    .replace('All twelve actual cell integrals of root 10',
                             'All fifteen actual cell integrals of root 6')
                    .replace('Root 10 integral audit', 'Root 6 integral audit')
                    .replace('gen_base_pair_root10.py', 'gen_base_pair_root6.py'))
        path = ROOT / 'Grothe/UpperChaos' / name
        if args.check:
            if not path.exists() or path.read_text() != text:
                raise SystemExit(f'{path} differs from generated root 6')
        else:
            path.write_text(text)


if __name__ == '__main__':
    main()
