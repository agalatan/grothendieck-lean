# tools/check_lower_refinement_controls.py
"""Reject materially corrupted certificate inputs; standard library only."""
import json
from fractions import Fraction as Q
from lower_refinement import DATA, new_certificates, strings, batches, original_batch_count, poly, node, weights
from verify_lower_refinement import new_node_check, check_tree, check_leaf
import copy

def expect_rejection(name, fn):
    try:
        fn()
    except (AssertionError, ValueError, ZeroDivisionError):
        print('PASS rejected:', name, flush=True)
        return
    raise RuntimeError('Corruption accepted: ' + name)

def leaves(t):
    return [t['leaf']] if 'leaf' in t else sum([leaves(c) for c in t['children']], [])
if __name__ == '__main__':
    if not __debug__:
        raise RuntimeError('Run without -O')
    cert = json.loads((DATA / 'cover.json').read_text())
    c = copy.deepcopy(new_certificates[0][1])
    c['P'][0] = str(Q(c['P'][0]) - 1000)
    c['witness']['P'] = c['P']
    expect_rejection('false whole-half-line majorant', lambda: new_node_check(c))
    c = copy.deepcopy(new_certificates[0][1])
    c['witness']['lam'] = '0'
    expect_rejection('nonpositive spectral parameter', lambda: new_node_check(c))
    rec = next((r for r in cert['records'] if 'children' in r['tree']))
    bad = copy.deepcopy(rec['tree'])
    bad['children'].pop()
    dom = poly(strings[rec['parent']].split('|')[1])
    expect_rejection('missing coverage child', lambda: check_tree(bad, dom))
    ls = sum([leaves(r['tree']) for r in cert['records']], [])
    lf = copy.deepcopy(next((l for l in ls if l['kind'] == 'multi')))
    dom = tuple(map(Q, lf['bounds']))
    lf['upper'] = str(Q(lf['upper']) - 1)
    expect_rejection('understated box bound', lambda: check_leaf(lf, dom))
    lf = copy.deepcopy(next((l for l in ls if l['kind'] == 'multi')))
    dom = tuple(map(Q, lf['bounds']))
    lf['components'][0][1] = str(Q(lf['components'][0][1]) + Q(1, 10))
    expect_rejection('mixture weights with wrong total', lambda: check_leaf(lf, dom))
    for k, (p, c) in enumerate(new_certificates):
        if 'sixth_joint' in c['witness']:
            bt = batches[original_batch_count + k]
            xc = Q(c['witness']['sixth_joint']['xmax'])
            expect_rejection('joint node used beyond its x range', lambda: node(f'b,{original_batch_count + k},0', bt['i'], bt['j'], bt['w'], xc + Q(1, 100)))
            break
    expect_rejection('negative source-mixture weight', lambda: weights(0, 1, Q(-1, 10)))
    expect_rejection('negative node index', lambda: node('z,-1', 0, 0, Q(0), Q(0)))
    print('All eight negative controls passed.', flush=True)
