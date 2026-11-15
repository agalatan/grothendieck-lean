#!/usr/bin/env python3
"""Reprice the complete lower cover with its existing certified law-node bank.

NumPy/SciPy propose convex-hull chords and finite-mixture weights. The existing
Fraction checker accepts every candidate and replays the entire final partition.
No Gaussian source, law witness, epsilon, or analytic hypothesis changes.

Example (single-threaded proposal search):
  OPENBLAS_NUM_THREADS=1 python3 -B tools/refine_lower_existing_bank.py \
    --target 713418/1000000 --output handoff/lower-cover.json
The output is a candidate for the existing Lean cover exporter, not a Lean proof.
The existing law bank must already be verified; run verify_lower_refinement.py
for the independent replay of all law witnesses, source pins, and final cover.
Agent-ID: codex-a7c4. Refs #421.
"""
from __future__ import annotations

import argparse
import copy
from fractions import Fraction as Q
import json
from pathlib import Path
import time

import numpy as np
from scipy.optimize import minimize, minimize_scalar

import lower_refinement as R
from verify_lower_refinement import certificate_check, original_coverage, source_check


def unpack(recipe):
    if recipe['kind'] == 'multi':
        return None, [(int(k), Q(w), s) for k, w, s in recipe['components']]
    kind, _, *rest = recipe['box'].split('|')
    if kind == 'c':
        return tuple(R.poly(rest[0])), []
    if kind == 'b':
        return None, [(0, Q(1), rest[0])]
    weight = Q(rest[0])
    return None, [(0, 1 - weight, rest[1]), (1, weight, rest[2])]


def prepared(components, bounds):
    result = []
    for _, _, source in components:
        row, left, right = R.component(source, bounds[5])
        result.append((row, R.chord(left, right, bounds[2]),
                       R.chord(left, right, bounds[3])))
    return result


def exact_mixture(components, values, weights, bounds):
    assert weights and min(weights) >= 0 and sum(weights) == 1
    row, left, right = [tuple(sum(w * datum[k][j] for w, datum in zip(weights, values))
                             for j in range(len(values[0][k]))) for k in range(3)]
    value = R.value(bounds, row, left, right)
    recipe = dict(kind='multi', bounds=list(map(str, bounds)), upper=str(value),
                  components=[[c[0], str(w), c[2]] for c, w in zip(components, weights) if w])
    return value, recipe


def exact_cap(bounds, i, j, weight):
    value = R.capvalue(bounds, (Q(i), Q(j), weight))
    recipe = dict(kind='cap', box='c|' + ','.join(map(str, bounds)) + '|' +
                  ','.join(map(str, (i, j, weight))), upper=str(value))
    return value, recipe


def optimize_cap(cap, bounds):
    i, j, old = cap
    i, j = int(i), int(j)
    a, b = np.array(R.env[i], float), np.array(R.env[j], float)
    lo, hi = map(float, bounds[:2])

    def proposal_value(weight):
        ell, _, value = (1 - weight) * a + weight * b
        value -= 2 * weight * (1 - weight) * (a[1] - b[1]) ** 2 / float(R.EPS)
        return max(value - 2 * ell * lo + lo ** 2, value - 2 * ell * hi + hi ** 2)

    result = minimize_scalar(proposal_value, bounds=(0, 1), method='bounded',
                             options=dict(xatol=1e-13))
    candidates = [old, Q(0), Q(1), Q(round(float(result.x) * 10**11), 10**11)]
    return min((exact_cap(bounds, i, j, w) for w in candidates), key=lambda item: item[0])


