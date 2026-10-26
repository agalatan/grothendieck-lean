#!/usr/bin/env python3
"""Replay direct original-source spectral law nodes, including row mixtures.

Each certificate contains its complete witness. Its historical fusion or LP
records are provenance only: acceptance reconstructs the original row source,
checks the exact Gram/Young budget and proves the majorant on the whole half
line. No shifted source or new Gaussian cap is admitted. Ordinary Gram nodes
have the checker's full x range 31/4; a joint budget uses its stated x cap.
"""
import argparse
import copy
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import sys

sys.dont_write_bytecode = True
sys.path.insert(0, str(Path(__file__).resolve().parent))
import rankone_law as L

ROOT = Path(__file__).resolve().parents[1]
SOURCE = 'data/lower-unshifted/inputs/inherited.json'
FORMAT = 'needle-unshifted-mixed-spectral/v1'
XMAX = Q(31, 4)


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def rational(value):
    assert type(value) in (str, int), 'Expected an exact rational string or integer'
    return Q(value)


def local_file(path, root=ROOT):
    """Resolve an existing clone-local input without external fallbacks."""
    root = Path(root).resolve(strict=True)
    path = Path(path)
    assert '..' not in path.parts, 'Input contains parent traversal'
    local = (root / path).resolve(strict=True)
    assert local.is_relative_to(root) and local.is_file(), 'Input is outside this clone'
    return local


def source_descriptor(row):
    return {key: row[key] for key in ('delta', 'smax', 'table')}


def descriptor_hash(row):
    payload = json.dumps(source_descriptor(row), sort_keys=True, separators=(',', ':'))
    return hashlib.sha256(payload.encode()).hexdigest()


def source_weights(witness):
    """Canonical nonzero row weights, including pure/degenerate mixtures."""
    i, j = witness['i'], witness['j']
    assert type(i) is int and type(j) is int and i >= 0 and j >= 0, 'Invalid row index'
    theta = rational(witness['theta'])
    assert 0 <= theta <= 1, 'Invalid source mixture weight'
    weights = {}
    for row, weight in ((i, 1-theta), (j, theta)):
        weights[row] = weights.get(row, Q(0)) + weight
    return tuple((row, weight) for row, weight in sorted(weights.items()) if weight)


def declared_weights(values):
    assert isinstance(values, list) and values, 'Missing source weights'
    weights = {}
    for pair in values:
        assert len(pair) == 2 and type(pair[0]) is int and pair[0] >= 0, 'Invalid source row'
        weight = rational(pair[1])
        assert weight >= 0, 'Negative source weight'
        weights[pair[0]] = weights.get(pair[0], Q(0)) + weight
    assert sum(weights.values()) == 1, 'Source weights do not sum to one'
    return tuple((row, weight) for row, weight in sorted(weights.items()) if weight)


def batch_key(document):
    """Canonical potential and exact radial mesh shared by one JBatch."""
    witness = document['witness']
    weights = source_weights(witness)
    if len(weights) == 1:
        i, j, theta = weights[0][0], weights[0][0], Q(0)
    else:
        (i, _), (j, theta) = weights
    return i, j, theta, tuple(map(rational, witness['rv']))


def xcap(document):
    witness = document['witness']
    return rational(witness['sixth_joint']['xmax']) if 'sixth_joint' in witness else XMAX


def source(document, rows):
    return L.mixture_source([
        (weight, L.source_from_table(rows[row]['table'], rows[row]['smax'],
                                    rational(rows[row]['delta'])))
        for row, weight in source_weights(document['witness'])])


