#!/usr/bin/env python3
"""Generate the 17 exact binary64 exceptional-row check modules.

The source table has 21,577 node rows. Row i contains binary64 approximations
of conditional Hermite coefficients for canonical pairs 0 <= c <= 266,
0 <= d <= 265, c <= d + 1, c + d <= 531, in (c + d, c) order, restricted
to c + d <= cutoff_i. A full row has 35,777 entries; cutoffs 1 and 2 give
three and five entries. The source producer builds all rows.

This certificate selects all nodes in each panel hit by the outward 128-bit
profile interval Horner screen's zero-containing result. The exact inputs
and rule are committed in exception-selection.json. Its 413 unresolved nodes
occupy 381 panels; panel closure gives the 417 rows, independently of cutoff.
Pinned byte slices, offsets and ledger records supply their literal values.
Lean checks decoding and finite bounds; Gaussian source binding is separate.
Agent-ID: codex-aa04.
"""
from hashlib import sha256
from fractions import Fraction
from pathlib import Path
import json
import struct
import argparse

import numpy as np

ROOT = Path(__file__).resolve().parents[2]
DATA = ROOT / 'data/q0_quadrature/conditional_source'
OUT = ROOT / 'Grothe/UpperChaos'
SLICE_SHA = '085a77f6693c3fa369d8441989e9058330e959692b64a84f9f4616d98fb9f9c5'
OFFSET_SHA = '8bf1649d9620449873e32a8fa120709f29888885e8e43ae024c5305b95101c5c'
SELECTION_SHA = '2e60b2f6ed08495047f67709a7589ad8962d2abc73062a6e3c819c8888d147a0'
ROWS_PER_MODULE = 30


def contiguous_ranges(values):
    result = []
    for value in values:
        if result and value == result[-1][1] + 1:
            result[-1][1] = value
        else:
            result.append([value, value])
    return result


