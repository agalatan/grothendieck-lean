#!/usr/bin/env python3
"""Independent exact mirror of the two Haagerup checks affected by zero trimming.

This is a Python arithmetic/operation-count cross-check, not a Lean proof or
native runtime benchmark. Original coefficients come from the pinned Git tree;
no other checkout is read. Unchanged interval kernels are verified byte-for-byte.
"""
from fractions import Fraction
from hashlib import sha256
import json
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[3]
BASE = '4e9f32d78a198da551239bbfa9e56e713d765cae'
CERT = 'data/haagerup-resolvent/certificate.json'
KERNELS = ['GrotheKernel/Basic.lean', 'GrotheKernel/PowerTail.lean',
           'GrotheKernel/ResolventTail.lean']

def git_blob(path):
    return subprocess.run(['git', 'show', f'{BASE}:{path}'], cwd=ROOT,
                          check=True, capture_output=True).stdout

original_bytes = git_blob(CERT)
original = json.loads(original_bytes)
current = json.loads((ROOT / CERT).read_text())
source_hashes = {}
for path in KERNELS:
    source = git_blob(path)
    assert (ROOT / path).read_bytes() == source, f'Kernel changed: {path}'
    source_hashes[path] = sha256(source).hexdigest()
assert {k: v for k, v in current.items() if k != 'R'} == {
    k: v for k, v in original.items() if k != 'R'}, 'Unrelated certificate change'
before = list(map(Fraction, original['R']))
after = before.copy()
while after and after[-1] == 0:
    after.pop()
assert len(before) == 129 and len(after) == 65
assert before == after + [Fraction(0)] * 64
assert list(map(Fraction, current['R'])) == after

D = 2 ** 128
ZERO = (0, 0)
counts = {}

def of_rat(q):
    q = Fraction(q) * D
    return q.numerator // q.denominator, -((-q.numerator) // q.denominator)

def add(a, b):
    counts['interval_additions'] = counts.get('interval_additions', 0) + 1
    return a[0] + b[0], a[1] + b[1]

def neg(a):
    return -a[1], -a[0]

def mul(a, b):
    counts['interval_multiplications'] = counts.get('interval_multiplications', 0) + 1
    products = [x * y for x in a for y in b]
    return min(products) // D, -((-max(products)) // D)

def add_list(a, b):
    return [add(x, y) for x, y in zip(a, b)] + a[len(b):] + b[len(a):]

def conv(a, b):
    # Reverse iteration implements exactly the right-recursive Basic.convI.
    # A zero coefficient only prepends ZERO; no interval products are evaluated.
    acc = []
    for x in reversed(a):
        counts['conv_first_argument_branches'] = counts.get('conv_first_argument_branches', 0) + 1
        acc = [ZERO] + acc
        if x != ZERO:
            acc = add_list([mul(x, y) for y in b], acc)
    return acc

def abs_sum(xs):
    return sum(max(-lo, hi, 0) for lo, hi in xs)

p = list(map(of_rat, original['P']))
defect_factor = add_list([of_rat(1)], [neg(x) for x in [ZERO] + conv(p, p)])
seed_factor = [of_rat(1)]
for _ in range(original['seed_power']):
    seed_factor = conv(p, seed_factor)

metrics = {}
for name, factor, cap_key in [('defect', defect_factor, 'defect_cap'),
                               ('seed', seed_factor, 'seed_cap')]:
    outputs = []
    metrics[name] = {}
    for label, r in [('before', before), ('after', after)]:
        counts = {}
        out = conv(list(map(of_rat, r)), factor)
        if name == 'defect':
            out = add_list([of_rat(1)], [neg(x) for x in out])
        assert all(lo <= hi for lo, hi in out)
        total = abs_sum(out)
        threshold = of_rat(original[cap_key])[0]
        assert total <= threshold
        outputs.append(out)
        metrics[name][label] = {
            'inverse_list_length': len(r), 'interval_output_length': len(out),
            'abs_sum_scaled': str(total), 'cap_scaled_floor': str(threshold),
            'check_accepted': total <= threshold, 'operations': dict(counts),
        }
    a, b = outputs
    length = max(len(a), len(b))
    equal = a + [ZERO] * (length - len(a)) == b + [ZERO] * (length - len(b))
    assert equal
    assert abs_sum(a) == abs_sum(b)
    metrics[name]['zero_padded_interval_pairs_identical'] = equal
    metrics[name]['abs_sum_identical'] = True

print(json.dumps({
    'kind': 'independent_exact_integer_mirror_not_native_runtime_benchmark',
    'original_commit': BASE,
    'original_certificate_sha256': sha256(original_bytes).hexdigest(),
    'kernel_sources_unchanged_from_original': source_hashes,
    'current_certificate_R_length': len(current['R']),
    'other_certificate_fields_unchanged': True,
    'coefficient_functions_equal_after_zero_extension': True,
    'zero_suffix_removed': 64,
    'scale_bits': 128,
    'operation_count_scope': 'R convolution plus final defect subtraction; excludes unchanged P powers, rational conversion, list allocation and absSum',
    'metrics': metrics,
}, indent=2))
