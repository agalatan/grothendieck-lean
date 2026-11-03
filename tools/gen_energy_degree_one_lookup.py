#!/usr/bin/env python3
"""Render the two actual degree-one energyTable targets. Agent-ID: codex-7c2e.

Only the target literals come from JSON. The Lean statements consume the
unchanged energyRows/parseRow/parseEntry/tabVal definitions, and retain every
row and matching entry. No decoder, source bytes or numerical allowance changes.
"""
import argparse
from fractions import Fraction
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'data/upper-preprocess/certificate.json'
OUTPUT = ROOT / 'Grothe/Upper/EnergyDegreeOneLookup.lean'
TEMPLATE = (ROOT / 'tools/templates/energy_degree_one_lookup.lean.in').read_text()


def char_list(text):
    if not text.isdecimal():
        raise ValueError('energy row header is not decimal')
    return '[' + ', '.join(repr(c) for c in text) + ']'


def actual_rows():
    data = (ROOT / 'Grothe/Upper/Data.lean').read_text()
    source = data.split('def energyStrs : List String := [', 1)[1].split(
        'def energyRows', 1)[0]
    return [json.loads(s) for s in re.findall(r'"(?:[^"\\]|\\.)*"', source)]


def certificates(rows, values):
    """Inspect only short nonmatching headers; certify both whole matching rows.

    No source row or duplicate entry is omitted. The literal-list equality is
    proved by rfl against actual energyStrs, not assumed by this generator.
    Only the two relevant rows require full structural decoding; their cbv
    proof terms are kernel-checked, with the ordinary compiler limits.
    """
    lines = []
    names = []
    row_facts = {key: [] for key in values}
    for i, row in enumerate(rows):
        name = f'source{i:03d}'
        names.append(name)
        header = row.split(':', 1)[0]
        mi = int(header)
        chars = char_list(header)
        lines += [f'private def {name} : String := {json.dumps(row)}',
                  f'private theorem prefix{i:03d} : {name}.startsWith '
                  f'{json.dumps(header + ":")} = true := by cbv', '']
        for (n, m), value in values.items():
            fact = f'row{i:03d}_{n}_{m}'
            row_facts[n, m].append(fact)
            if mi == m:
                # This is a proof against the original source, not a selected
                # entry lookup: rowValue? preserves every duplicate contribution.
                entries = row.split(':')
                if len(entries) != 2:
                    raise ValueError('matching energy row is malformed')
                total = sum((Fraction(int(a), 2 ** int(k))
                             for ns, a, k in (s.split(',') for s in entries[1].split(';'))
                             if int(ns) == n), Fraction())
                expected = Fraction(value.replace(' ', ''))
                if total != expected:
                    raise ValueError('actual matching row differs from target')
                lines += [f'private theorem certificate{i:03d}_{n}_{m} :',
                          f'    rowValue? {n} {m} {name}.toList = some ({value} : ℚ) := by',
                          '  cbv',
                          f'private theorem {fact} :',
                          f'    rowValue {n} {m} (GrotheKernel.parseRow {name}) = ({value} : ℚ) :=',
                          f'  rowValue_correct {name} {n} {m} _ certificate{i:03d}_{n}_{m}', '']
            else:
                lines += [f'private theorem {fact} :',
                          f'    rowValue {n} {m} (GrotheKernel.parseRow {name}) = 0 := by',
                          f'  exact rowValue_zero_of_prefix {name} {n} {m} {mi} {chars}',
                          f'    prefix{i:03d} (by decide +kernel) (by decide +kernel) (by decide +kernel)', '']
    lines += ['private theorem source_rows : energyStrs =',
              '    [' + ', '.join(names) + '] := by rfl']
    tables = []
    for (n, m), value in values.items():
        headline = 'one_zero' if (n, m) == (1, 0) else 'zero_one'
        tables += [f'theorem {headline} : energyTable ({n}, {m}) = ({value} : ℚ) := by',
                   f'  change tabVal (energyStrs.map GrotheKernel.parseRow) ({n}, {m}) = _',
                   '  rw [source_rows, tabVal_rows]',
                   '  simp only [List.map_map, Function.comp_def, List.map_cons, List.map_nil,',
                   '    List.sum_cons, List.sum_nil,']
        for start in range(0, len(row_facts[n, m]), 6):
            tables.append('    ' + ', '.join(row_facts[n, m][start:start + 6]) + ',')
        tables += ['    add_zero, zero_add]', '']
    return '\n'.join(lines), '\n'.join(tables)


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
    # Dict insertion order is fixed explicitly, independent of JSON ordering.
    values = {key: values[key] for key in [(1, 0), (0, 1)]}
    row_proofs, table_proofs = certificates(actual_rows(), values)
    return TEMPLATE.replace('@ROW_CERTIFICATES@', row_proofs).replace(
        '@TABLE_CERTIFICATES@', table_proofs)


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
