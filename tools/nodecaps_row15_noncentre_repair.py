#!/usr/bin/env python3
"""Pure Row15-only multiplier repair of historically sealed prepared inputs.

Agent-ID: codex-15b7. Call only after reproducing the historical source seal.
This layer checks bytes and replays supplied rational matrices; it does not
recompute those matrices from Lean source. In particular, a historical N with
no source provenance is NOT evidence of current-source feasibility. Native
verification, source provenance and cache success are never attested here.

``derive(binding, files, effective_bytes=...)`` returns canonical effective
piece bytes and a limited receipt. ``files`` is an exact mapping of repository
relative paths to bytes; this module performs no filesystem or process actions.
The active pieces path stays fixed. The historical input survives at an archive
path whose hash must equal the historical provenance's original input hash.
"""
import copy
from fractions import Fraction
import hashlib
import json
from pathlib import PurePosixPath
import re


FORMAT = 'nodecaps-noncentre-repair-binding/v1'
PATCH_FORMAT = 'nodecaps-noncentre-multiplier-patches/v1'
PAD = Fraction(1, 100000000000)


def require(ok, message):
    if not ok:
        raise ValueError(message)


def sha(data):
    return hashlib.sha256(data).hexdigest()


def encoded(value):
    return (json.dumps(value, indent=2, sort_keys=True) + '\n').encode()


def decode(data):
    require(type(data) is bytes, 'bound inputs must be bytes')
    def pairs(items):
        result = {}
        for key, value in items:
            require(key not in result, 'duplicate JSON key: ' + key)
            result[key] = value
        return result
    return json.loads(data, object_pairs_hook=pairs,
                      parse_constant=lambda value: (_ for _ in ()).throw(ValueError('invalid JSON number')))


def rational(value):
    require(type(value) is str and re.fullmatch(r'-?(0|[1-9][0-9]*)(/[1-9][0-9]*)?', value),
            'expected canonical rational string')
    result = Fraction(value)
    require(value in {str(result), f'{result.numerator}/{result.denominator}'},
            'noncanonical rational string')
    return result


def path(value):
    require(type(value) is str and value and '\\' not in value and
            not PurePosixPath(value).is_absolute() and
            all(part not in ('', '.', '..') for part in value.split('/')),
            'unsafe repository-relative path')
    return value


def ref(value):
    require(type(value) is dict and set(value) == {'path', 'sha256'}, 'malformed file reference')
    name = path(value['path']); digest = value['sha256']
    require(type(digest) is str and re.fullmatch('[0-9a-f]{64}', digest), 'malformed SHA256')
    return name, digest


def matrix(value):
    require(type(value) is list and len(value) == 13 and
            all(type(row) is list and len(row) == 13 for row in value), 'expected 13 by 13 matrix')
    result = [[rational(q) for q in row] for row in value]
    require(all(result[i][j] == result[j][i] for i in range(13) for j in range(13)),
            'matrix is not symmetric')
    return result


def ldl_ok(value):
    """Exact nonnegative-pivot test, including the zero-pivot column rule."""
    a = [row[:] for row in value]
    for k in range(len(a)):
        pivot = a[k][k]
        if pivot < 0:
            return False
        if pivot == 0:
            if any(a[i][k] != 0 for i in range(k + 1, len(a))):
                return False
            continue
        for i in range(k + 1, len(a)):
            factor = a[i][k] / pivot
            for j in range(k + 1, len(a)):
                a[i][j] -= factor * a[k][j]
    return True


def replay(witness_bytes, node, piece, j, grid, multipliers):
    """Replay one stored record; matching metadata is NOT source provenance."""
    records = [decode(line) for line in witness_bytes.splitlines() if line.strip()]
    records = [r for r in records if type(r) is dict and
               all(type(r.get(key)) is int for key in ('k', 'i', 'j', 'grid')) and
               (r['k'], r['i'], r['j'], r['grid']) == (node['k'], node['i'], j, grid)]
    require(len(records) == 1, 'missing or duplicate matrix witness identity')
    record = records[0]
    require(record.get('polyOK') is True and record.get('encl') is True,
            'matrix witness polynomial/enclosure flags are not true')
    require(rational(record['capPad']) == PAD and rational(record['cap']) == rational(node['cap'])
            and rational(record['s']) == rational(node['s']), 'matrix witness cap/padding/location differs')
    constraints = record['cons']
    require(type(constraints) is list and len(constraints) == len(piece['cons']),
            'matrix witness constraint count differs')
    result = matrix(record['N'])
    for text, c, (lam, mu) in zip(piece['cons'], constraints, multipliers):
        fields = text.split(',')
        require(len(fields) == 6 and type(c) is dict, 'malformed ordered constraint')
        require(rational(c['lo']) == rational(fields[2]) and
                (c['hi'] is None if fields[3] == '*' else
                 c['hi'] is not None and rational(c['hi']) == rational(fields[3])),
                'matrix witness constraint interval/order differs')
        require([rational(c['lam']), rational(c['mu'])] ==
                [rational(fields[4]), rational(fields[5])], 'matrix witness stored multipliers differ')
        a, b = matrix(c['A']), matrix(c['B'])
        for u in range(13):
            for v in range(13):
                result[u][v] -= lam*a[u][v] + mu*b[u][v]
    require(ldl_ok(result), 'proposed multipliers fail stored exact matrix LDL')