class Bank:
    def __init__(self):
        self.groups = {}
        for i, row in enumerate(R.rows):
            group = self.group(i, i, Q(0))
            group['nodes'].append((f'z,{i}', *row['zero'], Q(31, 4)))
            for cell, nodes in enumerate(row['cells']):
                for node, (tau, polynomial) in enumerate(nodes):
                    group['nodes'].append((f's,{i},{cell},{node}', tau, polynomial, Q(31, 4)))
        for batch, row in enumerate(R.batches):
            group = self.group(row['i'], row['j'], row['w'])
            for node, (tau, polynomial, xmax) in enumerate(row['nodes']):
                group['nodes'].append((f'b,{batch},{node}', tau, polynomial, xmax))
        for group in self.groups.values():
            group['nodes'].sort(key=lambda item: item[1])
            group['array'] = np.array([[float(tau), *map(float, p), float(xmax)]
                                      for _, tau, p, xmax in group['nodes']])

    def group(self, i, j, weight):
        key = tuple(sorted(R.weights(i, j, weight).items()))
        if key not in self.groups:
            self.groups[key] = dict(i=i, j=j, w=weight, nodes=[])
        return self.groups[key]

    @staticmethod
    def hull_pair(group, tau, x, xmax):
        array = group['array']
        key = (x, xmax)
        cache = group.setdefault('hulls', {})
        if key in cache:
            for a, b in zip(cache[key], cache[key][1:]):
                if group['nodes'][a][1] <= tau <= group['nodes'][b][1]:
                    return group['nodes'][a][0], group['nodes'][b][0]
            return None
        ys = array[:, 1:6] @ np.array([1, float(R.RHO), 1, 2 + x*x,
                                       6 + 9*x*x + float(R.C6)*x*x*x])
        hull = []
        for index, (current_tau, *_) in enumerate(array):
            # Filter node validity exactly before proposing a floating hull.
            if group['nodes'][index][3] < xmax:
                continue
            y = ys[index]
            if hull and current_tau == array[hull[-1], 0]:
                if y >= ys[hull[-1]]:
                    continue
                hull.pop()
            while len(hull) > 1:
                a, b = hull[-2:]
                if ((ys[b] - ys[a]) * (current_tau - array[b, 0]) >=
                        (y - ys[b]) * (array[b, 0] - array[a, 0])):
                    hull.pop()
                else:
                    break
            hull.append(index)
        cache[key] = hull
        for a, b in zip(hull, hull[1:]):
            if group['nodes'][a][1] <= tau <= group['nodes'][b][1]:
                return group['nodes'][a][0], group['nodes'][b][0]
        return None

    def pool(self, bounds):
        components, seen = [], set()
        for index, group in enumerate(self.groups.values()):
            for x in [float(bounds[4]), float(bounds[5]), float((bounds[4] + bounds[5])/2)]:
                a = self.hull_pair(group, bounds[2], x, bounds[5])
                b = self.hull_pair(group, bounds[3], x, bounds[5])
                if a and b:
                    source = ','.join(map(str, (group['i'], group['j'], group['w'],
                                               bounds[2], bounds[3]))) + ';' + ';'.join(a + b)
                    if source not in seen:
                        components.append((index, Q(0), source))
                        seen.add(source)
        return components

    def optimize(self, recipe, bounds):
        cap, old = unpack(recipe)
        fallback = (optimize_cap(cap, bounds) if cap else
                    exact_mixture(old, prepared(old, bounds), [c[1] for c in old], bounds))
        extras = self.pool(bounds)
        if not extras:
            return fallback
        values = prepared(extras, bounds)
        floating_bounds = list(map(float, bounds))
        scores = [R.value(floating_bounds, *[[float(v) for v in a] for a in datum])
                  for datum in values]
        selected = sorted(range(len(extras)), key=lambda i: scores[i])[:20]
        components = old + [extras[i] for i in selected if extras[i][2] not in [c[2] for c in old]]
        values = prepared(components, bounds)
        arrays = [np.array([datum[k] for datum in values], float) for k in range(3)]
        weights = np.array([float(c[1]) for c in components])
        if not old:
            weights[0] = 1

        def proposal_value(w):
            return float(R.value(floating_bounds, *(w @ array for array in arrays)))

        result = minimize(lambda w: 1e3 * (proposal_value(w) - .7134194), weights,
                          method='SLSQP', bounds=[(0., 1.)] * len(components),
                          constraints=[dict(type='eq', fun=lambda w: sum(w) - 1)],
                          options=dict(ftol=1e-10, maxiter=200))
        weights = np.maximum(result.x, 0)
        if not np.isfinite(weights).all() or weights.sum() <= 0:
            return fallback
        weights /= weights.sum()
        numerators = [max(0, round(w * 10**11)) for w in weights]
        total = sum(numerators)
        if not total:
            return fallback
        rational = [Q(numerator, total) for numerator in numerators]
        candidate = exact_mixture(components, values, rational, bounds)
        return min([candidate, fallback], key=lambda item: item[0])


def flatten_cover(document):
    records = {r['parent']: r for r in document['records']}
    leaves = []

    def flatten(parent, tree, bounds, path=''):
        if 'leaf' in tree:
            leaf = tree['leaf']
            leaves.append(dict(parent=parent, path=path, bounds=tuple(bounds),
                               upper=Q(leaf['upper']), recipe=leaf))
            return
        axis, mid = tree['axis'], Q(tree['mid'])
        left, right = list(bounds), list(bounds)
        left[2 * axis + 1] = mid
        right[2 * axis] = mid
        flatten(parent, tree['children'][0], left, path + '0')
        flatten(parent, tree['children'][1], right, path + '1')

    for parent, source in enumerate(R.strings):
        datum = R.data(source)
        if parent in records:
            flatten(parent, records[parent]['tree'], datum[1])
        else:
            leaves.append(dict(parent=parent, path='', bounds=datum[1], upper=R.evaluate(datum),
                               recipe=dict(kind='cap', box=source)))
    return sorted(leaves, key=lambda leaf: leaf['upper'], reverse=True)