def selected_ordinals():
    """Replay this certificate's profile-screen panel selection exactly."""
    raw = (DATA / 'exception-selection.json').read_bytes()
    if sha256(raw).hexdigest() != SELECTION_SHA:
        raise ValueError('exception selection input hash mismatch')
    selection = json.loads(raw)
    if selection['schema'] != 1 or selection['precision_bits'] != 128:
        raise ValueError('unexpected profile-screen representation')
    scale = 1 << selection['precision_bits']
    coeffs = selection['screen_coefficients']
    if len(coeffs) != 12 or any(lo > hi for lo, hi in coeffs):
        raise ValueError('invalid profile coefficient intervals')
    rules = {int(order): [(Fraction(lo), Fraction(hi)) for lo, hi in nodes]
             for order, nodes in selection['rule_nodes'].items()}
    selected, unresolved, selected_panels = [], [], []
    cursor = 0
    for pi, (lo_text, hi_text, order) in enumerate(selection['panels']):
        lo, hi = Fraction(lo_text), Fraction(hi_text)
        nodes = rules[order]
        if lo >= hi or len(nodes) != order:
            raise ValueError(f'invalid source panel {pi}')
        hit = False
        for ri, (lower, upper) in enumerate(nodes):
            if not -1 <= lower < upper <= 1:
                raise ValueError(f'invalid source node at panel {pi}, rule {ri}')
            left = (lo + (hi - lo) * (1 + lower) / 2) * scale
            right = (lo + (hi - lo) * (1 + upper) / 2) * scale
            x = (left.numerator // left.denominator,
                 -((-right.numerator) // right.denominator))
            value = coeffs[-1]
            for a, b in reversed(coeffs[:-1]):
                products = [v * y for v in value for y in x]
                value = (min(products) // scale + a,
                         -((-max(products)) // scale) + b)
            if value[0] <= 0 <= value[1]:
                hit = True
                unresolved.append(cursor + ri)
        if hit:
            selected_panels.append(pi)
            selected.extend(range(cursor, cursor + order))
        cursor += order
    expected = selection['expected']
    if cursor != selection['node_count'] or len(selection['panels']) != selection['panel_count']:
        raise ValueError('source node/panel count mismatch')
    for values, range_key, count_key in [
        (unresolved, 'unresolved_ordinal_ranges', 'unresolved_node_count'),
        (selected_panels, 'selected_panel_ranges', 'selected_panel_count'),
        (selected, 'selected_ordinal_ranges', 'selected_node_count'),
    ]:
        if contiguous_ranges(values) != expected[range_key] or len(values) != expected[count_key]:
            raise ValueError(f'profile-screen selection mismatch: {range_key}')
    return selected


def read_rows():
    """Return ordered (ordinal, sourceStart, cutoff, binary64_words) tuples."""
    raw = (DATA / 'exception-centers.bin').read_bytes()
    metadata = json.loads((DATA / 'exception-centers.json').read_text())
    offset_raw = (DATA / 'conditional_offsets.npy').read_bytes()
    if sha256(raw).hexdigest() != SLICE_SHA or metadata['slice_sha256'] != SLICE_SHA:
        raise ValueError('exception slice hash mismatch')
    if sha256(offset_raw).hexdigest() != OFFSET_SHA:
        raise ValueError('source offsets hash mismatch')
    offsets = np.load(DATA / 'conditional_offsets.npy', allow_pickle=False)
    if offsets.shape != (21578,) or offsets.dtype.str != '<i8':
        raise ValueError('unexpected offset representation')
    words = struct.unpack('<' + 'Q' * (len(raw) // 8), raw)
    ledger_raw = (DATA / 'exception-ledger.jsonl').read_bytes()
    if sha256(ledger_raw).hexdigest() != '08d55747fbe0ab60b613226e64fcebeb97e7db1712ee319f6b88d01faec52f66':
        raise ValueError('exception ledger hash mismatch')
    ledger = {r['index']: r for r in map(json.loads, ledger_raw.splitlines())}
    ordinals = selected_ordinals()
    if sorted(ledger) != ordinals:
        raise ValueError('ledger does not match profile-screen selection')
    rows = []
    cursor = 0
    for ordinal in ordinals:
        count = int(offsets[ordinal + 1] - offsets[ordinal])
        if count not in (3, 5):
            raise ValueError(f'unexpected retained count at ordinal {ordinal}')
        entries = words[cursor:cursor + count]
        if len(entries) != count:
            raise ValueError('truncated exception data')
        for word in entries:
            exp = (word >> 52) & 2047
            if not 1 <= exp <= 1023 or (word & ((1 << 63) - 1)) > (1023 << 52):
                raise ValueError(f'center outside proposed cap at ordinal {ordinal}')
        norm_sq = sum((Fraction((1 << 52) + (word % (1 << 52)),
                               1 << (1075 - ((word >> 52) & 2047))) ** 2
                       for word in entries), Fraction(0))
        if norm_sq > Fraction(121, 100):
            raise ValueError(f'center row norm exceeds 11/10 at ordinal {ordinal}')
        record = ledger[ordinal]
        if record['cutoff'] not in (1, 2) or count != 2 * record['cutoff'] + 1:
            raise ValueError('source cutoff mismatch')
        if record['sha256'] != sha256(struct.pack('<' + 'Q' * count, *entries)).hexdigest():
            raise ValueError('source record hash mismatch')
        rows.append((ordinal, int(offsets[ordinal]), record['cutoff'], entries))
        cursor += count
    if len(rows) != 417 or cursor != 1263:
        raise ValueError('unexpected row or record count')
    return rows


def generate():
    rows = read_rows()
    files = {}
    names = []
    parts = []
    for row in rows:
        if not parts or len(parts[-1]) == ROWS_PER_MODULE or row[0] != parts[-1][-1][0] + 1:
            parts.append([])
        parts[-1].append(row)
    for chunk, part in enumerate(parts):
        name = f'Q0SourceExceptionCentersChunk{chunk:02}'
        names.append(name)
        lines = ['import Grothe.UpperChaos.Q0SourceExceptionCenters']
        lines += ['',
            '/-! Generated source IEEE64 exception slice rows.',
            'Generated by tools/q0_quadrature/gen_source_exception_centers.py.',
            'Agent-ID: codex-aa04. -/',
            f'namespace Grothe.UpperChaos.{name}', '',
            'open Grothe.UpperChaos.Q0SourceExceptionCenters', '',
            'set_option maxRecDepth 65536', 'set_option maxHeartbeats 0', '',
            'def rows : List Row := [',
        ]
        for i, (ordinal, source_start, cutoff, entries) in enumerate(part):
            suffix = ',' if i + 1 < len(part) else ''
            lines.append(f'  ⟨{ordinal}, {source_start}, {cutoff}, [{", ".join(map(str, entries))}]⟩{suffix}')
        lines += [']', '',
            'theorem all_valid : rows.all validRow = true := by decide +kernel', '',
            f'theorem ordinals : rows.map Row.ordinal = List.range\' {part[0][0]} {len(part)} := by',
            '  decide +kernel', '',
            'theorem each_scalar (r : Row) (hr : r ∈ rows) (i : Fin r.words.length) :',
            '    |((center r i : ℚ) : ℝ)| ≤ 11 / 10 :=',
            '  center_abs_le_eleven_tenths r ((List.all_eq_true.mp all_valid) r hr) i', '',
            'theorem each_norm (r : Row) (hr : r ∈ rows) : normSq r ≤ 121 / 100 :=',
            '  validRow_normSq r ((List.all_eq_true.mp all_valid) r hr)', '',
            f'end Grothe.UpperChaos.{name}', '']
        files[name + '.lean'] = '\n'.join(lines).encode()
    lines = [f'import Grothe.UpperChaos.{name}' for name in names]
    lines += ['', '/-! Exact exceptional-row support. Generated; Agent-ID: codex-aa04. -/',
        'namespace Grothe.UpperChaos.Q0SourceExceptionCentersAll', '',
        'open Grothe.UpperChaos.Q0SourceExceptionCenters', '',
        'set_option maxRecDepth 65536', 'set_option maxHeartbeats 0', '',
        'def rows : List Row := ' + ' ++ '.join(name + '.rows' for name in names), '',
        'theorem all_valid : rows.all validRow = true := by',
        '  simp only [rows, List.all_append, ' + ', '.join(name + '.all_valid' for name in names) + ', Bool.and_true]', '',
        'theorem row_count : rows.length = 417 := by decide +kernel', '',
        'theorem cutoff_counts :',
        '    (rows.filter (fun r => r.cutoff == 1)).length = 411 ∧',
        '    (rows.filter (fun r => r.cutoff == 2)).length = 6 := by decide +kernel', '',
        'theorem ordinals : rows.map Row.ordinal =',
        "    List.range' 3872 165 ++ List.range' 10910 128 ++ List.range' 17321 124 := by",
        '  decide +kernel', '',
        'theorem each_length_le_five (r : Row) (hr : r ∈ rows) : r.words.length ≤ 5 :=',
        '  validRow_length_le_five r ((List.all_eq_true.mp all_valid) r hr)', '',
        'theorem each_scalar (r : Row) (hr : r ∈ rows) (i : Fin r.words.length) :',
        '    ‖(center r i : ℂ)‖ ≤ (11 / 10 : ℝ) :=',
        '  center_norm_le_eleven_tenths r ((List.all_eq_true.mp all_valid) r hr) i', '',
        'end Grothe.UpperChaos.Q0SourceExceptionCentersAll', '']
    files['Q0SourceExceptionCentersAll.lean'] = '\n'.join(lines).encode()
    return files


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true',
                        help='verify existing generated files byte for byte')
    args = parser.parse_args()
    files = generate()
    for name, data in files.items():
        if args.check:
            if (OUT / name).read_bytes() != data:
                raise ValueError(f'generated file differs: {name}')
        else:
            (OUT / name).write_bytes(data)
    print(f'{len(files)} generated modules, {sum(map(len, files.values()))} bytes')
