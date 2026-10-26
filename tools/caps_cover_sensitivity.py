#!/usr/bin/env python3
"""Read-only exact sensitivity of the CURRENT refined cover to centre cap increases.

This is a research replay, not Lean verification. Never edits caps, padding, generated
modules, source tables or cover inputs. Per-node arithmetic is accepted only when
the fixed vertex chords, affected row majorants, retained mixed-table domination
and extra law-node majorants replay. Failed proof replay is inconclusive, not a
numerical disproof. Optional chord propagation changes only an in-memory copy.

Input: {"format":"caps-centre-increments/v1", "increments":[
  {"k":14,"i":200,"increase":"1614413203/623720731237510320"}]}
The increases are additional node caps, above the existing capPad, with one
nonnegative exact rational per node. No float input is admitted.
"""
import argparse
import ast
import copy
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import re
import subprocess
import sys

sys.dont_write_bytecode = True
sys.path.insert(0, str(Path(__file__).resolve().parent))
import rankone_law as L
from needle_unshifted_lean import ExportCampaign
from needle_mixed_nodes import FORMAT as MIXED_FORMAT, source_weights

ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / 'data/lower-unshifted'
OLD_PAD = Q(1, 10**11)
CHORD_DATA = ROOT / 'Grothe/LowerAnalytic/CapChordData.lean'


def exact(value):
    if type(value) not in (str, int):
        raise ValueError('Expected an exact rational string or integer')
    return Q(value)


def qdict(value):
    value = Q(value)
    return {'exact': str(value), 'decimal': format(float(value), '.16g')}


