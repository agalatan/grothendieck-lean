#!/usr/bin/env python3
"""Rebuild unweighted head table-mass chunk checks; Agent-ID: codex-aa04.

Standard library only. All values are exact binary dyadics parsed directly
from the committed Lean table strings. The generated caps do not certify any
Gaussian approximation or assert that Lean has checked the resulting proof.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import re
from fractions import Fraction
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent
SOURCE = ROOT / 'Grothe/Upper/Data.lean'
TEMPLATE = ROOT / 'data/upper-head-table-mass/template.lean'
LEAN = ROOT / 'Grothe/Upper/HeadTableMass.lean'
RECEIPT = ROOT / 'data/upper-head-table-mass/caps.json'
CHUNK = 8
SCALE = 10**9


def sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def generate() -> tuple[bytes, bytes]:
    source = SOURCE.read_bytes()
    text = source.decode('utf-8')
    start = text.index('def energyStrs : List String :=')
    end = text.index('def energyRows : List RowQ :=', start)
    block = text[start:end]
    rowstrings = re.findall(r'"([^"\n]+)"', block)
    if len(rowstrings) != 168:
        raise ValueError(f'expected 168 rows, found {len(rowstrings)}')
    masses: list[Fraction] = []
    count = 0
    seen: set[tuple[int, int]] = set()
    for expected_m, raw in enumerate(rowstrings):
        m_text, sep, entries = raw.partition(':')
        if not sep or int(m_text) != expected_m:
            raise ValueError('row ordering/index mismatch')
        mass = Fraction(0)
        for item in entries.split(';'):
            n, mantissa, exponent = map(int, item.split(','))
            if n < 0 or mantissa <= 0 or exponent < 0 or n + 3 * expected_m > 501:
                raise ValueError('invalid or out-of-head entry')
            if (n, expected_m) in seen:
                raise ValueError('duplicate entry')
            seen.add((n, expected_m))
            mass += Fraction(mantissa, 1 << exponent)
            count += 1
        masses.append(mass)
    if count != 21168:
        raise ValueError(f'expected 21168 entries, got {count}')
    caps = []
    for start_row in range(0, len(masses), CHUNK):
        scaled = sum(masses[start_row:start_row + CHUNK], Fraction(0)) * SCALE
        caps.append(-(-scaled.numerator // scaled.denominator))
    if len(caps) != 21:
        raise ValueError('template requires 21 chunks')
    if Fraction(sum(caps), SCALE) + Fraction(3, 20000000) > 1:
        raise ValueError('chunk caps exceed requested budget')
    checks = ''
    for i, cap in enumerate(caps):
        # Row strings contain only ASCII digits and separators, verified above.
        # Prove they are exactly the selected rows of the tracked Lean data.
        rows = ',\n    '.join(json.dumps(r, ensure_ascii=True) for r in rowstrings[CHUNK*i:CHUNK*(i+1)])
        checks += (
            f'lemma rowMass_chunk_{i:02} : ((headRowMasses.drop {CHUNK*i}).take {CHUNK}).sum ≤ ({cap} / {SCALE} : ℚ) := by\n'
            f'  have hrows : ((energyStrs.drop {CHUNK*i}).take {CHUNK}) = [\n    {rows}] := by rfl\n'
            f'  unfold headRowMasses\n'
            f'  rw [← List.map_drop, ← List.map_take, hrows]\n'
            f'  decide_cbv\n\n'
        )
    template = TEMPLATE.read_text(encoding='utf-8')
    if template.count('{{chunk_checks}}') != 1:
        raise ValueError('template must contain one chunk marker')
    lean = template.replace('{{chunk_checks}}', checks).encode('utf-8')
    total = sum(masses, Fraction(0))
    receipt = dict(agent_id='codex-aa04', source='Grothe/Upper/Data.lean',
                   source_sha256=sha(source), energy_strings_block_sha256=sha(block.encode('utf-8')),
                   template_sha256=sha(TEMPLATE.read_bytes()), lean_sha256=sha(lean),
                   rows=len(masses), entries=count, chunk_size=CHUNK, cap_denominator=SCALE,
                   cap_numerators=caps, cap_numerators_sum=sum(caps),
                   exact_table_sum=str(total), discrepancy=str(Fraction(3,20000000)),
                   scope='Exact arithmetic and provenance only; Lean acceptance and analytic approximation are not asserted.')
    return lean, (json.dumps(receipt, indent=2, sort_keys=True) + '\n').encode('utf-8')


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument('--check', action='store_true', help='fail if generated outputs are stale')
    args = parser.parse_args()
    lean, receipt = generate()
    outputs = ((LEAN, lean), (RECEIPT, receipt))
    for path, payload in outputs:
        if args.check:
            if not path.is_file() or path.read_bytes() != payload:
                raise SystemExit(f'stale or missing generated output: {path}')
        else:
            path.write_bytes(payload)
    print('PASS exact source-to-chunk regeneration' if args.check else 'Wrote Lean draft and exact arithmetic receipt')


if __name__ == '__main__':
    main()