def derive(binding, files, *, effective_bytes=None):
    """Validate and derive only noncentre multiplier replacements.

    Binding references: baseline_archive, historical_provenance, historical_seal,
    centre_plan, selection, patches, effective. The provenance must retain the
    baseline, canonical centre-plan and selection hashes. For rows12/13 it is
    the source seal itself; rows14/15 bind their seals by source_manifest_sha256.
    Additional
    source_sha256 pins bind supplied source/evidence bytes but do not prove that
    any exported matrix was computed from them. Every patch cites one of those
    evidence pins and declares matrix_source_provenance='unverified'.
    """
    keys = {'format', 'row', 'baseline_archive', 'historical_provenance', 'historical_seal',
            'centre_plan', 'selection', 'patches', 'effective', 'source_sha256'}
    require(type(binding) is dict and set(binding) == keys and binding['format'] == FORMAT,
            'unsupported repair binding')
    row = binding['row']
    require(type(row) is int and row == 15, 'unsupported row')
    names = keys - {'format', 'row', 'effective', 'source_sha256'}
    references = {name: ref(binding[name]) for name in names}
    effective_path, effective_hash = ref(binding['effective'])
    require(effective_path == f'data/caps-m/plan/row-certificates/row{row}-pieces.json',
            'active pieces path must stay fixed')
    require(type(binding['source_sha256']) is dict, 'malformed source pins')
    pins = {}
    for name, digest in [*references.values(), *binding['source_sha256'].items()]:
        name, digest = ref({'path': name, 'sha256': digest})
        require(name not in pins or pins[name] == digest, 'conflicting file pins')
        pins[name] = digest
    require(effective_path not in pins and references['baseline_archive'][0] != effective_path,
            'baseline must be separately archived')
    require(type(files) is dict and set(files) == set(pins), 'missing or unbound input bytes')
    for name, digest in pins.items():
        require(type(files[name]) is bytes and sha(files[name]) == digest, 'bound file hash differs: ' + name)
    values = {name: decode(files[item[0]]) for name, item in references.items()}
    baseline = values['baseline_archive']; plan = values['centre_plan']; selection = values['selection']
    provenance = values['historical_provenance']; seal = values['historical_seal']
    require(type(provenance) is dict and type(seal) is dict and
            type(provenance.get('inputs_sha256')) is dict, 'malformed historical provenance')
    historical_inputs = provenance['inputs_sha256']
    require(historical_inputs.get(effective_path) ==
            references['baseline_archive'][1], 'archive does not match historical input seal')
    canonical = f'data/caps-m/plan/row-certificates/row{row}'
    require(historical_inputs.get(canonical + '.json') == references['centre_plan'][1],
            'centre plan does not match historical input seal')
    require(historical_inputs.get(canonical + '-selection.json') == references['selection'][1],
            'selection does not match historical input seal')
    require((references['historical_provenance'][1] == references['historical_seal'][1]) if row in (12, 13)
            else provenance.get('source_manifest_sha256') == references['historical_seal'][1],
            'historical source seal is not linked to provenance')
    require(type(seal.get('files_sha256')) is dict and seal['files_sha256'], 'missing historical source seal')
    require(type(baseline) is list and baseline and all(type(n) is dict and n.get('k') == row and
            type(n.get('k')) is int and type(n.get('i')) is int and type(n.get('pieces')) is list
            for n in baseline), 'invalid baseline nodes')
    nodes = {n['i']: n for n in baseline}
    require(len(nodes) == len(baseline), 'duplicate baseline node')
    require(type(plan) is dict and type(plan.get('row')) is int and plan['row'] == row and
            plan.get('row_complete_research_gate') is True and rational(plan['capPad']) == PAD and
            rational(plan['cap_up']) == 0, 'invalid historical centre plan')
    centres = {}
    for c in plan['centres']:
        require(type(c) is dict and type(c.get('key')) is str and
                re.fullmatch(r'15:(0|[1-9][0-9]*):(0|[1-9][0-9]*)', c['key']),
                'malformed planned centre')
        k, i, j = map(int, c['key'].split(':'))
        require(k == row and i in nodes and i not in centres and 0 <= j < len(nodes[i]['pieces']) and
                type(c.get('original_piece_index')) is int and c['original_piece_index'] == j and
                type(c.get('output_piece_index')) is int and c['output_piece_index'] == j,
                'invalid or duplicate planned centre index')
        centres[i] = j
    require(set(centres) == set(nodes), 'centre census differs')
    require(type(selection) is dict and set(selection) == {f'{row}:{i}' for i in nodes},
            'selection node census differs')
    for i, node in nodes.items():
        grids = selection[f'{row}:{i}']['grids']
        require(type(grids) is list and len(grids) == len(node['pieces']) and
                all(type(g) is int and g in range(5) for g in grids), 'invalid selected grids')
    patches = values['patches']
    require(type(patches) is dict and set(patches) == {'format', 'row', 'baseline_sha256',
            'selection_sha256', 'centre_plan_sha256', 'capPad', 'cap_up', 'repairs'} and
            patches['format'] == PATCH_FORMAT and type(patches['row']) is int and patches['row'] == row,
            'unsupported patch manifest')
    require(patches['baseline_sha256'] == references['baseline_archive'][1] and
            patches['selection_sha256'] == references['selection'][1] and
            patches['centre_plan_sha256'] == references['centre_plan'][1], 'patch baseline/plan/selection differs')
    require(rational(patches['capPad']) == PAD and rational(patches['cap_up']) == 0,
            'repairs cannot change cap/padding')
    require(type(patches['repairs']) is list and patches['repairs'], 'empty repair manifest')
    effective = copy.deepcopy(baseline); updated = {n['i']: n for n in effective}; seen = set()
    for patch in patches['repairs']:
        require(type(patch) is dict and set(patch) == {'key', 'grid', 'baseline_piece_sha256',
                'node_context_sha256', 'multipliers', 'evidence', 'matrix_source_provenance'},
                'unsupported repair fields')
        require(type(patch['key']) is str and
                re.fullmatch(r'15:(0|[1-9][0-9]*):(0|[1-9][0-9]*)', patch['key']), 'invalid repair key')
        k, i, j = map(int, patch['key'].split(':'))
        require(k == row and i in nodes and 0 <= j < len(nodes[i]['pieces']) and patch['key'] not in seen,
                'unknown or duplicate repair')
        require(j != centres[i], 'planned centre cannot be repaired by this layer')
        require((row, i) != (14, 150), 'retained node14x150 cannot be changed')
        node = nodes[i]; piece = node['pieces'][j]; seen.add(patch['key'])
        require(type(patch['grid']) is int and patch['grid'] == selection[f'{row}:{i}']['grids'][j],
                'repair changes grid')
        require(patch['baseline_piece_sha256'] == sha(encoded(piece)) and
                patch['node_context_sha256'] == sha(encoded({n: v for n, v in node.items() if n != 'pieces'})),
                'repair piece/recipe/constraint/node context differs')
        require(patch['matrix_source_provenance'] == 'unverified',
                'this layer cannot attest matrix source provenance')
        evidence, digest = ref(patch['evidence'])
        require(binding['source_sha256'].get(evidence) == digest, 'unbound matrix witness')
        multipliers = patch['multipliers']
        require(type(multipliers) is list and len(multipliers) == len(piece['cons']) and
                all(type(pair) is list and len(pair) == 2 for pair in multipliers), 'ordered multiplier count differs')
        multipliers = [[rational(q) for q in pair] for pair in multipliers]
        constraints = []; changed = False
        for text, pair in zip(piece['cons'], multipliers):
            require(type(text) is str, 'invalid baseline constraint')
            fields = text.split(',')
            require(len(fields) == 6 and all(q >= 0 for q in pair) and
                    (fields[3] != '*' or pair[0] == 0), 'negative or illegal halfspace multiplier')
            changed |= pair != [rational(fields[4]), rational(fields[5])]
            constraints.append(','.join(fields[:4] + [str(q) for q in pair]))
        require(changed, 'repair must change at least one multiplier value')
        replay(files[evidence], node, piece, j, patch['grid'], multipliers)
        updated[i]['pieces'][j]['cons'] = constraints
    result = encoded(effective)
    require(sha(result) == effective_hash, 'effective pieces hash differs')
    if effective_bytes is not None:
        require(type(effective_bytes) is bytes and result == effective_bytes, 'effective pieces bytes differ')
    return result, {'format': 'nodecaps-noncentre-repair-receipt/v1', 'row': row,
                    'repaired_keys': sorted(seen), 'effective_sha256': sha(result),
                    'stored_matrix_ldl_replayed': True, 'source_provenance_verified': False,
                    'current_source_feasibility_verified': False, 'native_verified': False,
                    'cache_uploaded': False,
                    'limitation': 'Historical matrices lack source provenance; hash integrity and stored LDL replay do not establish current-source feasibility.'}
