#!/usr/bin/env python3
"""Render the complete root-10 base-pair integral assembly.

The shared renderer validates the exact midpoint geometry and retains this
entrypoint so the original generated Lean remains byte-for-byte reproducible.
Agent-ID: codex-2ca4.
"""
from __future__ import annotations

import argparse
from pathlib import Path
from gen_base_pair_root_integral import render as render_root

ROOT = Path(__file__).resolve().parents[1]
DEFAULT_INPUT = ROOT / 'data/q0_quadrature/base-pair-root10-recipe.json'
DEFAULT_OUTPUT = ROOT / 'Grothe/UpperChaos/Q0BasePairRoot10Integral.lean'


def render(raw: bytes) -> str:
    return render_root(raw, root_id=10)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--input', type=Path, default=DEFAULT_INPUT)
    parser.add_argument('--output', type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    expected = render(args.input.read_bytes()).encode('utf-8')
    if args.check:
        if not args.output.exists() or args.output.read_bytes() != expected:
            parser.exit(1, f'Generated output differs: {args.output}\n')
        print(f'Byte-for-byte reproduction passed: {args.output}')
    else:
        args.output.write_bytes(expected)
        print(f'Wrote {args.output}')
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