def replace_tree(tree, path, replacement):
    if not path:
        return replacement
    key = int(path[0])
    tree['children'][key] = replace_tree(tree['children'][key], path[1:], replacement)
    return tree


def tree_max(tree):
    if 'leaf' in tree:
        return Q(tree['leaf']['upper'])
    return max(map(tree_max, tree['children']))


def refine(document, target, max_depth):
    bank = Bank()
    leaves = flatten_cover(document)
    records = {r['parent']: r for r in document['records']}
    failures, changed, calls = [], 0, 0
    started = time.time()

    def solve(recipe, bounds, depth=0):
        nonlocal calls
        calls += 1
        value, recipe = bank.optimize(recipe, bounds)
        if value <= target or depth >= max_depth:
            return {'leaf': recipe}, value
        options = []
        for axis in range(3):
            mid = (bounds[2*axis] + bounds[2*axis + 1])/2
            left, right = list(bounds), list(bounds)
            left[2*axis + 1] = mid
            right[2*axis] = mid
            lv, lr = bank.optimize(recipe, left)
            rv, rr = bank.optimize(recipe, right)
            calls += 2
            options.append((max(lv, rv), axis, mid, [(lv, lr, left), (rv, rr, right)]))
            if max(lv, rv) <= target:
                break
        _, axis, mid, pair = min(options, key=lambda item: item[0])
        children, upper = [], Q(0)
        for value, recipe, child_bounds in pair:
            child, child_upper = ({'leaf': recipe}, value) if value <= target else solve(
                recipe, child_bounds, depth + 1)
            children.append(child)
            upper = max(upper, child_upper)
        return dict(axis=axis, mid=str(mid), children=children), upper

    for leaf in leaves:
        if leaf['upper'] <= target:
            continue
        try:
            tree, value = solve(leaf['recipe'], leaf['bounds'])
        except KeyboardInterrupt:
            print('Discovery interrupted; retaining all completed replacements.', flush=True)
            break
        assert value <= leaf['upper'], 'Candidate worsens the saved cover'
        parent = leaf['parent']
        if parent not in records:
            records[parent] = dict(parent=parent, tree=tree)
        else:
            records[parent]['tree'] = replace_tree(records[parent]['tree'], leaf['path'], tree)
        changed += 1
        if value > target:
            failures.append(dict(parent=parent, path=leaf['path'], upper=str(value)))
        if changed % 10 == 0 or value > target:
            print(f'Processed {changed}; missed target {len(failures)}; proposals {calls}; '
                  f'parent {parent}, cap {float(value):.12f}; elapsed {time.time() - started:.1f}s', flush=True)
    for record in records.values():
        record['worst'] = str(tree_max(record['tree']))
    actual = max([Q(r['worst']) for r in records.values()] +
                 [leaf['upper'] for leaf in leaves if leaf['parent'] not in records])
    document['records'] = sorted(records.values(), key=lambda record: record['parent'])
    cap = max(target, Q(-((-actual.numerator * 10**10) // actual.denominator), 10**10))
    document['target'] = str(cap)
    reciprocal = 1 / cap
    document['lower'] = str(Q((reciprocal.numerator * 10**12 - 1) // reciprocal.denominator, 10**12))
    return document, dict(requested_target=str(target), actual=str(actual), changed=changed,
                          failed=failures, proposals=calls, elapsed_seconds=time.time() - started)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--target', required=True, type=Q)
    parser.add_argument('--input', type=Path, default=R.DATA/'cover.json')
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--max-depth', type=int, default=2)
    args = parser.parse_args()
    if args.output.resolve() == args.input.resolve():
        parser.error('Use a separate output file; never overwrite the accepted input')
    if not 0 < args.target or not 0 <= args.max_depth <= 10:
        parser.error('Require a positive target and max-depth between 0 and 10')
    source_check()
    original_coverage()
    original = json.loads(args.input.read_text())
    certificate_check(original)
    document, summary = refine(copy.deepcopy(original), args.target, args.max_depth)
    certificate_check(document)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(document, indent=1) + '\n')
    print(json.dumps(summary, indent=2), flush=True)
    if Q(summary['actual']) > args.target:
        print('Requested target not attained; output still passes the exact whole-cover checker.')


if __name__ == '__main__':
    main()