def endpoint(maximum, denominator=10**12):
    """Round B upwards, then L strictly below 1/B, as needle_fused_global.py."""
    maximum = Q(maximum)
    if maximum <= 0 or denominator <= 0:
        raise ValueError('Positive bound and denominator required')
    bound = Q(-((-maximum.numerator * denominator) // maximum.denominator), denominator)
    reciprocal = 1 / bound
    lower = Q(reciprocal.numerator * denominator // reciprocal.denominator, denominator)
    if lower * bound == 1:
        lower -= Q(1, denominator)
    assert lower * bound < 1 and maximum <= bound
    return bound, lower


def increments(document, nodes):
    if document.get('format') != 'caps-centre-increments/v1':
        raise ValueError('Unsupported increments format')
    valid = {(n['k'], n['i']) for n in nodes}
    result = {}
    for row in document['increments']:
        k, i = row['k'], row['i']
        if type(k) is not int or type(i) is not int or k not in range(12, 16):
            raise ValueError('Only centre nodes of rows 12–15 are supported')
        if (k, i) not in valid or (k, i) in result:
            raise ValueError('Unknown or duplicate centre node')
        amount = exact(row['increase'])
        if amount < 0:
            raise ValueError('Negative cap increase')
        result[k, i] = amount
    return result


def table_source(row):
    return L.source_from_table(row['table'], row['smax'], exact(row['delta']))


def lower_hull_chords(nodes):
    """Pure copy of gen_cap_chords.chords; importing that generator would write files."""
    hull = []
    for i, (radius, cap) in enumerate(nodes):
        while len(hull) >= 2:
            a, b = hull[-2:]
            if ((nodes[b][1]-nodes[a][1])*(radius-nodes[a][0])
                    >= (cap-nodes[a][1])*(nodes[b][0]-nodes[a][0])):
                hull.pop()
            else:
                break
        hull.append(i)
    return [(m, a, b) for a, b in zip(hull, hull[1:]) for m in range(a+1, b)]


def parse_chord_data(text):
    """Read only the bounded numeric list literal, never execute Lean or generator code."""
    if len(text.encode()) > 1024*1024:
        raise ValueError('Chord data exceeds the research parser bound')
    declarations = list(re.finditer(r'^def capChords[^\n]*:=\s*(\[)', text, re.M))
    if len(declarations) != 1:
        raise ValueError('Expected one capChords numeric list declaration')
    start = declarations[0].start(1)
    depth, end = 0, None
    for i in range(start, len(text)):
        if text[i] == '[':
            depth += 1
            if depth > 2:
                raise ValueError('Unexpected chord-list nesting')
        elif text[i] == ']':
            depth -= 1
            if depth == 0:
                end = i+1
                break
    literal = text[start:end] if end is not None else ''
    if not literal or not re.fullmatch(r'[\s\d,\[\]()]+' , literal):
        raise ValueError('Chord data is not a closed numeric list literal')
    try:
        rows = ast.literal_eval(literal)
    except (ValueError, SyntaxError, RecursionError) as error:
        raise ValueError('Malformed chord data literal') from error
    if not isinstance(rows, list) or len(rows) > 1000:
        raise ValueError('Invalid chord row list')
    if any(not isinstance(row, list) for row in rows) or sum(map(len, rows)) > 100000:
        raise ValueError('Invalid or excessive chord entries')
    for row in rows:
        for triple in row:
            if (not isinstance(triple, tuple) or len(triple) != 3
                    or any(type(i) is not int or i < 0 for i in triple)):
                raise ValueError('Chord entries must be triples of natural indices')
    return rows


def validate_fixed_chords(rows, chords, *, bind_generated=False):
    """Check every baseline chordNodeOK condition and optionally exact generator binding."""
    if len(chords) != len(rows):
        raise ValueError('Chord row count does not match source rows')
    for k, (row, edges) in enumerate(zip(rows, chords)):
        nodes = [tuple(map(Q, pair)) for pair in row['table']]
        if (not nodes or any(len(pair) != 2 for pair in nodes)
                or any(a[0] >= b[0] for a, b in zip(nodes, nodes[1:]))):
            raise ValueError(f'Row {k}: unordered or malformed source nodes')
        if not isinstance(edges, list):
            raise ValueError('Chord rows must be lists')
        for triple in edges:
            if (not isinstance(triple, tuple) or len(triple) != 3
                    or any(type(i) is not int or not 0 <= i < len(nodes) for i in triple)):
                raise ValueError(f'Row {k}: invalid chord indices')
        middles = {m for m, _, _ in edges}
        for m, a, b in edges:
            if a in middles or b in middles:
                raise ValueError(f'Row {k}: a chord endpoint is not a vertex')
            ra, ca = nodes[a]; rm, cm = nodes[m]; rb, cb = nodes[b]
            if not 0 <= ra < rm < rb:
                raise ValueError(f'Row {k}: invalid chord radii')
            if ca+(cb-ca)/(rb-ra)*(rm-ra) > cm:
                raise ValueError(f'Row {k}: baseline chord cap check fails')
        if bind_generated and edges != lower_hull_chords(nodes):
            raise ValueError(f'Row {k}: chord data differs from the exact lower-hull generator')


def load_verified_chords(rows, path=CHORD_DATA):
    chords = parse_chord_data(Path(path).read_text())
    validate_fixed_chords(rows, chords, bind_generated=True)
    return chords


def encoded_changes(changes):
    return [{'k': k, 'i': i, 'increase': str(amount)}
            for (k, i), amount in sorted(changes.items())]


def chord_audit(rows, changes, chords, *, propagate=False):
    """Audit the fixed vertex-to-interior proof edges, optionally propagate minimal caps.

    All endpoints are vertices, so their requested increments are final before
    visiting any interior node. One exact pass therefore suffices, including
    taking the maximum if a middle node has more than one proof edge.
    """
    validate_fixed_chords(rows, chords)
    for (k, i), amount in changes.items():
        if (type(k) is not int or type(i) is not int or not 0 <= k < len(rows)
                or not 0 <= i < len(rows[k]['table']) or amount < 0):
            raise ValueError('Invalid source-node increment')
    requirements, edges = {}, []
    for k, (row, triples) in enumerate(zip(rows, chords)):
        nodes = [tuple(map(Q, pair)) for pair in row['table']]
        for m, a, b in triples:
            ra, ca = nodes[a]; rm, cm = nodes[m]; rb, cb = nodes[b]
            t = (rm-ra)/(rb-ra)
            chord = ((1-t)*(ca+changes.get((k, a), Q(0)))
                     + t*(cb+changes.get((k, b), Q(0))))
            need = max(Q(0), chord-cm)
            requirements[k, m] = max(requirements.get((k, m), Q(0)), need)
            edges.append((k, m, a, b, t, chord, need))
    expanded = dict(changes)
    plan = {key: need for key, need in requirements.items() if need > changes.get(key, Q(0))}
    if propagate:
        for key, need in plan.items():
            expanded[key] = need
    def shortfalls(applied):
        return [{'k': k, 'i': m, 'endpoints': [a, b], 'right_weight': str(t),
                 'new_chord': str(chord), 'required_total_increment': str(need),
                 'provided_increment': str(applied.get((k, m), Q(0))),
                 'shortfall': str(need-applied.get((k, m), Q(0)))}
                for k, m, a, b, t, chord, need in edges if need > applied.get((k, m), Q(0))]
    before, after = shortfalls(changes), shortfalls(expanded)
    assert max(expanded.values(), default=Q(0)) <= max(changes.values(), default=Q(0))
    report = {'status': 'PASS_EXACT_CHORDS' if not after else 'FAILED_EXACT_CHORDS',
              'baseline_chords_checked': sum(map(len, chords)),
              'requested_shortfalls': before, 'remaining_shortfalls': after,
              'minimal_interior_increment_plan': encoded_changes(plan),
              'propagation_requested': propagate,
              'propagated_interior_increments': encoded_changes(plan) if propagate else [],
              'scope': 'Fixed current chord mapping; endpoints are non-chord vertices. '
                       'No table or chord data is edited. A changed lower-hull regeneration '
                       'would require its own vertex-obligation audit.'}
    return report, expanded


def mixed_table_failures(rows, batches):
    failures = []
    sources = [table_source(r) for r in rows]
    for bi, batch in enumerate(batches):
        i, j, theta = batch['i'], batch['j'], Q(batch['theta'])
        for ni, item in enumerate(batch['nodes'].split(';')):
            scale, cap = map(Q, item.split(':'))
            required = ((1-theta)*L.value(sources[i].at(scale), scale)
                        + theta*L.value(sources[j].at(scale), scale))
            if required > cap:
                failures.append({'batch': bi, 'node': ni, 'rows': [i, j],
                                 'shortfall': qdict(required-cap)})
    return failures


def check_majorant(source, tau, poly, rv=None, cuts=None):
    try:
        return {'status': 'PASS_EXACT_MAJORANT',
                'proof': L.verify_node(source, tau, poly, rv, cuts)}
    except (ValueError, AssertionError) as error:
        return {'status': 'FAILED_EXACT_PROOF_REPLAY', 'reason': str(error)}


def per_node_audit(rows, changes, docs, batches, chords=None, *, propagate_chords=False):
    """Only source-dependent proof inputs change; other checks remain identical.

    Fixed vertex chords must remain valid, or their interior caps must receive
    the explicitly requested minimal in-memory propagation. Row rectangle and
    Stein majorants use those changed raw caps. Retained mixed
    batch tables and their witnesses remain fixed: if domination passes, their
    checkSWit/checkNode inputs are identical. Extra law batches are regenerated
    conceptually from the changed source tables with unchanged P/cuts/budgets;
    all their majorants must replay. No changed certificate is emitted.
    """
    if chords is None:
        if propagate_chords:
            raise ValueError('Cannot propagate without verified chord data')
        chord_result = {'status': 'NOT_CHECKED', 'scope': 'Chord dependencies were not supplied'}
        applied_changes = dict(changes)
    else:
        chord_result, applied_changes = chord_audit(rows, changes, chords, propagate=propagate_chords)
    altered = copy.deepcopy(rows)
    for (k, i), amount in applied_changes.items():
        altered[k]['table'][i][1] = str(Q(altered[k]['table'][i][1])+amount)
    affected = {k for (k, _), amount in applied_changes.items() if amount}
    failures, checked = [], {'rectangles': 0, 'row_nodes': 0, 'law_nodes': 0}
    for k in sorted(affected):
        row = altered[k]
        source = L.source_from_table(row['table'], row['smax'])
        for ci, cell in enumerate(row['cells']):
            for ni, rect in enumerate(cell['rects']):
                checked['rectangles'] += 1
                proof = check_majorant(source, 1, list(map(Q, rect['P'])))
                if not proof['status'].startswith('PASS'):
                    failures.append(dict(kind='row_rectangle', row=k, cell=ci, node=ni, **proof))
            for ni, node in enumerate(cell['nodes']):
                checked['row_nodes'] += 1
                rv, cuts = L.stein_pieces(row, cell, node)
                proof = check_majorant(source, Q(node['tau']), list(map(Q, node['P'])), rv, cuts)
                if not proof['status'].startswith('PASS'):
                    failures.append(dict(kind='row_node', row=k, cell=ci, node=ni, **proof))
    dominance = mixed_table_failures(altered, batches)
    for name, doc in docs.items():
        if doc['format'] == MIXED_FORMAT:
            weights = source_weights(doc['witness'])
            if not affected.intersection(k for k, _ in weights):
                continue
            node = doc['witness']
            source = L.mixture_source([(w, table_source(altered[k])) for k, w in weights])
            L.verify_tensor_budget(node)
            rv, cuts = L.spectral_pieces(node)
        else:
            k = doc['row_index']
            if k not in affected:
                continue
            row = altered[k]
            source = table_source(row)
            ci, ni = doc['cut_ref']
            rv, cuts = L.stein_pieces(row, row['cells'][ci], row['cells'][ci]['nodes'][ni])
            node = doc
        checked['law_nodes'] += 1
        proof = check_majorant(source, Q(node['tau']), list(map(Q, node['P'])), rv, cuts)
        if not proof['status'].startswith('PASS'):
            failures.append(dict(kind='extra_law_node', name=name, **proof))
    return {'status': ('PASS_EXACT_SOURCE_DEPENDENCIES'
                       if not failures and not dominance and chord_result['status'] == 'PASS_EXACT_CHORDS'
                       else 'SOURCE_REPLAY_INCOMPLETE_OR_FAILED'),
            'chord_audit': chord_result,
            'applied_changes': encoded_changes(applied_changes),
            'checked': checked, 'mixed_table_shortfalls': dominance,
            'majorant_failures': failures,
            'scope': 'Unchanged row-level cap constants, polynomial P, banks/cuts and retained mixed tables. '
                     'Extra law tables follow changed raw caps. Exact research proof; Lean still required.'}


def cap_weight(campaign, box):
    if 'cap_choice' in box:
        i, j, theta = box['cap_choice']
    elif 'choice' not in box:
        kind, _, *fields = campaign.inh['boxes'][box['original']].split('|')
        if kind != 'c':
            return Q(1)
        i, j, theta = fields[0].split(',')
    else:
        return Q(1)
    theta = Q(theta)
    return (1-theta)*int(int(i) != 0)+theta*int(int(j) != 0)


def bind_row(canonical, row):
    """The replay must use exactly the row constructor consumed by Lean."""
    header = [row[k] for k in ['ell', 'beta', 'delta', 'kappa', 'smax', 'cap']]
    assert list(map(Q, canonical['header'])) == list(map(Q, header))
    assert list(map(Q, canonical['even_matrix'])) == list(map(Q, row['E']))
    assert list(map(Q, canonical['coupling'])) == list(map(Q, row['b']))
    assert [tuple(map(Q, item.split(':'))) for item in canonical['nodes'].split(';')] == \
           [tuple(map(Q, item)) for item in row['table']]
    assert list(map(Q, filter(None, canonical['mesh'].split(',')))) == list(map(Q, row['mesh'][1:]))
    assert len(canonical['cells']) == len(row['cells'])
    for encoded, cell in zip(canonical['cells'], row['cells']):
        xlo, xhi, rects, bank, nodes = encoded.split('|')
        assert [Q(xlo), Q(xhi)] == list(map(Q, cell['x']))
        got_rects = []
        for item in filter(None, rects.split(';')):
            lo, hi, p = item.split(':')
            got_rects.append(([Q(lo), Q(hi)], list(map(Q, p.split(',')))))
        assert got_rects == [(list(map(Q, r['s'])), list(map(Q, r['P']))) for r in cell['rects']]
        assert [[Q(z)/10**7 for z in item.split(',')] for item in filter(None, bank.split(';'))] == \
               [list(map(Q, vector)) for vector in cell['bank']]
        got_nodes = []
        for item in filter(None, nodes.split(';')):
            tau, p, cuts = item.split(':')
            fields = cuts.split(',') if cuts else []
            assert len(fields) % 2 == 0
            got_nodes.append((Q(tau), list(map(Q, p.split(','))),
                              [(Q(fields[j])/10**10, int(fields[j+1])) for j in range(0, len(fields), 2)]))
        expected = [(Q(n['tau']), list(map(Q, n['P'])), [(Q(w), int(i)) for w, i in n['cuts']])
                    for n in cell['nodes']]
        assert got_nodes == expected


def load_current():
    subprocess.run([sys.executable, '-B', str(ROOT/'tools/gen_lower_data.py'), '--check'],
                   cwd=ROOT, check=True, capture_output=True, text=True)
    cover_path, ledger_path = DATA/'cover.json', DATA/'cover-ledger.json'
    cover, ledger = json.loads(cover_path.read_text()), json.loads(ledger_path.read_text())
    assert hashlib.sha256(cover_path.read_bytes()).hexdigest() == ledger['cover_sha256']
    docs = {}
    for name, binding in cover['u_nodes'].items():
        path = (ROOT/binding['path']).resolve(strict=True)
        assert path.is_relative_to(DATA.resolve())
        assert hashlib.sha256(path.read_bytes()).hexdigest() == binding['sha256']
        docs[name] = json.loads(path.read_text())
    campaign = ExportCampaign(DATA/'inputs', cover, docs)
    assert Q(campaign.inh['pad']) == OLD_PAD
    pad_source = (ROOT/'Grothe/Lower/RowDataTypes.lean').read_text()
    pad_match = re.search(r'^def capPad : ℚ := ([^\n]+)$', pad_source, re.M)
    assert pad_match and re.sub(r'\s', '', pad_match.group(1)) == '1/100000000000', \
        'Probe is pinned to the current unchanged 1e-11 capPad'
    # Bind the raw source caps to the canonical constructors that feed Lean.
    for k, row in enumerate(campaign.rows):
        canonical = json.loads((ROOT/f'data/lower-rows/row{k+1:02d}.json').read_text())
        bind_row(canonical, row)
    source_hash = hashlib.sha256((DATA/'inputs/inherited.json').read_bytes()).hexdigest()
    for doc in docs.values():
        assert doc['inherited'] == 'data/lower-unshifted/inputs/inherited.json'
        assert doc['inherited_sha256'] == source_hash
    values = [campaign.box_upper(box) for box in cover['boxes']]
    assert len(values) == ledger['boxes'] == 10762
    assert values == [Q(box['upper']) for box in cover['boxes']]
    assert max(values) == Q(ledger['actual_upper'])
    return campaign, ledger, docs, values


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--increments', type=Path)
    parser.add_argument('--global-pad', type=exact, help='Total padding, not its increment')
    parser.add_argument('--global-margin', type=exact, default=Q(0))
    parser.add_argument('--audit-majorants', action='store_true',
                        help='Replay affected source proofs; otherwise per-node result is CONDITIONAL')
    parser.add_argument('--propagate-chords', action='store_true',
                        help='In memory only, minimally raise interior caps to preserve the fixed vertex chords')
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    if not __debug__:
        raise ValueError('Reject optimized Python: exact assertions required')
    campaign, ledger, docs, values = load_current()
    changes = increments(json.loads(args.increments.read_text()),
                         json.loads((ROOT/'data/caps-m-pieces/pieces.json').read_text())) \
        if args.increments else {}
    chords = load_verified_chords(campaign.rows)
    chord_result, applied_changes = chord_audit(campaign.rows, changes, chords,
                                               propagate=args.propagate_chords)
    assert args.global_margin >= 0
    maximum = max(values)
    old_bound, old_lower = Q(ledger['best_complete_B']), Q(ledger['best_complete_L'])
    total_pad = args.global_pad if args.global_pad is not None else \
        OLD_PAD+max(changes.values(), default=Q(0))+args.global_margin
    if total_pad < OLD_PAD:
        raise ValueError('Padding decrease is outside this probe')
    delta = total_pad-OLD_PAD
    if delta < max(changes.values(), default=Q(0)):
        raise ValueError('Global padding does not cover the proposed node increases')
    shifted = [v+delta*cap_weight(campaign, box) for v, box in zip(values, campaign.cover['boxes'])]
    new_bound, new_lower = endpoint(max(shifted))
    result = {'format': 'caps-cover-sensitivity/v1', 'agent_id': 'codex-15b7',
              'scope': 'Read-only research sensitivity, not a Lean certificate or delivery.',
              'baseline': {'boxes': len(values), 'actual_upper': qdict(maximum),
                           'worst_boxes': [i for i, v in enumerate(values) if v == maximum],
                           'target': qdict(old_bound), 'lower': qdict(old_lower),
                           'margin': qdict(old_bound-maximum)},
              'per_node': {'changes': encoded_changes(changes),
                           'applied_changes': encoded_changes(applied_changes),
                           'chord_audit': chord_result,
                           'status': ('CONDITIONAL_ARITHMETIC_ONLY'
                                      if chord_result['status'] == 'PASS_EXACT_CHORDS'
                                      else 'SOURCE_REPLAY_INCOMPLETE_OR_FAILED'),
                           'unchanged_outer_upper': qdict(maximum),
                           'unchanged_outer_margin': qdict(old_bound-maximum),
                           'warning': 'Unchanged outer arithmetic is valid only if the chord audit and all '
                                      'affected source proofs pass. Propagation, if requested, is in memory only.'},
              'global': {'old_pad': str(OLD_PAD), 'total_pad': str(total_pad), 'increment': str(delta),
                         'actual_upper': qdict(max(shifted)), 'rounded_B': qdict(new_bound),
                         'strict_lower': qdict(new_lower), 'endpoint_loss': qdict(old_lower-new_lower),
                         'old_target_survives': max(shifted) <= old_bound,
                         'old_lower_survives': old_lower*max(shifted) < 1}}
    if args.audit_majorants:
        batches = json.loads((ROOT/'data/lower-mixed/batches.json').read_text())['batches']
        audit = per_node_audit(campaign.rows, changes, docs, batches, chords,
                               propagate_chords=args.propagate_chords)
        result['per_node']['source_audit'] = audit
        result['per_node']['status'] = audit['status']
    pins = [DATA/'cover.json', DATA/'cover-ledger.json', DATA/'inputs/cover.json',
            DATA/'inputs/inherited.json', ROOT/'data/lower-mixed/batches.json',
            ROOT/'Grothe/Lower/RowDataTypes.lean', CHORD_DATA,
            ROOT/'Grothe/LowerAnalytic/CapChords.lean', ROOT/'tools/gen_cap_chords.py']
    pins += [ROOT/f'data/lower-rows/row{k:02d}.json' for k in range(1, 20)]
    pins += [ROOT/f'Grothe/Lower/RowData{k:02d}.lean' for k in range(1, 20)]
    pins += [ROOT/binding['path'] for binding in campaign.cover['u_nodes'].values()]
    pins += [ROOT/'tools'/name for name in ['caps_cover_sensitivity.py', 'rankone_law.py',
                                           'needle_cover_refine.py', 'needle_unshifted_lean.py',
                                           'needle_mixed_nodes.py']]
    if args.increments:
        pins.append(args.increments.resolve())
    result['input_sha256'] = {(str(p.relative_to(ROOT)) if p.is_relative_to(ROOT) else str(p)):
                              hashlib.sha256(p.read_bytes()).hexdigest() for p in pins}
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2)+'\n')
    print(json.dumps({'output': str(args.output), 'per_node_status': result['per_node']['status'],
                      'global_lower': str(new_lower), 'global_endpoint_loss': str(old_lower-new_lower)}))


if __name__ == '__main__':
    main()
