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


def rational(q):
    return str(q.numerator) if q.denominator == 1 else f'{q.numerator} / {q.denominator}'


def matching_tree(lines, row_index, n, entries):
    """Balanced exact legacy-split assembly, never full-row toList reduction.

    Each <=24-character entry has its own numeric/separator proof. Boolean
    byte-list certificates bind every internal literal to both children, with
    a generic soundness proof; generic legacy split/sum transport combines the
    opaque child facts. Kernel Bool reflection avoids the recursively compared
    long-string Eq.refl terms produced by the cbv append simproc.
    """
    serial = 0

    def build(first, last):
        nonlocal serial
        name = f'body{row_index:03d}_{serial:03d}'
        serial += 1
        text = ';'.join(entries[first:last])
        if last == first + 1:
            ns, aa, ks = entries[first].split(',')
            value = Fraction(int(aa), 2 ** int(ks)) if int(ns) == n else Fraction()
            q = rational(value)
            lines.extend([
                f'private def {name} : String := {json.dumps(text)}',
                f'private theorem {name}_separators :',
                f"    ':' ∉ {name}.toList ∧ ';' ∉ {name}.toList := by decide +kernel",
                f'private theorem {name}_certificate :',
                f'    entryValue? {n} {name}.toList = some ({q} : ℚ) := by cbv',
                f'private theorem {name}_noColon : \':\' ∉ {name}.toList :=',
                f'  {name}_separators.1',
                f'private theorem {name}_value : bodyValue {n} {name} = ({q} : ℚ) :=',
                f'  bodyValue_single {name} {n} _ {name}_separators.2 {name}_certificate',
                '',
            ])
            return name, value
        middle = (first + last) // 2
        left, lv = build(first, middle)
        right, rv = build(middle, last)
        value = lv + rv
        q = rational(value)
        lines.extend([
            f'private def {name} : String := {json.dumps(text)}',
            f'private theorem {name}_join : {name} = {left} ++ ";" ++ {right} := by',
            '  apply sameBytes_sound; decide +kernel',
            f'private theorem {name}_noColon : \':\' ∉ {name}.toList := by',
            f'  rw [{name}_join]',
            f'  exact noColon_join {left} {right} {left}_noColon {right}_noColon',
            f'private theorem {name}_value : bodyValue {n} {name} = ({q} : ℚ) := by',
            f'  norm_num only [{name}_join, bodyValue_join, {left}_value, {right}_value]',
            '',
        ])
        return name, value

    return build(0, len(entries))


def certificates(rows, values):
    """Inspect short nonmatching headers; assemble all matching entries.

    No source row or duplicate entry is omitted. The literal-list equality is
    proved by rfl against actual energyStrs, not assumed by this generator.
    Byte-list Boolean reflection never reifies a complete row as List Char.
    Every source/numeric proof uses ordinary compiler limits and strict guards.
    """
    lines = []
    names = []
    row_facts = {key: [] for key in values}
    row_totals = {key: [] for key in values}
    for i, row in enumerate(rows):
        name = f'source{i:03d}'
        names.append(name)
        header = row.split(':', 1)[0]
        mi = int(header)
        chars = char_list(header)
        remainder = row.split(':', 1)[1]
        prefix = json.dumps(header + ':')
        lines += [f'private def {name} : String := {json.dumps(row)}',
                  f'private theorem prefix{i:03d} : {name}.startsWith {prefix} = true := by',
                  f'  have hs : {name} = {prefix} ++ {json.dumps(remainder)} := by',
                  '    apply sameBytes_sound; decide +kernel',
                  f'  exact Eq.mpr (congrArg (fun s : String => s.startsWith {prefix} = true) hs)',
                  '    (startsWith_append _ _)', '']
        for (n, m), value in values.items():
            fact = f'row{i:03d}_{n}_{m}'
            row_facts[n, m].append(fact)
            if mi == m:
                entries = row.split(':')
                if len(entries) != 2:
                    raise ValueError('matching energy row is malformed')
                root, total = matching_tree(lines, i, n, entries[1].split(';'))
                expected = Fraction(value.replace(' ', ''))
                if total != expected:
                    raise ValueError('actual matching row differs from target')
                row_totals[n, m].append(total)
                lines += [f'private theorem {fact} :',
                          f'    rowValue {n} {m} (GrotheKernel.parseRow {name}) = ({value} : ℚ) := by',
                          f'  have hs : {name} = {json.dumps(header)} ++ ":" ++ {root} := by',
                          '    apply sameBytes_sound; decide +kernel',
                          f'  rw [rowValue_of_body {name} {json.dumps(header)} {root} {n} {m} hs',
                          f'    (by cbv) (by decide +kernel) {root}_noColon]',
                          f'  exact {root}_value', '']
            else:
                row_totals[n, m].append(Fraction())
                lines += [f'private theorem {fact} :',
                          f'    rowValue {n} {m} (GrotheKernel.parseRow {name}) = 0 := by',
                          f'  exact rowValue_zero_of_prefix {name} {n} {m} {mi} {chars}',
                          f'    prefix{i:03d} (by decide +kernel) (by decide +kernel) (by decide +kernel)', '']
    block_names = []
    block_facts = {key: [] for key in values}
    for offset in range(0, len(names), 16):
        block = f'sourceBlock{offset // 16:03d}'
        block_names.append(block)
        lines += [f'private def {block} : List String :=',
                  '    [' + ', '.join(names[offset:offset + 16]) + ']', '']
        for n, m in values:
            fact = f'{block}_{n}_{m}'
            block_facts[n, m].append(fact)
            q = rational(sum(row_totals[n, m][offset:offset + 16], Fraction()))
            lines += [f'private theorem {fact} :',
                      f'    tabVal ({block}.map GrotheKernel.parseRow) ({n}, {m}) = ({q} : ℚ) := by',
                      '  rw [tabVal_rows, List.map_map]',
                      '  change ([' + ', '.join(f'rowValue {n} {m} (GrotheKernel.parseRow {name})'
                                              for name in names[offset:offset + 16]) + '] : List ℚ).sum = _',
                      '  simp only [List.sum_cons, List.sum_nil,']
            for start in range(offset, min(offset + 16, len(names)), 4):
                lines.append('    ' + ', '.join(row_facts[n, m][start:min(start + 4, offset + 16)]) + ',')
            totals = row_totals[n, m][offset:offset + 16]
            leading_zero = any(v == 0 and any(w != 0 for w in totals[j + 1:])
                               for j, v in enumerate(totals))
            lines += ['    add_zero' + (', zero_add' if leading_zero else '') + ']', '']
    assembly = '[]'
    for block in reversed(block_names):
        assembly = f'{block} ++ ({assembly})'
    lines += ['private theorem source_rows : energyStrs =', f'    {assembly} := by rfl']
    tables = []
    for (n, m), value in values.items():
        headline = 'one_zero' if (n, m) == (1, 0) else 'zero_one'
        tables += [f'theorem {headline} : energyTable ({n}, {m}) = ({value} : ℚ) := by',
                   f'  change tabVal (energyStrs.map GrotheKernel.parseRow) ({n}, {m}) = _',
                   '  rw [source_rows]',
                   '  simp only [List.map_append, List.map_nil, tabVal_append, tabVal_nil,']
        for start in range(0, len(block_facts[n, m]), 4):
            tables.append('    ' + ', '.join(block_facts[n, m][start:start + 4]) + ',')
        tables += ['    add_zero]', '']
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