def verify_document(document, root=ROOT):
    if not __debug__:
        raise ValueError('Reject -O/-OO: exact assertions required')
    assert document['format'] == FORMAT, 'Unsupported law-node format'
    assert document['inherited'] == SOURCE, 'Only the canonical original source is admitted'
    inherited = local_file(document['inherited'], root)
    source_digest = sha(inherited)
    assert source_digest == document['inherited_sha256'], 'Original source hash mismatch'
    rows = json.loads(inherited.read_text())['rows']
    witness = document['witness']
    weights = source_weights(witness)
    assert all(0 <= witness[k] < len(rows) for k in ('i', 'j')), 'Source row is out of range'
    assert declared_weights(document['source_weights']) == weights, 'Source potential mismatch'
    assert document['source_tables_sha256'] == {
        str(row): descriptor_hash(rows[row]) for row in sorted({witness['i'], witness['j']})
    }, 'Original row-table hash mismatch'
    for row, _ in weights:
        table = [(rational(a), rational(b)) for a, b in rows[row]['table']]
        assert rational(rows[row]['delta']) > 0 and rational(rows[row]['smax']) >= 0
        assert len(table) >= 2 and table[0][0] == 0
        assert all(a[0] < b[0] for a, b in zip(table, table[1:])), 'Unordered source table'
    assert 'tensor_budget' in witness, 'A checked Gram budget is required'
    assert rational(witness.get('nu', '0')) == 0, 'Gram/joint budget requires nu=0'
    assert witness.get('eta') is None and not witness.get('extra_budgets'), 'Unsupported spectral options'
    for key in ('lam', 'mu', 't', 'beta'):
        rational(witness[key])
    assert rational(witness['lam']) > 0 and rational(witness['mu']) > 0
    for key in ('A', 'B', 'alpha', 'beta'):
        rational(witness['tensor_budget'][key])
    for key in ('M0', 'M1'):
        assert len(witness['tensor_budget'][key]) == 3, 'A Gram matrix must have three entries'
        list(map(rational, witness['tensor_budget'][key]))
    if 'sixth_joint' in witness:
        joint = witness['sixth_joint']
        assert joint.get('kind', 'triangle') in ('triangle', 'young'), 'Unsupported joint budget'
        for key in ('alpha', 'xmax', 'weight'):
            rational(joint[key])
    assert xcap(document) > 0 and list(map(rational, document['x_interval'])) == [0, xcap(document)], \
        'Law-node x range does not match the checker budget'
    p = list(map(rational, witness['P']))
    assert len(p) == 5 and p[1] >= 0 and p[4] >= 0, 'Invalid moment polynomial'
    tau = rational(witness['tau'])
    assert tau > 0, 'Law scale must be positive'
    rv = list(map(rational, witness['rv']))
    phi = list(map(rational, witness['phi']))
    assert len(rv) >= 2 and len(phi)+1 == len(rv), 'Wrong spectral mesh dimensions'
    assert rv[0] == 0 and all(a < b for a, b in zip(rv, rv[1:])), 'Invalid radial mesh'
    L.verify_tensor_budget(witness)
    checked_rv, cuts = L.spectral_pieces(witness)
    assert checked_rv == rv
    proof = L.verify_node(source(document, rows), tau, p, rv, cuts, depth=9)
    assert proof == document['proof'], 'Saved whole-half-line proof does not match'
    assert sha(inherited) == source_digest, 'Original source changed during verification'
    return dict(status='PASS_EXACT_ORIGINAL_SOURCE_SPECTRAL_NODE',
                source_weights=[[row, str(weight)] for row, weight in weights],
                tau=str(tau), xcap=str(xcap(document)), **proof)


def verify_mixed(path, root=ROOT):
    path = local_file(path, root)
    digest = sha(path)
    document = json.loads(path.read_text())
    result = verify_document(document, root)
    assert sha(path) == digest, 'Law node changed during verification'
    return document, dict(result, input_sha256=digest)


def negative_controls(document, root=ROOT):
    """Reject distinct changes to source identity, budget and global majorant."""
    def change(field, value):
        d = copy.deepcopy(document)
        obj = d
        for key in field[:-1]:
            obj = obj[key]
        obj[field[-1]] = value
        return d
    cases = {
        'source_hash': change(['inherited_sha256'], '0'*64),
        'source_path': change(['inherited'], '../outside/inherited.json'),
        'table_hash': change(['source_tables_sha256'], {}),
        'source_weight': change(['source_weights'], [[document['witness']['i'], '2']]),
        'negative_gram_diagonal': change(['witness', 'tensor_budget', 'M0', 0], '-1'),
        'nonzero_nu': change(['witness', 'nu'], '1'),
        'x_range': change(['x_interval'], ['0', str(xcap(document)+1)]),
        'wrong_majorant': change(['witness', 'P', 0], str(rational(document['witness']['P'][0])-10**6)),
    }
    rejected = []
    for name, modified in cases.items():
        try:
            verify_document(modified, root)
        except (AssertionError, ValueError, KeyError, IndexError, TypeError):
            rejected.append(name)
        else:
            raise AssertionError('Negative control was accepted: '+name)
    return rejected


def main():
    if not __debug__:
        raise SystemExit('Reject -O/-OO: exact checks required')
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--verify', type=Path, required=True)
    p.add_argument('--negative-controls', action='store_true')
    a = p.parse_args()
    document, result = verify_mixed(a.verify)
    if a.negative_controls:
        result['negative_controls_rejected'] = negative_controls(document)
    print(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()
